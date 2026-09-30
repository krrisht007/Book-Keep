"""Runs every backend self-check (test_*.py), each in its own process on a throwaway
in-memory database, and prints a pass/fail summary. Exit code 0 only if all pass.

    backend/venv/Scripts/python.exe backend/run_tests.py          # backend only
    backend/venv/Scripts/python.exe backend/run_tests.py --app    # + flutter analyze and flutter test
    backend/venv/Scripts/python.exe backend/run_tests.py name_translate pdf   # only files containing these words

The database variables are pinned here, so a DATABASE_URL set in your shell (even the
real Neon one) is never used. test_database_path checks the default path, so it runs
with them unset.
"""
import os
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
DEFAULT_PATH_TEST = "test_database_path.py"


def env_for(name: str) -> dict:
    env = {k: v for k, v in os.environ.items() if k not in ("VERCEL", "DATABASE_URL", "DATABASE_URL_UNPOOLED")}
    env["BLOB_READ_WRITE_TOKEN"] = ""
    if name != DEFAULT_PATH_TEST:
        env["DATABASE_URL"] = env["DATABASE_URL_UNPOOLED"] = "sqlite:///:memory:"
    return env


def run_backend(words: list[str]) -> list[str]:
    tests = sorted(f for f in os.listdir(HERE) if f.startswith("test_") and f.endswith(".py"))
    if words:
        tests = [t for t in tests if any(w in t for w in words)]
    if not tests:
        print(f"no test files match {words}")
        return ["(no tests selected)"]
    failed = []
    for i, name in enumerate(tests, 1):
        started = time.time()
        try:
            r = subprocess.run([sys.executable, name], cwd=HERE, env=env_for(name), capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=300)
            ok, out = r.returncode == 0, r.stdout + r.stderr
        except subprocess.TimeoutExpired:
            ok, out = False, "timed out after 300 s"
        print(f"[{i:2}/{len(tests)}] {'ok  ' if ok else 'FAIL'} {name} ({time.time() - started:.1f}s)", flush=True)
        if not ok:
            failed.append(name)
            print("\n".join("      " + line for line in out.strip().splitlines()[-12:]), flush=True)
    print(f"\nbackend: {len(tests) - len(failed)}/{len(tests)} passed" + (f" — FAILED: {', '.join(failed)}" if failed else ""))
    return failed


def run_app() -> bool:
    flutter = shutil.which("flutter")
    if not flutter:
        print("app: flutter not found on PATH")
        return False
    ok = True
    for args in (["analyze", "lib"], ["test"]):
        print(f"\n$ flutter {' '.join(args)}", flush=True)
        ok = subprocess.run([flutter, *args], cwd=ROOT).returncode == 0 and ok
    print("\napp: " + ("analyze and tests passed" if ok else "FAILED"))
    return ok


if __name__ == "__main__":
    args = sys.argv[1:]
    with_app = "--app" in args
    failed = run_backend([a for a in args if a != "--app"])
    app_ok = run_app() if with_app else True
    sys.exit(0 if not failed and app_ok else 1)
