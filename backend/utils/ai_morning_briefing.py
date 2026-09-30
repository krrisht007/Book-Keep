"""AI Morning Briefing: turns yesterday's structured business facts (sales,
collections, low stock, overdue payments, pending purchase orders) into a
short plain-English handover paragraph for the shop owner — see
routers/notifications.py's GET /notifications/morning-briefing, and
scheduled_notifications.py, which runs it automatically once a day.

Uses Google Gemini (free tier), same as utils/ai_bill_scan.py, so this
doesn't draw down the shop's paid Anthropic credit. Unlike that module (an
OCR read of a photo), this one only *summarizes* facts already computed
from the DB — the prompt forbids adding any number, name, or event not
present in those facts, so this can't invent a sale that didn't happen.
"""
import json

from config import GEMINI_API_KEY, GEMINI_TEXT_MODELS
from utils import gemini
from utils.gemini import AiScanNotConfigured

_SYSTEM = (
    "You write a short, warm morning handover for a hardware store owner, "
    "based ONLY on the facts given as JSON. Never invent a number, name, or "
    "event not present in those facts — if something is zero or empty, just "
    "don't mention it rather than making up detail. 2-4 sentences, plain "
    "language, no markdown, no greeting or sign-off — just the handover "
    "itself. Money is in Pakistani rupees: write amounts as \"Rs 1,234\", "
    "never with $ or any other currency symbol."
)

def generate_briefing(facts: dict, language: str | None = None) -> str:
    if not GEMINI_API_KEY:
        raise AiScanNotConfigured(
            "The morning briefing isn't set up — GEMINI_API_KEY is missing from backend/.env. "
            "Get a free key at https://aistudio.google.com/apikey"
        )
    body = {
        "systemInstruction": {"parts": [{"text": _SYSTEM + gemini.reply_language(language)}]},
        "contents": [{"parts": [{"text": json.dumps(facts)}]}],
        "generationConfig": {"maxOutputTokens": 1536, "thinkingConfig": {"thinkingBudget": 0}},
    }
    data = gemini.post_any(GEMINI_API_KEY, GEMINI_TEXT_MODELS, body, 45).json()
    try:
        parts = data["candidates"][0]["content"]["parts"]
    except (KeyError, IndexError):
        return ""
    return "".join(p.get("text", "") for p in parts).strip()
