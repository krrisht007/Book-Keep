"""Firebase ID-token authentication for the FastAPI app.

Every request except a small allowlist must carry an
``Authorization: Bearer <firebase-id-token>`` header. Tokens are verified with
firebase-admin, which is already initialized in main.py from
``FIREBASE_SERVICE_ACCOUNT_PATH``.

When the service account is NOT configured (dev machine before Firebase setup),
the middleware falls back to *open mode*: all requests pass, mirroring the
app's existing graceful degradation for push notifications. A loud warning is
logged once so it never silently ships. Set ``AUTH_REQUIRE=1`` in the .env to
force token verification even without a service account (only useful if you
initialize firebase-admin some other way).
"""
import logging
import os

from fastapi import Request
from fastapi.responses import JSONResponse
from starlette.middleware.base import BaseHTTPMiddleware

import firebase_admin
from firebase_admin import auth as firebase_auth

_log = logging.getLogger("bookkeeper.auth")

ALLOWED_PATHS = {"/", "/docs", "/redoc", "/openapi.json"}

class AuthMiddleware(BaseHTTPMiddleware):
    """Rejects requests without a valid Firebase ID token.

    ``firebase_ready`` should be True only when firebase-admin has been
    initialized with a service account (so ``verify_id_token`` works).
    """

    def __init__(self, app, firebase_ready: bool):
        super().__init__(app)
        self._firebase_ready = firebase_ready
        self._warned = False

    async def dispatch(self, request: Request, call_next):
        if (
            request.url.path in ALLOWED_PATHS
            or request.url.path.startswith("/uploads/")
            or request.url.path.startswith("/users/resolve-username/")
            or request.url.path.startswith("/internal/cron/")
        ):
            return await call_next(request)

        if not self._firebase_ready and not (
            os.getenv("AUTH_REQUIRE") or os.getenv("VERCEL")
        ):
            if not self._warned:
                _log.warning(
                    "Firebase auth DISABLED (FIREBASE_SERVICE_ACCOUNT_PATH unset) — "
                    "accepting all requests without a token. Set the env var in "
                    "backend/.env to protect the API."
                )
                self._warned = True
            return await call_next(request)

        header = request.headers.get("authorization", "")
        if not header.lower().startswith("bearer "):
            _log.warning(
                "auth rejected: no bearer token — %s %s from %s",
                request.method, request.url.path, request.client.host if request.client else "?",
            )
            return JSONResponse(
                status_code=401,
                content={"detail": "Missing or malformed Authorization header"},
            )
        token = header.split(" ", 1)[1].strip()
        if not token:
            return JSONResponse(
                status_code=401, content={"detail": "Missing bearer token"}
            )
        try:
            claims = firebase_auth.verify_id_token(token, clock_skew_seconds=10)
        except Exception as exc:
            _log.warning(
                "auth rejected: invalid/expired token — %s %s from %s: %s",
                request.method, request.url.path, request.client.host if request.client else "?", exc,
            )
            return JSONResponse(
                status_code=401,
                content={"detail": f"Invalid or expired token: {exc}"},
            )
        request.scope["user"] = claims
        return await call_next(request)
