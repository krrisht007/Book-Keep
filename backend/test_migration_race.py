"""Self-check: two instances starting together can both see a column missing and both
try to add it. The loser's "duplicate column" error must not stop startup, while a
real failure (the column still missing afterwards) must still raise.

Throwaway SQLite file; both URL variables are pinned. Run: backend/venv/Scripts/python.exe backend/test_migration_race.py
"""
import os
import sys
import tempfile
from unittest import mock

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

_url = "sqlite:///" + os.path.join(tempfile.mkdtemp(), "race.db").replace("\\", "/")
os.environ["DATABASE_URL"] = _url
os.environ["DATABASE_URL_UNPOOLED"] = _url
os.environ.pop("VERCEL", None)

import database  # noqa: E402

assert database.DATABASE_URL.startswith("sqlite"), "REFUSING: not a sqlite database"

from sqlalchemy import text  # noqa: E402

import migrations  # noqa: E402

with database.ddl_engine.begin() as conn:
    conn.execute(text("CREATE TABLE race (id TEXT, note TEXT)"))

real_inspect = migrations.inspect
looks = {"n": 0}


def stale_first_look(engine):
    looks["n"] += 1
    return mock.Mock(get_columns=lambda t: [{"name": "id"}]) if looks["n"] == 1 else real_inspect(engine)


with mock.patch.object(migrations, "inspect", stale_first_look):
    migrations._ensure_column("race", "note", "note TEXT")  # the other instance already added it
assert looks["n"] == 2

with mock.patch.object(migrations, "inspect", lambda engine: mock.Mock(get_columns=lambda t: [{"name": "id"}])):
    try:
        migrations._ensure_column("race", "note", "note TEXT")
        raise SystemExit("a real failure was swallowed")
    except Exception as e:
        assert "note" in str(e) or "duplicate" in str(e).lower(), e

migrations._ensure_column("race", "brand_new", "brand_new TEXT")
with database.ddl_engine.begin() as conn:
    conn.execute(text("SELECT brand_new FROM race"))
print("OK: a column added by another instance is not an error; a column that is really missing still fails")
