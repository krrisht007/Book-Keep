import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class ProfitByItemScreen extends StatefulWidget {
  const ProfitByItemScreen({super.key});

  @override
  State<ProfitByItemScreen> createState() => _ProfitByItemScreenState();
}

class _ProfitByItemScreenState extends State<ProfitByItemScreen> {
  Map<String, dynamic>? _data;
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
        Uri.parse('${AppConfig.baseUrl}/reports/profit-by-item'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          _data = jsonDecode(response.body);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.pbiTitle),
      body:
          _isLoading
              ? const SkeletonListLoader()
              : _errorMessage != null
              ? errorRetry(_errorMessage!, _fetch)
              : RefreshIndicator(onRefresh: _fetch, child: _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    final data = _data!;
    final categories =
        (data['by_category'] as List).cast<Map<String, dynamic>>();
    final items = (data['by_item'] as List).cast<Map<String, dynamic>>();

    if (items.isEmpty) {
      return ListView(
        children: [
          SizedBox(height: 120),
          Center(
            child: Text(context.t.pbiNoSales, style: TextStyle(fontSize: 16)),
          ),
        ],
      );
    }

    final totalRevenue = items.fold<double>(
      0,
      (s, r) => s + (r['revenue'] as num),
    );
    final totalCogs = items.fold<double>(0, (s, r) => s + (r['cogs'] as num));
    final totalProfit = totalRevenue - totalCogs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _totalBanner(totalRevenue, totalCogs, totalProfit),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconBadge(
                    Icons.pie_chart_outline,
                    Theme.of(context).colorScheme.primary,
                    size: 34,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      context.t.pbiByCategory,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              for (var i = 0; i < categories.length; i++) ...[
                if (i > 0) const Divider(height: 18),
                _categoryRow(categories[i]),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconBadge(
                    Icons.trending_up,
                    Theme.of(context).colorScheme.primary,
                    size: 34,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      context.t.pbiItemsByProfit,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              for (var i = 0; i < items.length; i++) ...[
                if (i > 0) const Divider(height: 1),
                _itemRow(items[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _totalBanner(double revenue, double cogs, double profit) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppStyle.tint(context, primary),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppStyle.tint(context, primary, light: 0.2, dark: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.trending_up, color: primary, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${formatMoney(revenue)} revenue − ${formatMoney(cogs)} COGS',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: profit),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                  builder:
                      (context, value, child) => Text(
                        '${formatMoney(value)} profit, all-time',
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

  Widget _categoryRow(Map<String, dynamic> c) {
    final revenue = (c['revenue'] as num).toDouble();
    final profit = (c['profit'] as num).toDouble();
    final margin = revenue > 0 ? (profit / revenue * 100) : 0.0;
    return Row(
      children: [
        Expanded(
          child: Text(
            c['category'] as String,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          '${formatMoney(profit)} (${margin.toStringAsFixed(0)}%)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: profit >= 0 ? Colors.green.shade700 : Colors.red.shade700,
          ),
        ),
      ],
    );
  }

  Widget _itemRow(Map<String, dynamic> item) {
    final revenue = (item['revenue'] as num).toDouble();
    final cogs = (item['cogs'] as num).toDouble();
    final profit = (item['profit'] as num).toDouble();
    final qty = (item['quantity'] as num).toDouble();
    final margin = revenue > 0 ? (profit / revenue * 100) : 0.0;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(item['item'] as String? ?? '—'),
      subtitle: Text(
        '${qty.toStringAsFixed(qty == qty.roundToDouble() ? 0 : 1)} sold '
        '· ${formatMoney(revenue)} revenue − ${formatMoney(cogs)} COGS '
        '(${margin.toStringAsFixed(0)}% margin)',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        formatMoney(profit),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: profit >= 0 ? Colors.green.shade700 : Colors.red.shade700,
        ),
      ),
    );
  }
}
