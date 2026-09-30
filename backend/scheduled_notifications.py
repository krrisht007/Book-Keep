"""Automatic daily run of the four notification checks (low-stock, overdue,
daily-summary, morning-briefing) that otherwise only fire when someone taps
"Check Now" in the app's Notifications screen. Mirrors scheduled_backup.py's
background-thread, once-per-calendar-day pattern — see there for the
reasoning on hourly-wake / once-daily-fire.

Calls the check functions directly (db session only, no HTTP/auth layer) —
same pattern this backend's own test_overdue_notify_nets_returns.py and
friends already use to exercise them outside a request.

ponytail: all four run on the same once-a-day cadence — low stock changes
throughout the day, so this is a daily safety-net digest, not real-time
monitoring (the in-app "Check Now" button still covers that). Give low-stock
its own shorter interval if real-time paging ever matters.

ponytail: the app's per-device enable/disable toggles (SharedPreferences in
notifications_screen.dart) aren't wired to this — they only gate the manual
"Check Now" button today. This job always runs all four. Move the toggle to
a shared Setting row (mirroring shop settings) to let it actually gate the
automatic job, if that's ever needed.
"""
import logging
import threading
from datetime import datetime

import models
from database import SessionLocal
from routers.notifications import (
    check_low_stock_and_notify,
    check_overdue_and_notify,
    daily_summary_and_notify,
    morning_briefing_and_notify,
)

_log = logging.getLogger("bookkeeper.notifications")

_CHECK_INTERVAL_SECONDS = 60 * 60

_CHECKS = {
    "low_stock": check_low_stock_and_notify,
    "overdue": check_overdue_and_notify,
    "daily_summary": daily_summary_and_notify,
    "morning_briefing": morning_briefing_and_notify,
}

def _today_str() -> str:
    return datetime.now().strftime("%Y-%m-%d")

def run_due_checks() -> list[str]:
    """Runs each check that hasn't already succeeded today. A check that
    raises (e.g. Firebase not configured, a transient DB hiccup) is NOT
    marked done, so it's retried on the next hourly wake instead of being
    silently skipped for the rest of the day. Returns the names actually
    run this call."""
    today = _today_str()
    ran = []
    with SessionLocal() as db:
        for name, fn in _CHECKS.items():
            key = f"last_notified_{name}"
            row = db.query(models.Setting).filter(models.Setting.key == key).first()
            if row is not None and row.value == today:
                continue
            try:
                fn(db=db)
            except Exception:
                _log.exception("Scheduled notification check '%s' failed — will retry next hour", name)
                continue
            if row is None:
                db.add(models.Setting(key=key, value=today))
            else:
                row.value = today
            db.commit()
            ran.append(name)
    return ran

def _loop(stop_event: threading.Event) -> None:
    run_due_checks()
    while not stop_event.wait(_CHECK_INTERVAL_SECONDS):
        run_due_checks()

def start_scheduler() -> threading.Event:
    """Starts the background thread; call once from main.py at startup.
    Returns the stop Event (unused in production — daemon=True means the
    thread dies with the process — but lets a test stop it cleanly)."""
    stop_event = threading.Event()
    thread = threading.Thread(target=_loop, args=(stop_event,), daemon=True)
    thread.start()
    return stop_event
