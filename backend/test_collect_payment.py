"""Self-check: collect_payment applies oldest-first, splits across bills,
excludes quotations, and rejects overpayment / no-outstanding-balance.

Run: backend/venv/Scripts/python.exe backend/test_collect_payment.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from fastapi import HTTPException
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.customers import collect_payment

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

now = datetime.datetime.utcnow()
customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

old_bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=100.0,
                        amount_paid=0.0, date=now - datetime.timedelta(days=5), is_quote=False)
new_bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=200.0,
                        amount_paid=0.0, date=now, is_quote=False)
quote = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=500.0,
                     amount_paid=0.0, date=now, is_quote=True)
db.add_all([old_bill, new_bill, quote])
db.commit()

result = collect_payment(customer_id=customer.id, body=schemas.CollectPaymentRequest(amount=150.0), db=db)
assert result["amount_collected"] == 150.0, result
assert result["bills_updated"] == 2, result
assert result["remaining_outstanding"] == 150.0, result

db.refresh(old_bill)
db.refresh(new_bill)
db.refresh(quote)
assert old_bill.amount_paid == 100.0 and old_bill.payment_status == "paid", \
    (old_bill.amount_paid, old_bill.payment_status)
assert new_bill.amount_paid == 50.0 and new_bill.payment_status == "unpaid", \
    (new_bill.amount_paid, new_bill.payment_status)
assert quote.amount_paid == 0.0, "quote must never be touched"

try:
    collect_payment(customer_id=customer.id, body=schemas.CollectPaymentRequest(amount=1000.0), db=db)
    raise AssertionError("should have rejected an amount exceeding the outstanding balance")
except HTTPException as e:
    assert e.status_code == 400, e.status_code

collect_payment(customer_id=customer.id, body=schemas.CollectPaymentRequest(amount=150.0), db=db)
try:
    collect_payment(customer_id=customer.id, body=schemas.CollectPaymentRequest(amount=10.0), db=db)
    raise AssertionError("should have rejected — no outstanding balance left")
except HTTPException as e:
    assert e.status_code == 400, e.status_code

print("OK — collect_payment applies oldest-first, splits correctly, excludes quotes, rejects overpayment.")
