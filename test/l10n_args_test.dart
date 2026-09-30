import 'package:bookkeeper_app/l10n/gen/app_localizations_en.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final en = AppLocalizationsEn();

  // gen-l10n orders arguments alphabetically by placeholder name; the call
  // sites in the screens rely on exactly this order.
  test('values land in the right place', () {
    expect(
      en.gstItemLine('TAX', 'TAXABLE', 'TOTAL'),
      'Taxable TAXABLE  ·  GST TAX  ·  Total TOTAL',
    );
    expect(
      en.rpBreakdown('COGS', 'EXP', 'REV'),
      'Revenue: REV  •  COGS: COGS  •  Expenses: EXP',
    );
    expect(
      en.qPaymentCollected('AMT', 'NAME'),
      'Payment collected: AMT from NAME',
    );
    expect(en.qPaymentUpdate('AMT'), 'Payment update: AMT');
    expect(en.gstAmount('AMT'), 'GST AMT');
    expect(
      en.msgReminderGentle('AMT', 'CUST', 'SHOP'),
      'Hello CUST, gentle greeting from SHOP! Your total balance due is AMT. Thank you!',
    );
    expect(
      en.msgReminderUrgent('AMT', 'CUST', 'SHOP'),
      'URGENT NOTICE: Dear CUST, your outstanding payment of AMT at SHOP is pending. Please settle immediately.',
    );
    expect(
      en.msgInvoiceShare('ITEMS', 'SHOP', 'STATUS', 'TOTAL'),
      'Invoice from SHOP\nTotal: TOTAL\nItems: ITEMS\nStatus: STATUS',
    );
    expect(
      en.msgReorder('LINES', 'SHOP', 'SUPP'),
      'Hello SUPP, this is SHOP. We would like to place an order for:\nLINES\n\nPlease confirm availability and price. Thank you.',
    );
  });
}
