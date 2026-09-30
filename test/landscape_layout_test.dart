
import 'dart:convert';

import 'package:bookkeeper_app/add_bill_screen.dart';
import 'package:bookkeeper_app/add_purchase_screen.dart';
import 'package:bookkeeper_app/collect_payment.dart';
import 'package:bookkeeper_app/customer_detail_screen.dart';
import 'package:bookkeeper_app/customer_list_screen.dart';
import 'package:bookkeeper_app/home_screen.dart';
import 'package:bookkeeper_app/items_screen.dart';
import 'package:bookkeeper_app/l10n/gen/app_localizations.dart';
import 'package:bookkeeper_app/lock_screen.dart';
import 'package:bookkeeper_app/payment_reminder.dart';
import 'package:bookkeeper_app/supplier_detail_screen.dart';
import 'package:bookkeeper_app/supplier_list_screen.dart';
import 'package:bookkeeper_app/update_stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() {
    databaseFactory = databaseFactoryFfi;
    SharedPreferences.setMockInitialValues({});
  });

  final items = List.generate(
    25,
    (i) => {
      'id': 'i$i',
      'name': 'Item number $i',
      'unit': 'piece',
      'price': 100.0 + i,
      'category': i.isEven ? 'Tools' : 'Plumbing',
      'stock_quantity': i == 3 ? 0.0 : 10.0 + i,
      'low_stock_threshold': 5.0,
    },
  );
  final customers = List.generate(
    8,
    (i) => {
      'id': 'c$i',
      'name': 'Customer $i',
      'phone': '0300123456$i',
      'credit_limit': 50000.0,
    },
  );
  final suppliers = List.generate(
    6,
    (i) => {'id': 's$i', 'name': 'Supplier $i', 'phone': '0311123456$i'},
  );

  final server = MockClient((req) async {
    final path = req.url.path;
    if (path == '/items') return http.Response(jsonEncode(items), 200);
    if (path == '/customers') return http.Response(jsonEncode(customers), 200);
    if (path == '/suppliers') return http.Response(jsonEncode(suppliers), 200);
    if (path == '/reports/cash-today') {
      return http.Response(jsonEncode({'expected_cash': 1500.0}), 200);
    }
    return http.Response('[]', 200);
  });

  Widget app(Widget home) => MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: home,
  );

  void setSize(WidgetTester tester, Size logical, {double keyboard = 0}) {
    tester.view.physicalSize = logical * 2;
    tester.view.devicePixelRatio = 2.0;
    tester.view.viewInsets = FakeViewPadding(bottom: keyboard * 2);
    addTearDown(tester.view.reset);
    addTearDown(tester.view.resetViewInsets);
  }

  Future<void> settle(WidgetTester tester) async {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 500)),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 400));
    }
  }

  final tabs = <String, Widget Function()>{
    'Items': () => const ItemsScreen(),
    'Customers': () => const CustomerListScreen(),
    'Suppliers': () => const SupplierListScreen(),
  };
  for (final entry in tabs.entries) {
    for (final landscape in [true, false]) {
      final label = landscape ? 'landscape' : 'portrait';
      testWidgets('${entry.key} tab has no overflow in $label', (tester) async {
        setSize(
          tester,
          landscape ? const Size(800, 300) : const Size(360, 800),
        );
        await http.runWithClient(() async {
          await tester.pumpWidget(
            app(
              Scaffold(
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: SizedBox(),
                ),
                body: entry.value(),
                bottomNavigationBar: const SizedBox(height: 100),
              ),
            ),
          );
          await settle(tester);
          expect(tester.takeException(), isNull, reason: 'initial layout');

          await tester.drag(
            find.byType(Scrollable).last,
            const Offset(0, -300),
          );
          await tester.pump(const Duration(milliseconds: 400));
          await tester.drag(find.byType(Scrollable).last, const Offset(0, 300));
          await tester.pump(const Duration(milliseconds: 400));
          expect(tester.takeException(), isNull, reason: 'after scrolling');
        }, () => server);
      });
    }
  }

  final full = <String, Widget Function()>{
    'Add Bill': () => const AddBillScreen(customerId: 'c1'),
    'Add Purchase': () => const AddPurchaseScreen(supplierId: 's1'),
    'PIN lock': () => LockScreen(onUnlocked: () {}),
  };
  for (final entry in full.entries) {
    testWidgets('${entry.key} has no overflow in landscape', (tester) async {
      setSize(tester, const Size(800, 360));
      await http.runWithClient(() async {
        await tester.pumpWidget(app(entry.value()));
        await settle(tester);
        expect(tester.takeException(), isNull);
      }, () => server);
    });
  }

  final sheets = <String, void Function(BuildContext)>{
    'Payment reminder sheet':
        (c) => showPaymentReminderSheet(
          context: c,
          customerName: 'Customer One',
          phone: '03001234567',
          outstanding: 5000,
        ),
    'Collect payment sheet':
        (c) => showCollectPaymentSheet(
          context: c,
          customerId: 'c1',
          customerName: 'Customer One',
          outstanding: 5000,
        ),
  };
  for (final entry in sheets.entries) {
    for (final keyboard in [0.0, 150.0]) {
      testWidgets(
        '${entry.key} fits in landscape (keyboard ${keyboard > 0 ? 'up' : 'down'})',
        (tester) async {
          setSize(tester, const Size(800, 360), keyboard: keyboard);
          await http.runWithClient(() async {
            late BuildContext ctx;
            await tester.pumpWidget(
              app(
                Scaffold(
                  body: Builder(
                    builder: (c) {
                      ctx = c;
                      return const SizedBox.expand();
                    },
                  ),
                ),
              ),
            );
            entry.value(ctx);
            for (var i = 0; i < 5; i++) {
              await tester.pump(const Duration(milliseconds: 300));
            }
            expect(tester.takeException(), isNull);
          }, () => server);
        },
      );
    }
  }

  final roomy = <String, Widget Function()>{
    'Customer detail':
        () => const CustomerDetailScreen(
          customerId: 'c1',
          customerName: 'Customer One',
        ),
    'Supplier detail':
        () => const SupplierDetailScreen(
          supplierId: 's1',
          supplierName: 'Supplier One',
        ),
    'Update stock': () => const UpdateStockScreen(),
  };
  for (final entry in roomy.entries) {
    testWidgets('${entry.key} keeps room for its list in landscape', (
      tester,
    ) async {
      setSize(tester, const Size(800, 360));
      await http.runWithClient(() async {
        await tester.pumpWidget(app(entry.value()));
        await settle(tester);
        var tallest = 0.0;
        for (final e in find.byType(Scrollable).evaluate()) {
          if ((e.widget as Scrollable).axis != Axis.vertical) continue;
          final h = (e.renderObject as RenderBox).size.height;
          if (h > tallest) tallest = h;
        }
        expect(tallest, greaterThan(150), reason: 'list area is squeezed');
      }, () => server);
    });
  }

  testWidgets('Home dashboard scrolls up in landscape', (tester) async {
    setSize(tester, const Size(800, 360));
    final homeServer = MockClient((req) async {
      if (req.url.path == '/reports/cash-today') {
        return http.Response(jsonEncode({'expected_cash': 1500.0}), 200);
      }
      return http.Response('[]', 200);
    });
    final handler = FlutterError.onError;
    FlutterError.onError = (details) {
      final text = details.exceptionAsString();
      if (text.contains('overflowed by') && text.contains('on the right')) {
        return;
      }
      handler?.call(details);
    };
    addTearDown(() => FlutterError.onError = handler);
    await http.runWithClient(() async {
      await tester.pumpWidget(
        app(
          Scaffold(
            body: HomeScreen(
              onGoToCustomers: () {},
              onGoToItems: () {},
              onGoToReports: () {},
            ),
          ),
        ),
      );
      await settle(tester);

      final money = find.text('Money').first;
      final before = tester.getTopLeft(money).dy;
      await tester.drag(money, const Offset(0, -250));
      for (var i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 300));
      }
      final after =
          find.text('Money').evaluate().isEmpty
              ? double.negativeInfinity
              : tester.getTopLeft(find.text('Money').first).dy;
      expect(
        after,
        lessThan(before - 50),
        reason: 'the hero should scroll away',
      );
    }, () => homeServer);
  });
}
