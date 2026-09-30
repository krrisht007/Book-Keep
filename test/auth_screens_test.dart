
import 'package:bookkeeper_app/auth/login_screen.dart';
import 'package:bookkeeper_app/auth/signup_screen.dart';
import 'package:bookkeeper_app/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  void setSize(WidgetTester tester, Size logical) {
    tester.view.physicalSize = logical * 2;
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);
  }

  Future<void> show(WidgetTester tester, Widget screen) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: screen,
      ),
    );
    for (var i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  testWidgets('Login asks for both fields when submitted empty', (
    tester,
  ) async {
    setSize(tester, const Size(390, 844));
    await show(tester, const LoginScreen());
    await tester.tap(find.text('Sign In'));
    await tester.pump();
    expect(find.text('Required'), findsNWidgets(2));
  });

  testWidgets('Login password eye shows and hides the password', (
    tester,
  ) async {
    setSize(tester, const Size(390, 844));
    await show(tester, const LoginScreen());
    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pump();
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
  });

  testWidgets('Login keeps what you type', (tester) async {
    setSize(tester, const Size(390, 844));
    await show(tester, const LoginScreen());
    await tester.enterText(find.byType(TextFormField).first, 'krrish');
    await tester.pump();
    expect(find.text('krrish'), findsOneWidget);
  });

  testWidgets('Signup checks every field when submitted empty', (tester) async {
    setSize(tester, const Size(390, 844));
    await show(tester, const SignupScreen());
    await tester.ensureVisible(find.text('Create Account'));
    await tester.tap(find.text('Create Account'));
    await tester.pump();
    expect(find.text('Required'), findsNWidgets(3));
    expect(find.textContaining('digit number'), findsOneWidget);
  });

  testWidgets('Login fits portrait with no overflow', (tester) async {
    setSize(tester, const Size(360, 780));
    await show(tester, const LoginScreen());
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login Sign In is reachable in landscape without scrolling', (
    tester,
  ) async {
    setSize(tester, const Size(800, 360));
    await show(tester, const LoginScreen());
    expect(tester.takeException(), isNull);
    final bottom = tester.getBottomLeft(find.text('Sign In')).dy;
    expect(bottom, lessThan(360), reason: 'Sign In is below the fold');
  });

  testWidgets('Signup fits landscape and scrolls to its button', (
    tester,
  ) async {
    setSize(tester, const Size(800, 360));
    await show(tester, const SignupScreen());
    expect(tester.takeException(), isNull);
    await tester.ensureVisible(find.text('Create Account'));
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login and signup build in the dark theme', (tester) async {
    setSize(tester, const Size(390, 844));
    for (final screen in [const LoginScreen(), const SignupScreen()]) {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(brightness: Brightness.dark),
          home: screen,
        ),
      );
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      expect(tester.takeException(), isNull);
    }
  });
}
