"""Self-check: a non-quote bill that would push a customer over their
credit_limit is rejected (402) unless override_credit_limit is set, or the
customer has no limit configured, or the bill is a quote (quotes never affect
the real balance — see create_bill_v2 / reports.py's outstanding_by_customer).

Run: backend/venv/Scripts/python.exe backend/test_credit_limit.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from fastapi import HTTPException
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.bills import create_bill_v2

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

item = models.Item(name="Nails", price=100.0, stock_quantity=100)
db.add(item)
db.commit()

def _bill(customer_id, amount_paid=0, is_quote=False, override=False, qty=5):
    return schemas.BillCreateV2(
        customer_id=customer_id,
        date=datetime.datetime.utcnow(),
        line_items=[schemas.BillItemInput(item_id=item.id, item_name="Nails", quantity=qty, unit_price=100.0)],
        amount_paid=amount_paid,
        is_quote=is_quote,
        override_credit_limit=override,
    )

no_limit_customer = models.Customer(name="No Limit")
db.add(no_limit_customer)
db.commit()
create_bill_v2(_bill(no_limit_customer.id, qty=50), db)

under = models.Customer(name="Under Limit", credit_limit=1000)
db.add(under)
db.commit()
create_bill_v2(_bill(under.id, qty=5), db)

over = models.Customer(name="Over Limit", credit_limit=1000)
db.add(over)
db.commit()
try:
    create_bill_v2(_bill(over.id, qty=20), db)
    raise AssertionError("expected a 402 over the credit limit")
except HTTPException as exc:
    assert exc.status_code == 402, f"expected 402, got {exc.status_code}"

create_bill_v2(_bill(over.id, amount_paid=2000, qty=20), db)

create_bill_v2(_bill(over.id, qty=20, override=True), db)

create_bill_v2(_bill(over.id, qty=20, is_quote=True), db)

print("OK — credit_limit blocks an over-limit bill, and quote/override/paid-in-full all bypass it correctly.")
