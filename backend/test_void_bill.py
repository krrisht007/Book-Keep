"""Self-check: voiding a bill — kept in the ledger for audit
trail (amount/line_items unchanged) but excluded from balances/reports/GST
the same way a quotation is, with its stock effect reversed once, at void
time. Mirrors the is_quote-exclusion pattern verified in
test_quote_exclusion.py, plus the guard combinations (can't void twice, a
quote, a return note, or an already-returned bill; can't edit/return/
invoice/update-payment-status a voided bill; deleting one doesn't
double-reverse its stock).

Run: backend/venv/Scripts/python.exe backend/test_void_bill.py
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
from routers.bills import (
    create_bill_v2, void_bill, delete_bill, edit_bill_v2, update_bill,
    return_bill, get_bill_invoice,
)
from routers.customers import collect_payment
from routers.reports import outstanding_by_customer, monthly_totals

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

item = models.Item(name="Nails", price=20.0, stock_quantity=50, cost_price=10.0)
db.add(item)
db.commit()

today = datetime.datetime.utcnow()
month = today.strftime("%Y-%m")

bill = create_bill_v2(bill=schemas.BillCreateV2(
    customer_id=customer.id, date=today, payment_status="unpaid", amount_paid=0,
    line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails",
                                       quantity=10, unit_price=20.0)],
), db=db)
db.refresh(item)
assert item.stock_quantity == 40, item.stock_quantity
assert outstanding_by_customer(db=db)[0]["outstanding"] == 200.0

voided = void_bill(bill_id=bill.id, body=schemas.VoidBillRequest(reason="Wrong customer"), db=db)
assert voided.is_voided is True
assert voided.void_reason == "Wrong customer"
assert voided.amount == 200.0, "amount must stay as originally recorded"
assert len(voided.line_items) == 1, "line_items must stay as originally recorded"
db.refresh(item)
assert item.stock_quantity == 50, f"voiding should restore stock: got {item.stock_quantity}"
assert outstanding_by_customer(db=db) == [], "voided bill leaked into outstanding"
monthly = {m["month"]: m["total"] for m in monthly_totals(db=db)}
assert month not in monthly, f"voided bill leaked into monthly_totals: {monthly}"

try:
    collect_payment(customer_id=customer.id,
                     body=schemas.CollectPaymentRequest(amount=50.0), db=db)
    assert False, "should have refused — nothing outstanding after voiding"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    void_bill(bill_id=bill.id, body=None, db=db)
    assert False, "should have refused to void an already-voided bill"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    edit_bill_v2(bill_id=bill.id, bill=schemas.BillCreateV2(
        customer_id=customer.id, date=today, payment_status="paid",
        amount_paid=0, line_items=[],
    ), db=db)
    assert False, "should have refused to edit a voided bill"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    update_bill(bill_id=bill.id, update=schemas.BillUpdate(payment_status="paid"), db=db)
    assert False, "should have refused to update a voided bill's payment status"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    return_bill(bill_id=bill.id, body=None, db=db)
    assert False, "should have refused to return a voided bill"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    get_bill_invoice(bill_id=bill.id, db=db)
    assert False, "should have refused to invoice a voided bill"
except HTTPException as e:
    assert e.status_code == 400, e

quote = create_bill_v2(bill=schemas.BillCreateV2(
    customer_id=customer.id, date=today, payment_status="unpaid", amount_paid=0,
    is_quote=True,
    line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails",
                                       quantity=1, unit_price=20.0)],
), db=db)
try:
    void_bill(bill_id=quote.id, body=None, db=db)
    assert False, "should have refused to void a quotation"
except HTTPException as e:
    assert e.status_code == 400, e

bill2 = create_bill_v2(bill=schemas.BillCreateV2(
    customer_id=customer.id, date=today, payment_status="unpaid", amount_paid=0,
    line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails",
                                       quantity=5, unit_price=20.0)],
), db=db)
return_bill(bill_id=bill2.id, body=None, db=db)
try:
    void_bill(bill_id=bill2.id, body=None, db=db)
    assert False, "should have refused to void an already-returned bill"
except HTTPException as e:
    assert e.status_code == 400, e

credit = db.query(models.Bill).filter(models.Bill.return_of_bill_id == bill2.id).first()
try:
    void_bill(bill_id=credit.id, body=None, db=db)
    assert False, "should have refused to void a return credit note"
except HTTPException as e:
    assert e.status_code == 400, e

db.refresh(item)
before_delete = item.stock_quantity
delete_bill(bill_id=bill.id, db=db)
db.refresh(item)
assert item.stock_quantity == before_delete, \
    f"deleting a voided bill must not touch stock again: {before_delete} -> {item.stock_quantity}"

print("OK — voiding a bill restores stock, excludes it from balances/reports, "
      "keeps its record for audit trail, and every guard combination is enforced.")
