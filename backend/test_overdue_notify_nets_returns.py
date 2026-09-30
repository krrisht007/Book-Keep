"""Self-check: check-overdue's reported total must net a return credit note
against its original bill, not overstate what's actually owed.

A return credit note is recorded payment_status="paid" (see return_bill), so
it never appears in the "unpaid" bill query itself — summing only the
matched overdue bills' own balances would ignore the credit and report the
pre-return amount as still fully owed.

Run: backend/venv/Scripts/python.exe backend/test_overdue_notify_nets_returns.py
"""
import datetime
import os
import sys
import types

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
import routers.notifications as notifications
from database import Base
from routers.bills import return_bill

notifications.FIREBASE_READY = True

class _FakeResponse:
    success_count = 1
    failure_count = 0

_sent_bodies = []

class _FakeMessaging:
    MulticastMessage = staticmethod(lambda *a, **k: None)

    @staticmethod
    def Notification(title=None, body=None):
        _sent_bodies.append(body)
        return None

    @staticmethod
    def send_each_for_multicast(msg):
        return _FakeResponse()

notifications.firebase_messaging = _FakeMessaging()

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

old_date = datetime.datetime.utcnow() - datetime.timedelta(days=5)
bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=200.0,
                    amount_paid=0.0, date=old_date, payment_status="unpaid", is_quote=False)
db.add(bill)
db.commit()
db.add(models.BillItem(bill_id=bill.id, item_name="Nails", quantity=10,
                        unit_price=20.0, line_total=200.0))
db.commit()

db.add(models.DeviceToken(token="tok1"))
db.commit()

result = notifications.check_overdue_and_notify(db=db)
assert "200.00" in _sent_bodies[-1], _sent_bodies[-1]

return_bill(bill_id=bill.id, body=schemas.BillReturnRequest(
    line_items=[schemas.BillReturnLineInput(bill_item_id=bill.line_items[0].id, quantity=3)]
), db=db)

result = notifications.check_overdue_and_notify(db=db)
assert "140.00" in _sent_bodies[-1], \
    f"check-overdue didn't net the return credit into its total: {_sent_bodies[-1]}"

print("OK — check-overdue's total nets a return credit against its original bill.")
