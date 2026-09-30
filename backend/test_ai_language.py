"""Self-check: Ask Your Shop and the morning briefing reply in the app's
language. Mocks the HTTP call. Run: venv/Scripts/python.exe test_ai_language.py"""
from unittest import mock

import httpx

import utils.ai_ask_shop as ask
import utils.ai_morning_briefing as brief
import utils.gemini as g

ask.GEMINI_API_KEY = brief.GEMINI_API_KEY = "x"

assert g.LANGUAGE_NAMES.keys() == set("ar bn de en es fa fr hi id ja ko pa ps pt ru sd sw tr ur zh".split())
assert "Urdu" in g.reply_language("ur") and "Urdu" in g.reply_language("UR") and "Urdu" in g.reply_language("ur-PK")
assert "Sindhi" in g.reply_language("sd")
for unknown in (None, "", "xx", "english"):
    assert "English" in g.reply_language(unknown), unknown
assert "plain English" not in ask._SYSTEM and "English" not in brief._SYSTEM


def fake_reply():
    r = mock.Mock()
    r.raise_for_status = lambda: None
    r.json = lambda: {"candidates": [{"content": {"parts": [{"text": "ok"}]}}]}
    return r


def system_sent(fn, *args):
    with mock.patch.object(httpx, "post", return_value=fake_reply()) as post:
        fn(*args)
    return post.call_args.kwargs["json"]["systemInstruction"]["parts"][0]["text"]


facts = {"a": 1}
assert system_sent(ask.answer_question, "q", facts, "ur").endswith(g.reply_language("ur"))
assert system_sent(ask.answer_question, "q", facts).endswith(g.reply_language(None))
assert system_sent(brief.generate_briefing, facts, "hi").endswith(g.reply_language("hi"))
assert system_sent(brief.generate_briefing, facts).endswith(g.reply_language(None))

def failing(code):
    r = mock.Mock()
    r.raise_for_status = mock.Mock(side_effect=httpx.HTTPStatusError("x", request=mock.Mock(), response=mock.Mock(status_code=code)))
    return r


def url_of(call):
    return call.args[0]


with mock.patch.object(g.time, "sleep"):
    models = ["m1", "m2", "m3"]
    with mock.patch.object(httpx, "post", side_effect=[failing(429), failing(429), fake_reply()]) as post:
        g.post_any("k", models, {}, 5)
    assert [url_of(c).split("/models/")[1].split(":")[0] for c in post.call_args_list] == models
    with mock.patch.object(httpx, "post", side_effect=[failing(503), failing(503), fake_reply()]) as post:
        g.post_any("k", models, {}, 5)
    assert post.call_count == 3
    with mock.patch.object(httpx, "post", side_effect=[httpx.ReadTimeout("slow"), fake_reply()]) as post:
        g.post_any("k", models, {}, 5)
    assert post.call_count == 2
    with mock.patch.object(httpx, "post", side_effect=[failing(400)]) as post:
        try:
            g.post_any("k", models, {}, 5)
            raise SystemExit("expected GeminiAPIError")
        except g.GeminiAPIError as e:
            assert e.status == 400 and post.call_count == 1
    with mock.patch.object(httpx, "post", side_effect=[failing(429)] * 4) as post:
        try:
            g.post_any("k", models, {}, 5)
            raise SystemExit("expected GeminiAPIError")
        except g.GeminiAPIError as e:
            assert e.status == 429 and post.call_count == 4
import config
assert config.GEMINI_TEXT_MODELS[0] == config.GEMINI_MODEL and len(set(config.GEMINI_TEXT_MODELS)) == len(config.GEMINI_TEXT_MODELS) >= 2

import copy

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models as M
from database import Base
from routers.reports import _localize_facts

eng = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=eng)
db = sessionmaker(bind=eng)()
db.add_all([
    M.NameTranslation(lang="sd", kind="item", source="Angle Grinder", target="SD-grinder"),
    M.NameTranslation(lang="sd", kind="category", source="Tools", target="SD-tools"),
    M.NameTranslation(lang="sd", kind="party", source="Ali", target="SD-ali"),
])
db.commit()
shop = {
    "top_items_by_revenue": [{"item": "Angle Grinder", "revenue": 1}],
    "low_stock_items": ["Angle Grinder", "Bolts 6mm"],
    "stock_valuation_by_category": [{"category": "Tools", "total": 1}],
    "expenses_this_month_by_category": [{"category": "Tools", "total": 1}],
    "top_outstanding_customers": [{"customer_name": "Ali", "outstanding": 1}],
}
with mock.patch("utils.name_translate._ask", side_effect=ValueError):
    sd = copy.deepcopy(shop)
    _localize_facts(db, sd, "sd")
    assert sd["top_items_by_revenue"][0]["item"] == "SD-grinder"
    assert sd["low_stock_items"] == ["SD-grinder", "Bolts 6mm"], "a name with no saved rendering stays as typed"
    assert sd["stock_valuation_by_category"][0]["category"] == sd["expenses_this_month_by_category"][0]["category"] == "SD-tools"
    assert sd["top_outstanding_customers"][0]["customer_name"] == "SD-ali"
    for lang in (None, "en"):
        same = copy.deepcopy(shop)
        _localize_facts(db, same, lang)
        assert same == shop, lang
print("OK")
