import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;

import 'config.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

Future<void> showCollectPaymentSheet({
  required BuildContext context,
  required String customerId,
  required String customerName,
  required double outstanding,
  VoidCallback? onCollected,
}) async {
  if (outstanding <= 0) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(context.t.cpNoOutstanding)));
    return;
  }

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder:
        (ctx) => _CollectPaymentSheet(
          customerId: customerId,
          customerName: customerName,
          outstanding: outstanding,
          onCollected: onCollected,
        ),
  );
}

class _CollectPaymentSheet extends StatefulWidget {
  final String customerId;
  final String customerName;
  final double outstanding;
  final VoidCallback? onCollected;

  const _CollectPaymentSheet({
    required this.customerId,
    required this.customerName,
    required this.outstanding,
    this.onCollected,
  });

  @override
  State<_CollectPaymentSheet> createState() => _CollectPaymentSheetState();
}

class _CollectPaymentSheetState extends State<_CollectPaymentSheet> {
  late final _amountController = TextEditingController(
    text: widget.outstanding.toStringAsFixed(0),
  );
  bool isSaving = false;
  String? errorMessage;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _collect() async {
    final t = context.t;
    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) {
      setState(() => errorMessage = context.t.cpValidAmount);
      return;
    }
    if (amount > widget.outstanding + 0.01) {
      setState(
        () =>
            errorMessage = context.t.cpExceeds(
              formatMoney(widget.outstanding, decimals: 2),
            ),
      );
      return;
    }
    setState(() {
      isSaving = true;
      errorMessage = null;
    });
    try {
      final response = await http.post(
        Uri.parse(
          '${AppConfig.baseUrl}/customers/${widget.customerId}/collect-payment',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'amount': amount}),
      );
      if (response.statusCode == 200) {
        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.t.cpCollected(
                  formatMoney(amount, decimals: 2),
                  context.partyName(widget.customerName),
                ),
              ),
            ),
          );
          widget.onCollected?.call();
        }
      } else {
        String detail = t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        if (mounted) {
          setState(() {
            errorMessage = detail;
            isSaving = false;
          });
        }
      }
    } catch (e) {
      await LocalDb.instance.enqueueWrite(
        method: 'POST',
        path: '/customers/${widget.customerId}/collect-payment',
        label: t.qPaymentCollected(
          formatMoney(amount, decimals: 2),
          widget.customerName,
        ),
        payload: {'amount': amount},
      );
      await SyncService.instance.refreshPendingCount();
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.cpOfflineSaved)));
        widget.onCollected?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.payments_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  context.t.cdCollectPayment,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                AppIconButton(
                  icon: const Icon(Icons.close),
                  tooltip: context.t.close,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              context.t.cpOwes(
                formatMoney(widget.outstanding, decimals: 2),
                context.partyName(widget.customerName),
              ),
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: context.t.cpAmountLabel,
                border: const OutlineInputBorder(),
                errorText: errorMessage,
              ),
            ),
            const SizedBox(height: 16),
            GradientButton(
              label: context.t.cpCollect,
              loading: isSaving,
              onPressed: isSaving ? null : _collect,
            ),
          ],
        ),
      ),
    );
  }
}
