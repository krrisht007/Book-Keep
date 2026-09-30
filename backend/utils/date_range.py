"""Shared optional from_date/to_date (YYYY-MM-DD) query-param parsing, for
report/export endpoints that accept a date range — see
backup.export_bills/export_expenses.
"""
from datetime import date, datetime, time, timedelta
from typing import Optional

from fastapi import HTTPException


def _parse_date(value: Optional[str], label: str) -> Optional[date]:
    if not value:
        return None
    try:
        return datetime.strptime(value, "%Y-%m-%d").date()
    except ValueError:
        raise HTTPException(status_code=400, detail=f"Invalid {label}: expected YYYY-MM-DD")


def parse_date_range(from_date: Optional[str], to_date: Optional[str]):
    """Returns (start, end) datetime bounds as a half-open [start, end)
    range covering every moment of both calendar days, inclusive. Either
    side is None when that query param wasn't given — callers decide what
    an unbounded side means (e.g. defaulting both to today)."""
    f = _parse_date(from_date, "from_date")
    t = _parse_date(to_date, "to_date")
    start = datetime.combine(f, time.min) if f else None
    end = datetime.combine(t + timedelta(days=1), time.min) if t else None
    return start, end


def month_bounds(month: str) -> tuple:
    """(start, end) half-open datetime range covering every moment of the
    given calendar month ("YYYY-MM"). Filtering a date column with
    `>= start` / `< end` works on any SQL backend — unlike filtering with
    `strftime('%Y-%m', col) == month`, which only SQLite understands (see
    gst.py's sales-tax report queries, the one place this app used to rely on
    a SQLite-only SQL function)."""
    year, mon = (int(p) for p in month.split("-"))
    start = datetime(year, mon, 1)
    end = datetime(year + 1, 1, 1) if mon == 12 else datetime(year, mon + 1, 1)
    return start, end
