"""Self-check: profit-by-item report — revenue, COGS, and
profit per item and per category, all-time. Same exclusion pattern as every
other real-sale aggregation (quotes/voided bills never counted; a return
nets back out via BillItem's stored signs rather than counting as a new
occurrence).

Run: backend/venv/Scripts/python.exe backend/test_profit_by_item.py
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
from routers.bills import create_bill_v2, return_bill
from routers.reports import profit_by_item

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customer = models.Customer(name="Test Customer")
db.add(customer)

nails = models.Item(name="Nails", price=20.0, stock_quantity=100, cost_price=10.0, category="Hardware")
pipe = models.Item(name="Pipe", price=100.0, stock_quantity=100, cost_price=90.0, category="Plumbing")
db.add_all([nails, pipe])
db.commit()

bill1 = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=nails.id, item_name="Nails", quantity=10, unit_price=20.0)],
    ),
    db,
)
bill2 = create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=pipe.id, item_name="Pipe", quantity=5, unit_price=100.0)],
    ),
    db,
)
create_bill_v2(
    schemas.BillCreateV2(
        customer_id=customer.id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=nails.id, item_name="Nails", quantity=100, unit_price=20.0)],
        is_quote=True,
    ),
    db,
)
nails_line = bill1.line_items[0]
return_bill(
    bill1.id,
    schemas.BillReturnRequest(
        line_items=[schemas.BillReturnLineInput(bill_item_id=nails_line.id, quantity=2)]
    ),
    db,
)

report = profit_by_item(db)
by_item = {r["item"]: r for r in report["by_item"]}
by_category = {r["category"]: r for r in report["by_category"]}

assert by_item["Nails"]["quantity"] == 8, by_item["Nails"]
assert by_item["Nails"]["revenue"] == 160, by_item["Nails"]
assert by_item["Nails"]["cogs"] == 80, by_item["Nails"]
assert by_item["Nails"]["profit"] == 80, by_item["Nails"]
assert by_item["Nails"]["category"] == "Hardware"

assert by_item["Pipe"]["quantity"] == 5, by_item["Pipe"]
assert by_item["Pipe"]["revenue"] == 500, by_item["Pipe"]
assert by_item["Pipe"]["cogs"] == 450, by_item["Pipe"]
assert by_item["Pipe"]["profit"] == 50, by_item["Pipe"]

assert by_category["Hardware"]["profit"] == 80, by_category["Hardware"]
assert by_category["Plumbing"]["profit"] == 50, by_category["Plumbing"]

assert [r["item"] for r in report["by_item"]] == ["Nails", "Pipe"]

print("All profit-by-item tests passed.")
