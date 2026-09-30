import math
from datetime import datetime, timedelta

from fastapi import APIRouter, Depends, HTTPException, Request, Response
from pydantic import BaseModel
from sqlalchemy.orm import Session, selectinload

import models
from database import get_db
from utils.ai_ask_shop import answer_question, speak, to_mp3
from utils.gemini import AiScanNotConfigured, GeminiAPIError
from utils.rate_limit import require_ai_rate_limit, require_speak_rate_limit

router = APIRouter()

_VELOCITY_WINDOW_DAYS = 30
_REORDER_COVER_DAYS = 14

@router.get("/reports/outstanding")
def outstanding_by_customer(db: Session = Depends(get_db)):
    customers = db.query(models.Customer).all()
    results = []
    for c in customers:
        real_bills = [b for b in c.bills if not b.is_quote and not b.is_voided]
        total_billed = sum(b.amount for b in real_bills)
        total_paid = sum(b.amount_paid for b in real_bills)
        outstanding = total_billed - total_paid
        if outstanding > 0:
            results.append({
                "customer_id": c.id,
                "customer_name": c.name,
                "outstanding": outstanding,
            })
    results.sort(key=lambda x: x["outstanding"], reverse=True)
    return results

@router.get("/reports/dues-aging")
def dues_aging(db: Session = Depends(get_db)):
    """Customers with outstanding balances, bucketed by how many days ago
    their oldest unpaid bill was written (0-30 / 30-60 / 60+)."""
    customers = db.query(models.Customer).all()
    today = datetime.utcnow().date()
    results = []
    for c in customers:
        real_bills = [b for b in c.bills if not b.is_quote and not b.is_voided]
        if not real_bills:
            continue
        total_billed = sum(b.amount for b in real_bills)
        total_paid = sum(b.amount_paid for b in real_bills)
        outstanding = total_billed - total_paid
        if outstanding <= 0:
            continue
        unpaid_bills = [
            b for b in real_bills if (b.amount or 0) - (b.amount_paid or 0) > 0
        ]
        if not unpaid_bills:
            continue
        oldest = min(b.date for b in unpaid_bills)
        days_old = max(0, (today - oldest.date()).days)
        if days_old <= 30:
            bucket = "0_30"
        elif days_old <= 60:
            bucket = "30_60"
        else:
            bucket = "60_plus"
        results.append({
            "customer_id": c.id,
            "customer_name": c.name,
            "phone": c.phone or "",
            "outstanding": outstanding,
            "days_old": days_old,
            "oldest_bill_date": oldest.date().isoformat(),
            "bucket": bucket,
        })
    results.sort(key=lambda x: x["days_old"], reverse=True)
    return results

@router.get("/reports/payables-aging")
def payables_aging(db: Session = Depends(get_db)):
    """Suppliers you owe money to, bucketed by how many days ago the
    oldest unpaid purchase was recorded (0-30 / 30-60 / 60+)."""
    suppliers = db.query(models.Supplier).all()
    today = datetime.utcnow().date()
    results = []
    for s in suppliers:
        real_purchases = [p for p in s.purchases if not p.is_po]
        if not real_purchases:
            continue
        total_purchased = sum(p.amount for p in real_purchases)
        total_paid = sum(p.amount_paid for p in real_purchases)
        outstanding = total_purchased - total_paid
        if outstanding <= 0:
            continue
        unpaid = [
            p for p in real_purchases if (p.amount or 0) - (p.amount_paid or 0) > 0
        ]
        if not unpaid:
            continue
        oldest = min(p.date for p in unpaid)
        days_old = max(0, (today - oldest.date()).days)
        if days_old <= 30:
            bucket = "0_30"
        elif days_old <= 60:
            bucket = "30_60"
        else:
            bucket = "60_plus"
        results.append({
            "supplier_id": s.id,
            "supplier_name": s.name,
            "phone": s.phone or "",
            "outstanding": outstanding,
            "days_old": days_old,
            "oldest_purchase_date": oldest.date().isoformat(),
            "bucket": bucket,
        })
    results.sort(key=lambda x: x["days_old"], reverse=True)
    return results

@router.get("/reports/monthly")
def monthly_totals(db: Session = Depends(get_db)):
    bills = db.query(models.Bill).filter(
        models.Bill.is_quote == False, models.Bill.is_voided == False  # noqa: E712
    ).all()
    monthly = {}
    for b in bills:
        key = b.date.strftime("%Y-%m")
        monthly[key] = monthly.get(key, 0) + b.amount
    return [
        {"month": k, "total": v}
        for k, v in sorted(monthly.items(), reverse=True)
    ]

@router.get("/reports/top-items")
def top_items(db: Session = Depends(get_db)):
    bills = db.query(models.Bill).options(selectinload(models.Bill.line_items)).filter(
        models.Bill.is_quote == False, models.Bill.is_voided == False  # noqa: E712
    ).all()
    item_counts = {}
    for b in bills:
        if not b.return_of_bill_id:
            for li in b.line_items:
                name = (li.item_name or "").strip()
                if name:
                    item_counts[name] = item_counts.get(name, 0) + 1
    sorted_items = sorted(item_counts.items(), key=lambda x: x[1], reverse=True)
    return [{"item": k, "count": v} for k, v in sorted_items[:10]]

@router.get("/reports/cash-today")
def cash_today(db: Session = Depends(get_db)):
    today = datetime.utcnow().date()

    bills = db.query(models.Bill).filter(
        models.Bill.is_quote == False, models.Bill.is_voided == False  # noqa: E712
    ).all()
    todays_bills = [b for b in bills if b.date.date() == today]
    total_cash = sum(b.amount_paid for b in todays_bills if b.payment_method == "cash")

    by_method: dict[str, float] = {}
    for b in todays_bills:
        if b.amount_paid:
            by_method[b.payment_method] = by_method.get(b.payment_method, 0) + b.amount_paid

    return {"date": str(today), "expected_cash": total_cash, "collected_by_method": by_method}

@router.get("/reports/profit-monthly")
def profit_monthly(db: Session = Depends(get_db)):
    bills = db.query(models.Bill).options(selectinload(models.Bill.line_items)).filter(
        models.Bill.is_quote == False, models.Bill.is_voided == False  # noqa: E712
    ).all()
    expenses = db.query(models.Expense).all()

    revenue_by_month = {}
    cogs_by_month = {}
    for b in bills:
        key = b.date.strftime("%Y-%m")
        revenue_by_month[key] = revenue_by_month.get(key, 0) + b.amount
        cogs = cogs_by_month.get(key, 0)
        for li in b.line_items:
            cogs += li.cost_price or 0
        cogs_by_month[key] = cogs

    expense_by_month = {}
    for e in expenses:
        key = e.date.strftime("%Y-%m")
        expense_by_month[key] = expense_by_month.get(key, 0) + e.amount

    all_months = set(revenue_by_month) | set(expense_by_month)
    result = []
    for month in sorted(all_months, reverse=True):
        revenue = revenue_by_month.get(month, 0)
        cogs = cogs_by_month.get(month, 0)
        expenses_total = expense_by_month.get(month, 0)
        result.append({
            "month": month,
            "revenue": revenue,
            "cogs": cogs,
            "expenses": expenses_total,
            "profit": revenue - cogs - expenses_total,
        })
    return result

@router.get("/reports/low-stock")
def low_stock(db: Session = Depends(get_db)):
    items = db.query(models.Item).filter(
        models.Item.stock_quantity <= models.Item.low_stock_threshold
    ).all()

    cutoff = datetime.utcnow() - timedelta(days=_VELOCITY_WINDOW_DAYS)
    sold_by_item: dict = {}
    for item_id, qty, is_return in (
        db.query(models.BillItem.item_id, models.BillItem.quantity,
                 models.Bill.return_of_bill_id.isnot(None))
        .join(models.Bill, models.BillItem.bill_id == models.Bill.id)
        .filter(
            models.Bill.date >= cutoff,
            models.Bill.is_quote == False,  # noqa: E712
            models.Bill.is_voided == False,  # noqa: E712
        )
        .all()
    ):
        if item_id is None:
            continue
        signed = -(qty or 0) if is_return else (qty or 0)
        sold_by_item[item_id] = sold_by_item.get(item_id, 0) + signed

    result = []
    for i in items:
        sold = sold_by_item.get(i.id) or 0
        avg_daily = sold / _VELOCITY_WINDOW_DAYS
        if avg_daily > 0:
            suggested = math.ceil(avg_daily * _REORDER_COVER_DAYS - i.stock_quantity)
        else:
            suggested = math.ceil(i.low_stock_threshold - i.stock_quantity)
        result.append({
            "id": i.id,
            "name": i.name,
            "unit": i.unit,
            "stock_quantity": i.stock_quantity,
            "low_stock_threshold": i.low_stock_threshold,
            "cost_price": i.cost_price,
            "preferred_supplier_id": i.preferred_supplier_id,
            "avg_daily_sales": round(avg_daily, 2),
            "suggested_reorder_qty": max(0, suggested),
        })
    return result

@router.get("/reports/stock-valuation")
def stock_valuation(db: Session = Depends(get_db)):
    """Value of everything currently on the shelf: quantity x cost price per
    item (falling back to selling price for items with no recorded cost),
    totaled overall and broken down by category."""
    items = db.query(models.Item).filter(models.Item.stock_quantity > 0).all()
    by_category: dict[str, dict] = {}
    rows = []
    total_value = 0.0
    total_quantity = 0.0
    for i in items:
        unit_cost = i.cost_price if i.cost_price is not None else i.price
        value = (i.stock_quantity or 0) * (unit_cost or 0)
        cat = i.category or "Uncategorized"
        total_value += value
        total_quantity += i.stock_quantity or 0
        bucket = by_category.setdefault(
            cat, {"category": cat, "total": 0.0, "item_count": 0, "quantity": 0.0}
        )
        bucket["total"] += value
        bucket["item_count"] += 1
        bucket["quantity"] += i.stock_quantity or 0
        rows.append({
            "id": i.id,
            "name": i.name,
            "category": cat,
            "unit": i.unit,
            "quantity": i.stock_quantity,
            "unit_cost": unit_cost,
            "value": value,
            "cost_is_estimated": i.cost_price is None,
        })
    rows.sort(key=lambda r: r["value"], reverse=True)
    categories = sorted(by_category.values(), key=lambda c: c["total"], reverse=True)
    return {
        "total_value": total_value,
        "total_items": len(items),
        "total_quantity": total_quantity,
        "by_category": categories,
        "items": rows,
    }

@router.get("/reports/expenses-by-category")
def expenses_by_category(db: Session = Depends(get_db), month: str = None):
    now = datetime.utcnow()
    month_key = month or now.strftime("%Y-%m")
    expenses = db.query(models.Expense).all()
    totals = {}
    for e in expenses:
        if e.date.strftime("%Y-%m") != month_key:
            continue
        cat = e.category or "other"
        totals[cat] = totals.get(cat, 0) + e.amount
    result = [{"category": k, "total": v} for k, v in totals.items()]
    result.sort(key=lambda x: x["total"], reverse=True)
    return result

@router.get("/reports/top-items-by-revenue")
def top_items_by_revenue(db: Session = Depends(get_db), limit: int = 5):
    bills = db.query(models.Bill).options(selectinload(models.Bill.line_items)).filter(
        models.Bill.is_quote == False, models.Bill.is_voided == False  # noqa: E712
    ).all()
    revenue_by_item = {}
    qty_by_item = {}
    id_by_item = {}
    for b in bills:
        is_return = b.return_of_bill_id is not None
        for li in b.line_items:
            name = (li.item_name or "").strip()
            if not name:
                continue
            revenue_by_item[name] = revenue_by_item.get(name, 0) + (li.line_total or 0)
            signed_qty = -(li.quantity or 0) if is_return else (li.quantity or 0)
            qty_by_item[name] = qty_by_item.get(name, 0) + signed_qty
            if li.item_id and name not in id_by_item:
                id_by_item[name] = li.item_id
    result = [
        {"item": k, "revenue": v, "quantity": qty_by_item.get(k, 0), "item_id": id_by_item.get(k)}
        for k, v in revenue_by_item.items()
    ]
    result.sort(key=lambda x: x["revenue"], reverse=True)
    return result[:limit]

@router.get("/reports/profit-by-item")
def profit_by_item(db: Session = Depends(get_db)):
    """Revenue, COGS, and profit per item and per category — unlike
    top-items-by-revenue (which only ranks by how much was sold), this
    surfaces items that sell a lot but earn little, or sell rarely but earn
    a lot per unit. All-time, same exclusions as every other real-sale
    aggregation here (quotes/voided bills never counted; a return nets back
    out rather than counting as a new occurrence)."""
    bills = db.query(models.Bill).options(selectinload(models.Bill.line_items)).filter(
        models.Bill.is_quote == False, models.Bill.is_voided == False  # noqa: E712
    ).all()

    category_by_id = {i.id: (i.category or "Uncategorized") for i in db.query(models.Item).all()}

    by_item: dict = {}
    for b in bills:
        is_return = b.return_of_bill_id is not None
        for li in b.line_items:
            name = (li.item_name or "").strip()
            if not name:
                continue
            row = by_item.setdefault(name, {
                "item": name,
                "item_id": li.item_id,
                "category": category_by_id.get(li.item_id, "Uncategorized"),
                "revenue": 0.0,
                "cogs": 0.0,
                "quantity": 0.0,
            })
            row["revenue"] += li.line_total or 0
            row["cogs"] += li.cost_price or 0
            row["quantity"] += -(li.quantity or 0) if is_return else (li.quantity or 0)

    items = []
    by_category: dict = {}
    for row in by_item.values():
        row["profit"] = row["revenue"] - row["cogs"]
        items.append(row)
        cat = by_category.setdefault(row["category"], {
            "category": row["category"], "revenue": 0.0, "cogs": 0.0,
        })
        cat["revenue"] += row["revenue"]
        cat["cogs"] += row["cogs"]

    categories = list(by_category.values())
    for cat in categories:
        cat["profit"] = cat["revenue"] - cat["cogs"]

    items.sort(key=lambda r: r["profit"], reverse=True)
    categories.sort(key=lambda r: r["profit"], reverse=True)
    return {"by_item": items, "by_category": categories}

@router.get("/reports/top-customers-by-revenue")
def top_customers_by_revenue(db: Session = Depends(get_db), limit: int = 5):
    customers = db.query(models.Customer).all()
    real_bills_by_customer = {
        c.id: [b for b in c.bills if not b.is_quote and not b.is_voided]
        for c in customers
    }
    result = [
        {
            "customer_id": c.id,
            "customer_name": c.name,
            "revenue": sum(b.amount for b in real_bills_by_customer[c.id]),
            "bill_count": len(real_bills_by_customer[c.id]),
        }
        for c in customers
        if real_bills_by_customer[c.id]
    ]
    result.sort(key=lambda x: x["revenue"], reverse=True)
    return result[:limit]

class AskShopRequest(BaseModel):
    question: str
    language: str | None = None

def _localize_facts(db: Session, facts: dict, language: str | None) -> None:
    """Swap typed item/category/customer names for the saved translation the app
    shows (name_translations), so the answer cites the names the user sees. A name
    without one stays as typed; English and unknown languages change nothing."""
    from utils.name_translate import translate

    slots = (
        [(r, "item", "item") for r in facts["top_items_by_revenue"]]
        + [(r, "category", "category") for r in facts["stock_valuation_by_category"]]
        + [(r, "category", "category") for r in facts["expenses_this_month_by_category"]]
        + [(r, "customer_name", "party") for r in facts["top_outstanding_customers"]]
    )
    low = facts["low_stock_items"]
    names = translate(db, language, [(k, r[f]) for r, f, k in slots] + [("item", n) for n in low])
    for r, f, k in slots:
        r[f] = names.get((k, r[f]), r[f])
    facts["low_stock_items"] = [names.get(("item", n), n) for n in low]

@router.post("/reports/ask")
def ask_shop(body: AskShopRequest, db: Session = Depends(get_db), request: Request = None):
    """"Ask Your Shop" — a natural-language question answered from a
    snapshot of the same figures the Reports screen already shows. The AI
    never runs its own query against the database; it only summarizes facts
    computed here with the exact same plain queries every other report in
    this file uses."""
    require_ai_rate_limit(request)
    valuation = stock_valuation(db)
    dues = outstanding_by_customer(db)
    low = low_stock(db)
    facts = {
        "monthly_sales": monthly_totals(db)[:6],
        "monthly_profit": profit_monthly(db)[:6],
        "expenses_this_month_by_category": expenses_by_category(db),
        "stock_valuation_total": valuation["total_value"],
        "stock_valuation_by_category": valuation["by_category"],
        "top_items_by_revenue": top_items_by_revenue(db, limit=5),
        "low_stock_count": len(low),
        "low_stock_items": [i["name"] for i in low[:5]],
        "outstanding_total": sum(c["outstanding"] for c in dues),
        "outstanding_customer_count": len(dues),
        "top_outstanding_customers": dues[:5],
    }
    _localize_facts(db, facts, body.language)
    try:
        answer = answer_question(body.question, facts, body.language)
    except AiScanNotConfigured as exc:
        raise HTTPException(status_code=503, detail=str(exc))
    except GeminiAPIError as exc:
        raise HTTPException(status_code=503, detail=f"AI answer failed: {exc}")
    return {"answer": answer}

class SpeakRequest(BaseModel):
    text: str
    voice: str | None = None
    pace: str | None = None
    tone: str | None = None

@router.post("/reports/speak")
def speak_answer(body: SpeakRequest, request: Request = None):
    """Reads an Ask Your Shop answer aloud (Gemini text-to-speech, WAV)."""
    require_speak_rate_limit(request)
    text = body.text.strip()
    if not text or len(text) > 1200:
        raise HTTPException(status_code=422, detail="text must be 1-1200 characters")
    try:
        wav = speak(text, body.voice, body.pace, body.tone)
    except AiScanNotConfigured as exc:
        raise HTTPException(status_code=503, detail=str(exc))
    except GeminiAPIError as exc:
        raise HTTPException(status_code=503, detail=f"Voice failed: {exc}")
    audio, mime = to_mp3(wav)
    return Response(content=audio, media_type=mime)
