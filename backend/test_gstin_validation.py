"""Self-check: STRN format validation, and that blank input preserves
whichever sentinel the caller uses ('' vs None) rather than picking one.

Run: backend/venv/Scripts/python.exe backend/test_gstin_validation.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from pydantic import ValidationError

import schemas

VALID = "1234567890123"

c = schemas.CustomerCreate(name="Test", strn=f" {VALID} ")
assert c.strn == VALID, c.strn

for bad in ["not-a-strn", "123456789012", "12345678901234", "123456789012a"]:
    try:
        schemas.CustomerCreate(name="Test", strn=bad)
        raise AssertionError(f"should have rejected: {bad!r}")
    except ValidationError:
        pass
    try:
        schemas.SupplierCreate(name="Test", strn=bad)
        raise AssertionError(f"should have rejected (supplier): {bad!r}")
    except ValidationError:
        pass

assert schemas.CustomerCreate(name="Test", strn=None).strn is None
assert schemas.SupplierCreate(name="Test", strn=None).strn is None
assert schemas.SettingsUpdate(shop_strn="").shop_strn == "", \
    "blank shop_strn must stay '' so PUT /settings can still clear it under exclude_none"
assert schemas.SettingsUpdate(shop_strn=None).shop_strn is None

assert schemas.SettingsUpdate(shop_strn=VALID).shop_strn == VALID
try:
    schemas.SettingsUpdate(shop_strn="garbage")
    raise AssertionError("should have rejected an invalid shop_strn")
except ValidationError:
    pass

print("OK — STRN format validated, blank sentinels preserved per caller's own convention.")
