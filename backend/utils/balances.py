"""A customer's real outstanding balance — shared so routers/bills.py's
credit-limit check uses the exact same number reports.py already shows the
user (outstanding_by_customer / dues_aging), instead of a second
independently-maintained copy of this logic drifting out of sync with it.
"""
import models


def customer_outstanding(customer: "models.Customer") -> float:
    """Real (non-quote, non-voided) bills' amount minus amount_paid."""
    real_bills = [b for b in customer.bills if not b.is_quote and not b.is_voided]
    return sum(b.amount for b in real_bills) - sum(b.amount_paid for b in real_bills)
