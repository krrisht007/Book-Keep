"""Self-check: database.py's engine must point at config.DB_PATH exactly,
not a bare relative "./bookkeeper.db" that only happens to resolve to the
same file as long as the process's cwd is already backend/ when it starts.

Run: backend/venv/Scripts/python.exe backend/test_database_path.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

import config
import database

assert config.DB_PATH in database.DATABASE_URL, (
    f"database.py's DATABASE_URL doesn't reference config.DB_PATH: "
    f"{database.DATABASE_URL!r} vs {config.DB_PATH!r}"
)
assert os.path.isabs(config.DB_PATH), \
    "config.DB_PATH should be absolute (anchored to backend/'s own location)"

with database.engine.connect() as conn:
    from sqlalchemy import text
    conn.execute(text("SELECT 1"))

print("OK — database.py's engine is built from config.DB_PATH and connects.")
