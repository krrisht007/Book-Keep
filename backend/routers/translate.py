"""POST /translate — item/customer/supplier/category names in the app's language
(see utils/name_translate.py)."""
from fastapi import APIRouter, Depends, HTTPException, Request
from pydantic import BaseModel, Field
from sqlalchemy.orm import Session

import models
from database import get_db
from utils import name_translate
from utils.rate_limit import require_translate_rate_limit

router = APIRouter()


class NameIn(BaseModel):
    kind: str
    text: str = Field(max_length=200)


class TranslateRequest(BaseModel):
    language: str
    items: list[NameIn] = Field(max_length=100)


@router.post("/translate")
def translate_names(body: TranslateRequest, db: Session = Depends(get_db), request: Request = None):
    require_translate_rate_limit(request)
    result = name_translate.translate(
        db, body.language, [(i.kind, i.text) for i in body.items], resolved_only=True
    )
    return {"translations": [{"kind": k, "text": t, "translated": v} for (k, t), v in result.items()]}


class OverrideRequest(BaseModel):
    language: str
    kind: str
    text: str = Field(max_length=200)
    translated: str = Field(max_length=300)


@router.put("/translate/override")
def set_override(body: OverrideRequest, db: Session = Depends(get_db), request: Request = None):
    """The shop's own wording of its name or address in one language, replacing
    Gemini's rendering. An empty `translated` removes it, so Gemini's rendering
    comes back. Only the shop details can be overridden."""
    require_translate_rate_limit(request)
    code = name_translate.code_for(body.language)
    if code is None or body.kind not in ("shop", "address") or not body.text.strip():
        raise HTTPException(status_code=422, detail="Unsupported language, kind or text.")
    key = dict(lang=code, kind=body.kind, source=body.text.strip())
    row = db.get(models.NameTranslation, (code, body.kind, key["source"]))
    if not body.translated.strip():
        if row is not None:
            db.delete(row)
            db.commit()
        return {"translated": None}
    db.merge(models.NameTranslation(**key, target=body.translated.strip()))
    db.commit()
    return {"translated": body.translated.strip()}
