"""Self-check: /reports/top-items ("Most Purchased Items") must count v2
bills' line items, not just the legacy v1 text blob.

Bill.items is never populated by create_bill_v2 — every bill made through
the app's actual v2 flow left this permanently empty, silently making the
report always return nothing. Also verifies quotations and return credit
notes are excluded from the count.

Run: backend/venv/Scripts/python.exe backend/test_top_items_v2.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers.reports import top_items

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

now = datetime.datetime.utcnow()
customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()


def add_bill(*, is_quote=False, return_of=None, item_name="Nails"):
    bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=10.0,
                        amount_paid=0.0, date=now, is_quote=is_quote, return_of_bill_id=return_of)
    db.add(bill)
    db.commit()
    db.add(models.BillItem(bill_id=bill.id, item_name=item_name, quantity=1,
                            unit_price=10.0, line_total=10.0))
    db.commit()
    return bill


real1 = add_bill()
real2 = add_bill()
quote = add_bill(is_quote=True)
return_note = add_bill(return_of=real1.id)

result = {r["item"]: r["count"] for r in top_items(db=db)}
assert result.get("Nails") == 2, \
    f"expected 2 real-bill occurrences (quote/return excluded): {result}"

print("OK — top-items counts v2 line items, excluding quotations and returns.")
