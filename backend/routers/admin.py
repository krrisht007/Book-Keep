"""Admin panel: user account management, gated to admin accounts."""
from datetime import datetime, timezone

from fastapi import APIRouter, Depends, HTTPException, Request
from sqlalchemy.orm import Session

import models
import schemas
from database import get_db
from firebase_setup import FIREBASE_READY, firebase_auth
from utils.activity_log import log_activity
from utils.permissions import _is_admin

router = APIRouter()

def _require_admin(request: Request) -> dict:
    """FastAPI dependency guarding every /admin route."""
    if not FIREBASE_READY:
        raise HTTPException(
            status_code=503,
            detail=(
                "Admin API needs Firebase. Set FIREBASE_SERVICE_ACCOUNT_PATH in "
                "backend/.env to the service-account JSON path and restart."
            ),
        )
    claims = request.scope.get("user") or {}
    if not _is_admin(claims):
        raise HTTPException(status_code=403, detail="Admin access required.")
    return claims

def _admin_user_out(user) -> dict:
    claims = user.custom_claims or {}
    created = None
    if user.user_metadata and user.user_metadata.creation_timestamp:
        created = datetime.fromtimestamp(
            user.user_metadata.creation_timestamp / 1000, tz=timezone.utc
        ).isoformat()
    return {
        "uid": user.uid,
        "email": user.email,
        "display_name": user.display_name,
        "phone_number": user.phone_number,
        "username": claims.get("username"),
        "disabled": bool(user.disabled),
        "email_verified": bool(user.email_verified),
        "is_admin": claims.get("admin") is True,
        "can_manage": claims.get("can_manage") is True,
        "created_at": created,
    }

@router.get("/admin/status")
def admin_status(request: Request):
    """Whether the calling user is an admin. Used by the app to show/hide the
    panel and by the panel to explain why it's unavailable."""
    claims = request.scope.get("user") or {}
    if not FIREBASE_READY:
        return {
            "is_admin": False,
            "mode": "open",
            "reason": (
                "Firebase service account not configured. Set "
                "FIREBASE_SERVICE_ACCOUNT_PATH in backend/.env and restart."
            ),
        }
    return {
        "is_admin": _is_admin(claims),
        "mode": "secure",
        "email": claims.get("email"),
        "reason": "",
    }

@router.get("/admin/users")
def admin_list_users(_: dict = Depends(_require_admin)):
    """Every Firebase Auth account, newest first."""
    users = []
    for user in firebase_auth.list_users(max_results=1000).iterate_all():
        users.append(_admin_user_out(user))
    users.sort(key=lambda u: (u["email"] or "").lower())
    return users

@router.post("/admin/users")
def admin_create_user(
    data: schemas.AdminUserCreate, request: Request = None,
    _: dict = Depends(_require_admin), db: Session = Depends(get_db),
):
    """Create a Firebase account (optionally granting admin and/or
    can_manage — see utils/permissions.py)."""
    try:
        user = firebase_auth.create_user(
            email=data.email.strip(),
            password=data.password,
            display_name=data.name or None,
        )
    except Exception as exc:
        raise HTTPException(status_code=400, detail=str(exc))
    claims = {}
    if data.admin:
        claims["admin"] = True
    if data.can_manage:
        claims["can_manage"] = True
    if claims:
        firebase_auth.set_custom_user_claims(user.uid, claims)
    tags = [t for t, on in [("admin", data.admin), ("can_manage", data.can_manage)] if on]
    label = f"Created account {data.email}" + (f" ({', '.join(tags)})" if tags else "")
    log_activity(db, request, "admin_create_user", label)
    return _admin_user_out(firebase_auth.get_user(user.uid))

@router.patch("/admin/users/{uid}")
def admin_update_user(
    uid: str, data: schemas.AdminUserUpdate, request: Request,
    _: dict = Depends(_require_admin), db: Session = Depends(get_db),
):
    """Update name / email / password / disabled state, and set or clear admin."""
    claims = request.scope.get("user") or {}
    if claims.get("uid") == uid and (data.disabled is True or data.admin is False):
        raise HTTPException(status_code=400, detail="You can't disable or remove your own admin access.")
    kwargs = {}
    if data.email is not None:
        kwargs["email"] = data.email.strip()
    if data.password is not None:
        kwargs["password"] = data.password
    if data.name is not None:
        kwargs["display_name"] = data.name
    if data.disabled is not None:
        kwargs["disabled"] = data.disabled
    if kwargs:
        try:
            firebase_auth.update_user(uid, **kwargs)
        except Exception as exc:
            raise HTTPException(status_code=400, detail=str(exc))
    if data.admin is not None:
        current = dict(firebase_auth.get_user(uid).custom_claims or {})
        if data.admin:
            current["admin"] = True
        else:
            current.pop("admin", None)
        firebase_auth.set_custom_user_claims(uid, current or None)
        kwargs["admin"] = data.admin
    if data.can_manage is not None:
        current = dict(firebase_auth.get_user(uid).custom_claims or {})
        if data.can_manage:
            current["can_manage"] = True
        else:
            current.pop("can_manage", None)
        firebase_auth.set_custom_user_claims(uid, current or None)
        kwargs["can_manage"] = data.can_manage
    log_activity(db, request, "admin_update_user", f"Updated {uid}: {', '.join(kwargs) or 'no changes'}")
    return _admin_user_out(firebase_auth.get_user(uid))

@router.delete("/admin/users/{uid}")
def admin_delete_user(
    uid: str, request: Request,
    _: dict = Depends(_require_admin), db: Session = Depends(get_db),
):
    """Delete a Firebase account. You can't delete your own (would lock you out)."""
    claims = request.scope.get("user") or {}
    if claims.get("uid") == uid:
        raise HTTPException(status_code=400, detail="You can't delete your own account.")
    email = None
    try:
        email = firebase_auth.get_user(uid).email
    except Exception:
        pass
    try:
        firebase_auth.delete_user(uid)
    except Exception as exc:
        raise HTTPException(status_code=400, detail=str(exc))
    log_activity(db, request, "admin_delete_user", f"Deleted account {email or uid}")
    return {"status": "deleted"}

@router.get("/admin/activity-log")
def admin_activity_log(
    limit: int = 200, _: dict = Depends(_require_admin), db: Session = Depends(get_db),
):
    """Most recent staff activity, newest first — who did what, for
    accountability when multiple people share the shop account. Only
    sensitive/hard-to-reverse actions are recorded (see models.ActivityLog);
    this is not a full audit of every read or routine edit."""
    entries = (
        db.query(models.ActivityLog)
        .order_by(models.ActivityLog.created_at.desc())
        .limit(min(limit, 1000))
        .all()
    )
    return [
        {
            "id": e.id,
            "user_email": e.user_email,
            "user_name": e.user_name,
            "action": e.action,
            "details": e.details,
            "created_at": e.created_at,
        }
        for e in entries
    ]

@router.get("/admin/smtp-settings", response_model=schemas.SmtpSettingsOut)
def get_smtp_settings(_: dict = Depends(_require_admin), db: Session = Depends(get_db)):
    stored = {row.key: row.value for row in db.query(models.Setting).all()}
    port = stored.get("smtp_port")
    return schemas.SmtpSettingsOut(
        smtp_host=stored.get("smtp_host") or "",
        smtp_port=int(port) if port else None,
        smtp_username=stored.get("smtp_username") or "",
        smtp_from_name=stored.get("smtp_from_name") or "",
        configured=bool(stored.get("smtp_password")),
    )

@router.put("/admin/smtp-settings", response_model=schemas.SmtpSettingsOut)
def update_smtp_settings(
    update: schemas.SmtpSettingsUpdate,
    request: Request = None,
    _: dict = Depends(_require_admin),
    db: Session = Depends(get_db),
):
    for key, value in update.model_dump(exclude_none=True).items():
        row = db.query(models.Setting).filter(models.Setting.key == key).first()
        if row is None:
            db.add(models.Setting(key=key, value=str(value)))
        else:
            row.value = str(value)
    db.commit()
    log_activity(db, request, "admin_update_smtp", "Updated SMTP settings")
    return get_smtp_settings(_=_, db=db)
