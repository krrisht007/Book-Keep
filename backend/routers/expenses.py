import os
import uuid
from typing import List

from fastapi import APIRouter, Depends, File, HTTPException, Request, UploadFile
from sqlalchemy.orm import Session

import models
import schemas
from config import EXPENSE_RECEIPTS_DIR, ALLOWED_IMAGE_EXT
from database import get_db
from utils.permissions import require_manage
from utils.uploads import enforce_max_size, save_upload, delete_upload

router = APIRouter()

@router.post("/expenses", response_model=schemas.ExpenseOut)
def create_expense(expense: schemas.ExpenseCreate, db: Session = Depends(get_db)):
    db_expense = models.Expense(
        description=expense.description,
        amount=expense.amount,
        category=expense.category,
        date=expense.date,
        is_recurring=expense.is_recurring or False,
        receipt_url=expense.receipt_url,
    )
    db.add(db_expense)
    db.commit()
    db.refresh(db_expense)
    return db_expense

@router.get("/expenses", response_model=List[schemas.ExpenseOut])
def list_expenses(db: Session = Depends(get_db)):
    return db.query(models.Expense).order_by(models.Expense.date.desc()).all()

@router.post("/expenses/bulk", response_model=List[schemas.ExpenseOut])
def create_expenses_bulk(expenses: List[schemas.ExpenseCreate], db: Session = Depends(get_db)):
    """Bulk-create expenses (CSV import). Unlike items, there's no natural
    de-dupe key for an expense — every row becomes a new row."""
    result = []
    for expense in expenses:
        db_expense = models.Expense(
            description=expense.description,
            amount=expense.amount,
            category=expense.category,
            date=expense.date,
            is_recurring=expense.is_recurring or False,
        )
        db.add(db_expense)
        result.append(db_expense)
    db.commit()
    for e in result:
        db.refresh(e)
    return result

@router.put("/expenses/{expense_id}", response_model=schemas.ExpenseOut)
def edit_expense(expense_id: str, expense: schemas.ExpenseCreate, db: Session = Depends(get_db)):
    db_expense = db.query(models.Expense).filter(models.Expense.id == expense_id).first()
    if not db_expense:
        raise HTTPException(status_code=404, detail="Expense not found")
    db_expense.description = expense.description
    db_expense.amount = expense.amount
    db_expense.category = expense.category
    db_expense.date = expense.date
    db_expense.is_recurring = expense.is_recurring or False
    db_expense.receipt_url = expense.receipt_url or db_expense.receipt_url
    db.commit()
    db.refresh(db_expense)
    return db_expense

@router.post("/expenses/{expense_id}/receipt", response_model=schemas.ExpenseOut)
async def upload_expense_receipt(
    expense_id: str, file: UploadFile = File(...), db: Session = Depends(get_db)
):
    """Save a receipt photo for an expense and point its receipt_url at it."""
    db_expense = db.query(models.Expense).filter(models.Expense.id == expense_id).first()
    if not db_expense:
        raise HTTPException(status_code=404, detail="Expense not found")

    ext = os.path.splitext(file.filename or "")[1].lower()
    if ext not in ALLOWED_IMAGE_EXT:
        ext = ".jpg"

    contents = enforce_max_size(await file.read())
    url = save_upload(contents, "expenses", expense_id, ext, EXPENSE_RECEIPTS_DIR)

    db_expense.receipt_url = f"{url}?v={uuid.uuid4().hex[:8]}"
    db.commit()
    db.refresh(db_expense)
    return db_expense

@router.delete("/expenses/{expense_id}")
def delete_expense(expense_id: str, db: Session = Depends(get_db), request: Request = None):
    require_manage(request)
    db_expense = db.query(models.Expense).filter(models.Expense.id == expense_id).first()
    if not db_expense:
        raise HTTPException(status_code=404, detail="Expense not found")
    delete_upload("expenses", expense_id, EXPENSE_RECEIPTS_DIR)
    db.delete(db_expense)
    db.commit()
    return {"status": "deleted"}
