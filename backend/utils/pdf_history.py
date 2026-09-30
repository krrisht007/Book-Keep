"""Price history and stock adjustment history of one item as a shareable PDF, in the
app's language and digits (see utils/pdf_font.py). Newest entry first."""
from datetime import datetime, timedelta

from utils.pdf_font import FONT, new_pdf
from utils.pdf_invoice import _draw_shop_logo
from utils.pdf_labels import Labels


def _q(v: float) -> str:
    return str(int(v)) if v == int(v) else f"{v:.2f}".rstrip("0")


def _signed(v: float, fmt) -> str:
    return "0" if v == 0 else f"{'+' if v > 0 else '-'}{fmt(abs(v))}"


def build_history_pdf(kind: str, item, rows, shop, lang=None, tz_minutes: int = 0) -> bytes:
    """kind is "price" or "stock"; rows are newest first. Times are stored in UTC and
    shown moved by tz_minutes, the viewer's offset, to match what the app shows."""
    shift = timedelta(minutes=tz_minutes)
    pdf = new_pdf(lang)
    L = Labels(lang)
    by = lambda r: r.created_by_name or r.created_by_email or "-"
    L.load_names([("shop", shop["shop_name"]), ("address", shop["shop_address"]), ("item", item.name)])
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
        pdf.cell(0, 5, L("phone", shop["shop_phone"]), ln=True, align="C")

    pdf.ln(2)
    pdf.set_font(FONT, "B", 14)
    pdf.cell(0, 8, L("ph_title" if kind == "price" else "sh_title"), ln=True, align="C")
    pdf.set_font(FONT, "B", 11)
    pdf.cell(0, 7, L.n("item", item.name), ln=True, align="C")
    pdf.ln(3)

    if not rows:
        pdf.set_font(FONT, "", 10)
        pdf.cell(0, 6, L("no_history"), ln=True, align=A)
        return pdf.output()

    if kind == "price":
        widths = [42, 36, 36, 36, 40]
        headers = [L("h_date"), L("h_price"), L("h_cost"), L("h_change"), L("h_by")]
    else:
        widths = [42, 28, 28, 32, 60]
        headers = [L("h_date"), L("h_prev"), L("h_new"), L("h_change"), L("h_by")]

    pdf.set_font(FONT, "B", 9)
    pdf.set_fill_color(15, 118, 110)
    pdf.set_text_color(255, 255, 255)
    for w, h in zip(widths, headers):
        pdf.cell(w, 7, h, border=1, align="C", fill=True)
    pdf.ln()
    pdf.set_text_color(0, 0, 0)
    pdf.set_font(FONT, "", 9)

    for i, r in enumerate(rows):
        if kind == "price":
            older = rows[i + 1].price if i + 1 < len(rows) else None
            cells = [
                L.when(r.changed_at + shift),
                f"{r.price:.2f}",
                "-" if r.cost_price is None else f"{r.cost_price:.2f}",
                "-" if older is None else _signed(r.price - older, lambda v: f"{v:.2f}"),
                by(r),
            ]
        else:
            cells = [
                L.when(r.created_at + shift),
                _q(r.previous_quantity),
                _q(r.new_quantity),
                _signed(r.new_quantity - r.previous_quantity, _q),
                by(r),
            ]
        for w, text, col in zip(widths, cells, range(5)):
            pdf.cell(w, 6, text, border=1, align="C" if col else A)
        pdf.ln()
        note = getattr(r, "note", None)
        if note:
            pdf.multi_cell(sum(widths), 5, f"{L('h_note')}: {note}", border=1, align=A, new_x="LMARGIN", new_y="NEXT")

    pdf.ln(4)
    pdf.set_font(FONT, "", 8)
    pdf.cell(0, 5, L("generated", L.when(datetime.utcnow() + shift)), ln=True, align="C")
    return pdf.output()
