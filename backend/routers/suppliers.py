from typing import List

from fastapi import APIRouter, Depends, HTTPException, Request
from fastapi.responses import Response
from sqlalchemy.orm import Session

import models
import schemas
from database import get_db
from utils.settings import _get_settings
from utils.pdf_ledger import _build_supplier_ledger_pdf
from utils.activity_log import log_activity
from utils.permissions import require_manage

router = APIRouter()

@router.post("/suppliers", response_model=schemas.SupplierOut)
def create_supplier(supplier: schemas.SupplierCreate, db: Session = Depends(get_db)):
    db_supplier = models.Supplier(
        name=supplier.name,
        phone=supplier.phone,
        strn=supplier.strn,
        address=supplier.address,
    )
    db.add(db_supplier)
    db.commit()
    db.refresh(db_supplier)
    return db_supplier

@router.get("/suppliers", response_model=List[schemas.SupplierOut])
def list_suppliers(db: Session = Depends(get_db)):
    return db.query(models.Supplier).order_by(models.Supplier.name).all()

@router.post("/suppliers/bulk", response_model=List[schemas.SupplierOut])
def create_suppliers_bulk(suppliers: List[schemas.SupplierCreate], db: Session = Depends(get_db)):
    """Bulk-create suppliers (CSV import). Unlike items, there's no natural
    de-dupe key for a supplier — every row becomes a new row, same
    reasoning as expenses.py's create_expenses_bulk."""
    result = []
    for supplier in suppliers:
        db_supplier = models.Supplier(
            name=supplier.name,
            phone=supplier.phone,
            strn=supplier.strn,
            address=supplier.address,
        )
        db.add(db_supplier)
        result.append(db_supplier)
    db.commit()
    for s in result:
        db.refresh(s)
    return result

@router.put("/suppliers/{supplier_id}", response_model=schemas.SupplierOut)
def edit_supplier(supplier_id: str, supplier: schemas.SupplierCreate, db: Session = Depends(get_db)):
    db_supplier = db.query(models.Supplier).filter(models.Supplier.id == supplier_id).first()
    if not db_supplier:
        raise HTTPException(status_code=404, detail="Supplier not found")
    db_supplier.name = supplier.name
    db_supplier.phone = supplier.phone
    db_supplier.strn = supplier.strn
    db_supplier.address = supplier.address
    db.commit()
    db.refresh(db_supplier)
    return db_supplier

@router.delete("/suppliers/{supplier_id}")
def delete_supplier(supplier_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db_supplier = db.query(models.Supplier).filter(models.Supplier.id == supplier_id).first()
    if not db_supplier:
        raise HTTPException(status_code=404, detail="Supplier not found")
    supplier_name = db_supplier.name
    for purchase in (
        db.query(models.Purchase)
        .filter(models.Purchase.supplier_id == supplier_id)
        .all()
    ):
        sign = -1 if purchase.return_of_purchase_id else 1
        for li in purchase.line_items:
            if li.item_id:
                catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                if catalog_item:
                    catalog_item.stock_quantity -= sign * li.quantity
        db.query(models.PurchaseItem).filter(models.PurchaseItem.purchase_id == purchase.id).delete()
    db.query(models.Purchase).filter(models.Purchase.supplier_id == supplier_id).delete()
    db.query(models.Item).filter(models.Item.preferred_supplier_id == supplier_id).update(
        {"preferred_supplier_id": None}
    )
    db.delete(db_supplier)
    db.commit()
    log_activity(db, request, "delete_supplier", f"{supplier_name} deleted")
    return {"status": "deleted"}

@router.get("/suppliers/{supplier_id}/purchases", response_model=List[schemas.PurchaseOut])
def get_supplier_purchases(supplier_id: str, db: Session = Depends(get_db)):
    return (
        db.query(models.Purchase)
        .filter(models.Purchase.supplier_id == supplier_id)
        .order_by(models.Purchase.date.desc())
        .all()
    )

@router.get("/suppliers/{supplier_id}/ledger")
def get_supplier_ledger(supplier_id: str, db: Session = Depends(get_db), language: str | None = None):
    supplier = db.query(models.Supplier).filter(models.Supplier.id == supplier_id).first()
    if not supplier:
        raise HTTPException(status_code=404, detail="Supplier not found")

    purchases = (
        db.query(models.Purchase)
        .filter(
            models.Purchase.supplier_id == supplier_id,
            models.Purchase.is_po == False,  # noqa: E712
        )
        .order_by(models.Purchase.date)
        .all()
    )
    safe_name = (
        "".join(ch if ch.isascii() and ch.isalnum() else "_" for ch in supplier.name)[:30]
        or "supplier"
    )
    pdf_bytes = bytes(_build_supplier_ledger_pdf(supplier, purchases, _get_settings(db), language))
    return Response(
        content=pdf_bytes,
        media_type="application/pdf",
        headers={"Content-Disposition": f'attachment; filename="supplier_ledger_{safe_name}.pdf"'},
    )
