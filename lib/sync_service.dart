import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'api.dart' as http;

import 'config.dart';
import 'local_db.dart';

class SyncService {
  SyncService._();
  static final SyncService instance = SyncService._();

  final ValueNotifier<int> pendingCount = ValueNotifier(0);

  final ValueNotifier<bool> isSyncing = ValueNotifier(false);

  final ValueNotifier<int> syncTick = ValueNotifier(0);

  final ValueNotifier<bool> isOnline = ValueNotifier(true);

  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;

  void startConnectivityListener() {
    _connectivitySub?.cancel();
    bool toOnline(List<ConnectivityResult> results) => results.any(
      (r) =>
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.ethernet,
    );
    Connectivity().checkConnectivity().then((results) {
      isOnline.value = toOnline(results);
    });
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      final online = toOnline(results);
      isOnline.value = online;
      if (online) syncAll();
    });
  }

  Future<void> dispose() async {
    await _connectivitySub?.cancel();
  }

  Future<void> syncAll() async {
    if (isSyncing.value) return;
    isSyncing.value = true;
    final before = pendingCount.value;
    try {
      await pushPendingBills();
      await pushPendingWrites();
      await processPendingScans();
      await processPendingPurchaseScans();
      await refreshCustomerCache();
      await refreshPendingCount();
      if (pendingCount.value < before) syncTick.value++;
    } finally {
      isSyncing.value = false;
    }
  }

  Future<void> refreshPendingCount() async {
    final bills = await LocalDb.instance.getPendingBills();
    final writes = await LocalDb.instance.getPendingWrites();
    pendingCount.value = bills.length + writes.length;
  }

  Future<void> pushPendingBills() async {
    final pending = await LocalDb.instance.getPendingBills();
    if (pending.isEmpty) return;

    for (final row in pending) {
      final method = row['method'] as String;
      final isPut = method == 'PUT';
      final uri = Uri.parse(
        isPut
            ? '${AppConfig.baseUrl}/bills/v2/${row['bill_id']}'
            : '${AppConfig.baseUrl}/bills/v2',
      );

      try {
        final response =
            isPut
                ? await http.put(
                  uri,
                  headers: {'Content-Type': 'application/json'},
                  body: row['payload'] as String,
                )
                : await http.post(
                  uri,
                  headers: {'Content-Type': 'application/json'},
                  body: row['payload'] as String,
                );

        if (response.statusCode == 200 || response.statusCode == 201) {
          await LocalDb.instance.deletePendingBill(row['id'] as String);
        } else {}
      } catch (_) {
        break;
      }
    }
    await refreshPendingCount();
  }

  Future<void> pushPendingWrites() async {
    final pending = await LocalDb.instance.getPendingWrites();
    if (pending.isEmpty) return;

    for (final row in pending) {
      final method = row['method'] as String;
      final uri = Uri.parse('${AppConfig.baseUrl}${row['path']}');
      final headers = {'Content-Type': 'application/json'};
      final body = row['payload'] as String;

      try {
        final response = switch (method) {
          'POST' => await http.post(uri, headers: headers, body: body),
          'PUT' => await http.put(uri, headers: headers, body: body),
          'PATCH' => await http.patch(uri, headers: headers, body: body),
          _ => throw StateError('Unsupported queued method: $method'),
        };

        if (response.statusCode == 200 || response.statusCode == 201) {
          await LocalDb.instance.deletePendingWrite(row['id'] as String);
          await _uploadQueuedPhoto(row, method, uri, response);
        }
      } catch (_) {
        break;
      }
    }
    await refreshPendingCount();
  }

  Future<void> _uploadQueuedPhoto(
    Map<String, dynamic> row,
    String method,
    Uri writeUri,
    http.Response writeResponse,
  ) async {
    final photoBase64 = row['photo_base64'] as String?;
    if (photoBase64 == null) return;

    final recordId =
        method == 'POST'
            ? (jsonDecode(writeResponse.body) as Map)['id'] as String?
            : writeUri.pathSegments.last;
    if (recordId == null) return;

    final suffix = row['photo_suffix'] as String? ?? 'image';
    final resource = writeUri.pathSegments.first;
    final uploadUri = Uri.parse(
      '${AppConfig.baseUrl}/$resource/$recordId/$suffix',
    );
    try {
      final request = http.MultipartRequest('POST', uploadUri);
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          base64Decode(photoBase64),
          filename: row['photo_filename'] as String? ?? 'photo.jpg',
        ),
      );
      await request.send().timeout(http.uploadTimeout);
    } catch (_) {}
  }

  Future<void> processPendingScans() => _processScans(
    getPending: LocalDb.instance.getPendingScans,
    markReady: LocalDb.instance.markScanReady,
    markFailed: LocalDb.instance.markScanFailed,
    endpoint: '/bills/scan',
  );

  Future<void> processPendingPurchaseScans() => _processScans(
    getPending: LocalDb.instance.getPendingPurchaseScans,
    markReady: LocalDb.instance.markPurchaseScanReady,
    markFailed: LocalDb.instance.markPurchaseScanFailed,
    endpoint: '/purchases/scan',
  );

  Future<void> _processScans({
    required Future<List<Map<String, dynamic>>> Function() getPending,
    required Future<void> Function(String id, String resultJson) markReady,
    required Future<void> Function(String id, String error) markFailed,
    required String endpoint,
  }) async {
    final pending = await getPending();
    for (final row in pending) {
      if (row['status'] != 'queued') continue;
      final id = row['id'] as String;
      try {
        final uri = Uri.parse('${AppConfig.baseUrl}$endpoint');
        final request = http.MultipartRequest('POST', uri);
        request.headers.addAll(await http.authHeaders());
        request.files.add(
          http.MultipartFile.fromBytes(
            'file',
            base64Decode(row['photo_base64'] as String),
            filename: row['photo_filename'] as String? ?? 'photo.jpg',
          ),
        );
        final streamed = await request.send().timeout(http.uploadTimeout);
        final body = await streamed.stream.bytesToString();
        if (streamed.statusCode == 200) {
          await markReady(id, body);
        } else {
          await markFailed(id, 'Server error: ${streamed.statusCode}');
        }
      } catch (_) {
        break;
      }
    }
  }

  Future<void> refreshCustomerCache() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/customers'),
      );
      if (response.statusCode == 200) {
        await LocalDb.instance.upsertCustomers(jsonDecode(response.body));
      }
    } catch (_) {}
  }
}
