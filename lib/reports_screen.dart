import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'expenses_screen.dart';
import 'customer_detail_screen.dart';
import 'dues_screen.dart';
import 'gst_report_screen.dart';
import 'items_screen.dart';
import 'profit_by_item_screen.dart';
import 'stock_valuation_screen.dart';
import 'supplier_dues_screen.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';
import 'date_locale.dart';

class ReportsScreen extends StatefulWidget {
  final VoidCallback? onGoToCustomers;
  final VoidCallback? onGoToItems;

  const ReportsScreen({super.key, this.onGoToCustomers, this.onGoToItems});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<dynamic> outstanding = [];
  List<dynamic> monthly = [];
  List<dynamic> topItems = [];
  List<dynamic> topCustomers = [];
  List<dynamic> profitMonthly = [];
  Map<String, dynamic> itemsByName = {};
  bool isLoading = true;
  String? errorMessage;

  bool _expandOutstanding = true;
  bool _expandMonthly = true;
  bool _expandTopItems = true;
  bool _expandTopCustomers = true;

  @override
  void initState() {
    super.initState();
    fetchReports();
  }

  Future<void> openRateCard() => fetchAndPrintPdf(
    context,
    url:
        '${AppConfig.baseUrl}/items/rate-card?language=${Localizations.localeOf(context).languageCode}',
    errorLabel: context.t.lblRateCard,
  );

  Future<void> fetchReports() async {
    try {
      final results = await Future.wait([
        http.get(Uri.parse('${AppConfig.baseUrl}/reports/outstanding')),
        http.get(Uri.parse('${AppConfig.baseUrl}/reports/monthly')),
        http.get(Uri.parse('${AppConfig.baseUrl}/reports/top-items')),
        http.get(Uri.parse('${AppConfig.baseUrl}/reports/profit-monthly')),
        http.get(Uri.parse('${AppConfig.baseUrl}/items')),
        http.get(
          Uri.parse('${AppConfig.baseUrl}/reports/top-customers-by-revenue'),
        ),
      ]);

      if (!mounted) return;
      setState(() {
        outstanding = jsonDecode(results[0].body);
        monthly = jsonDecode(results[1].body);
        topItems = jsonDecode(results[2].body);
        profitMonthly = jsonDecode(results[3].body);
        final items = jsonDecode(results[4].body) as List;
        topCustomers = jsonDecode(results[5].body);
        itemsByName = {
          for (final it in items)
            (it['name'] as String).trim().toLowerCase(): it,
        };
        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = context.t.rpCouldNotLoad('$e');
          isLoading = false;
        });
      }
    }
  }

  double get totalOutstanding =>
      outstanding.fold(0.0, (sum, o) => sum + (o['outstanding'] as num));

  String get _currentMonthKey => DateFormat('yyyy-MM').format(DateTime.now());

  String get _currentMonthLabel => monthYear(DateTime.now());

  Future<void> _editItemByName(String name) async {
    final item = itemsByName[name.trim().toLowerCase()];
    if (item == null) {
      widget.onGoToItems?.call();
      return;
    }
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddItemScreen(
              itemId: item['id'],
              initialName: item['name'],
              initialUnit: item['unit'],
              initialPrice: item['price']?.toString(),
              initialCategory: item['category'],
              initialHsnCode: item['hsn_code'],
              initialGstRate:
                  item['gst_rate'] != null
                      ? (item['gst_rate'] as num).toDouble()
                      : null,
              initialStock: item['stock_quantity']?.toString(),
              initialThreshold: item['low_stock_threshold']?.toString(),
              initialBarcode: item['barcode'],
              initialCostPrice: item['cost_price']?.toString(),
              initialImageUrl: item['image_url'],
              initialPreferredSupplierId: item['preferred_supplier_id'],
            ),
      ),
    );
    if (result == true) fetchReports();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const SkeletonListLoader();
    if (errorMessage != null) return errorRetry(errorMessage!, fetchReports);
    return RefreshIndicator(
      onRefresh: fetchReports,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _groupHeader(
            context.t.tabOverview,
            subtitle: context.t.rpHeadline,
            icon: Icons.dashboard_outlined,
          ),
          _sectionCard(
            title: context.t.rpProfitThisMonth,
            icon: Icons.savings_outlined,
            color: Colors.green.shade700,
            onEdit: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExpensesScreen()),
              );
              if (mounted) fetchReports();
            },
            child:
                profitMonthly.isEmpty
                    ? Text(context.t.rpNoData)
                    : Builder(
                      builder: (context) {
                        final current = profitMonthly.first;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TweenAnimationBuilder<double>(
                              tween: Tween(
                                begin: 0,
                                end: (current['profit'] as num).toDouble(),
                              ),
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeOutCubic,
                              builder:
                                  (context, value, _) => Text(
                                    formatMoney(value),
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          current['profit'] >= 0
                                              ? Colors.green.shade700
                                              : Colors.red.shade700,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              context.t.rpBreakdown(
                                formatMoney(current['cogs']),
                                formatMoney(current['expenses']),
                                formatMoney(current['revenue']),
                              ),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            if (profitMonthly.length > 1) ...[
                              const SizedBox(height: 16),
                              _profitTrendChart(profitMonthly),
                            ],
                          ],
                        );
                      },
                    ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: context.t.rpSalesTax,
            icon: Icons.fact_check_outlined,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.rpSalesTaxFor(_currentMonthLabel),
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 10),
                GradientButton(
                  label: context.t.rpViewSalesTax,
                  icon: Icons.fact_check_outlined,
                  height: 44,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                GstReportScreen(month: _currentMonthKey),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _outstandingCard(),

          const SizedBox(height: 24),
          _groupHeader(
            context.t.rpQuickReports,
            subtitle: context.t.rpQuickSub,
            icon: Icons.bolt,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              _quickReportTile(
                icon: Icons.receipt,
                color: Colors.red.shade700,
                label: context.t.expensesTitle,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpensesScreen(),
                    ),
                  );
                  if (mounted) fetchReports();
                },
              ),
              _quickReportTile(
                icon: Icons.account_balance_wallet_outlined,
                color: Colors.red.shade700,
                label: context.t.duTitle,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DuesScreen()),
                  );
                  if (mounted) fetchReports();
                },
              ),
              _quickReportTile(
                icon: Icons.local_shipping_outlined,
                color: Theme.of(context).colorScheme.primary,
                label: context.t.sduTitle,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupplierDuesScreen(),
                    ),
                  );
                  if (mounted) fetchReports();
                },
              ),
              _quickReportTile(
                icon: Icons.warehouse_outlined,
                color: Theme.of(context).colorScheme.primary,
                label: context.t.svTitle,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StockValuationScreen(),
                      ),
                    ),
              ),
              _quickReportTile(
                icon: Icons.trending_up,
                color: Theme.of(context).colorScheme.primary,
                label: context.t.pbiTitle,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfitByItemScreen(),
                      ),
                    ),
              ),
              _quickReportTile(
                icon: Icons.receipt_long_outlined,
                color: Theme.of(context).colorScheme.primary,
                label: context.t.rpRateCard,
                onTap: openRateCard,
              ),
            ],
          ),

          const SizedBox(height: 24),
          _groupHeader(
            context.t.rpDetails,
            subtitle: context.t.rpDetailsSub,
            icon: Icons.list_alt_outlined,
          ),
          _sectionCard(
            title: context.t.rpOutstandingByCustomer,
            icon: Icons.people_outline,
            color: Colors.red.shade700,
            count: outstanding.isEmpty ? null : outstanding.length,
            expanded: _expandOutstanding,
            onToggle:
                () => setState(() => _expandOutstanding = !_expandOutstanding),
            child:
                outstanding.isEmpty
                    ? Text(context.t.rpNoOutstanding)
                    : _dividedRows(
                      outstanding
                          .map<Widget>(
                            (o) => Pressable(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: IconBadge(
                                  Icons.person_outline,
                                  Colors.red.shade700,
                                  size: 34,
                                ),
                                title: Text(
                                  context.partyName(o['customer_name']),
                                ),
                                trailing: Text(
                                  formatMoney(o['outstanding']),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red.shade700,
                                  ),
                                ),
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CustomerDetailScreen(
                                            customerId: o['customer_id'],
                                            customerName: o['customer_name'],
                                          ),
                                    ),
                                  );
                                  if (mounted) fetchReports();
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: context.t.rpMonthlyTotals,
            icon: Icons.calendar_month_outlined,
            color: Theme.of(context).colorScheme.primary,
            onEdit: widget.onGoToCustomers,
            count: monthly.isEmpty ? null : monthly.length,
            expanded: _expandMonthly,
            onToggle: () => setState(() => _expandMonthly = !_expandMonthly),
            child:
                monthly.isEmpty
                    ? Text(context.t.cdNoBills)
                    : _dividedRows(
                      monthly
                          .map<Widget>(
                            (m) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: IconBadge(
                                Icons.calendar_month_outlined,
                                Theme.of(context).colorScheme.primary,
                                size: 34,
                              ),
                              title: Text(m['month']),
                              trailing: Text(formatMoney(m['total'])),
                            ),
                          )
                          .toList(),
                    ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: context.t.rpMostSold,
            icon: Icons.leaderboard_outlined,
            color: Theme.of(context).colorScheme.primary,
            count: topItems.isEmpty ? null : topItems.length,
            expanded: _expandTopItems,
            onToggle: () => setState(() => _expandTopItems = !_expandTopItems),
            child:
                topItems.isEmpty
                    ? Text(context.t.rpNoItemsRecorded)
                    : _dividedRows(
                      topItems
                          .map<Widget>(
                            (i) => Pressable(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: IconBadge(
                                  Icons.sell_outlined,
                                  Theme.of(context).colorScheme.primary,
                                  size: 34,
                                ),
                                title: Text(i['item']),
                                trailing: Text('${i['count']}x'),
                                onTap: () => _editItemByName(i['item']),
                              ),
                            ),
                          )
                          .toList(),
                    ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: context.t.rpTopCustomers,
            icon: Icons.emoji_events_outlined,
            color: Theme.of(context).colorScheme.primary,
            count: topCustomers.isEmpty ? null : topCustomers.length,
            expanded: _expandTopCustomers,
            onToggle:
                () =>
                    setState(() => _expandTopCustomers = !_expandTopCustomers),
            child:
                topCustomers.isEmpty
                    ? Text(context.t.rpNoSalesRecorded)
                    : _dividedRows(
                      topCustomers
                          .map<Widget>(
                            (c) => Pressable(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: IconBadge(
                                  Icons.person_outline,
                                  Theme.of(context).colorScheme.primary,
                                  size: 34,
                                ),
                                title: Text(
                                  context.partyName(c['customer_name']),
                                ),
                                subtitle: Text(
                                  '${c['bill_count']} bill${c['bill_count'] == 1 ? '' : 's'}',
                                ),
                                trailing: Text(
                                  formatMoney((c['revenue'] as num)),
                                ),
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CustomerDetailScreen(
                                            customerId: c['customer_id'],
                                            customerName: c['customer_name'],
                                          ),
                                    ),
                                  );
                                  if (mounted) fetchReports();
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _profitTrendChart(List<dynamic> profitMonthly) {
    final months = profitMonthly.take(6).toList().reversed.toList();
    final maxAbs = months
        .map((m) => (m['profit'] as num).abs())
        .fold(0.0, (a, b) => b > a ? b.toDouble() : a);
    const chartHeight = 80.0;
    return SizedBox(
      height: chartHeight + 34,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < months.length; i++)
            Builder(
              builder: (context) {
                final m = months[i];
                final targetHeight =
                    maxAbs == 0
                        ? 2.0
                        : (((m['profit'] as num).abs() / maxAbs) * chartHeight)
                            .clamp(2.0, chartHeight);
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: chartHeight,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: targetHeight),
                              duration: Duration(milliseconds: 400 + i * 80),
                              curve: Curves.easeOutCubic,
                              builder:
                                  (context, height, _) => Container(
                                    height: height,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors:
                                            (m['profit'] as num) >= 0
                                                ? [
                                                  Colors.green.shade300,
                                                  Colors.green.shade600,
                                                ]
                                                : [
                                                  Colors.red.shade300,
                                                  Colors.red.shade600,
                                                ],
                                      ),
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(4),
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _monthLabel(m['month'] as String),
                          style: TextStyle(
                            fontSize: 11,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  String _monthLabel(String yyyyMm) {
    final parts = yyyyMm.split('-');
    if (parts.length != 2) return yyyyMm;
    final m = int.tryParse(parts[1]);
    if (m == null || m < 1 || m > 12) return yyyyMm;
    return shortMonth(DateTime(2000, m));
  }

  Widget _groupHeader(String title, {String? subtitle, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            IconBadge(icon, Theme.of(context).colorScheme.primary, size: 26),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _outstandingCard() {
    final owed = totalOutstanding > 0;
    final color = owed ? Colors.red.shade700 : Colors.green.shade700;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppStyle.tint(context, color, light: 0.08, dark: 0.16),
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppStyle.raisedShadow(context, strength: 0.7),
      ),
      child: Row(
        children: [
          IconBadge(
            owed ? Icons.warning_amber_rounded : Icons.check_circle_outline,
            color,
            size: 34,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.rpTotalOutstanding,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 4),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: totalOutstanding),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutCubic,
                  builder:
                      (context, value, _) => Text(
                        formatMoney(value),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                ),
              ],
            ),
          ),
          if (widget.onGoToCustomers != null)
            AppIconButton(
              icon: const Icon(Icons.chevron_right),
              tooltip: context.t.rpViewCustomers,
              onPressed: widget.onGoToCustomers,
            ),
        ],
      ),
    );
  }

  Widget _quickReportTile({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return Pressable(
      child: GestureDetector(
        onTap: onTap,
        child: AppCard(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconBadge(icon, color, size: 38),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
    VoidCallback? onEdit,
    int? count,
    bool? expanded,
    VoidCallback? onToggle,
  }) {
    final header = Row(
      children: [
        IconBadge(icon, color, size: 34),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        if (count != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppStyle.tint(context, color),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 6),
        ],
        if (onEdit != null)
          AppIconButton(
            icon: const Icon(Icons.edit, size: 18),
            onPressed: onEdit,
            visualDensity: VisualDensity.compact,
            tooltip: context.t.edit,
          ),
        if (onToggle != null)
          Icon(
            (expanded ?? true) ? Icons.expand_less : Icons.expand_more,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
      ],
    );

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          onToggle == null
              ? header
              : InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  HapticFeedback.selectionClick();
                  onToggle();
                },
                child: header,
              ),
          if (expanded ?? true) ...[const SizedBox(height: 12), child],
        ],
      ),
    );
  }

  Widget _dividedRows(List<Widget> rows) {
    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          rows[i],
          if (i != rows.length - 1)
            Divider(height: 1, color: AppStyle.borderColor(context)),
        ],
      ],
    );
  }
}
