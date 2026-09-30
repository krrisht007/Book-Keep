"""Builds assets/fonts/digits/*.ttf: for each script a font that holds ONLY the ten
digits, mapped onto the plain characters 0-9. Listed first in the theme (see
lib/digit_font.dart) with Roboto behind it, every Latin digit the app draws shows
in the language's own digits, while the text stays plain 0-9 for parsing, search
and typing. Line metrics are copied from Roboto so lines keep their height.

Sources are the SIL OFL Noto fonts in backend/fonts (licence in assets/fonts/digits/OFL.txt).
Run from the repo root: backend/venv/Scripts/python.exe scripts/build_digit_fonts.py
"""
import os
import shutil

from fontTools import subset
from fontTools.pens.recordingPen import DecomposingRecordingPen
from fontTools.pens.transformPen import TransformPen
from fontTools.pens.ttGlyphPen import TTGlyphPen
from fontTools.ttLib import TTFont

SRC = "backend/fonts"
OUT = "assets/fonts/digits"
ROBOTO = "C:/flutter/flutter/bin/cache/artifacts/material_fonts/Roboto-Regular.ttf"

# family -> (source font, first digit's code point)
FAMILIES = {
    "DigitsArabic": ("NotoNaskhArabic", 0x0660),
    "DigitsPersian": ("NotoNaskhArabic", 0x06F0),
    "DigitsBengali": ("NotoSansBengali", 0x09E6),
    "DigitsDevanagari": ("NotoSansDevanagari", 0x0966),
    "DigitsGurmukhi": ("NotoSansGurmukhi", 0x0A66),
}

WITH_NUMBERS = "+-.,:/%() "
ROBOTO_FILES = {
    "Regular": "C:/flutter/flutter/bin/cache/artifacts/material_fonts/Roboto-Regular.ttf",
    "Bold": "C:/flutter/flutter/bin/cache/artifacts/material_fonts/Roboto-Bold.ttf",
}

roboto = TTFont(ROBOTO)
r_upm = roboto["head"].unitsPerEm
r_asc, r_desc = roboto["hhea"].ascent, roboto["hhea"].descent


def build(family: str, src: str, base: int, weight: str) -> None:
    font = TTFont(f"{SRC}/{src}-{weight}.ttf")
    assert "fvar" not in font, f"{src}-{weight} is a variable font"
    opts = subset.Options()
    opts.layout_features = []
    opts.notdef_outline = True
    opts.name_IDs = []
    sub = subset.Subsetter(opts)
    sub.populate(unicodes=range(base, base + 10))
    sub.subset(font)
    cmap = font.getBestCmap()
    glyphs = [cmap[base + i] for i in range(10)]
    # Signs, separators, brackets and the space that appear inside numbers are copied
    # from Roboto, so a number is drawn by this one font. Left to font fallback, the
    # character right after a direction mark came out as an empty box.
    rf = TTFont(ROBOTO_FILES[weight])
    rcm, rgs = rf.getBestCmap(), rf.getGlyphSet()
    scale = font["head"].unitsPerEm / rf["head"].unitsPerEm
    extra = {ord(ch): f"x{ord(ch):04X}" for ch in WITH_NUMBERS}
    font.setGlyphOrder(font.getGlyphOrder() + list(extra.values()))
    font["glyf"].glyphOrder = font.getGlyphOrder()
    for ch in WITH_NUMBERS:
        name = extra[ord(ch)]
        flat = DecomposingRecordingPen(rgs)
        rgs[rcm[ord(ch)]].draw(flat)
        pen = TTGlyphPen(None)
        flat.replay(TransformPen(pen, (scale, 0, 0, scale, 0, 0)))
        glyph = pen.glyph()
        font["glyf"][name] = glyph
        font["hmtx"][name] = (round(rf["hmtx"][rcm[ord(ch)]][0] * scale), 0)
    for table in font["cmap"].tables:
        table.cmap = {0x30 + i: g for i, g in enumerate(glyphs)}
        table.cmap.update(extra)

    upm = font["head"].unitsPerEm
    asc, desc = round(r_asc * upm / r_upm), round(r_desc * upm / r_upm)
    font["hhea"].ascent, font["hhea"].descent, font["hhea"].lineGap = asc, desc, 0
    os2 = font["OS/2"]
    os2.sTypoAscender, os2.sTypoDescender, os2.sTypoLineGap = asc, desc, 0
    os2.usWinAscent, os2.usWinDescent = asc, -desc

    name = font["name"]
    name.names = []
    for nid, text in {
        0: "Digits derived from Noto fonts, SIL Open Font License 1.1",
        1: family, 2: weight, 4: f"{family} {weight}", 6: f"{family}-{weight}",
    }.items():
        name.setName(text, nid, 3, 1, 0x409)
    font.save(f"{OUT}/{family}-{weight}.ttf")


os.makedirs(OUT, exist_ok=True)
for family, (src, base) in FAMILIES.items():
    for weight in ("Regular", "Bold"):
        build(family, src, base, weight)
shutil.copy(f"{SRC}/OFL.txt", f"{OUT}/OFL.txt")
print("built", len(FAMILIES) * 2, "fonts into", OUT)
