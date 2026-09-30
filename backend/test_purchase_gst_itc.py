"""Self-check: the sales-tax monthly summary's Input Tax Credit was
previously hardcoded to zero ("Purchase GST not tracked yet") — now computed
from purchase line items' tax, resolved the same way bills already are
(explicit -> catalog item -> shop default), and net_payable actually
subtracts it instead of ignoring it. Pakistan sales tax is single-rate — no
CGST/SGST/IGST split, unlike this test's original India-GST version.

Run: backend/venv/Scripts/python.exe backend/test_purchase_gst_itc.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
import schemas
from database import Base
from routers.purchases import create_purchase, return_purchase
from routers.gst import sales_tax_summary_report

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

db.add(models.Setting(key="shop_strn", value="1234567890123"))
db.commit()

today = datetime.datetime.utcnow()
month = today.strftime("%Y-%m")

supplier = models.Supplier(name="Local Supplier", strn="9876543210123")
db.add(supplier)
db.commit()

item = models.Item(name="Nails", price=118.0, cost_price=0, gst_rate=18.0)
db.add(item)
db.commit()

purchase = create_purchase(
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=today,
        payment_status="unpaid", amount_paid=0,
        line_items=[schemas.PurchaseItemInput(
            item_id=item.id, item_name="Nails", quantity=1, unit_price=118.0)],
    ),
    db=db,
)
assert purchase.line_items[0].gst_rate == 18.0, \
    "purchase line should resolve gst_rate from the catalog item"
assert purchase.line_items[0].hsn_code is None

report = sales_tax_summary_report(month=month, db=db)
assert report["itc"]["total_itc"] == 18.0, report["itc"]
assert report["net_payable"] == max(0.0, report["outward"]["total_tax"] - 18.0), report

purchase2 = create_purchase(
    purchase=schemas.PurchaseCreate(
        supplier_id=supplier.id, date=today,
        payment_status="unpaid", amount_paid=0,
        line_items=[schemas.PurchaseItemInput(
            item_id=item.id, item_name="Nails", quantity=1, unit_price=118.0)],
    ),
    db=db,
)
report = sales_tax_summary_report(month=month, db=db)
assert report["itc"]["total_itc"] == 36.0, report["itc"]

return_purchase(purchase_id=purchase2.id, body=None, db=db)
report = sales_tax_summary_report(month=month, db=db)
assert report["itc"]["total_itc"] == 18.0, \
    f"returning a purchase should net its ITC back out: {report['itc']}"

print("OK — sales-tax summary computes real ITC from purchases (single-rate tax), "
      "nets a return's ITC back out, and net_payable subtracts it.")
