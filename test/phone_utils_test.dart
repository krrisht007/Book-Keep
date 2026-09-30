
import 'package:flutter_test/flutter_test.dart';
import 'package:bookkeeper_app/phone_utils.dart';

void main() {
  test('phoneDigits strips a leading +92/92/0, caps at 10 digits', () {
    expect(phoneDigits('+92 30123 45678'), '3012345678');
    expect(phoneDigits('923012345678'), '3012345678');
    expect(phoneDigits('03012345678'), '3012345678');
    expect(phoneDigits('3012345678'), '3012345678');
    expect(phoneDigits(''), '');
  });

  test('formatPhoneForSave prefixes with +92, empty stays empty', () {
    expect(formatPhoneForSave('3012345678'), '+923012345678');
    expect(formatPhoneForSave(''), '');
  });

  test('phoneFieldPrefix is +92, 10 local digits', () {
    expect(phoneFieldPrefix, '+92');
    expect(phoneLocalDigits, 10);
  });
}
