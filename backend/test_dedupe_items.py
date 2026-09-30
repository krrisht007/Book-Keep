"""Self-check: merging duplicate items must not orphan their history.

POST /items/dedupe deletes the losing duplicate row. There's no ON DELETE
CASCADE (and SQLite doesn't enforce FKs by default — see database.py), so
any BillItem/PurchaseItem/ItemPriceHistory row still pointing at the deleted
item's id would otherwise be silently orphaned, dropping that history out of
sales-velocity reorder math and the price-history view for the surviving item.

Run: backend/venv/Scripts/python.exe backend/test_dedupe_items.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers import items

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

now = datetime.datetime.utcnow()

original = models.Item(name="Nails 2 inch", price=10.0, stock_quantity=5,
                        created_at=now)
duplicate = models.Item(name="nails 2 inch", price=10.0, stock_quantity=3,
                         created_at=now + datetime.timedelta(seconds=1))
db.add_all([original, duplicate])
db.commit()

bill_item = models.BillItem(item_id=duplicate.id, item_name="Nails 2 inch",
                             quantity=2, unit_price=10.0, line_total=20.0)
purchase_item = models.PurchaseItem(item_id=duplicate.id, item_name="Nails 2 inch",
                                     quantity=10, unit_price=8.0, line_total=80.0)
price_history = models.ItemPriceHistory(item_id=duplicate.id, price=10.0)
db.add_all([bill_item, purchase_item, price_history])
db.commit()
duplicate_id = duplicate.id

result = items.dedupe_items(db=db)
assert result["duplicates_removed"] == 1, result

survivors = db.query(models.Item).all()
assert len(survivors) == 1, survivors
assert survivors[0].stock_quantity == 8, survivors[0].stock_quantity

db.refresh(bill_item)
db.refresh(purchase_item)
db.refresh(price_history)
assert bill_item.item_id == original.id, "BillItem still points at the deleted duplicate"
assert purchase_item.item_id == original.id, "PurchaseItem still points at the deleted duplicate"
assert price_history.item_id == original.id, "ItemPriceHistory still points at the deleted duplicate"
assert db.query(models.Item).filter(models.Item.id == duplicate_id).first() is None

print("OK — dedupe merges stock and re-points every historical reference to the survivor.")
