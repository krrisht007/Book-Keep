"""Self-check: a bill return must actually change the customer's outstanding
balance — reducing it when the original bill was unpaid, and surfacing a
credit (negative outstanding) when the original had already been paid in
full. Also covers collect_payment correctly netting that credit into the
customer's total rather than ignoring it.

Previously the credit note's amount_paid was forced to always match its
(negative) amount, which nets to zero regardless of whether the original
bill was ever actually paid — a return silently left the customer's
outstanding balance completely unchanged.

Run: backend/venv/Scripts/python.exe backend/test_return_credit_accounting.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from fastapi import HTTPException

from routers.bills import return_bill, update_bill
from routers.customers import collect_payment
from routers.reports import outstanding_by_customer

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

def outstanding_for(customer_id):
    rows = outstanding_by_customer(db=db)
    match = next((r for r in rows if r["customer_id"] == customer_id), None)
    return match["outstanding"] if match else 0.0

def make_bill_with_item(customer_id, amount, amount_paid, qty=10, unit_price=20.0):
    bill = models.Bill(customer_id=customer_id, image_url="manual_entry", amount=amount,
                        amount_paid=amount_paid, date=__import__("datetime").datetime.utcnow(),
                        is_quote=False)
    db.add(bill)
    db.commit()
    db.add(models.BillItem(bill_id=bill.id, item_name="Nails", quantity=qty,
                            unit_price=unit_price, line_total=amount))
    db.commit()
    return bill

c1 = models.Customer(name="Unpaid Customer")
db.add(c1)
db.commit()
bill1 = make_bill_with_item(c1.id, amount=200.0, amount_paid=0.0)

assert outstanding_for(c1.id) == 200.0
return_bill(bill_id=bill1.id, body=schemas.BillReturnRequest(
    line_items=[schemas.BillReturnLineInput(bill_item_id=bill1.line_items[0].id, quantity=3)]
), db=db)
assert outstanding_for(c1.id) == 140.0, \
    f"returning Rs.60 from an unpaid Rs.200 bill should leave Rs.140 owed: got {outstanding_for(c1.id)}"

c2 = models.Customer(name="Paid Customer")
db.add(c2)
db.commit()
bill2 = make_bill_with_item(c2.id, amount=200.0, amount_paid=200.0)
return_bill(bill_id=bill2.id, body=None, db=db)
rows = outstanding_by_customer(db=db)
assert not any(r["customer_id"] == c2.id for r in rows), \
    "outstanding_by_customer only lists positive balances — a credit customer shouldn't appear"
real_bills = db.query(models.Bill).filter(models.Bill.customer_id == c2.id).all()
net = sum((b.amount or 0) - (b.amount_paid or 0) for b in real_bills)
assert net == -200.0, f"a full return of a fully-paid bill should leave a Rs.200 credit: got {net}"

c3 = models.Customer(name="Partial Return Customer")
db.add(c3)
db.commit()
bill3 = make_bill_with_item(c3.id, amount=200.0, amount_paid=0.0)
return_bill(bill_id=bill3.id, body=schemas.BillReturnRequest(
    line_items=[schemas.BillReturnLineInput(bill_item_id=bill3.line_items[0].id, quantity=3)]
), db=db)
assert outstanding_for(c3.id) == 140.0, outstanding_for(c3.id)

result = collect_payment(customer_id=c3.id, body=schemas.CollectPaymentRequest(amount=140.0), db=db)
assert result["remaining_outstanding"] == 0.0, result
assert outstanding_for(c3.id) == 0.0, \
    f"collecting the full corrected balance should leave nothing owed: got {outstanding_for(c3.id)}"

credit_id = db.query(models.Bill).filter(models.Bill.return_of_bill_id == bill1.id).first().id
try:
    update_bill(bill_id=credit_id, update=schemas.BillUpdate(payment_status="paid"), db=db)
    assert False, "should have refused to update a return credit note's payment status"
except HTTPException as e:
    assert e.status_code == 400, e

quote = models.Bill(customer_id=c1.id, image_url="manual_entry", amount=50.0,
                     amount_paid=0.0, date=__import__("datetime").datetime.utcnow(),
                     is_quote=True)
db.add(quote)
db.commit()
try:
    update_bill(bill_id=quote.id, update=schemas.BillUpdate(payment_status="paid"), db=db)
    assert False, "should have refused to update a quotation's payment status"
except HTTPException as e:
    assert e.status_code == 400, e

print("OK — a return correctly changes outstanding, collect_payment nets the resulting credit, "
      "and update_bill refuses to touch a return's or quote's payment status.")
