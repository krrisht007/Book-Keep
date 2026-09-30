"""Fetch + decrypt an encrypted production backup from Vercel Blob (written daily by
scheduled_backup.py) into a plain JSON file under backend/backups/. That file is the
same JSON dump the Admin panel's restore and utils.pg_backup.restore_postgres read.
Newest backup by default; pass a date (YYYYMMDD) to pick an older one.

Needs BACKUP_ENCRYPTION_KEY (backend/.env) and BLOB_READ_WRITE_TOKEN (backend/.env.local,
from `vercel env pull .env.local`). Keep a copy of the key somewhere other than this PC:
without it the backups cannot be decrypted.

Run: backend/venv/Scripts/python.exe backend/restore_backup.py [YYYYMMDD]
"""
import os
import sys
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

from dotenv import load_dotenv

load_dotenv(os.path.join(HERE, ".env"))
load_dotenv(os.path.join(HERE, ".env.local"))

from cryptography.fernet import Fernet
from vercel import blob

import scheduled_backup

want = sys.argv[1] if len(sys.argv) > 1 else ""
picks = [b for b in scheduled_backup._blob_backups(blob) if want in b.pathname]
if not picks:
    sys.exit(f"No backup found{' for ' + want if want else ''}.")
newest = picks[-1]
with urllib.request.urlopen(newest.url) as r:
    plain = Fernet(os.environ["BACKUP_ENCRYPTION_KEY"]).decrypt(r.read())
out = os.path.join(HERE, "backups", f"restored_{os.path.splitext(os.path.basename(newest.pathname))[0]}.json")
os.makedirs(os.path.dirname(out), exist_ok=True)
with open(out, "wb") as f:
    f.write(plain)
print(f"Decrypted {newest.pathname} -> {out} ({len(plain)} bytes)")
