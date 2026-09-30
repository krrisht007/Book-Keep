"""Tells the phone which app build is newest and where to download it.

CI (.github/scripts/publish_apk.py) uploads each release APK to Blob as
app-releases/bookkeeper-<build>-<random>.apk. Like every route this sits
behind AuthMiddleware, so the unguessable download URL is only ever handed
to a logged-in user and never ships inside the app.
"""
import re

from fastapi import APIRouter

from utils import uploads

router = APIRouter(prefix="/app", tags=["app"])

_PREFIX = "app-releases/"
_APK = re.compile(r"bookkeeper-(\d+)(?:-[A-Za-z0-9]+)?\.apk$")


def newest_apk(blobs) -> dict:
    """The blob with the highest build number, as {version_code, url}, or
    {version_code: 0, url: None} when there is none."""
    best = {"version_code": 0, "url": None}
    for b in blobs:
        m = _APK.search(b.pathname)
        if m and int(m.group(1)) > best["version_code"]:
            best = {"version_code": int(m.group(1)), "url": b.url}
    return best


@router.get("/latest")
def latest():
    if not uploads._use_blob():
        return {"version_code": 0, "url": None}
    blob = uploads._blob()
    found, cursor = [], None
    while True:
        page = blob.list_objects(prefix=_PREFIX, cursor=cursor)
        found += page.blobs
        if not page.has_more:
            return newest_apk(found)
        cursor = page.cursor
