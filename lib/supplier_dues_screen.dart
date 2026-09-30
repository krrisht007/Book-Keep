import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;
import 'config.dart';
import 'supplier_detail_screen.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class SupplierDuesScreen extends StatefulWidget {
  const SupplierDuesScreen({super.key});

  @override
  State<SupplierDuesScreen> createState() => _SupplierDuesScreenState();
}

class _SupplierDuesScreenState extends State<SupplierDuesScreen> {
  List<dynamic> _rows = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/payables-aging'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          _rows = jsonDecode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = context.t.serverError(response.statusCode);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = context.t.couldNotConnect('$e');
          _isLoading = false;
        });
      }
    }
  }

  double get _totalOutstanding =>
      _rows.fold(0.0, (sum, r) => sum + (r['outstanding'] as num));

  List<dynamic> _bucket(String bucket) =>
      _rows.where((r) => r['bucket'] == bucket).toList();

  Future<void> _openSupplier(dynamic row) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SupplierDetailScreen(
              supplierId: row['supplier_id'],
              supplierName: row['supplier_name'],
              supplierPhone:
                  (row['phone'] as String?)?.isEmpty == true
                      ? null
                      : row['phone'] as String?,
            ),
      ),
    );
    if (mounted) _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.sduTitle),
      body:
          _isLoading
              ? const SkeletonListLoader()
              : _errorMessage != null
              ? errorRetry(_errorMessage!, _fetch)
              : RefreshIndicator(
                onRefresh: _fetch,
                child:
                    _rows.isEmpty
                        ? ListView(
                          children: [
                            SizedBox(height: 120),
                            Center(
                              child: Text(
                                context.t.sduNothingOwed,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        )
                        : ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            _totalBanner(),
                            const SizedBox(height: 16),
                            _bucketSection(
                              label: context.t.duBucket0,
                              color: Colors.green.shade700,
                              rows: _bucket('0_30'),
                            ),
                            _bucketSection(
                              label: context.t.duBucket1,
                              color: Colors.orange.shade700,
                              rows: _bucket('30_60'),
                            ),
                            _bucketSection(
                              label: context.t.duBucket2,
                              color: Colors.red.shade700,
                              rows: _bucket('60_plus'),
                            ),
                          ],
                        ),
              ),
    );
  }

  Widget _totalBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.local_shipping_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.sduOwedCount(_rows.length),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  context.t.sdPayableAmount(formatMoney(_totalOutstanding)),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bucketSection({
    required String label,
    required Color color,
    required List<dynamic> rows,
  }) {
    if (rows.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: color,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '(${rows.length})',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                for (var i = 0; i < rows.length; i++) ...[
                  if (i > 0) const Divider(height: 1),
                  _dueRow(rows[i], color),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dueRow(dynamic row, Color color) {
    final phone = row['phone'] as String? ?? '';
    final outstanding = (row['outstanding'] as num).toDouble();
    final daysOld = row['days_old'] as int? ?? 0;
    return ListTile(
      onTap: () => _openSupplier(row),
      title: Text(context.partyName(row['supplier_name'] ?? '—')),
      subtitle: Text(
        '${context.t.sduDaysSince(daysOld)}${phone.isNotEmpty ? ' · $phone' : ''}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        formatMoney(outstanding),
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
