"""Initializes firebase-admin from the service-account JSON, if configured.

Imported once by main.py (which triggers the initialize_app() call as a side
effect of import) and by any router that needs to know whether Firebase is
ready (admin.py, notifications.py) or needs the auth/messaging submodules, or
needs the Storage bucket for uploads (utils/uploads.py — see get_bucket()).
"""
import json
import os

import firebase_admin
from firebase_admin import auth as firebase_auth
from firebase_admin import credentials as firebase_creds
from firebase_admin import messaging as firebase_messaging
from firebase_admin import storage as firebase_storage

from config import (
    FIREBASE_SERVICE_ACCOUNT_PATH,
    FIREBASE_SERVICE_ACCOUNT_JSON,
    FIREBASE_STORAGE_BUCKET,
)

if FIREBASE_SERVICE_ACCOUNT_PATH and os.path.isfile(FIREBASE_SERVICE_ACCOUNT_PATH):
    _firebase_cred = firebase_creds.Certificate(FIREBASE_SERVICE_ACCOUNT_PATH)
elif FIREBASE_SERVICE_ACCOUNT_JSON:
    _firebase_cred = firebase_creds.Certificate(json.loads(FIREBASE_SERVICE_ACCOUNT_JSON))
else:
    _firebase_cred = None

if _firebase_cred is not None:
    _init_kwargs = {"storageBucket": FIREBASE_STORAGE_BUCKET} if FIREBASE_STORAGE_BUCKET else {}
    firebase_admin.initialize_app(_firebase_cred, _init_kwargs)
    FIREBASE_READY = True
else:
    FIREBASE_READY = False

def get_bucket():
    """The Firebase Storage bucket for uploads, or None when not configured
    (no service account, or FIREBASE_STORAGE_BUCKET unset) — callers fall
    back to local disk in that case. See utils/uploads.py."""
    if not FIREBASE_READY or not FIREBASE_STORAGE_BUCKET:
        return None
    return firebase_storage.bucket()
