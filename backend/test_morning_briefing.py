"""Self-check: AI Morning Briefing — the facts handed to Gemini
(bills/sales/collections yesterday, low stock, overdue, pending POs) are
computed correctly, and an unconfigured Gemini key surfaces as a 503
instead of a raw exception. Stubs Firebase/FCM and the actual Gemini call
(no real network/API key needed) — same approach as
test_overdue_notify_nets_returns.py.

Run: backend/venv/Scripts/python.exe backend/test_morning_briefing.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from fastapi import HTTPException
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import routers.notifications as notifications
from database import Base
from utils.gemini import AiScanNotConfigured, GeminiAPIError

notifications.FIREBASE_READY = True

class _FakeResponse:
    success_count = 1
    failure_count = 0

class _FakeMessaging:
    MulticastMessage = staticmethod(lambda *a, **k: None)
    Notification = staticmethod(lambda title=None, body=None: None)

    @staticmethod
    def send_each_for_multicast(msg):
        return _FakeResponse()

notifications.firebase_messaging = _FakeMessaging()

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

supplier = models.Supplier(name="Test Supplier")
db.add(supplier)
db.commit()

item = models.Item(name="Cement Bag", price=1200.0, stock_quantity=2, low_stock_threshold=5)
db.add(item)
db.commit()

customer = models.Customer(name="Ahmed")
db.add(customer)
db.commit()

yesterday = datetime.datetime.utcnow() - datetime.timedelta(days=1)
old = datetime.datetime.utcnow() - datetime.timedelta(days=5)

bill_yday = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=500.0,
                         amount_paid=300.0, date=yesterday, payment_status="unpaid", is_quote=False)
overdue_bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=200.0,
                            amount_paid=0.0, date=old, payment_status="unpaid", is_quote=False)
quote = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=9999.0,
                     amount_paid=0.0, date=yesterday, payment_status="unpaid", is_quote=True)
db.add_all([bill_yday, overdue_bill, quote])
db.commit()

po = models.Purchase(supplier_id=supplier.id, amount=100.0, date=yesterday,
                      payment_status="unpaid", amount_paid=0.0, is_po=True)
db.add(po)
db.add(models.DeviceToken(token="tok1"))
db.commit()

captured_facts = {}

captured_language = []

def _fake_generate_briefing(facts, language=None):
    captured_language.append(language)
    captured_facts.update(facts)
    return "Yesterday was decent."

notifications.generate_briefing = _fake_generate_briefing

import utils.name_translate as name_translate

def _no_network(*a, **k):
    raise ValueError("name translation must not call Gemini in this test")

name_translate._ask = _no_network

result =notifications.morning_briefing_and_notify(db=db)

assert captured_facts["bills_yesterday"] == 1, captured_facts
assert captured_facts["sales_yesterday"] == 500.0, captured_facts
assert captured_facts["collected_yesterday"] == 300.0, captured_facts
assert captured_facts["low_stock_count"] == 1 and captured_facts["low_stock_items"] == ["Cement Bag"], captured_facts
assert captured_facts["overdue_bill_count"] == 2, captured_facts
assert captured_facts["overdue_total"] == 400.0, captured_facts
assert captured_facts["pending_purchase_orders"] == 1, captured_facts

assert result["message"] == "Yesterday was decent."
assert result["notified"] == 1

assert captured_language == [None], captured_language
notifications.morning_briefing_and_notify(db=db, language="UR")
notifications.morning_briefing_and_notify(db=db)
assert captured_language == [None, "ur", "ur"], captured_language

db.add(models.NameTranslation(lang="sd", kind="item", source="Cement Bag", target="SD-cement"))
db.commit()
sd_result = notifications.morning_briefing_and_notify(db=db, language="sd")
assert captured_facts["low_stock_items"] == ["SD-cement"], "Gemini must be given the saved translation"
assert sd_result["facts"]["low_stock_items"] == ["Cement Bag"], "the returned facts keep the typed name"

def _unconfigured(facts, language=None):
    raise AiScanNotConfigured("no key")

notifications.generate_briefing = _unconfigured
try:
    notifications.morning_briefing_and_notify(db=db)
    assert False, "should have raised when the AI isn't configured"
except HTTPException as e:
    assert e.status_code == 503, e.status_code

def _billing_failure(facts, language=None):
    raise GeminiAPIError("Gemini returned HTTP 429", 429)

notifications.generate_briefing = _billing_failure
try:
    notifications.morning_briefing_and_notify(db=db)
    assert False, "should have raised when the Gemini API call itself fails"
except HTTPException as e:
    assert e.status_code == 503, e.status_code

print("OK — morning briefing computes correct facts, excludes quotations, "
      "and both a missing AI key and a failing API call surface as a clean 503.")
