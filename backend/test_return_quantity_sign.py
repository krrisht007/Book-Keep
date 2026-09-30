"""Self-check: a returned quantity must net out, not count as sold again.

return_bill stores a credit note's BillItem.quantity as positive (only
line_total/cost_price are negated) — see routers/bills.py. Any aggregation
that summed raw BillItem.quantity without accounting for that was silently
double-counting: sell 10, return 3, and it would report 13 "sold" instead of
the net 7. Confirmed and fixed in low_stock's reorder-suggestion math and
top_items_by_revenue's quantity figure.

Run: backend/venv/Scripts/python.exe backend/test_return_quantity_sign.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers import reports

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

now = datetime.datetime.utcnow()

item = models.Item(name="Nails", price=10.0, stock_quantity=0, low_stock_threshold=100)
db.add(item)
db.commit()

sale = models.Bill(customer_id="c1", image_url="manual_entry", amount=100.0,
                    amount_paid=100.0, date=now, is_quote=False)
db.add(sale)
db.commit()
db.add(models.BillItem(bill_id=sale.id, item_id=item.id, item_name="Nails",
                        quantity=10, unit_price=10.0, line_total=100.0))
db.commit()

credit_note = models.Bill(customer_id="c1", image_url="return", amount=-30.0,
                           amount_paid=-30.0, date=now, is_quote=False,
                           return_of_bill_id=sale.id)
db.add(credit_note)
db.commit()
db.add(models.BillItem(bill_id=credit_note.id, item_id=item.id, item_name="Nails",
                        quantity=3, unit_price=10.0, line_total=-30.0))
db.commit()

low_stock_rows = reports.low_stock(db=db)
row = next(r for r in low_stock_rows if r["id"] == item.id)
expected_avg_daily = round(7 / 30, 2)
assert row["avg_daily_sales"] == expected_avg_daily, \
    f"low_stock double-counted the return: {row['avg_daily_sales']} (expected {expected_avg_daily})"

top_items = reports.top_items_by_revenue(db=db)
nails = next(r for r in top_items if r["item"] == "Nails")
assert nails["quantity"] == 7, f"top_items_by_revenue double-counted the return: {nails['quantity']}"
assert nails["revenue"] == 70.0, f"top_items_by_revenue revenue is wrong: {nails['revenue']}"

print("OK — returned quantity nets out instead of counting as sold again.")
