"""Self-check: bill/purchase scan photos (save_upload(..., private=True)) must never
land in the public Blob store as a readable image. With BACKUP_ENCRYPTION_KEY they are
stored encrypted (.enc) and decrypt back to the original; without it nothing is stored
and None comes back (the scan endpoints then return photo_url=null). Item photos
(private=False) are unchanged: stored readable and public, since the app displays them.
Uses an in-memory fake of the Blob SDK — no token or network.

Run: backend/venv/Scripts/python.exe backend/test_scan_encryption.py
"""
import os
import sys
from types import SimpleNamespace

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from cryptography.fernet import Fernet

from utils import uploads

IMG = b"\xff\xd8\xff-fake-jpeg-of-a-customer-bill"

class FakeBlob:
    def __init__(self):
        self.store: dict[str, bytes] = {}

    def put(self, path, body, *, access, content_type, add_random_suffix):
        stem, ext = os.path.splitext(path)
        pathname = f"{stem}-Rnd{len(self.store)}{ext}"
        self.store[pathname] = body
        return SimpleNamespace(url=f"https://store.public.blob.vercel-storage.com/{pathname}", pathname=pathname)

    def list_objects(self, *, prefix=None, cursor=None, limit=None):
        return SimpleNamespace(blobs=[], has_more=False, cursor=None)

    def delete(self, urls):
        pass

fake = FakeBlob()
uploads._blob = lambda: fake
os.environ["BLOB_READ_WRITE_TOKEN"] = "fake-token"
os.environ.pop("BACKUP_ENCRYPTION_KEY", None)

assert uploads.save_upload(IMG, "bills", "scan1", ".jpg", "unused", private=True) is None
assert fake.store == {}, "a scan must not be uploaded without an encryption key"

key = Fernet.generate_key().decode()
os.environ["BACKUP_ENCRYPTION_KEY"] = key
url = uploads.save_upload(IMG, "bills", "scan1", ".jpg", "unused", private=True)
assert url and url.endswith(".enc")
(stored,) = fake.store.values()
assert IMG not in stored and b"fake-jpeg" not in stored, "scan must not be stored readable"
assert Fernet(key).decrypt(stored) == IMG

fake.store.clear()
photo = uploads.save_upload(IMG, "items", "item1", ".jpg", "unused")
assert photo.endswith(".jpg")
assert list(fake.store.values()) == [IMG]

print("OK — scans are stored encrypted (or not at all without a key); item photos unchanged.")
