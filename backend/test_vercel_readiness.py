"""Self-check: the behaviors that only kick in on Vercel (VERCEL=1) — auth fails
closed, cron routes answer GET, the local upload/backup dirs move to /tmp, and
the app refuses to boot without DATABASE_URL.

Uses a throwaway SQLite DB, never the real one.

Run: backend/venv/Scripts/python.exe backend/test_vercel_readiness.py
"""
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)

_tmp = tempfile.mkdtemp().replace("\\", "/")
os.environ["DATABASE_URL"] = os.environ["DATABASE_URL_UNPOOLED"] = f"sqlite:///{_tmp}/t.db"
os.environ["CRON_SECRET"] = "s3cret"
os.environ.pop("VERCEL", None)
os.environ.pop("AUTH_REQUIRE", None)

from fastapi import FastAPI
from fastapi.testclient import TestClient

from auth import AuthMiddleware
from routers import cron

app = FastAPI()
app.add_middleware(AuthMiddleware, firebase_ready=False)

@app.get("/x")
def _x():
    return {"ok": True}

app.include_router(cron.router)
client = TestClient(app)
bearer = {"Authorization": "Bearer s3cret"}

assert client.get("/x").status_code == 200

os.environ["VERCEL"] = "1"
assert client.get("/x").status_code == 401

assert client.get("/internal/cron/backup").status_code == 401
assert client.get("/internal/cron/notifications").status_code == 401
for send in (client.get, client.post):
    r = send("/internal/cron/backup", headers=bearer)
    assert r.status_code == 200 and r.json() == {"ran": False}, (r.status_code, r.text)

def _run(code: str, **env) -> subprocess.CompletedProcess:
    e = {**os.environ, **env}
    for k, v in list(e.items()):
        if v is None:
            del e[k]
    return subprocess.run([sys.executable, "-c", code], cwd=HERE, env=e, capture_output=True, text=True)

p = _run(
    "import config, tempfile;"
    "t = tempfile.gettempdir();"
    "assert config.UPLOADS_DIR.startswith(t) and config.BACKUPS_DIR.startswith(t)",
    VERCEL="1",
)
assert p.returncode == 0, p.stderr
p = _run(
    "import config, os;"
    "assert config.UPLOADS_DIR == os.path.join(os.path.dirname(config.__file__), 'uploads')",
    VERCEL=None,
)
assert p.returncode == 0, p.stderr

p = _run("import database", VERCEL="1", DATABASE_URL=None, DATABASE_URL_UNPOOLED=None)
assert p.returncode != 0 and "DATABASE_URL is not set" in p.stderr, p.stderr
p = _run("import database", VERCEL="1")
assert p.returncode == 0, p.stderr

print("OK — Vercel readiness: auth fails closed, cron answers GET, dirs in /tmp, DATABASE_URL required.")
