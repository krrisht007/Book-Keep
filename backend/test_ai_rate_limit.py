"""Self-check: utils/rate_limit.py's per-route limiters — the generic
global limiter (main.py, 120/min per IP) doesn't protect against one
client hammering just the AI-backed routes (Gemini or Anthropic), or the unauthenticated
username-resolution route, specifically. Covers, for each limiter: under
the limit passes, over it raises 429, a different client IP has its own
independent count, no request at all (direct/scheduled call, no HTTP
layer) is a no-op, and the two limiters don't share a bucket.

Run: backend/venv/Scripts/python.exe backend/test_ai_rate_limit.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from fastapi import HTTPException

from utils import rate_limit
from utils.rate_limit import require_ai_rate_limit, require_auth_rate_limit

class _FakeClient:
    def __init__(self, host):
        self.host = host

class _FakeRequest:
    def __init__(self, host):
        self.client = _FakeClient(host)

def _check_limiter(fn, max_requests):
    req = _FakeRequest("1.2.3.4")

    for _ in range(max_requests):
        fn(req)

    try:
        fn(req)
        assert False, "should have rejected the request past the limit"
    except HTTPException as e:
        assert e.status_code == 429, e.status_code

    fn(_FakeRequest("5.6.7.8"))

    fn(None)

rate_limit._request_times = {}
_check_limiter(require_ai_rate_limit, rate_limit._AI_MAX_REQUESTS)

rate_limit._request_times = {}
_check_limiter(require_auth_rate_limit, rate_limit._AUTH_MAX_REQUESTS)

rate_limit._request_times = {}
req = _FakeRequest("9.9.9.9")
for _ in range(rate_limit._AI_MAX_REQUESTS):
    require_ai_rate_limit(req)
require_auth_rate_limit(req)

print("All rate-limit tests passed.")
