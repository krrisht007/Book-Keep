"""Uploads the release APK to Vercel Blob for the in-app updater, then keeps only
the newest KEEP builds so the free storage doesn't fill up.

Run by CI: python publish_apk.py <apk path> <build number>
Needs BLOB_READ_WRITE_TOKEN in the environment (a GitHub secret).
The backend's GET /app/latest reads what this uploads.
"""
import os
import re
import sys

from vercel import blob

KEEP = 2
PREFIX = "app-releases/"


def use_working_token():
    """A secret pasted from a .env file can carry quote marks, spaces, a newline
    or a whole extra line, and Blob answers all of those with a vague "Unknown
    error". Try the token pattern first, then the value with all whitespace
    removed, and keep whichever one Blob accepts."""
    raw = os.environ.get("BLOB_READ_WRITE_TOKEN", "")
    found = re.findall(r"vercel_blob_rw_[A-Za-z0-9_]+", raw)
    squashed = "".join(raw.split()).strip("\"'")
    for candidate in dict.fromkeys([*found[:1], squashed]):
        if not candidate:
            continue
        os.environ["BLOB_READ_WRITE_TOKEN"] = candidate
        try:
            blob.list_objects(prefix=PREFIX)
            return
        except Exception:
            continue
    print(
        f"::error title=Blob token::BLOB_READ_WRITE_TOKEN is not usable "
        f"({len(raw.splitlines())} line(s), {len(raw)} characters). "
        f"Re-create the secret as the single token line."
    )
    sys.exit(1)


use_working_token()

apk, build = sys.argv[1], int(sys.argv[2])
with open(apk, "rb") as f:
    data = f.read()
print(f"uploading {len(data) / 1e6:.1f} MB")
try:
    uploaded = blob.put(
        f"{PREFIX}bookkeeper-{build}.apk",
        data,
        access="public",
        content_type="application/vnd.android.package-archive",
        add_random_suffix=True,  # unguessable URL; only /app/latest hands it out
        multipart=True,  # a release APK is far too big for one plain PUT
    )
except Exception as e:
    # The SDK wraps the real cause in BlobUnknownError; show it in the CI log.
    print("upload failed:", repr(e), "| cause:", repr(e.__cause__))
    raise
print("uploaded", uploaded.pathname)

found, cursor = [], None
while True:
    page = blob.list_objects(prefix=PREFIX, cursor=cursor)
    found += page.blobs
    if not page.has_more:
        break
    cursor = page.cursor


def build_of(b):
    m = re.search(r"bookkeeper-(\d+)", b.pathname)
    return int(m.group(1)) if m else 0


found.sort(key=build_of)
stale = found[:-KEEP]
if stale:
    blob.delete([b.url for b in stale])
    print("pruned", [b.pathname for b in stale])
