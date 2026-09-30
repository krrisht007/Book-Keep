"""Self-check: email invoices/statements — POST
/bills/{id}/email and /customers/{id}/email-ledger. Doesn't spin up a real
SMTP server (out of scope/flaky for a unit test) — covers the two guard
paths that don't need one: SMTP not configured (EmailNotConfigured, before
send_email ever tries to connect) and a customer with no email on file.
Also covers the admin-only SMTP settings endpoints never echoing the
password back.

Run: backend/venv/Scripts/python.exe backend/test_email_invoice.py
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
from routers.bills import create_bill_v2, email_bill_invoice
from routers.customers import email_customer_ledger
from routers.admin import get_smtp_settings, update_smtp_settings
from utils.email_sender import send_email, EmailNotConfigured

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer_no_email = models.Customer(name="No Email Customer")
customer_with_email = models.Customer(name="Has Email Customer", email="customer@example.com")
db.add_all([customer_no_email, customer_with_email])
db.commit()

item = models.Item(name="Nails", price=20.0, stock_quantity=50, cost_price=10.0)
db.add(item)
db.commit()

bill_no_email = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer_no_email.id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=1, unit_price=20.0)],
    ),
    db,
)
bill_with_email = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer_with_email.id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=1, unit_price=20.0)],
    ),
    db,
)

try:
    send_email(db, "x@example.com", "subject", "body", b"pdf-bytes", "invoice.pdf")
    assert False, "should have raised EmailNotConfigured"
except EmailNotConfigured:
    pass

try:
    email_bill_invoice(bill_id=bill_no_email.id, db=db)
    assert False, "should have rejected a customer with no email"
except HTTPException as e:
    assert e.status_code == 400, e.status_code
    assert "no email" in e.detail.lower(), e.detail

try:
    email_bill_invoice(bill_id=bill_with_email.id, db=db)
    assert False, "should have rejected — SMTP not configured"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

try:
    email_customer_ledger(customer_id=customer_no_email.id, db=db)
    assert False, "should have rejected a customer with no email"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

before = get_smtp_settings(_={}, db=db)
assert before.configured is False

updated = update_smtp_settings(
    schemas.SmtpSettingsUpdate(
        smtp_host="smtp.gmail.com", smtp_port=587,
        smtp_username="shop@gmail.com", smtp_password="super-secret",
        smtp_from_name="My Hardware Shop",
    ),
    request=None, _={}, db=db,
)
assert updated.configured is True
assert updated.smtp_host == "smtp.gmail.com"
assert updated.smtp_port == 587
assert updated.smtp_username == "shop@gmail.com"
assert updated.smtp_from_name == "My Hardware Shop"
assert not hasattr(updated, "smtp_password"), "password must never round-trip to the client"

updated2 = update_smtp_settings(
    schemas.SmtpSettingsUpdate(smtp_from_name="Renamed Shop"),
    request=None, _={}, db=db,
)
assert updated2.configured is True, "omitting the password on a re-save must not clear it"
assert updated2.smtp_from_name == "Renamed Shop"

print("All email invoice/statement tests passed.")
