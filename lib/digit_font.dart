/// Font family that draws the plain digits 0-9 in a language's own script, or null
/// when the language writes them the same way. Each family holds only the ten
/// digits (see scripts/build_digit_fonts.py), so the theme lists it first with
/// Roboto behind it: text, parsing and typing stay plain 0-9, only the glyphs change.
String? digitFontFor(String languageCode) => const {
      'ar': 'DigitsArabic',
      'fa': 'DigitsPersian',
      'ps': 'DigitsPersian',
      'ur': 'DigitsPersian',
      'sd': 'DigitsPersian',
      'bn': 'DigitsBengali',
      'hi': 'DigitsDevanagari',
      'pa': 'DigitsGurmukhi',
    }[languageCode];
