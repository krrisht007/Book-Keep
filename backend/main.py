"""FastAPI app entrypoint: wiring only. Route logic lives in routers/, shared
helpers in utils/, and one-time startup work in migrations.py.
"""
import os
import time
from collections import deque

from dotenv import load_dotenv

load_dotenv(os.path.join(os.path.dirname(__file__), ".env"))

from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles

from config import API_DOCS, CORS_ORIGINS, UPLOADS_DIR
from auth import AuthMiddleware
import firebase_setup
import migrations
import scheduled_backup
import scheduled_notifications
from routers import (
    customers,
    suppliers,
    bills,
    purchases,
    items,
    expenses,
    reports,
    gst,
    backup,
    settings as settings_router,
    notifications,
    admin,
    search,
    users,
    cron,
    app_update,
    translate,
)

migrations.ensure_schema()

if not os.getenv("VERCEL"):
    scheduled_backup.start_scheduler()
    scheduled_notifications.start_scheduler()

app = FastAPI(**API_DOCS)

# Require a valid Firebase ID token on every route (see auth.py). When the
# service account isn't configured yet the middleware runs in open dev mode.
#
# Registered *before* CORSMiddleware below on purpose: Starlette builds its
# middleware stack by wrapping in reverse registration order, so the last
# middleware added ends up outermost — the first to see a request and the
# last to touch a response. CORS needs that outermost spot: a browser's
# preflight OPTIONS request never carries the Authorization header, so if
# Auth ran first it would 401 the preflight itself, before CORSMiddleware
# ever got a chance to attach the Access-Control-Allow-Origin header the
# browser needs to even see that response — silently breaking every real
# request from the Flutter *web* build the moment Firebase auth is actually
# configured (open dev mode masks this, since it passes every request
# through unchecked). Swapping the order lets CORS answer/annotate the
# preflight before Auth ever runs.
app.add_middleware(AuthMiddleware, firebase_ready=firebase_setup.FIREBASE_READY)

RATE_LIMIT_MAX_REQUESTS = 120
RATE_LIMIT_WINDOW_SECONDS = 60
_client_request_times: dict = {}

@app.middleware("http")
async def _track_and_rate_limit(request: Request, call_next):
    now = time.time()

    client_ip = request.client.host if request.client else "unknown"
    client_times = _client_request_times.setdefault(
        client_ip, deque(maxlen=RATE_LIMIT_MAX_REQUESTS * 3)
    )
    client_times.append(now)
    recent = sum(1 for t in client_times if now - t <= RATE_LIMIT_WINDOW_SECONDS)
    if recent > RATE_LIMIT_MAX_REQUESTS:
        return JSONResponse(
            status_code=429,
            content={
                "detail": f"Rate limit exceeded: max {RATE_LIMIT_MAX_REQUESTS} "
                f"requests per {RATE_LIMIT_WINDOW_SECONDS}s per client."
            },
        )
    return await call_next(request)

app.add_middleware(
    CORSMiddleware,
    allow_origins=CORS_ORIGINS,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"status": "Bookkeeper backend is running"}

os.makedirs(os.path.join(UPLOADS_DIR, "items"), exist_ok=True)
app.mount("/uploads", StaticFiles(directory=UPLOADS_DIR), name="uploads")

app.include_router(customers.router)
app.include_router(suppliers.router)
app.include_router(bills.router)
app.include_router(purchases.router)
app.include_router(items.router)
app.include_router(expenses.router)
app.include_router(reports.router)
app.include_router(gst.router)
app.include_router(backup.router)
app.include_router(settings_router.router)
app.include_router(notifications.router)
app.include_router(admin.router)
app.include_router(search.router)
app.include_router(users.router)
app.include_router(cron.router)
app.include_router(app_update.router)
app.include_router(translate.router)
