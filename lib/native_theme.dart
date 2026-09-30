import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> syncNativeNightMode(ThemeMode mode) async {
  const channel = MethodChannel('bookkeeper/save');
  final name = switch (mode) {
    ThemeMode.light => 'light',
    ThemeMode.dark => 'dark',
    ThemeMode.system => 'system',
  };
  try {
    await channel.invokeMethod('setNightMode', {'mode': name});
  } catch (_) {}
}
