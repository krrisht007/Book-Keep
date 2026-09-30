import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class ReconciliationScreen extends StatefulWidget {
  const ReconciliationScreen({super.key});

  @override
  State<ReconciliationScreen> createState() => _ReconciliationScreenState();
}

class _ReconciliationScreenState extends State<ReconciliationScreen> {
  double expectedCash = 0;
  Map<String, double> collectedByMethod = {};
  bool isLoading = true;
  String? errorMessage;
  final _countedController = TextEditingController();
  double? difference;

  String _methodLabel(String method) {
    final t = context.t;
    return switch (method) {
      'cash' => t.abCash,
      'bank_transfer' => t.abBankTransfer,
      'cheque' => t.abCheque,
      _ => method,
    };
  }

  Map<String, double> get _otherMethods =>
      Map.fromEntries(collectedByMethod.entries.where((e) => e.key != 'cash'));

  @override
  void initState() {
    super.initState();
    fetchExpectedCash();
  }

  Future<void> fetchExpectedCash() async {
    setState(() => isLoading = true);
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/cash-today'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          expectedCash = (data['expected_cash'] as num).toDouble();
          collectedByMethod =
              (data['collected_by_method'] as Map<String, dynamic>? ?? {}).map(
                (k, v) => MapEntry(k, (v as num).toDouble()),
              );
          isLoading = false;
          errorMessage = null;
        });
      } else {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = context.t.couldNotConnect('$e');
          isLoading = false;
        });
      }
    }
  }

  void calculateDifference() {
    final counted = double.tryParse(_countedController.text.trim());
    if (counted == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.rcValidAmount)));
      return;
    }
    setState(() => difference = counted - expectedCash);
  }

  @override
  void dispose() {
    _countedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.dailyCashReconciliation),
      body:
          isLoading
              ? const SkeletonListLoader()
              : errorMessage != null
              ? errorRetry(errorMessage!, fetchExpectedCash)
              : Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.t.rcExpected,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              formatMoney(expectedCash),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_otherMethods.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        AppCard(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.t.rcAlsoCollected,
                                style: TextStyle(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 8),
                              for (final entry in _otherMethods.entries)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_methodLabel(entry.key)),
                                      Text(
                                        formatMoney(entry.value),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      TextField(
                        controller: _countedController,
                        decoration: InputDecoration(
                          labelText: context.t.rcCounted,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      GradientButton(
                        label: context.t.rcCompare,
                        onPressed: calculateDifference,
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOut,
                        alignment: Alignment.topCenter,
                        child:
                            difference == null
                                ? const SizedBox(width: double.infinity)
                                : Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: AppStyle.tint(
                                        context,
                                        difference == 0
                                            ? Colors.green
                                            : Colors.red,
                                        light: 0.08,
                                        dark: 0.16,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: AppStyle.raisedShadow(
                                        context,
                                        strength: 0.7,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          difference == 0
                                              ? Icons.check_circle
                                              : Icons.warning_amber_rounded,
                                          color:
                                              difference == 0
                                                  ? Colors.green.shade700
                                                  : Colors.red.shade700,
                                          size: 32,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          difference == 0
                                              ? context.t.rcMatches
                                              : difference! > 0
                                              ? context.t.rcExtra(
                                                formatMoney(difference!),
                                              )
                                              : context.t.rcMissing(
                                                formatMoney((-difference!)),
                                              ),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
