import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SindhiFallbackDelegate<T> extends LocalizationsDelegate<T> {
  final Future<T> Function(Locale) _load;

  const SindhiFallbackDelegate(this._load);

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'sd';

  @override
  Future<T> load(Locale locale) => _load(const Locale('ur'));

  @override
  bool shouldReload(SindhiFallbackDelegate<T> old) => false;
}
