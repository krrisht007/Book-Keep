"""Self-check: draft Purchase Orders (Purchase.is_po) — mirrors
Bill.is_quote's pattern exactly. Covers: creating a PO adds no stock/cost,
converting one does; a PO is excluded from payables-aging, the Sales Tax
monthly-summary ITC, and the supplier ledger; editing/deleting/returning a
PO respects the same
guards edit_bill_v2/delete_bill/return_bill already enforce for a quotation.

Run: backend/venv/Scripts/python.exe backend/test_purchase_orders.py
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
from routers.purchases import (
    create_purchase, edit_purchase, delete_purchase, return_purchase,
    convert_po_to_purchase,
)
from routers.reports import payables_aging
from routers.gst import sales_tax_summary_report
from routers.suppliers import get_supplier_ledger

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

supplier = models.Supplier(name="Test Supplier", strn="1234567890123")
db.add(supplier)
db.commit()

item = models.Item(name="Nails", price=20.0, cost_price=10.0, stock_quantity=0)
db.add(item)
db.commit()

today = datetime.datetime.utcnow()
month = today.strftime("%Y-%m")

po = create_purchase(
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=today, payment_status="unpaid", amount_paid=0,
        is_po=True,
        line_items=[schemas.PurchaseItemInput(item_id=item.id, item_name="Nails",
                                               quantity=10, unit_price=15.0)],
    ),
    db=db,
)
db.refresh(item)
assert item.stock_quantity == 0, f"a PO must not add stock yet: {item.stock_quantity}"
assert item.cost_price == 10.0, f"a PO must not update cost_price yet: {item.cost_price}"
assert po.is_po is True

assert payables_aging(db=db) == [], "a draft PO must not count as payable"
report = sales_tax_summary_report(month=month, db=db)
assert report["itc"]["total_itc"] == 0.0, f"a draft PO must not generate ITC: {report['itc']}"

ledger_response = get_supplier_ledger(supplier_id=supplier.id, db=db)
assert ledger_response.status_code == 200 and ledger_response.body[:4] == b"%PDF"

try:
    return_purchase(purchase_id=po.id, body=None, db=db)
    assert False, "should have refused to return a draft PO"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

edited = edit_purchase(
    purchase_id=po.id,
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=today, payment_status="unpaid", amount_paid=0,
        is_po=True,
        line_items=[schemas.PurchaseItemInput(item_id=item.id, item_name="Nails",
                                               quantity=20, unit_price=15.0)],
    ),
    db=db,
)
db.refresh(item)
assert item.stock_quantity == 0, f"editing a PO must not add stock: {item.stock_quantity}"
assert edited.amount == 300.0, edited.amount

received = convert_po_to_purchase(purchase_id=po.id, db=db)
db.refresh(item)
assert received.is_po is False
assert item.stock_quantity == 20, f"convert should add the PO's stock: {item.stock_quantity}"
assert item.cost_price == 15.0, f"convert should update cost_price: {item.cost_price}"

try:
    convert_po_to_purchase(purchase_id=po.id, db=db)
    assert False, "should have refused to convert an already-received purchase"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

rows = payables_aging(db=db)
assert len(rows) == 1 and rows[0]["outstanding"] == 300.0, rows
report = sales_tax_summary_report(month=month, db=db)
assert report["itc"]["total_itc"] > 0, "a received purchase should now generate ITC"

try:
    edit_purchase(
        purchase_id=po.id,
        purchase=schemas.PurchaseCreate(
            supplier_id=supplier.id, date=today, payment_status="unpaid", amount_paid=0,
            is_po=True,
            line_items=[schemas.PurchaseItemInput(item_id=item.id, item_name="Nails",
                                                   quantity=20, unit_price=15.0)],
        ),
        db=db,
    )
    assert False, "should have refused to downgrade a received purchase back to a PO"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

po2 = create_purchase(
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=today, payment_status="unpaid", amount_paid=0,
        is_po=True,
        line_items=[schemas.PurchaseItemInput(item_id=item.id, item_name="Nails",
                                               quantity=5, unit_price=15.0)],
    ),
    db=db,
)
before_delete = item.stock_quantity
delete_purchase(purchase_id=po2.id, db=db)
db.refresh(item)
assert item.stock_quantity == before_delete, \
    f"deleting a draft PO must not touch stock: {before_delete} -> {item.stock_quantity}"

print("OK — draft purchase orders add no stock/ITC/payable until converted, "
      "and every edit/delete/return guard mirrors the quotation pattern.")
