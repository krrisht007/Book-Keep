import 'package:bookkeeper_app/date_locale.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting();
  });

  test('every app language gets a date locale; Sindhi borrows Urdu', () {
    for (final c in 'ar bn de en es fa fr hi id ja ko pa ps pt ru sw tr ur zh'.split(' ')) {
      expect(dateLocaleFor(c), c);
    }
    expect(dateLocaleFor('sd'), 'ur');
    expect(dateLocaleFor('xx'), 'en');
  });

  test('dates use the language\'s month names with Latin digits', () {
    final d = DateTime(2026, 10, 2);
    Intl.defaultLocale = 'en';
    expect(monthYear(d), 'October 2026');
    Intl.defaultLocale = 'ur';
    expect(monthYear(d), 'اکتوبر 2026');
    Intl.defaultLocale = 'ar';
    expect(monthYear(d), 'أكتوبر 2026');
    Intl.defaultLocale = 'bn';
    expect(monthYear(d), 'অক্টোবর 2026');
    Intl.defaultLocale = 'fa';
    expect(monthYear(d), 'اکتبر 2026');
    Intl.defaultLocale = 'en';
  });

  test('latinDigits leaves other text alone', () {
    expect(latinDigits('٠١٢٣٤٥٦٧٨٩ ۰۱۲۳۴۵۶۷۸۹ ০১২৩৪৫৬৭৮৯ abc 123'), '0123456789 0123456789 0123456789 abc 123');
  });
}
