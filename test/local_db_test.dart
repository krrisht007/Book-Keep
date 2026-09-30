
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:bookkeeper_app/local_db.dart';

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() => databaseFactory = databaseFactoryFfi);

  test('upsertCustomers drops customers no longer in the server list',
      () async {
    await LocalDb.instance.upsertCustomers([
      {'id': 'c1', 'name': 'Alice', 'phone': '1', 'credit_limit': 0.0},
      {'id': 'c2', 'name': 'Bob', 'phone': '2', 'credit_limit': 0.0},
    ]);
    var cached = await LocalDb.instance.getCachedCustomers();
    expect(cached.map((c) => c['id']), containsAll(['c1', 'c2']));

    await LocalDb.instance.upsertCustomers([
      {'id': 'c1', 'name': 'Alice', 'phone': '1', 'credit_limit': 0.0},
    ]);
    cached = await LocalDb.instance.getCachedCustomers();
    expect(cached.map((c) => c['id']), ['c1']);
  });
}
