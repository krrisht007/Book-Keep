"""Self-check: concurrent barcode generation must not collide, and must not
reuse counters already assigned to existing items.

_next_barcode used to scan MAX(Item.barcode) and add 1 on every call — two
items created concurrently (two staff, two devices) could both read the same
max and get the identical barcode, silently making one of them invisible to
GET /items/by-barcode/{barcode} (only the first match is ever returned).
Fixed via a dedicated counter Setting row incremented with a single atomic
UPDATE, self-seeded from the existing max on first use.

Run: backend/venv/Scripts/python.exe backend/test_barcode_race.py
"""
import os
import sys
import tempfile
import threading

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from utils.barcode import _ean13_check_digit, _next_barcode

def fresh_engine():
    db_path = tempfile.mktemp(suffix=".db")
    engine = create_engine(
        f"sqlite:///{db_path}", connect_args={"check_same_thread": False, "timeout": 5}
    )
    Base.metadata.create_all(bind=engine)
    return engine, db_path

engine, db_path = fresh_engine()
Session = sessionmaker(bind=engine)
results = []
start = threading.Barrier(2)

def worker():
    db = Session()
    start.wait()
    results.append(_next_barcode(db))
    db.close()

threads = [threading.Thread(target=worker) for _ in range(2)]
for t in threads:
    t.start()
for t in threads:
    t.join()

assert len(results) == 2 and results[0] != results[1], \
    f"concurrent calls returned duplicate barcodes: {results}"

engine.dispose()
try:
    os.remove(db_path)
except OSError:
    pass

engine, db_path = fresh_engine()
Session = sessionmaker(bind=engine)
db = Session()
existing_payload = f"20{5:010d}"
db.add(models.Item(
    name="Existing Item", price=1.0,
    barcode=existing_payload + _ean13_check_digit(existing_payload),
))
db.commit()

new_code = _next_barcode(db)
new_counter = int(new_code[2:12])
assert new_counter == 6, f"new barcode didn't continue past the existing max: counter={new_counter}"
assert new_code != existing_payload + _ean13_check_digit(existing_payload)

db.close()
engine.dispose()
try:
    os.remove(db_path)
except OSError:
    pass

print("OK — concurrent barcode generation is collision-free and continues past existing codes.")
