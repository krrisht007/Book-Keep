"""Item rate card PDF — a shareable price list for customers, grouped by
category. Distinct from an invoice/ledger: no transaction data, just current
item name/unit/price, meant to be handed or WhatsApped to a customer who
asks "what's your rate for X"."""
from datetime import datetime

from utils.pdf_font import FONT, new_pdf
from utils.pdf_invoice import _draw_shop_logo
from utils.pdf_labels import Labels

def _build_rate_card_pdf(items, shop, lang=None) -> bytes:
    pdf = new_pdf(lang)
    L = Labels(lang)
    L.load_names([("shop", shop["shop_name"]), ("address", shop["shop_address"])] + [("item", i.name) for i in items] + [("category", i.category) for i in items if i.category])
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

    pdf.ln(2)
    pdf.set_font(FONT, "B", 14)
    pdf.cell(0, 8, L("rate_title"), ln=True, align="C")
    pdf.ln(4)

    if not items:
        pdf.set_font(FONT, "", 10)
        pdf.cell(0, 6, L("no_items_found"), ln=True, align=A)
        return pdf.output()

    groups: dict[str, list] = {}
    for item in items:
        groups.setdefault(item.category or "Uncategorized", []).append(item)
    ordered_groups = sorted(groups.items(), key=lambda kv: (kv[0] == "Uncategorized", kv[0]))

    widths = [110, 30, 30]
    headers = [L("h_item"), L("h_unit"), L("h_price")]

    for category, cat_items in ordered_groups:
        pdf.set_font(FONT, "B", 11)
        pdf.set_fill_color(15, 118, 110)
        pdf.set_text_color(255, 255, 255)
        pdf.cell(0, 7, L("uncategorized") if category == "Uncategorized" else L.n("category", category), ln=True, fill=True)

        pdf.set_font(FONT, "B", 9)
        pdf.set_fill_color(230, 230, 230)
        pdf.set_text_color(0, 0, 0)
        for w, h in zip(widths, headers):
            pdf.cell(w, 6, h, border=1, align="C" if h != headers[0] else A, fill=True)
        pdf.ln()

        pdf.set_font(FONT, "", 9)
        for item in sorted(cat_items, key=lambda i: i.name.lower()):
            pdf.cell(widths[0], 6, L.n("item", item.name), border=1)
            pdf.cell(widths[1], 6, L.unit(item.unit), border=1, align="C")
            pdf.cell(widths[2], 6, f"{item.price:.2f}", border=1, align="R")
            pdf.ln()
        pdf.ln(3)

    pdf.ln(3)
    pdf.set_font(FONT, "I", 9)
    pdf.cell(0, 6, L("disclaimer"), ln=True, align="C")
    pdf.set_font(FONT, "", 8)
    pdf.cell(
        0,
        5,
        L("generated", L.when(datetime.now())),
        ln=True,
        align="C",
    )

    return pdf.output()
