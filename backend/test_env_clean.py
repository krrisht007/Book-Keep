"""Self-check: config.py must survive Windows-style dirty env values (leading
BOM / stray whitespace). On Vercel DEFAULT_GST_RATE="﻿18" made float()
raise at import and every request returned 500 FUNCTION_INVOCATION_FAILED.

Run: backend/venv/Scripts/python.exe backend/test_env_clean.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

os.environ["DEFAULT_GST_RATE"] = "﻿18"
os.environ["SHOP_NAME"] = " My Shop\r\n"
os.environ["CRON_SECRET"] = "﻿abc123\n"

import config

assert config.DEFAULT_GST_RATE == 18.0
assert config.SHOP_NAME == "My Shop"
assert os.environ["CRON_SECRET"] == "abc123"
print("OK — BOM/whitespace around env values is stripped before config reads them.")
