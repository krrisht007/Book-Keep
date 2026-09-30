import json
import os
import uuid
from datetime import datetime

from fastapi import APIRouter, Depends, File, HTTPException, Request, UploadFile
from sqlalchemy.orm import Session

import models
import schemas
from config import PURCHASE_SCANS_DIR, ALLOWED_IMAGE_EXT
from database import get_db
from utils.settings import _get_settings
from utils.gst import _resolve_gst_for_line
from utils.activity_log import _actor
from utils.permissions import require_manage
from utils.rate_limit import require_ai_rate_limit
from utils.uploads import enforce_max_size, save_upload
from utils import ai_bill_scan
from utils.gemini import AiScanNotConfigured, GeminiAPIError

router = APIRouter()

@router.post("/purchases/scan", response_model=schemas.PurchaseScanOut)
async def scan_purchase(file: UploadFile = File(...), db: Session = Depends(get_db), request: Request = None):
    """Reads a photo of a supplier purchase invoice and returns what it
    found, for the app's review screen — does NOT create a supplier or a
    purchase. Saving still goes through the normal POST /purchases (with
    supplier_id resolved by the client first, creating one via POST
    /suppliers if this suggests no match), same commit path as any typed
    purchase. Mirrors POST /bills/scan (bills.py) — see there for the
    fuller comments this trims to avoid repeating."""
    require_ai_rate_limit(request)
    ext = os.path.splitext(file.filename or "")[1].lower()
    if ext not in ALLOWED_IMAGE_EXT:
        ext = ".jpg"
    contents = enforce_max_size(await file.read())

    try:
        extracted = ai_bill_scan.extract_purchase(contents, ext)
    except AiScanNotConfigured as exc:
        raise HTTPException(status_code=503, detail=str(exc))
    except ai_bill_scan.NotADocument:
        raise HTTPException(status_code=422, detail="not_a_bill")
    except GeminiAPIError as exc:
        raise HTTPException(status_code=502, detail=f"AI scan failed: {exc}")

    photo_url = save_upload(contents, "purchases", uuid.uuid4().hex, ext, PURCHASE_SCANS_DIR, private=True)

    suppliers = db.query(models.Supplier).all()
    items = db.query(models.Item).all()
    supplier_match = ai_bill_scan.match_by_name(extracted.get("supplier_name", ""), suppliers)

    line_items = []
    for li in extracted.get("line_items", []):
        matched = ai_bill_scan.match_item(li.get("item_name", ""), items)
        line_items.append(schemas.ScanLineItem(
            item_id=matched["id"] if matched else None,
            item_name=li.get("item_name", ""),
            quantity=li.get("quantity", 0),
            unit_price=li.get("unit_price", 0),
        ))

    parsed_date = None
    if extracted.get("date"):
        try:
            parsed_date = datetime.fromisoformat(extracted["date"])
        except ValueError:
            pass

    return schemas.PurchaseScanOut(
        photo_url=photo_url,
        supplier_name=extracted.get("supplier_name", ""),
        supplier_exact=supplier_match["exact"],
        supplier_suggestion=supplier_match["suggestion"],
        date=parsed_date,
        line_items=line_items,
        notes=extracted.get("notes", ""),
        raw_extraction=json.dumps(extracted),
    )

@router.post("/purchases/{purchase_id}/convert", response_model=schemas.PurchaseOut)
def convert_po_to_purchase(purchase_id: str, db: Session = Depends(get_db), request: Request = None):
    """Marks a draft purchase order as received: adds stock and updates
    cost_price now (a PO never touched either — see create_purchase),
    clears the is_po flag. Mirrors bills.py's convert_quote_to_bill."""
    email, name = _actor(request)
    db_purchase = db.query(models.Purchase).filter(models.Purchase.id == purchase_id).first()
    if not db_purchase:
        raise HTTPException(status_code=404, detail="Purchase not found")
    if not db_purchase.is_po:
        raise HTTPException(status_code=400, detail="Purchase is not a draft order")

    defaults = _get_settings(db)
    for li in db_purchase.line_items:
        catalog_item = None
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item:
                catalog_item.stock_quantity += li.quantity
                if catalog_item.cost_price != li.unit_price:
                    catalog_item.cost_price = li.unit_price
                    db.add(models.ItemPriceHistory(
                        item_id=catalog_item.id, price=catalog_item.price,
                        cost_price=catalog_item.cost_price,
                        created_by_email=email, created_by_name=name,
                    ))
        if not li.hsn_code or li.gst_rate is None:
            hsn, gst = _resolve_gst_for_line(li, catalog_item, defaults)
            li.hsn_code = li.hsn_code or hsn
            li.gst_rate = li.gst_rate if li.gst_rate is not None else gst
        db.add(li)

    db_purchase.is_po = False
    db.commit()
    db.refresh(db_purchase)
    return db_purchase

@router.post("/purchases", response_model=schemas.PurchaseOut)
def create_purchase(purchase: schemas.PurchaseCreate, db: Session = Depends(get_db), request: Request = None):
    total = sum(li.quantity * li.unit_price for li in purchase.line_items)
    email, name = _actor(request)

    db_purchase = models.Purchase(
        supplier_id=purchase.supplier_id,
        amount=total,
        date=purchase.date,
        payment_status=purchase.payment_status,
        payment_method=purchase.payment_method,
        amount_paid=purchase.amount_paid,
        is_po=purchase.is_po,
        created_by_email=email,
        created_by_name=name,
        image_url=purchase.image_url,
        raw_extraction=purchase.raw_extraction,
    )
    db.add(db_purchase)
    db.commit()
    db.refresh(db_purchase)

    defaults = _get_settings(db)
    for li in purchase.line_items:
        catalog_item = None
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item and not purchase.is_po:
                if catalog_item.cost_price != li.unit_price:
                    catalog_item.stock_quantity += li.quantity
                    catalog_item.cost_price = li.unit_price
                    db.add(models.ItemPriceHistory(
                        item_id=catalog_item.id, price=catalog_item.price,
                        cost_price=catalog_item.cost_price,
                        created_by_email=email, created_by_name=name,
                    ))
                else:
                    catalog_item.stock_quantity += li.quantity

        hsn, gst = _resolve_gst_for_line(li, catalog_item, defaults)
        db_line = models.PurchaseItem(
            purchase_id=db_purchase.id,
            item_id=li.item_id,
            item_name=li.item_name,
            quantity=li.quantity,
            unit_price=li.unit_price,
            line_total=li.quantity * li.unit_price,
            hsn_code=hsn,
            gst_rate=gst,
        )
        db.add(db_line)

    db.commit()
    db.refresh(db_purchase)
    return db_purchase

@router.put("/purchases/{purchase_id}", response_model=schemas.PurchaseOut)
def edit_purchase(purchase_id: str, purchase: schemas.PurchaseCreate, db: Session = Depends(get_db), request: Request = None):
    email, name = _actor(request)
    db_purchase = db.query(models.Purchase).filter(models.Purchase.id == purchase_id).first()
    if not db_purchase:
        raise HTTPException(status_code=404, detail="Purchase not found")
    if db_purchase.return_of_purchase_id:
        raise HTTPException(status_code=400, detail="Cannot edit a return credit note.")
    if purchase.is_po and not db_purchase.is_po:
        raise HTTPException(
            status_code=400,
            detail="Cannot turn an existing purchase back into a draft order.",
        )

    if not db_purchase.is_po:
        for li in db_purchase.line_items:
            if li.item_id:
                catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                if catalog_item:
                    catalog_item.stock_quantity -= li.quantity

    db.query(models.PurchaseItem).filter(models.PurchaseItem.purchase_id == purchase_id).delete()

    total = sum(li.quantity * li.unit_price for li in purchase.line_items)
    db_purchase.amount = total
    db_purchase.date = purchase.date
    db_purchase.payment_status = purchase.payment_status
    db_purchase.payment_method = purchase.payment_method
    db_purchase.amount_paid = purchase.amount_paid
    db_purchase.is_po = purchase.is_po

    defaults = _get_settings(db)
    for li in purchase.line_items:
        catalog_item = None
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item and not purchase.is_po:
                if catalog_item.cost_price != li.unit_price:
                    catalog_item.stock_quantity += li.quantity
                    catalog_item.cost_price = li.unit_price
                    db.add(models.ItemPriceHistory(
                        item_id=catalog_item.id, price=catalog_item.price,
                        cost_price=catalog_item.cost_price,
                        created_by_email=email, created_by_name=name,
                    ))
                else:
                    catalog_item.stock_quantity += li.quantity

        hsn, gst = _resolve_gst_for_line(li, catalog_item, defaults)
        db_line = models.PurchaseItem(
            purchase_id=db_purchase.id,
            item_id=li.item_id,
            item_name=li.item_name,
            quantity=li.quantity,
            unit_price=li.unit_price,
            line_total=li.quantity * li.unit_price,
            hsn_code=hsn,
            gst_rate=gst,
        )
        db.add(db_line)

    db.commit()
    db.refresh(db_purchase)
    return db_purchase

@router.patch("/purchases/{purchase_id}", response_model=schemas.PurchaseOut)
def update_purchase(purchase_id: str, update: schemas.PurchaseUpdate, db: Session = Depends(get_db)):
    db_purchase = db.query(models.Purchase).filter(models.Purchase.id == purchase_id).first()
    if not db_purchase:
        raise HTTPException(status_code=404, detail="Purchase not found")
    if db_purchase.return_of_purchase_id:
        raise HTTPException(status_code=400, detail="Cannot update a return credit note's payment status.")
    if db_purchase.is_po:
        raise HTTPException(status_code=400, detail="Cannot update a draft purchase order's payment status.")

    if update.payment_status is not None:
        db_purchase.payment_status = update.payment_status
    if update.amount_paid is not None:
        db_purchase.amount_paid = update.amount_paid

    db.commit()
    db.refresh(db_purchase)
    return db_purchase

@router.delete("/purchases/{purchase_id}")
def delete_purchase(purchase_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db_purchase = db.query(models.Purchase).filter(models.Purchase.id == purchase_id).first()
    if not db_purchase:
        raise HTTPException(status_code=404, detail="Purchase not found")
    if not db_purchase.is_po:
        sign = -1 if db_purchase.return_of_purchase_id else 1
        for li in db_purchase.line_items:
            if li.item_id:
                catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                if catalog_item:
                    catalog_item.stock_quantity -= sign * li.quantity
    db.query(models.PurchaseItem).filter(models.PurchaseItem.purchase_id == purchase_id).delete()
    db.delete(db_purchase)
    db.commit()
    return {"status": "deleted"}

@router.post("/purchases/{purchase_id}/return", response_model=schemas.PurchaseOut)
def return_purchase(purchase_id: str, body: schemas.PurchaseReturnRequest | None = None, db: Session = Depends(get_db), request: Request = None):
    """Create a credit-note purchase that reverses `purchase_id`: removes
    stock for the returned line items (goods sent back to the supplier) and
    records a negative-amount purchase linked back to the original, so both
    stay in the ledger instead of the original just disappearing (unlike
    DELETE /purchases/{id}). Mirrors bills.py's return_bill.

    `body.line_items` picks which lines and how much of each go back; omit
    it (or send no body) to return everything at full quantity. A purchase
    can only be returned once — partial now, more later isn't supported;
    edit the purchase down first if a second return is needed.
    """
    require_manage(request)
    original = db.query(models.Purchase).filter(models.Purchase.id == purchase_id).first()
    if not original:
        raise HTTPException(status_code=404, detail="Purchase not found")
    if original.return_of_purchase_id:
        raise HTTPException(status_code=400, detail="Cannot return a credit note")
    if original.is_po:
        raise HTTPException(
            status_code=400,
            detail="Cannot return a draft purchase order — mark it received first.",
        )
    already = (
        db.query(models.Purchase)
        .filter(models.Purchase.return_of_purchase_id == purchase_id)
        .first()
    )
    if already:
        raise HTTPException(status_code=400, detail="This purchase has already been returned")

    requested_by_line = None
    if body and body.line_items is not None:
        requested_by_line = {li.purchase_item_id: li.quantity for li in body.line_items}

    to_return = []
    for li in original.line_items:
        if requested_by_line is None:
            qty = li.quantity
        else:
            qty = requested_by_line.get(li.id, 0)
            if qty < 0 or qty > li.quantity:
                raise HTTPException(
                    status_code=400,
                    detail=f"Invalid return quantity for {li.item_name}: must be between 0 and {li.quantity:g}",
                )
        if qty > 0:
            to_return.append((li, qty))

    if not to_return:
        raise HTTPException(status_code=400, detail="Nothing selected to return")

    credit_amount = sum(qty * li.unit_price for li, qty in to_return)

    credit = models.Purchase(
        supplier_id=original.supplier_id,
        amount=-credit_amount,
        date=datetime.utcnow(),
        payment_status="paid",
        payment_method=original.payment_method,
        amount_paid=0,
        return_of_purchase_id=original.id,
    )
    db.add(credit)
    db.commit()
    db.refresh(credit)

    for li, qty in to_return:
        if li.item_id:
            catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
            if catalog_item:
                catalog_item.stock_quantity -= qty
        db.add(models.PurchaseItem(
            purchase_id=credit.id,
            item_id=li.item_id,
            item_name=li.item_name,
            quantity=qty,
            unit_price=li.unit_price,
            line_total=-(qty * li.unit_price),
            hsn_code=li.hsn_code,
            gst_rate=li.gst_rate,
        ))

    db.commit()
    db.refresh(credit)
    return credit
