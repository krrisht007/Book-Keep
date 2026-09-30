import re

from pydantic import BaseModel, field_validator
from datetime import datetime
from typing import Optional, List

_STRN_RE = re.compile(r"^\d{13}$")

def _validate_strn(v: Optional[str]) -> Optional[str]:
    if v is None or not v.strip():
        return v
    v = v.strip()
    if not _STRN_RE.match(v):
        raise ValueError("Invalid STRN — expected 13 digits, e.g. 1234567890123")
    return v

class CustomerCreate(BaseModel):
    name: str
    phone: Optional[str] = None
    credit_limit: Optional[float] = None
    strn: Optional[str] = None
    address: Optional[str] = None
    email: Optional[str] = None
    price_tier: str = "retail"

    @field_validator("strn")
    @classmethod
    def _check_strn(cls, v):
        return _validate_strn(v)

class CustomerOut(BaseModel):
    id: str
    name: str
    phone: Optional[str] = None
    credit_limit: Optional[float] = None
    strn: Optional[str] = None
    address: Optional[str] = None
    email: Optional[str] = None
    price_tier: str = "retail"
    created_at: datetime

    class Config:
        from_attributes = True

class CollectPaymentRequest(BaseModel):
    amount: float

class CollectPaymentOut(BaseModel):
    amount_collected: float
    bills_updated: int
    remaining_outstanding: float

class BillUpdate(BaseModel):
    payment_status: Optional[str] = None
    amount_paid: Optional[float] = None

class PurchaseUpdate(BaseModel):
    payment_status: Optional[str] = None
    amount_paid: Optional[float] = None

class ItemCreate(BaseModel):
    name: str
    unit: str = "piece"
    price: float
    category: Optional[str] = None
    hsn_code: Optional[str] = None
    gst_rate: Optional[float] = None
    barcode: Optional[str] = None
    image_url: Optional[str] = None
    cost_price: Optional[float] = None
    wholesale_price: Optional[float] = None
    contractor_price: Optional[float] = None
    stock_quantity: float = 0
    low_stock_threshold: float = 5
    preferred_supplier_id: Optional[str] = None

class ItemOut(BaseModel):
    id: str
    name: str
    unit: str
    price: float
    category: Optional[str] = None
    hsn_code: Optional[str] = None
    gst_rate: Optional[float] = None
    barcode: Optional[str] = None
    image_url: Optional[str] = None
    cost_price: Optional[float] = None
    wholesale_price: Optional[float] = None
    contractor_price: Optional[float] = None
    stock_quantity: float
    low_stock_threshold: float
    preferred_supplier_id: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True

class ItemPriceHistoryOut(BaseModel):
    id: str
    price: float
    cost_price: Optional[float] = None
    changed_at: datetime
    created_by_email: Optional[str] = None
    created_by_name: Optional[str] = None

    class Config:
        from_attributes = True

class PriceHistoryEdit(BaseModel):
    price: float
    cost_price: Optional[float] = None

class BulkStockUpdate(BaseModel):
    item_id: str
    stock_quantity: float
    note: Optional[str] = None

class StockAdjustmentOut(BaseModel):
    id: str
    previous_quantity: float
    new_quantity: float
    note: Optional[str] = None
    created_by_email: Optional[str] = None
    created_by_name: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True

class StockAdjustmentEdit(BaseModel):
    previous_quantity: float
    new_quantity: float
    note: Optional[str] = None

class SettingsUpdate(BaseModel):
    shop_name: Optional[str] = None
    shop_address: Optional[str] = None
    shop_phone: Optional[str] = None
    shop_strn: Optional[str] = None
    default_gst_rate: Optional[float] = None
    default_hsn: Optional[str] = None
    upi_id: Optional[str] = None

    @field_validator("shop_strn")
    @classmethod
    def _check_strn(cls, v):
        return _validate_strn(v)

    @field_validator("upi_id")
    @classmethod
    def _check_upi_id(cls, v):
        if v is None or not v.strip():
            return v
        cleaned = re.sub(r"[\s-]", "", v.strip())
        if not re.fullmatch(r"0?3\d{9}", cleaned):
            raise ValueError("Invalid JazzCash number — expected e.g. 03001234567")
        return v

class SmtpSettingsUpdate(BaseModel):
    """Admin-only, separate from SettingsUpdate/PUT /settings (which any
    signed-in staff account can currently write) — an SMTP password has no
    business being reachable by a non-admin. Password is optional here so
    re-saving host/port/username doesn't force re-entering it every time;
    omit it to leave whatever's already stored untouched."""
    smtp_host: Optional[str] = None
    smtp_port: Optional[int] = None
    smtp_username: Optional[str] = None
    smtp_password: Optional[str] = None
    smtp_from_name: Optional[str] = None

class SmtpSettingsOut(BaseModel):
    """Never echoes the password back — `configured` just says whether one
    is stored, same reasoning as any other secret that shouldn't round-trip
    to the client once set."""
    smtp_host: str = ""
    smtp_port: Optional[int] = None
    smtp_username: str = ""
    smtp_from_name: str = ""
    configured: bool = False

class BillItemInput(BaseModel):
    item_id: Optional[str] = None
    item_name: str
    quantity: float
    unit_price: float
    hsn_code: Optional[str] = None
    gst_rate: Optional[float] = None
    cost_price: Optional[float] = None

class BillItemOut(BaseModel):
    id: str
    item_id: Optional[str] = None
    item_name: str
    quantity: float
    unit_price: float
    line_total: float
    hsn_code: Optional[str] = None
    gst_rate: Optional[float] = None
    cost_price: Optional[float] = None

    class Config:
        from_attributes = True

class BillCreateV2(BaseModel):
    customer_id: str
    date: datetime
    payment_status: str = "unpaid"
    payment_method: str = "cash"
    amount_paid: float = 0
    image_url: str = "manual_entry"
    line_items: List[BillItemInput]
    is_quote: bool = False
    discount_amount: float = 0
    raw_extraction: Optional[str] = None
    override_credit_limit: bool = False

class ScanCustomerMatch(BaseModel):
    id: str
    name: str
    score: Optional[float] = None

class ScanLineItem(BaseModel):
    item_id: Optional[str] = None
    item_name: str
    quantity: float
    unit_price: float

class BillScanOut(BaseModel):
    """Response from POST /bills/scan — extraction only, nothing saved yet.
    The client resolves customer_exact/customer_suggestion into a real
    customer_id (creating one via POST /customers if needed) and hands the
    rest straight to AddBillScreen for review, same as any other bill.
    photo_url is None when the scan photo wasn't stored (no encryption key on Vercel)."""
    photo_url: Optional[str] = None
    customer_name: str
    customer_exact: Optional[ScanCustomerMatch] = None
    customer_suggestion: Optional[ScanCustomerMatch] = None
    date: Optional[datetime] = None
    line_items: List[ScanLineItem]
    notes: str = ""
    raw_extraction: str

class PurchaseScanOut(BaseModel):
    """Response from POST /purchases/scan — mirrors BillScanOut, for a
    supplier purchase invoice instead of a customer sales bill."""
    photo_url: Optional[str] = None
    supplier_name: str
    supplier_exact: Optional[ScanCustomerMatch] = None
    supplier_suggestion: Optional[ScanCustomerMatch] = None
    date: Optional[datetime] = None
    line_items: List[ScanLineItem]
    notes: str = ""
    raw_extraction: str

class BillOutV2(BaseModel):
    id: str
    customer_id: str
    amount: float
    date: datetime
    invoice_no: Optional[str] = None
    payment_status: str
    payment_method: str
    amount_paid: float
    image_url: str
    is_quote: bool = False
    return_of_bill_id: Optional[str] = None
    is_voided: bool = False
    void_reason: Optional[str] = None
    discount_amount: float = 0
    created_by_name: Optional[str] = None
    created_at: datetime
    line_items: List[BillItemOut]

    class Config:
        from_attributes = True

class BillReturnLineInput(BaseModel):
    bill_item_id: str
    quantity: float

class BillReturnRequest(BaseModel):
    line_items: Optional[List[BillReturnLineInput]] = None

class VoidBillRequest(BaseModel):
    reason: Optional[str] = None

class ExpenseCreate(BaseModel):
    description: str
    amount: float
    category: Optional[str] = None
    date: datetime
    is_recurring: Optional[bool] = False
    receipt_url: Optional[str] = None

class ExpenseOut(BaseModel):
    id: str
    description: str
    amount: float
    category: Optional[str] = None
    date: datetime
    is_recurring: Optional[bool] = False
    receipt_url: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True

class DeviceTokenCreate(BaseModel):
    token: str
    device_name: Optional[str] = None

class DeviceTokenOut(BaseModel):
    id: str
    token: str
    device_name: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True

class NotificationMessage(BaseModel):
    title: str
    body: str
    data: Optional[dict] = None

class AdminUserCreate(BaseModel):
    email: str
    password: str
    name: Optional[str] = None
    admin: bool = False
    can_manage: bool = False

class AdminUserUpdate(BaseModel):
    email: Optional[str] = None
    password: Optional[str] = None
    name: Optional[str] = None
    disabled: Optional[bool] = None
    admin: Optional[bool] = None
    can_manage: Optional[bool] = None

class SupplierCreate(BaseModel):
    name: str
    phone: Optional[str] = None
    strn: Optional[str] = None
    address: Optional[str] = None

    @field_validator("strn")
    @classmethod
    def _check_strn(cls, v):
        return _validate_strn(v)

class SupplierOut(BaseModel):
    id: str
    name: str
    phone: Optional[str] = None
    strn: Optional[str] = None
    address: Optional[str] = None
    created_at: datetime

    class Config:
        from_attributes = True

class PurchaseItemInput(BaseModel):
    item_id: Optional[str] = None
    item_name: str
    quantity: float
    unit_price: float
    hsn_code: Optional[str] = None
    gst_rate: Optional[float] = None

class PurchaseItemOut(BaseModel):
    id: str
    item_id: Optional[str] = None
    item_name: str
    quantity: float
    unit_price: float
    line_total: float
    hsn_code: Optional[str] = None
    gst_rate: Optional[float] = None

    class Config:
        from_attributes = True

class PurchaseCreate(BaseModel):
    supplier_id: str
    date: datetime
    payment_status: str = "unpaid"
    payment_method: str = "cash"
    amount_paid: float = 0
    line_items: List[PurchaseItemInput]
    is_po: bool = False
    image_url: Optional[str] = None
    raw_extraction: Optional[str] = None

class PurchaseOut(BaseModel):
    id: str
    supplier_id: str
    amount: float
    date: datetime
    payment_status: str
    payment_method: str
    amount_paid: float
    is_po: bool = False
    created_by_name: Optional[str] = None
    image_url: Optional[str] = None
    created_at: datetime
    line_items: List[PurchaseItemOut]

    class Config:
        from_attributes = True

class PurchaseReturnLineInput(BaseModel):
    purchase_item_id: str
    quantity: float

class PurchaseReturnRequest(BaseModel):
    line_items: Optional[List[PurchaseReturnLineInput]] = None