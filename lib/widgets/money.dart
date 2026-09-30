import 'dart:ui' show PlatformDispatcher;

import 'package:intl/intl.dart';

import '../app_state.dart' show localeNotifier;

final _whole = NumberFormat('#,##0', 'en_US');
final _cents = NumberFormat('#,##0.00', 'en_US');

const _prefix = {'hi': 'रु ', 'pa': 'ਰੁ '};

const _rtl = {'ar', 'fa', 'ps', 'sd', 'ur'};

const _suffix = {
  'ar': ' روبية',
  'bn': ' রুপি',
  'fa': ' روپیه',
  'ja': 'ルピー',
  'ko': '루피',
  'ps': ' روپۍ',
  'ru': ' руп.',
  'sd': ' روپيا',
  'ur': ' روپے',
  'zh': '卢比',
};

String formatMoney(num amount, {int decimals = 0}) {
  final lang =
      localeNotifier.value?.languageCode ??
      PlatformDispatcher.instance.locale.languageCode;
  final digits = (decimals == 2 ? _cents : _whole).format(amount.abs());
  final minus = _rtl.contains(lang) ? '‎-' : '-';
  final sign = amount < 0 && digits.contains(RegExp('[1-9]')) ? minus : '';
  final suffix = _suffix[lang];
  if (suffix != null) return '$sign$digits$suffix';
  return '$sign${_prefix[lang] ?? 'Rs '}$digits';
}
