"""Self-check: purchase returns — mirrors bills.py's
return_bill/delete_bill/edit_bill_v2 pattern, verified the same way:

  1. Returning goods to a supplier removes stock and records a linked,
     negative-amount credit note rather than deleting the original.
  2. A credit note can't be returned again, and a purchase can't be
     returned twice.
  3. Editing a credit note is rejected; deleting one correctly restores
     the stock it had removed (not double-remove it).
  4. delete_supplier reverses a return credit note's stock effect
     correctly too, not just a normal purchase's.

Run: backend/venv/Scripts/python.exe backend/test_purchase_return.py
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
from routers.purchases import create_purchase, return_purchase, delete_purchase, edit_purchase
from routers.suppliers import delete_supplier

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

supplier = models.Supplier(name="Test Supplier")
db.add(supplier)
db.commit()

item = models.Item(name="Nails", price=20.0, cost_price=10.0, stock_quantity=0)
db.add(item)
db.commit()

purchase = create_purchase(
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=datetime.datetime.utcnow(),
        payment_status="unpaid", amount_paid=0,
        line_items=[schemas.PurchaseItemInput(item_id=item.id, item_name="Nails",
                                               quantity=10, unit_price=10.0)],
    ),
    db=db,
)
db.refresh(item)
assert item.stock_quantity == 10, item.stock_quantity

credit = return_purchase(purchase_id=purchase.id, body=schemas.PurchaseReturnRequest(
    line_items=[schemas.PurchaseReturnLineInput(
        purchase_item_id=purchase.line_items[0].id, quantity=3)]
), db=db)
db.refresh(item)
assert item.stock_quantity == 7, f"return should remove 3 units: got {item.stock_quantity}"
assert credit.amount == -30.0, credit.amount
assert credit.return_of_purchase_id == purchase.id

try:
    return_purchase(purchase_id=purchase.id, body=None, db=db)
    assert False, "should have refused a second return of the same purchase"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    return_purchase(purchase_id=credit.id, body=None, db=db)
    assert False, "should have refused to return a credit note"
except HTTPException as e:
    assert e.status_code == 400, e

try:
    edit_purchase(purchase_id=credit.id, purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=datetime.datetime.utcnow(),
        payment_status="paid", amount_paid=0, line_items=[],
    ), db=db)
    assert False, "should have refused to edit a credit note"
except HTTPException as e:
    assert e.status_code == 400, e

delete_purchase(purchase_id=credit.id, db=db)
db.refresh(item)
assert item.stock_quantity == 10, \
    f"deleting a return should undo it, back to 10: got {item.stock_quantity}"

item2 = models.Item(name="Screws", price=5.0, cost_price=2.0, stock_quantity=0)
db.add(item2)
db.commit()
purchase2 = create_purchase(
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=datetime.datetime.utcnow(),
        payment_status="unpaid", amount_paid=0,
        line_items=[schemas.PurchaseItemInput(item_id=item2.id, item_name="Screws",
                                               quantity=20, unit_price=2.0)],
    ),
    db=db,
)
db.refresh(item2)
assert item2.stock_quantity == 20
return_purchase(purchase_id=purchase2.id, body=schemas.PurchaseReturnRequest(
    line_items=[schemas.PurchaseReturnLineInput(
        purchase_item_id=purchase2.line_items[0].id, quantity=5)]
), db=db)
db.refresh(item2)
assert item2.stock_quantity == 15, item2.stock_quantity

delete_supplier(supplier_id=supplier.id, db=db)
db.refresh(item2)
assert item2.stock_quantity == 0, \
    f"deleting a supplier should fully reverse both purchases back to 0: got {item2.stock_quantity}"

print("OK — purchase returns reverse stock correctly, block double-return/edit, "
      "and delete_purchase/delete_supplier reverse a credit note's stock effect correctly.")
