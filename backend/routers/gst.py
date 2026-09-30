"""Sales tax reports: outward-invoice detail and a monthly summary.

Internal bookkeeping reports built for the shop's own records — not a claim
that this matches FBR's official Sales Tax Return / Annex-C format, which
hasn't been confirmed.
"""
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

import models
from database import get_db
from utils.settings import _get_settings
from utils.gst import _resolve_gst_for_line, _gst_breakdown, _get_invoice_no
from utils.csv_export import _csv_response
from utils.date_range import month_bounds

router = APIRouter()

@router.get("/reports/sales-tax")
def sales_tax_report(month: str, db: Session = Depends(get_db)):
    """Outward-sales tax report for a given month (YYYY-MM)."""
    defaults = _get_settings(db)

    cust_strns = {c.id: (c.strn or "") for c in db.query(models.Customer).all()}

    _start, _end = month_bounds(month)
    bills = db.query(models.Bill).filter(
        models.Bill.date >= _start, models.Bill.date < _end,
        models.Bill.is_quote == False,  # noqa: E712
        models.Bill.is_voided == False,  # noqa: E712
    ).order_by(models.Bill.date).all()

    invoices = []
    hsn_groups: dict = {}

    for bill in bills:
        cust_strn = cust_strns.get(bill.customer_id, "")
        tax_total = 0.0
        taxable_total = 0.0

        line_items = bill.line_items or []
        if line_items:
            for li in line_items:
                if li.gst_rate is None:
                    catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first() if li.item_id else None
                    _, resolved_gst = _resolve_gst_for_line(li, catalog_item, defaults)
                    li.gst_rate = resolved_gst
                if not li.hsn_code:
                    catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first() if li.item_id else None
                    resolved_hsn, _ = _resolve_gst_for_line(li, catalog_item, defaults)
                    li.hsn_code = resolved_hsn
                db.add(li)

                bd = _gst_breakdown(li.line_total or 0, li.gst_rate)
                taxable_total += bd["taxable"]
                tax_total += bd["tax"]

                hsn_key = (li.hsn_code or "-", bd["rate"])
                if hsn_key not in hsn_groups:
                    hsn_groups[hsn_key] = {"hsn_code": li.hsn_code or "-",
                                            "description": li.item_name or "",
                                            "gst_rate": bd["rate"],
                                            "taxable": 0.0, "tax": 0.0, "value": 0.0}
                g = hsn_groups[hsn_key]
                g["taxable"] += bd["taxable"]
                g["tax"] += bd["tax"]
                g["value"] += (li.line_total or 0)
            db.commit()
        else:
            bd = _gst_breakdown(bill.amount or 0, defaults.get("default_gst_rate") or 0)
            taxable_total = bd["taxable"]
            tax_total = bd["tax"]

        total_tax = round(tax_total, 2)
        total_value = round(taxable_total + total_tax, 2)
        customer_name = bill.customer.name if bill.customer else "Unknown"

        invoices.append({
            "invoice_no": _get_invoice_no(db, bill),
            "date": bill.date.strftime("%Y-%m-%d") if bill.date else "",
            "customer_name": customer_name,
            "customer_strn": cust_strn,
            "type": "B2B" if cust_strn else "B2C",
            "taxable_value": round(taxable_total, 2),
            "tax": round(tax_total, 2),
            "total": total_value,
        })

    total_taxable = round(sum(i["taxable_value"] for i in invoices), 2)
    total_tax = round(sum(i["tax"] for i in invoices), 2)
    total_value = round(total_taxable + total_tax, 2)
    b2b_count = sum(1 for i in invoices if i["type"] == "B2B")
    b2c_count = sum(1 for i in invoices if i["type"] == "B2C")

    hsn_summary = sorted([
        {"hsn_code": g["hsn_code"], "description": g["description"],
         "total_taxable": round(g["taxable"], 2), "gst_rate": g["gst_rate"],
         "tax": round(g["tax"], 2), "total_value": round(g["value"], 2)}
        for g in hsn_groups.values()
    ], key=lambda x: x["total_taxable"], reverse=True)

    return {
        "month": month,
        "invoices": invoices,
        "summary": {
            "total_taxable": total_taxable,
            "total_tax": total_tax, "total_value": total_value,
            "b2b_count": b2b_count, "b2c_count": b2c_count,
        },
        "hsn_summary": hsn_summary,
    }

@router.get("/reports/sales-tax.csv")
def sales_tax_csv(month: str, db: Session = Depends(get_db)):
    """CSV export of the outward-sales tax report for a given month."""
    data = sales_tax_report(month, db)
    rows = [["Invoice No", "Date", "Customer", "STRN", "Type", "Taxable", "Tax", "Total"]]
    for inv in data["invoices"]:
        rows.append([inv["invoice_no"], inv["date"], inv["customer_name"], inv["customer_strn"],
                      inv["type"], inv["taxable_value"], inv["tax"], inv["total"]])
    rows.append([])
    rows.append(["--- HSN Summary ---"])
    rows.append(["HSN", "Description", "Taxable", "Tax%", "Tax", "Total"])
    for h in data["hsn_summary"]:
        rows.append([h["hsn_code"], h["description"], h["total_taxable"], h["gst_rate"],
                      h["tax"], h["total_value"]])
    return _csv_response(f"sales_tax_{month}.csv", rows)

@router.get("/reports/sales-tax-summary")
def sales_tax_summary_report(month: str, db: Session = Depends(get_db)):
    """Monthly sales-tax summary for a given month (YYYY-MM): outward tax,
    input tax credit from purchases, exempt supplies, and net payable."""
    sales_tax = sales_tax_report(month, db)
    s = sales_tax["summary"]
    defaults = _get_settings(db)

    exempt_taxable = 0.0
    default_rate = defaults.get("default_gst_rate") or 0
    _start, _end = month_bounds(month)
    bills = db.query(models.Bill).filter(
        models.Bill.date >= _start, models.Bill.date < _end,
        models.Bill.is_quote == False,  # noqa: E712
        models.Bill.is_voided == False,  # noqa: E712
    ).all()
    for bill in bills:
        lines = bill.line_items or []
        if not lines:
            if default_rate == 0:
                exempt_taxable += (bill.amount or 0)
            continue
        for li in lines:
            if (li.gst_rate or 0) == 0:
                exempt_taxable += (li.line_total or 0)

    purchases = db.query(models.Purchase).filter(
        models.Purchase.date >= _start, models.Purchase.date < _end,
        models.Purchase.is_po == False,  # noqa: E712
    ).all()
    itc_tax = 0.0
    for purchase in purchases:
        for li in purchase.line_items:
            bd = _gst_breakdown(li.line_total or 0, li.gst_rate or 0)
            itc_tax += bd["tax"]
    total_itc = round(itc_tax, 2)

    return {
        "month": month,
        "outward": {
            "taxable_value": s["total_taxable"],
            "total_tax": s["total_tax"],
        },
        "itc": {"total_itc": total_itc},
        "exempt": {"taxable_value": round(exempt_taxable, 2)},
        "net_payable": round(max(0.0, s["total_tax"] - total_itc), 2),
    }

@router.get("/reports/sales-tax-summary.csv")
def sales_tax_summary_csv(month: str, db: Session = Depends(get_db)):
    """CSV export of the monthly sales-tax summary for a given month."""
    data = sales_tax_summary_report(month, db)
    rows = [
        ["Description", "Amount"],
        ["Outward taxable supplies", data["outward"]["taxable_value"]],
        ["Outward tax", data["outward"]["total_tax"]],
        ["ITC available (Input Tax Credit)", data["itc"]["total_itc"]],
        ["Exempt, nil-rated supplies", data["exempt"]["taxable_value"]],
        ["Net Tax Payable", data["net_payable"]],
    ]
    return _csv_response(f"sales_tax_summary_{month}.csv", rows)
