import 'dart:convert';
import 'dart:io';

import 'package:bookkeeper_app/app_state.dart';
import 'package:bookkeeper_app/l10n/l10n.dart';
import 'package:bookkeeper_app/l10n/sindhi_fallback_localizations.dart';
import 'package:bookkeeper_app/widgets/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every language has every English key', () {
    Set<String> keys(String code) =>
        (jsonDecode(File('lib/l10n/app_$code.arb').readAsStringSync())
                as Map<String, dynamic>)
            .keys
            .where((k) => !k.startsWith('@'))
            .toSet();
    final english = keys('en');
    for (final code in localeLabel.keys) {
      expect(english.difference(keys(code)), isEmpty, reason: code);
    }
  });

  testWidgets('shared widgets follow the selected language', (tester) async {
    for (final code in localeLabel.keys.where((c) => c != 'en')) {
      await tester.pumpWidget(
        MaterialApp(
          locale: Locale(code),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [
            AppLocalizations.delegate,
            SindhiFallbackDelegate<MaterialLocalizations>(
              GlobalMaterialLocalizations.delegate.load,
            ),
            SindhiFallbackDelegate<CupertinoLocalizations>(
              GlobalCupertinoLocalizations.delegate.load,
            ),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(body: errorRetry('x', () {})),
        ),
      );
      tester.takeException();
      expect(find.text('Retry'), findsNothing, reason: code);
    }
  });
}
