import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'api.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'config.dart';
import 'save_to_downloads.dart' show saveToDownloads;
import 'widgets/app_style.dart';

class BackupScreen extends StatefulWidget {
  const BackupScreen({super.key});

  @override
  State<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends State<BackupScreen> {
  bool _busy = false;
  bool _isAdmin = false;
  List<dynamic> _autoBackups = [];

  DateTimeRange? _exportRange;

  Future<void> _pickExportRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
      initialDateRange: _exportRange,
    );
    if (picked != null) setState(() => _exportRange = picked);
  }

  String _isoDate(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/admin/status'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final isAdmin = data['is_admin'] == true;
        if (mounted) setState(() => _isAdmin = isAdmin);
        if (isAdmin) _fetchAutoBackups();
      }
    } catch (_) {}
  }

  Future<void> _fetchAutoBackups() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/backup/history'),
      );
      if (response.statusCode == 200 && mounted) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() => _autoBackups = data['backups'] as List<dynamic>);
      }
    } catch (_) {}
  }

  String _formatAutoBackupTime(String isoString) {
    final dt = DateTime.tryParse(isoString);
    if (dt == null) return isoString;
    return dt.toString().split('.').first;
  }

  String _ts() {
    final n = DateTime.now();
    String two(int v) => v.toString().padLeft(2, '0');
    return '${n.year}${two(n.month)}${two(n.day)}'
        '_${two(n.hour)}${two(n.minute)}${two(n.second)}';
  }

  Future<Uint8List?> _fetchBytes(Uri uri) async {
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.gstFailedDownload(response.statusCode)),
          ),
        );
      }
      return null;
    }
    return response.bodyBytes;
  }

  Future<void> _downloadAndShare(Uri uri, String filename) async {
    setState(() => _busy = true);
    try {
      final bytes = await _fetchBytes(uri);
      if (bytes == null) return;
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsBytes(bytes);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.gstSaved(filename))));
      }
      await Share.shareXFiles([XFile(file.path)]);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.gstCouldNotDownload('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _downloadToDownloads(Uri uri, String filename) async {
    setState(() => _busy = true);
    try {
      final bytes = await _fetchBytes(uri);
      if (bytes == null) return;
      await saveToDownloads(filename: filename, bytes: bytes);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.gstSavedDownloads(filename))),
        );
      }
    } on PlatformException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.couldNotSave('${e.message}'))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.gstCouldNotDownload('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _backupFilename(http.Response response) {
    final cd = response.headers['content-disposition'];
    final match =
        cd == null ? null : RegExp('filename="([^"]+)"').firstMatch(cd);
    return match?.group(1) ?? 'bookkeeper_backup_${_ts()}.db';
  }

  Future<void> _downloadToPhone() async {
    setState(() => _busy = true);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/backup'));
      if (response.statusCode != 200) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.t.gstFailedDownload(response.statusCode)),
            ),
          );
        }
        return;
      }
      final filename = _backupFilename(response);
      await saveToDownloads(filename: filename, bytes: response.bodyBytes);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.gstSavedDownloads(filename))),
        );
      }
    } on PlatformException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.couldNotSave('${e.message}'))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.gstCouldNotDownload('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _shareBackup() async {
    setState(() => _busy = true);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/backup'));
      if (response.statusCode != 200) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.t.gstFailedDownload(response.statusCode)),
            ),
          );
        }
        return;
      }
      final filename = _backupFilename(response);
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsBytes(response.bodyBytes);
      await Share.shareXFiles([XFile(file.path)]);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.gstCouldNotDownload('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _restore() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['db', 'json'],
      withData: true,
    );
    if (result == null || result.files.single.bytes == null) return;
    if (!mounted) return;
    final bytes = result.files.single.bytes!;
    final filename = result.files.single.name;

    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.bkRestoreTitle),
            content: Text(context.t.bkRestoreBody(filename)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  context.t.bkRestore,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
    if (confirmed != true) return;

    setState(() => _busy = true);
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppConfig.baseUrl}/backup/restore'),
      );
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: filename),
      );
      final streamed = await request.send().timeout(http.uploadTimeout);
      final response = await http.Response.fromStream(streamed);
      if (response.statusCode == 200) {
        if (mounted) {
          await showDialog<void>(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text(context.t.bkRestoreDoneTitle),
                  content: Text(context.t.bkRestoreDoneBody),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(context.t.bkOk),
                    ),
                  ],
                ),
          );
        }
        if (mounted) Navigator.pop(context, true);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.bkRestoreFailed(response.body))),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.bkCouldNotRestore('$e'))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Widget _exportRow(
    ThemeData theme,
    IconData icon,
    String label,
    String path,
    String filename, {
    bool dateFiltered = false,
  }) {
    var uri = Uri.parse('${AppConfig.baseUrl}$path');
    if (dateFiltered && _exportRange != null) {
      final from = _isoDate(_exportRange!.start);
      final to = _isoDate(_exportRange!.end);
      uri = uri.replace(queryParameters: {'from_date': from, 'to_date': to});
      filename = filename.replaceFirst('.csv', '_${from}_to_$to.csv');
    }
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(label),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIconButton(
            icon: const Icon(Icons.download, size: 20),
            tooltip: context.t.bkSaveToDownloads,
            onPressed: _busy ? null : () => _downloadToDownloads(uri, filename),
          ),
          AppIconButton(
            icon: const Icon(Icons.ios_share, size: 20),
            tooltip: context.t.abShare,
            onPressed: _busy ? null : () => _downloadAndShare(uri, filename),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.backupExport),
      body: RefreshIndicator(
        onRefresh: _fetchAutoBackups,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              _isAdmin ? context.t.bkIntroAdmin : context.t.bkIntroStaff,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            if (_isAdmin) ...[
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.backup_outlined,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          context.t.bkBackupDb,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.t.bkBackupDbSub,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 12),
                    GradientButton(
                      icon: Icons.download,
                      label: context.t.bkDownloadPhone,
                      loading: _busy,
                      onPressed: _busy ? null : _downloadToPhone,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: _busy ? null : _shareBackup,
                        icon: const Icon(Icons.ios_share, size: 20),
                        label: Text(context.t.bkShareBackup),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              if (_autoBackups.isNotEmpty)
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.cloud_done_outlined,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            context.t.bkAutoTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        context.t.bkAutoBody(
                          _autoBackups.length,
                          _formatAutoBackupTime(
                            _autoBackups.first['created_at'] as String,
                          ),
                        ),
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              if (_autoBackups.isNotEmpty) const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.restore, color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          context.t.bkRestore,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.t.bkRestoreSub,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _busy ? null : _restore,
                        icon: const Icon(Icons.restore),
                        label: Text(context.t.bkRestoreFromFile),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 12),
            AppCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.table_chart_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.t.bkExportCsv,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.t.bkExportSub,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _exportRange == null
                              ? context.t.bkRangeAll
                              : context.t.bkRangeSome(
                                _isoDate(_exportRange!.end),
                                _isoDate(_exportRange!.start),
                              ),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _pickExportRange,
                        child: Text(context.t.bkSetRange),
                      ),
                      if (_exportRange != null)
                        AppIconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          tooltip: context.t.bkClearRange,
                          onPressed: () => setState(() => _exportRange = null),
                        ),
                    ],
                  ),
                  const Divider(height: 1),
                  _exportRow(
                    theme,
                    Icons.people_outline,
                    context.t.navCustomers,
                    '/export/customers.csv',
                    'customers.csv',
                  ),
                  const Divider(height: 1),
                  _exportRow(
                    theme,
                    Icons.receipt_long,
                    context.t.srBills,
                    '/export/bills.csv',
                    'bills.csv',
                    dateFiltered: true,
                  ),
                  const Divider(height: 1),
                  _exportRow(
                    theme,
                    Icons.inventory_2_outlined,
                    context.t.navItems,
                    '/export/items.csv',
                    'items.csv',
                  ),
                  const Divider(height: 1),
                  _exportRow(
                    theme,
                    Icons.receipt_outlined,
                    context.t.expensesTitle,
                    '/export/expenses.csv',
                    'expenses.csv',
                    dateFiltered: true,
                  ),
                  const Divider(height: 1),
                  _exportRow(
                    theme,
                    Icons.warehouse_outlined,
                    context.t.svTitle,
                    '/export/stock-valuation.csv',
                    'stock_valuation.csv',
                  ),
                  const Divider(height: 1),
                  _exportRow(
                    theme,
                    Icons.local_shipping_outlined,
                    context.t.sduTitle,
                    '/export/supplier-dues.csv',
                    'supplier_dues.csv',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
