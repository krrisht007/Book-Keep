import 'package:barcode_widget/barcode_widget.dart';
import 'package:bookkeeper_app/jazzcash_qr_card.dart';
import 'package:bookkeeper_app/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('QR follows the number as it changes', (tester) async {
    final ctrl = TextEditingController();
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                JazzCashQrSuffix(controller: ctrl, shopName: () => 'Shop'),
                JazzCashStatus(controller: ctrl),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(BarcodeWidget), findsNothing);

    ctrl.text = '0300123';
    await tester.pumpAndSettle();
    expect(find.byType(BarcodeWidget), findsNothing);
    expect(find.text('Check the number'), findsOneWidget);

    ctrl.text = '0300 1234567';
    await tester.pumpAndSettle();
    expect(
      String.fromCharCodes(
        tester.widget<BarcodeWidget>(find.byType(BarcodeWidget)).data
            as List<int>,
      ),
      '03001234567',
    );
    expect(
      find.text('Looks good'),
      findsNothing,
    );

    ctrl.text = '03211234567';
    await tester.pumpAndSettle();
    expect(
      String.fromCharCodes(
        tester.widget<BarcodeWidget>(find.byType(BarcodeWidget)).data
            as List<int>,
      ),
      '03211234567',
    );
  });

  test('cleanJazzCashNumber strips spaces and rejects bad numbers', () {
    expect(cleanJazzCashNumber('0300-123 4567'), '03001234567');
    expect(cleanJazzCashNumber(''), isNull);
    expect(cleanJazzCashNumber('12345'), isNull);
  });
}
