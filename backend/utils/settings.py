"""Shop settings lookup, shared by routers and PDF/GST helpers."""
from sqlalchemy.orm import Session

import models
from config import (
    SHOP_NAME,
    SHOP_ADDRESS,
    SHOP_PHONE,
    SHOP_STRN,
    DEFAULT_GST_RATE,
    DEFAULT_HSN,
)


def _get_settings(db: Session) -> dict:
    """Return the shop settings, falling back to the .env defaults."""
    stored = {}
    for row in db.query(models.Setting).all():
        stored[row.key] = row.value
    return {
        "shop_name": stored.get("shop_name") or SHOP_NAME,
        "shop_address": stored.get("shop_address") or "",
        "shop_phone": stored.get("shop_phone") or "",
        "shop_strn": stored.get("shop_strn") or "",
        "default_gst_rate": float(stored.get("default_gst_rate") or DEFAULT_GST_RATE),
        "default_hsn": stored.get("default_hsn") or DEFAULT_HSN,
        "shop_logo_url": stored.get("shop_logo_url") or "",
        "upi_id": stored.get("upi_id") or "",
    }
