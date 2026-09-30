"""Self-check: the Vercel Cron endpoints (routers/cron.py) must reject any
request that doesn't carry the exact CRON_SECRET — otherwise the daily
backup/notification jobs (which bypass Firebase-token auth, see auth.py)
would be runnable by anyone who finds the URL.

Run: backend/venv/Scripts/python.exe backend/test_cron_secret.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

os.environ["CRON_SECRET"] = "test-secret-123"

from fastapi import FastAPI
from fastapi.testclient import TestClient

from routers import cron

app = FastAPI()
app.include_router(cron.router)
client = TestClient(app)

resp = client.post("/internal/cron/backup")
assert resp.status_code == 401, f"expected 401 with no auth header, got {resp.status_code}"

resp = client.post("/internal/cron/backup", headers={"Authorization": "Bearer wrong"})
assert resp.status_code == 401, f"expected 401 with wrong secret, got {resp.status_code}"

resp = client.post("/internal/cron/backup", headers={"Authorization": "Bearer test-secret-123"})
assert resp.status_code != 401, f"correct secret was still rejected: {resp.status_code} {resp.text}"

print("OK — cron endpoints reject missing/wrong CRON_SECRET and accept the right one.")
