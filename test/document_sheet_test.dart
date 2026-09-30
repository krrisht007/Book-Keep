import 'package:bookkeeper_app/l10n/gen/app_localizations.dart';
import 'package:bookkeeper_app/widgets/document_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const line = {
    'item_name': 'Araldite Epoxy',
    'quantity': 2.5,
    'unit_price': 180,
    'line_total': 450,
  };

  Future<void> open(
    WidgetTester t,
    void Function(BuildContext) show, {
    ThemeData? theme,
  }) async {
    await t.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        home: Scaffold(
          body: Builder(
            builder:
                (c) => TextButton(
                  onPressed: () => show(c),
                  child: const Text('open'),
                ),
          ),
        ),
      ),
    );
    await t.tap(find.text('open'));
    await t.pumpAndSettle();
  }

  testWidgets('partial bill: status, tiles, discount and line items', (
    t,
  ) async {
    await open(
      t,
      (c) => showDocumentSheet(
        c,
        title: 'Bill',
        amount: 1330,
        date: '2026-08-31',
        statusLabel: 'PARTIAL',
        statusColor: Colors.amber,
        paid: 400,
        discount: 50,
        lines: const [line],
      ),
    );
    expect(find.text('PARTIAL'), findsOneWidget);
    expect(find.text('Remaining'), findsOneWidget);
    expect(find.text('Rs 930'), findsOneWidget);
    expect(find.text('includes Rs 50 discount'), findsOneWidget);
    expect(find.text('- Rs 50'), findsOneWidget);
    expect(find.text('2.5 × Rs 180'), findsOneWidget);
  });

  testWidgets('no paid amount hides the tiles; empty lines and notes render', (
    t,
  ) async {
    await open(
      t,
      (c) => showDocumentSheet(
        c,
        title: 'Bill',
        amount: 500,
        date: '2026-08-31',
        statusLabel: 'VOIDED',
        statusColor: Colors.grey,
        lines: const [],
        notes: [(text: 'Voided: test', color: Colors.red)],
      ),
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
    );
    expect(find.text('Remaining'), findsNothing);
    expect(find.text('No items'), findsOneWidget);
    expect(find.text('Voided: test'), findsOneWidget);
  });
}
