"""PDF setup shared by the invoice, statement and rate-card PDFs.

fpdf2's built-in fonts only cover Latin-1, so any Urdu, Hindi, Bengali... name
made PDF generation raise. This registers the Noto fonts in backend/fonts (SIL
Open Font License, see fonts/OFL.txt) as one main font plus per-script
fallbacks, with text shaping on so Arabic-script and Indic letters join and
reorder correctly. Chinese, Japanese and Korean use trimmed Noto Sans SC/JP/KR
files (national standard character sets only: GB2312, JIS X 0208, KS X 1001;
rarer characters print as an empty box), added only
for a PDF in a CJK language (its own font first, then the other two so a
Korean name inside a Chinese PDF still shows), so other PDFs stay fast.
"""
import os
import re

from fpdf import FPDF

FONT_DIR = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "fonts")
FONT = "NotoSans"
_FALLBACKS = ["NotoNaskhArabic", "NotoSansDevanagari", "NotoSansBengali", "NotoSansGurmukhi"]
_CJK = {"zh": "NotoSansSC", "ja": "NotoSansJP", "ko": "NotoSansKR"}


# Digits in the language's own script. The text stays plain 0-9 everywhere else
# (parsing, names, the app); only what is printed on the page changes. Languages
# not listed write 0-9 as is. The matching glyphs come from the Noto fallbacks.
_DIGITS = {
    "ar": "٠١٢٣٤٥٦٧٨٩",
    "fa": "۰۱۲۳۴۵۶۷۸۹",
    "ps": "۰۱۲۳۴۵۶۷۸۹",
    "ur": "۰۱۲۳۴۵۶۷۸۹",
    "sd": "۰۱۲۳۴۵۶۷۸۹",
    "bn": "০১২৩৪৫৬৭৮৯",
    "hi": "०१२३४५६७८९",
    "pa": "੦੧੨੩੪੫੬੭੮੯",
}
_TABLES = {code: str.maketrans("0123456789", digits) for code, digits in _DIGITS.items()}
_KEEP_PLUS_NUMBER = re.compile(r"(\+\d{1,3}[ \-]\d[\d \-]*)|(\d)")


class _UnicodePdf(FPDF):
    digits: dict | None = None

    def normalize_text(self, text):
        text = super().normalize_text(text)
        if not self.digits:
            return text
        # A "+92 301..." phone number keeps plain digits: with the language's own
        # digits the "+" jumps to the wrong end in right-to-left text.
        return _KEEP_PLUS_NUMBER.sub(lambda m: m.group(1) or m.group(2).translate(self.digits), text)

    """Drawing a fragment in a fallback font leaves the library's current font
    on that fallback (set_font then skips the reset because the family name is
    unchanged), so the next Latin-only cell lost its letters. Put it back."""

    def _reset_font(self):
        font = self.fonts.get(self.font_family + self.font_style)
        if font is not None and self.current_font is not font:
            self.current_font = font
            self.current_font_is_set_on_page = False

    def cell(self, *args, **kwargs):
        try:
            return super().cell(*args, **kwargs)
        finally:
            self._reset_font()

    def multi_cell(self, *args, **kwargs):
        try:
            return super().multi_cell(*args, **kwargs)
        finally:
            self._reset_font()


def new_pdf(lang: str | None = None) -> FPDF:
    pdf = _UnicodePdf()
    pdf.digits = _TABLES.get((lang or "en").strip().lower()[:2])
    cjk = _CJK.get((lang or "en").strip().lower()[:2])
    fallbacks = [*_FALLBACKS, cjk, *(f for f in _CJK.values() if f != cjk)] if cjk else _FALLBACKS
    for family in [FONT, *fallbacks]:
        regular = os.path.join(FONT_DIR, f"{family}-Regular.ttf")
        pdf.add_font(family, "", regular)
        pdf.add_font(family, "B", os.path.join(FONT_DIR, f"{family}-Bold.ttf"))
        pdf.add_font(family, "I", regular)
    pdf.set_fallback_fonts(fallbacks)
    pdf.set_text_shaping(True)
    return pdf
