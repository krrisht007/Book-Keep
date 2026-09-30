"""One-time startup work: schema migrations, barcode backfill, settings seed.

Called from main.py through ensure_schema(), which runs them in order — but
only when the database's stored fingerprint doesn't match this code's.
"""
import hashlib
import pathlib

from sqlalchemy import inspect, text

from database import Base, SessionLocal, ddl_engine
import models
from config import SHOP_NAME, SHOP_ADDRESS, SHOP_PHONE, SHOP_STRN, DEFAULT_GST_RATE, DEFAULT_HSN
from utils.barcode import _ean13_check_digit, _next_barcode_counter

def _ensure_column(table: str, column: str, definition: str):
    """Add a column to an existing table if it's missing (idempotent).

    Uses SQLAlchemy's Inspector rather than a hand-rolled PRAGMA/
    information_schema query so this works unchanged on both SQLite (dev)
    and Postgres (production) — the Inspector already knows the right
    introspection call per dialect. Runs over ddl_engine (the direct,
    non-pooled connection) since DDL over a pooled PgBouncer connection is
    unreliable.
    """
    existing = {col["name"] for col in inspect(ddl_engine).get_columns(table)}
    if column not in existing:
        try:
            with ddl_engine.begin() as conn:
                conn.execute(text(f"ALTER TABLE {table} ADD COLUMN {definition}"))
        except Exception:
            # Two instances starting together can both see the column missing and
            # both add it; the loser's error is harmless once the column exists.
            if column not in {col["name"] for col in inspect(ddl_engine).get_columns(table)}:
                raise

def _ensure_renamed_column(table: str, old: str, new: str):
    """Rename a column in place if the old name exists and the new one
    doesn't yet (idempotent) — used for the gstin -> strn rename so existing
    Neon/SQLite data isn't dropped. `RENAME COLUMN` is valid identical syntax
    on SQLite >= 3.25 and Postgres, so no dialect branching is needed."""
    existing = {col["name"] for col in inspect(ddl_engine).get_columns(table)}
    if old in existing and new not in existing:
        with ddl_engine.begin() as conn:
            conn.execute(text(f"ALTER TABLE {table} RENAME COLUMN {old} TO {new}"))

def _run_migrations():
    """Add columns introduced after the database was first created."""
    _ensure_renamed_column("customers", "gstin", "strn")
    _ensure_renamed_column("suppliers", "gstin", "strn")

    _ensure_column("items", "hsn_code", "hsn_code TEXT")
    _ensure_column("items", "gst_rate", "gst_rate REAL")
    _ensure_column("bill_items", "hsn_code", "hsn_code TEXT")
    _ensure_column("bill_items", "gst_rate", "gst_rate REAL")
    _ensure_column("customers", "strn", "strn TEXT")
    _ensure_column("customers", "address", "address TEXT")
    _ensure_column("bills", "invoice_no", "invoice_no TEXT")
    _ensure_column("items", "barcode", "barcode TEXT")
    _ensure_column("items", "cost_price", "cost_price REAL")
    _ensure_column("bill_items", "cost_price", "cost_price REAL")
    _ensure_column("items", "image_url", "image_url TEXT")
    _ensure_column("bills", "is_quote", "is_quote BOOLEAN DEFAULT FALSE")
    _ensure_column("bills", "return_of_bill_id", "return_of_bill_id TEXT")
    _ensure_column("items", "preferred_supplier_id", "preferred_supplier_id TEXT")
    _ensure_column("expenses", "is_recurring", "is_recurring BOOLEAN DEFAULT FALSE")
    _ensure_column("expenses", "receipt_url", "receipt_url TEXT")
    _ensure_column("stock_adjustments", "note", "note TEXT")
    _ensure_column("item_price_history", "created_by_email", "created_by_email TEXT")
    _ensure_column("item_price_history", "created_by_name", "created_by_name TEXT")
    _ensure_column("purchases", "return_of_purchase_id", "return_of_purchase_id TEXT")
    _ensure_column("purchase_items", "hsn_code", "hsn_code TEXT")
    _ensure_column("purchase_items", "gst_rate", "gst_rate REAL")
    _ensure_column("bills", "is_voided", "is_voided BOOLEAN DEFAULT FALSE")
    _ensure_column("bills", "void_reason", "void_reason TEXT")
    _ensure_column("bills", "discount_amount", "discount_amount REAL DEFAULT 0")
    _ensure_column("customers", "email", "email TEXT")
    _ensure_column("bills", "created_by_email", "created_by_email TEXT")
    _ensure_column("bills", "created_by_name", "created_by_name TEXT")
    _ensure_column("purchases", "created_by_email", "created_by_email TEXT")
    _ensure_column("purchases", "created_by_name", "created_by_name TEXT")
    _ensure_column("purchases", "image_url", "image_url TEXT")
    _ensure_column("purchases", "raw_extraction", "raw_extraction TEXT")
    _ensure_column("purchases", "is_po", "is_po BOOLEAN DEFAULT FALSE")
    _ensure_column("customers", "price_tier", "price_tier TEXT DEFAULT 'retail'")
    _ensure_column("items", "wholesale_price", "wholesale_price REAL")
    _ensure_column("items", "contractor_price", "contractor_price REAL")

def _backfill_barcodes():
    """Give every item without a barcode a generated one (runs once at startup)."""
    with SessionLocal() as db:
        missing = (
            db.query(models.Item)
            .filter((models.Item.barcode == None) | (models.Item.barcode == ""))
            .all()
        )
        if not missing:
            return
        n = _next_barcode_counter(db)
        for it in missing:
            n += 1
            payload = f"20{n:010d}"
            it.barcode = payload + _ean13_check_digit(payload)
        db.commit()

def _rename_setting_key(old: str, new: str):
    """Rename a settings row's key in place if the old key exists and the new
    one doesn't yet (idempotent) — mirrors _ensure_renamed_column, but for a
    key/value row in the settings table rather than an actual DB column."""
    with SessionLocal() as db:
        new_row = db.query(models.Setting).filter(models.Setting.key == new).first()
        if new_row is not None:
            return
        old_row = db.query(models.Setting).filter(models.Setting.key == old).first()
        if old_row is not None:
            old_row.key = new
            db.commit()

def _seed_settings():
    """Seed the settings table from the .env fallbacks on first run."""
    _rename_setting_key("shop_gstin", "shop_strn")

    defaults = [
        ("shop_name", SHOP_NAME),
        ("shop_address", SHOP_ADDRESS),
        ("shop_phone", SHOP_PHONE),
        ("shop_strn", SHOP_STRN),
        ("default_gst_rate", DEFAULT_GST_RATE),
        ("default_hsn", DEFAULT_HSN),
    ]
    with SessionLocal() as db:
        for key, fallback in defaults:
            existing = (
                db.query(models.Setting).filter(models.Setting.key == key).first()
            )
            if existing is None:
                db.add(models.Setting(key=key, value=fallback or ""))
        db.commit()

def _schema_signature() -> str:
    """Fingerprint of every table/column the models declare plus this file's
    own source (which holds every migration). It changes whenever either does,
    so a stored match means this database is already up to date."""
    h = hashlib.sha256()
    for table in Base.metadata.sorted_tables:
        for col in table.columns:
            h.update(f"{table.name}.{col.name}:{col.type}\n".encode())
    h.update(pathlib.Path(__file__).read_bytes())
    return h.hexdigest()

def ensure_schema() -> bool:
    """create_all + migrations + barcode backfill + settings seed, skipped when
    the database already carries this code's fingerprint. Every cold start used
    to run all of it — about 130 read-only statements (measured) before the
    first request could be answered, which on Vercel showed up as ~10 s stalls
    after the server had been idle. Now a warm database costs one SELECT.
    Returns True when the full run happened.

    Anything that changes the schema or a migration changes the fingerprint, so
    the next start runs the full path once and stores the new one. A missing
    schema_meta table (fresh database, or the first start of this code) counts
    as a mismatch."""
    sig = _schema_signature()
    try:
        with SessionLocal() as db:
            row = db.get(models.SchemaMeta, "signature")
            if row is not None and row.value == sig:
                return False
    except Exception:
        pass
    for attempt in (1, 2):
        try:
            Base.metadata.create_all(bind=ddl_engine)
            break
        except Exception:
            if attempt == 2:
                raise
    _run_migrations()
    _backfill_barcodes()
    _seed_settings()
    try:
        with SessionLocal() as db:
            db.merge(models.SchemaMeta(key="signature", value=sig))
            db.commit()
    except Exception:
        pass
    return True
