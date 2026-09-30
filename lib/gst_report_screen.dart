import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart' show HapticFeedback, PlatformException;
import 'api.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'config.dart';
import 'save_to_downloads.dart' show saveToDownloads;
import 'widgets/app_style.dart';
import 'widgets/money.dart';
import 'date_locale.dart';

class GstReportScreen extends StatefulWidget {
  final String month;

  const GstReportScreen({super.key, required this.month});

  @override
  State<GstReportScreen> createState() => _GstReportScreenState();
}

class _GstReportScreenState extends State<GstReportScreen> {
  late DateTime _month;
  bool _loading = true;
  bool _busy = false;
  String? _error;
  Map<String, dynamic>? _salesTax;
  Map<String, dynamic>? _salesTaxSummary;

  @override
  void initState() {
    super.initState();
    final parts = widget.month.split('-');
    _month = DateTime(int.parse(parts[0]), int.parse(parts[1]));
    _fetch();
  }

  String get _monthKey =>
      '${_month.year.toString().padLeft(4, '0')}-'
      '${_month.month.toString().padLeft(2, '0')}';

  String get _monthLabel => monthYear(_month);

  Future<void> _fetch() async {
    final t = context.t;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final results = await Future.wait([
        http.get(
          Uri.parse('${AppConfig.baseUrl}/reports/sales-tax?month=$_monthKey'),
        ),
        http.get(
          Uri.parse(
            '${AppConfig.baseUrl}/reports/sales-tax-summary?month=$_monthKey',
          ),
        ),
      ]);
      if (results[0].statusCode != 200 || results[1].statusCode != 200) {
        throw Exception(
          t.gstServerReturned(
            '${results[0].statusCode}',
            '${results[1].statusCode}',
          ),
        );
      }
      if (!mounted) return;
      setState(() {
        _salesTax = jsonDecode(results[0].body) as Map<String, dynamic>;
        _salesTaxSummary = jsonDecode(results[1].body) as Map<String, dynamic>;
        _loading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = context.t.gstCouldNotLoad('$e');
          _loading = false;
        });
      }
    }
  }

  void _changeMonth(int delta) {
    HapticFeedback.selectionClick();
    setState(() => _month = DateTime(_month.year, _month.month + delta));
    _fetch();
  }

  Future<void> _export(String path, String filename) async {
    setState(() => _busy = true);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}$path'));
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
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsBytes(response.bodyBytes);
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

  Future<void> _saveExport(String path, String filename) async {
    setState(() => _busy = true);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}$path'));
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

  String _fmt(num? v) => v == null ? '-' : formatMoney(v, decimals: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.gstTitle),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                AppIconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _loading ? null : () => _changeMonth(-1),
                  tooltip: context.t.previousMonth,
                ),
                Expanded(
                  child: Text(
                    _monthLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppIconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _loading ? null : () => _changeMonth(1),
                  tooltip: context.t.nextMonth,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) return const SkeletonListLoader();
    if (_error != null) return errorRetry(_error!, _fetch);
    return RefreshIndicator(
      onRefresh: _fetch,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildGstr1Card(),
          const SizedBox(height: 16),
          _buildGstr3bCard(),
        ],
      ),
    );
  }

  Widget _buildGstr1Card() {
    final data = _salesTax!;
    final s = data['summary'] as Map<String, dynamic>;
    final invoices = (data['invoices'] as List).cast<Map<String, dynamic>>();
    final hsnSummary =
        (data['hsn_summary'] as List).cast<Map<String, dynamic>>();

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBadge(
                Icons.receipt_long_outlined,
                Theme.of(context).colorScheme.primary,
                size: 34,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  context.t.gstOutwardDetail,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _statChip(context.t.gstTaxable, s['total_taxable'] as num),
              _statChip(context.t.gstTax, s['total_tax'] as num),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${s['b2b_count']} B2B  ·  ${s['b2c_count']} B2C  ·  '
            'Total ${_fmt(s['total_value'])}',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
          ),
          const SizedBox(height: 16),

          if (invoices.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(context.t.gstNoBills),
            )
          else ...[
            Text(
              context.t.gstHsn,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            ),
            const SizedBox(height: 4),
            ...hsnSummary.map((h) => _hsnRow(h)),
            const SizedBox(height: 8),

            ExpansionTile(
              title: Text(
                context.t.gstInvoiceWise,
                style: TextStyle(fontSize: 14),
              ),
              children: invoices.map((i) => _invoiceRow(i)).toList(),
            ),
          ],

          const SizedBox(height: 12),
          _exportButtonRow(
            onSave:
                () => _saveExport(
                  '/reports/sales-tax.csv?month=$_monthKey',
                  'sales_tax_$_monthKey.csv',
                ),
            onShare:
                () => _export(
                  '/reports/sales-tax.csv?month=$_monthKey',
                  'sales_tax_$_monthKey.csv',
                ),
          ),
        ],
      ),
    );
  }

  Widget _statChip(String label, num value) {
    return Expanded(
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value.toDouble()),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            builder:
                (context, v, child) => Text(
                  _fmt(v),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _hsnRow(Map<String, dynamic> h) {
    final tax = h['tax'] as num;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${h['hsn_code']}  ·  ${h['gst_rate']}%',
                  style: const TextStyle(fontSize: 13),
                ),
                Text(
                  h['description'] ?? '',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _fmt(h['total_taxable']),
                style: const TextStyle(fontSize: 13),
              ),
              Text(
                context.t.gstAmount(_fmt(tax)),
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _invoiceRow(Map<String, dynamic> i) {
    final tax = i['tax'] as num;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  i['customer_name'] ?? context.t.unknownName,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Builder(
                builder: (context) {
                  final color =
                      i['type'] == 'B2B'
                          ? Colors.blue.shade700
                          : Colors.grey.shade700;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: AppStyle.tint(context, color),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      i['type'] ?? '',
                      style: TextStyle(fontSize: 11, color: color),
                    ),
                  );
                },
              ),
            ],
          ),
          Text(
            '${i['invoice_no'] ?? ''}  ·  ${i['date'] ?? ''}'
            '${(i['customer_strn'] as String? ?? '').isNotEmpty ? '  ·  ${i['customer_strn']}' : ''}',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
          ),
          Text(
            context.t.gstItemLine(
              _fmt(tax),
              _fmt(i['taxable_value']),
              _fmt(i['total']),
            ),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildGstr3bCard() {
    final data = _salesTaxSummary!;
    final o = data['outward'] as Map<String, dynamic>;
    final itc = data['itc'] as Map<String, dynamic>;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBadge(
                Icons.summarize_outlined,
                Theme.of(context).colorScheme.primary,
                size: 34,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  context.t.gstMonthly,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            context.t.gstOutwardTaxable,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 12),
          _row(context.t.gstTaxableValue, _fmt(o['taxable_value'])),
          _row(context.t.gstTotalTax, _fmt(o['total_tax']), bold: true),
          const Divider(height: 16),
          Text(
            context.t.gstItc,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 4),
          _row(context.t.gstTotalItc, _fmt(itc['total_itc']), bold: true),
          const Divider(height: 16),
          _row(context.t.gstExempt, _fmt(data['exempt']['taxable_value'])),
          const Divider(height: 16),
          _row(context.t.gstNetPayable, _fmt(data['net_payable']), bold: true),
          const SizedBox(height: 12),
          _exportButtonRow(
            onSave:
                () => _saveExport(
                  '/reports/sales-tax-summary.csv?month=$_monthKey',
                  'sales_tax_summary_$_monthKey.csv',
                ),
            onShare:
                () => _export(
                  '/reports/sales-tax-summary.csv?month=$_monthKey',
                  'sales_tax_summary_$_monthKey.csv',
                ),
          ),
        ],
      ),
    );
  }

  Widget _exportButtonRow({
    required VoidCallback onSave,
    required VoidCallback onShare,
  }) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _busy ? null : onSave,
            icon: const Icon(Icons.download, size: 18),
            label: Text(context.t.gstSave),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _busy ? null : onShare,
            icon: const Icon(Icons.ios_share, size: 18),
            label: Text(context.t.abShare),
          ),
        ),
      ],
    );
  }

  Widget _row(String label, String value, {bool bold = false}) {
    final style = TextStyle(
      fontSize: 13,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value, style: style)],
      ),
    );
  }
}
