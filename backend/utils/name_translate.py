"""Item, customer, supplier and category names in the app's language.

The names are data the shop typed, so nothing in the app's own translation files
can cover them. Gemini renders each one in the selected language once; the result
is saved in the name_translations table, so a name is only ever sent to Gemini
once per language. The original name is never changed: the app and the PDFs only
show the saved rendering, and editing/searching still use what was typed.

A failed or unconfigured Gemini call is not an error here: the name simply stays
as typed and is tried again next time.
"""
import json
import re

from sqlalchemy.orm import Session

import models
from config import GEMINI_API_KEY, GEMINI_TEXT_MODELS
from utils import gemini

KINDS = ("item", "party", "category", "shop", "address", "unit")
_CHUNK = 100
_MAX_LEN = 120

# Measurement units inside item names ("Wire 2.5mm", "Cement 50 kg"). The model
# often leaves them as Latin symbols, so after translating, any Latin unit that
# follows a number is replaced from a short per-language word list (kind "unit",
# saved like every other name), which also repairs names saved before this.
_UNIT_WORDS = ("mm", "cm", "m", "kg", "g", "ml", "litre", "ft", "inch")
_UNIT_ALIASES = {
    "mm": "mm", "cm": "cm", "m": "m", "kg": "kg", "g": "g", "ml": "ml",
    "ltr": "litre", "litre": "litre", "litres": "litre", "liter": "litre", "liters": "litre", "l": "litre", "L": "litre",
    "ft": "ft", "feet": "ft", "foot": "ft", "inch": "inch", "inches": "inch", "in": "inch",
}
_NUM_UNIT = re.compile(
    r"(\d+(?:[.,]\d+)?)\s*(" + "|".join(sorted(_UNIT_ALIASES, key=len, reverse=True)) + r")(?![A-Za-z])"
)

_RULES = (
    "Each input has a kind. item = a product name from a hardware shop: translate "
    "its meaning, and also translate every unit word into the word that language "
    "uses for it, even when it is written right after the number: 6ft -> 6 followed "
    "by the word for foot, 500g -> 500 followed by the word for gram, 2 inch -> 2 "
    "followed by the word for inch (likewise mm, cm, m, kg, litre, piece, dozen, "
    "bag, box, pack). Keep every number exactly as given and always write digits as "
    "plain 0-9 (the app draws them in the language's own digits), and write brand "
    "names in the target script. unit = a unit of measurement given as a symbol or "
    "English word (mm, cm, m, kg, g, ml, litre, ft, inch): write the full word this "
    "language uses for it, never the symbol. category = a product category: translate it. party = a "
    "person's or a business's name: transliterate it into the target language's "
    "script, and if that language is written in the Latin alphabet leave it "
    "exactly as given. shop = the name of the shop itself: translate its common "
    "words (store, traders, hardware) and transliterate its proper names. address = "
    "a postal address: translate or transliterate each part in the same order and "
    "keep every number, plot and phone digit exactly. Return only a JSON array of strings, one per input, in the "
    "same order, with no explanation."
)


def code_for(lang: str | None) -> str | None:
    return _code(lang)


def _code(lang: str | None) -> str | None:
    code = (lang or "").strip().lower()[:2]
    return code if code != "en" and code in gemini.LANGUAGE_NAMES else None


def _ask(code: str, chunk: list[tuple[str, str]]) -> list[str]:
    if not GEMINI_API_KEY:
        raise gemini.AiScanNotConfigured("GEMINI_API_KEY is missing from backend/.env")
    body = {
        "systemInstruction": {
            "parts": [{"text": f"You localize names shown in a shop's accounting app into {gemini.LANGUAGE_NAMES[code]}. {_RULES}"}]
        },
        "contents": [{"parts": [{"text": json.dumps([{"kind": k, "text": t} for k, t in chunk], ensure_ascii=False)}]}],
        "generationConfig": {
            "responseMimeType": "application/json",
            "responseSchema": {"type": "ARRAY", "items": {"type": "STRING"}},
            "maxOutputTokens": 4096,
            "thinkingConfig": {"thinkingBudget": 0},
        },
    }
    data = gemini.post_any(GEMINI_API_KEY, GEMINI_TEXT_MODELS, body, 40).json()
    try:
        text = "".join(p.get("text", "") for p in data["candidates"][0]["content"]["parts"])
        result = json.loads(text)
    except (KeyError, IndexError, ValueError) as exc:
        raise ValueError("unexpected Gemini response") from exc
    if not isinstance(result, list) or len(result) != len(chunk) or not all(isinstance(r, str) for r in result):
        raise ValueError("Gemini returned the wrong number of names")
    ok = lambda r: r.strip() and len(r.strip()) <= 2 * _MAX_LEN and not re.search(r"%[0-9A-Fa-f]{2}", r)
    return [r.strip() if ok(r) else t for r, (_, t) in zip(result, chunk)]


def mapping(lang: str | None, pairs) -> dict[tuple[str, str], str]:
    """translate() on its own short database session, for the PDF builders, which
    are handed plain objects rather than a session."""
    from database import SessionLocal

    with SessionLocal() as db:
        return translate(db, lang, pairs)


def translate(db: Session, lang: str | None, pairs, resolved_only: bool = False) -> dict[tuple[str, str], str]:
    """{(kind, text): name to show}. `pairs` is any iterable of (kind, text); a name
    that can't be rendered (English, unknown language, no letters, Gemini down)
    maps to itself, or is left out when `resolved_only` is set — so a caller that
    keeps the answers can tell a real rendering from a fallback and ask again."""
    uniq = list(dict.fromkeys((k, t) for k, t in pairs if k in KINDS and t))
    out = {pair: pair[1] for pair in uniq}
    done: set[tuple[str, str]] = set()
    code = _code(lang)
    todo = [(k, t) for k, t in uniq if code and len(t) <= _MAX_LEN and any(c.isalpha() for c in t)]
    if not todo:
        return {} if resolved_only else out
    rows = (
        db.query(models.NameTranslation)
        .filter(models.NameTranslation.lang == code, models.NameTranslation.source.in_({t for _, t in todo}))
        .all()
    )
    cached = {(r.kind, r.source): r.target for r in rows}
    misses = []
    for pair in todo:
        if pair in cached:
            out[pair] = cached[pair]
            done.add(pair)
        else:
            misses.append(pair)
    for i in range(0, len(misses), _CHUNK):
        chunk = misses[i : i + _CHUNK]
        try:
            result = _ask(code, chunk)
        except (gemini.AiScanNotConfigured, gemini.GeminiAPIError, ValueError):
            break
        for (k, t), rendered in zip(chunk, result):
            out[(k, t)] = rendered
            done.add((k, t))
            db.merge(models.NameTranslation(lang=code, kind=k, source=t, target=rendered))
        db.commit()
    fixable = [p for p in done if p[0] == "item" and _NUM_UNIT.search(out[p])]
    if fixable:
        words = _unit_words(db, lang)
        for p in fixable:
            out[p] = _swap_units(out[p], words)
        if len(words) < len(_UNIT_WORDS):
            done -= set(fixable)
    return {p: v for p, v in out.items() if p in done} if resolved_only else out


def _unit_words(db: Session, lang: str | None) -> dict[str, str]:
    """{unit: that language's word}, only for the units that could be rendered."""
    got = translate(db, lang, [("unit", u) for u in _UNIT_WORDS], resolved_only=True)
    return {u: got[("unit", u)] for u in _UNIT_WORDS if ("unit", u) in got}


def _swap_units(text: str, words: dict[str, str]) -> str:
    def one(m):
        word = words.get(_UNIT_ALIASES[m.group(2)])
        return f"{m.group(1)} {word}" if word and word != m.group(2) else m.group(0)

    return _NUM_UNIT.sub(one, text)
