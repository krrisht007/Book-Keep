import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class StockValuationScreen extends StatefulWidget {
  const StockValuationScreen({super.key});

  @override
  State<StockValuationScreen> createState() => _StockValuationScreenState();
}

class _StockValuationScreenState extends State<StockValuationScreen> {
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
        Uri.parse('${AppConfig.baseUrl}/reports/stock-valuation'),
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
      appBar: FloatingAppBar(title: context.t.svTitle),
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
    final items = (data['items'] as List).cast<Map<String, dynamic>>();
    final totalValue = (data['total_value'] as num).toDouble();
    final totalItems = data['total_items'] as int;
    final totalQuantity = (data['total_quantity'] as num).toDouble();

    if (items.isEmpty) {
      return ListView(
        children: [
          SizedBox(height: 120),
          Center(child: Text(context.t.svNone, style: TextStyle(fontSize: 16))),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _totalBanner(totalValue, totalItems, totalQuantity),
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
                _categoryRow(categories[i], totalValue),
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
                    Icons.inventory_2_outlined,
                    Theme.of(context).colorScheme.primary,
                    size: 34,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      context.t.svItemsByValue,
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

  Widget _totalBanner(double totalValue, int totalItems, double totalQuantity) {
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
          Icon(Icons.warehouse_outlined, color: primary, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.svSummary(
                    '$totalItems',
                    totalQuantity.toStringAsFixed(0),
                  ),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: totalValue),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic,
                  builder:
                      (context, value, child) => Text(
                        context.t.svTied(formatMoney(value)),
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

  Widget _categoryRow(Map<String, dynamic> c, double totalValue) {
    final total = (c['total'] as num).toDouble();
    final fraction =
        totalValue > 0 ? (total / totalValue).clamp(0.0, 1.0) : 0.0;
    final primary = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                c['category'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              formatMoney(total),
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${c['item_count']} item${c['item_count'] == 1 ? '' : 's'} · ${(c['quantity'] as num).toStringAsFixed(0)} units',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: fraction),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            builder:
                (context, value, child) => LinearProgressIndicator(
                  value: value,
                  minHeight: 6,
                  backgroundColor: primary.withValues(alpha: 0.12),
                  valueColor: AlwaysStoppedAnimation(primary),
                ),
          ),
        ),
      ],
    );
  }

  Widget _itemRow(Map<String, dynamic> item) {
    final qty = (item['quantity'] as num).toDouble();
    final unitCost = (item['unit_cost'] as num?)?.toDouble() ?? 0;
    final value = (item['value'] as num).toDouble();
    final estimated = item['cost_is_estimated'] == true;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(context.itemName(item['name'] ?? '—')),
      subtitle: Text(
        '${qty.toStringAsFixed(qty == qty.roundToDouble() ? 0 : 1)} ${context.unitName(item['unit'])} '
        '× ${formatMoney(unitCost, decimals: 2)}'
        '${estimated ? ' (${context.t.svEstimated})' : ''}',
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Text(
        formatMoney(value),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
