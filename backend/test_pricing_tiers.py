"""Self-check: Contractor/Wholesale Pricing Tiers. Verifies
the plumbing — Customer.price_tier and Item.wholesale_price/contractor_price
round-trip correctly through create/edit — since resolving which price to
show is purely client-side (add_bill_screen.dart); the backend just stores
and returns whatever the client sends, same as every other price in this app.

Run: backend/venv/Scripts/python.exe backend/test_pricing_tiers.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import schemas
from database import Base
from routers.customers import create_customer, edit_customer
from routers.items import create_item, edit_item

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

c = create_customer(schemas.CustomerCreate(name="Ahmed"), db=db)
assert c.price_tier == "retail", c.price_tier

c = create_customer(schemas.CustomerCreate(name="Bilal Contractors", price_tier="contractor"), db=db)
assert c.price_tier == "contractor", c.price_tier

edited = edit_customer(
    customer_id=c.id,
    customer=schemas.CustomerCreate(name="Bilal Contractors", price_tier="wholesale"),
    db=db,
)
assert edited.price_tier == "wholesale", edited.price_tier

item = create_item(
    schemas.ItemCreate(name="Cement Bag", price=1200.0),
    db=db,
)
assert item.wholesale_price is None and item.contractor_price is None

item = create_item(
    schemas.ItemCreate(name="Pipe 1 inch", price=500.0, wholesale_price=450.0, contractor_price=420.0),
    db=db,
)
assert item.wholesale_price == 450.0 and item.contractor_price == 420.0

edited_item = edit_item(
    item_id=item.id,
    item=schemas.ItemCreate(name="Pipe 1 inch", price=500.0, wholesale_price=460.0, contractor_price=430.0),
    db=db,
)
assert edited_item.wholesale_price == 460.0 and edited_item.contractor_price == 430.0

cleared = edit_item(
    item_id=item.id,
    item=schemas.ItemCreate(name="Pipe 1 inch", price=500.0),
    db=db,
)
assert cleared.wholesale_price is None and cleared.contractor_price is None

print("OK — Customer.price_tier and Item.wholesale_price/contractor_price "
      "round-trip correctly through create/edit, including clearing back to null.")
