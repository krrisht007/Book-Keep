"""Full-database backup/restore and CSV exports."""
import os
import shutil
from datetime import datetime
from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException, UploadFile, File
from fastapi.responses import Response
from sqlalchemy.orm import Session

import models
import scheduled_backup
from database import get_db, engine, IS_POSTGRES
from config import DB_PATH, BACKUPS_DIR
from migrations import _seed_settings
from utils.csv_export import _csv_response
from utils.date_range import parse_date_range
from utils.pg_backup import dump_postgres, restore_postgres
from utils.uploads import enforce_max_size
from routers.admin import _require_admin
from routers.reports import stock_valuation, payables_aging

router = APIRouter()

@router.get("/backup")
def backup_database(_: dict = Depends(_require_admin)):
    """Download the entire database as a single file — a JSON table dump on
    Postgres (see utils/pg_backup.py), the raw SQLite file on the fallback."""
    if IS_POSTGRES:
        content = dump_postgres()
        filename = f"bookkeeper_backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        return Response(
            content=content,
            media_type="application/json",
            headers={"Content-Disposition": f'attachment; filename="{filename}"'},
        )
    if not os.path.exists(DB_PATH):
        raise HTTPException(status_code=404, detail="Database file not found")
    with open(DB_PATH, "rb") as f:
        content = f.read()
    filename = f"bookkeeper_backup_{datetime.now().strftime('%Y%m%d_%H%M%S')}.db"
    return Response(
        content=content,
        media_type="application/x-sqlite3",
        headers={"Content-Disposition": f'attachment; filename="{filename}"'},
    )

@router.post("/backup/restore")
def restore_database(file: UploadFile = File(...), _: dict = Depends(_require_admin)):
    """Replace the live database with an uploaded backup file."""
    data = enforce_max_size(file.file.read(), max_bytes=200 * 1024 * 1024)
    if IS_POSTGRES:
        os.makedirs(BACKUPS_DIR, exist_ok=True)
        pre_restore_path = os.path.join(
            BACKUPS_DIR, f"pre_restore_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        )
        with open(pre_restore_path, "wb") as f:
            f.write(dump_postgres())
        try:
            restore_postgres(data)
        except ValueError as e:
            raise HTTPException(status_code=400, detail=str(e))
        _seed_settings()
        return {"status": "ok", "message": "Database restored"}
    if not data or data[:16] != b"SQLite format 3\x00":
        raise HTTPException(
            status_code=400, detail="Not a valid SQLite database file"
        )
    if os.path.exists(DB_PATH):
        shutil.copyfile(DB_PATH, DB_PATH + ".pre_restore.bak")
    engine.dispose()
    with open(DB_PATH, "wb") as f:
        f.write(data)
    _seed_settings()
    return {"status": "ok", "message": "Database restored"}

@router.get("/backup/history")
def backup_history(_: dict = Depends(_require_admin)):
    """The automatic daily backups sitting on the server's own disk (see
    scheduled_backup.py) — visibility into what's already been captured
    without needing to download each one."""
    return {"backups": scheduled_backup.list_backups()}

@router.get("/export/customers.csv")
def export_customers(db: Session = Depends(get_db)):
    rows = [["id", "name", "phone", "credit_limit", "strn", "address", "created_at"]]
    for c in db.query(models.Customer).order_by(models.Customer.created_at).all():
        rows.append([
            c.id,
            c.name,
            c.phone or "",
            c.credit_limit if c.credit_limit is not None else "",
            c.strn or "",
            c.address or "",
            c.created_at,
        ])
    return _csv_response("customers.csv", rows)

@router.get("/export/bills.csv")
def export_bills(from_date: Optional[str] = None, to_date: Optional[str] = None, db: Session = Depends(get_db)):
    start, end = parse_date_range(from_date, to_date)
    query = db.query(models.Bill).order_by(models.Bill.date)
    if start is not None:
        query = query.filter(models.Bill.date >= start)
    if end is not None:
        query = query.filter(models.Bill.date < end)
    rows = [["id", "invoice_no", "customer_name", "date", "type", "amount", "amount_paid", "balance", "payment_status"]]
    for b in query.all():
        bill_type = (
            "quote" if b.is_quote
            else "return" if b.return_of_bill_id
            else "voided" if b.is_voided
            else "bill"
        )
        rows.append([
            b.id,
            b.invoice_no or "",
            b.customer.name if b.customer else "",
            b.date,
            bill_type,
            b.amount,
            b.amount_paid if b.amount_paid is not None else 0,
            (b.amount or 0) - (b.amount_paid or 0),
            b.payment_status or "",
        ])
    return _csv_response("bills.csv", rows)

@router.get("/export/items.csv")
def export_items(db: Session = Depends(get_db)):
    rows = [["id", "name", "unit", "price", "cost_price", "category", "hsn_code",
              "gst_rate", "barcode", "stock_quantity", "low_stock_threshold"]]
    for item in db.query(models.Item).order_by(models.Item.created_at).all():
        rows.append([
            item.id,
            item.name,
            item.unit or "",
            item.price,
            item.cost_price if item.cost_price is not None else "",
            item.category or "",
            item.hsn_code or "",
            item.gst_rate if item.gst_rate is not None else "",
            item.barcode or "",
            item.stock_quantity if item.stock_quantity is not None else 0,
            item.low_stock_threshold if item.low_stock_threshold is not None else "",
        ])
    return _csv_response("items.csv", rows)

@router.get("/export/expenses.csv")
def export_expenses(from_date: Optional[str] = None, to_date: Optional[str] = None, db: Session = Depends(get_db)):
    start, end = parse_date_range(from_date, to_date)
    query = db.query(models.Expense).order_by(models.Expense.date)
    if start is not None:
        query = query.filter(models.Expense.date >= start)
    if end is not None:
        query = query.filter(models.Expense.date < end)
    rows = [["id", "description", "amount", "category", "date", "is_recurring"]]
    for e in query.all():
        rows.append([
            e.id,
            e.description,
            e.amount,
            e.category or "",
            e.date,
            "yes" if e.is_recurring else "no",
        ])
    return _csv_response("expenses.csv", rows)

@router.get("/export/stock-valuation.csv")
def export_stock_valuation(db: Session = Depends(get_db)):
    """Reuses the /reports/stock-valuation aggregation so the CSV always
    matches what the in-app report shows."""
    data = stock_valuation(db)
    rows = [["item", "category", "unit", "quantity", "unit_cost", "value", "cost_is_estimated"]]
    for i in data["items"]:
        rows.append([
            i["name"],
            i["category"],
            i["unit"] or "",
            i["quantity"],
            i["unit_cost"],
            i["value"],
            "yes" if i["cost_is_estimated"] else "no",
        ])
    return _csv_response("stock_valuation.csv", rows)

@router.get("/export/supplier-dues.csv")
def export_supplier_dues(db: Session = Depends(get_db)):
    """Reuses the /reports/payables-aging aggregation so the CSV always
    matches what the in-app Supplier Dues Center shows."""
    rows = [["supplier", "phone", "outstanding", "days_old", "oldest_purchase_date", "bucket"]]
    for s in payables_aging(db):
        rows.append([
            s["supplier_name"],
            s["phone"],
            s["outstanding"],
            s["days_old"],
            s["oldest_purchase_date"],
            s["bucket"],
        ])
    return _csv_response("supplier_dues.csv", rows)
