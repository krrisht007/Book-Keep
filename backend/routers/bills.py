import json
import os
import uuid
from datetime import datetime
from typing import List

from fastapi import APIRouter, Depends, File, HTTPException, Request, UploadFile
from fastapi.responses import Response
from sqlalchemy.orm import Session

import models
import schemas
from config import BILL_SCANS_DIR, ALLOWED_IMAGE_EXT
from database import get_db
from utils.settings import _get_settings
from utils.gst import _resolve_gst_for_line, _get_invoice_no
from utils.mail_text import invoice_mail
from utils.pdf_invoice import _build_invoice_pdf
from utils.activity_log import log_activity, _actor
from utils.permissions import require_manage
from utils.rate_limit import require_ai_rate_limit
from utils.email_sender import send_email, EmailNotConfigured, EmailSendFailed
from utils.uploads import enforce_max_size, save_upload
from utils.balances import customer_outstanding
from utils import ai_bill_scan
from utils.gemini import AiScanNotConfigured, GeminiAPIError

router = APIRouter()

@router.post("/bills/scan", response_model=schemas.BillScanOut)
async def scan_bill(file: UploadFile = File(...), db: Session = Depends(get_db), request: Request = None):
    """Reads a photo of a handwritten bill and returns what it found, for the
    app's review screen — does NOT create a customer or a bill. Saving still
    goes through the normal POST/PUT /bills/v2 (with customer_id resolved by
    the client first, creating one via POST /customers if this suggests no
    match), same commit path as any typed bill."""
    require_ai_rate_limit(request)
    ext = os.path.splitext(file.filename or "")[1].lower()
    if ext not in ALLOWED_IMAGE_EXT:
        ext = ".jpg"
    contents = enforce_max_size(await file.read())

    try:
        extracted = ai_bill_scan.extract_bill(contents, ext)
    except AiScanNotConfigured as exc:
        raise HTTPException(status_code=503, detail=str(exc))
    except ai_bill_scan.NotADocument:
        raise HTTPException(status_code=422, detail="not_a_bill")
    except GeminiAPIError as exc:
        raise HTTPException(status_code=502, detail=f"AI scan failed: {exc}")

    photo_url = save_upload(contents, "bills", uuid.uuid4().hex, ext, BILL_SCANS_DIR, private=True)

    customers = db.query(models.Customer).all()
    items = db.query(models.Item).all()
    customer_match = ai_bill_scan.match_by_name(extracted.get("customer_name", ""), customers)

    line_items = []
    for li in extracted.get("line_items", []):
        matched = ai_bill_scan.match_item(li.get("item_name", ""), items)
        line_items.append(schemas.ScanLineItem(
            item_id=matched["id"] if matched else None,
            item_name=li.get("item_name", ""),
            quantity=li.get("quantity", 0),
            unit_price=li.get("unit_price", 0),
        ))

    parsed_date = None
    if extracted.get("date"):
        try:
            parsed_date = datetime.fromisoformat(extracted["date"])
        except ValueError:
            pass

    return schemas.BillScanOut(
        photo_url=photo_url,
        customer_name=extracted.get("customer_name", ""),
        customer_exact=customer_match["exact"],
        customer_suggestion=customer_match["suggestion"],
        date=parsed_date,
        line_items=line_items,
        notes=extracted.get("notes", ""),
        raw_extraction=json.dumps(extracted),
    )

@router.patch("/bills/{bill_id}", response_model=schemas.BillOutV2)
def update_bill(bill_id: str, update: schemas.BillUpdate, db: Session = Depends(get_db)):
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if db_bill.return_of_bill_id:
        raise HTTPException(status_code=400, detail="Cannot update a return credit note's payment status.")
    if db_bill.is_quote:
        raise HTTPException(status_code=400, detail="Cannot update a quotation's payment status.")
    if db_bill.is_voided:
        raise HTTPException(status_code=400, detail="Cannot update a voided bill's payment status.")

    if update.payment_status is not None:
        db_bill.payment_status = update.payment_status
    if update.amount_paid is not None:
        db_bill.amount_paid = update.amount_paid

    db.commit()
    db.refresh(db_bill)
    return db_bill

@router.delete("/bills/{bill_id}")
def delete_bill(bill_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if not db_bill.is_quote and not db_bill.is_voided:
        sign = -1 if db_bill.return_of_bill_id else 1
        for li in db_bill.line_items:
            if li.item_id:
                catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                if catalog_item:
                    catalog_item.stock_quantity += sign * li.quantity
    amount = db_bill.amount
    db.query(models.BillItem).filter(models.BillItem.bill_id == bill_id).delete()
    db.delete(db_bill)
    db.commit()
    log_activity(db, request, "delete_bill", f"Rs. {amount} bill deleted")
    return {"status": "deleted"}

@router.post("/bills/v2", response_model=schemas.BillOutV2)
def create_bill_v2(bill: schemas.BillCreateV2, db: Session = Depends(get_db), request: Request = None):
    subtotal = sum(li.quantity * li.unit_price for li in bill.line_items)
    discount = max(0.0, min(bill.discount_amount or 0, subtotal))
    total = subtotal - discount
    email, name = _actor(request)

    if not bill.is_quote and not bill.override_credit_limit:
        customer = db.query(models.Customer).filter(models.Customer.id == bill.customer_id).first()
        limit = getattr(customer, "credit_limit", None) if customer else None
        if limit and limit > 0:
            new_outstanding = customer_outstanding(customer) + (total - bill.amount_paid)
            if new_outstanding > limit:
                raise HTTPException(
                    status_code=402,
                    detail=(
                        f"This bill would put {customer.name}'s outstanding balance at "
                        f"{new_outstanding:.2f}, over their credit limit of {limit:.2f}. "
                        "Resubmit with override_credit_limit to bill anyway."
                    ),
                )

    db_bill = models.Bill(
        customer_id=bill.customer_id,
        amount=total,
        date=bill.date,
        items=None,
        payment_status=bill.payment_status,
        payment_method=bill.payment_method,
        amount_paid=bill.amount_paid,
        image_url=bill.image_url,
        is_quote=bill.is_quote,
        discount_amount=discount,
        raw_extraction=bill.raw_extraction,
        created_by_email=email,
        created_by_name=name,
    )
    db.add(db_bill)
    db.commit()
    db.refresh(db_bill)

    defaults = _get_settings(db)
    for li in bill.line_items:
        catalog_item = None
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item and not bill.is_quote:
                catalog_item.stock_quantity -= li.quantity

        hsn, gst = _resolve_gst_for_line(li, catalog_item, defaults)
        cost_snapshot = None
        if not bill.is_quote and catalog_item and catalog_item.cost_price is not None:
            cost_snapshot = li.quantity * catalog_item.cost_price
        db_line = models.BillItem(
            bill_id=db_bill.id,
            item_id=li.item_id,
            item_name=li.item_name,
            quantity=li.quantity,
            unit_price=li.unit_price,
            line_total=li.quantity * li.unit_price,
            hsn_code=hsn,
            gst_rate=gst,
            cost_price=cost_snapshot,
        )
        db.add(db_line)

    db.commit()
    db.refresh(db_bill)
    return db_bill

@router.post("/bills/v2/{bill_id}/convert", response_model=schemas.BillOutV2)
def convert_quote_to_bill(bill_id: str, db: Session = Depends(get_db)):
    """Turn a saved quotation into a real bill: deducts stock now (quotes
    never touched it) and clears the quote flag."""
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if not db_bill.is_quote:
        raise HTTPException(status_code=400, detail="Bill is not a quotation")

    defaults = _get_settings(db)
    for li in db_bill.line_items:
        catalog_item = None
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item:
                catalog_item.stock_quantity -= li.quantity
                if catalog_item.cost_price is not None:
                    li.cost_price = li.quantity * catalog_item.cost_price
        if not li.hsn_code or li.gst_rate is None:
            hsn, gst = _resolve_gst_for_line(li, catalog_item, defaults)
            li.hsn_code = li.hsn_code or hsn
            li.gst_rate = li.gst_rate if li.gst_rate is not None else gst
        db.add(li)

    db_bill.is_quote = False
    db.commit()
    db.refresh(db_bill)
    return db_bill

@router.post("/bills/{bill_id}/return", response_model=schemas.BillOutV2)
def return_bill(bill_id: str, body: schemas.BillReturnRequest | None = None, db: Session = Depends(get_db), request: Request = None):
    """Create a credit-note bill that reverses `bill_id`: restores stock for
    the returned line items and records a negative-amount bill linked back
    to the original, so both stay in the ledger instead of the original just
    disappearing (unlike DELETE /bills/{id}).

    `body.line_items` picks which lines and how much of each come back; omit
    it (or send no body) to return everything at full quantity, matching the
    original whole-bill-only behavior. A bill can only be returned once —
    partial now, more later isn't supported; edit the bill down first if a
    second return is needed.
    """
    require_manage(request)
    original = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not original:
        raise HTTPException(status_code=404, detail="Bill not found")
    if original.return_of_bill_id:
        raise HTTPException(status_code=400, detail="Cannot return a credit note")
    if original.is_quote:
        raise HTTPException(status_code=400, detail="Cannot return a quotation")
    if original.is_voided:
        raise HTTPException(status_code=400, detail="Cannot return a voided bill")
    already = (
        db.query(models.Bill)
        .filter(models.Bill.return_of_bill_id == bill_id)
        .first()
    )
    if already:
        raise HTTPException(status_code=400, detail="This bill has already been returned")

    requested_by_line = None
    if body and body.line_items is not None:
        requested_by_line = {li.bill_item_id: li.quantity for li in body.line_items}

    to_return = []
    for li in original.line_items:
        if requested_by_line is None:
            qty = li.quantity
        else:
            qty = requested_by_line.get(li.id, 0)
            if qty < 0 or qty > li.quantity:
                raise HTTPException(
                    status_code=400,
                    detail=f"Invalid return quantity for {li.item_name}: must be between 0 and {li.quantity:g}",
                )
        if qty > 0:
            to_return.append((li, qty))

    if not to_return:
        raise HTTPException(status_code=400, detail="Nothing selected to return")

    credit_amount = sum(qty * li.unit_price for li, qty in to_return)

    credit = models.Bill(
        customer_id=original.customer_id,
        image_url="return",
        amount=-credit_amount,
        date=datetime.utcnow(),
        payment_status="paid",
        payment_method=original.payment_method,
        amount_paid=0,
        return_of_bill_id=original.id,
    )
    db.add(credit)
    db.commit()
    db.refresh(credit)

    for li, qty in to_return:
        if li.item_id and not original.is_quote:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item:
                catalog_item.stock_quantity += qty
        cost_share = (
            -(qty / li.quantity) * li.cost_price if li.cost_price is not None else None
        )
        db.add(models.BillItem(
            bill_id=credit.id,
            item_id=li.item_id,
            item_name=li.item_name,
            quantity=qty,
            unit_price=li.unit_price,
            line_total=-(qty * li.unit_price),
            hsn_code=li.hsn_code,
            gst_rate=li.gst_rate,
            cost_price=cost_share,
        ))

    db.commit()
    db.refresh(credit)
    log_activity(db, request, "return_bill", f"Rs. {credit_amount} returned against bill {bill_id}")
    return credit

@router.post("/bills/{bill_id}/void", response_model=schemas.BillOutV2)
def void_bill(bill_id: str, body: schemas.VoidBillRequest | None = None, db: Session = Depends(get_db), request: Request = None):
    """Marks a bill as voided/cancelled — kept in the ledger for audit trail
    (amount/line_items stay exactly as originally recorded) but excluded
    from every balance/report/GST calculation the same way a quotation is,
    with its stock effect reversed once, here.

    Distinct from DELETE /bills/{id} (removes the row entirely) and POST
    /bills/{id}/return (records goods physically coming back from the
    customer): voiding is for a bill that should never have counted in the
    first place — wrong customer selected, a duplicate entry, a typo caught
    after saving — not an actual return of goods.
    """
    require_manage(request)
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if db_bill.is_voided:
        raise HTTPException(status_code=400, detail="This bill is already voided")
    if db_bill.return_of_bill_id:
        raise HTTPException(status_code=400, detail="Cannot void a return credit note")
    if db_bill.is_quote:
        raise HTTPException(status_code=400, detail="Cannot void a quotation — delete it instead")
    already_returned = (
        db.query(models.Bill)
        .filter(models.Bill.return_of_bill_id == bill_id)
        .first()
    )
    if already_returned:
        raise HTTPException(
            status_code=400,
            detail="Cannot void a bill that has already been returned",
        )

    for li in db_bill.line_items:
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item:
                catalog_item.stock_quantity += li.quantity

    db_bill.is_voided = True
    db_bill.void_reason = (body.reason.strip() if body and body.reason else None) or None
    db.commit()
    db.refresh(db_bill)
    log_activity(db, request, "void_bill", f"Rs. {db_bill.amount} bill voided — {db_bill.void_reason or 'no reason given'}")
    return db_bill

@router.get("/customers/{customer_id}/bills/v2", response_model=List[schemas.BillOutV2])
def get_customer_bills_v2(customer_id: str, db: Session = Depends(get_db)):
    return db.query(models.Bill).filter(models.Bill.customer_id == customer_id).all()

@router.put("/bills/v2/{bill_id}", response_model=schemas.BillOutV2)
def edit_bill_v2(bill_id: str, bill: schemas.BillCreateV2, db: Session = Depends(get_db)):
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if db_bill.return_of_bill_id:
        raise HTTPException(status_code=400, detail="Cannot edit a return credit note.")
    if db_bill.is_voided:
        raise HTTPException(status_code=400, detail="Cannot edit a voided bill.")
    if bill.is_quote and not db_bill.is_quote:
        raise HTTPException(
            status_code=400,
            detail="Cannot turn an existing bill back into a quotation.",
        )

    if not db_bill.is_quote:
        for li in db_bill.line_items:
            if li.item_id:
                catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                if catalog_item:
                    catalog_item.stock_quantity += li.quantity

    db.query(models.BillItem).filter(models.BillItem.bill_id == bill_id).delete()

    subtotal = sum(li.quantity * li.unit_price for li in bill.line_items)
    discount = max(0.0, min(bill.discount_amount or 0, subtotal))
    total = subtotal - discount
    db_bill.amount = total
    db_bill.discount_amount = discount
    db_bill.date = bill.date
    db_bill.payment_status = bill.payment_status
    db_bill.payment_method = bill.payment_method
    db_bill.amount_paid = bill.amount_paid
    db_bill.is_quote = bill.is_quote

    defaults = _get_settings(db)
    for li in bill.line_items:
        catalog_item = None
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item and not bill.is_quote:
                catalog_item.stock_quantity -= li.quantity

        hsn, gst = _resolve_gst_for_line(li, catalog_item, defaults)
        cost_snapshot = None
        if not bill.is_quote and catalog_item and catalog_item.cost_price is not None:
            cost_snapshot = li.quantity * catalog_item.cost_price
        db_line = models.BillItem(
            bill_id=db_bill.id,
            item_id=li.item_id,
            item_name=li.item_name,
            quantity=li.quantity,
            unit_price=li.unit_price,
            line_total=li.quantity * li.unit_price,
            hsn_code=hsn,
            gst_rate=gst,
            cost_price=cost_snapshot,
        )
        db.add(db_line)

    db.commit()
    db.refresh(db_bill)
    return db_bill

@router.get("/customers/{customer_id}/last-bill", response_model=schemas.BillOutV2)
def get_last_bill(customer_id: str, db: Session = Depends(get_db)):
    last_bill = (
        db.query(models.Bill)
        .filter(models.Bill.customer_id == customer_id)
        .order_by(models.Bill.created_at.desc())
        .first()
    )
    if not last_bill:
        raise HTTPException(status_code=404, detail="No bills found for this customer")
    return last_bill

@router.get("/bills/{bill_id}/invoice")
def get_bill_invoice(bill_id: str, db: Session = Depends(get_db), language: str | None = None):
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if db_bill.is_quote:
        raise HTTPException(
            status_code=400,
            detail="Cannot generate a tax invoice for a quotation — convert it to a bill first.",
        )
    if db_bill.is_voided:
        raise HTTPException(
            status_code=400,
            detail="Cannot generate a tax invoice for a voided bill.",
        )

    customer = db_bill.customer
    pdf_bytes = bytes(_build_invoice_pdf(db_bill, customer, _get_settings(db), db, language))
    return Response(content=pdf_bytes, media_type="application/pdf")

@router.post("/bills/{bill_id}/email")
def email_bill_invoice(bill_id: str, db: Session = Depends(get_db), language: str | None = None):
    """Emails the same tax-invoice PDF get_bill_invoice generates, straight
    to the customer's email on file — same quote/voided guards as that
    route, plus a customer-has-no-email check this one alone needs."""
    db_bill = db.query(models.Bill).filter(models.Bill.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    if db_bill.is_quote:
        raise HTTPException(
            status_code=400,
            detail="Cannot email a tax invoice for a quotation — convert it to a bill first.",
        )
    if db_bill.is_voided:
        raise HTTPException(status_code=400, detail="Cannot email a tax invoice for a voided bill.")
    customer = db_bill.customer
    if not customer or not (customer.email or "").strip():
        raise HTTPException(status_code=400, detail="This customer has no email on file.")

    pdf_bytes = bytes(_build_invoice_pdf(db_bill, customer, _get_settings(db), db, language))
    invoice_no = _get_invoice_no(db, db_bill)
    shop_name = _get_settings(db)["shop_name"]
    subject, body = invoice_mail(language, customer.name, invoice_no, shop_name)
    try:
        send_email(
            db,
            to_email=customer.email.strip(),
            subject=subject,
            body_text=body,
            attachment_bytes=pdf_bytes,
            attachment_filename=f"invoice_{invoice_no}.pdf",
        )
    except EmailNotConfigured as exc:
        raise HTTPException(status_code=400, detail=str(exc))
    except EmailSendFailed as exc:
        raise HTTPException(status_code=502, detail=f"Could not send email: {exc}")
    return {"status": "sent", "email": customer.email}
