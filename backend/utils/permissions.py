"""Role/permission checks against Firebase custom claims.

Before this existed, any authenticated account (not just an admin) could
void/delete/return a bill or delete a customer/supplier — the same actions
utils/activity_log.py now records. `can_manage` closes that gap: an admin
always has it implicitly; granted separately to a non-admin account via the
admin panel's "Can void/delete/return" toggle. Defaults to False for a
new/unset account — least privilege.
"""
from fastapi import HTTPException, Request

from config import ADMIN_EMAILS


def _is_admin(claims: dict) -> bool:
    """Admin if the user holds the `admin: true` custom claim (set from the
    panel) or their verified email is listed in ADMIN_EMAILS (bootstrap)."""
    if not claims:
        return False
    if claims.get("admin") is True:
        return True
    if claims.get("email_verified") is not True:
        return False
    email = (claims.get("email") or "").strip().lower()
    return email in ADMIN_EMAILS


def require_manage(request: Request = None) -> None:
    """Guards void/delete/return actions (bills.py, customers.py,
    suppliers.py). A no-op when auth is running in open/dev mode — auth.py's
    middleware never sets request.scope["user"] at all in that mode, so
    there's no claims to check and every route already behaves this way
    (unauthenticated-but-open) for everything else, too."""
    if request is None or "user" not in request.scope:
        return
    claims = request.scope.get("user") or {}
    if _is_admin(claims) or claims.get("can_manage") is True:
        return
    raise HTTPException(
        status_code=403,
        detail="You don't have permission to do this — ask an admin.",
    )
