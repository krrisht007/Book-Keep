"""Self-check: names in the app's language (utils/name_translate.py + POST /translate).

Gemini is replaced by a fake, so this needs no key and no network. Uses a
throwaway SQLite file; both URL variables are pinned because backend/.env may
point DATABASE_URL_UNPOOLED at the real Neon database.

Run: backend/venv/Scripts/python.exe backend/test_name_translate.py
"""
import os
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

_url = "sqlite:///" + os.path.join(tempfile.mkdtemp(), "t.db").replace("\\", "/")
os.environ["DATABASE_URL"] = _url
os.environ["DATABASE_URL_UNPOOLED"] = _url
os.environ.pop("VERCEL", None)

import database  # noqa: E402

assert database.DATABASE_URL.startswith("sqlite"), "REFUSING: not a sqlite database"

import migrations  # noqa: E402
import models  # noqa: E402
from utils import gemini, name_translate  # noqa: E402

migrations.ensure_schema()

calls = []
fail = {"on": False}


def fake_ask(code, chunk):
    calls.append((code, list(chunk)))
    if fail["on"]:
        raise gemini.GeminiAPIError("down", 503)
    return [f"{code}:{t}" for _, t in chunk]


name_translate._ask = fake_ask

with database.SessionLocal() as db:
    pairs = [("item", "Cement Bag"), ("party", "Ali Traders"), ("category", "Paint"), ("item", "Cement Bag")]
    out = name_translate.translate(db, "ur", pairs)
    assert out[("item", "Cement Bag")] == "ur:Cement Bag" and out[("party", "Ali Traders")] == "ur:Ali Traders"
    assert len(calls) == 1 and len(calls[0][1]) == 3, "duplicates are sent once, in one request"

    name_translate.translate(db, "ur", pairs)
    assert len(calls) == 1, "second time comes from the saved table, no Gemini call"
    assert db.query(models.NameTranslation).count() == 3

    out = name_translate.translate(db, "ja", [("item", "Cement Bag")])
    assert out[("item", "Cement Bag")] == "ja:Cement Bag" and len(calls) == 2, "each language is its own row"

    n = len(calls)
    assert name_translate.translate(db, "en", pairs)[("item", "Cement Bag")] == "Cement Bag"
    assert name_translate.translate(db, None, pairs)[("item", "Cement Bag")] == "Cement Bag"
    assert name_translate.translate(db, "xx", pairs)[("item", "Cement Bag")] == "Cement Bag"
    assert len(calls) == n, "English, no language and unknown languages never reach Gemini"

    out = name_translate.translate(db, "ur", [("item", "12"), ("item", "6mm"), ("bogus", "x"), ("item", "")])
    assert out == {("item", "12"): "12", ("item", "6mm"): "ur:6 ur:mm"}, out
    sent = [c[1] for c in calls]
    assert [("item", "6mm")] in sent, "the name itself is sent"
    assert all(("item", "12") not in c and ("bogus", "x") not in c for c in sent), "numbers-only names and unknown kinds are never sent"

    fail["on"] = True
    out = name_translate.translate(db, "ur", [("item", "Brand New Item")])
    assert out[("item", "Brand New Item")] == "Brand New Item", "Gemini down: the name stays as typed"
    assert db.query(models.NameTranslation).filter_by(source="Brand New Item").count() == 0, "failures are not saved"
    fail["on"] = False

    many = [("item", f"Item {i}") for i in range(230)]
    before = len(calls)
    out = name_translate.translate(db, "ur", many)
    assert len(calls) - before == 3 and all(out[p] == f"ur:{p[1]}" for p in many), "230 names go out in chunks of 100"

    fail["on"] = True
    mixed = name_translate.translate(db, "ur", [("item", "Item 1"), ("item", "Never Seen")], resolved_only=True)
    assert mixed == {("item", "Item 1"): "ur:Item 1"}, "resolved_only leaves out names that could not be rendered"
    fail["on"] = False

    long_name = "x" * 130
    assert name_translate.translate(db, "ur", [("item", long_name)])[("item", long_name)] == long_name

from fastapi.testclient import TestClient  # noqa: E402

import main  # noqa: E402

client = TestClient(main.app)
r = client.post("/translate", json={"language": "hi", "items": [{"kind": "party", "text": "Ali Traders"}]})
assert r.status_code < 300, (r.status_code, r.text[:200])
assert r.json() == {"translations": [{"kind": "party", "text": "Ali Traders", "translated": "hi:Ali Traders"}]}, r.json()
r = client.put("/translate/override", json={"language": "hi", "kind": "shop", "text": "Ali Store", "translated": "अली स्टोर"})
assert r.status_code == 200 and r.json() == {"translated": "अली स्टोर"}, r.text
r = client.post("/translate", json={"language": "hi", "items": [{"kind": "shop", "text": "Ali Store"}]})
assert r.json()["translations"][0]["translated"] == "अली स्टोर", "the shop's own wording wins over Gemini"
n_before = len(calls)
client.post("/translate", json={"language": "hi", "items": [{"kind": "shop", "text": "Ali Store"}]})
assert len(calls) == n_before, "an override is never sent to Gemini"
assert client.put("/translate/override", json={"language": "hi", "kind": "item", "text": "x", "translated": "y"}).status_code == 422
assert client.put("/translate/override", json={"language": "en", "kind": "shop", "text": "x", "translated": "y"}).status_code == 422
r = client.put("/translate/override", json={"language": "hi", "kind": "shop", "text": "Ali Store", "translated": ""})
assert r.json() == {"translated": None}, "empty removes the override"
r = client.post("/translate", json={"language": "hi", "items": [{"kind": "shop", "text": "Ali Store"}]})
assert r.json()["translations"][0]["translated"] == "hi:Ali Store", "after removal Gemini's rendering is used again"
assert client.post("/translate", json={"language": "hi", "items": [{"kind": "item", "text": "x" * 201}]}).status_code == 422
assert client.post("/translate", json={"language": "hi", "items": [{"kind": "item", "text": "a"}] * 101}).status_code == 422
def unit_ask(code, chunk):
    if fail["units"] and any(k == "unit" for k, _ in chunk):
        raise gemini.GeminiAPIError("down", 503)
    return [f"W-{t}" if k == "unit" else f"{code}:{t}" for k, t in chunk]


name_translate._ask = unit_ask
fail["units"] = False
with database.SessionLocal() as db:
    names = ["Bolts 6mm", "Cement 50 kg", "Wire 2.5mm", "Paint 4 L", "Rod 1/2 inch", "Tape 5m", "Nails", "Bolt 6", "Pack of 5 in box"]
    got = name_translate.translate(db, "tr", [("item", n) for n in names])
    assert got[("item", "Bolts 6mm")] == "tr:Bolts 6 W-mm", got
    assert got[("item", "Cement 50 kg")] == "tr:Cement 50 W-kg"
    assert got[("item", "Wire 2.5mm")] == "tr:Wire 2.5 W-mm"
    assert got[("item", "Paint 4 L")] == "tr:Paint 4 W-litre"
    assert got[("item", "Rod 1/2 inch")] == "tr:Rod 1/2 W-inch"
    assert got[("item", "Tape 5m")] == "tr:Tape 5 W-m"
    assert got[("item", "Nails")] == "tr:Nails" and got[("item", "Bolt 6")] == "tr:Bolt 6", "no unit, nothing to swap"
    assert db.query(models.NameTranslation).filter_by(lang="tr", kind="unit").count() == 9, "the 9 unit words are saved once"

    fail["units"] = True
    name_translate.translate(db, "ru", [("party", "Ali")])
    only = name_translate.translate(db, "ru", [("item", "Bolts 6mm"), ("item", "Nails")], resolved_only=True)
    assert ("item", "Bolts 6mm") not in only and ("item", "Nails") in only, "a name left with a Latin unit is retried later"
    assert name_translate._swap_units("x 6mm", {}) == "x 6mm"

print("OK: names translate once per language, fall back to the typed name, units are worded, and POST /translate works")
