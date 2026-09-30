import 'package:bookkeeper_app/ask_voice.dart';
import 'package:bookkeeper_app/l10n/gen/app_localizations.dart';
import 'package:bookkeeper_app/l10n/sindhi_fallback_localizations.dart';
import 'package:bookkeeper_app/widgets/voice_settings_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'picking voice, pace and tone in the sheet changes the settings',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      final voice = AskVoice();
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder:
                (context) => Scaffold(
                  body: TextButton(
                    onPressed: () => showVoiceSettingsSheet(context, voice),
                    child: const Text('open'),
                  ),
                ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      expect(voice.settingsKey, 'Leda|normal|warm');
      expect(find.byIcon(Icons.female), findsNWidgets(5));
      expect(find.byIcon(Icons.male), findsNWidgets(4));

      await tester.tap(find.text('Puck'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Faster'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cheerful'));
      await tester.pumpAndSettle();
      expect(voice.settingsKey, 'Puck|faster|cheerful');

      final relaunched = AskVoice();
      await relaunched.loadSettings();
      expect(relaunched.settingsKey, 'Puck|faster|cheerful');
    },
  );
  testWidgets('fits a small screen in every language without overflow', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final previous = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains(
        'is not supported by all of its localization delegates',
      )) {
        return;
      }
      previous?.call(details);
    };
    addTearDown(() => FlutterError.onError = previous);

    for (final locale in AppLocalizations.supportedLocales) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
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
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder:
                (context) => Scaffold(
                  body: TextButton(
                    onPressed:
                        () => showVoiceSettingsSheet(context, AskVoice()),
                    child: const Text('open'),
                  ),
                ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.byType(SegmentedButton<String>), findsOneWidget);
      expect(find.byType(ChoiceChip), findsNWidgets(12), reason: '$locale');
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();
    }
  });
}
