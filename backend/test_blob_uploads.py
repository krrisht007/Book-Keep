"""Self-check: photo uploads via Vercel Blob (utils/uploads.py) using an in-memory
fake of the SDK — no token or network. Covers: full https URL returned, replaced
photos get a new URL and the old blob is removed, ids sharing a prefix aren't
touched, a failed upload keeps the existing photo (and 502s), delete_upload, and
that local-disk mode is unchanged when no token is set.

Run: backend/venv/Scripts/python.exe backend/test_blob_uploads.py
"""
import os
import sys
import tempfile
from types import SimpleNamespace

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from fastapi import HTTPException

from utils import uploads

class FakeBlob:
    """Minimal stand-in for vercel.blob: in-memory store, 2-item pages so the
    has_more/cursor loop is exercised."""

    def __init__(self):
        self.store: dict[str, dict] = {}
        self.fail_put = False
        self._n = 0

    def put(self, path, body, *, access, content_type, add_random_suffix):
        assert access == "public" and add_random_suffix is True
        if self.fail_put:
            raise RuntimeError("blob down")
        self._n += 1
        stem, ext = os.path.splitext(path)
        pathname = f"{stem}-Rnd{self._n}{ext}"
        url = f"https://store123.public.blob.vercel-storage.com/{pathname}"
        self.store[pathname] = {"url": url, "content_type": content_type}
        return SimpleNamespace(url=url, pathname=pathname)

    def list_objects(self, *, prefix=None, cursor=None, limit=None):
        names = sorted(p for p in self.store if p.startswith(prefix or ""))
        start = int(cursor or 0)
        chunk = names[start:start + 2]
        more = start + 2 < len(names)
        return SimpleNamespace(
            blobs=[SimpleNamespace(url=self.store[p]["url"], pathname=p) for p in chunk],
            has_more=more,
            cursor=str(start + 2) if more else None,
        )

    def delete(self, urls):
        gone = set(urls if not isinstance(urls, str) else [urls])
        self.store = {p: v for p, v in self.store.items() if v["url"] not in gone}

fake = FakeBlob()
uploads._blob = lambda: fake
os.environ["BLOB_READ_WRITE_TOKEN"] = "fake-token"

url1 = uploads.save_upload(b"a", "items", "abc", ".png", "/nonexistent")
assert url1.startswith("https://") and "/items/abc-" in url1, url1
assert list(fake.store.values())[0]["content_type"] == "image/png"

uploads.save_upload(b"x", "items", "abcd", ".jpg", "/nonexistent")
uploads.save_upload(b"y", "expenses", "abc", ".jpg", "/nonexistent")

url2 = uploads.save_upload(b"b", "items", "abc", ".jpg", "/nonexistent")
assert url2 != url1
names = sorted(fake.store)
assert not any("abc-Rnd1" in n for n in names), names
assert any(n.startswith("items/abc-") and n != "items/abcd" for n in names)
assert sum(n.startswith("items/abc-") for n in names) == 1, names
assert any(n.startswith("items/abcd-") for n in names), "abcd was wrongly deleted"
assert any(n.startswith("expenses/abc-") for n in names), "other folder wrongly deleted"

before = dict(fake.store)
fake.fail_put = True
try:
    uploads.save_upload(b"c", "items", "abc", ".png", "/nonexistent")
    raise AssertionError("expected HTTPException")
except HTTPException as e:
    assert e.status_code == 502, e.status_code
fake.fail_put = False
assert fake.store == before, "failed upload must not delete the old photo"

uploads.delete_upload("items", "abc", "/nonexistent")
assert not any(n.startswith("items/abc-") for n in fake.store)
assert any(n.startswith("items/abcd-") for n in fake.store)
uploads.delete_upload("items", "nope", "/nonexistent")

fake.store["items/mig.jpg"] = {"url": "https://store123.public.blob.vercel-storage.com/items/mig.jpg", "content_type": "image/jpeg"}
uploads.save_upload(b"d", "items", "mig", ".jpg", "/nonexistent")
assert "items/mig.jpg" not in fake.store and any(n.startswith("items/mig-") for n in fake.store)

del os.environ["BLOB_READ_WRITE_TOKEN"]
with tempfile.TemporaryDirectory() as d:
    rel = uploads.save_upload(b"z", "items", "loc", ".jpg", d)
    assert rel == "/uploads/items/loc.jpg", rel
    assert os.path.exists(os.path.join(d, "loc.jpg"))

print("OK — Vercel Blob uploads: full URLs, replace-then-delete, prefix-safe, failure-safe, local mode intact.")
