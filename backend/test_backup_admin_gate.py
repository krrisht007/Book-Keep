"""Self-check: downloading or restoring the full database must require an
admin account, same as every /admin/* route — the Backup & Export screen was
previously reachable by any signed-in staff/cashier account with no gate on
either the client or the backend, letting anyone overwrite (or download the
entirety of) the shop's data.

Checks both that the routes actually declare the admin dependency (catches a
regression where someone removes it later) and that the dependency itself
rejects a non-admin / accepts an admin.

Run: backend/venv/Scripts/python.exe backend/test_backup_admin_gate.py
"""
import inspect
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from fastapi import HTTPException
from fastapi.params import Depends as DependsMarker

import routers.admin as admin_module
from routers.backup import backup_database, restore_database

for fn in (backup_database, restore_database):
    default = inspect.signature(fn).parameters["_"].default
    assert isinstance(default, DependsMarker) and default.dependency is admin_module._require_admin, \
        f"{fn.__name__} is missing the admin-required dependency"

admin_module.FIREBASE_READY = True


class _FakeRequest:
    def __init__(self, claims):
        self.scope = {"user": claims}


try:
    admin_module._require_admin(_FakeRequest({}))
    assert False, "a non-admin should have been rejected"
except HTTPException as e:
    assert e.status_code == 403, e.status_code

claims = admin_module._require_admin(_FakeRequest({"admin": True}))
assert claims == {"admin": True}

print("OK — full database backup/restore require an admin account.")
