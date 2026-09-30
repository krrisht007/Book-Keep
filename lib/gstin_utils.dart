final RegExp _strnPattern = RegExp(r'^\d{13}$');

String? validateStrn(String? value) {
  final v = (value ?? '').trim();
  if (v.isEmpty) return null;
  if (!_strnPattern.hasMatch(v)) {
    return 'Invalid STRN — expected 13 digits, e.g. 1234567890123';
  }
  return null;
}

final RegExp _jazzcashPattern = RegExp(r'^(0?3\d{9})$');

String? validateJazzCashNumber(String? value) {
  final v = (value ?? '').replaceAll(RegExp(r'[\s-]'), '');
  if (v.isEmpty) return null;
  if (!_jazzcashPattern.hasMatch(v)) {
    return 'Invalid JazzCash number — expected e.g. 03001234567';
  }
  return null;
}
