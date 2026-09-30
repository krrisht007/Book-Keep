import 'package:flutter/material.dart';

final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(
  ThemeMode.system,
);

final ValueNotifier<Locale?> localeNotifier = ValueNotifier(null);

const Map<String, String> localeLabel = {
  'ar': 'العربية',
  'bn': 'বাংলা',
  'de': 'Deutsch',
  'en': 'English',
  'es': 'Español',
  'fa': 'فارسی',
  'fr': 'Français',
  'hi': 'हिन्दी',
  'id': 'Bahasa Indonesia',
  'ja': '日本語',
  'ko': '한국어',
  'pa': 'ਪੰਜਾਬੀ',
  'ps': 'پښتو',
  'pt': 'Português',
  'ru': 'Русский',
  'sd': 'سنڌي',
  'sw': 'Kiswahili',
  'tr': 'Türkçe',
  'ur': 'اردو',
  'zh': '中文',
};

final ValueNotifier<int?> requestedTabNotifier = ValueNotifier(null);

const Map<String, ThemeMode> themeModeByName = {
  'light': ThemeMode.light,
  'dark': ThemeMode.dark,
  'system': ThemeMode.system,
};
