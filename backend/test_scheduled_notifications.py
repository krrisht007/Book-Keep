"""Self-check: each automatic notification check runs at most once per
calendar day (idempotent, mirrors scheduled_backup.py), and a failing check
is NOT marked done — it retries on the next wake instead of being silently
skipped for the rest of the day. Uses fake check functions and an in-memory
DB — never touches the real backend.db or a real Firebase project.

Run: backend/venv/Scripts/python.exe backend/test_scheduled_notifications.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import scheduled_notifications
from database import Base

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
scheduled_notifications.SessionLocal = sessionmaker(bind=engine)

calls = []

def _ok(db):
    calls.append("ok")

def _fails(db):
    calls.append("fails")
    raise RuntimeError("simulated failure")

scheduled_notifications._CHECKS = {"a": _ok, "b": _fails}

ran = scheduled_notifications.run_due_checks()
assert ran == ["a"], ran
assert calls == ["ok", "fails"], calls

db = scheduled_notifications.SessionLocal()
today = scheduled_notifications._today_str()
a_row = db.query(models.Setting).filter(models.Setting.key == "last_notified_a").first()
b_row = db.query(models.Setting).filter(models.Setting.key == "last_notified_b").first()
assert a_row is not None and a_row.value == today, "succeeding check should be marked done today"
assert b_row is None, "a failing check must not be marked done"
db.close()

calls.clear()
ran = scheduled_notifications.run_due_checks()
assert ran == [], f"'a' should be skipped this run: {ran}"
assert calls == ["fails"], f"'a' must not re-run today, 'b' should retry: {calls}"

print("OK — each check runs once per day, and a failure retries next wake instead of being marked done.")
