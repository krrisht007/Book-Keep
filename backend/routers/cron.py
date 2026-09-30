"""Vercel Cron entry points for the daily jobs that used to run only on an
in-process background thread (see scheduled_backup.py / scheduled_notifications.py).

A serverless deployment has no long-lived process for a thread to run on, so
Vercel instead calls these two endpoints once a day (see ../../vercel.json's
"crons" entries) and each call reuses the exact same idempotent
run_due_*() functions the local/persistent-server thread already calls —
nothing about the job logic itself changes between the two deployment modes.

Vercel signs cron requests with "Authorization: Bearer <CRON_SECRET>", which
is not a Firebase ID token, so these paths are exempted from AuthMiddleware
(see auth.py) and verify the secret here instead.
"""
import os

from fastapi import APIRouter, HTTPException, Request

import scheduled_backup
import scheduled_notifications

router = APIRouter(prefix="/internal/cron", tags=["cron"])

def _require_cron_secret(request: Request) -> None:
    secret = os.getenv("CRON_SECRET", "")
    header = request.headers.get("authorization", "")
    if not secret or header != f"Bearer {secret}":
        raise HTTPException(status_code=401, detail="Invalid or missing cron secret")

@router.api_route("/backup", methods=["GET", "POST"])
def run_backup(request: Request):
    _require_cron_secret(request)
    return {"ran": scheduled_backup.run_due_backup()}

@router.api_route("/notifications", methods=["GET", "POST"])
def run_notifications(request: Request):
    _require_cron_secret(request)
    return {"ran": scheduled_notifications.run_due_checks()}
