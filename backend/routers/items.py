import math
import os
import uuid
from typing import List

from fastapi import APIRouter, Depends, File, HTTPException, Request, UploadFile
from fastapi.responses import Response
from sqlalchemy import func
from sqlalchemy.orm import Session

import models
import schemas
from config import ITEM_IMAGES_DIR, ALLOWED_IMAGE_EXT
from database import get_db
from utils.barcode import _next_barcode
from utils.pdf_history import build_history_pdf
from utils.pdf_rate_card import _build_rate_card_pdf
from utils.settings import _get_settings
from utils.activity_log import _actor
from utils.permissions import require_manage
from utils.uploads import enforce_max_size, save_upload, delete_upload

router = APIRouter()

@router.get("/items/rate-card")
def rate_card(db: Session = Depends(get_db), language: str | None = None):
    """Shareable price-list PDF — every item, grouped by category. See
    utils/pdf_rate_card.py."""
    items = db.query(models.Item).order_by(models.Item.name).all()
    pdf_bytes = bytes(_build_rate_card_pdf(items, _get_settings(db), language))
    return Response(
        content=pdf_bytes,
        media_type="application/pdf",
        headers={"Content-Disposition": 'attachment; filename="rate_card.pdf"'},
    )

@router.post("/items", response_model=schemas.ItemOut)
def create_item(item: schemas.ItemCreate, db: Session = Depends(get_db), request: Request = None):
    db_item = models.Item(
        name=item.name,
        unit=item.unit,
        price=item.price,
        category=item.category,
        hsn_code=item.hsn_code,
        gst_rate=item.gst_rate,
        barcode=item.barcode or _next_barcode(db),
        image_url=item.image_url,
        cost_price=item.cost_price,
        wholesale_price=item.wholesale_price,
        contractor_price=item.contractor_price,
        stock_quantity=item.stock_quantity,
        low_stock_threshold=item.low_stock_threshold,
        preferred_supplier_id=item.preferred_supplier_id,
    )
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    email, name = _actor(request)
    db.add(models.ItemPriceHistory(
        item_id=db_item.id, price=db_item.price, cost_price=db_item.cost_price,
        created_by_email=email, created_by_name=name,
    ))
    db.commit()
    return db_item

@router.get("/items/{item_id}/price-history", response_model=List[schemas.ItemPriceHistoryOut])
def item_price_history(item_id: str, db: Session = Depends(get_db)):
    return (
        db.query(models.ItemPriceHistory)
        .filter(models.ItemPriceHistory.item_id == item_id)
        .order_by(models.ItemPriceHistory.changed_at)
        .all()
    )

@router.delete("/items/{item_id}/price-history")
def reset_price_history(item_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    n = db.query(models.ItemPriceHistory).filter(models.ItemPriceHistory.item_id == item_id).delete()
    db.commit()
    return {"deleted": n}

@router.get("/items/{item_id}/frequently-bought-with")
def frequently_bought_with(item_id: str, db: Session = Depends(get_db)):
    """Other items that show up on the same bills as this one most often —
    a plain co-occurrence count, no ML. Top 3, counted per bill (not per
    line) so one bill with 5 lines of the same item doesn't skew results."""
    bill_ids = [
        row[0]
        for row in db.query(models.BillItem.bill_id)
        .filter(models.BillItem.item_id == item_id)
        .distinct()
        .all()
    ]
    if not bill_ids:
        return []
    rows = (
        db.query(
            models.BillItem.item_id,
            models.BillItem.item_name,
            func.count(func.distinct(models.BillItem.bill_id)).label("cnt"),
        )
        .filter(
            models.BillItem.bill_id.in_(bill_ids),
            models.BillItem.item_id.isnot(None),
            models.BillItem.item_id != item_id,
        )
        .group_by(models.BillItem.item_id, models.BillItem.item_name)
        .order_by(func.count(func.distinct(models.BillItem.bill_id)).desc())
        .limit(3)
        .all()
    )
    return [{"item_id": r[0], "item_name": r[1], "count": r[2]} for r in rows]

@router.get("/items", response_model=List[schemas.ItemOut])
def list_items(db: Session = Depends(get_db)):
    return db.query(models.Item).order_by(models.Item.name).all()

@router.get("/items/by-barcode/{barcode}", response_model=schemas.ItemOut)
def item_by_barcode(barcode: str, db: Session = Depends(get_db)):
    item = (
        db.query(models.Item)
        .filter(models.Item.barcode == barcode.strip())
        .first()
    )
    if not item:
        raise HTTPException(status_code=404, detail="No item with this barcode")
    return item

@router.put("/items/{item_id}", response_model=schemas.ItemOut)
def edit_item(item_id: str, item: schemas.ItemCreate, db: Session = Depends(get_db), request: Request = None):
    db_item = db.query(models.Item).filter(models.Item.id == item_id).first()
    if not db_item:
        raise HTTPException(status_code=404, detail="Item not found")
    price_changed = (
        item.price != db_item.price or item.cost_price != db_item.cost_price
    )
    db_item.name = item.name
    db_item.unit = item.unit
    db_item.price = item.price
    db_item.category = item.category
    db_item.hsn_code = item.hsn_code
    db_item.gst_rate = item.gst_rate
    db_item.barcode = item.barcode or (db_item.barcode or _next_barcode(db))
    db_item.image_url = item.image_url
    db_item.cost_price = item.cost_price
    db_item.wholesale_price = item.wholesale_price
    db_item.contractor_price = item.contractor_price
    db_item.stock_quantity = item.stock_quantity
    db_item.low_stock_threshold = item.low_stock_threshold
    db_item.preferred_supplier_id = item.preferred_supplier_id
    db.commit()
    if price_changed:
        email, name = _actor(request)
        db.add(models.ItemPriceHistory(
            item_id=db_item.id, price=db_item.price, cost_price=db_item.cost_price,
            created_by_email=email, created_by_name=name,
        ))
        db.commit()
    db.refresh(db_item)
    return db_item

@router.post("/items/{item_id}/image", response_model=schemas.ItemOut)
async def upload_item_image(
    item_id: str, file: UploadFile = File(...), db: Session = Depends(get_db)
):
    """Save a photo for an item and point its image_url at the saved file."""
    db_item = db.query(models.Item).filter(models.Item.id == item_id).first()
    if not db_item:
        raise HTTPException(status_code=404, detail="Item not found")

    ext = os.path.splitext(file.filename or "")[1].lower()
    if ext not in ALLOWED_IMAGE_EXT:
        ext = ".jpg"

    contents = enforce_max_size(await file.read())
    url = save_upload(contents, "items", item_id, ext, ITEM_IMAGES_DIR)

    db_item.image_url = f"{url}?v={uuid.uuid4().hex[:8]}"
    db.commit()
    db.refresh(db_item)
    return db_item

@router.delete("/items/{item_id}")
def delete_item(item_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db_item = db.query(models.Item).filter(models.Item.id == item_id).first()
    if not db_item:
        raise HTTPException(status_code=404, detail="Item not found")
    delete_upload("items", item_id, ITEM_IMAGES_DIR)
    db.delete(db_item)
    db.commit()
    return {"status": "deleted"}

@router.post("/items/bulk", response_model=List[schemas.ItemOut])
def create_items_bulk(items: List[schemas.ItemCreate], db: Session = Depends(get_db)):
    result = []
    for item in items:
        existing = db.query(models.Item).filter(
            func.lower(models.Item.name) == item.name.strip().lower()
        ).first()

        if existing:
            for f in ("price", "unit", "category", "hsn_code", "gst_rate", "cost_price"):
                v = getattr(item, f)
                if f in item.model_fields_set and v is not None and not (f == "price" and v == 0):
                    setattr(existing, f, v)
            result.append(existing)
        else:
            db_item = models.Item(
                name=item.name,
                unit=item.unit,
                price=item.price,
                category=item.category,
                hsn_code=item.hsn_code,
                gst_rate=item.gst_rate,
                cost_price=item.cost_price,
                stock_quantity=item.stock_quantity,
                low_stock_threshold=item.low_stock_threshold,
            )
            db.add(db_item)
            result.append(db_item)

    db.commit()
    for item in result:
        db.refresh(item)
    return result

@router.post("/items/bulk-stock", response_model=List[schemas.ItemOut])
def bulk_stock_update(
    updates: List[schemas.BulkStockUpdate], db: Session = Depends(get_db), request: Request = None
):
    email, name = _actor(request)
    result = []
    for u in updates:
        db_item = db.query(models.Item).filter(models.Item.id == u.item_id).first()
        if not db_item:
            raise HTTPException(status_code=404, detail=f"Item not found: {u.item_id}")
        if u.stock_quantity != db_item.stock_quantity:
            db.add(models.StockAdjustment(
                item_id=db_item.id,
                previous_quantity=db_item.stock_quantity,
                new_quantity=u.stock_quantity,
                note=_clean_note(u.note),
                created_by_email=email,
                created_by_name=name,
            ))
        db_item.stock_quantity = u.stock_quantity
        result.append(db_item)
    db.commit()
    for item in result:
        db.refresh(item)
    return result

@router.get("/items/{item_id}/stock-adjustments", response_model=List[schemas.StockAdjustmentOut])
def item_stock_adjustments(item_id: str, db: Session = Depends(get_db)):
    return (
        db.query(models.StockAdjustment)
        .filter(models.StockAdjustment.item_id == item_id)
        .order_by(models.StockAdjustment.created_at)
        .all()
    )

@router.delete("/items/{item_id}/stock-adjustments")
def reset_stock_adjustments(item_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    n = db.query(models.StockAdjustment).filter(models.StockAdjustment.item_id == item_id).delete()
    db.commit()
    return {"deleted": n}

def _clean_note(note: str | None) -> str | None:
    return (note or "").strip()[:200] or None

def _finite(*values):
    if any(v is not None and not math.isfinite(v) for v in values):
        raise HTTPException(status_code=422, detail="Numbers must be finite.")

def _entry(db: Session, model, item_id: str, entry_id: str):
    row = db.query(model).filter(model.id == entry_id, model.item_id == item_id).first()
    if not row:
        raise HTTPException(status_code=404, detail="Entry not found")
    return row

@router.delete("/items/{item_id}/price-history/{entry_id}")
def remove_price_entry(item_id: str, entry_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db.delete(_entry(db, models.ItemPriceHistory, item_id, entry_id))
    db.commit()
    return {"deleted": 1}

@router.put("/items/{item_id}/price-history/{entry_id}", response_model=schemas.ItemPriceHistoryOut)
def edit_price_entry(item_id: str, entry_id: str, body: schemas.PriceHistoryEdit, db: Session = Depends(get_db), request: Request = None):
    """Corrects the record only — the item's real price is never touched."""
    require_manage(request)
    _finite(body.price, body.cost_price)
    if body.price < 0 or (body.cost_price is not None and body.cost_price < 0):
        raise HTTPException(status_code=422, detail="Prices cannot be negative.")
    row = _entry(db, models.ItemPriceHistory, item_id, entry_id)
    row.price, row.cost_price = body.price, body.cost_price
    db.commit()
    db.refresh(row)
    return row

@router.delete("/items/{item_id}/stock-adjustments/{entry_id}")
def remove_stock_entry(item_id: str, entry_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db.delete(_entry(db, models.StockAdjustment, item_id, entry_id))
    db.commit()
    return {"deleted": 1}

@router.put("/items/{item_id}/stock-adjustments/{entry_id}", response_model=schemas.StockAdjustmentOut)
def edit_stock_entry(item_id: str, entry_id: str, body: schemas.StockAdjustmentEdit, db: Session = Depends(get_db), request: Request = None):
    """Corrects the record only — the item's real stock is never touched."""
    require_manage(request)
    _finite(body.previous_quantity, body.new_quantity)
    row = _entry(db, models.StockAdjustment, item_id, entry_id)
    row.previous_quantity, row.new_quantity = body.previous_quantity, body.new_quantity
    row.note = _clean_note(body.note)
    db.commit()
    db.refresh(row)
    return row

def _history_pdf(db: Session, item_id: str, kind: str, language: str | None, tz: int) -> Response:
    item = db.query(models.Item).filter(models.Item.id == item_id).first()
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    model = models.ItemPriceHistory if kind == "price" else models.StockAdjustment
    order = models.ItemPriceHistory.changed_at if kind == "price" else models.StockAdjustment.created_at
    rows = db.query(model).filter(model.item_id == item_id).order_by(order.desc()).all()
    pdf = bytes(build_history_pdf(kind, item, rows, _get_settings(db), language, max(-840, min(840, tz))))
    return Response(
        content=pdf,
        media_type="application/pdf",
        headers={"Content-Disposition": f'attachment; filename="{kind}_history.pdf"'},
    )

@router.get("/items/{item_id}/price-history/pdf")
def price_history_pdf(item_id: str, language: str | None = None, tz: int = 0, db: Session = Depends(get_db)):
    """`tz` is the viewer's UTC offset in minutes, so the PDF shows the same times as the app."""
    return _history_pdf(db, item_id, "price", language, tz)

@router.get("/items/{item_id}/stock-adjustments/pdf")
def stock_history_pdf(item_id: str, language: str | None = None, tz: int = 0, db: Session = Depends(get_db)):
    return _history_pdf(db, item_id, "stock", language, tz)

@router.post("/items/dedupe")
def dedupe_items(db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    items = db.query(models.Item).order_by(models.Item.created_at).all()
    seen = {}
    removed = 0

    for item in items:
        key = item.name.strip().lower()
        if key in seen:
            original = seen[key]
            original.stock_quantity = (original.stock_quantity or 0) + (item.stock_quantity or 0)
            db.query(models.BillItem).filter(models.BillItem.item_id == item.id).update(
                {"item_id": original.id}
            )
            db.query(models.PurchaseItem).filter(models.PurchaseItem.item_id == item.id).update(
                {"item_id": original.id}
            )
            db.query(models.ItemPriceHistory).filter(models.ItemPriceHistory.item_id == item.id).update(
                {"item_id": original.id}
            )
            db.delete(item)
            removed += 1
        else:
            seen[key] = item

    db.commit()
    return {"status": "done", "duplicates_removed": removed}
