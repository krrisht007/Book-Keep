"""Self-check: migrations.ensure_schema() runs the full create_all + migrations
+ backfill + seed on a fresh database, then costs one SELECT on every later
start (a cold start used to run ~130 statements before answering anything —
the ~10 s stalls after the Vercel server had been idle), and runs the full path
again when the stored fingerprint no longer matches the code.

Uses a throwaway SQLite file. Both URL variables are pinned first because
database.py also reads DATABASE_URL_UNPOOLED, which backend/.env may point at
the real Neon database.

Run: backend/venv/Scripts/python.exe backend/test_schema_signature.py
"""
import os
import sys
import tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

_url = "sqlite:///" + os.path.join(tempfile.mkdtemp(), "t.db").replace("\\", "/")
os.environ["DATABASE_URL"] = _url
os.environ["DATABASE_URL_UNPOOLED"] = _url
os.environ.pop("VERCEL", None)

from sqlalchemy import event
from sqlalchemy.engine import Engine

import database
import migrations
import models

assert database.engine.url.get_backend_name() == "sqlite", database.engine.url
assert database.ddl_engine.url.get_backend_name() == "sqlite", database.ddl_engine.url

steps = []
for name in ("_run_migrations", "_backfill_barcodes", "_seed_settings"):
    original = getattr(migrations, name)

    def wrapped(_orig=original, _name=name):
        steps.append(_name)
        return _orig()

    setattr(migrations, name, wrapped)

statements = []

@event.listens_for(Engine, "before_cursor_execute")
def _count(conn, cursor, statement, params, context, executemany):
    statements.append(statement)

assert migrations.ensure_schema() is True
assert steps == ["_run_migrations", "_backfill_barcodes", "_seed_settings"], steps

steps.clear()
statements.clear()
assert migrations.ensure_schema() is False
assert steps == [], steps
assert len(statements) <= 2, statements

with database.SessionLocal() as db:
    db.merge(models.SchemaMeta(key="signature", value="stale"))
    db.commit()
assert migrations.ensure_schema() is True
assert len(steps) == 3, steps
assert migrations.ensure_schema() is False

with database.SessionLocal() as db:
    keys = {r.key for r in db.query(models.Setting).all()}
assert "signature" not in keys and "shop_name" in keys, keys

print("OK — full run on a fresh DB, 1 statement when up to date, full run again on a stale fingerprint.")
