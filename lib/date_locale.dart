import 'package:intl/intl.dart';

const _sameMonthNamesAs = {'sd': 'ur'};

/// The intl locale to format dates in for an app language. Sindhi has no intl
/// data, so it borrows Urdu's (same script); anything unknown falls back to English.
String dateLocaleFor(String languageCode) {
  final code = _sameMonthNamesAs[languageCode] ?? languageCode;
  try {
    return DateFormat.localeExists(code) ? code : 'en';
  } catch (_) {
    return 'en';
  }
}

/// Arabic, Persian, Pashto and Bengali dates come out in their own digits;
/// money is always written with Latin digits, so dates match it.
String latinDigits(String text) =>
    text.replaceAllMapped(RegExp('[٠-٩۰-۹০-৯]'), (m) {
      final c = m[0]!.codeUnitAt(0);
      final zero = c >= 0x09E6 ? 0x09E6 : (c >= 0x06F0 ? 0x06F0 : 0x0660);
      return String.fromCharCode(48 + c - zero);
    });

String monthYear(DateTime d) => latinDigits(DateFormat.yMMMM().format(d));

String shortMonth(DateTime d) => latinDigits(DateFormat.MMM().format(d));

String clockTime(DateTime d) => latinDigits(DateFormat.jm().format(d));
