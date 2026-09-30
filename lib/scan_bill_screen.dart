import 'dart:convert';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;
import 'config.dart';
import 'local_db.dart';
import 'add_bill_screen.dart';
import 'widgets/app_style.dart';

class ScanBillScreen extends StatefulWidget {
  const ScanBillScreen({super.key});

  @override
  State<ScanBillScreen> createState() => _ScanBillScreenState();
}

class _ScanBillScreenState extends State<ScanBillScreen> {
  List<Map<String, dynamic>> _pendingScans = [];
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _refreshPending();
  }

  Future<void> _refreshPending() async {
    final rows = await LocalDb.instance.getPendingScans();
    if (mounted) setState(() => _pendingScans = rows);
  }

  Future<void> _pickAndScan() async {
    final picked = await pickImageFile(context);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    await _extract(bytes, picked.name);
  }

  Future<void> _extract(
    Uint8List bytes,
    String filename, {
    String? queuedId,
  }) async {
    final t = context.t;
    setState(() => _isScanning = true);
    try {
      final uri = Uri.parse('${AppConfig.baseUrl}/bills/scan');
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: filename),
      );
      final streamed = await request.send().timeout(http.uploadTimeout);
      final body = await streamed.stream.bytesToString();

      if (streamed.statusCode == 200) {
        if (queuedId != null) {
          await LocalDb.instance.markScanReady(queuedId, body);
        }
        if (mounted) await _handleResult(jsonDecode(body), queuedId: queuedId);
      } else {
        String message = t.scServerFail(streamed.statusCode);
        try {
          message = jsonDecode(body)['detail'] as String? ?? message;
        } catch (_) {}
        if (message == 'not_a_bill') message = t.scNotABill;
        if (queuedId != null) {
          await LocalDb.instance.markScanFailed(queuedId, message);
        }
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: SnackMessage(
                icon: Icons.info_outline_rounded,
                color: Colors.amber.shade400,
                text: message,
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (queuedId == null) {
        await LocalDb.instance.enqueueScan(
          photoBytes: bytes,
          photoFilename: filename,
        );
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.t.scOfflineSaved)));
        }
      } else if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.scStillOffline)));
      }
    } finally {
      if (mounted) setState(() => _isScanning = false);
      await _refreshPending();
    }
  }

  Future<void> _handleResult(
    Map<String, dynamic> result, {
    String? queuedId,
  }) async {
    final exact = result['customer_exact'];
    final suggestion = result['customer_suggestion'];
    final extractedName = (result['customer_name'] as String? ?? '').trim();

    String? customerId = exact?['id'];
    String? customerName = exact?['name'];

    if (customerId == null) {
      final choice = await _resolveCustomerDialog(extractedName, suggestion);
      if (choice == null) {
        return;
      }
      if (choice.useExisting) {
        customerId = suggestion['id'];
        customerName = suggestion['name'];
      } else {
        final created = await http.post(
          Uri.parse('${AppConfig.baseUrl}/customers'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'name': choice.newName}),
        );
        if (created.statusCode != 200) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.scCouldNotCreateCustomer)),
            );
          }
          return;
        }
        final data = jsonDecode(created.body);
        customerId = data['id'];
        customerName = data['name'];
      }
    }

    if (!mounted || customerId == null) return;
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddBillScreen(
              customerId: customerId!,
              initialLineItems: result['line_items'],
              scannedImageUrl: result['photo_url'],
              rawExtraction: result['raw_extraction'],
            ),
      ),
    );
    if (saved == true && queuedId != null) {
      await LocalDb.instance.deletePendingScan(queuedId);
      await _refreshPending();
    }
    if (saved == true && mounted && customerName != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SnackMessage(
            icon: Icons.check_circle_rounded,
            color: Colors.greenAccent.shade400,
            text: context.t.scBillSavedFor(customerName),
          ),
        ),
      );
    }
  }

  Future<_CustomerChoice?> _resolveCustomerDialog(
    String extractedName,
    dynamic suggestion,
  ) {
    final nameController = TextEditingController(text: extractedName);
    return showDialog<_CustomerChoice>(
      context: context,
      builder:
          (context) => AlertDialog(
            scrollable: true,
            title: Text(context.t.scWhichCustomer),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (suggestion != null) ...[
                  Text(
                    context.t.scClosestMatch(
                      context.partyName(suggestion['name']),
                      ((suggestion['score'] as num) * 100).round(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed:
                        () => Navigator.pop(
                          context,
                          _CustomerChoice(useExisting: true),
                        ),
                    child: Text(
                      context.t.scYesThisIs(
                        context.partyName(suggestion['name']),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(context.t.scOtherwiseCustomer),
                  const SizedBox(height: 6),
                ] else
                  Text(context.t.scNoMatchCustomer),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: context.t.scCustomerName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.t.cancel),
              ),
              FilledButton(
                onPressed:
                    nameController.text.trim().isEmpty
                        ? null
                        : () => Navigator.pop(
                          context,
                          _CustomerChoice(
                            useExisting: false,
                            newName: nameController.text.trim(),
                          ),
                        ),
                child: Text(context.t.scCreateNew),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.scTitleBill),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
        children: [
          ScanIntroCard(
            icon: Icons.receipt_long_rounded,
            text: context.t.scIntroBill,
          ),
          const SizedBox(height: 16),
          GradientButton(
            label: _isScanning ? context.t.scReadingBill : context.t.scScanBill,
            icon: Icons.document_scanner_outlined,
            loading: _isScanning,
            onPressed: _isScanning ? null : _pickAndScan,
          ),
          if (_pendingScans.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              context.t.scQueued,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            for (final row in _pendingScans) _pendingScanTile(row),
          ],
        ],
      ),
    );
  }

  Widget _pendingScanTile(Map<String, dynamic> row) {
    final status = row['status'] as String;
    final (icon, color, label) = switch (status) {
      'ready' => (Icons.check_circle_outline, Colors.green, context.t.scReady),
      'failed' => (
        Icons.error_outline,
        Colors.red,
        row['error'] as String? ?? context.t.scFailed,
      ),
      _ => (Icons.cloud_upload_outlined, Colors.orange, context.t.scWaiting),
    };
    return Card(
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label),
        subtitle: Text(row['photo_filename'] as String? ?? ''),
        trailing: switch (status) {
          'ready' => const Icon(Icons.chevron_right),
          'failed' => TextButton(
            onPressed:
                () => _extract(
                  base64Decode(row['photo_base64'] as String),
                  row['photo_filename'] as String? ?? 'photo.jpg',
                  queuedId: row['id'] as String,
                ),
            child: Text(context.t.scRetry),
          ),
          _ => null,
        },
        onTap:
            status == 'ready'
                ? () => _handleResult(
                  jsonDecode(row['result_json'] as String),
                  queuedId: row['id'] as String,
                )
                : null,
      ),
    );
  }
}

class _CustomerChoice {
  final bool useExisting;
  final String? newName;
  _CustomerChoice({required this.useExisting, this.newName});
}
