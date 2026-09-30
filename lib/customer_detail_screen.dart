import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'add_bill_screen.dart';
import 'collect_payment.dart';
import 'config.dart';
import 'payment_reminder.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/document_sheet.dart';
import 'widgets/paid_stamp_overlay.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'widgets/money.dart';

class CustomerDetailScreen extends StatefulWidget {
  final String customerId;
  final String customerName;
  final String? customerPhone;
  final double? customerCreditLimit;

  const CustomerDetailScreen({
    super.key,
    required this.customerId,
    required this.customerName,
    this.customerPhone,
    this.customerCreditLimit,
  });

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  List<dynamic> bills = [];
  bool isLoading = true;
  String? errorMessage;
  late double? _creditLimit = widget.customerCreditLimit;
  String? _priceTier;
  String? _justPaidBillId;

  @override
  void initState() {
    super.initState();
    fetchBills();
    _fetchCreditLimit();
  }

  Future<void> _fetchCreditLimit() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/customers'),
      );
      if (!mounted || response.statusCode != 200) return;
      final list = jsonDecode(response.body) as List;
      final match = list.firstWhere(
        (c) => c['id'] == widget.customerId,
        orElse: () => null,
      );
      final limit = match?['credit_limit'];
      final tier = match?['price_tier'] as String?;
      if (limit != null || tier != null) {
        setState(() {
          if (limit != null) _creditLimit = (limit as num).toDouble();
          _priceTier = tier;
        });
      }
    } catch (_) {}
  }

  Future<void> fetchBills() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/customers/${widget.customerId}/bills/v2',
        ),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          bills = jsonDecode(response.body);
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

  Future<void> togglePaidStatus(dynamic bill) async {
    final t = context.t;
    final newStatus = bill['payment_status'] == 'paid' ? 'unpaid' : 'paid';
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.cdUpdateStatusTitle),
            content: Text(
              newStatus == 'paid'
                  ? context.t.cdMarkPaidQ
                  : context.t.cdMarkUnpaidQ,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.t.cdConfirm),
              ),
            ],
          ),
    );

    if (confirm != true) return;

    setState(() => _justPaidBillId = null);

    final newAmountPaid = newStatus == 'paid' ? bill['amount'] : 0;
    final body = jsonEncode({
      'payment_status': newStatus,
      'amount_paid': newAmountPaid,
    });

    try {
      final response = await http.patch(
        Uri.parse('${AppConfig.baseUrl}/bills/${bill['id']}'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        if (newStatus == 'paid') {
          setState(() => _justPaidBillId = bill['id']);
        }
        fetchBills();
      } else if (mounted) {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotUpdate(detail))),
        );
        fetchBills();
      }
    } catch (e) {
      await LocalDb.instance.enqueueWrite(
        method: 'PATCH',
        path: '/bills/${bill['id']}',
        label: t.qPaymentUpdate(formatMoney(bill['amount'])),
        payload: jsonDecode(body),
      );
      await SyncService.instance.refreshPendingCount();
      setState(() {
        bill['payment_status'] = newStatus;
        bill['amount_paid'] = newAmountPaid;
        if (newStatus == 'paid') _justPaidBillId = bill['id'];
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.cdOfflineChangeSaved)));
      }
    }
  }

  Future<void> convertQuote(dynamic bill) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.cdConvertTitle),
            content: Text(context.t.cdConvertBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.t.cdConvert),
              ),
            ],
          ),
    );
    if (confirm != true) return;

    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/bills/v2/${bill['id']}/convert'),
      );
      if (response.statusCode == 200) {
        fetchBills();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.t.cdCouldNotConvert('${response.statusCode}'),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotConvert('$e'))),
        );
      }
    }
  }

  Future<void> returnBill(dynamic bill) async {
    final lineItems = (bill['line_items'] as List<dynamic>? ?? const []);
    if (lineItems.isEmpty) return;

    final quantities = <String, double>{
      for (final li in lineItems)
        li['id'] as String: (li['quantity'] as num).toDouble(),
    };

    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            double total() => lineItems.fold<double>(0, (sum, li) {
              final qty = quantities[li['id'] as String] ?? 0;
              return sum + qty * (li['unit_price'] as num).toDouble();
            });

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.assignment_return_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.t.cdReturnItems,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      AppIconButton(
                        icon: const Icon(Icons.close),
                        tooltip: context.t.close,
                        onPressed: () => Navigator.pop(context, false),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.t.cdReturnHint,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 360),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: lineItems.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, i) {
                        final li = lineItems[i];
                        final id = li['id'] as String;
                        final maxQty = (li['quantity'] as num).toDouble();
                        final qty = quantities[id] ?? 0;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  context.itemName(
                                    li['item_name'] as String? ?? '',
                                  ),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              AppIconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                tooltip: context.t.cdDecreaseQty,
                                onPressed:
                                    qty <= 0
                                        ? null
                                        : () => setSheetState(
                                          () => quantities[id] = qty - 1,
                                        ),
                              ),
                              SizedBox(
                                width: 64,
                                child: Text(
                                  '${qty.toStringAsFixed(qty % 1 == 0 ? 0 : 1)} / ${maxQty.toStringAsFixed(maxQty % 1 == 0 ? 0 : 1)}',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              AppIconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                tooltip: context.t.cdIncreaseQty,
                                onPressed:
                                    qty >= maxQty
                                        ? null
                                        : () => setSheetState(
                                          () => quantities[id] = qty + 1,
                                        ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.t.cdCreditTotal,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        formatMoney(total(), decimals: 2),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GradientButton(
                    label: context.t.cdReturnSelected,
                    onPressed:
                        total() <= 0
                            ? null
                            : () => Navigator.pop(context, true),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    if (confirmed != true) return;

    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/bills/${bill['id']}/return'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'line_items': [
            for (final entry in quantities.entries)
              if (entry.value > 0)
                {'bill_item_id': entry.key, 'quantity': entry.value},
          ],
        }),
      );
      if (response.statusCode == 200) {
        fetchBills();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.cdCouldNotReturn('${response.statusCode}')),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotReturn('$e'))),
        );
      }
    }
  }

  Future<void> voidBill(dynamic bill) async {
    final result = await showDialog<_VoidBillResult>(
      context: context,
      builder: (context) => const _VoidBillDialog(),
    );
    if (result == null || !result.confirmed) return;
    final reason = result.reason;

    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/bills/${bill['id']}/void'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'reason': reason.isEmpty ? null : reason}),
      );
      if (response.statusCode == 200) {
        fetchBills();
      } else if (mounted) {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotVoid(detail))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.cdCouldNotVoid('$e'))));
      }
    }
  }

  Future<void> repeatLastBill() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/customers/${widget.customerId}/last-bill',
        ),
      );

      if (response.statusCode == 404) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.t.cdNoPreviousBill)));
        }
        return;
      }

      if (response.statusCode == 200) {
        final lastBill = jsonDecode(response.body);
        if (mounted) {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AddBillScreen(
                    customerId: widget.customerId,
                    initialLineItems: lastBill['line_items'],
                    customerCreditLimit: _creditLimit,
                    customerPriceTier: _priceTier,
                    customerCurrentOutstanding: totalBilled - totalPaid,
                  ),
            ),
          );
          if (result == true) fetchBills();
        }
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.serverError(response.statusCode))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotLoadLast('$e'))),
        );
      }
    }
  }

  Future<void> sendWhatsAppReminder(String? phone) async {
    await showPaymentReminderSheet(
      context: context,
      customerName: widget.customerName,
      phone: phone,
      outstanding: totalBilled - totalPaid,
    );
  }

  Future<void> showInvoice(dynamic bill) => fetchAndPrintPdf(
    context,
    url:
        '${AppConfig.baseUrl}/bills/${bill['id']}/invoice?language=${Localizations.localeOf(context).languageCode}',
    errorLabel: context.t.lblInvoice,
  );

  Future<void> emailInvoice(dynamic bill) async {
    try {
      final response = await http.post(
        Uri.parse(
          '${AppConfig.baseUrl}/bills/${bill['id']}/email?language=${Localizations.localeOf(context).languageCode}',
        ),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.cdInvoiceEmailed)));
      } else {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotEmailInvoice(detail))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotEmailInvoice('$e'))),
        );
      }
    }
  }

  Future<void> showLedger() => fetchAndPrintPdf(
    context,
    url:
        '${AppConfig.baseUrl}/customers/${widget.customerId}/ledger?language=${Localizations.localeOf(context).languageCode}',
    errorLabel: context.t.lblLedger,
  );

  Future<void> emailStatement() async {
    try {
      final response = await http.post(
        Uri.parse(
          '${AppConfig.baseUrl}/customers/${widget.customerId}/email-ledger?language=${Localizations.localeOf(context).languageCode}',
        ),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.cdStatementEmailed)));
      } else {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotEmailStatement(detail))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotEmailStatement('$e'))),
        );
      }
    }
  }

  Iterable<dynamic> get _realBills => bills.where((b) => b['is_quote'] != true);

  double get totalBilled =>
      _realBills.fold(0.0, (sum, b) => sum + (b['amount'] as num));

  double get totalPaid =>
      _realBills.fold(0.0, (sum, b) => sum + (b['amount_paid'] as num));

  Future<void> _deleteBill(dynamic bill) async {
    final messenger = ScaffoldMessenger.of(context);
    final confirm = await confirmDelete(
      context,
      title: context.t.cdDeleteBillTitle,
      message: context.t.itmCannotUndo,
    );
    if (!confirm) return;
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/bills/${bill['id']}'),
      );
      if (response.statusCode != 200 && mounted) {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        messenger.showSnackBar(
          SnackBar(content: Text(context.t.couldNotDeleteDetail(detail))),
        );
      }
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(context.t.couldNotDeleteOffline)),
        );
      }
    }
    fetchBills();
  }

  bool _alreadyReturned(dynamic bill) =>
      bills.any((b) => b['return_of_bill_id'] == bill['id']);

  Future<void> _showBillDetails(dynamic bill) {
    final amount = (bill['amount'] as num?) ?? 0;
    final isVoided = bill['is_voided'] == true;
    final isReturn = bill['return_of_bill_id'] != null;
    final isQuote = bill['is_quote'] == true;
    final isPaid = bill['payment_status'] == 'paid';
    final reason = bill['void_reason'] as String?;
    final (label, color) =
        isVoided
            ? (context.t.cdBillVoided, Colors.grey.shade600)
            : isReturn
            ? (context.t.cdBillReturn, Colors.blueGrey.shade600)
            : isQuote
            ? (context.t.cdBillQuote, Colors.purple.shade600)
            : isPaid
            ? (context.t.cdBillPaid, Colors.green.shade600)
            : _partiallyPaid(bill)
            ? (context.t.cdBillPartial, Colors.amber.shade700)
            : (context.t.cdBillUnpaid, Colors.red.shade600);
    return showDocumentSheet(
      context,
      title: context.t.cdBill,
      amount: amount,
      date: bill['date'].toString().split('T')[0],
      statusLabel: label,
      statusColor: color,
      paid:
          (isVoided || isReturn || isQuote)
              ? null
              : (isPaid ? amount : (bill['amount_paid'] as num?) ?? 0),
      discount: (bill['discount_amount'] as num?) ?? 0,
      notes: [
        if (isVoided && reason?.isNotEmpty == true)
          (
            text: context.t.cdVoidedReason(reason ?? ""),
            color: Colors.red.shade700,
          ),
      ],
      lines: bill['line_items'] as List<dynamic>? ?? const [],
    );
  }

  List<PopupMenuEntry<VoidCallback>> _billActionsMenuItems(
    BuildContext context,
    dynamic bill,
  ) {
    final isQuote = bill['is_quote'] == true;
    final isReturn = bill['return_of_bill_id'] != null;
    final isVoided = bill['is_voided'] == true;
    final primary = Theme.of(context).colorScheme.primary;

    return [
      if (isQuote)
        PopupMenuItem(
          value: () => convertQuote(bill),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(Icons.published_with_changes, primary, size: 30),
            title: Text(
              context.t.cdConvertTitle,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      if (!isReturn && !isQuote && !isVoided) ...[
        PopupMenuItem(
          value: () => showInvoice(bill),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(
              Icons.picture_as_pdf_outlined,
              primary,
              size: 30,
            ),
            title: Text(
              context.t.cdViewInvoice,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        PopupMenuItem(
          value: () => emailInvoice(bill),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(Icons.email_outlined, primary, size: 30),
            title: Text(
              context.t.cdEmailInvoice,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
      if (!isReturn && !isVoided)
        PopupMenuItem(
          value: () => _editBill(bill, isQuote: isQuote),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(Icons.edit_outlined, primary, size: 30),
            title: Text(
              context.t.cdEditBill,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      if (!isQuote && !isReturn && !isVoided && !_alreadyReturned(bill)) ...[
        PopupMenuItem(
          value: () => returnBill(bill),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(
              Icons.assignment_return_outlined,
              primary,
              size: 30,
            ),
            title: Text(
              context.t.cdReturnBill,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        PopupMenuItem(
          value: () => voidBill(bill),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(Icons.block_outlined, primary, size: 30),
            title: Text(
              context.t.cdVoidBill,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
      const PopupMenuDivider(height: 1),
      PopupMenuItem(
        value: () => _deleteBill(bill),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: IconBadge(
            Icons.delete_outline,
            Colors.red.shade700,
            size: 30,
          ),
          title: Text(
            context.t.cdDeleteBillTitle,
            style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ];
  }

  Future<void> _editBill(dynamic bill, {required bool isQuote}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddBillScreen(
              customerId: widget.customerId,
              billId: bill['id'],
              initialLineItems: bill['line_items'],
              initialStatus: bill['payment_status'],
              initialIsQuote: isQuote,
              initialDiscount: (bill['discount_amount'] as num?)?.toDouble(),
              customerCreditLimit: _creditLimit,
              customerPriceTier: _priceTier,
              customerCurrentOutstanding:
                  isQuote
                      ? (totalBilled - totalPaid)
                      : (totalBilled - totalPaid) -
                          ((bill['amount'] as num? ?? 0) -
                              (bill['amount_paid'] as num? ?? 0)),
            ),
      ),
    );
    if (result == true) fetchBills();
  }

  bool _partiallyPaid(dynamic bill) {
    final paid = (bill['amount_paid'] as num?) ?? 0;
    final amount = (bill['amount'] as num?) ?? 0;
    return paid > 0 && paid < amount;
  }

  String itemsSummary(dynamic bill) {
    final lineItems = bill['line_items'] as List<dynamic>? ?? [];
    if (lineItems.isEmpty) return context.t.cdNoItems;
    return lineItems
        .map((li) => '${li['item_name']} x${li['quantity']}')
        .join(', ');
  }

  List<Widget> _titleBarActions(BuildContext context) {
    final specs = [
      (
        icon: Icons.replay,
        tooltip: context.t.cdRepeatLast,
        onPressed: repeatLastBill,
      ),
      (
        icon: Icons.receipt_long_outlined,
        tooltip: context.t.cdLedgerPdf,
        onPressed: showLedger,
      ),
      (
        icon: Icons.email_outlined,
        tooltip: context.t.cdEmailStatement,
        onPressed: emailStatement,
      ),
      (
        icon: Icons.payments_outlined,
        tooltip: context.t.cdCollectPayment,
        onPressed:
            () => showCollectPaymentSheet(
              context: context,
              customerId: widget.customerId,
              customerName: widget.customerName,
              outstanding: totalBilled - totalPaid,
              onCollected: fetchBills,
            ),
      ),
      (
        icon: Icons.chat,
        tooltip: context.t.cdSendReminder,
        onPressed: () => sendWhatsAppReminder(widget.customerPhone),
      ),
    ];
    const inlineLimit = 2;
    final overflow = specs.skip(inlineLimit).toList();
    return [
      for (final s in specs.take(inlineLimit))
        AppIconButton(
          icon: Icon(s.icon),
          tooltip: s.tooltip,
          onPressed: s.onPressed,
        ),
      PopupMenuButton<int>(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        onSelected: (i) => overflow[i].onPressed(),
        itemBuilder: (context) {
          final onSurface = Theme.of(context).colorScheme.onSurface;
          return [
            for (var i = 0; i < overflow.length; i++)
              PopupMenuItem(
                value: i,
                child: Row(
                  children: [
                    Icon(overflow[i].icon, size: 20, color: onSurface),
                    const SizedBox(width: 12),
                    Text(overflow[i].tooltip),
                  ],
                ),
              ),
          ];
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final outstanding = totalBilled - totalPaid;

    return Scaffold(
      appBar: FloatingAppBar(
        title: context.partyName(widget.customerName),
        actions: _titleBarActions(context),
      ),
      body:
          isLoading
              ? const SkeletonListLoader()
              : errorMessage != null
              ? errorRetry(errorMessage!, fetchBills)
              : AdaptiveColumn(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: AppCard(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 14,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: AppStyle.highContrastFill(
                                  context,
                                  AppStyle.colorForKey(widget.customerId),
                                ),
                                child: Text(
                                  context
                                          .partyName(widget.customerName)
                                          .trim()
                                          .isNotEmpty
                                      ? context
                                          .partyName(widget.customerName)
                                          .trim()[0]
                                          .toUpperCase()
                                      : '?',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      context.partyName(widget.customerName),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    if (widget.customerPhone != null &&
                                        widget.customerPhone!
                                            .trim()
                                            .isNotEmpty) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        widget.customerPhone!,
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _summaryColumn(
                                context,
                                context.t.cdTotalBilled,
                                totalBilled,
                                Theme.of(context).colorScheme.primary,
                              ),
                              _summaryColumn(
                                context,
                                context.t.cdPaid,
                                totalPaid,
                                Colors.green.shade700,
                              ),
                              _summaryColumn(
                                context,
                                context.t.outstanding,
                                outstanding,
                                Colors.red.shade700,
                              ),
                            ],
                          ),
                          if (_creditLimit != null && _creditLimit! > 0) ...[
                            const SizedBox(height: 14),
                            _creditBar(outstanding, _creditLimit!),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: fetchBills,
                      child:
                          bills.isEmpty
                              ? ListView(
                                children: [
                                  SizedBox(height: 120),
                                  Center(child: Text(context.t.cdNoBills)),
                                ],
                              )
                              : ListView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  12,
                                  0,
                                  12,
                                  12,
                                ),
                                itemCount: bills.length,
                                itemBuilder: (context, index) {
                                  final bill = bills[index];
                                  final paid = bill['payment_status'] == 'paid';
                                  final isQuote = bill['is_quote'] == true;
                                  final isReturn =
                                      bill['return_of_bill_id'] != null;
                                  final isVoided = bill['is_voided'] == true;
                                  final canEdit = !isReturn && !isVoided;
                                  return Dismissible(
                                    key: Key(bill['id']),
                                    direction:
                                        canEdit
                                            ? DismissDirection.horizontal
                                            : DismissDirection.endToStart,
                                    background: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(left: 22),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                    secondaryBackground: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade400,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 22),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                    confirmDismiss: (direction) async {
                                      if (direction ==
                                          DismissDirection.startToEnd) {
                                        await _editBill(bill, isQuote: isQuote);
                                        return false;
                                      }
                                      return confirmDelete(
                                        context,
                                        title: context.t.cdDeleteBillTitle,
                                        message: context.t.itmCannotUndo,
                                      );
                                    },
                                    onDismissed: (direction) async {
                                      final messenger = ScaffoldMessenger.of(
                                        context,
                                      );
                                      final t = context.t;
                                      try {
                                        final response = await http.delete(
                                          Uri.parse(
                                            '${AppConfig.baseUrl}/bills/${bill['id']}',
                                          ),
                                        );
                                        if (response.statusCode != 200 &&
                                            mounted) {
                                          String detail = t.serverError(
                                            response.statusCode,
                                          );
                                          try {
                                            detail =
                                                (jsonDecode(
                                                      response.body,
                                                    )['detail']
                                                    as String?) ??
                                                detail;
                                          } catch (_) {}
                                          messenger.showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                t.couldNotDeleteDetail(detail),
                                              ),
                                            ),
                                          );
                                        }
                                      } catch (_) {
                                        if (mounted) {
                                          messenger.showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                t.couldNotDeleteOffline,
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                      fetchBills();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () => _showBillDetails(bill),
                                        child: PaidStampOverlay(
                                          play: bill['id'] == _justPaidBillId,
                                          child: AppCard(
                                            radius: 18,
                                            shadowStrength: 0.4,
                                            padding: const EdgeInsets.all(14),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        formatMoney(
                                                          bill['amount'],
                                                        ),
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      if (_partiallyPaid(
                                                        bill,
                                                      )) ...[
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          '${formatMoney(bill['amount_paid'])} paid — ${formatMoney(((bill['amount'] as num) - (bill['amount_paid'] as num)))} remaining',
                                                          style: TextStyle(
                                                            fontSize: 11.5,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors
                                                                    .orange
                                                                    .shade800,
                                                          ),
                                                        ),
                                                      ],
                                                      const SizedBox(height: 3),
                                                      Text(
                                                        itemsSummary(bill),
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 12.5,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurfaceVariant,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        bill['date']
                                                            .toString()
                                                            .split('T')[0],
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurfaceVariant,
                                                        ),
                                                      ),
                                                      if (isVoided &&
                                                          (bill['void_reason']
                                                                      as String?)
                                                                  ?.isNotEmpty ==
                                                              true) ...[
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          context.t.cdVoidedReason(
                                                            '${bill['void_reason']}',
                                                          ),
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 11.5,
                                                            fontStyle:
                                                                FontStyle
                                                                    .italic,
                                                            color:
                                                                Colors
                                                                    .red
                                                                    .shade700,
                                                          ),
                                                        ),
                                                      ],
                                                      if (((bill['discount_amount']
                                                                  as num?) ??
                                                              0) >
                                                          0) ...[
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          '${context.t.dsDiscount}: ${formatMoney(bill['discount_amount'])}',
                                                          style: TextStyle(
                                                            fontSize: 11.5,
                                                            color:
                                                                Colors
                                                                    .green
                                                                    .shade700,
                                                          ),
                                                        ),
                                                      ],
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Pressable(
                                                      child: GestureDetector(
                                                        onTap:
                                                            (isQuote ||
                                                                    isReturn ||
                                                                    isVoided)
                                                                ? null
                                                                : () =>
                                                                    togglePaidStatus(
                                                                      bill,
                                                                    ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                isVoided
                                                                    ? Colors.red
                                                                        .withValues(
                                                                          alpha:
                                                                              0.16,
                                                                        )
                                                                    : isReturn
                                                                    ? Colors
                                                                        .blueGrey
                                                                        .withValues(
                                                                          alpha:
                                                                              0.16,
                                                                        )
                                                                    : isQuote
                                                                    ? Colors
                                                                        .purple
                                                                        .withValues(
                                                                          alpha:
                                                                              0.16,
                                                                        )
                                                                    : paid
                                                                    ? Colors
                                                                        .green
                                                                        .withValues(
                                                                          alpha:
                                                                              0.16,
                                                                        )
                                                                    : Colors
                                                                        .orange
                                                                        .withValues(
                                                                          alpha:
                                                                              0.16,
                                                                        ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  20,
                                                                ),
                                                          ),
                                                          child: Text(
                                                            isVoided
                                                                ? 'voided'
                                                                : isReturn
                                                                ? 'return'
                                                                : isQuote
                                                                ? 'quote'
                                                                : bill['payment_status'],
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  isVoided
                                                                      ? Colors
                                                                          .red
                                                                          .shade800
                                                                      : isReturn
                                                                      ? Colors
                                                                          .blueGrey
                                                                          .shade700
                                                                      : isQuote
                                                                      ? Colors
                                                                          .purple
                                                                          .shade700
                                                                      : paid
                                                                      ? Colors
                                                                          .green
                                                                          .shade800
                                                                      : Colors
                                                                          .orange
                                                                          .shade800,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    PopupMenuButton<
                                                      VoidCallback
                                                    >(
                                                      icon: const Icon(
                                                        Icons.more_vert,
                                                        size: 20,
                                                      ),
                                                      tooltip:
                                                          context
                                                              .t
                                                              .cdBillActions,
                                                      padding:
                                                          const EdgeInsets.all(
                                                            4,
                                                          ),
                                                      onSelected:
                                                          (action) => action(),
                                                      itemBuilder:
                                                          (context) =>
                                                              _billActionsMenuItems(
                                                                context,
                                                                bill,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AddBillScreen(
                    customerId: widget.customerId,
                    customerCreditLimit: _creditLimit,
                    customerPriceTier: _priceTier,
                    customerCurrentOutstanding: totalBilled - totalPaid,
                  ),
            ),
          );
          if (result == true) {
            fetchBills();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _summaryColumn(
    BuildContext context,
    String label,
    double value,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          builder:
              (context, animatedValue, _) => Text(
                formatMoney(animatedValue),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: color,
                ),
              ),
        ),
      ],
    );
  }

  Widget _creditBar(double outstanding, double creditLimit) {
    final fraction = creditLimit <= 0 ? 0.0 : outstanding / creditLimit;
    final overLimit = fraction >= 1.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: LinearProgressIndicator(
            value: fraction.clamp(0.0, 1.0),
            minHeight: 5,
            backgroundColor: Colors.grey.withValues(alpha: 0.15),
            color: AppStyle.creditColor(fraction),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          context.t.cdCreditUsed(
            formatMoney(creditLimit),
            formatMoney(outstanding),
          ),
          style: TextStyle(
            fontSize: 11,
            color: overLimit ? Colors.red.shade700 : Colors.grey.shade600,
            fontWeight: overLimit ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _VoidBillResult {
  final bool confirmed;
  final String reason;
  const _VoidBillResult(this.confirmed, this.reason);
}

class _VoidBillDialog extends StatefulWidget {
  const _VoidBillDialog();

  @override
  State<_VoidBillDialog> createState() => _VoidBillDialogState();
}

class _VoidBillDialogState extends State<_VoidBillDialog> {
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.t.cdVoidBill),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.t.cdVoidBody),
          const SizedBox(height: 12),
          TextField(
            controller: _reasonController,
            decoration: InputDecoration(
              labelText: context.t.cdReason,
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed:
              () => Navigator.pop(context, const _VoidBillResult(false, '')),
          child: Text(context.t.cancel),
        ),
        TextButton(
          onPressed:
              () => Navigator.pop(
                context,
                _VoidBillResult(true, _reasonController.text.trim()),
              ),
          child: Text(
            context.t.cdVoidBill,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
