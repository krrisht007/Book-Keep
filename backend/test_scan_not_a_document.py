"""Self-check: the bill scanner refuses photos that are not bills (a watch, a
blank page...) instead of inventing a customer. The Gemini call is mocked.

Run: backend/venv/Scripts/python.exe backend/test_scan_not_a_document.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from utils import ai_bill_scan as scan

ITEM = {"item_name": "Nails", "quantity": 2, "unit_price": 10}

def rejected(fake):
    scan._extract = lambda *a, **k: fake
    for fn in (scan.extract_bill, scan.extract_purchase):
        try:
            fn(b"x", ".jpg")
        except scan.NotADocument:
            continue
        return False
    return True

assert rejected({"is_document": False, "customer_name": "", "line_items": [], "notes": ""})
assert rejected({"is_document": True, "customer_name": "Ali", "line_items": [], "notes": ""})
assert rejected({"is_document": False, "customer_name": "Ali", "line_items": [ITEM], "notes": ""})
assert rejected({"customer_name": "Ali", "line_items": [ITEM], "notes": ""})

good = {"is_document": True, "customer_name": "Ali", "line_items": [ITEM], "notes": ""}
scan._extract = lambda *a, **k: good
assert scan.extract_bill(b"x", ".jpg") == good
print("OK")
