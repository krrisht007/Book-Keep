"""Self-check: an admin can't disable or de-admin their own account via
PATCH /admin/users/{uid} — the same self-lockout the delete route already
guards against (admin_delete_user's "can't delete your own account").
Without this, revoking your own admin claim (or disabling yourself) could
permanently lock you out of the panel with no way back in.

Run: backend/venv/Scripts/python.exe backend/test_admin_self_lockout.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from fastapi import HTTPException

import schemas
from routers.admin import admin_update_user

class _FakeRequest:
    def __init__(self, uid):
        self.scope = {"user": {"uid": uid}}

try:
    admin_update_user(
        uid="me", data=schemas.AdminUserUpdate(admin=False),
        request=_FakeRequest("me"), _={},
    )
    assert False, "should have refused to remove own admin access"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

try:
    admin_update_user(
        uid="me", data=schemas.AdminUserUpdate(disabled=True),
        request=_FakeRequest("me"), _={},
    )
    assert False, "should have refused to disable own account"
except HTTPException as e:
    assert e.status_code == 400, e.status_code

print("OK — an admin can't disable or de-admin their own account.")
