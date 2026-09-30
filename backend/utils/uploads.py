"""Shared upload-size guard.

Every UploadFile-accepting route in this app (item/expense/logo photos, bill
and purchase scans, the full-database restore) reads the whole body into
memory with a bare `await file.read()` / `file.file.read()` and no size
check — an oversized upload just OOMs the process instead of failing
cleanly. One shared check instead of patching each site differently.

ponytail: validates after reading into memory rather than capping the
stream as it arrives — fine for this app's real upload sizes (phone
photos, scanned receipts, DB backups), revisit with a streaming/chunked
read if a legitimately huge file ever needs to pass through here.
"""
import mimetypes
import os
import re

from fastapi import HTTPException

import firebase_setup

DEFAULT_MAX_BYTES = 10 * 1024 * 1024

def enforce_max_size(contents: bytes, max_bytes: int = DEFAULT_MAX_BYTES) -> bytes:
    """Returns contents unchanged, or raises 413 if it's over max_bytes."""
    if len(contents) > max_bytes:
        raise HTTPException(
            status_code=413,
            detail=f"File too large — max {max_bytes // (1024 * 1024)}MB",
        )
    return contents

def _use_blob() -> bool:
    return bool(os.getenv("BLOB_READ_WRITE_TOKEN"))

def _blob():
    from vercel import blob

    return blob

def _blob_urls_for(blob, subdir: str, item_id: str) -> list[str]:
    """URLs of every stored blob belonging to item_id — "<id>.<ext>" (migrated
    files) or "<id>-<random>.<ext>" (Blob's unique-suffix uploads). Matching
    the whole filename keeps id "abc" from also catching "abcd-x.jpg"."""
    prefix = f"{subdir}/{item_id}" if subdir else item_id
    name = re.compile(rf"^{re.escape(item_id)}(-[A-Za-z0-9]+)?\.[A-Za-z0-9]+$")
    urls: list[str] = []
    cursor = None
    while True:
        page = blob.list_objects(prefix=prefix, cursor=cursor)
        urls += [b.url for b in page.blobs if name.match(b.pathname.rsplit("/", 1)[-1])]
        if not page.has_more:
            return urls
        cursor = page.cursor

def _blob_save(contents: bytes, subdir: str, item_id: str, ext: str, private: bool = False) -> str | None:
    if private:
        key = os.getenv("BACKUP_ENCRYPTION_KEY")
        if not key:
            return None
        from cryptography.fernet import Fernet

        contents, ext = Fernet(key).encrypt(contents), ".enc"
    blob = _blob()
    path = f"{subdir}/{item_id}{ext}" if subdir else f"{item_id}{ext}"
    try:
        old = _blob_urls_for(blob, subdir, item_id)
        result = blob.put(
            path,
            contents,
            access="public",
            content_type=mimetypes.guess_type(path)[0] or "application/octet-stream",
            add_random_suffix=True,
        )
    except Exception as exc:
        raise HTTPException(
            status_code=502, detail="Photo storage is unavailable — please try again."
        ) from exc
    if old:
        try:
            blob.delete(old)
        except Exception:
            pass
    return result.url

def save_upload(
    contents: bytes, subdir: str, item_id: str, ext: str, local_dir: str, private: bool = False
) -> str | None:
    """Saves contents as "<item_id><ext>" under subdir, first removing any
    previous file for this id (any extension) so replacements don't pile up.

    Storage, in priority order: Vercel Blob when BLOB_READ_WRITE_TOKEN is set
    (the production choice — Vercel's disk doesn't persist between
    invocations); else the Firebase Storage bucket if configured (see
    firebase_setup.get_bucket()); else local_dir on disk (local dev/tests —
    unchanged from before either existed).

    Returns a URL the app can load the file from directly: a full https URL
    for Blob/Firebase, or a server-relative "/uploads/..." path for local disk.

    private=True is for files the app never displays (bill/purchase scans): on
    Blob they are stored encrypted, or skipped (returns None) without a key,
    because that store is public. Local disk and Firebase ignore it.
    """
    if _use_blob():
        return _blob_save(contents, subdir, item_id, ext, private)
    delete_upload(subdir, item_id, local_dir)
    filename = f"{item_id}{ext}"
    blob_path = f"{subdir}/{filename}" if subdir else filename
    bucket = firebase_setup.get_bucket()
    if bucket is not None:
        blob = bucket.blob(blob_path)
        blob.upload_from_string(contents)
        blob.make_public()
        return blob.public_url
    os.makedirs(local_dir, exist_ok=True)
    with open(os.path.join(local_dir, filename), "wb") as f:
        f.write(contents)
    return f"/uploads/{blob_path}"

def delete_upload(subdir: str, item_id: str, local_dir: str) -> None:
    """Removes any existing file for item_id under subdir (any extension) —
    from Firebase Storage or local_dir, whichever is active. Best-effort: a
    missing file is not an error."""
    if _use_blob():
        try:
            blob = _blob()
            urls = _blob_urls_for(blob, subdir, item_id)
            if urls:
                blob.delete(urls)
        except Exception:
            pass
        return
    prefix = f"{subdir}/{item_id}." if subdir else f"{item_id}."
    bucket = firebase_setup.get_bucket()
    if bucket is not None:
        try:
            for blob in bucket.list_blobs(prefix=prefix):
                blob.delete()
        except Exception:
            pass
        return
    if not os.path.isdir(local_dir):
        return
    for existing in os.listdir(local_dir):
        if os.path.splitext(existing)[0] == item_id:
            try:
                os.remove(os.path.join(local_dir, existing))
            except OSError:
                pass
