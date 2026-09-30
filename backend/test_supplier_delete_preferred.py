"""Self-check: deleting a supplier must clear it as any item's preferred
supplier, not leave a dangling reference.

home_screen.dart's one-tap Reorder flow reads Item.preferred_supplier_id and
navigates straight to creating a purchase against it, with no existence
check anywhere in that path (create_purchase doesn't validate supplier_id
either) — a stale reference to a deleted supplier would silently create an
orphaned, invisible purchase (stock correctly added, but the purchase record
unreachable in any supplier ledger or dues report).

Run: backend/venv/Scripts/python.exe backend/test_supplier_delete_preferred.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers import suppliers

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

supplier = models.Supplier(name="Test Supplier")
db.add(supplier)
db.commit()

item = models.Item(name="Nails", price=10.0, preferred_supplier_id=supplier.id)
db.add(item)
db.commit()

suppliers.delete_supplier(supplier_id=supplier.id, db=db)

db.refresh(item)
assert item.preferred_supplier_id is None, \
    f"item still references the deleted supplier: {item.preferred_supplier_id}"

print("OK — deleting a supplier clears it as every item's preferred supplier.")
