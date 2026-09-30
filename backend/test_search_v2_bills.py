"""Self-check: /search must find bills by their v2 line-item names, and show
those names in the result instead of "No item list".

Bill.items is the legacy v1 plain-text blob — create_bill_v2 never
populates it, so a bill created through the app's only real creation path
was previously unfindable by searching for something in it, and matched
results (e.g. by amount) showed nothing about their contents.

Run: backend/venv/Scripts/python.exe backend/test_search_v2_bills.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers.search import search

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

bill = models.Bill(customer_id=customer.id, image_url="manual_entry", amount=250.0,
                    amount_paid=0.0, date=datetime.datetime.utcnow(), is_quote=False)
db.add(bill)
db.commit()
db.add(models.BillItem(bill_id=bill.id, item_name="Nails 2 inch", quantity=5,
                        unit_price=50.0, line_total=250.0))
db.commit()
assert bill.items is None, "test setup: Bill.items should be empty, like every real v2 bill"

results = search(q="Nails", db=db)
assert len(results["bills"]) == 1, f"search by line-item name found nothing: {results['bills']}"
assert results["bills"][0]["id"] == bill.id

results = search(q="250", db=db)
assert len(results["bills"]) == 1, results["bills"]
assert results["bills"][0]["items"] == "Nails 2 inch", results["bills"][0]["items"]

print("OK — search finds v2 bills by line-item name and shows their contents.")
