"""Environment-derived configuration shared across the backend.

Loaded once at import time from backend/.env (see main.py, which imports this
module first so load_dotenv() has already run).
"""
import os
import tempfile

for _k, _v in list(os.environ.items()):
    os.environ[_k] = _v.strip("﻿ \t\r\n")

SHOP_NAME = os.getenv("SHOP_NAME", "Hardware Store")
SHOP_ADDRESS = os.getenv("SHOP_ADDRESS", "")
SHOP_PHONE = os.getenv("SHOP_PHONE", "")
SHOP_STRN = os.getenv("SHOP_STRN", "")
DEFAULT_GST_RATE = float(os.getenv("DEFAULT_GST_RATE", "18"))
DEFAULT_HSN = os.getenv("DEFAULT_HSN", "")

FIREBASE_SERVICE_ACCOUNT_PATH = os.getenv("FIREBASE_SERVICE_ACCOUNT_PATH", "")
FIREBASE_SERVICE_ACCOUNT_JSON = os.getenv("FIREBASE_SERVICE_ACCOUNT_JSON", "")

FIREBASE_STORAGE_BUCKET = os.getenv("FIREBASE_STORAGE_BUCKET", "")

ADMIN_EMAILS = {
    e.strip().lower() for e in os.getenv("ADMIN_EMAILS", "").split(",") if e.strip()
}

DB_PATH = os.path.join(os.path.dirname(__file__), "bookkeeper.db")

_WRITABLE_ROOT = (
    tempfile.gettempdir() if os.getenv("VERCEL") else os.path.dirname(__file__)
)

API_DOCS = (
    {"docs_url": None, "redoc_url": None, "openapi_url": None}
    if os.getenv("VERCEL")
    else {}
)
CORS_ORIGINS = [] if os.getenv("VERCEL") else ["*"]

UPLOADS_DIR = os.path.join(_WRITABLE_ROOT, "uploads")
ITEM_IMAGES_DIR = os.path.join(UPLOADS_DIR, "items")
EXPENSE_RECEIPTS_DIR = os.path.join(UPLOADS_DIR, "expenses")
BILL_SCANS_DIR = os.path.join(UPLOADS_DIR, "bills")
PURCHASE_SCANS_DIR = os.path.join(UPLOADS_DIR, "purchases")

ALLOWED_IMAGE_EXT = {".jpg", ".jpeg", ".png", ".webp"}

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY", "")
GEMINI_MODEL = os.getenv("GEMINI_MODEL", "gemini-3.6-flash")
GEMINI_TEXT_MODELS = list(dict.fromkeys(
    [GEMINI_MODEL, *[m.strip() for m in os.getenv("GEMINI_FALLBACK_MODELS", "gemini-3.7-flash,gemini-3.5-flash").split(",") if m.strip()]]
))
GEMINI_TTS_MODEL = os.getenv("GEMINI_TTS_MODEL", "gemini-3.8-flash-tts")
GEMINI_TTS_FALLBACK_MODEL = os.getenv("GEMINI_TTS_FALLBACK_MODEL", "gemini-3.8-flash-lite-tts")
GEMINI_TTS_VOICE = os.getenv("GEMINI_TTS_VOICE", "Kore")

BACKUPS_DIR = os.path.join(_WRITABLE_ROOT, "backups")
BACKUPS_KEEP = 14
