from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

import models
from database import get_db

router = APIRouter()

@router.get("/search")
def search(q: str, db: Session = Depends(get_db)):
    q_lower = q.lower()

    matching_customers = db.query(models.Customer).filter(
        models.Customer.name.ilike(f"%{q}%")
    ).all()

    bill_ids_by_item_name = {
        row[0] for row in
        db.query(models.BillItem.bill_id)
        .filter(models.BillItem.item_name.ilike(f"%{q}%"))
        .all()
    }
    matching_bills = db.query(models.Bill).filter(
        (models.Bill.payment_status.ilike(f"%{q}%")) |
        (models.Bill.id.in_(bill_ids_by_item_name))
    ).all()

    try:
        amount_query = float(q)
        amount_matches = db.query(models.Bill).filter(
            models.Bill.amount == amount_query
        ).all()
        matching_bills.extend(
            b for b in amount_matches if b not in matching_bills
        )
    except ValueError:
        pass

    return {
        "customers": [
            {"id": c.id, "name": c.name, "phone": c.phone}
            for c in matching_customers
        ],
        "bills": [
            {
                "id": b.id,
                "customer_id": b.customer_id,
                "amount": b.amount,
                "items": ", ".join(li.item_name for li in b.line_items) or None,
                "payment_status": b.payment_status,
                "date": b.date,
            }
            for b in matching_bills
        ],
    }
