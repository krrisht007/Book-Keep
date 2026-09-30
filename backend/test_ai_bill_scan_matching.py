"""Self-check: customer/item name matching for the AI bill scanner
(utils/ai_bill_scan.py). Only the pure matching logic — the actual Gemini
vision call needs a real API key/network and isn't exercised here.

Run: backend/venv/Scripts/python.exe backend/test_ai_bill_scan_matching.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

import models
from utils import ai_bill_scan as scan

def customer(name, id="c1"):
    c = models.Customer(id=id, name=name)
    return c

def item(name, id="i1"):
    return models.Item(id=id, name=name, price=1)

customers = [customer("Muhammad Ali", "c1"), customer("Fatima Traders", "c2")]

result = scan.match_by_name("  muhammad ALI ", customers)
assert result["exact"] == {"id": "c1", "name": "Muhammad Ali"}, result
assert result["suggestion"] is None

result = scan.match_by_name("Mohammad Ali", customers)
assert result["exact"] is None, result
assert result["suggestion"]["id"] == "c1", result

result = scan.match_by_name("Totally Different Name", customers)
assert result["exact"] is None
assert result["suggestion"] is None

result = scan.match_by_name("", customers)
assert result["exact"] is None and result["suggestion"] is None

items = [item("Cement Bag 50kg", "i1"), item("PVC Pipe 1 inch", "i2")]
assert scan.match_item("cement bag 50kg", items) == {"id": "i1", "name": "Cement Bag 50kg"}
assert scan.match_item("Something Unrelated", items) is None
assert scan.match_item("", items) is None

print("OK — customer/item fuzzy matching behaves: exact wins, near-miss suggests, no-match stays empty.")
