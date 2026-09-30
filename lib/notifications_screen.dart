import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

const _kLowStockEnabled = 'notif_low_stock_enabled';
const _kOverdueEnabled = 'notif_overdue_enabled';
const _kSummaryEnabled = 'notif_summary_enabled';
const _kLowStockLastRun = 'notif_low_stock_last_run';
const _kOverdueLastRun = 'notif_overdue_last_run';
const _kSummaryLastRun = 'notif_summary_last_run';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _lowStockEnabled = true;
  bool _overdueEnabled = true;
  bool _summaryEnabled = true;

  DateTime? _lowStockLastRun;
  DateTime? _overdueLastRun;
  DateTime? _summaryLastRun;

  String? _lowStockResult;
  String? _overdueResult;
  String? _summaryResult;

  bool _lowStockLoading = false;
  bool _overdueLoading = false;
  bool _summaryLoading = false;

  List<dynamic> _lowStockItems = [];

  Map<String, dynamic>? _summaryData;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lowStockEnabled = prefs.getBool(_kLowStockEnabled) ?? true;
      _overdueEnabled = prefs.getBool(_kOverdueEnabled) ?? true;
      _summaryEnabled = prefs.getBool(_kSummaryEnabled) ?? true;

      final lsRaw = prefs.getString(_kLowStockLastRun);
      final ovRaw = prefs.getString(_kOverdueLastRun);
      final smRaw = prefs.getString(_kSummaryLastRun);
      _lowStockLastRun = lsRaw != null ? DateTime.tryParse(lsRaw) : null;
      _overdueLastRun = ovRaw != null ? DateTime.tryParse(ovRaw) : null;
      _summaryLastRun = smRaw != null ? DateTime.tryParse(smRaw) : null;
    });
  }

  Future<void> _setToggle(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> _saveLastRun(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    await prefs.setString(key, now.toIso8601String());
    return;
  }

  String _formatTime(DateTime? dt) {
    if (dt == null) return context.t.ntNever;
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return context.t.ntJustNow;
    if (diff.inMinutes < 60) return context.t.ntMinutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return context.t.ntHoursAgo(diff.inHours);
    return context.t.ntDaysAgo(diff.inDays);
  }

  Future<void> _triggerLowStock() async {
    setState(() {
      _lowStockLoading = true;
      _lowStockResult = null;
      _lowStockItems = [];
    });
    try {
      final res = await http.get(
        Uri.parse('${AppConfig.baseUrl}/notifications/check-low-stock'),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        await _saveLastRun(_kLowStockLastRun);
        if (mounted) {
          setState(() {
            _lowStockLastRun = DateTime.now();
            _lowStockResult = data['message'] as String? ?? 'Done';
            _lowStockItems = (data['items'] as List?) ?? [];
          });
        }
      } else if (mounted) {
        setState(() => _lowStockResult = 'Server error (${res.statusCode})');
      }
    } catch (e) {
      if (mounted) setState(() => _lowStockResult = 'Could not reach server');
    } finally {
      if (mounted) setState(() => _lowStockLoading = false);
    }
  }

  Future<void> _triggerOverdue() async {
    setState(() {
      _overdueLoading = true;
      _overdueResult = null;
    });
    try {
      final res = await http.get(
        Uri.parse('${AppConfig.baseUrl}/notifications/check-overdue'),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        await _saveLastRun(_kOverdueLastRun);
        if (mounted) {
          setState(() {
            _overdueLastRun = DateTime.now();
            _overdueResult = data['message'] as String? ?? 'Done';
          });
        }
      } else if (mounted) {
        setState(() => _overdueResult = 'Server error (${res.statusCode})');
      }
    } catch (e) {
      if (mounted) setState(() => _overdueResult = 'Could not reach server');
    } finally {
      if (mounted) setState(() => _overdueLoading = false);
    }
  }

  Future<void> _triggerSummary() async {
    setState(() {
      _summaryLoading = true;
      _summaryResult = null;
      _summaryData = null;
    });
    try {
      final res = await http.get(
        Uri.parse('${AppConfig.baseUrl}/notifications/daily-summary'),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        await _saveLastRun(_kSummaryLastRun);
        if (mounted) {
          setState(() {
            _summaryLastRun = DateTime.now();
            _summaryResult = data['message'] as String? ?? 'Done';
            _summaryData = data['summary'] as Map<String, dynamic>?;
          });
        }
      } else if (mounted) {
        setState(() => _summaryResult = 'Server error (${res.statusCode})');
      }
    } catch (e) {
      if (mounted) setState(() => _summaryResult = 'Could not reach server');
    } finally {
      if (mounted) setState(() => _summaryLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.ntTitle),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _headerBanner(),
          const SizedBox(height: 16),
          _lowStockCard(),
          const SizedBox(height: 12),
          _overdueCard(),
          const SizedBox(height: 12),
          _summaryCard(),
        ],
      ),
    );
  }

  Widget _headerBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.notifications_active_rounded,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.t.ntTapHint,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _lowStockCard() {
    return _NotifCard(
      icon: Icons.inventory_2_outlined,
      iconColor: Colors.teal.shade400,
      iconBg: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      title: context.t.lowStockAlerts,
      subtitle: context.t.ntLowStockSub,
      lastRunLabel: _formatTime(_lowStockLastRun),
      enabled: _lowStockEnabled,
      onToggle: (v) {
        setState(() => _lowStockEnabled = v);
        _setToggle(_kLowStockEnabled, v);
      },
      loading: _lowStockLoading,
      onTrigger: _lowStockEnabled ? _triggerLowStock : null,
      buttonLabel: context.t.ntCheckNow,
      result: _lowStockResult,
      resultIsError:
          _lowStockResult?.startsWith('Could') == true ||
          _lowStockResult?.startsWith('Server') == true,
      detail:
          _lowStockItems.isEmpty
              ? null
              : _LowStockDetail(items: _lowStockItems),
    );
  }

  Widget _overdueCard() {
    return _NotifCard(
      icon: Icons.receipt_long_outlined,
      iconColor: Colors.teal.shade400,
      iconBg: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      title: context.t.ntOverdue,
      subtitle: context.t.ntOverdueSub,
      lastRunLabel: _formatTime(_overdueLastRun),
      enabled: _overdueEnabled,
      onToggle: (v) {
        setState(() => _overdueEnabled = v);
        _setToggle(_kOverdueEnabled, v);
      },
      loading: _overdueLoading,
      onTrigger: _overdueEnabled ? _triggerOverdue : null,
      buttonLabel: context.t.ntCheckNow,
      result: _overdueResult,
      resultIsError:
          _overdueResult?.startsWith('Could') == true ||
          _overdueResult?.startsWith('Server') == true,
    );
  }

  Widget _summaryCard() {
    return _NotifCard(
      icon: Icons.bar_chart_rounded,
      iconColor: Colors.teal.shade400,
      iconBg: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      title: context.t.ntDaily,
      subtitle: context.t.ntDailySub,
      lastRunLabel: _formatTime(_summaryLastRun),
      enabled: _summaryEnabled,
      onToggle: (v) {
        setState(() => _summaryEnabled = v);
        _setToggle(_kSummaryEnabled, v);
      },
      loading: _summaryLoading,
      onTrigger: _summaryEnabled ? _triggerSummary : null,
      buttonLabel: context.t.ntSendSummary,
      result: _summaryResult,
      resultIsError:
          _summaryResult?.startsWith('Could') == true ||
          _summaryResult?.startsWith('Server') == true,
      detail: _summaryData == null ? null : _SummaryDetail(data: _summaryData!),
    );
  }
}

class _NotifCard extends StatelessWidget {
  const _NotifCard({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.lastRunLabel,
    required this.enabled,
    required this.onToggle,
    required this.loading,
    required this.onTrigger,
    required this.buttonLabel,
    this.result,
    this.resultIsError = false,
    this.detail,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String title;
  final String subtitle;
  final String lastRunLabel;
  final bool enabled;
  final ValueChanged<bool> onToggle;
  final bool loading;
  final VoidCallback? onTrigger;
  final String buttonLabel;
  final String? result;
  final bool resultIsError;
  final Widget? detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = AppStyle.isDark(context);
    final resultAccent = resultIsError ? Colors.red : Colors.green;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: enabled,
                  onChanged: onToggle,
                  activeColor: theme.colorScheme.primary,
                ),
              ],
            ),

            const SizedBox(height: 4),

            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 13,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                ),
                const SizedBox(width: 4),
                Text(
                  lastRunLabel,
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: loading ? null : onTrigger,
                icon:
                    loading
                        ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : Icon(
                          enabled
                              ? Icons.send_rounded
                              : Icons.notifications_off_outlined,
                          size: 18,
                        ),
                label: Text(loading ? context.t.ntRunning : buttonLabel),
                style: FilledButton.styleFrom(
                  backgroundColor:
                      enabled
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.15),
                  foregroundColor: enabled ? Colors.white : Colors.grey,
                  minimumSize: const Size.fromHeight(44),
                ),
              ),
            ),

            if (result != null) ...[
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppStyle.tint(context, resultAccent),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: resultAccent.withValues(alpha: dark ? 0.5 : 0.35),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      resultIsError
                          ? Icons.error_outline_rounded
                          : Icons.check_circle_outline_rounded,
                      size: 16,
                      color:
                          dark ? resultAccent.shade300 : resultAccent.shade800,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        result!,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              dark
                                  ? resultAccent.shade200
                                  : resultAccent.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            if (detail != null) ...[const SizedBox(height: 10), detail!],
          ],
        ),
      ),
    );
  }
}

class _LowStockDetail extends StatelessWidget {
  const _LowStockDetail({required this.items});
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.ntLowStockItems,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        ...items.map((item) {
          final qty = item['stock_quantity'] ?? 0;
          final threshold = item['low_stock_threshold'] ?? 0;
          final pct = threshold > 0 ? (qty / threshold).clamp(0.0, 1.0) : 0.0;
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    context.itemName(item['name'] ?? '—'),
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: pct.toDouble(),
                      minHeight: 6,
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation(Colors.teal.shade400),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '$qty / $threshold',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _SummaryDetail extends StatelessWidget {
  const _SummaryDetail({required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final sales = (data['total_sales'] as num?)?.toDouble() ?? 0;
    final collected = (data['total_collected'] as num?)?.toDouble() ?? 0;
    final profit = (data['profit'] as num?)?.toDouble() ?? 0;
    final bills = data['bill_count'] ?? 0;
    final dateStr = data['date'] ?? '';

    final brand = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppStyle.borderColor(context)),
      ),
      child: Column(
        children: [
          if (dateStr.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                dateStr,
                style: TextStyle(
                  fontSize: 11,
                  color: brand,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Row(
            children: [
              _StatChip(
                context.t.srBills,
                '$bills',
                Icons.receipt_outlined,
                brand,
              ),
              const SizedBox(width: 8),
              _StatChip(
                context.t.ntSales,
                formatMoney(sales),
                Icons.trending_up,
                brand,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _StatChip(
                context.t.ntCollected,
                formatMoney(collected),
                Icons.payments_outlined,
                brand,
              ),
              const SizedBox(width: 8),
              _StatChip(
                context.t.ntProfit,
                formatMoney(profit),
                Icons.account_balance_wallet_outlined,
                profit >= 0 ? Colors.green.shade700 : Colors.red.shade900,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.label, this.value, this.icon, this.color);
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
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
