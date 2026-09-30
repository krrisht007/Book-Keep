"""GST tax-invoice PDF generation."""
import io
import os
from datetime import datetime

import httpx
from fpdf import FPDF

import models
from config import UPLOADS_DIR
from utils.gst import _get_invoice_no, _gst_breakdown, _amount_in_words, _resolve_gst_for_line
from utils.pdf_font import FONT, new_pdf
from utils.pdf_labels import Labels
from utils.settings import _get_settings

def _draw_shop_logo(pdf: FPDF, shop: dict) -> None:
    """Draws the shop logo centered at the top of the page, if one is set.
    Shared by the invoice and ledger PDFs. No-op when there's no logo, or it
    can't be loaded (deleted after the URL was saved, network hiccup fetching
    a Storage-hosted logo, etc.) — a missing logo shouldn't block the PDF.

    logo_url is a local "/uploads/..." path when Firebase Storage isn't
    configured (local dev — see utils/uploads.py), or a Storage https:// URL
    in production; either way pdf.image() takes a path or a file-like object,
    so the two cases just differ in how the bytes get there.
    """
    logo_url = (shop.get("shop_logo_url") or "").split("?")[0]
    if not logo_url:
        return
    if logo_url.startswith("http"):
        try:
            resp = httpx.get(logo_url, timeout=5)
            resp.raise_for_status()
            logo_source = io.BytesIO(resp.content)
        except httpx.HTTPError:
            return
    else:
        logo_source = os.path.join(UPLOADS_DIR, os.path.basename(logo_url))
        if not os.path.isfile(logo_source):
            return
    size = 22
    x = (pdf.epw - size) / 2 + pdf.l_margin
    pdf.image(logo_source, x=x, y=pdf.get_y(), w=size, h=size)
    pdf.ln(size + 2)

def _build_invoice_pdf(bill, customer, shop, db, lang=None) -> bytes:
    """Build a TAX INVOICE PDF for a single bill using fpdf2.

    Prices are treated as tax-inclusive: each line's taxable value and tax
    amount are derived from the inclusive amount, so the grand total always
    equals the bill amount (existing balances are untouched).
    """
    pdf = new_pdf(lang)
    L = Labels(lang)
    L.load_names([("party", customer.name), ("address", customer.address), ("shop", shop["shop_name"]), ("address", shop["shop_address"])] + [("item", li.item_name) for li in (bill.line_items or [])])
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
    strn = shop.get("shop_strn") or ""
    if strn:
        pdf.cell(0, 5, L("strn", strn), ln=True, align="C")

    pdf.ln(2)
    pdf.set_font(FONT, "B", 14)
    pdf.cell(0, 8, L("invoice_title"), ln=True, align="C")
    pdf.ln(4)

    invoice_no = _get_invoice_no(db, bill)
    meta = [
        L("invoice_no", invoice_no),
        L("date", L.when(bill.date)),
        L("pay_status", L.status(bill.payment_status)),
        L("pay_method", L.method(bill.payment_method)),
    ]
    col_w = pdf.epw / 2
    y = pdf.get_y()
    pdf.set_font(FONT, "", 10)
    for i in range(0, len(meta), 2):
        pdf.set_xy(pdf.l_margin, y)
        pdf.cell(col_w, 6, meta[i])
        if i + 1 < len(meta):
            pdf.cell(col_w, 6, meta[i + 1])
        y += 6
    pdf.set_y(y)
    pdf.ln(3)

    pdf.set_font(FONT, "B", 11)
    pdf.cell(0, 6, L("billed_to"), ln=True, align=A)
    pdf.set_font(FONT, "", 10)
    pdf.cell(0, 6, L.n("party", customer.name), ln=True, align=A)
    if customer.phone:
        pdf.cell(0, 6, L("phone", customer.phone), ln=True, align=A)
    if customer.strn:
        pdf.cell(0, 6, L("strn", customer.strn), ln=True, align=A)
    if customer.address:
        pdf.multi_cell(0, 5, L("address", L.n("address", customer.address)), align=A)
    pdf.ln(3)

    line_items = bill.line_items or []
    if line_items:
        widths = [8, 20, 52, 12, 20, 28, 12, 36]
        headers = ["#", L("h_hsn"), L("h_item"), L("h_qty"), L("h_rate"), L("h_taxable"), L("h_taxpct"), L("h_tax")]

        pdf.set_fill_color(15, 118, 110)
        pdf.set_text_color(255, 255, 255)
        pdf.set_font(FONT, "B", 8)
        for w, h in zip(widths, headers):
            pdf.cell(w, 7, h, border=1, align="C", fill=True)
        pdf.ln()

        pdf.set_text_color(0, 0, 0)
        pdf.set_font(FONT, "", 8)
        rows = []
        defaults = _get_settings(db)
        for idx, li in enumerate(line_items, start=1):
            if li.gst_rate is None:
                catalog_item = None
                if li.item_id:
                    catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                _, resolved_gst = _resolve_gst_for_line(li, catalog_item, defaults)
                li.gst_rate = resolved_gst
                db.add(li)
            if not li.hsn_code:
                catalog_item = None
                if li.item_id:
                    catalog_item = db.query(models.Item).filter(models.Item.id == li.item_id).first()
                resolved_hsn, _ = _resolve_gst_for_line(li, catalog_item, defaults)
                li.hsn_code = resolved_hsn
                db.add(li)
        db.commit()
        for idx, li in enumerate(line_items, start=1):
            name = L.n("item", li.item_name or "")
            if pdf.get_string_width(name) > widths[2] - 3:
                name = name[:24] + "..."
            bd = _gst_breakdown(li.line_total or 0, li.gst_rate)
            rows.append((li, bd))
            pdf.cell(widths[0], 7, str(idx), border=1, align="C")
            pdf.cell(widths[1], 7, (li.hsn_code or "")[:12], border=1, align="C")
            pdf.cell(widths[2], 7, name, border=1)
            pdf.cell(widths[3], 7, f"{li.quantity:g}", border=1, align="C")
            pdf.cell(widths[4], 7, f"{li.unit_price:.2f}", border=1, align="R")
            pdf.cell(widths[5], 7, f"{bd['taxable']:.2f}", border=1, align="R")
            pdf.cell(widths[6], 7, f"{bd['rate']:g}%", border=1, align="C")
            pdf.cell(widths[7], 7, f"{bd['tax']:.2f}", border=1, align="R")
            pdf.ln()
        pdf.set_font(FONT, "I", 7)
        pdf.cell(0, 4, L("inc_note"), ln=True, align=A)
        pdf.ln(2)

        taxable_total = round(sum(bd["taxable"] for _, bd in rows), 2)
        gst_total = round(sum(bd["tax"] for _, bd in rows), 2)
        grand_total = round(bill.amount or 0, 2)
        discount = round(bill.discount_amount or 0, 2)
        round_off = round(grand_total - taxable_total - gst_total + discount, 2)

        box_w = 78
        pdf.set_font(FONT, "", 10)
        total_lines = [
            (L("t_taxable"), L.money(f"{taxable_total:.2f}")),
            (L("t_addtax"), L.money(f"{gst_total:.2f}")),
        ]
        if discount > 0:
            total_lines.append((L("t_discount"), L.money(f"{discount:.2f}")))
        total_lines += [
            (L("t_roundoff"), L.money(f"{round_off:.2f}")),
            (L("t_grand"), L.money(f"{grand_total:.2f}")),
        ]
        for label, value in total_lines:
            bold = label == L("t_grand")
            pdf.set_font(FONT, "B" if bold else "", 10)
            pdf.set_x(pdf.epw - box_w)
            pdf.cell(box_w * 0.62, 7, label, border=1)
            pdf.cell(box_w * 0.38, 7, value, border=1, align="R")
            pdf.ln()

        pdf.ln(3)
        if L.lang == "en":
            pdf.set_font(FONT, "B", 10)
            pdf.multi_cell(0, 6, L("words", _amount_in_words(grand_total)))

        pdf.ln(2)
        pdf.set_font(FONT, "B", 10)
        pdf.cell(0, 6, L("hsn_summary"), ln=True, align=A)
        sw = [30, 60, 28, 14, 28, 30]
        sheaders = [L("h_hsn"), L("h_desc"), L("h_taxable"), L("h_taxpct"), L("h_tax"), L("h_total")]
        pdf.set_fill_color(15, 118, 110)
        pdf.set_text_color(255, 255, 255)
        pdf.set_font(FONT, "B", 8)
        for w, h in zip(sw, sheaders):
            pdf.cell(w, 6, h, border=1, align="C", fill=True)
        pdf.ln()
        pdf.set_text_color(0, 0, 0)
        pdf.set_font(FONT, "", 8)

        groups, order = {}, []
        for li, bd in rows:
            key = (li.hsn_code or "-", bd["rate"])
            if key not in groups:
                groups[key] = {"taxable": 0.0, "tax": 0.0, "names": []}
                order.append(key)
            g = groups[key]
            g["taxable"] += bd["taxable"]
            g["tax"] += bd["tax"]
            if L.n("item", li.item_name or "") not in g["names"]:
                g["names"].append(L.n("item", li.item_name or ""))
        for key in order:
            g = groups[key]
            desc = ", ".join(g["names"])
            if pdf.get_string_width(desc) > sw[1] - 3:
                desc = desc[:32] + "..."
            total = round(g["taxable"] + g["tax"], 2)
            pdf.cell(sw[0], 6, key[0], border=1, align="C")
            pdf.cell(sw[1], 6, desc, border=1)
            pdf.cell(sw[2], 6, f"{g['taxable']:.2f}", border=1, align="R")
            pdf.cell(sw[3], 6, f"{key[1]:g}%", border=1, align="C")
            pdf.cell(sw[4], 6, f"{g['tax']:.2f}", border=1, align="R")
            pdf.cell(sw[5], 6, f"{total:.2f}", border=1, align="R")
            pdf.ln()

        pdf.ln(4)
        pdf.set_font(FONT, "", 10)
        pdf.cell(0, 6, L("amount_paid", f"{(bill.amount_paid or 0):.2f}"), ln=True, align="R")
        outstanding = grand_total - (bill.amount_paid or 0)
        pdf.set_font(FONT, "B", 10)
        pdf.cell(0, 7, L("outstanding", f"{outstanding:.2f}"), ln=True, align="R")
    else:
        pdf.set_font(FONT, "B", 10)
        pdf.cell(0, 6, L("items_lbl"), ln=True, align=A)
        pdf.set_font(FONT, "", 10)
        pdf.multi_cell(0, 6, L("no_items"), align=A)
        pdf.ln(2)
        outstanding = (bill.amount or 0) - (bill.amount_paid or 0)
        pdf.set_font(FONT, "B", 11)
        pdf.cell(0, 7, L("total_rs", f"{bill.amount:.2f}"), ln=True, align="R")
        pdf.set_font(FONT, "", 10)
        pdf.cell(0, 6, L("amount_paid", f"{(bill.amount_paid or 0):.2f}"), ln=True, align="R")
        pdf.set_font(FONT, "B", 11)
        pdf.cell(0, 7, L("outstanding", f"{outstanding:.2f}"), ln=True, align="R")

    pdf.ln(6)
    upi_id = shop.get("upi_id") or ""
    if upi_id and outstanding > 0:
        pdf.set_font(FONT, "B", 9)
        pdf.cell(0, 5, L("pay_jazz", upi_id), ln=True, align=A)
        pdf.ln(2)

    pdf.set_font(FONT, "", 9)
    pdf.cell(0, 6, L("for_shop", L.n("shop", shop['shop_name'])), ln=True, align="R")
    pdf.cell(0, 16, "", ln=True)
    pdf.cell(0, 6, L("signatory"), ln=True, align="R")
    pdf.ln(2)
    pdf.set_font(FONT, "I", 8)
    pdf.cell(0, 5, L("computer_invoice"), ln=True, align="C")
    pdf.cell(0, 5, L("thanks"), ln=True, align="C")
    pdf.set_font(FONT, "", 8)
    pdf.cell(
        0,
        5,
        L("generated", L.when(datetime.now())),
        ln=True,
        align="C",
    )

    return pdf.output()
