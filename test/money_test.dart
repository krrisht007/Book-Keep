
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:bookkeeper_app/app_state.dart';
import 'package:bookkeeper_app/widgets/money.dart';

void main() {
  test('formatMoney: whole Rs by default, comma-grouped', () {
    expect(formatMoney(1234), 'Rs 1,234');
    expect(formatMoney(0), 'Rs 0');
  });

  test('formatMoney: decimals: 2 shows cents', () {
    expect(formatMoney(1234.5, decimals: 2), 'Rs 1,234.50');
  });

  test('formatMoney: follows the selected language', () {
    String f(String l, num v) {
      localeNotifier.value = Locale(l);
      return formatMoney(v);
    }

    addTearDown(() => localeNotifier.value = null);
    expect(f('ur', 1234), '1,234 روپے');
    expect(f('hi', 1234), 'रु 1,234');
    expect(f('ja', 1234), '1,234ルピー');
    expect(f('zh', -50), '-50卢比');
    expect(f('de', 1234), 'Rs 1,234');
    for (final l in localeLabel.keys) {
      expect(f(l, 5), contains('5'));
    }
  });
}
