"""Self-check: POST /items/bulk on an item that already exists must update only
the fields the Bulk Add screen typed, not wipe the rest. It used to overwrite
category with null and blank the item's cost price / HSN / GST (a real item was
damaged this way in production).

Run: backend/venv/Scripts/python.exe backend/test_bulk_items.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.items import create_items_bulk

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

db.add(models.Item(name="Nails 2 inch", price=190.0, unit="kg", category="Fasteners",
                   cost_price=142.5, hsn_code="7317", gst_rate=18.0, stock_quantity=50))
db.commit()

line = schemas.ItemCreate(name="nails 2 INCH", price=150.0, unit="kg", category=None,
                          stock_quantity=0, low_stock_threshold=5)
create_items_bulk(items=[line], db=db)

item = db.query(models.Item).one()
assert item.price == 150.0, "typed price should be applied"
assert item.category == "Fasteners", "empty category must not wipe the existing one"
assert item.cost_price == 142.5 and item.hsn_code == "7317" and item.gst_rate == 18.0, \
    "cost/HSN/GST must survive a bulk update"
assert item.stock_quantity == 50, "stock is kept as-is"

create_items_bulk(items=[schemas.ItemCreate(name="Nails 2 inch", price=0.0, unit="kg")], db=db)
assert db.query(models.Item).one().price == 150.0, "a missing price must not zero it"

create_items_bulk(items=[schemas.ItemCreate(name="Screws", price=5.0, category="Fasteners")], db=db)
assert db.query(models.Item).count() == 2

print("OK — bulk add updates only what was typed and still creates new items.")
