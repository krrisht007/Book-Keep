"""Self-check: concurrent invoice-number requests must not collide.

_next_invoice_no used to read the counter, compute +1 in Python, then write
it back — two requests overlapping mid-transaction (two staff printing
invoices around the same moment on the same backend) could both read the
same value and return the identical GST invoice number. Fixed via a single
atomic UPDATE statement, which SQLite serializes across connections.

Uses two real threads against a shared file-based DB (not two sequential
calls) because the bug is specifically about transaction *overlap* — a
purely sequential test can't demonstrate it either way.

Run: backend/venv/Scripts/python.exe backend/test_invoice_no_race.py
"""
import os
import sys
import tempfile
import threading

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from database import Base
from utils.gst import _next_invoice_no

db_path = tempfile.mktemp(suffix=".db")
engine = create_engine(
    f"sqlite:///{db_path}", connect_args={"check_same_thread": False, "timeout": 5}
)
Base.metadata.create_all(bind=engine)
Session = sessionmaker(bind=engine)

results = []
start = threading.Barrier(2)

def worker():
    db = Session()
    start.wait()
    results.append(_next_invoice_no(db))
    db.close()

threads = [threading.Thread(target=worker) for _ in range(2)]
for t in threads:
    t.start()
for t in threads:
    t.join()

assert len(results) == 2 and results[0] != results[1], \
    f"concurrent calls returned duplicate invoice numbers: {results}"

engine.dispose()
try:
    os.remove(db_path)
except OSError:
    pass

print(f"OK — concurrent invoice-number requests got distinct numbers: {results}")
