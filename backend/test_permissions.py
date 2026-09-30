"""Self-check: `can_manage` permission — before this existed,
any authenticated account (not just an admin) could void/delete/return a
bill or delete a customer/supplier. Covers: a plain staff account is
rejected (403), an account granted can_manage succeeds, an admin succeeds
without the flag, and a request with no user at all (open/dev auth mode,
matching every other route's existing behavior) is a no-op — not rejected.

Run: backend/venv/Scripts/python.exe backend/test_permissions.py
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
from routers.bills import create_bill_v2, void_bill
from routers.customers import delete_customer
from routers.purchases import create_purchase, delete_purchase, return_purchase
from routers.expenses import delete_expense
from routers.items import delete_item, dedupe_items

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

class _FakeRequest:
    def __init__(self, claims):
        self.scope = {"user": claims}

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

item = models.Item(name="Nails", price=20.0, stock_quantity=50, cost_price=10.0)
db.add(item)
db.commit()

def _fresh_bill():
    return create_bill_v2(
        schemas.BillCreateV2(
            customer_id=customer.id,
            date=datetime.datetime.utcnow(),
            line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=5, unit_price=20.0)],
        ),
        db,
    )

try:
    void_bill(bill_id=_fresh_bill().id, db=db, request=_FakeRequest({"email": "cashier@shop.com"}))
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

voided = void_bill(
    bill_id=_fresh_bill().id, db=db,
    request=_FakeRequest({"email": "manager@shop.com", "can_manage": True}),
)
assert voided.is_voided is True

voided2 = void_bill(
    bill_id=_fresh_bill().id, db=db,
    request=_FakeRequest({"email": "owner@shop.com", "admin": True}),
)
assert voided2.is_voided is True

voided3 = void_bill(bill_id=_fresh_bill().id, db=db, request=None)
assert voided3.is_voided is True

try:
    delete_customer(customer_id=customer.id, db=db, request=_FakeRequest({"email": "cashier@shop.com"}))
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

_CASHIER = _FakeRequest({"email": "cashier@shop.com"})

supplier = models.Supplier(name="Test Supplier")
db.add(supplier)
db.commit()

def _fresh_purchase():
    return create_purchase(
        schemas.PurchaseCreate(
            supplier_id=supplier.id,
            date=datetime.datetime.utcnow(),
            line_items=[schemas.PurchaseItemInput(item_id=item.id, item_name="Nails", quantity=5, unit_price=10.0)],
        ),
        db,
    )

try:
    delete_purchase(purchase_id=_fresh_purchase().id, db=db, request=_CASHIER)
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

try:
    return_purchase(purchase_id=_fresh_purchase().id, body=None, db=db, request=_CASHIER)
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

expense = models.Expense(description="Rent", amount=1000.0, date=datetime.datetime.utcnow())
db.add(expense)
db.commit()
try:
    delete_expense(expense_id=expense.id, db=db, request=_CASHIER)
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

spare_item = models.Item(name="Screws", price=5.0, stock_quantity=10, cost_price=2.0)
db.add(spare_item)
db.commit()
try:
    delete_item(item_id=spare_item.id, db=db, request=_CASHIER)
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

try:
    dedupe_items(db=db, request=_CASHIER)
    assert False, "should have rejected a plain staff account"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

from utils import permissions as _perm

_perm.ADMIN_EMAILS.add("boss@shop.com")
assert _perm._is_admin({"email": "boss@shop.com", "email_verified": True}) is True
assert _perm._is_admin({"email": "boss@shop.com", "email_verified": False}) is False
assert _perm._is_admin({"email": "boss@shop.com"}) is False
_perm.ADMIN_EMAILS.discard("boss@shop.com")

print("All permission tests passed.")
