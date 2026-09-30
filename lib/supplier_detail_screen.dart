import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'add_purchase_screen.dart';
import 'config.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/document_sheet.dart';
import 'widgets/paid_stamp_overlay.dart';
import 'widgets/money.dart';

class SupplierDetailScreen extends StatefulWidget {
  final String supplierId;
  final String supplierName;
  final String? supplierPhone;

  const SupplierDetailScreen({
    super.key,
    required this.supplierId,
    required this.supplierName,
    this.supplierPhone,
  });

  @override
  State<SupplierDetailScreen> createState() => _SupplierDetailScreenState();
}

class _SupplierDetailScreenState extends State<SupplierDetailScreen> {
  List<dynamic> purchases = [];
  bool isLoading = true;
  String? errorMessage;
  String? _justPaidPurchaseId;

  @override
  void initState() {
    super.initState();
    fetchPurchases();
  }

  Future<void> fetchPurchases() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/suppliers/${widget.supplierId}/purchases',
        ),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          purchases = jsonDecode(response.body);
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

  Future<void> showLedger() => fetchAndPrintPdf(
    context,
    url:
        '${AppConfig.baseUrl}/suppliers/${widget.supplierId}/ledger?language=${Localizations.localeOf(context).languageCode}',
    errorLabel: context.t.lblLedger,
  );

  Iterable<dynamic> get _realPurchases =>
      purchases.where((p) => p['is_po'] != true);

  double get totalPurchased =>
      _realPurchases.fold(0.0, (sum, p) => sum + (p['amount'] as num));

  double get totalPaid =>
      _realPurchases.fold(0.0, (sum, p) => sum + (p['amount_paid'] as num));

  String itemsSummary(dynamic purchase) {
    final lineItems = purchase['line_items'] as List<dynamic>? ?? [];
    if (lineItems.isEmpty) return context.t.cdNoItems;
    return lineItems
        .map((li) => '${li['item_name']} x${li['quantity']}')
        .join(', ');
  }

  Future<void> _deletePurchase(dynamic purchase) async {
    final messenger = ScaffoldMessenger.of(context);
    final confirm = await confirmDelete(
      context,
      title: context.t.sdDeletePurchaseTitle,
      message: context.t.sdDeletePurchaseBody,
    );
    if (!confirm) return;
    try {
      await http.delete(
        Uri.parse('${AppConfig.baseUrl}/purchases/${purchase['id']}'),
      );
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(context.t.couldNotDeleteOffline)),
        );
      }
    }
    fetchPurchases();
  }

  bool _alreadyReturned(dynamic purchase) =>
      purchases.any((p) => p['return_of_purchase_id'] == purchase['id']);

  Future<void> returnPurchase(dynamic purchase) async {
    final lineItems = (purchase['line_items'] as List<dynamic>? ?? const []);
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
                        context.t.sdReturnToSupplier,
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
                    context.t.sdReturnHint,
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
        Uri.parse('${AppConfig.baseUrl}/purchases/${purchase['id']}/return'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'line_items': [
            for (final entry in quantities.entries)
              if (entry.value > 0)
                {'purchase_item_id': entry.key, 'quantity': entry.value},
          ],
        }),
      );
      if (response.statusCode == 200) {
        fetchPurchases();
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

  Future<void> convertPo(dynamic purchase) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/purchases/${purchase['id']}/convert'),
      );
      if (response.statusCode == 200) {
        fetchPurchases();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.t.sdCouldNotMarkReceived('${response.statusCode}'),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.sdCouldNotMarkReceived('$e'))),
        );
      }
    }
  }

  Future<void> togglePaymentStatus(dynamic purchase) async {
    final newStatus = purchase['payment_status'] == 'paid' ? 'unpaid' : 'paid';
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.cdUpdateStatusTitle),
            content: Text(
              newStatus == 'paid'
                  ? context.t.sdMarkPaidQ
                  : context.t.sdMarkUnpaidQ,
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

    setState(() => _justPaidPurchaseId = null);

    final newAmountPaid = newStatus == 'paid' ? purchase['amount'] : 0;
    try {
      final response = await http.patch(
        Uri.parse('${AppConfig.baseUrl}/purchases/${purchase['id']}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'payment_status': newStatus,
          'amount_paid': newAmountPaid,
        }),
      );
      if (response.statusCode == 200) {
        if (newStatus == 'paid') {
          setState(() => _justPaidPurchaseId = purchase['id']);
        }
        fetchPurchases();
      } else if (mounted) {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotUpdate(detail))),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.cdCouldNotUpdate('$e'))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final outstanding = totalPurchased - totalPaid;

    return Scaffold(
      appBar: FloatingAppBar(
        title: context.partyName(widget.supplierName),
        actions: [
          AppIconButton(
            icon: const Icon(Icons.receipt_long_outlined),
            tooltip: context.t.cdLedgerPdf,
            onPressed: showLedger,
          ),
        ],
      ),
      body:
          isLoading
              ? const SkeletonListLoader()
              : errorMessage != null
              ? errorRetry(errorMessage!, fetchPurchases)
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
                                  AppStyle.colorForKey(widget.supplierId),
                                ),
                                child: Text(
                                  context
                                          .partyName(widget.supplierName)
                                          .trim()
                                          .isNotEmpty
                                      ? context
                                          .partyName(widget.supplierName)
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
                                      context.partyName(widget.supplierName),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    if (widget.supplierPhone != null &&
                                        widget.supplierPhone!
                                            .trim()
                                            .isNotEmpty) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        widget.supplierPhone!,
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
                                context.t.sdTotalPurchased,
                                totalPurchased,
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
                                context.t.sdPayable,
                                outstanding,
                                Colors.red.shade700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: fetchPurchases,
                      child:
                          purchases.isEmpty
                              ? ListView(
                                children: [
                                  SizedBox(height: 120),
                                  Center(child: Text(context.t.sdNoPurchases)),
                                ],
                              )
                              : ListView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  12,
                                  0,
                                  12,
                                  12,
                                ),
                                itemCount: purchases.length,
                                itemBuilder: (context, index) {
                                  final purchase = purchases[index];
                                  final paid =
                                      purchase['payment_status'] == 'paid';
                                  final isReturn =
                                      purchase['return_of_purchase_id'] != null;
                                  final isPo = purchase['is_po'] == true;
                                  return Dismissible(
                                    key: Key(purchase['id']),
                                    direction:
                                        isReturn
                                            ? DismissDirection.endToStart
                                            : DismissDirection.horizontal,
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
                                        await _editPurchase(
                                          purchase,
                                          isPo: isPo,
                                        );
                                        return false;
                                      }
                                      return confirmDelete(
                                        context,
                                        title: context.t.sdDeletePurchaseTitle,
                                        message: context.t.sdDeletePurchaseBody,
                                      );
                                    },
                                    onDismissed: (direction) async {
                                      final messenger = ScaffoldMessenger.of(
                                        context,
                                      );
                                      final t = context.t;
                                      try {
                                        await http.delete(
                                          Uri.parse(
                                            '${AppConfig.baseUrl}/purchases/${purchase['id']}',
                                          ),
                                        );
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
                                      fetchPurchases();
                                    },
                                    child: GestureDetector(
                                      onTap:
                                          () => _showPurchaseDetails(purchase),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: PaidStampOverlay(
                                          play:
                                              purchase['id'] ==
                                              _justPaidPurchaseId,
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
                                                          purchase['amount'],
                                                        ),
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 3),
                                                      Text(
                                                        itemsSummary(purchase),
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
                                                        purchase['date']
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
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Pressable(
                                                      child: GestureDetector(
                                                        onTap:
                                                            (isPo || isReturn)
                                                                ? null
                                                                : () =>
                                                                    togglePaymentStatus(
                                                                      purchase,
                                                                    ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color:
                                                                isPo
                                                                    ? Colors
                                                                        .purple
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
                                                            isPo
                                                                ? context.t.sdPo
                                                                : isReturn
                                                                ? context
                                                                    .t
                                                                    .cdBillReturn
                                                                : purchase['payment_status'] ==
                                                                    'paid'
                                                                ? context
                                                                    .t
                                                                    .cdBillPaid
                                                                : purchase['payment_status'] ==
                                                                    'partial'
                                                                ? context
                                                                    .t
                                                                    .cdBillPartial
                                                                : context
                                                                    .t
                                                                    .cdBillUnpaid,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  isPo
                                                                      ? Colors
                                                                          .purple
                                                                          .shade700
                                                                      : isReturn
                                                                      ? Colors
                                                                          .blueGrey
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
                                                              .sdPurchaseActions,
                                                      padding:
                                                          const EdgeInsets.all(
                                                            4,
                                                          ),
                                                      onSelected:
                                                          (action) => action(),
                                                      itemBuilder:
                                                          (context) =>
                                                              _purchaseActionsMenuItems(
                                                                context,
                                                                purchase,
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
                  (context) => AddPurchaseScreen(supplierId: widget.supplierId),
            ),
          );
          if (result == true) fetchPurchases();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showPurchaseDetails(dynamic purchase) {
    final amount = (purchase['amount'] as num?) ?? 0;
    final paid = (purchase['amount_paid'] as num?) ?? 0;
    final isPo = purchase['is_po'] == true;
    final isReturn = purchase['return_of_purchase_id'] != null;
    final isPaid = purchase['payment_status'] == 'paid';
    final (label, color) =
        isPo
            ? (context.t.sdDraftPo, Colors.purple.shade600)
            : isReturn
            ? (context.t.cdBillReturn, Colors.blueGrey.shade600)
            : isPaid
            ? (context.t.cdBillPaid, Colors.green.shade600)
            : (paid > 0 && paid < amount)
            ? (context.t.cdBillPartial, Colors.amber.shade700)
            : (context.t.cdBillUnpaid, Colors.red.shade600);
    return showDocumentSheet(
      context,
      title: context.t.sdPurchase,
      amount: amount,
      date: purchase['date'].toString().split('T')[0],
      statusLabel: label,
      statusColor: color,
      paid: (isPo || isReturn) ? null : (isPaid ? amount : paid),
      remainingLabel: context.t.sdPayable,
      notes: [
        if (isPo) (text: context.t.sdDraftNote, color: Colors.purple.shade700),
        if (isReturn)
          (text: context.t.sdReturnNote, color: Colors.blueGrey.shade700),
      ],
      lines: purchase['line_items'] as List<dynamic>? ?? const [],
    );
  }

  List<PopupMenuEntry<VoidCallback>> _purchaseActionsMenuItems(
    BuildContext context,
    dynamic purchase,
  ) {
    final isPo = purchase['is_po'] == true;
    final isReturn = purchase['return_of_purchase_id'] != null;
    final primary = Theme.of(context).colorScheme.primary;

    return [
      if (isPo)
        PopupMenuItem(
          value: () => convertPo(purchase),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(Icons.check_circle_outline, primary, size: 30),
            title: Text(
              context.t.sdMarkReceived,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      if (!isReturn)
        PopupMenuItem(
          value: () => _editPurchase(purchase, isPo: isPo),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(Icons.edit_outlined, primary, size: 30),
            title: Text(
              context.t.sdEditPurchase,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      if (!isReturn && !isPo && !_alreadyReturned(purchase))
        PopupMenuItem(
          value: () => returnPurchase(purchase),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(
              Icons.assignment_return_outlined,
              primary,
              size: 30,
            ),
            title: Text(
              context.t.sdReturnToSupplier,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      const PopupMenuDivider(height: 1),
      PopupMenuItem(
        value: () => _deletePurchase(purchase),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: IconBadge(
            Icons.delete_outline,
            Colors.red.shade700,
            size: 30,
          ),
          title: Text(
            context.t.sdDeletePurchaseTitle,
            style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ];
  }

  Future<void> _editPurchase(dynamic purchase, {required bool isPo}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddPurchaseScreen(
              supplierId: widget.supplierId,
              purchaseId: purchase['id'],
              initialLineItems: purchase['line_items'],
              initialStatus: purchase['payment_status'],
              initialIsPo: isPo,
            ),
      ),
    );
    if (result == true) fetchPurchases();
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
}
