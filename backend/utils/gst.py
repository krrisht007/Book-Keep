"""Sales-tax computation and invoice-numbering helpers.

Pakistan's FBR sales tax is a single flat rate per line — no state-derived
CGST/SGST/IGST split the way Indian GST has (that was the original
India-market template this module was built against).
"""
from datetime import datetime

from sqlalchemy import text
from sqlalchemy.orm import Session

import models
from database import IS_POSTGRES

def _gst_breakdown(gross: float, rate: float) -> dict:
    """Split a tax-inclusive price into taxable value and a single tax amount."""
    rate = float(rate or 0)
    taxable = round(gross / (1 + rate / 100.0), 2)
    tax = round(gross - taxable, 2)
    return {"taxable": taxable, "tax": tax, "rate": rate}

def _amount_in_words(amount: float) -> str:
    """Amount in words using Indian numbering (lakh/crore)."""
    num = int(round(amount))
    if num == 0:
        return "Zero Rupees Only"
    ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
            "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
            "Seventeen", "Eighteen", "Nineteen"]
    tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]

    def _two(n: int) -> str:
        if n < 20:
            return ones[n]
        return (tens[n // 10] + (" " + ones[n % 10] if n % 10 else "")).strip()

    crore, num = divmod(num, 10_000_000)
    lakh, num = divmod(num, 100_000)
    thousand, num = divmod(num, 1000)
    hundred, num = divmod(num, 100)

    parts = []
    if crore:
        parts.append(f"{_two(crore)} Crore")
    if lakh:
        parts.append(f"{_two(lakh)} Lakh")
    if thousand:
        parts.append(f"{_two(thousand)} Thousand")
    if hundred:
        parts.append(f"{_two(hundred)} Hundred")
    if num:
        parts.append(_two(num))
    return "Rupees " + " ".join(parts) + " Only"

def _financial_year(dt) -> str:
    """Financial year label, e.g. '26-27' (April 2026 – March 2027)."""
    if dt.month >= 4:
        return f"{dt.year % 100:02d}-{(dt.year + 1) % 100:02d}"
    return f"{(dt.year - 1) % 100:02d}-{dt.year % 100:02d}"

def _next_invoice_no(db: Session) -> str:
    """Return the next sequential invoice number for the current financial year.

    Increments via a single atomic UPDATE rather than read-then-write: two
    invoice PDFs requested at the same moment (two staff, two devices, same
    backend) previously could both read the same counter and return the
    identical GST invoice number. SQLite serializes concurrent writers on a
    single UPDATE statement, so each caller's increment is guaranteed to see
    the other's already-applied value.
    """
    fy = _financial_year(datetime.now())
    insert_ignore = (
        "INSERT INTO settings (key, value) VALUES ('last_invoice_no', '0') "
        "ON CONFLICT (key) DO NOTHING"
        if IS_POSTGRES
        else "INSERT OR IGNORE INTO settings (key, value) VALUES ('last_invoice_no', '0')"
    )
    db.execute(text(insert_ignore))
    db.execute(
        text(
            "UPDATE settings SET value = CAST(CAST(COALESCE(value, '0') AS INTEGER) + 1 AS VARCHAR) "
            "WHERE key = 'last_invoice_no'"
        )
    )
    db.commit()
    nxt = int(
        db.query(models.Setting).filter(models.Setting.key == "last_invoice_no").first().value
    )
    return f"INV-{fy}-{nxt:04d}"

def _get_invoice_no(db: Session, bill) -> str:
    """Return the bill's invoice number, assigning a sequential one on first use."""
    if bill.invoice_no:
        return bill.invoice_no
    bill.invoice_no = _next_invoice_no(db)
    db.add(bill)
    db.commit()
    return bill.invoice_no

def _resolve_gst_for_line(li, catalog_item, defaults: dict) -> tuple:
    """Resolve HSN + GST rate for a line item: explicit → catalog item → settings default."""
    hsn = (li.hsn_code or "").strip()
    gst = li.gst_rate
    if not hsn and catalog_item is not None:
        hsn = (catalog_item.hsn_code or "").strip()
    if gst is None and catalog_item is not None:
        gst = catalog_item.gst_rate
    if not hsn:
        hsn = defaults.get("default_hsn") or ""
    if gst is None:
        gst = defaults.get("default_gst_rate") or 0
    return hsn or None, gst

