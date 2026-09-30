"""Self-check: staff activity log — who did what, for
accountability when multiple people share the shop account. Only
sensitive/hard-to-reverse actions are logged (see models.ActivityLog),
attributed via the same request.scope["user"] claims AuthMiddleware already
verifies. Logging must never break the real action, even with no request
(open/dev auth mode) or a request with no user claims.

Run: backend/venv/Scripts/python.exe backend/test_activity_log.py
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
from routers.bills import create_bill_v2, void_bill
from routers.customers import delete_customer
from routers.admin import admin_activity_log
from utils.activity_log import log_activity

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

class _FakeRequest:
    def __init__(self, email=None, name=None, can_manage=False):
        claims = {"email": email, "name": name} if email else {}
        if can_manage:
            claims["can_manage"] = True
        self.scope = {"user": claims}

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

item = models.Item(name="Nails", price=20.0, stock_quantity=50, cost_price=10.0)
db.add(item)
db.commit()

bill = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=5, unit_price=20.0)],
    ),
    db,
)

void_bill(
    bill_id=bill.id,
    body=schemas.VoidBillRequest(reason="Wrong customer"),
    db=db,
    request=_FakeRequest(email="cashier@shop.com", name="Cashier One", can_manage=True),
)

customer2 = models.Customer(name="Another Customer")
db.add(customer2)
db.commit()
delete_customer(customer_id=customer2.id, db=db, request=None)

log_activity(db, _FakeRequest(), "manual_test_action", "should not crash")

entries = admin_activity_log(limit=200, _={}, db=db)
assert len(entries) == 3, f"expected 3 log entries, got {len(entries)}"

assert entries[0]["action"] == "manual_test_action"
assert entries[1]["action"] == "delete_customer"
assert entries[1]["user_email"] is None
assert entries[2]["action"] == "void_bill"
assert entries[2]["user_email"] == "cashier@shop.com"
assert entries[2]["user_name"] == "Cashier One"
assert "Wrong customer" in entries[2]["details"]
assert "Another Customer" in entries[1]["details"]

print("All activity log tests passed.")
