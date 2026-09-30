"""Self-check: bill-level discount — a flat Rupee amount off
the line-item subtotal, applied after GST (Bill.discount_amount), clamped
server-side to [0, subtotal] so a bad/stale client value can't push the
total negative or above what's actually on the bill. Covers create, edit,
and that outstanding/collect-payment math (which reads bill.amount) already
reflects the discounted total with no separate code path needed.

Run: backend/venv/Scripts/python.exe backend/test_bill_discount.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.bills import create_bill_v2, edit_bill_v2
from routers.reports import outstanding_by_customer

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

item = models.Item(name="Nails", price=100.0, stock_quantity=50, cost_price=50.0)
db.add(item)
db.commit()

bill = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[
            schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=5, unit_price=100.0),
        ],
        discount_amount=150,
    ),
    db,
)
assert bill.amount == 350, f"expected 500 - 150 = 350, got {bill.amount}"
assert bill.discount_amount == 150

outstanding = outstanding_by_customer(db)
row = next(r for r in outstanding if r["customer_id"] == customer.id)
assert row["outstanding"] == 350, f"expected outstanding 350, got {row['outstanding']}"

bill2 = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[
            schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=1, unit_price=100.0),
        ],
        discount_amount=9999,
    ),
    db,
)
assert bill2.amount == 0, f"expected clamped total 0, got {bill2.amount}"
assert bill2.discount_amount == 100, f"expected clamped discount 100, got {bill2.discount_amount}"

bill3 = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[
            schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=1, unit_price=100.0),
        ],
        discount_amount=-50,
    ),
    db,
)
assert bill3.amount == 100, f"expected no discount applied, got {bill3.amount}"
assert bill3.discount_amount == 0

edited = edit_bill_v2(
    bill.id,
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[
            schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=5, unit_price=100.0),
        ],
        discount_amount=50,
    ),
    db,
)
assert edited.amount == 450, f"expected 500 - 50 = 450, got {edited.amount}"
assert edited.discount_amount == 50

print("All bill discount tests passed.")
