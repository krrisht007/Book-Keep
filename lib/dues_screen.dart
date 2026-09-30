import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;
import 'collect_payment.dart';
import 'config.dart';
import 'customer_detail_screen.dart';
import 'payment_reminder.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class DuesScreen extends StatefulWidget {
  const DuesScreen({super.key});

  @override
  State<DuesScreen> createState() => _DuesScreenState();
}

class _DuesScreenState extends State<DuesScreen> {
  List<dynamic> _rows = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() => _errorMessage = null);
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/dues-aging'),
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

  Future<void> _openCustomer(dynamic row) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => CustomerDetailScreen(
              customerId: row['customer_id'],
              customerName: row['customer_name'],
              customerPhone:
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
      appBar: FloatingAppBar(title: context.t.duTitle),
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
                                context.t.duNoDues,
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
    return AppCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          IconBadge(
            Icons.account_balance_wallet_outlined,
            Theme.of(context).colorScheme.primary,
            size: 34,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.duOwingCount(_rows.length),
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: _totalOutstanding),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutCubic,
                  builder:
                      (context, value, _) => Text(
                        context.t.duAmountOutstanding(formatMoney(value)),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (var i = 0; i < rows.length; i++) ...[
                  if (i > 0)
                    Divider(height: 1, color: AppStyle.borderColor(context)),
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
      onTap: () => _openCustomer(row),
      leading: IconBadge(Icons.person_outline, color, size: 34),
      title: Text(context.partyName(row['customer_name'] ?? '—')),
      subtitle: Text(
        '${context.t.duDaysSince(daysOld)}${phone.isNotEmpty ? ' · $phone' : ''}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatMoney(outstanding),
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          AppIconButton(
            icon: Icon(
              Icons.payments_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            tooltip: context.t.cdCollectPayment,
            onPressed:
                () => showCollectPaymentSheet(
                  context: context,
                  customerId: row['customer_id'],
                  customerName: row['customer_name'] ?? '',
                  outstanding: outstanding,
                  onCollected: _fetch,
                ),
          ),
          AppIconButton(
            icon: const Icon(
              Icons.chat_bubble_outline,
              color: Color(0xFF25D366),
            ),
            tooltip: context.t.cdSendReminder,
            onPressed:
                () => showPaymentReminderSheet(
                  context: context,
                  customerName: row['customer_name'] ?? '',
                  phone: phone.isEmpty ? null : phone,
                  outstanding: outstanding,
                ),
          ),
        ],
      ),
    );
  }
}
