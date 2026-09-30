import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'barcode_scanner_screen.dart';
import 'items_screen.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class PurchaseLineItem {
  final String? itemId;
  final String itemName;
  double unitPrice;
  double quantity;

  PurchaseLineItem({
    this.itemId,
    required this.itemName,
    required this.unitPrice,
    this.quantity = 1,
  });

  double get lineTotal => quantity * unitPrice;
}

class AddPurchaseScreen extends StatefulWidget {
  final String supplierId;
  final String? purchaseId;
  final List<dynamic>? initialLineItems;
  final String? initialStatus;
  final bool initialIsPo;
  final String? scannedImageUrl;
  final String? rawExtraction;

  const AddPurchaseScreen({
    super.key,
    required this.supplierId,
    this.purchaseId,
    this.initialLineItems,
    this.initialStatus,
    this.initialIsPo = false,
    this.scannedImageUrl,
    this.rawExtraction,
  });

  @override
  State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {
  List<dynamic> catalogItems = [];
  List<PurchaseLineItem> selectedItems = [];
  bool isLoadingCatalog = true;
  bool catalogLoadFailed = false;
  bool isSaving = false;
  late String _paymentStatus;
  String _paymentMethod = 'cash';
  late bool _isPo;
  String? errorMessage;

  bool get isEditing => widget.purchaseId != null;

  @override
  void initState() {
    super.initState();
    _isPo = widget.initialIsPo;
    _paymentStatus = widget.initialStatus ?? 'unpaid';
    if (widget.initialLineItems != null) {
      selectedItems =
          widget.initialLineItems!
              .map(
                (li) => PurchaseLineItem(
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

  double get grandTotal =>
      selectedItems.fold(0.0, (sum, li) => sum + li.lineTotal);

  void addItemToPurchase(dynamic catalogItem) {
    final existing = selectedItems.indexWhere(
      (li) => li.itemId == catalogItem['id'],
    );
    final costPrice = (catalogItem['cost_price'] as num?)?.toDouble() ?? 0.0;
    setState(() {
      if (existing != -1) {
        selectedItems[existing].quantity += 1;
      } else {
        selectedItems.add(
          PurchaseLineItem(
            itemId: catalogItem['id'],
            itemName: catalogItem['name'],
            unitPrice: costPrice,
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

  void updateCost(int index, String value) {
    final parsed = double.tryParse(value) ?? 0.0;
    setState(() => selectedItems[index].unitPrice = parsed);
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
            return ListView(
              controller: scrollController,
              children: [
                ListTile(
                  leading: const Icon(Icons.add_circle_outline),
                  title: Text(context.t.apNewItem),
                  subtitle: Text(context.t.apNewItemHint),
                  onTap: () async {
                    Navigator.pop(context);
                    if (!mounted) return;
                    final created = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddItemScreen(),
                      ),
                    );
                    if (created == true) {
                      await fetchCatalog();
                      pickItemFromCatalog();
                    }
                  },
                ),
                const Divider(height: 1),
                ...catalogItems.map((item) {
                  final cost = (item['cost_price'] as num?)?.toDouble();
                  return ListTile(
                    title: Text(context.itemName(item['name'])),
                    subtitle: Text(
                      cost != null
                          ? context.t.apCurrentCost(
                            formatMoney(cost),
                            context.unitName(item['unit']),
                          )
                          : context.t.apNoCost(context.unitName(item['unit'])),
                    ),
                    onTap: () => Navigator.pop(context, item),
                  );
                }),
              ],
            );
          },
        );
      },
    );

    if (selected != null) {
      addItemToPurchase(selected);
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
      addItemToPurchase(found);
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
          addItemToPurchase(item);
          break;
        }
      }
    }
  }

  Future<void> savePurchase() async {
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
      'supplier_id': widget.supplierId,
      'date': DateTime.now().toIso8601String(),
      'payment_status': _isPo ? 'unpaid' : _paymentStatus,
      'payment_method': _paymentMethod,
      'amount_paid': !_isPo && _paymentStatus == 'paid' ? grandTotal : 0,
      'is_po': _isPo,
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
                Uri.parse(
                  '${AppConfig.baseUrl}/purchases/${widget.purchaseId}',
                ),
                headers: {'Content-Type': 'application/json'},
                body: body,
              )
              : await http.post(
                Uri.parse('${AppConfig.baseUrl}/purchases'),
                headers: {'Content-Type': 'application/json'},
                body: body,
              );

      if (!mounted) return;
      if (response.statusCode == 200) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isSaving = false;
        });
      }
    } catch (e) {
      await LocalDb.instance.enqueueWrite(
        method: isEditing ? 'PUT' : 'POST',
        path: isEditing ? '/purchases/${widget.purchaseId}' : '/purchases',
        label: t.qPurchase(formatMoney(grandTotal, decimals: 2)),
        payload: jsonDecode(body),
      );
      await SyncService.instance.refreshPendingCount();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.apOfflinePurchase)));
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
                ? (_isPo ? context.t.apEditPo : context.t.sdEditPurchase)
                : (_isPo ? context.t.apNewPo : context.t.apAddPurchase),
      ),
      body:
          isLoadingCatalog
              ? const SkeletonListLoader()
              : catalogLoadFailed
              ? errorRetry(context.t.abCouldNotLoadItems, fetchCatalog)
              : SidePanelColumn(
                children: [
                  Expanded(
                    child:
                        selectedItems.isEmpty
                            ? Center(child: Text(context.t.apTapAddItem))
                            : ListView.builder(
                              itemCount: selectedItems.length,
                              itemBuilder: (context, index) {
                                final li = selectedItems[index];
                                return ListTile(
                                  title: Text(context.itemName(li.itemName)),
                                  subtitle: Row(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: TextFormField(
                                          initialValue: li.unitPrice.toString(),
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            prefixText: 'PKR ',
                                            border: UnderlineInputBorder(),
                                          ),
                                          onChanged:
                                              (v) => updateCost(index, v),
                                        ),
                                      ),
                                      const Text(' x '),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppIconButton(
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                        onPressed:
                                            () => updateQuantity(
                                              index,
                                              li.quantity - 1,
                                            ),
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
                                        onPressed:
                                            () => updateQuantity(
                                              index,
                                              li.quantity + 1,
                                            ),
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
                            Text(
                              context.t.abTotal,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatMoney(grandTotal),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.apSaveAsPo),
                          subtitle: Text(
                            isEditing && !widget.initialIsPo
                                ? context.t.apPoLocked
                                : context.t.apPoNote,
                          ),
                          value: _isPo,
                          onChanged:
                              isEditing && !widget.initialIsPo
                                  ? null
                                  : (v) => setState(() => _isPo = v),
                        ),
                        if (!_isPo) ...[
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
                                label: Text(context.t.apUnpaidCredit),
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
                                  : (_isPo
                                      ? context.t.apSavePo
                                      : context.t.apSavePurchase),
                          loading: isSaving,
                          onPressed: isSaving ? null : savePurchase,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
