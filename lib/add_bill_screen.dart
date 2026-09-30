import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'config.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'barcode_scanner_screen.dart';
import 'items_screen.dart';
import 'upi_qr_widget.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class BillLineItem {
  final String? itemId;
  final String itemName;
  final double unitPrice;
  double quantity;

  BillLineItem({
    this.itemId,
    required this.itemName,
    required this.unitPrice,
    this.quantity = 1,
  });

  double get lineTotal => quantity * unitPrice;
}

class AddBillScreen extends StatefulWidget {
  final String customerId;
  final String? billId;
  final List<dynamic>? initialLineItems;
  final String? initialStatus;
  final bool initialIsQuote;
  final double? initialDiscount;
  final double? customerCreditLimit;
  final double? customerCurrentOutstanding;
  final String? customerPriceTier;
  final String? scannedImageUrl;
  final String? rawExtraction;

  const AddBillScreen({
    super.key,
    required this.customerId,
    this.billId,
    this.initialLineItems,
    this.initialStatus,
    this.initialIsQuote = false,
    this.initialDiscount,
    this.customerCreditLimit,
    this.customerCurrentOutstanding,
    this.customerPriceTier,
    this.scannedImageUrl,
    this.rawExtraction,
  });

  @override
  State<AddBillScreen> createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {
  List<dynamic> catalogItems = [];
  List<BillLineItem> selectedItems = [];
  bool isLoadingCatalog = true;
  bool catalogLoadFailed = false;
  bool isSaving = false;
  late String _paymentStatus;
  String _paymentMethod = 'cash';
  late bool _isQuote;
  final _discountController = TextEditingController();
  String? errorMessage;

  bool get isEditing => widget.billId != null;

  @override
  void initState() {
    super.initState();
    _paymentStatus = widget.initialStatus ?? 'unpaid';
    _isQuote = widget.initialIsQuote;
    if ((widget.initialDiscount ?? 0) > 0) {
      _discountController.text = widget.initialDiscount!.toStringAsFixed(0);
    }
    _discountController.addListener(() => setState(() {}));
    if (widget.initialLineItems != null) {
      selectedItems =
          widget.initialLineItems!
              .map(
                (li) => BillLineItem(
                  itemId: li['item_id'],
                  itemName: li['item_name'],
                  unitPrice: (li['unit_price'] as num).toDouble(),
                  quantity: (li['quantity'] as num).toDouble(),
                ),
              )
              .toList();
    }
    fetchCatalog();
  }

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  Future<void> fetchCatalog() async {
    setState(() => catalogLoadFailed = false);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/items'));
      if (response.statusCode == 200 && mounted) {
        setState(() {
          catalogItems = jsonDecode(response.body);
          isLoadingCatalog = false;
        });
      } else if (mounted) {
        setState(() {
          isLoadingCatalog = false;
          catalogLoadFailed = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoadingCatalog = false;
          catalogLoadFailed = true;
        });
      }
    }
  }

  double get subtotal =>
      selectedItems.fold(0.0, (sum, li) => sum + li.lineTotal);

  double get discount {
    final entered = double.tryParse(_discountController.text.trim()) ?? 0;
    return entered.clamp(0.0, subtotal);
  }

  double get grandTotal => subtotal - discount;

  double _tierPrice(dynamic catalogItem) {
    final retail = (catalogItem['price'] as num).toDouble();
    final tierPrice = switch (widget.customerPriceTier) {
      'wholesale' => catalogItem['wholesale_price'] as num?,
      'contractor' => catalogItem['contractor_price'] as num?,
      _ => null,
    };
    return tierPrice?.toDouble() ?? retail;
  }

  void addItemToBill(dynamic catalogItem) {
    final existing = selectedItems.indexWhere(
      (li) => li.itemId == catalogItem['id'],
    );
    setState(() {
      if (existing != -1) {
        selectedItems[existing].quantity += 1;
      } else {
        selectedItems.add(
          BillLineItem(
            itemId: catalogItem['id'],
            itemName: catalogItem['name'],
            unitPrice: _tierPrice(catalogItem),
          ),
        );
      }
    });
  }

  void removeLineItem(int index) {
    setState(() => selectedItems.removeAt(index));
  }

  void updateQuantity(int index, double newQty) {
    if (newQty <= 0) {
      removeLineItem(index);
      return;
    }
    setState(() => selectedItems[index].quantity = newQty);
  }

  Future<void> pickItemFromCatalog() async {
    final selected = await showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return ListView.builder(
              controller: scrollController,
              itemCount: catalogItems.length,
              itemBuilder: (context, index) {
                final item = catalogItems[index];
                return ListTile(
                  title: Text(context.itemName(item['name'])),
                  subtitle: Text(
                    '${formatMoney(_tierPrice(item))} / ${context.unitName(item['unit'])}',
                  ),
                  onTap: () => Navigator.pop(context, item),
                );
              },
            );
          },
        );
      },
    );

    if (selected != null) {
      addItemToBill(selected);
    }
  }

  Future<void> _scanAndAdd() async {
    final code = await scanBarcode(context);
    if (code == null) return;
    final trimmed = code.trim();

    dynamic found;
    for (final item in catalogItems) {
      if ((item['barcode'] as String? ?? '').trim() == trimmed) {
        found = item;
        break;
      }
    }
    if (found != null) {
      addItemToBill(found);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.abAdded(context.itemName(found['name']))),
          ),
        );
      }
      return;
    }

    if (!mounted) return;
    final createNew = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.itmNotFoundTitle),
            content: Text(context.t.itmNotFoundBody(trimmed)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.t.itmAddItem),
              ),
            ],
          ),
    );
    if (createNew != true) return;
    if (!mounted) return;

    final created = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddItemScreen(initialBarcode: trimmed),
      ),
    );
    if (created == true) {
      await fetchCatalog();
      for (final item in catalogItems) {
        if ((item['barcode'] as String? ?? '').trim() == trimmed) {
          addItemToBill(item);
          break;
        }
      }
    }
  }

  Future<void> saveBill({bool overrideCreditLimit = false}) async {
    final t = context.t;
    if (selectedItems.isEmpty) {
      setState(() => errorMessage = context.t.abAddAtLeastOne);
      return;
    }

    setState(() {
      isSaving = true;
      errorMessage = null;
    });

    final body = jsonEncode({
      'customer_id': widget.customerId,
      'date': DateTime.now().toIso8601String(),
      'payment_status': _isQuote ? 'unpaid' : _paymentStatus,
      'amount_paid': !_isQuote && _paymentStatus == 'paid' ? grandTotal : 0,
      'payment_method': _paymentMethod,
      'is_quote': _isQuote,
      'discount_amount': discount,
      'override_credit_limit': overrideCreditLimit,
      if (widget.scannedImageUrl != null) 'image_url': widget.scannedImageUrl,
      if (widget.rawExtraction != null) 'raw_extraction': widget.rawExtraction,
      'line_items':
          selectedItems
              .map(
                (li) => {
                  'item_id': li.itemId,
                  'item_name': li.itemName,
                  'quantity': li.quantity,
                  'unit_price': li.unitPrice,
                },
              )
              .toList(),
    });

    try {
      final response =
          isEditing
              ? await http.put(
                Uri.parse('${AppConfig.baseUrl}/bills/v2/${widget.billId}'),
                headers: {'Content-Type': 'application/json'},
                body: body,
              )
              : await http.post(
                Uri.parse('${AppConfig.baseUrl}/bills/v2'),
                headers: {'Content-Type': 'application/json'},
                body: body,
              );

      if (response.statusCode == 200) {
        if (mounted) {
          final itemsText = selectedItems
              .map((li) => '${li.itemName} (${li.quantity}x)')
              .join(', ');
          final shareText = t.msgInvoiceShare(
            itemsText,
            AppConfig.shopName,
            _paymentStatus == 'paid' ? t.cdBillPaid : t.cdBillUnpaid,
            formatMoney(grandTotal, decimals: 2),
          );

          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (ctx) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(ctx).colorScheme.primary,
                      size: 48,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isEditing
                          ? (_isQuote
                              ? context.t.abQuotationUpdated
                              : context.t.abBillUpdated)
                          : (_isQuote
                              ? context.t.abQuotationSaved
                              : context.t.abBillCreated),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.t.abTotalAmount(
                        formatMoney(grandTotal, decimals: 2),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(ctx).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (!_isQuote &&
                        AppConfig.jazzcashNumber.isNotEmpty &&
                        _paymentStatus == 'unpaid') ...[
                      JazzCashQrWidget(
                        jazzcashNumber: AppConfig.jazzcashNumber,
                        amount: grandTotal,
                      ),
                      const SizedBox(height: 16),
                    ],
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              final encoded = Uri.encodeComponent(shareText);
                              final waUri = Uri.parse(
                                'https://wa.me/?text=$encoded',
                              );
                              launchUrl(
                                waUri,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: const Icon(Icons.send),
                            label: const Text('WhatsApp'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(44),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => Share.share(shareText),
                            icon: const Icon(Icons.share),
                            label: Text(context.t.abShare),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(44),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(context.t.abDoneReturn),
                    ),
                  ],
                ),
              );
            },
          );
          if (mounted) Navigator.pop(context, true);
        }
      } else if (response.statusCode == 402 && mounted) {
        setState(() => isSaving = false);
        String detail = context.t.abOverLimitBody;
        try {
          detail = jsonDecode(response.body)['detail'] as String? ?? detail;
        } catch (_) {}
        if (!mounted) return;
        final confirmed = await showDialog<bool>(
          context: context,
          builder:
              (ctx) => AlertDialog(
                title: Text(context.t.abOverLimitTitle),
                content: Text(detail),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(context.t.cancel),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(context.t.abBillAnyway),
                  ),
                ],
              ),
        );
        if (confirmed == true) {
          await saveBill(overrideCreditLimit: true);
        }
      } else if (mounted) {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isSaving = false;
        });
      }
    } catch (e) {
      String customerName = '';
      try {
        final cached = await LocalDb.instance.getCachedCustomers();
        for (final c in cached) {
          if (c['id'] == widget.customerId) {
            customerName = c['name'] as String? ?? '';
            break;
          }
        }
      } catch (_) {}
      await LocalDb.instance.enqueueBill(
        customerId: widget.customerId,
        customerName: customerName,
        method: isEditing ? 'PUT' : 'POST',
        billId: widget.billId,
        payload: jsonDecode(body),
      );
      await SyncService.instance.refreshPendingCount();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.abOfflineBill)));
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(
        title:
            isEditing
                ? (_isQuote ? context.t.abEditQuotation : context.t.abEditBill)
                : (_isQuote ? context.t.abNewQuotation : context.t.abAddBill),
      ),
      body:
          isLoadingCatalog
              ? const SkeletonListLoader()
              : catalogLoadFailed
              ? errorRetry(context.t.abCouldNotLoadItems, fetchCatalog)
              : SidePanelColumn(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    alignment: Alignment.topCenter,
                    child:
                        (!_isQuote &&
                                widget.customerCreditLimit != null &&
                                (widget.customerCurrentOutstanding ?? 0) +
                                        grandTotal >
                                    widget.customerCreditLimit!)
                            ? Container(
                              width: double.infinity,
                              color: AppStyle.tint(context, Colors.red),
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color:
                                        AppStyle.isDark(context)
                                            ? Colors.red.shade300
                                            : Colors.red.shade700,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      context.t.abOverLimitWarn(
                                        formatMoney(
                                          widget.customerCreditLimit!,
                                        ),
                                        formatMoney(
                                          ((widget.customerCurrentOutstanding ??
                                                  0) +
                                              grandTotal),
                                        ),
                                      ),
                                      style: TextStyle(
                                        color:
                                            AppStyle.isDark(context)
                                                ? Colors.red.shade200
                                                : Colors.red.shade900,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : const SizedBox(width: double.infinity),
                  ),
                  Expanded(
                    child:
                        selectedItems.isEmpty
                            ? Center(child: Text(context.t.abTapAddItemBill))
                            : ListView.builder(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                              itemCount: selectedItems.length,
                              itemBuilder: (context, index) {
                                final li = selectedItems[index];
                                return Dismissible(
                                  key: Key(
                                    li.itemId ?? '$index-${li.itemName}',
                                  ),
                                  direction: DismissDirection.endToStart,
                                  background: Container(
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
                                  onDismissed: (_) => removeLineItem(index),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: AppCard(
                                      radius: 18,
                                      shadowStrength: 0.4,
                                      child: ListTile(
                                        title: Text(
                                          context.itemName(li.itemName),
                                        ),
                                        subtitle: Text(
                                          '${formatMoney(li.unitPrice)} x ${li.quantity.toStringAsFixed(li.quantity % 1 == 0 ? 0 : 1)}',
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AppIconButton(
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                              ),
                                              onPressed: () {
                                                HapticFeedback.selectionClick();
                                                updateQuantity(
                                                  index,
                                                  li.quantity - 1,
                                                );
                                              },
                                            ),
                                            Text(
                                              li.quantity.toStringAsFixed(
                                                li.quantity % 1 == 0 ? 0 : 1,
                                              ),
                                            ),
                                            AppIconButton(
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                              ),
                                              onPressed: () {
                                                HapticFeedback.selectionClick();
                                                updateQuantity(
                                                  index,
                                                  li.quantity + 1,
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              width: 70,
                                              child: Text(
                                                formatMoney(li.lineTotal),
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      border: Border(
                        top: BorderSide(color: AppStyle.borderColor(context)),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed:
                                    catalogItems.isEmpty
                                        ? null
                                        : pickItemFromCatalog,
                                icon: const Icon(Icons.add),
                                label: Text(
                                  catalogItems.isEmpty
                                      ? context.t.abNoCatalog
                                      : context.t.itmAddItem,
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(44),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _scanAndAdd,
                                icon: const Icon(Icons.qr_code_scanner),
                                label: Text(context.t.abScan),
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(44),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(context.t.abDiscountRs),
                            SizedBox(
                              width: 110,
                              child: TextField(
                                controller: _discountController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                textAlign: TextAlign.right,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: '0',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (discount > 0) ...[
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.t.abSubtotal,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                formatMoney(subtotal),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.t.abTotal,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: grandTotal),
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOutCubic,
                              builder:
                                  (context, value, _) => Text(
                                    formatMoney(value),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.abSaveAsQuotation),
                          subtitle: Text(
                            isEditing && !widget.initialIsQuote
                                ? context.t.abQuotationLocked
                                : context.t.abQuotationNote,
                          ),
                          value: _isQuote,
                          onChanged:
                              isEditing && !widget.initialIsQuote
                                  ? null
                                  : (v) => setState(() => _isQuote = v),
                        ),
                        if (!_isQuote) ...[
                          const SizedBox(height: 8),
                          Text(
                            context.t.abPaymentStatus,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4),
                          SegmentedButton<String>(
                            segments: [
                              ButtonSegment(
                                value: 'unpaid',
                                label: Text(context.t.abUnpaid),
                              ),
                              ButtonSegment(
                                value: 'paid',
                                label: Text(context.t.cdPaid),
                              ),
                            ],
                            selected: {_paymentStatus},
                            onSelectionChanged:
                                (s) => setState(() => _paymentStatus = s.first),
                          ),
                          if (_paymentStatus == 'paid') ...[
                            const SizedBox(height: 12),
                            Text(
                              context.t.abPaymentMethod,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SegmentedButton<String>(
                              segments: [
                                ButtonSegment(
                                  value: 'cash',
                                  label: Text(context.t.abCash),
                                ),
                                ButtonSegment(
                                  value: 'bank_transfer',
                                  label: Text(context.t.abBankTransfer),
                                ),
                                ButtonSegment(
                                  value: 'cheque',
                                  label: Text(context.t.abCheque),
                                ),
                              ],
                              selected: {_paymentMethod},
                              onSelectionChanged:
                                  (s) =>
                                      setState(() => _paymentMethod = s.first),
                            ),
                          ],
                        ],
                        if (errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 12),
                        GradientButton(
                          label:
                              isEditing
                                  ? context.t.itmSaveChanges
                                  : (_isQuote
                                      ? context.t.abSaveQuotation
                                      : context.t.abSaveBill),
                          loading: isSaving,
                          onPressed: isSaving ? null : saveBill,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
