"""Self-check: deleting a bill/customer must restore stock correctly and
must not orphan BillItem rows.

Two bugs fixed here:
  1. delete_bill restored stock unconditionally — deleting a quotation (which
     never deducted stock; see create_bill_v2) wrongly added stock back for
     items it never took.
  2. delete_customer never restored stock at all and never cleaned up its
     bills' BillItem rows (a bulk Bill.delete() doesn't cascade — no ON
     DELETE CASCADE, and SQLite doesn't enforce FKs by default), unlike its
     sibling delete_supplier, which already did both correctly for purchases.

Run: backend/venv/Scripts/python.exe backend/test_bill_delete_stock.py
"""
import datetime
import os
import sys

sys.path.insert(0, os.path.dirname(__file__))

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

import models
from database import Base
from routers import bills, customers

engine = create_engine("sqlite:///:memory:", connect_args={"check_same_thread": False})
Base.metadata.create_all(bind=engine)
db = sessionmaker(bind=engine)()

now = datetime.datetime.utcnow()

def make_item(stock):
    item = models.Item(name="Nails", price=10.0, stock_quantity=stock)
    db.add(item)
    db.commit()
    return item

def make_bill(customer_id, item, qty, is_quote):
    bill = models.Bill(customer_id=customer_id, image_url="manual_entry",
                        amount=qty * item.price, date=now, is_quote=is_quote)
    db.add(bill)
    db.commit()
    db.add(models.BillItem(bill_id=bill.id, item_id=item.id, item_name=item.name,
                            quantity=qty, unit_price=item.price, line_total=qty * item.price))
    db.commit()
    return bill

item1 = make_item(stock=10)
item1.stock_quantity = 7
db.commit()
real_bill = make_bill(customer_id="c1", item=item1, qty=3, is_quote=False)

bills.delete_bill(bill_id=real_bill.id, db=db)
db.refresh(item1)
assert item1.stock_quantity == 10, f"real-bill delete should restore stock: {item1.stock_quantity}"
assert db.query(models.BillItem).filter(models.BillItem.bill_id == real_bill.id).count() == 0, \
    "real-bill delete left an orphaned BillItem"

item2 = make_item(stock=10)
quote_bill = make_bill(customer_id="c2", item=item2, qty=5, is_quote=True)

bills.delete_bill(bill_id=quote_bill.id, db=db)
db.refresh(item2)
assert item2.stock_quantity == 10, f"quote delete must not restore stock: {item2.stock_quantity}"
assert db.query(models.BillItem).filter(models.BillItem.bill_id == quote_bill.id).count() == 0, \
    "quote-bill delete left an orphaned BillItem"

db.add(models.Customer(id="c3", name="Test Customer"))
db.commit()
item3 = make_item(stock=8)
item3.stock_quantity = 6
db.commit()
item4 = make_item(stock=10)
customer_real = make_bill(customer_id="c3", item=item3, qty=2, is_quote=False)
customer_quote = make_bill(customer_id="c3", item=item4, qty=4, is_quote=True)

customers.delete_customer(customer_id="c3", db=db)
db.refresh(item3)
db.refresh(item4)
assert item3.stock_quantity == 8, f"customer delete should restore the real bill's stock: {item3.stock_quantity}"
assert item4.stock_quantity == 10, f"customer delete must not restore the quote's stock: {item4.stock_quantity}"
assert db.query(models.Bill).filter(models.Bill.customer_id == "c3").count() == 0
assert db.query(models.BillItem).filter(
    models.BillItem.bill_id.in_([customer_real.id, customer_quote.id])
).count() == 0, "customer delete left an orphaned BillItem"
assert db.query(models.Customer).filter(models.Customer.id == "c3").first() is None

db.add(models.Customer(id="c4", name="Return Customer"))
db.commit()
item5 = make_item(stock=10)
item5.stock_quantity = 7
db.commit()
sold_bill = make_bill(customer_id="c4", item=item5, qty=3, is_quote=False)
item5.stock_quantity = 8
db.commit()
return_note = models.Bill(customer_id="c4", image_url="return", amount=-10.0,
                           amount_paid=0, date=now, is_quote=False,
                           return_of_bill_id=sold_bill.id)
db.add(return_note)
db.commit()
db.add(models.BillItem(bill_id=return_note.id, item_id=item5.id, item_name=item5.name,
                        quantity=1, unit_price=item5.price, line_total=-10.0))
db.commit()

customers.delete_customer(customer_id="c4", db=db)
db.refresh(item5)
assert item5.stock_quantity == 10, \
    f"deleting a customer with a return note should net back to 10: got {item5.stock_quantity}"

print("OK — bill/customer delete restores stock correctly and leaves no orphaned BillItem rows.")
