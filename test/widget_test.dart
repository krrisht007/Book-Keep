
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:bookkeeper_app/main.dart';

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() => databaseFactory = databaseFactoryFfi);

  testWidgets('App builds and shows the main navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const BookKeeperApp());

    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    for (final label in const [
      'Home',
      'Customers',
      'Items',
      'Suppliers',
      'Reports',
      'Settings',
    ]) {
      expect(find.text(label), findsWidgets);
    }

    await tester.pump(const Duration(milliseconds: 2500));
  });
}
