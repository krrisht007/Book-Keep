from sqlalchemy import Column, String, Float, DateTime, ForeignKey, Text, Boolean
from sqlalchemy.orm import relationship
from datetime import datetime
import uuid
from database import Base

class Customer(Base):
    __tablename__ = "customers"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    name = Column(String, nullable=False)
    phone = Column(String, nullable=True)
    credit_limit = Column(Float, nullable=True)
    strn = Column(String, nullable=True)
    address = Column(String, nullable=True)
    email = Column(String, nullable=True)
    price_tier = Column(String, default="retail")
    created_at = Column(DateTime, default=datetime.utcnow)
    bills = relationship("Bill", back_populates="customer")

class Bill(Base):
    __tablename__ = "bills"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    customer_id = Column(String, ForeignKey("customers.id"))
    customer = relationship("Customer", back_populates="bills")
    image_url = Column(String, nullable=False)
    amount = Column(Float, nullable=False)
    date = Column(DateTime, nullable=False)
    items = Column(Text)
    invoice_no = Column(String, nullable=True)
    payment_status = Column(String, default="unpaid")
    payment_method = Column(String, default="cash")
    amount_paid = Column(Float, default=0)
    raw_extraction = Column(Text, nullable=True)
    is_quote = Column(Boolean, default=False)
    return_of_bill_id = Column(String, ForeignKey("bills.id"), nullable=True)
    is_voided = Column(Boolean, default=False)
    void_reason = Column(Text, nullable=True)
    discount_amount = Column(Float, default=0)
    created_by_email = Column(String, nullable=True)
    created_by_name = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    line_items = relationship("BillItem", back_populates="bill")

class Item(Base):
    __tablename__ = "items"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    name = Column(String, nullable=False)
    unit = Column(String, default="piece")
    price = Column(Float, nullable=False)
    category = Column(String, nullable=True)
    hsn_code = Column(String, nullable=True)
    gst_rate = Column(Float, nullable=True)
    barcode = Column(String, nullable=True)
    image_url = Column(String, nullable=True)
    cost_price = Column(Float, nullable=True)
    wholesale_price = Column(Float, nullable=True)
    contractor_price = Column(Float, nullable=True)
    stock_quantity = Column(Float, default=0)
    low_stock_threshold = Column(Float, default=5)
    preferred_supplier_id = Column(String, ForeignKey("suppliers.id"), nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class ItemPriceHistory(Base):
    """Append-only log of an item's selling/cost price at a point in time.
    A row is written on item creation and whenever price or cost_price
    actually changes on edit — never on unrelated field edits."""
    __tablename__ = "item_price_history"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    item_id = Column(String, ForeignKey("items.id"), nullable=False)
    price = Column(Float, nullable=False)
    cost_price = Column(Float, nullable=True)
    changed_at = Column(DateTime, default=datetime.utcnow)
    created_by_email = Column(String, nullable=True)
    created_by_name = Column(String, nullable=True)

class StockAdjustment(Base):
    """Append-only audit trail for a manual stock correction (stock take /
    inventory count) — mirrors ItemPriceHistory's shape. Written once per
    item whose stock_quantity actually changed in a POST /items/bulk-stock
    call; an unchanged item gets no row."""
    __tablename__ = "stock_adjustments"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    item_id = Column(String, ForeignKey("items.id"), nullable=False)
    previous_quantity = Column(Float, nullable=False)
    new_quantity = Column(Float, nullable=False)
    note = Column(String, nullable=True)
    created_by_email = Column(String, nullable=True)
    created_by_name = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class BillItem(Base):
    __tablename__ = "bill_items"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    bill_id = Column(String, ForeignKey("bills.id"))
    item_id = Column(String, ForeignKey("items.id"), nullable=True)
    item_name = Column(String, nullable=False)
    quantity = Column(Float, nullable=False)
    unit_price = Column(Float, nullable=False)
    line_total = Column(Float, nullable=False)
    hsn_code = Column(String, nullable=True)
    gst_rate = Column(Float, nullable=True)
    cost_price = Column(Float, nullable=True)

    bill = relationship("Bill", back_populates="line_items")

class Supplier(Base):
    __tablename__ = "suppliers"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    name = Column(String, nullable=False)
    phone = Column(String, nullable=True)
    strn = Column(String, nullable=True)
    address = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    purchases = relationship("Purchase", back_populates="supplier")

class Purchase(Base):
    """A purchase bill: stock coming INTO the shop from a supplier."""

    __tablename__ = "purchases"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    supplier_id = Column(String, ForeignKey("suppliers.id"))
    supplier = relationship("Supplier", back_populates="purchases")
    amount = Column(Float, nullable=False)
    date = Column(DateTime, nullable=False)
    payment_status = Column(String, default="unpaid")
    payment_method = Column(String, default="cash")
    amount_paid = Column(Float, default=0)
    is_po = Column(Boolean, default=False)
    return_of_purchase_id = Column(String, ForeignKey("purchases.id"), nullable=True)
    created_by_email = Column(String, nullable=True)
    created_by_name = Column(String, nullable=True)
    image_url = Column(String, nullable=True)
    raw_extraction = Column(Text, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    line_items = relationship("PurchaseItem", back_populates="purchase")

class PurchaseItem(Base):
    __tablename__ = "purchase_items"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    purchase_id = Column(String, ForeignKey("purchases.id"))
    item_id = Column(String, ForeignKey("items.id"), nullable=True)
    item_name = Column(String, nullable=False)
    quantity = Column(Float, nullable=False)
    unit_price = Column(Float, nullable=False)
    line_total = Column(Float, nullable=False)
    hsn_code = Column(String, nullable=True)
    gst_rate = Column(Float, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

    purchase = relationship("Purchase", back_populates="line_items")

class Expense(Base):
    __tablename__ = "expenses"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    description = Column(String, nullable=False)
    amount = Column(Float, nullable=False)
    category = Column(String, nullable=True)
    date = Column(DateTime, nullable=False)
    is_recurring = Column(Boolean, default=False)
    receipt_url = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class Setting(Base):
    __tablename__ = "settings"
    key = Column(String, primary_key=True)
    value = Column(String, nullable=True)

class NameTranslation(Base):
    """Gemini's rendering of an item/party/category name in one app language,
    saved so each name is only translated once per language — see
    utils/name_translate.py. The original name is never touched."""
    __tablename__ = "name_translations"
    lang = Column(String, primary_key=True)
    kind = Column(String, primary_key=True)
    source = Column(String, primary_key=True)
    target = Column(String, nullable=False)

class SchemaMeta(Base):
    """One row (key="signature") holding the fingerprint of the schema code that
    last brought this database up to date — see migrations.ensure_schema().
    Its own table, not a settings row, because utils/settings.py reads every
    settings row into the shop settings the app and invoices use."""
    __tablename__ = "schema_meta"
    key = Column(String, primary_key=True)
    value = Column(String, nullable=True)

class DeviceToken(Base):
    __tablename__ = "device_tokens"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    token = Column(String, unique=True, nullable=False)
    device_name = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class ActivityLog(Base):
    """Who did what, for accountability when multiple staff share the shop
    account — see utils/activity_log.py. Only sensitive/hard-to-reverse
    actions are logged (voiding/deleting a bill, deleting a customer or
    supplier, admin account changes), not every read or routine edit."""
    __tablename__ = "activity_log"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))
    user_email = Column(String, nullable=True)
    user_name = Column(String, nullable=True)
    action = Column(String, nullable=False)
    details = Column(Text, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)