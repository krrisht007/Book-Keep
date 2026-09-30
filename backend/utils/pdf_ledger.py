"""Customer / supplier ledger statement PDF generation."""
from datetime import datetime

from utils.pdf_font import FONT, new_pdf
from utils.pdf_invoice import _draw_shop_logo
from utils.pdf_labels import Labels

def _bill_description(bill, L) -> str:
    """Short human-readable description of a bill for the ledger."""
    line_items = bill.line_items or []
    if line_items:
        names = [f"{L.n('item', li.item_name)} x{li.quantity:g}" for li in line_items[:2]]
        if len(line_items) > 2:
            names.append(L("more", len(line_items) - 2))
        return ", ".join(names)
    return (bill.items or "Bill")[:40]

def _build_ledger_pdf(customer, bills, shop, lang=None) -> bytes:
    """Build a customer ledger statement PDF with a running balance."""
    pdf = new_pdf(lang)
    L = Labels(lang)
    L.load_names([("party", customer.name), ("shop", shop["shop_name"]), ("address", shop["shop_address"])] + [("item", li.item_name) for b in bills for li in (b.line_items or [])[:2]])
    A = L.align
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=15)

    _draw_shop_logo(pdf, shop)
    pdf.set_font(FONT, "B", 18)
    pdf.cell(0, 10, L.n("shop", shop["shop_name"]), ln=True, align="C")
    pdf.set_font(FONT, "", 10)
    if shop["shop_address"]:
        pdf.cell(0, 5, L.n("address", shop["shop_address"]), ln=True, align="C")
    if shop["shop_phone"]:
        pdf.cell(0, 5, L("phone", shop['shop_phone']), ln=True, align="C")
    if shop["shop_strn"]:
        pdf.cell(0, 5, L("strn", shop['shop_strn']), ln=True, align="C")

    pdf.ln(2)
    pdf.set_font(FONT, "B", 14)
    pdf.cell(0, 8, L("l_customer_title"), ln=True, align="C")
    pdf.ln(4)

    pdf.set_font(FONT, "B", 11)
    pdf.cell(0, 6, L("customer", L.n("party", customer.name)), ln=True, align=A)
    pdf.set_font(FONT, "", 10)
    if customer.phone:
        pdf.cell(0, 6, L("phone", customer.phone), ln=True, align=A)
    if customer.credit_limit:
        pdf.cell(0, 6, L("credit_limit", f"{customer.credit_limit:.2f}"), ln=True, align=A)
    pdf.ln(4)

    total_billed = sum((b.amount or 0) for b in bills)
    total_paid = sum((b.amount_paid or 0) for b in bills)
    outstanding = total_billed - total_paid

    if not bills:
        pdf.set_font(FONT, "", 10)
        pdf.cell(0, 6, L("no_bills"), ln=True, align=A)
    else:
        widths = [22, 74, 22, 26, 26, 26]
        headers = [L("h_date"), L("h_desc"), L("h_bill"), L("h_amount"), L("h_paid"), L("h_balance")]

        pdf.set_fill_color(15, 118, 110)
        pdf.set_text_color(255, 255, 255)
        pdf.set_font(FONT, "B", 9)
        for w, h in zip(widths, headers):
            pdf.cell(w, 7, h, border=1, align="C", fill=True)
        pdf.ln()

        pdf.set_text_color(0, 0, 0)
        pdf.set_font(FONT, "", 9)
        running = 0.0
        for bill in bills:
            running += (bill.amount or 0) - (bill.amount_paid or 0)
            desc = _bill_description(bill, L)
            if pdf.get_string_width(desc) > widths[1] - 4:
                desc = desc[:34] + "..."
            pdf.cell(widths[0], 6, L.day(bill.date), border=1, align="C")
            pdf.cell(widths[1], 6, desc, border=1)
            pdf.cell(widths[2], 6, bill.id[:6].upper(), border=1, align="C")
            pdf.cell(widths[3], 6, f"{(bill.amount or 0):.2f}", border=1, align="R")
            pdf.cell(widths[4], 6, f"{(bill.amount_paid or 0):.2f}", border=1, align="R")
            pdf.cell(widths[5], 6, f"{running:.2f}", border=1, align="R")
            pdf.ln()

    pdf.ln(4)
    pdf.set_font(FONT, "B", 11)
    pdf.cell(0, 7, L("total_billed", f"{total_billed:.2f}"), ln=True, align="R")
    pdf.cell(0, 7, L("total_paid", f"{total_paid:.2f}"), ln=True, align="R")
    pdf.cell(0, 7, L("outstanding_balance", f"{outstanding:.2f}"), ln=True, align="R")

    pdf.ln(6)
    pdf.set_font(FONT, "I", 10)
    pdf.cell(0, 6, L("computer_statement"), ln=True, align="C")
    pdf.set_font(FONT, "", 8)
    pdf.cell(
        0,
        5,
        L("generated", L.when(datetime.now())),
        ln=True,
        align="C",
    )

    return pdf.output()

def _build_supplier_ledger_pdf(supplier, purchases, shop, lang=None) -> bytes:
    """Build a supplier ledger statement PDF with a running balance."""
    pdf = new_pdf(lang)
    L = Labels(lang)
    L.load_names([("party", supplier.name), ("shop", shop["shop_name"]), ("address", shop["shop_address"])])
    A = L.align
    pdf.add_page()
    pdf.set_auto_page_break(auto=True, margin=15)

    _draw_shop_logo(pdf, shop)
    pdf.set_font(FONT, "B", 18)
    pdf.cell(0, 10, L.n("shop", shop["shop_name"]), ln=True, align="C")
    pdf.set_font(FONT, "", 10)
    if shop["shop_address"]:
        pdf.cell(0, 5, L.n("address", shop["shop_address"]), ln=True, align="C")
    if shop["shop_phone"]:
        pdf.cell(0, 5, L("phone", shop['shop_phone']), ln=True, align="C")
    if shop["shop_strn"]:
        pdf.cell(0, 5, L("strn", shop['shop_strn']), ln=True, align="C")

    pdf.ln(2)
    pdf.set_font(FONT, "B", 14)
    pdf.cell(0, 8, L("l_supplier_title"), ln=True, align="C")
    pdf.ln(4)

    pdf.set_font(FONT, "B", 11)
    pdf.cell(0, 6, L("supplier", L.n("party", supplier.name)), ln=True, align=A)
    pdf.set_font(FONT, "", 10)
    if supplier.phone:
        pdf.cell(0, 6, L("phone", supplier.phone), ln=True, align=A)
    if supplier.strn:
        pdf.cell(0, 6, L("strn", supplier.strn), ln=True, align=A)
    pdf.ln(4)

    total_purchased = sum((p.amount or 0) for p in purchases)
    total_paid = sum((p.amount_paid or 0) for p in purchases)
    outstanding = total_purchased - total_paid

    if not purchases:
        pdf.set_font(FONT, "", 10)
        pdf.cell(0, 6, L("no_purchases"), ln=True, align=A)
    else:
        widths = [22, 74, 22, 26, 26, 26]
        headers = [L("h_date"), L("h_desc"), L("h_receipt"), L("h_amount"), L("h_paid"), L("h_balance")]

        pdf.set_fill_color(15, 118, 110)
        pdf.set_text_color(255, 255, 255)
        pdf.set_font(FONT, "B", 9)
        for w, h in zip(widths, headers):
            pdf.cell(w, 7, h, border=1, align="C", fill=True)
        pdf.ln()

        pdf.set_text_color(0, 0, 0)
        pdf.set_font(FONT, "", 9)
        running = 0.0
        for purchase in purchases:
            running += (purchase.amount or 0) - (purchase.amount_paid or 0)
            desc = _bill_description(purchase, L)
            if pdf.get_string_width(desc) > widths[1] - 4:
                desc = desc[:34] + "..."
            pdf.cell(widths[0], 6, L.day(purchase.date), border=1, align="C")
            pdf.cell(widths[1], 6, desc, border=1)
            pdf.cell(widths[2], 6, purchase.id[:6].upper(), border=1, align="C")
            pdf.cell(widths[3], 6, f"{(purchase.amount or 0):.2f}", border=1, align="R")
            pdf.cell(widths[4], 6, f"{(purchase.amount_paid or 0):.2f}", border=1, align="R")
            pdf.cell(widths[5], 6, f"{running:.2f}", border=1, align="R")
            pdf.ln()

    pdf.ln(4)
    pdf.set_font(FONT, "B", 11)
    pdf.cell(0, 7, L("total_purchased", f"{total_purchased:.2f}"), ln=True, align="R")
    pdf.cell(0, 7, L("total_paid", f"{total_paid:.2f}"), ln=True, align="R")
    pdf.cell(0, 7, L("outstanding_payable", f"{outstanding:.2f}"), ln=True, align="R")

    pdf.ln(6)
    pdf.set_font(FONT, "I", 10)
    pdf.cell(0, 6, L("computer_statement"), ln=True, align="C")
    pdf.set_font(FONT, "", 8)
    pdf.cell(
        0,
        5,
        L("generated", L.when(datetime.now())),
        ln=True,
        align="C",
    )

    return pdf.output()
