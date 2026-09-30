"""Self-check: the sales-tax report must assign a real invoice number for
every bill it lists, not leave it blank just because nobody viewed that
bill's PDF first — and assign them in date order when batch-assigning
several at once.

Run: backend/venv/Scripts/python.exe backend/test_gstr1_invoice_no.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers.gst import sales_tax_report

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

month = "2026-08"
early = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=100.0,
                     amount_paid=0.0, date=datetime.datetime(2026, 8, 5), is_quote=False)
late = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=200.0,
                    amount_paid=0.0, date=datetime.datetime(2026, 8, 20), is_quote=False)
db.add_all([late, early])
db.commit()
assert early.invoice_no is None and late.invoice_no is None, \
    "test setup: neither bill should have an invoice number yet"

report = sales_tax_report(month=month, db=db)
by_id = {inv["date"] + inv["invoice_no"]: inv for inv in report["invoices"]}
assert all(inv["invoice_no"] for inv in report["invoices"]), \
    f"sales-tax report left an invoice_no blank: {report['invoices']}"

db.refresh(early)
db.refresh(late)
assert early.invoice_no and late.invoice_no
early_seq = int(early.invoice_no.rsplit("-", 1)[1])
late_seq = int(late.invoice_no.rsplit("-", 1)[1])
assert early_seq < late_seq, \
    f"invoice numbers weren't assigned in date order: early={early.invoice_no} late={late.invoice_no}"

print("OK — sales-tax report assigns invoice numbers for every bill, in date order.")
