"""Push-notification device registry and manually-triggered smart checks."""
from datetime import datetime, timedelta
from typing import List

from fastapi import APIRouter, Depends, HTTPException, Request
from sqlalchemy.orm import Session

import models
import schemas
from database import get_db
from firebase_setup import FIREBASE_READY, firebase_messaging

from utils.gemini import AiScanNotConfigured, GeminiAPIError
from utils.ai_morning_briefing import generate_briefing
from utils.name_translate import translate
from utils.rate_limit import require_ai_rate_limit

router = APIRouter()

def _set_setting(db: Session, key: str, value: str) -> None:
    row = db.query(models.Setting).filter(models.Setting.key == key).first()
    if row is None:
        db.add(models.Setting(key=key, value=value))
    else:
        row.value = value
    db.commit()

@router.post("/notifications/token")
def register_device_token(device: schemas.DeviceTokenCreate, db: Session = Depends(get_db)):
    """Register (or refresh) an FCM device token so the backend can push to it."""
    existing = (
        db.query(models.DeviceToken)
        .filter(models.DeviceToken.token == device.token)
        .first()
    )
    if existing:
        existing.device_name = device.device_name or existing.device_name
        db.commit()
        db.refresh(existing)
        return existing
    db_token = models.DeviceToken(token=device.token, device_name=device.device_name)
    db.add(db_token)
    db.commit()
    db.refresh(db_token)
    return db_token

@router.get("/notifications/tokens", response_model=List[schemas.DeviceTokenOut])
def list_device_tokens(db: Session = Depends(get_db)):
    return db.query(models.DeviceToken).all()

@router.delete("/notifications/token/{token}")
def unregister_device_token(token: str, db: Session = Depends(get_db)):
    db.query(models.DeviceToken).filter(models.DeviceToken.token == token).delete()
    db.commit()
    return {"status": "removed"}

@router.post("/notifications/send")
def send_notification(message: schemas.NotificationMessage, db: Session = Depends(get_db)):
    """Send a push notification to every registered device via FCM."""
    if not FIREBASE_READY:
        raise HTTPException(
            status_code=503,
            detail=(
                "Firebase is not configured. Set FIREBASE_SERVICE_ACCOUNT_PATH "
                "in backend/.env to the service-account JSON path."
            ),
        )
    tokens = [t.token for t in db.query(models.DeviceToken).all()]
    if not tokens:
        return {"status": "sent", "sent": 0, "skipped": 0, "reason": "no_registered_devices"}

    msg = firebase_messaging.MulticastMessage(
        notification=firebase_messaging.Notification(
            title=message.title, body=message.body
        ),
        data=message.data or {},
        tokens=tokens,
    )
    response = firebase_messaging.send_each_for_multicast(msg)
    return {
        "status": "sent",
        "sent": response.success_count,
        "skipped": response.failure_count,
    }

@router.get("/notifications/check-overdue")
def check_overdue_and_notify(db: Session = Depends(get_db)):
    """Send a reminder push to all devices about overdue unpaid bills."""
    if not FIREBASE_READY:
        raise HTTPException(
            status_code=503,
            detail="Firebase is not configured; set FIREBASE_SERVICE_ACCOUNT_PATH in backend/.env",
        )
    today = datetime.utcnow().date()
    real_bills = (
        db.query(models.Bill)
        .filter(models.Bill.is_quote == False, models.Bill.is_voided == False)  # noqa: E712
        .order_by(models.Bill.date)
        .all()
    )
    overdue_bills = [
        b
        for b in real_bills
        if b.payment_status == "unpaid" and b.date.date() < today
        and (b.amount_paid or 0) < (b.amount or 0)
    ]
    if not overdue_bills:
        return {"status": "ok", "notified": 0, "message": "No overdue bills"}

    affected_customers = {b.customer_id for b in overdue_bills}
    total_due = sum(
        (b.amount or 0) - (b.amount_paid or 0)
        for b in real_bills
        if b.customer_id in affected_customers
    )
    count = len(overdue_bills)
    body = (
        f"{count} overdue bill{'s' if count != 1 else ''} "
        f"totaling Rs. {total_due:,.2f} awaiting collection."
    )
    tokens = [t.token for t in db.query(models.DeviceToken).all()]
    if not tokens:
        return {"status": "ok", "notified": 0, "message": "No devices registered"}
    msg = firebase_messaging.MulticastMessage(
        notification=firebase_messaging.Notification(
            title="Payment reminders due",
            body=body,
        ),
        data={"type": "overdue_reminder"},
        tokens=tokens,
    )
    response = firebase_messaging.send_each_for_multicast(msg)
    return {
        "status": "ok",
        "notified": response.success_count,
        "message": f"Overdue reminder sent to {response.success_count} device(s)",
    }

@router.get("/notifications/check-low-stock")
def check_low_stock_and_notify(db: Session = Depends(get_db)):
    """Send a push notification listing all items that are at or below their low-stock threshold."""
    low_items = (
        db.query(models.Item)
        .filter(
            models.Item.low_stock_threshold.isnot(None),
            models.Item.stock_quantity <= models.Item.low_stock_threshold,
        )
        .order_by(models.Item.stock_quantity)
        .all()
    )
    result_items = [
        {
            "id": i.id,
            "name": i.name,
            "stock_quantity": i.stock_quantity,
            "low_stock_threshold": i.low_stock_threshold,
        }
        for i in low_items
    ]
    if not low_items:
        return {"status": "ok", "notified": 0, "count": 0, "items": [], "message": "All items are sufficiently stocked"}

    count = len(low_items)
    names = ", ".join(i.name for i in low_items[:3])
    suffix = f" and {count - 3} more" if count > 3 else ""
    body = f"{count} item{'s' if count != 1 else ''} running low: {names}{suffix}."

    tokens = [t.token for t in db.query(models.DeviceToken).all()]
    notified = 0
    if tokens and FIREBASE_READY:
        msg = firebase_messaging.MulticastMessage(
            notification=firebase_messaging.Notification(
                title="⚠️ Low Stock Alert",
                body=body,
            ),
            data={"type": "low_stock"},
            tokens=tokens,
        )
        response = firebase_messaging.send_each_for_multicast(msg)
        notified = response.success_count

    return {
        "status": "ok",
        "notified": notified,
        "count": count,
        "items": result_items,
        "message": body,
    }

@router.get("/notifications/daily-summary")
def daily_summary_and_notify(db: Session = Depends(get_db)):
    """Send a push with yesterday's sales, cash collected, and profit digest."""
    today = datetime.utcnow().date()
    yesterday_start = datetime(today.year, today.month, today.day) - timedelta(days=1)
    yesterday_end = datetime(today.year, today.month, today.day)

    bills_yday = (
        db.query(models.Bill)
        .filter(
            models.Bill.date >= yesterday_start,
            models.Bill.date < yesterday_end,
            models.Bill.is_quote == False,  # noqa: E712
            models.Bill.is_voided == False,  # noqa: E712
        )
        .all()
    )

    total_sales = sum((b.amount or 0) for b in bills_yday)
    total_collected = sum((b.amount_paid or 0) for b in bills_yday)
    bill_count = len(bills_yday)

    total_cogs = sum(
        (li.cost_price or 0) for bill in bills_yday for li in bill.line_items
    )
    profit = total_sales - total_cogs

    summary = {
        "date": str(yesterday_start.date()),
        "bill_count": bill_count,
        "total_sales": round(total_sales, 2),
        "total_collected": round(total_collected, 2),
        "profit": round(profit, 2),
    }

    if bill_count == 0:
        body = "No sales recorded yesterday."
    else:
        body = (
            f"Yesterday: {bill_count} bill{'s' if bill_count != 1 else ''}, "
            f"Rs. {total_sales:,.0f} sales, Rs. {total_collected:,.0f} collected, "
            f"Rs. {profit:,.0f} profit."
        )

    tokens = [t.token for t in db.query(models.DeviceToken).all()]
    notified = 0
    if tokens and FIREBASE_READY:
        msg = firebase_messaging.MulticastMessage(
            notification=firebase_messaging.Notification(
                title="📊 Daily Business Summary",
                body=body,
            ),
            data={"type": "daily_summary"},
            tokens=tokens,
        )
        response = firebase_messaging.send_each_for_multicast(msg)
        notified = response.success_count

    return {
        "status": "ok",
        "notified": notified,
        "summary": summary,
        "message": body,
    }

@router.get("/notifications/morning-briefing")
def morning_briefing_and_notify(
    db: Session = Depends(get_db), request: Request = None, language: str | None = None
):
    """Sends a push with an AI-written 2-4 sentence handover synthesizing
    yesterday's sales/collections, current low stock, overdue payments, and
    pending purchase orders — see utils/ai_morning_briefing.py. Every fact is
    computed here with plain queries; Gemini only turns them into prose, it
    never reads the DB or invents a figure itself."""
    require_ai_rate_limit(request)
    if not FIREBASE_READY:
        raise HTTPException(
            status_code=503,
            detail="Firebase is not configured; set FIREBASE_SERVICE_ACCOUNT_PATH in backend/.env",
        )

    today = datetime.utcnow().date()
    yesterday_start = datetime(today.year, today.month, today.day) - timedelta(days=1)
    yesterday_end = datetime(today.year, today.month, today.day)

    bills_yday = (
        db.query(models.Bill)
        .filter(
            models.Bill.date >= yesterday_start,
            models.Bill.date < yesterday_end,
            models.Bill.is_quote == False,  # noqa: E712
            models.Bill.is_voided == False,  # noqa: E712
        )
        .all()
    )
    total_sales = sum((b.amount or 0) for b in bills_yday)
    total_collected = sum((b.amount_paid or 0) for b in bills_yday)

    low_items = (
        db.query(models.Item)
        .filter(
            models.Item.low_stock_threshold.isnot(None),
            models.Item.stock_quantity <= models.Item.low_stock_threshold,
        )
        .order_by(models.Item.stock_quantity)
        .all()
    )

    real_bills = (
        db.query(models.Bill)
        .filter(models.Bill.is_quote == False, models.Bill.is_voided == False)  # noqa: E712
        .all()
    )
    overdue_bills = [
        b
        for b in real_bills
        if b.payment_status == "unpaid" and b.date.date() < today
        and (b.amount_paid or 0) < (b.amount or 0)
    ]
    overdue_total = sum((b.amount or 0) - (b.amount_paid or 0) for b in overdue_bills)

    pending_pos = (
        db.query(models.Purchase).filter(models.Purchase.is_po == True).count()  # noqa: E712
    )

    facts = {
        "date": str(yesterday_start.date()),
        "bills_yesterday": len(bills_yday),
        "sales_yesterday": round(total_sales, 2),
        "collected_yesterday": round(total_collected, 2),
        "low_stock_count": len(low_items),
        "low_stock_items": [i.name for i in low_items[:5]],
        "overdue_bill_count": len(overdue_bills),
        "overdue_total": round(overdue_total, 2),
        "pending_purchase_orders": pending_pos,
    }

    if language:
        language = language.strip().lower()[:2]
        _set_setting(db, "briefing_language", language)
    else:
        saved = db.query(models.Setting).filter(models.Setting.key == "briefing_language").first()
        language = saved.value if saved else None

    low_names = facts["low_stock_items"]
    shown = translate(db, language, [("item", n) for n in low_names])
    try:
        briefing = generate_briefing(
            {**facts, "low_stock_items": [shown.get(("item", n), n) for n in low_names]}, language
        )
    except AiScanNotConfigured as exc:
        raise HTTPException(status_code=503, detail=str(exc))
    except GeminiAPIError as exc:
        raise HTTPException(status_code=503, detail=f"AI briefing failed: {exc}")

    _set_setting(db, "last_briefing_text", briefing)
    _set_setting(db, "last_briefing_at", datetime.utcnow().isoformat())

    tokens = [t.token for t in db.query(models.DeviceToken).all()]
    notified = 0
    if tokens:
        msg = firebase_messaging.MulticastMessage(
            notification=firebase_messaging.Notification(
                title="🌅 Morning Briefing",
                body=briefing,
            ),
            data={"type": "morning_briefing"},
            tokens=tokens,
        )
        response = firebase_messaging.send_each_for_multicast(msg)
        notified = response.success_count

    return {
        "status": "ok",
        "notified": notified,
        "facts": facts,
        "message": briefing,
    }

@router.get("/notifications/morning-briefing/latest")
def latest_morning_briefing(db: Session = Depends(get_db)):
    """Plain DB read, no Gemini call — for the Home dashboard card to show
    the last briefing instantly instead of waiting on a live generation on
    every screen open. Written by morning_briefing_and_notify above (both
    the scheduled daily run and the manual "Send Briefing" trigger)."""
    text = db.query(models.Setting).filter(models.Setting.key == "last_briefing_text").first()
    at = db.query(models.Setting).filter(models.Setting.key == "last_briefing_at").first()
    return {
        "message": text.value if text else None,
        "generated_at": at.value if at else None,
    }
