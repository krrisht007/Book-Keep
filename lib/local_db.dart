import 'dart:convert';
import 'dart:math';
import 'dart:typed_data' show Uint8List;

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class LocalDb {
  LocalDb._();
  static final LocalDb instance = LocalDb._();

  Database? _db;

  Future<Database> get database async => _db ??= await _open();

  static const _pendingWritesTable = '''
    CREATE TABLE pending_writes (
      id TEXT PRIMARY KEY,
      method TEXT NOT NULL,
      path TEXT NOT NULL,
      label TEXT NOT NULL,
      payload TEXT NOT NULL,
      created_at TEXT NOT NULL,
      photo_base64 TEXT,
      photo_filename TEXT,
      photo_suffix TEXT
    )
  ''';

  static const _pendingScansTable = '''
    CREATE TABLE pending_scans (
      id TEXT PRIMARY KEY,
      photo_base64 TEXT NOT NULL,
      photo_filename TEXT NOT NULL,
      status TEXT NOT NULL,
      result_json TEXT,
      error TEXT,
      created_at TEXT NOT NULL
    )
  ''';

  static const _pendingPurchaseScansTable = '''
    CREATE TABLE pending_purchase_scans (
      id TEXT PRIMARY KEY,
      photo_base64 TEXT NOT NULL,
      photo_filename TEXT NOT NULL,
      status TEXT NOT NULL,
      result_json TEXT,
      error TEXT,
      created_at TEXT NOT NULL
    )
  ''';

  Future<Database> _open() async {
    final path = p.join(await getDatabasesPath(), 'bookkeeper_local.db');
    return openDatabase(
      path,
      version: 5,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE customers_cache (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            phone TEXT,
            credit_limit REAL
          )
        ''');
        await db.execute('''
          CREATE TABLE pending_bills (
            id TEXT PRIMARY KEY,
            customer_id TEXT NOT NULL,
            customer_name TEXT,
            method TEXT NOT NULL,
            bill_id TEXT,
            payload TEXT NOT NULL,
            created_at TEXT NOT NULL
          )
        ''');
        await db.execute(_pendingWritesTable);
        await db.execute(_pendingScansTable);
        await db.execute(_pendingPurchaseScansTable);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(_pendingWritesTable);
        }
        if (oldVersion < 3) {
          await db.execute(
            'ALTER TABLE pending_writes ADD COLUMN photo_base64 TEXT',
          );
          await db.execute(
            'ALTER TABLE pending_writes ADD COLUMN photo_filename TEXT',
          );
          await db.execute(
            'ALTER TABLE pending_writes ADD COLUMN photo_suffix TEXT',
          );
        }
        if (oldVersion < 4) {
          await db.execute(_pendingScansTable);
        }
        if (oldVersion < 5) {
          await db.execute(_pendingPurchaseScansTable);
        }
      },
    );
  }

  Future<void> upsertCustomers(List<dynamic> customers) async {
    final db = await database;
    final batch = db.batch();
    batch.delete('customers_cache');
    for (final c in customers) {
      final map = c as Map<String, dynamic>;
      batch.insert('customers_cache', {
        'id': map['id'],
        'name': map['name'],
        'phone': map['phone'],
        'credit_limit': map['credit_limit'],
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, dynamic>>> getCachedCustomers() async {
    final db = await database;
    return db.query('customers_cache', orderBy: 'name COLLATE NOCASE');
  }

  Future<void> enqueueBill({
    required String customerId,
    required String customerName,
    required String method,
    String? billId,
    required Map<String, dynamic> payload,
  }) async {
    final db = await database;
    await db.insert('pending_bills', {
      'id':
          '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(1 << 32)}',
      'customer_id': customerId,
      'customer_name': customerName,
      'method': method,
      'bill_id': billId,
      'payload': jsonEncode(payload),
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getPendingBills() async {
    final db = await database;
    return db.query('pending_bills', orderBy: 'created_at');
  }

  Future<void> deletePendingBill(String id) async {
    final db = await database;
    await db.delete('pending_bills', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> enqueueWrite({
    required String method,
    required String path,
    required String label,
    required Map<String, dynamic> payload,
    Uint8List? photoBytes,
    String? photoFilename,
    String? photoUploadSuffix,
  }) async {
    final db = await database;
    await db.insert('pending_writes', {
      'id':
          '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(1 << 32)}',
      'method': method,
      'path': path,
      'label': label,
      'payload': jsonEncode(payload),
      'created_at': DateTime.now().toIso8601String(),
      'photo_base64': photoBytes == null ? null : base64Encode(photoBytes),
      'photo_filename': photoFilename,
      'photo_suffix': photoUploadSuffix,
    });
  }

  Future<List<Map<String, dynamic>>> getPendingWrites() async {
    final db = await database;
    return db.query('pending_writes', orderBy: 'created_at');
  }

  Future<void> deletePendingWrite(String id) async {
    final db = await database;
    await db.delete('pending_writes', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> enqueueScan({
    required Uint8List photoBytes,
    required String photoFilename,
  }) => _enqueueScan('pending_scans', photoBytes, photoFilename);

  Future<List<Map<String, dynamic>>> getPendingScans() =>
      _getPendingScans('pending_scans');

  Future<void> markScanReady(String id, String resultJson) =>
      _markScanReady('pending_scans', id, resultJson);

  Future<void> markScanFailed(String id, String error) =>
      _markScanFailed('pending_scans', id, error);

  Future<void> deletePendingScan(String id) =>
      _deletePendingScan('pending_scans', id);

  Future<void> enqueuePurchaseScan({
    required Uint8List photoBytes,
    required String photoFilename,
  }) => _enqueueScan('pending_purchase_scans', photoBytes, photoFilename);

  Future<List<Map<String, dynamic>>> getPendingPurchaseScans() =>
      _getPendingScans('pending_purchase_scans');

  Future<void> markPurchaseScanReady(String id, String resultJson) =>
      _markScanReady('pending_purchase_scans', id, resultJson);

  Future<void> markPurchaseScanFailed(String id, String error) =>
      _markScanFailed('pending_purchase_scans', id, error);

  Future<void> deletePendingPurchaseScan(String id) =>
      _deletePendingScan('pending_purchase_scans', id);

  Future<void> _enqueueScan(
    String table,
    Uint8List photoBytes,
    String photoFilename,
  ) async {
    final db = await database;
    await db.insert(table, {
      'id':
          '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(1 << 32)}',
      'photo_base64': base64Encode(photoBytes),
      'photo_filename': photoFilename,
      'status': 'queued',
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> _getPendingScans(String table) async {
    final db = await database;
    return db.query(table, orderBy: 'created_at');
  }

  Future<void> _markScanReady(
    String table,
    String id,
    String resultJson,
  ) async {
    final db = await database;
    await db.update(
      table,
      {'status': 'ready', 'result_json': resultJson, 'error': null},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> _markScanFailed(String table, String id, String error) async {
    final db = await database;
    await db.update(
      table,
      {'status': 'failed', 'error': error},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> _deletePendingScan(String table, String id) async {
    final db = await database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
