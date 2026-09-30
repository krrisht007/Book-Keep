"""Self-check: AuthMiddleware must be registered before CORSMiddleware in
main.py, not after.

Starlette wraps middleware in reverse registration order, so whichever is
added *last* ends up outermost — the first to see an incoming request. A
browser's CORS preflight (OPTIONS) request never carries the Authorization
header, so if Auth were outermost it would 401 the preflight itself before
CORSMiddleware ever got a chance to attach the Access-Control-Allow-Origin
header the browser needs — silently breaking every real request from the
Flutter *web* build once Firebase auth is actually configured (open dev mode
currently masks this, since it lets every request through unchecked).

Two checks: (1) proves that general Starlette ordering claim in isolation
with two dummy middlewares, so the reasoning itself is verified, not just
assumed; (2) confirms main.py's actual source still registers them in the
correct order, without importing main.py itself (which would run real
migrations against the live database as an import side effect).

Run: backend/venv/Scripts/python.exe backend/test_middleware_order.py
"""
import os
import re

from fastapi import FastAPI
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.testclient import TestClient

_seen_order = []

class _First(BaseHTTPMiddleware):
    async def dispatch(self, request, call_next):
        _seen_order.append("first_registered")
        return await call_next(request)

class _Second(BaseHTTPMiddleware):
    async def dispatch(self, request, call_next):
        _seen_order.append("second_registered")
        return await call_next(request)

app = FastAPI()

@app.get("/ping")
def ping():
    return {"ok": True}

app.add_middleware(_First)
app.add_middleware(_Second)

TestClient(app).get("/ping")
assert _seen_order == ["second_registered", "first_registered"], (
    "expected the middleware added *second* to run first (outermost); got "
    f"{_seen_order}"
)

main_py = os.path.join(os.path.dirname(__file__), "main.py")
with open(main_py, encoding="utf-8") as f:
    source = f.read()

auth_pos = re.search(r"add_middleware\(AuthMiddleware", source)
cors_pos = re.search(r"add_middleware\(\s*\n?\s*CORSMiddleware", source)
assert auth_pos and cors_pos, "could not find both add_middleware calls in main.py"
assert auth_pos.start() < cors_pos.start(), (
    "AuthMiddleware must be registered before CORSMiddleware in main.py — "
    "CORS needs to end up outermost so it can handle a preflight request "
    "before Auth ever sees it"
)

print("OK — AuthMiddleware is registered before CORSMiddleware, so CORS ends up outermost.")
