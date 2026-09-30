"""Self-check: the Vercel daily backup (scheduled_backup._run_blob_backup) using an
in-memory fake of the Blob SDK — no token or network. Covers: skips (and uploads
nothing) without an encryption key, stores only ciphertext that decrypts back to the
dump, is idempotent within a day, and prunes to BACKUPS_KEEP oldest-first.

Run: backend/venv/Scripts/python.exe backend/test_blob_backup.py
"""
import os
import sys
from types import SimpleNamespace

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from cryptography.fernet import Fernet

import scheduled_backup
from utils import uploads

DUMP = b'{"tables": {"customers": [{"name": "Secret Customer"}]}}'

class FakeBlob:
    def __init__(self):
        self.store: dict[str, bytes] = {}
        self._n = 0

    def put(self, path, body, *, access, content_type, add_random_suffix):
        assert add_random_suffix is True
        self._n += 1
        stem, ext = os.path.splitext(path)
        self.store[f"{stem}-Rnd{self._n}{ext}"] = body
        return SimpleNamespace(url="x", pathname=path)

    def list_objects(self, *, prefix=None, cursor=None, limit=None):
        names = sorted(p for p in self.store if p.startswith(prefix or ""))
        start = int(cursor or 0)
        more = start + 5 < len(names)
        return SimpleNamespace(
            blobs=[SimpleNamespace(url=p, pathname=p) for p in names[start:start + 5]],
            has_more=more,
            cursor=str(start + 5) if more else None,
        )

    def delete(self, urls):
        for u in urls:
            self.store.pop(u, None)

fake = FakeBlob()
uploads._blob = lambda: fake
scheduled_backup.dump_postgres = lambda: DUMP
scheduled_backup.IS_POSTGRES = True
os.environ["VERCEL"] = "1"
os.environ["BLOB_READ_WRITE_TOKEN"] = "fake-token"
os.environ.pop("BACKUP_ENCRYPTION_KEY", None)

assert scheduled_backup.run_due_backup() is False
assert fake.store == {}

key = Fernet.generate_key().decode()
os.environ["BACKUP_ENCRYPTION_KEY"] = key
assert scheduled_backup.run_due_backup() is True
(stored,) = fake.store.values()
assert b"Secret Customer" not in stored, "backup must not be stored in plaintext"
assert Fernet(key).decrypt(stored) == DUMP

assert scheduled_backup.run_due_backup() is False
assert len(fake.store) == 1

keep = scheduled_backup.BACKUPS_KEEP
for d in range(1, keep + 1):
    fake.store[f"backups/auto_backup_2020{d // 28 + 1:02d}{d % 28 + 1:02d}-Old.enc"] = b"old"
oldest = min(fake.store)
today = f"{scheduled_backup._BLOB_PREFIX}{scheduled_backup._today_str()}"
fake.store = {p: v for p, v in fake.store.items() if not p.startswith(today)}
assert scheduled_backup.run_due_backup() is True
assert len(fake.store) == keep, f"expected {keep} backups kept, got {len(fake.store)}"
assert oldest not in fake.store, "oldest backup should have been pruned"

print("OK — Blob backup: skips without a key, stores only ciphertext, once a day, pruned to BACKUPS_KEEP.")
