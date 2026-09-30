"""Self-check: GET /users/resolve-username/email-exists/{email} says whether a
Firebase account uses that email, and treats a malformed email as "no".

Run: backend/venv/Scripts/python.exe backend/test_email_exists.py
"""
import os
import sys
from types import SimpleNamespace

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from routers import users


class NotFound(Exception):
    pass


def get_user_by_email(email):
    if email == "bad":
        raise ValueError("malformed")
    if email != "owner@shop.pk":
        raise NotFound()
    return object()


users.FIREBASE_READY = True
users.firebase_auth = SimpleNamespace(
    get_user_by_email=get_user_by_email, UserNotFoundError=NotFound
)

assert users.email_exists("owner@shop.pk", None) == {"exists": True}
assert users.email_exists(" owner@shop.pk ", None) == {"exists": True}
assert users.email_exists("nobody@shop.pk", None) == {"exists": False}
assert users.email_exists("bad", None) == {"exists": False}
print("OK — email-exists reports existing, unknown and malformed emails correctly.")
