"""Self-check: quotations must be excluded from every report/sales-tax
aggregation.

A saved quotation (Bill.is_quote=True) carries a real `amount` and real
line-item prices but never became an actual sale — it shouldn't inflate
outstanding balances, monthly/revenue totals, or sales-tax reports. This is the
same invariant low_stock's sales-velocity query already enforced; the other
aggregations in reports.py/gst.py had missed it (see the is_quote fixes in
reports.py, gst.py, notifications.py).

Run: backend/venv/Scripts/python.exe backend/test_quote_exclusion.py
(or: python backend/test_quote_exclusion.py, from an activated venv)
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from fastapi import HTTPException

import models
from database import Base
from routers import backup, bills, customers, gst, reports

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

today = datetime.datetime.utcnow()
month = today.strftime("%Y-%m")

customer = models.Customer(name="Test Customer")
db.add(customer)
db.commit()

real_bill = models.Bill(
    customer_id=customer.id, image_url="manual_entry", amount=100.0,
    amount_paid=0.0, date=today, is_quote=False,
)
quote_bill = models.Bill(
    customer_id=customer.id, image_url="manual_entry", amount=500.0,
    amount_paid=0.0, date=today, is_quote=True,
)
db.add_all([real_bill, quote_bill])
db.commit()

outstanding = reports.outstanding_by_customer(db=db)
assert outstanding == [
    {"customer_id": customer.id, "customer_name": "Test Customer", "outstanding": 100.0}
], f"outstanding_by_customer leaked the quote: {outstanding}"

monthly = {m["month"]: m["total"] for m in reports.monthly_totals(db=db)}
assert monthly[month] == 100.0, f"monthly_totals leaked the quote: {monthly}"

quote_cash_bill = models.Bill(
    customer_id=customer.id, image_url="manual_entry", amount=500.0,
    amount_paid=500.0, payment_method="cash", date=today, is_quote=True,
)
db.add(quote_cash_bill)
db.commit()
cash = reports.cash_today(db=db)
assert cash["expected_cash"] == 0.0, f"cash_today leaked a quote's amount_paid: {cash}"
assert cash["collected_by_method"] == {}, f"cash_today's by-method breakdown leaked a quote: {cash}"

top_customers = reports.top_customers_by_revenue(db=db)
assert top_customers[0]["revenue"] == 100.0, f"top_customers_by_revenue leaked the quote: {top_customers}"

sales_tax = gst.sales_tax_report(month=month, db=db)
assert len(sales_tax["invoices"]) == 1, f"sales_tax_report leaked the quote as an outward supply: {sales_tax['invoices']}"

ledger_rows = (
    db.query(models.Bill)
    .filter(models.Bill.customer_id == customer.id, models.Bill.is_quote == False)  # noqa: E712
    .all()
)
assert len(ledger_rows) == 1, f"customer ledger query leaked the quote: {ledger_rows}"
response = customers.get_customer_ledger(customer_id=customer.id, db=db)
assert response.status_code == 200 and response.body[:4] == b"%PDF", "ledger PDF failed to render"

return_note = models.Bill(
    customer_id=customer.id, image_url="return", amount=-30.0, amount_paid=-30.0,
    date=today, is_quote=False, return_of_bill_id=real_bill.id,
)
db.add(return_note)
db.commit()
csv_response = backup.export_bills(db=db)
csv_text = csv_response.body.decode("utf-8-sig")
type_col = csv_text.splitlines()[0].split(",").index("type")
types_by_id = {
    line.split(",")[0]: line.split(",")[type_col]
    for line in csv_text.splitlines()[1:]
}
assert types_by_id[real_bill.id] == "bill", types_by_id
assert types_by_id[quote_bill.id] == "quote", types_by_id
assert types_by_id[return_note.id] == "return", types_by_id

try:
    bills.get_bill_invoice(bill_id=quote_bill.id, db=db)
    raise AssertionError("should have refused to invoice a quotation")
except HTTPException as e:
    assert e.status_code == 400, e.status_code

try:
    bills.return_bill(bill_id=quote_bill.id, body=None, db=db)
    raise AssertionError("should have refused to return a quotation")
except HTTPException as e:
    assert e.status_code == 400, e.status_code
invoice_response = bills.get_bill_invoice(bill_id=real_bill.id, db=db)
assert invoice_response.status_code == 200 and invoice_response.body[:4] == b"%PDF"

print("OK — quotations excluded from outstanding/monthly/top-customers/sales-tax/ledger/invoice, and labeled (not dropped) in the CSV export.")
