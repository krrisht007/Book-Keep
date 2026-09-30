"""Self-check: bulk-import customers/suppliers (mirrors
expenses.py's create_expenses_bulk) — every row becomes a new row (no
de-dupe key, same as expenses), STRN validation still applies per row via
the same CustomerCreate/SupplierCreate schema every single-create call uses.

Run: backend/venv/Scripts/python.exe backend/test_bulk_import_customers_suppliers.py
"""
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from pydantic import ValidationError
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.customers import create_customers_bulk
from routers.suppliers import create_suppliers_bulk

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

customers = create_customers_bulk(customers=[
    schemas.CustomerCreate(name="Arun", phone="9876543210", credit_limit=5000),
    schemas.CustomerCreate(name="Priya", strn="1234567890123"),
], db=db)
assert len(customers) == 2
assert db.query(models.Customer).count() == 2
assert {c.name for c in customers} == {"Arun", "Priya"}

create_customers_bulk(customers=[schemas.CustomerCreate(name="Arun")], db=db)
assert db.query(models.Customer).filter(models.Customer.name == "Arun").count() == 2, \
    "bulk customer import should never de-dupe by name"

try:
    schemas.CustomerCreate(name="Bad STRN", strn="not-a-strn")
    assert False, "should have rejected an invalid STRN"
except ValidationError:
    pass

suppliers = create_suppliers_bulk(suppliers=[
    schemas.SupplierCreate(name="ABC Hardware", phone="9998887777"),
    schemas.SupplierCreate(name="XYZ Traders", strn="9876543210123"),
], db=db)
assert len(suppliers) == 2
assert db.query(models.Supplier).count() == 2

print("OK — bulk-importing customers/suppliers creates every row without "
      "de-duping, and per-row STRN validation still applies.")
