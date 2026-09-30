from typing import List

from fastapi import APIRouter, Depends, HTTPException, Request
from fastapi.responses import Response
from sqlalchemy.orm import Session

import models
import schemas
from database import get_db
from utils.settings import _get_settings
from utils.mail_text import statement_mail
from utils.pdf_ledger import _build_ledger_pdf
from utils.activity_log import log_activity
from utils.permissions import require_manage
from utils.email_sender import send_email, EmailNotConfigured, EmailSendFailed

router = APIRouter()

@router.post("/customers", response_model=schemas.CustomerOut)
def create_customer(customer: schemas.CustomerCreate, db: Session = Depends(get_db)):
    db_customer = models.Customer(
        name=customer.name,
        phone=customer.phone,
        credit_limit=customer.credit_limit,
        strn=customer.strn,
        address=customer.address,
        email=customer.email,
        price_tier=customer.price_tier,
    )
    db.add(db_customer)
    db.commit()
    db.refresh(db_customer)
    return db_customer

@router.get("/customers", response_model=List[schemas.CustomerOut])
def list_customers(db: Session = Depends(get_db)):
    return db.query(models.Customer).all()

@router.post("/customers/bulk", response_model=List[schemas.CustomerOut])
def create_customers_bulk(customers: List[schemas.CustomerCreate], db: Session = Depends(get_db)):
    """Bulk-create customers (CSV import). Unlike items, there's no natural
    de-dupe key for a customer — every row becomes a new row, same
    reasoning as expenses.py's create_expenses_bulk."""
    result = []
    for customer in customers:
        db_customer = models.Customer(
            name=customer.name,
            phone=customer.phone,
            credit_limit=customer.credit_limit,
            strn=customer.strn,
            address=customer.address,
            email=customer.email,
            price_tier=customer.price_tier,
        )
        db.add(db_customer)
        result.append(db_customer)
    db.commit()
    for c in result:
        db.refresh(c)
    return result

@router.put("/customers/{customer_id}", response_model=schemas.CustomerOut)
def edit_customer(customer_id: str, customer: schemas.CustomerCreate, db: Session = Depends(get_db)):
    db_customer = db.query(models.Customer).filter(models.Customer.id == customer_id).first()
    if not db_customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    db_customer.name = customer.name
    db_customer.phone = customer.phone
    db_customer.credit_limit = customer.credit_limit
    db_customer.strn = customer.strn
    db_customer.address = customer.address
    db_customer.email = customer.email
    db_customer.price_tier = customer.price_tier
    db.commit()
    db.refresh(db_customer)
    return db_customer

@router.delete("/customers/{customer_id}")
def delete_customer(customer_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db_customer = db.query(models.Customer).filter(models.Customer.id == customer_id).first()
    if not db_customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    customer_name = db_customer.name
    for bill in (
        db.query(models.Bill).filter(models.Bill.customer_id == customer_id).all()
    ):
        if not bill.is_quote:
            sign = -1 if bill.return_of_bill_id else 1
            for li in bill.line_items:
                if li.item_id:
                    catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                    if catalog_item:
                        catalog_item.stock_quantity += sign * li.quantity
        db.query(models.BillItem).filter(models.BillItem.bill_id == bill.id).delete()
    db.query(models.Bill).filter(models.Bill.customer_id == customer_id).delete()
    db.delete(db_customer)
    db.commit()
    log_activity(db, request, "delete_customer", f"{customer_name} deleted")
    return {"status": "deleted"}

@router.post("/customers/{customer_id}/collect-payment", response_model=schemas.CollectPaymentOut)
def collect_payment(customer_id: str, body: schemas.CollectPaymentRequest, db: Session = Depends(get_db)):
    """Record a payment against a customer's outstanding balance, applying it
    to their oldest unpaid bill(s) first — same aging order the Dues Center
    uses — splitting across bills if the amount doesn't match one exactly.
    A bill only reaches payment_status="paid" once fully covered; a partial
    payment leaves it "unpaid" with a reduced balance, which every
    outstanding/aging report already keys off (amount - amount_paid), not
    the status string, so this doesn't need any report-side changes.
    """
    customer = db.query(models.Customer).filter(models.Customer.id == customer_id).first()
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    if body.amount <= 0:
        raise HTTPException(status_code=400, detail="Amount must be greater than zero")

    real_bills = db.query(models.Bill).filter(
        models.Bill.customer_id == customer_id,
        models.Bill.is_quote == False,  # noqa: E712
        models.Bill.is_voided == False,  # noqa: E712
    ).all()

    total_outstanding = sum((b.amount or 0) - (b.amount_paid or 0) for b in real_bills)
    if total_outstanding <= 0:
        raise HTTPException(status_code=400, detail="This customer has no outstanding balance.")

    unpaid_bills = sorted(
        (b for b in real_bills if (b.amount or 0) - (b.amount_paid or 0) > 0),
        key=lambda b: b.date,
    )

    if body.amount > total_outstanding + 0.01:
        raise HTTPException(
            status_code=400,
            detail=f"Amount exceeds the outstanding balance of Rs. {total_outstanding:.2f}.",
        )

    remaining = body.amount
    updated = 0
    for bill in unpaid_bills:
        if remaining <= 0:
            break
        owed = (bill.amount or 0) - (bill.amount_paid or 0)
        applied = min(remaining, owed)
        bill.amount_paid = (bill.amount_paid or 0) + applied
        if bill.amount_paid >= (bill.amount or 0) - 0.01:
            bill.payment_status = "paid"
        remaining -= applied
        updated += 1
    db.commit()

    return {
        "amount_collected": round(body.amount - remaining, 2),
        "bills_updated": updated,
        "remaining_outstanding": max(0.0, round(total_outstanding - (body.amount - remaining), 2)),
    }

@router.get("/customers/{customer_id}/ledger")
def get_customer_ledger(customer_id: str, db: Session = Depends(get_db), language: str | None = None):
    customer = db.query(models.Customer).filter(models.Customer.id == customer_id).first()
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")

    bills = (
        db.query(models.Bill)
        .filter(
            models.Bill.customer_id == customer_id,
            models.Bill.is_quote == False,  # noqa: E712
            models.Bill.is_voided == False,  # noqa: E712
        )
        .order_by(models.Bill.date)
        .all()
    )
    safe_name = (
        "".join(ch if ch.isascii() and ch.isalnum() else "_" for ch in customer.name)[:30]
        or "customer"
    )
    pdf_bytes = bytes(_build_ledger_pdf(customer, bills, _get_settings(db), language))
    return Response(
        content=pdf_bytes,
        media_type="application/pdf",
        headers={"Content-Disposition": f'attachment; filename="ledger_{safe_name}.pdf"'},
    )

@router.post("/customers/{customer_id}/email-ledger")
def email_customer_ledger(customer_id: str, db: Session = Depends(get_db), language: str | None = None):
    """Emails the same statement PDF get_customer_ledger generates, straight
    to the customer's email on file."""
    customer = db.query(models.Customer).filter(models.Customer.id == customer_id).first()
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    if not (customer.email or "").strip():
        raise HTTPException(status_code=400, detail="This customer has no email on file.")

    bills = (
        db.query(models.Bill)
        .filter(
            models.Bill.customer_id == customer_id,
            models.Bill.is_quote == False,  # noqa: E712
            models.Bill.is_voided == False,  # noqa: E712
        )
        .order_by(models.Bill.date)
        .all()
    )
    pdf_bytes = bytes(_build_ledger_pdf(customer, bills, _get_settings(db), language))
    shop_name = _get_settings(db)["shop_name"]
    subject, body = statement_mail(language, customer.name, shop_name)
    try:
        send_email(
            db,
            to_email=customer.email.strip(),
            subject=subject,
            body_text=body,
            attachment_bytes=pdf_bytes,
            attachment_filename=f"statement_{customer.name}.pdf",
        )
    except EmailNotConfigured as exc:
        raise HTTPException(status_code=400, detail=str(exc))
    except EmailSendFailed as exc:
        raise HTTPException(status_code=502, detail=f"Could not send email: {exc}")
    return {"status": "sent", "email": customer.email}
