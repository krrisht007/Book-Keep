"""Deletes every saved name translation so each name is translated again, once, the
next time it is shown (item names, customers, categories, shop name and address).
Only this cache table is touched, never the real names. Needed after the rules in
utils/name_translate.py change, because saved renderings are reused as they are.

Uses whatever DATABASE_URL the environment/.env points at, so check it first.
Run: backend/venv/Scripts/python.exe backend/clear_name_translations.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

import models
from database import SessionLocal

with SessionLocal() as db:
    n = db.query(models.NameTranslation).delete()
    db.commit()
print(f"cleared {n} saved name translations")
