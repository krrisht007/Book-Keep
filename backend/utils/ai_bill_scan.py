"""AI Bill Scanner: reads a photo of a handwritten bill or supplier purchase
invoice (Sindhi, Urdu, or English script, in any mix) and extracts a
customer/supplier name + line items, then suggests which existing
customer/supplier/catalog item each one matches.

Read-only — never writes a Customer/Supplier/Bill/Purchase itself. POST
/bills/scan and POST /purchases/scan (bills.py/purchases.py) return this
extraction for the app's review screen; the user's actual save still goes
through the normal POST/PUT /bills/v2 or /purchases path, same as anything
typed in by hand.

Uses Google Gemini (free tier) for the actual vision extraction.
"""
import base64
import difflib
import json
from typing import Optional

import models
from config import GEMINI_API_KEY, GEMINI_TEXT_MODELS
from utils import gemini
from utils.gemini import AiScanNotConfigured

_FUZZY_MATCH_CUTOFF = 0.72

_MEDIA_TYPES = {
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".png": "image/png",
    ".webp": "image/webp",
}

_IS_DOCUMENT_FIELD = {
    "type": "boolean",
    "description": (
        "True ONLY if the photo really shows a bill, invoice, receipt or "
        "delivery challan (handwritten or printed) with items on it. False "
        "for anything else — a watch, a person, a screenshot, a blank page, a "
        "product photo, scenery. When false, leave every other field empty."
    ),
}

_BILL_SCHEMA = {
    "type": "object",
    "properties": {
        "is_document": _IS_DOCUMENT_FIELD,
        "customer_name": {
            "type": "string",
            "description": (
                "The customer's name as written on the bill. If written in "
                "Urdu or Sindhi script, transliterate it into Latin/Roman "
                "script by pronunciation (e.g. محمد -> "
                "'Muhammad'), don't translate it. Empty string if no name "
                "is written anywhere on the bill."
            ),
        },
        "date": {
            "type": ["string", "null"],
            "description": "Date on the bill as ISO 8601 (YYYY-MM-DD), or null if none is written or it's illegible.",
        },
        "line_items": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "item_name": {
                        "type": "string",
                        "description": "The item/product name, translated to English if it's a generic description; keep brand/proper nouns as written.",
                    },
                    "quantity": {"type": "number"},
                    "unit_price": {"type": "number"},
                },
                "required": ["item_name", "quantity", "unit_price"],
            },
        },
        "notes": {
            "type": "string",
            "description": "Anything illegible, ambiguous, or uncertain that the person reviewing this should double check. Empty string if nothing stood out.",
        },
    },
    "required": ["is_document", "customer_name", "line_items", "notes"],
}

_NOT_A_BILL_RULE = (
    "FIRST decide whether the photo actually shows a bill, invoice, receipt or "
    "delivery challan. If it shows anything else (an object, a person, a "
    "screenshot, a blank page), set is_document to false, leave the other "
    "fields empty, and do not invent a name or items. "
)

_PROMPT = _NOT_A_BILL_RULE + (
    "This should be a photo of a handwritten shop bill from a hardware store. It may "
    "be written in Sindhi, Urdu, English, or a mix of these. Read it as "
    "carefully as you can and return the fields defined by the schema. If the "
    "handwriting is unclear on a specific amount or item, make your best "
    "reading but mention it in `notes` rather than silently guessing."
)

_PURCHASE_SCHEMA = {
    "type": "object",
    "properties": {
        "is_document": _IS_DOCUMENT_FIELD,
        "supplier_name": {
            "type": "string",
            "description": (
                "The supplier/vendor's name as written on the invoice — "
                "who the goods were bought FROM, not the shop receiving "
                "them. If written in Urdu or Sindhi script, transliterate "
                "it into Latin/Roman script by pronunciation, don't "
                "translate it. Empty string if no supplier name is "
                "legible anywhere on the invoice."
            ),
        },
        "date": {
            "type": ["string", "null"],
            "description": "Date on the invoice as ISO 8601 (YYYY-MM-DD), or null if none is written or it's illegible.",
        },
        "line_items": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "item_name": {
                        "type": "string",
                        "description": "The item/product name, translated to English if it's a generic description; keep brand/proper nouns as written.",
                    },
                    "quantity": {"type": "number"},
                    "unit_price": {
                        "type": "number",
                        "description": "Cost per unit paid to the supplier (not a resale/selling price).",
                    },
                },
                "required": ["item_name", "quantity", "unit_price"],
            },
        },
        "notes": {
            "type": "string",
            "description": "Anything illegible, ambiguous, or uncertain that the person reviewing this should double check. Empty string if nothing stood out.",
        },
    },
    "required": ["is_document", "supplier_name", "line_items", "notes"],
}

_PURCHASE_PROMPT = _NOT_A_BILL_RULE + (
    "This should be a photo of a supplier's purchase invoice or delivery challan "
    "for a hardware store — goods coming INTO the shop, not a sale to a "
    "customer. It may be written in Sindhi, Urdu, English, or a mix of "
    "these, by hand or printed. Read it as carefully as you can and return "
    "the fields defined by the schema. If the handwriting is unclear on a "
    "specific amount or item, make your best reading but mention it in "
    "`notes` rather than silently guessing."
)

class NotADocument(Exception):
    """The photo isn't a bill/invoice (or nothing could be read from it).
    Routers turn this into a 422 with detail "not_a_bill" so the app can show
    a translated message instead of opening the review / new-customer flow."""

def ensure_document(extracted: dict) -> dict:
    if not extracted.get("is_document") or not extracted.get("line_items"):
        raise NotADocument("The photo doesn't look like a bill or invoice.")
    return extracted

def _extract(image_bytes: bytes, ext: str, schema: dict, prompt: str) -> dict:
    if not GEMINI_API_KEY:
        raise AiScanNotConfigured(
            "AI bill scanning isn't set up — GEMINI_API_KEY is missing from backend/.env. "
            "Get a free key at https://aistudio.google.com/apikey"
        )
    body = {
        "contents": [{"parts": [
            {"inlineData": {
                "mimeType": _MEDIA_TYPES.get(ext, "image/jpeg"),
                "data": base64.b64encode(image_bytes).decode(),
            }},
            {"text": prompt},
        ]}],
        "generationConfig": {"responseMimeType": "application/json", "responseJsonSchema": schema},
    }
    data = gemini.post_any(GEMINI_API_KEY, GEMINI_TEXT_MODELS, body, 90).json()
    try:
        text = "".join(p.get("text", "") for p in data["candidates"][0]["content"]["parts"]).strip()
    except (KeyError, IndexError):
        text = ""
    if not text:
        raise ValueError("AI scan returned no result")
    return json.loads(text)

def extract_bill(image_bytes: bytes, ext: str) -> dict:
    """Sends the photo to Gemini and returns the raw extracted fields
    (customer_name, date, line_items, notes) — no matching against the DB
    yet, see match_by_name/match_item for that."""
    return ensure_document(_extract(image_bytes, ext, _BILL_SCHEMA, _PROMPT))

def extract_purchase(image_bytes: bytes, ext: str) -> dict:
    """Same as extract_bill, for a supplier purchase invoice — returns
    supplier_name/date/line_items/notes instead of customer_name."""
    return ensure_document(_extract(image_bytes, ext, _PURCHASE_SCHEMA, _PURCHASE_PROMPT))

def _normalize(name: str) -> str:
    return " ".join(name.strip().lower().split())

def match_by_name(name: str, candidates: list) -> dict:
    """Matches a scanned name (customer or supplier — anything with .id/.name)
    against existing records. Exact (case/whitespace-insensitive) match wins
    outright. Otherwise the single closest fuzzy match, if any clears the
    cutoff — offered as a suggestion for the user to confirm, never
    auto-applied, so spelling variants across scripts don't quietly spawn
    duplicate customers/suppliers."""
    if not name.strip():
        return {"exact": None, "suggestion": None}
    target = _normalize(name)
    for c in candidates:
        if _normalize(c.name) == target:
            return {"exact": {"id": c.id, "name": c.name}, "suggestion": None}

    best = None
    best_score = 0.0
    for c in candidates:
        score = difflib.SequenceMatcher(None, target, _normalize(c.name)).ratio()
        if score > best_score:
            best, best_score = c, score
    if best and best_score >= _FUZZY_MATCH_CUTOFF:
        return {
            "exact": None,
            "suggestion": {"id": best.id, "name": best.name, "score": round(best_score, 2)},
        }
    return {"exact": None, "suggestion": None}

def match_item(name: str, items: list[models.Item]) -> Optional[dict]:
    """Same idea as match_by_name, but items are matched silently (no
    separate confirm step) — an unmatched item just stays a free-text line
    with no catalog link, which the review screen already handles fine."""
    if not name.strip():
        return None
    target = _normalize(name)
    for it in items:
        if _normalize(it.name) == target:
            return {"id": it.id, "name": it.name}
    best: Optional[models.Item] = None
    best_score = 0.0
    for it in items:
        score = difflib.SequenceMatcher(None, target, _normalize(it.name)).ratio()
        if score > best_score:
            best, best_score = it, score
    if best and best_score >= _FUZZY_MATCH_CUTOFF:
        return {"id": best.id, "name": best.name}
    return None
