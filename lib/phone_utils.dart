import 'package:flutter/services.dart';

const String phoneFieldPrefix = '+92';

const int phoneLocalDigits = 10;

String phoneDigits(String raw) {
  var d = raw.replaceAll(RegExp(r'[^0-9]'), '');
  if (d.startsWith('92')) {
    d = d.substring(2);
  } else if (d.startsWith('0')) {
    d = d.substring(1);
  }
  if (d.length > phoneLocalDigits) d = d.substring(0, phoneLocalDigits);
  return d;
}

String formatPhoneForSave(String raw) {
  final d = phoneDigits(raw);
  return d.isEmpty ? '' : '$phoneFieldPrefix$d';
}

class PhoneDigitsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = phoneDigits(newValue.text);
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
