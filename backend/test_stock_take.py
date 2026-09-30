"""Self-check: Stock Take / Inventory Count audit trail (StockAdjustment).
POST /items/bulk-stock already applies the counted quantity —
this checks it now also logs exactly one row per item whose count actually
changed, none for an item sent back unchanged, and that the log reads back
oldest-first.

Run: backend/venv/Scripts/python.exe backend/test_stock_take.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.items import bulk_stock_update, item_stock_adjustments

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

nails = models.Item(name="Nails", price=20.0, stock_quantity=100)
screws = models.Item(name="Screws", price=10.0, stock_quantity=50)
db.add_all([nails, screws])
db.commit()

bulk_stock_update(
    updates=[
        schemas.BulkStockUpdate(item_id=nails.id, stock_quantity=97),
        schemas.BulkStockUpdate(item_id=screws.id, stock_quantity=50),
    ],
    db=db,
)
db.refresh(nails)
db.refresh(screws)
assert nails.stock_quantity == 97
assert screws.stock_quantity == 50

nails_log = item_stock_adjustments(item_id=nails.id, db=db)
assert len(nails_log) == 1, f"expected exactly one adjustment row: {nails_log}"
assert nails_log[0].previous_quantity == 100
assert nails_log[0].new_quantity == 97

screws_log = item_stock_adjustments(item_id=screws.id, db=db)
assert screws_log == [], "an unchanged count must not write an adjustment row"

bulk_stock_update(
    updates=[schemas.BulkStockUpdate(item_id=nails.id, stock_quantity=95)],
    db=db,
)
nails_log = item_stock_adjustments(item_id=nails.id, db=db)
assert len(nails_log) == 2
assert nails_log[0].new_quantity == 97 and nails_log[1].new_quantity == 95, \
    "log must read back oldest-first"
assert nails_log[1].previous_quantity == 97, "second entry's previous must chain from the first's new"

from routers.items import reset_price_history, reset_stock_adjustments, item_price_history

bulk_stock_update(
    updates=[schemas.BulkStockUpdate(item_id=screws.id, stock_quantity=40)], db=db,
)
db.add_all([
    models.ItemPriceHistory(item_id=nails.id, price=20.0),
    models.ItemPriceHistory(item_id=screws.id, price=10.0),
])
db.commit()

assert reset_stock_adjustments(item_id=nails.id, db=db) == {"deleted": 2}
assert item_stock_adjustments(item_id=nails.id, db=db) == []
assert len(item_stock_adjustments(item_id=screws.id, db=db)) == 1, "reset must only touch that item"
db.refresh(nails)
assert nails.stock_quantity == 95, "reset clears history only, never the stock"

assert reset_price_history(item_id=nails.id, db=db) == {"deleted": 1}
assert item_price_history(item_id=nails.id, db=db) == []
assert len(item_price_history(item_id=screws.id, db=db)) == 1
assert nails.price == 20.0, "reset clears history only, never the price"

from fastapi import HTTPException

from routers.items import (
    create_item, edit_item, edit_price_entry, edit_stock_entry, price_history_pdf,
    remove_price_entry, remove_stock_entry, stock_history_pdf,
)


class _Req:
    def __init__(self, **claims):
        self.scope = {"user": claims}


boss = _Req(email="boss@shop.pk", name="Boss", admin=True)
clerk = _Req(email="clerk@shop.pk", name="Clerk")

# who changed the price, and a note on a stock change
pipe = create_item(schemas.ItemCreate(name="Pipe", price=100.0, cost_price=60.0), db=db, request=boss)
edit_item(pipe.id, schemas.ItemCreate(name="Pipe", price=120.0, cost_price=60.0), db=db, request=clerk)
prices = item_price_history(item_id=pipe.id, db=db)
assert [p.created_by_name for p in prices] == ["Boss", "Clerk"], prices

bulk_stock_update(
    updates=[schemas.BulkStockUpdate(item_id=pipe.id, stock_quantity=7, note="  recount  ")], db=db, request=boss,
)
bulk_stock_update(updates=[schemas.BulkStockUpdate(item_id=pipe.id, stock_quantity=9, note="x" * 300)], db=db)
bulk_stock_update(updates=[schemas.BulkStockUpdate(item_id=pipe.id, stock_quantity=8, note="   ")], db=db)
log = item_stock_adjustments(item_id=pipe.id, db=db)
assert [e.note for e in log] == ["recount", "x" * 200, None], [e.note for e in log]
assert log[0].created_by_name == "Boss"

# one entry: edit and remove touch only the record, and only for managers
for bad in (lambda: remove_stock_entry(pipe.id, log[0].id, db=db, request=clerk),
            lambda: edit_stock_entry(pipe.id, log[0].id, schemas.StockAdjustmentEdit(previous_quantity=1, new_quantity=2), db=db, request=clerk),
            lambda: remove_price_entry(pipe.id, prices[0].id, db=db, request=clerk),
            lambda: edit_price_entry(pipe.id, prices[0].id, schemas.PriceHistoryEdit(price=1), db=db, request=clerk)):
    try:
        bad()
        raise SystemExit("a non-manager changed history")
    except HTTPException as e:
        assert e.status_code == 403, e.status_code

fixed = edit_stock_entry(pipe.id, log[0].id, schemas.StockAdjustmentEdit(previous_quantity=1, new_quantity=2, note=" damaged "), db=db, request=boss)
assert (fixed.previous_quantity, fixed.new_quantity, fixed.note) == (1, 2, "damaged")
fixed_price = edit_price_entry(pipe.id, prices[1].id, schemas.PriceHistoryEdit(price=130.0, cost_price=None), db=db, request=boss)
assert (fixed_price.price, fixed_price.cost_price) == (130.0, None)
db.refresh(pipe)
assert pipe.stock_quantity == 8 and pipe.price == 120.0, "editing history never changes the item itself"

for bad in (lambda: edit_price_entry(pipe.id, prices[0].id, schemas.PriceHistoryEdit(price=-1), db=db, request=boss),
            lambda: edit_price_entry(pipe.id, prices[0].id, schemas.PriceHistoryEdit(price=float("nan")), db=db, request=boss),
            lambda: edit_stock_entry(pipe.id, log[0].id, schemas.StockAdjustmentEdit(previous_quantity=float("inf"), new_quantity=1), db=db, request=boss),
            lambda: remove_stock_entry(nails.id, log[0].id, db=db, request=boss)):
    try:
        bad()
        raise SystemExit("expected a 404/422")
    except HTTPException as e:
        assert e.status_code in (404, 422), e.status_code

assert remove_stock_entry(pipe.id, log[1].id, db=db, request=boss) == {"deleted": 1}
assert remove_price_entry(pipe.id, prices[0].id, db=db, request=boss) == {"deleted": 1}
assert len(item_stock_adjustments(item_id=pipe.id, db=db)) == 2 and len(item_price_history(item_id=pipe.id, db=db)) == 1
db.refresh(pipe)
assert pipe.stock_quantity == 8, "removing an entry never changes the item's stock"

# the PDFs render in every kind of language, with and without entries
import utils.name_translate as _names

_names.mapping = lambda lang, pairs: {}  # no translation database in this in-memory test
for lang in (None, "en", "sd", "ur", "hi", "zh"):
    for fn in (price_history_pdf, stock_history_pdf):
        for item_id in (pipe.id, screws.id):
            r = fn(item_id, language=lang, db=db)
            assert r.body.startswith(b"%PDF") and r.media_type == "application/pdf", (lang, fn.__name__)
try:
    price_history_pdf("missing", language=None, db=db)
    raise SystemExit("expected 404")
except HTTPException as e:
    assert e.status_code == 404

print("OK — bulk-stock logs one StockAdjustment row per changed item, "
      "skips unchanged items, the per-item history reads back oldest-first, "
      "reset clears one item's stock/price history without touching the item, "
      "notes and authors are recorded, one entry can be edited or removed by a manager only, "
      "and both history PDFs render.")
