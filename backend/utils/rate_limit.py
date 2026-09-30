"""Per-route rate limiting, tighter than main.py's global per-IP limit
(120/min) — for routes where the global limit isn't strict enough: the
AI-backed endpoints (Gemini or Anthropic, cost real money/quota per request) and the
unauthenticated pre-login username lookup (an email-enumeration /
brute-force target that has no auth token to key off of).

ponytail: in-memory, per-process, resets on restart — same tradeoff
main.py's own global limiter already accepts (see its comment); move to
Redis (or the `slowapi` package) if this ever runs with more than one
worker.
"""
import logging
import time
from collections import deque

from fastapi import HTTPException, Request

_log = logging.getLogger("bookkeeper.rate_limit")

_AI_MAX_REQUESTS = 10
_AI_WINDOW_SECONDS = 3600

_SPEAK_MAX_REQUESTS = 60
_SPEAK_WINDOW_SECONDS = 3600

_TRANSLATE_MAX_REQUESTS = 120
_TRANSLATE_WINDOW_SECONDS = 3600

_AUTH_MAX_REQUESTS = 10
_AUTH_WINDOW_SECONDS = 900

_request_times: dict = {}

def _check(bucket: str, request: Request | None, max_requests: int, window_seconds: int) -> None:
    if request is None or request.client is None:
        return
    key = (bucket, request.client.host)
    now = time.time()
    times = _request_times.setdefault(key, deque(maxlen=max_requests * 3))
    times.append(now)
    recent = sum(1 for t in times if now - t <= window_seconds)
    if recent > max_requests:
        _log.warning(
            "rate limit hit: bucket=%s host=%s recent=%d max=%d",
            bucket, request.client.host, recent, max_requests,
        )
        raise HTTPException(
            status_code=429,
            detail=(
                f"Too many requests — max {max_requests} per "
                f"{window_seconds // 60} minutes. Try again shortly."
            ),
        )

def require_ai_rate_limit(request: Request | None) -> None:
    """Call as the first line of an AI-backed route (mirrors
    utils/permissions.py's require_manage). A no-op when request is None —
    the scheduled morning-briefing job calls its handler directly with no
    HTTP request at all, same as every other permission-style check in this
    codebase already treats that case."""
    _check("ai", request, _AI_MAX_REQUESTS, _AI_WINDOW_SECONDS)

def require_speak_rate_limit(request: Request | None) -> None:
    """First line of POST /reports/speak (Gemini text-to-speech)."""
    _check("speak", request, _SPEAK_MAX_REQUESTS, _SPEAK_WINDOW_SECONDS)

def require_translate_rate_limit(request: Request | None) -> None:
    """First line of POST /translate (names in the app's language; cached, so
    most calls never reach Gemini)."""
    _check("translate", request, _TRANSLATE_MAX_REQUESTS, _TRANSLATE_WINDOW_SECONDS)

def require_auth_rate_limit(request: Request | None) -> None:
    """Call as the first line of an unauthenticated auth-adjacent route
    (currently just GET /users/resolve-username/{username}). Firebase
    itself throttles repeated wrong-password sign-ins natively
    (auth/too-many-requests, already handled in login_screen.dart) — this
    covers the one auth-flow endpoint that's ours, not Firebase's, and
    which would otherwise let an unauthenticated caller enumerate every
    username → email mapping in the system at the global limiter's loose
    120/min."""
    _check("auth", request, _AUTH_MAX_REQUESTS, _AUTH_WINDOW_SECONDS)
