"""Self-check: deleting an item or expense must remove its uploaded
photo/receipt file, not leave it orphaned on disk forever (upload_item_image
and upload_expense_receipt already do this cleanup when *replacing* a file —
delete never did).

Run: backend/venv/Scripts/python.exe backend/test_delete_removes_upload.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from config import ITEM_IMAGES_DIR, EXPENSE_RECEIPTS_DIR
from routers.items import delete_item
from routers.expenses import delete_expense

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

item = models.Item(name="Nails", price=20.0, stock_quantity=10)
db.add(item)
db.commit()
os.makedirs(ITEM_IMAGES_DIR, exist_ok=True)
item_photo = os.path.join(ITEM_IMAGES_DIR, f"{item.id}.jpg")
with open(item_photo, "wb") as f:
    f.write(b"fake")
assert os.path.exists(item_photo)

delete_item(item_id=item.id, db=db)
assert not os.path.exists(item_photo), "deleting an item left its photo file behind"

expense = models.Expense(description="Rent", amount=1000.0, category="rent",
                          date=__import__("datetime").datetime.utcnow())
db.add(expense)
db.commit()
os.makedirs(EXPENSE_RECEIPTS_DIR, exist_ok=True)
receipt = os.path.join(EXPENSE_RECEIPTS_DIR, f"{expense.id}.jpg")
with open(receipt, "wb") as f:
    f.write(b"fake")
assert os.path.exists(receipt)

delete_expense(expense_id=expense.id, db=db)
assert not os.path.exists(receipt), "deleting an expense left its receipt file behind"

print("OK — deleting an item or expense removes its uploaded photo/receipt file.")
