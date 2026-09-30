import os
import uuid

from fastapi import APIRouter, Depends, File, UploadFile
from sqlalchemy.orm import Session

import models
import schemas
from config import UPLOADS_DIR, ALLOWED_IMAGE_EXT
from database import get_db
from utils.settings import _get_settings
from utils.uploads import enforce_max_size, save_upload

router = APIRouter()

@router.get("/settings")
def get_settings(db: Session = Depends(get_db)):
    return _get_settings(db)

@router.post("/settings/logo")
async def upload_shop_logo(file: UploadFile = File(...), db: Session = Depends(get_db)):
    """Save the shop logo shown on invoices/ledgers. Replaces any previous one."""
    ext = os.path.splitext(file.filename or "")[1].lower()
    if ext not in ALLOWED_IMAGE_EXT:
        ext = ".jpg"

    contents = enforce_max_size(await file.read())
    base_url = save_upload(contents, "", "shop_logo", ext, UPLOADS_DIR)

    url = f"{base_url}?v={uuid.uuid4().hex[:8]}"
    row = db.query(models.Setting).filter(models.Setting.key == "shop_logo_url").first()
    if row is None:
        db.add(models.Setting(key="shop_logo_url", value=url))
    else:
        row.value = url
    db.commit()
    return _get_settings(db)

@router.put("/settings")
def update_settings(update: schemas.SettingsUpdate, db: Session = Depends(get_db)):
    for key, value in update.model_dump(exclude_none=True).items():
        row = db.query(models.Setting).filter(models.Setting.key == key).first()
        if row is None:
            db.add(models.Setting(key=key, value=value))
        else:
            row.value = value
    db.commit()
    return _get_settings(db)
