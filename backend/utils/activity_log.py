"""Records who did what for accountability (see models.ActivityLog) — the
same request.scope["user"] claims AuthMiddleware already verifies (see
auth.py), read the same way admin.py's routes already do.

Logging must never break the real action it's attached to: any failure
here is swallowed after rolling back, so a logging bug can't turn a
successful void/delete into a 500.
"""
from typing import Optional

import models


def _actor(request) -> tuple[Optional[str], Optional[str]]:
    """(email, name) of the signed-in user making this request, or (None,
    None) when there isn't one (open/dev mode, or no request available —
    e.g. a self-check test calling a route function directly)."""
    claims = (request.scope.get("user") if request else None) or {}
    return claims.get("email"), claims.get("name")


def log_activity(db, request, action: str, details: str = "") -> None:
    try:
        email, name = _actor(request)
        db.add(models.ActivityLog(
            user_email=email,
            user_name=name,
            action=action,
            details=details,
        ))
        db.commit()
    except Exception:
        db.rollback()
