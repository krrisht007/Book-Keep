import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart' show CupertinoLocalizations;
import 'package:flutter/material.dart';
import 'widgets/app_style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'date_locale.dart';
import 'digit_font.dart';
import 'auth/auth_gate.dart';
import 'config.dart';
import 'app_state.dart';
import 'local_db.dart';
import 'native_theme.dart';
import 'l10n/gen/app_localizations.dart';
import 'l10n/sindhi_fallback_localizations.dart';
import 'gstin_utils.dart';
import 'name_translator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint('[FCM] Background message: ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    AppConfig.firebaseReady = true;

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    WidgetsBinding.instance.platformDispatcher.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } catch (e) {
    debugPrint('[FCM] Firebase init skipped: $e');
  }

  final prefs = await SharedPreferences.getInstance();
  AppConfig.baseUrl = prefs.getString('base_url') ?? AppConfig.defaultBaseUrl;
  final cachedJazzcash = prefs.getString('upi_id') ?? '';
  AppConfig.jazzcashNumber =
      validateJazzCashNumber(cachedJazzcash) == null ? cachedJazzcash : '';
  AppConfig.shopName = prefs.getString('shop_name') ?? 'Hardware Store';
  themeModeNotifier.value =
      themeModeByName[prefs.getString('theme_mode')] ?? ThemeMode.system;
  unawaited(syncNativeNightMode(themeModeNotifier.value));
  final localeCode = prefs.getString('locale_code');
  localeNotifier.value = localeCode == null ? null : Locale(localeCode);
  await LocalDb.instance.database;
  await initializeDateFormatting();
  runApp(const BookKeeperApp());
}

class _UnfocusOnPush extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      FocusManager.instance.primaryFocus?.unfocus();
}

final _unfocusOnPush = _UnfocusOnPush();

class BookKeeperApp extends StatelessWidget {
  const BookKeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    final highContrast = MediaQuery.highContrastOf(context);
    Color darkenForContrast(Color c) =>
        highContrast ? Color.lerp(c, Colors.black, 0.25)! : c;

    final primary = darkenForContrast(const Color(0xFFFF7E45));
    final secondary = darkenForContrast(const Color(0xFFC2410C));
    final darkAppBarColor = darkenForContrast(const Color(0xFF8A3010));
    final lightPrimary = darkenForContrast(const Color(0xFF0F766E));
    final lightSecondary = darkenForContrast(const Color(0xFFF59E0B));

    const cardRadius = 20.0;
    const fieldRadius = 16.0;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return ValueListenableBuilder<Locale?>(
          valueListenable: localeNotifier,
          builder: (context, locale, _) {
            final code =
                locale?.languageCode ??
                WidgetsBinding.instance.platformDispatcher.locale.languageCode;
            Intl.defaultLocale = dateLocaleFor(code);
            final digitFont = digitFontFor(code);
            final digitFallback = digitFont == null ? null : const ['Roboto'];
            return MaterialApp(
              navigatorKey: navigatorKey,
              navigatorObservers: [_unfocusOnPush],
              title: 'Hardware Store Book Keeper',
              debugShowCheckedModeBanner: false,
              locale: locale,
              builder:
                  (context, child) => NameScope(
                    notifier: NameTranslator.instance,
                    child: child!,
                  ),
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
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: digitFont,
                fontFamilyFallback: digitFallback,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: lightPrimary,
                  primary: lightPrimary,
                  secondary: lightSecondary,
                  brightness: Brightness.light,
                ),
                scaffoldBackgroundColor: const Color(0xFFFAF7F1),
                appBarTheme: AppBarTheme(
                  backgroundColor: lightPrimary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightPrimary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                ),
                cardTheme: const CardThemeData(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(cardRadius)),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.black.withValues(alpha: 0.04),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fieldRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
                chipTheme: ChipThemeData(
                  shape: const StadiumBorder(),
                  selectedColor: lightPrimary,
                  backgroundColor: Colors.black.withValues(alpha: 0.05),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                snackBarTheme: appSnackBarTheme(dark: false),
                dialogTheme: appDialogTheme(dark: false),
                bottomSheetTheme: appBottomSheetTheme(dark: false),
                popupMenuTheme: PopupMenuThemeData(
                  color: Colors.white,
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                fontFamily: digitFont,
                fontFamilyFallback: digitFallback,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: primary,
                  primary: primary,
                  secondary: secondary,
                  brightness: Brightness.dark,
                ),
                scaffoldBackgroundColor: const Color(0xFF1B1512),
                appBarTheme: AppBarTheme(
                  backgroundColor: darkAppBarColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                ),
                cardTheme: const CardThemeData(
                  elevation: 0,
                  color: Color(0xFF261D18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(cardRadius)),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.white.withValues(alpha: 0.06),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(fieldRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
                chipTheme: ChipThemeData(
                  shape: const StadiumBorder(),
                  selectedColor: primary,
                  backgroundColor: Colors.white.withValues(alpha: 0.08),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                snackBarTheme: appSnackBarTheme(dark: true),
                dialogTheme: appDialogTheme(dark: true),
                bottomSheetTheme: appBottomSheetTheme(dark: true),
                popupMenuTheme: PopupMenuThemeData(
                  color: const Color(0xFF261D18),
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              themeMode: mode,
              home: const AuthGate(),
            );
          },
        );
      },
    );
  }
}
