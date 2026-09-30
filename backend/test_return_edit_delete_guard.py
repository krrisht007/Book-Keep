"""Self-check: a return credit note must not be double-credited on delete,
and must be rejected outright by the edit endpoint.

Previously delete_bill always did stock_quantity += li.quantity regardless
of direction — deleting a normal bill correctly restores stock (it had
deducted stock on sale), but deleting a return credit note (which had
already *added* stock back via return_bill) added it again instead of
reversing it. And edit_bill_v2 had no guard stopping a direct API call from
retyping a return's line items and running this function's sell-then-restore
stock math backwards onto it.

Run: backend/venv/Scripts/python.exe backend/test_return_edit_delete_guard.py
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
from routers.bills import return_bill, delete_bill, edit_bill_v2

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

item = models.Item(name="Nails", price=20.0, stock_quantity=50, cost_price=10.0)
db.add(item)
db.commit()

bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=200.0,
                    amount_paid=0.0, date=datetime.datetime.utcnow(), is_quote=False)
db.add(bill)
db.commit()
db.add(models.BillItem(bill_id=bill.id, item_id=item.id, item_name="Nails",
                        quantity=10, unit_price=20.0, line_total=200.0))
db.commit()
item.stock_quantity -= 10
db.commit()
assert item.stock_quantity == 40

credit = return_bill(bill_id=bill.id, body=schemas.BillReturnRequest(
    line_items=[schemas.BillReturnLineInput(bill_item_id=bill.line_items[0].id, quantity=3)]
), db=db)
db.refresh(item)
assert item.stock_quantity == 43, f"return should restore 3 units: got {item.stock_quantity}"

try:
    edit_bill_v2(bill_id=credit.id, bill=schemas.BillCreateV2(
        customer_id=customer.id, date=datetime.datetime.utcnow(),
        payment_status="paid", amount_paid=0, is_quote=False, line_items=[],
    ), db=db)
    assert False, "editing a return credit note should have raised"
except HTTPException as e:
    assert e.status_code == 400, e

delete_bill(bill_id=credit.id, db=db)
db.refresh(item)
assert item.stock_quantity == 40, \
    f"deleting a return should reverse its stock restore back to 40: got {item.stock_quantity}"

paid_bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=200.0,
                         amount_paid=200.0, payment_status="paid",
                         date=datetime.datetime.utcnow(), is_quote=False)
db.add(paid_bill)
db.commit()
db.add(models.BillItem(bill_id=paid_bill.id, item_id=item.id, item_name="Nails",
                        quantity=5, unit_price=20.0, line_total=100.0))
db.commit()
try:
    edit_bill_v2(bill_id=paid_bill.id, bill=schemas.BillCreateV2(
        customer_id=customer.id, date=datetime.datetime.utcnow(),
        payment_status="unpaid", amount_paid=0, is_quote=True,
        line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails",
                                           quantity=5, unit_price=20.0)],
    ), db=db)
    assert False, "downgrading a real bill to a quote should have raised"
except HTTPException as e:
    assert e.status_code == 400, e
db.refresh(paid_bill)
assert paid_bill.is_quote is False and paid_bill.amount_paid == 200.0, \
    "rejected edit must not have partially applied"

print("OK — deleting a return correctly reverses stock, editing a return is rejected, "
      "and a real bill can't be downgraded back into a quote.")
