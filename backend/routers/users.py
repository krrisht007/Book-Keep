"""The signed-in user's own account profile — phone number and username,
both collected at sign-up. Neither is a native Firebase Auth field for a
password account, so both are saved through firebase-admin (this backend,
trusted) rather than the client SDK:
- phone: client SDK can only set it via full SMS/OTP verification.
- username: Auth has no such field at all — stored as a custom claim."""
from fastapi import APIRouter, HTTPException, Request
from pydantic import BaseModel

from firebase_setup import FIREBASE_READY, firebase_auth
from utils.rate_limit import require_auth_rate_limit

router = APIRouter()

class PhoneUpdate(BaseModel):
    phone: str

class UsernameUpdate(BaseModel):
    username: str

def _find_user_by_username(username: str):
    """Scans every account for one whose 'username' custom claim matches
    (case-insensitive). Same list-and-scan approach admin.py's user list
    already uses — fine at this app's scale (a shop's handful of staff
    accounts), and avoids a whole second lookup table just for this."""
    target = username.strip().lower()
    if not target:
        return None
    for user in firebase_auth.list_users(max_results=1000).iterate_all():
        claims = user.custom_claims or {}
        if (claims.get("username") or "").lower() == target:
            return user
    return None

@router.delete("/users/me")
def delete_own_account(request: Request):
    """Deletes the calling (token-verified) user's own Firebase Auth account
    — Play Store policy requires an in-app way to do this once an app
    supports account creation. Only removes the sign-in credential; the
    shop's own records (bills, customers, etc.) aren't per-user data — they
    stay, same as they already do for created_by_email/created_by_name on a
    since-removed staff member (see utils/activity_log.py)."""
    if not FIREBASE_READY:
        raise HTTPException(status_code=503, detail="Firebase not configured.")
    claims = request.scope.get("user") or {}
    uid = claims.get("uid")
    if not uid:
        raise HTTPException(status_code=401, detail="Not signed in.")
    try:
        firebase_auth.delete_user(uid)
    except Exception as exc:
        raise HTTPException(status_code=400, detail=f"Could not delete account: {exc}")
    return {"ok": True}

@router.post("/users/phone")
def set_phone(body: PhoneUpdate, request: Request):
    """Sets the calling (token-verified) user's phone number."""
    if not FIREBASE_READY:
        raise HTTPException(status_code=503, detail="Firebase not configured.")
    claims = request.scope.get("user") or {}
    uid = claims.get("uid")
    if not uid:
        raise HTTPException(status_code=401, detail="Not signed in.")
    try:
        firebase_auth.update_user(uid, phone_number=body.phone)
    except Exception as exc:
        raise HTTPException(status_code=400, detail=f"Could not save phone: {exc}")
    return {"ok": True}

@router.post("/users/username")
def set_username(body: UsernameUpdate, request: Request):
    """Sets the calling user's username, rejecting one already taken by
    someone else. Merges into existing custom claims so this never clobbers
    the admin/can_manage flags admin.py sets separately."""
    if not FIREBASE_READY:
        raise HTTPException(status_code=503, detail="Firebase not configured.")
    claims = request.scope.get("user") or {}
    uid = claims.get("uid")
    if not uid:
        raise HTTPException(status_code=401, detail="Not signed in.")
    username = body.username.strip()
    if not username:
        raise HTTPException(status_code=400, detail="Username can't be empty.")
    existing = _find_user_by_username(username)
    if existing and existing.uid != uid:
        raise HTTPException(status_code=409, detail="That username is already taken.")
    try:
        user = firebase_auth.get_user(uid)
        merged_claims = {**(user.custom_claims or {}), "username": username}
        firebase_auth.set_custom_user_claims(uid, merged_claims)
    except Exception as exc:
        raise HTTPException(status_code=400, detail=f"Could not save username: {exc}")
    return {"ok": True}

@router.get("/users/resolve-username/{username}")
def resolve_username(username: str, request: Request = None):
    """Looks up the email behind a username, so the login screen can accept
    either. Deliberately unauthenticated — this has to work before the user
    has a token, the same as email itself does on the login form. Rate
    limited (see utils/rate_limit.py) since an unauthenticated, unlimited
    version of this would let anyone enumerate every username → email in
    the system."""
    require_auth_rate_limit(request)
    if not FIREBASE_READY:
        raise HTTPException(status_code=503, detail="Firebase not configured.")
    user = _find_user_by_username(username)
    if not user:
        raise HTTPException(
            status_code=404, detail="No account found for that username."
        )
    return {"email": user.email}

@router.get("/users/resolve-username/email-exists/{email}")
def email_exists(email: str, request: Request = None):
    """Lets the login screen say "no account uses that email" instead of
    Firebase's deliberately vague wrong-email-or-password reply. Unauthenticated
    for the same reason resolve-username is, and rate limited the same way."""
    require_auth_rate_limit(request)
    if not FIREBASE_READY:
        raise HTTPException(status_code=503, detail="Firebase not configured.")
    try:
        firebase_auth.get_user_by_email(email.strip())
    except (firebase_auth.UserNotFoundError, ValueError):
        return {"exists": False}
    return {"exists": True}
