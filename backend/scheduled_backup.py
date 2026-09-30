"""Automatic daily database backup — a timestamped copy written to
BACKUPS_DIR, pruned to the newest BACKUPS_KEEP: a plain file copy of
DB_PATH on the SQLite fallback, a JSON table dump (utils/pg_backup.py) on
Postgres. On Vercel (no persistent disk) the dump is encrypted and stored in
Blob instead, driven by a daily Cron call — see _run_blob_backup below.
Locally it runs entirely server-side in a background thread (no OS-level
scheduler dependency, no mobile background-execution plugin): the backend
is expected to stay running continuously on the shop's machine, unlike the
Flutter app which only runs while someone has it open — this is the one
part of the app that keeps working with nobody touching it.

The manual "Backup" download in Settings (see routers/backup.py's
`/backup`) still exists for an on-demand copy the user takes off-device;
this is the always-on safety net sitting on the server's own disk. There's
no restore-from-history flow through the API/UI on purpose — recovering
from one of these is a same-machine file-copy job for whoever runs the
server, not a remote action worth exposing to the app.
"""
import glob
import logging
import os
import shutil
import threading
from datetime import datetime

from config import DB_PATH, BACKUPS_DIR, BACKUPS_KEEP
from database import IS_POSTGRES
from utils import uploads
from utils.pg_backup import dump_postgres

_log = logging.getLogger("bookkeeper.backup")

_FILENAME_PREFIX = "auto_backup_"
_FILENAME_DATE_FMT = "%Y%m%d"
_FILENAME_EXT = ".json" if IS_POSTGRES else ".db"

_CHECK_INTERVAL_SECONDS = 60 * 60

def _today_str() -> str:
    return datetime.now().strftime(_FILENAME_DATE_FMT)

def list_backups() -> list[dict]:
    """Existing auto-backups, newest first."""
    if not os.path.isdir(BACKUPS_DIR):
        return []
    paths = sorted(
        glob.glob(os.path.join(BACKUPS_DIR, f"{_FILENAME_PREFIX}*{_FILENAME_EXT}")),
        reverse=True,
    )
    return [
        {
            "filename": os.path.basename(p),
            "size_bytes": os.path.getsize(p),
            "created_at": datetime.fromtimestamp(os.path.getmtime(p)).isoformat(),
        }
        for p in paths
    ]

_BLOB_PREFIX = "backups/auto_backup_"

def _blob_backups(blob) -> list:
    """Every stored backup blob, oldest first (the file names embed the date)."""
    found, cursor = [], None
    while True:
        page = blob.list_objects(prefix=_BLOB_PREFIX, cursor=cursor)
        found += page.blobs
        if not page.has_more:
            return sorted(found, key=lambda b: b.pathname)
        cursor = page.cursor

def _run_blob_backup() -> bool:
    """Vercel: today's Postgres dump, Fernet-encrypted with BACKUP_ENCRYPTION_KEY,
    into Blob under backups/, pruned to BACKUPS_KEEP. The photos store is public,
    so an unencrypted dump would expose every customer's data: with no key set
    this skips loudly instead of uploading plaintext. Restore: restore_backup.py."""
    if not (os.getenv("BACKUP_ENCRYPTION_KEY") and os.getenv("BLOB_READ_WRITE_TOKEN") and IS_POSTGRES):
        _log.warning("Blob backup skipped: needs BACKUP_ENCRYPTION_KEY, BLOB_READ_WRITE_TOKEN and Postgres.")
        return False
    from cryptography.fernet import Fernet

    blob = uploads._blob()
    today = f"{_BLOB_PREFIX}{_today_str()}"
    existing = _blob_backups(blob)
    if any(b.pathname.startswith(today) for b in existing):
        return False
    blob.put(
        f"{today}.enc",
        Fernet(os.environ["BACKUP_ENCRYPTION_KEY"]).encrypt(dump_postgres()),
        access="public",
        content_type="application/octet-stream",
        add_random_suffix=True,
    )
    _log.info("Blob backup written: %s", today)
    stale = existing[: max(len(existing) + 1 - BACKUPS_KEEP, 0)]
    if stale:
        blob.delete([b.url for b in stale])
    return True

def run_due_backup() -> bool:
    """Writes today's backup if it hasn't been written yet, then prunes
    anything past BACKUPS_KEEP. Returns True if a backup was actually
    written (False when today's was already done, or — on the SQLite
    fallback only — DB_PATH doesn't exist yet, a brand-new install before
    the first write)."""
    if os.getenv("VERCEL"):
        return _run_blob_backup()
    if not IS_POSTGRES and not os.path.exists(DB_PATH):
        return False
    os.makedirs(BACKUPS_DIR, exist_ok=True)
    target = os.path.join(BACKUPS_DIR, f"{_FILENAME_PREFIX}{_today_str()}{_FILENAME_EXT}")
    if os.path.exists(target):
        return False
    if IS_POSTGRES:
        with open(target, "wb") as f:
            f.write(dump_postgres())
    else:
        shutil.copyfile(DB_PATH, target)
    _log.info("Automatic backup written: %s", target)

    existing = sorted(
        glob.glob(os.path.join(BACKUPS_DIR, f"{_FILENAME_PREFIX}*{_FILENAME_EXT}"))
    )
    for stale in existing[:-BACKUPS_KEEP]:
        try:
            os.remove(stale)
        except OSError:
            pass
    return True

def _loop(stop_event: threading.Event) -> None:
    run_due_backup()
    while not stop_event.wait(_CHECK_INTERVAL_SECONDS):
        run_due_backup()

def start_scheduler() -> threading.Event:
    """Starts the background thread; call once from main.py at startup.
    Returns the stop Event (unused in production — daemon=True means the
    thread dies with the process — but lets a test stop it cleanly)."""
    stop_event = threading.Event()
    thread = threading.Thread(target=_loop, args=(stop_event,), daemon=True)
    thread.start()
    return stop_event
