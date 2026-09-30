"""Self-check: PDFs and emails in the app's languages, with non-Latin names.
Runs the real app on a TEMP sqlite database. Run: venv/Scripts/python.exe test_pdf_i18n.py"""
import os
import re
import sys
import tempfile
import time

HERE = os.path.dirname(os.path.abspath(__file__))
DB = os.path.join(tempfile.gettempdir(), "pdf_i18n_check.db")
if os.path.exists(DB):
    os.remove(DB)
os.environ["DATABASE_URL"] = "sqlite:///" + DB
os.environ["DATABASE_URL_UNPOOLED"] = "sqlite:///" + DB
os.environ["BLOB_READ_WRITE_TOKEN"] = ""
os.environ.pop("VERCEL", None)
os.chdir(HERE)
sys.path.insert(0, HERE)

import database  # noqa: E402

assert database.DATABASE_URL.startswith("sqlite"), "REFUSING: not a sqlite database"

from utils import mail_text, pdf_labels  # noqa: E402
from utils import name_translate  # noqa: E402

name_translate._ask = lambda code, chunk: [f"{code}~{t}" for _, t in chunk]

ph = lambda s: set(re.findall(r"\{(\w+)\}", s))

for lang, table in pdf_labels._T.items():
    assert table.keys() == pdf_labels.EN.keys() - {"words"}, (lang, pdf_labels.EN.keys() - {"words"} ^ table.keys())
    for key, text in table.items():
        assert ph(text) == ph(pdf_labels.EN[key]), (lang, key)
assert pdf_labels.pdf_lang("zh") == "zh" and pdf_labels.pdf_lang("xx") == "en" and pdf_labels.pdf_lang("UR") == "ur" and pdf_labels.pdf_lang(None) == "en"
L = pdf_labels.Labels("ur")
assert L.rtl and L.align == "R" and not pdf_labels.Labels("hi").rtl
assert set(pdf_labels._UNITS) == set(pdf_labels._T) and all(len(v) == 7 for v in pdf_labels._UNITS.values())
assert L.unit("Bag") == "بوری" and L.unit("dozen") == "درجن" and L.unit(None) == "عدد" and L.unit("crate") == "crate" and pdf_labels.Labels("en").unit("kg") == "kg"
assert L.money("5.00") == "5.00 روپے" and pdf_labels.Labels("hi").money("5.00") == "रु 5.00" and pdf_labels.Labels("de").money("5.00") == "Rs. 5.00" and pdf_labels.Labels("zh").money("5.00") == "5.00卢比" and pdf_labels.Labels("ja").unit("bag") == "袋"
assert "Rs." not in "".join(pdf_labels._T["ur"].values()) and "Rs." not in "".join(pdf_labels._T["hi"].values())
assert L.status("paid") == "ادا شدہ" and pdf_labels.Labels("en").method("bank_transfer") == "Bank Transfer"

for lang, table in mail_text._T.items():
    assert table.keys() == mail_text._EN.keys(), lang
    for key, text in table.items():
        assert ph(text) == ph(mail_text._EN[key]), (lang, key)
subject, body = mail_text.invoice_mail("ur", "علی", "INV-1", "Test Shop")
assert "INV-1" in subject and "علی" in body and "Test Shop" in body
assert mail_text.statement_mail("xx", "Ali", "Shop")[0] == "Account statement from Shop"

import main  # noqa: E402
from fastapi.testclient import TestClient  # noqa: E402

client = TestClient(main.app)


def ok(r, what):
    assert r.status_code < 300, (what, r.status_code, r.text[:200])
    return r


sup = ok(client.post("/suppliers", json={"name": "کراچی اسٹیل", "phone": "03001234567"}), "supplier").json()
items = [
    ok(client.post("/items", json={"name": n, "unit": u, "price": p, "cost_price": p * 0.8, "stock_quantity": 50,
                                   "category": c}), "item " + n).json()
    for n, u, p, c in [("सीमेंट बैग", "bag", 1400, "ਸਮਾਨ"), ("ইস্পাত রড", "pcs", 950, "Hardware"), ("Nails 2 inch", "kg", 150, ""),
                      ("水泥 50公斤", "bag", 1400, "建材"), ("鉄筋 ダース", "pcs", 950, "金物"), ("못 2인치 한글", "kg", 150, "철물")]
]
cust = ok(client.post("/customers", json={"name": "علی ٹریڈرز", "phone": "03111234567", "credit_limit": 100000,
                                           "address": "کراچی، پاکستان", "email": "ali@example.com"}), "customer").json()
today = time.strftime("%Y-%m-%d")
ok(client.post("/purchases", json={"supplier_id": sup["id"], "date": today, "payment_status": "unpaid",
                                   "line_items": [{"item_id": items[0]["id"], "item_name": items[0]["name"], "quantity": 5, "unit_price": 1200}]}), "purchase")
bill = ok(client.post("/bills/v2", json={"customer_id": cust["id"], "date": today, "payment_status": "unpaid", "amount_paid": 0,
                                         "line_items": [{"item_id": it["id"], "item_name": it["name"], "quantity": 2, "unit_price": it["price"]} for it in items]}), "bill").json()

sizes = {}
for lang in [None, "en", "ur", "sd", "ps", "fa", "ar", "hi", "bn", "pa", "de", "es", "fr", "id", "pt", "ru", "sw", "tr", "zh", "ja", "ko"]:
    q = {"language": lang} if lang else {}
    for name, url in [
        ("invoice", f"/bills/{bill['id']}/invoice"),
        ("customer ledger", f"/customers/{cust['id']}/ledger"),
        ("supplier ledger", f"/suppliers/{sup['id']}/ledger"),
        ("rate card", "/items/rate-card"),
    ]:
        r = ok(client.get(url, params=q), f"{name} [{lang}]")
        assert r.headers["content-type"] == "application/pdf" and r.content[:4] == b"%PDF" and len(r.content) > 1500, (name, lang)
        sizes[(name, lang)] = len(r.content)

assert sizes[("invoice", "ur")] != sizes[("invoice", "en")], "Urdu invoice should differ from the English one"
for lg in ("zh", "ja", "ko"):
    assert sizes[("invoice", lg)] != sizes[("invoice", "en")], f"{lg} invoice should not be the English one"
    assert sizes[("rate card", lg)] != sizes[("rate card", "en")], f"{lg} rate card should not be the English one"
out = os.environ.get("PDF_OUT")
if out:
    for lg in ("zh", "ja", "ko"):
        for name, url in [("invoice", f"/bills/{bill['id']}/invoice"), ("rate", "/items/rate-card")]:
            open(os.path.join(out, f"{name}_{lg}.pdf"), "wb").write(client.get(url, params={"language": lg}).content)
from utils import pdf_labels as _pl  # noqa: E402

_L = _pl.Labels("ur")
_L.load_names([("item", "Cement Bag"), ("party", "Ali"), ("category", "Paint"), ("shop", "My Shop"), ("address", "1 Main Road")])
assert _L.n("shop", "My Shop") == "ur~My Shop" and _L.n("address", "1 Main Road") == "ur~1 Main Road", "shop name and address are translated too"
assert _L.n("item", "Cement Bag") == "ur~Cement Bag" and _L.n("party", "Ali") == "ur~Ali" and _L.n("item", "zzz") == "zzz"
_E = _pl.Labels("en")
_E.load_names([("item", "Cement Bag")])
assert _E.n("item", "Cement Bag") == "Cement Bag", "English PDFs keep the typed names"
from utils.pdf_font import new_pdf  # noqa: E402

sample = "Rs 1,234.50 x 2 inch 03/10"
want = {
    "ar": "Rs ١,٢٣٤.٥٠ x ٢ inch ٠٣/١٠",
    "ur": "Rs ۱,۲۳۴.۵۰ x ۲ inch ۰۳/۱۰",
    "sd": "Rs ۱,۲۳۴.۵۰ x ۲ inch ۰۳/۱۰",
    "bn": "Rs ১,২৩৪.৫০ x ২ inch ০৩/১০",
    "hi": "Rs १,२३४.५० x २ inch ०३/१०",
    "pa": "Rs ੧,੨੩੪.੫੦ x ੨ inch ੦੩/੧੦",
}
for code, text in want.items():
    p = new_pdf(code)
    assert p.normalize_text(sample) == text, (code, p.normalize_text(sample))
    p.add_page()
    p.set_font("NotoSans", "", 10)
    p.cell(0, 8, sample)
    assert bytes(p.output()).startswith(b"%PDF"), code
for code in ("en", "de", "zh", "ja", None):
    assert new_pdf(code).normalize_text(sample) == sample, code
phone = "Phone: +92 300-0000000 or 0300 0000000"
assert new_pdf("ur").normalize_text(phone) == "Phone: +92 300-0000000 or ۰۳۰۰ ۰۰۰۰۰۰۰", "a +country-code phone keeps plain digits"
assert new_pdf("ur").normalize_text("+500.00 / +2") == "+۵۰۰.۰۰ / +۲", "a signed amount is not mistaken for a phone number"
print("OK: labels and emails complete in %d languages; 4 PDFs x 21 language settings rendered with Urdu/Hindi/Bengali/Punjabi/Chinese/Japanese/Korean names" % len(pdf_labels.SUPPORTED))
