"""In-house EAN-13 barcode generation for items without a scanned code."""
from sqlalchemy import text

import models
from database import IS_POSTGRES

def _ean13_check_digit(code12: str) -> str:
    """Standard EAN-13 check digit for a 12-digit payload (no leading or trailing '12' ambiguity — weights alternate 1,3,1,3... left to right)."""
    total = sum(int(d) * (3 if i % 2 else 1) for i, d in enumerate(code12))
    return str((10 - (total % 10)) % 10)

def _next_barcode_counter(db) -> int:
    """Highest counter already used by an in-house '20' code (0 if none)."""
    top = (
        db.query(models.Item.barcode)
        .filter(models.Item.barcode.like("20%"))
        .order_by(models.Item.barcode.desc())
        .first()
    )
    n = 0
    if top and top[0]:
        try:
            n = int(top[0][2:12])
        except ValueError:
            n = 0
    return n

def _next_barcode(db) -> str:
    """Generate the next in-house EAN-13 code: '20' + 10-digit counter + check digit.

    Increments a dedicated counter Setting row via a single atomic UPDATE
    rather than scanning existing items for the current max on every call:
    two items created concurrently (two staff, two devices) previously could
    both read the same max and get the identical barcode, making one of them
    invisible to GET /items/by-barcode/{barcode} (which only returns the
    first match). SQLite serializes concurrent writers on a single UPDATE
    statement, so each caller's increment sees the other's already-applied
    value.

    '20' is the GS1 prefix for restricted-distribution / in-store labels, so these
    codes are valid EAN-13 for the shop's own items without claiming a country prefix.
    """
    if db.query(models.Setting).filter(models.Setting.key == "last_barcode_counter").first() is None:
        seed = _next_barcode_counter(db)
        insert_ignore = (
            "INSERT INTO settings (key, value) VALUES ('last_barcode_counter', :seed) "
            "ON CONFLICT (key) DO NOTHING"
            if IS_POSTGRES
            else "INSERT OR IGNORE INTO settings (key, value) VALUES ('last_barcode_counter', :seed)"
        )
        db.execute(text(insert_ignore), {"seed": str(seed)})
    db.execute(
        text(
            "UPDATE settings SET value = CAST(CAST(COALESCE(value, '0') AS INTEGER) + 1 AS VARCHAR) "
            "WHERE key = 'last_barcode_counter'"
        )
    )
    db.commit()
    n = int(
        db.query(models.Setting).filter(models.Setting.key == "last_barcode_counter").first().value
    )
    payload = f"20{n:010d}"
    return payload + _ean13_check_digit(payload)
