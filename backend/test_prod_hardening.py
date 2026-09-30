"""Self-check: on Vercel the API must not publish /docs, /redoc or /openapi.json
(they list every endpoint to anyone) and must not allow every website via CORS
(the mobile app doesn't use CORS at all); local dev keeps both. main.py itself
can't be imported in a test (it runs migrations), so this checks the config
values it consumes, that FastAPI honors them, and that main.py really uses them.

Run: backend/venv/Scripts/python.exe backend/test_prod_hardening.py
"""
import json
import os
import subprocess
import sys

from fastapi import FastAPI
from fastapi.testclient import TestClient

HERE = os.path.dirname(os.path.abspath(__file__))

def config_values(on_vercel: bool):
    env = {k: v for k, v in os.environ.items() if k != "VERCEL"}
    if on_vercel:
        env["VERCEL"] = "1"
    out = subprocess.run(
        [sys.executable, "-c", "import config, json; print(json.dumps([config.API_DOCS, config.CORS_ORIGINS]))"],
        cwd=HERE, env=env, capture_output=True, text=True, check=True,
    ).stdout
    return json.loads(out.strip().splitlines()[-1])

prod_docs, prod_cors = config_values(True)
assert prod_docs == {"docs_url": None, "redoc_url": None, "openapi_url": None}
assert prod_cors == [], "production must allow no browser origins"
dev_docs, dev_cors = config_values(False)
assert dev_docs == {} and dev_cors == ["*"], "local dev keeps docs and browser access"

for path in ("/docs", "/redoc", "/openapi.json"):
    assert TestClient(FastAPI(**prod_docs)).get(path).status_code == 404, path
    assert TestClient(FastAPI(**dev_docs)).get(path).status_code == 200, path

with open(os.path.join(HERE, "main.py"), encoding="utf-8") as f:
    src = f.read()
assert "FastAPI(**API_DOCS)" in src and "allow_origins=CORS_ORIGINS" in src

print("OK — production hides the API docs and allows no CORS origins; local dev keeps both.")
