"""Self-check: /app/latest picks the highest build number, ignores other files,
and reports "nothing yet" when Blob has no APK.

Run: backend/venv/Scripts/python.exe backend/test_app_update.py
"""
import os
import sys
from types import SimpleNamespace as B

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from routers.app_update import newest_apk

blobs = [
    B(pathname="app-releases/bookkeeper-9-Ab3d.apk", url="u9"),
    B(pathname="app-releases/bookkeeper-12-Zx9q.apk", url="u12"),
    B(pathname="app-releases/bookkeeper-2.apk", url="u2"),
    B(pathname="app-releases/notes.txt", url="txt"),
]
assert newest_apk(blobs) == {"version_code": 12, "url": "u12"}, newest_apk(blobs)
assert newest_apk([]) == {"version_code": 0, "url": None}
assert newest_apk([B(pathname="app-releases/readme.txt", url="x")])["url"] is None
print("OK — /app/latest picks the highest build and ignores non-APK files.")
