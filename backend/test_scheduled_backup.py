"""Self-check: automatic daily backup — writes at most one
backup per calendar day (idempotent within the same day), and prunes down
to BACKUPS_KEEP once there are more than that many. Uses temp dirs, not the
real DB_PATH/BACKUPS_DIR — never touches the real backend.db or backups/.

Run: backend/venv/Scripts/python.exe backend/test_scheduled_backup.py
"""
import os
import sys
import tempfile

sys.path.insert(0, os.path.dirname(__file__))

import config
import scheduled_backup

_orig_db_path = config.DB_PATH
_orig_backups_dir = config.BACKUPS_DIR
_orig_keep = config.BACKUPS_KEEP
tmpdir = tempfile.mkdtemp()

try:
    config.DB_PATH = os.path.join(tmpdir, "fake.db")
    config.BACKUPS_DIR = os.path.join(tmpdir, "backups")
    config.BACKUPS_KEEP = 3
    scheduled_backup.DB_PATH = config.DB_PATH
    scheduled_backup.BACKUPS_DIR = config.BACKUPS_DIR
    scheduled_backup.BACKUPS_KEEP = config.BACKUPS_KEEP

    assert scheduled_backup.run_due_backup() is False
    assert scheduled_backup.list_backups() == []

    with open(config.DB_PATH, "wb") as f:
        f.write(b"SQLite format 3\x00fake db content")

    os.makedirs(config.BACKUPS_DIR, exist_ok=True)
    for day in ["20240101", "20240102", "20240103", "20240104"]:
        with open(os.path.join(config.BACKUPS_DIR, f"auto_backup_{day}.db"), "wb") as f:
            f.write(b"x")
    assert len(scheduled_backup.list_backups()) == 4

    assert scheduled_backup.run_due_backup() is True
    backups = scheduled_backup.list_backups()
    assert len(backups) == config.BACKUPS_KEEP, backups
    filenames = {b["filename"] for b in backups}
    assert "auto_backup_20240101.db" not in filenames, filenames
    assert "auto_backup_20240102.db" not in filenames, filenames
    assert "auto_backup_20240104.db" in filenames, filenames

    assert scheduled_backup.run_due_backup() is False
    assert len(scheduled_backup.list_backups()) == config.BACKUPS_KEEP

    print("All scheduled backup tests passed.")
finally:
    config.DB_PATH = _orig_db_path
    config.BACKUPS_DIR = _orig_backups_dir
    config.BACKUPS_KEEP = _orig_keep
