import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'api.dart' as http;
import 'config.dart';
import 'add_purchase_screen.dart';
import 'bulk_add_items_screen.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'update_stock_screen.dart';
import 'barcode_scanner_screen.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/history_sheet.dart';
import 'widgets/money.dart';

Barcode _barcodeFor(String code) {
  final t = code.trim();
  final isNumeric13 =
      t.length == 13 && t.runes.every((r) => r >= 0x30 && r <= 0x39);
  return isNumeric13 ? Barcode.ean13() : Barcode.code128();
}

class LabelItem {
  final String name;
  final String price;
  final String code;
  const LabelItem({
    required this.name,
    required this.price,
    required this.code,
  });
}

pw.Page _labelPage(LabelItem item) {
  final trimmed = item.code.trim();
  return pw.Page(
    pageFormat: PdfPageFormat(
      40 * PdfPageFormat.mm,
      25 * PdfPageFormat.mm,
      marginAll: 2 * PdfPageFormat.mm,
    ),
    build:
        (context) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.stretch,
          children: [
            pw.Text(
              item.name,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
            ),
            if (item.price.isNotEmpty)
              pw.Text(
                'Rs ${item.price}',
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 7),
              ),
            pw.SizedBox(height: 2),
            pw.BarcodeWidget(
              barcode: _barcodeFor(trimmed),
              data: trimmed,
              drawText: false,
              height: 9,
            ),
            pw.Text(
              trimmed,
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(fontSize: 5),
            ),
          ],
        ),
  );
}

Future<void> printBarcodeLabels(List<LabelItem> items) async {
  final withCodes = items.where((it) => it.code.trim().isNotEmpty).toList();
  if (withCodes.isEmpty) return;
  final doc = pw.Document();
  for (final item in withCodes) {
    doc.addPage(_labelPage(item));
  }
  await Printing.layoutPdf(onLayout: (format) async => doc.save());
}

Future<void> printBarcodeLabel({
  required String name,
  required String price,
  required String code,
}) {
  return printBarcodeLabels([LabelItem(name: name, price: price, code: code)]);
}

enum _ItemSort { name, stockLow, recent }

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> items = [];
  List<dynamic> filteredItems = [];
  bool isLoading = true;
  String? errorMessage;
  final _searchController = TextEditingController();
  String? _selectedCategory;

  bool _lowStockOnly = false;

  _ItemSort _sortMode = _ItemSort.name;

  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  bool _selecting = false;
  final Set<String> _selectedIds = {};

  AnimationController? _pulse;
  AnimationController get _pulseController =>
      _pulse ??= AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 900),
      )..repeat(reverse: true);

  List<String> get _availableCategories {
    final set = <String>{};
    for (final item in items) {
      final c = item['category'] as String?;
      if (c != null && c.trim().isNotEmpty) set.add(c);
    }
    final list = set.toList()..sort();
    return list;
  }

  @override
  void initState() {
    super.initState();
    fetchItems();
    SyncService.instance.syncTick.addListener(_onSyncTick);
  }

  void _onSyncTick() {
    if (mounted) fetchItems();
  }

  Future<void> fetchItems() async {
    if (items.isEmpty) setState(() => isLoading = true);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/items'));
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          items = jsonDecode(response.body);
          isLoading = false;
          errorMessage = null;
        });
        applySearch(_searchController.text);
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

  void applySearch(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      filteredItems =
          items.where((item) {
              if (_selectedCategory != null &&
                  item['category'] != _selectedCategory) {
                return false;
              }
              if (_lowStockOnly && !_isLowStock(item)) return false;
              if (q.isEmpty) return true;
              final name = (item['name'] as String).toLowerCase();
              final shown =
                  NameTranslator.instance
                      .show('item', item['name'])
                      .toLowerCase();
              final category =
                  (item['category'] as String? ?? '').toLowerCase();
              final barcode = (item['barcode'] as String? ?? '').toLowerCase();
              return name.contains(q) ||
                  shown.contains(q) ||
                  category.contains(q) ||
                  barcode.contains(q);
            }).toList()
            ..sort(_compareBySort);
    });
  }

  int _compareBySort(dynamic a, dynamic b) {
    switch (_sortMode) {
      case _ItemSort.name:
        return (a['name'] as String).compareTo(b['name'] as String);
      case _ItemSort.stockLow:
        return (a['stock_quantity'] as num).compareTo(
          b['stock_quantity'] as num,
        );
      case _ItemSort.recent:
        return (b['created_at'] as String).compareTo(a['created_at'] as String);
    }
  }

  void _setSort(_ItemSort mode) {
    setState(() => _sortMode = mode);
    applySearch(_searchController.text);
  }

  void _selectCategory(String? category) {
    HapticFeedback.selectionClick();
    setState(() {
      _selectedCategory = category;
      _lowStockOnly = false;
    });
    applySearch(_searchController.text);
  }

  bool _isLowStock(dynamic item) {
    final stock = (item['stock_quantity'] as num?)?.toDouble() ?? 0;
    final threshold = (item['low_stock_threshold'] as num?)?.toDouble() ?? 5;
    return stock <= threshold;
  }

  void _toggleLowStockOnly() {
    HapticFeedback.selectionClick();
    setState(() {
      _lowStockOnly = !_lowStockOnly;
      if (_lowStockOnly) _selectedCategory = null;
    });
    applySearch(_searchController.text);
  }

  @override
  void dispose() {
    SyncService.instance.syncTick.removeListener(_onSyncTick);
    _searchController.dispose();
    _speech.stop();
    _pulse?.dispose();
    super.dispose();
  }

  Future<void> _toggleVoiceSearch() async {
    if (_isListening) {
      await _speech.stop();
      if (mounted) setState(() => _isListening = false);
      return;
    }
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.micPermissionNeeded)));
      }
      return;
    }
    final available = await _speech.initialize(
      onStatus: (status) {
        if ((status == 'done' || status == 'notListening') && mounted) {
          setState(() => _isListening = false);
        }
      },
      onError: (_) {
        if (mounted) setState(() => _isListening = false);
      },
    );
    if (!available) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.speechUnavailable)));
      }
      return;
    }
    setState(() => _isListening = true);
    _speech.listen(
      onResult: (result) {
        _searchController.text = result.recognizedWords;
        applySearch(result.recognizedWords);
      },
    );
  }

  Future<void> bulkAdd() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BulkAddItemsScreen()),
    );
    if (result == true) fetchItems();
  }

  Future<void> updateStock() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UpdateStockScreen()),
    );
    if (result == true) fetchItems();
  }

  Future<void> scanForItem() async {
    final code = await scanBarcode(context, title: context.t.scanToFindItem);
    if (code == null) return;
    final trimmed = code.trim();

    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/items/by-barcode/$trimmed'),
      );
      if (!mounted) return;

      if (response.statusCode == 200) {
        await _editItem(jsonDecode(response.body));
        return;
      }

      if (response.statusCode == 404) {
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
        if (createNew != true || !mounted) return;
        final created = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddItemScreen(initialBarcode: trimmed),
          ),
        );
        if (created == true) fetchItems();
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.serverError(response.statusCode))),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.couldNotConnect('$e'))));
    }
  }

  Future<void> mergeDuplicates() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.itmMergeTitle),
            content: Text(context.t.itmMergeBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.t.itmMerge),
              ),
            ],
          ),
    );
    if (confirm != true) return;

    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/items/dedupe'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        final removed =
            (jsonDecode(response.body)['duplicates_removed'] as num).toInt();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              removed == 0
                  ? context.t.itmNoDuplicates
                  : context.t.itmMerged(removed),
            ),
          ),
        );
        if (removed > 0) fetchItems();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.serverError(response.statusCode))),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.couldNotConnect('$e'))));
    }
  }

  Future<void> _deleteItem(dynamic item) async {
    final messenger = ScaffoldMessenger.of(context);
    final confirm = await confirmDelete(
      context,
      title: context.t.itmDeleteTitle,
      message: context.t.itmCannotUndo,
    );
    if (!confirm) return;
    try {
      await http.delete(Uri.parse('${AppConfig.baseUrl}/items/${item['id']}'));
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(context.t.itmDeleteOffline)),
        );
      }
    }
    fetchItems();
  }

  Future<void> _bulkDelete() async {
    final count = _selectedIds.length;
    final confirm = await confirmDelete(
      context,
      title: context.t.itmDeleteManyTitle(count),
      message: context.t.itmDeleteManyBody(count),
    );
    if (!confirm) return;
    final ids = List<String>.from(_selectedIds);
    setState(() {
      _selecting = false;
      _selectedIds.clear();
    });
    await Future.wait(
      ids.map(
        (id) => http
            .delete(Uri.parse('${AppConfig.baseUrl}/items/$id'))
            .catchError((_) => http.Response('', 0)),
      ),
    );
    fetchItems();
  }

  Widget _selectionBar() {
    final primary = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
              tooltip:
                  _selectedIds.length == filteredItems.length
                      ? context.t.deselectAll
                      : context.t.selectAll,
              icon: Icon(
                _selectedIds.length == filteredItems.length
                    ? Icons.deselect
                    : Icons.select_all,
                color: Colors.white,
              ),
              onPressed:
                  () => setState(() {
                    final allIds = filteredItems.map(
                      (it) => it['id'] as String,
                    );
                    if (_selectedIds.length == filteredItems.length) {
                      _selectedIds.clear();
                    } else {
                      _selectedIds
                        ..clear()
                        ..addAll(allIds);
                    }
                  }),
            ),
            Expanded(
              child: Text(
                context.t.selectedCount(_selectedIds.length),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: _selectedIds.isEmpty ? null : _bulkDelete,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              child: Text(
                context.t.delete,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            IconButton(
              tooltip: context.t.cancel,
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed:
                  () => setState(() {
                    _selecting = false;
                    _selectedIds.clear();
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _quickAddPhoto(dynamic item) async {
    final picked = await pickImageFile(context);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    try {
      final uri = Uri.parse('${AppConfig.baseUrl}/items/${item['id']}/image');
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: picked.name),
      );
      final streamed = await request.send().timeout(http.uploadTimeout);
      if (streamed.statusCode == 200) {
        fetchItems();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              context.t.itmPhotoUploadFailedCode(streamed.statusCode),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.itmPhotoUploadFailed('$e'))),
        );
      }
    }
  }

  Future<void> _editItem(dynamic item) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddItemScreen(
              itemId: item['id'],
              initialName: item['name'],
              initialUnit: item['unit'],
              initialPrice: item['price'].toString(),
              initialCategory: item['category'],
              initialHsnCode: item['hsn_code'],
              initialGstRate:
                  item['gst_rate'] != null
                      ? (item['gst_rate'] as num).toDouble()
                      : null,
              initialStock: item['stock_quantity'].toString(),
              initialThreshold: item['low_stock_threshold'].toString(),
              initialBarcode: item['barcode'],
              initialCostPrice: item['cost_price']?.toString(),
              initialWholesalePrice: item['wholesale_price']?.toString(),
              initialContractorPrice: item['contractor_price']?.toString(),
              initialImageUrl: item['image_url'],
              initialPreferredSupplierId: item['preferred_supplier_id'],
            ),
      ),
    );
    if (result == true) fetchItems();
  }

  Future<void> _duplicateItem(dynamic item) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddItemScreen(
              initialName: item['name'],
              initialUnit: item['unit'],
              initialPrice: item['price']?.toString(),
              initialCategory: item['category'],
              initialHsnCode: item['hsn_code'],
              initialGstRate:
                  item['gst_rate'] != null
                      ? (item['gst_rate'] as num).toDouble()
                      : null,
              initialThreshold: item['low_stock_threshold']?.toString(),
              initialCostPrice: item['cost_price']?.toString(),
              initialWholesalePrice: item['wholesale_price']?.toString(),
              initialContractorPrice: item['contractor_price']?.toString(),
              initialPreferredSupplierId: item['preferred_supplier_id'],
            ),
      ),
    );
    if (result == true) fetchItems();
  }

  Future<void> _reorderItem(dynamic item) async {
    final supplierId = item['preferred_supplier_id'] as String?;
    if (supplierId == null) return;
    final threshold = (item['low_stock_threshold'] as num?)?.toDouble() ?? 5;
    final current = (item['stock_quantity'] as num?)?.toDouble() ?? 0;
    final suggestedQty = (threshold * 2 - current).clamp(1, double.infinity);
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddPurchaseScreen(
              supplierId: supplierId,
              initialLineItems: [
                {
                  'item_id': item['id'],
                  'item_name': item['name'],
                  'unit_price': (item['cost_price'] as num?)?.toDouble() ?? 0.0,
                  'quantity': suggestedQty,
                },
              ],
            ),
      ),
    );
    if (result == true) fetchItems();
  }

  Future<void> bulkPrintLabels() async {
    final withBarcode =
        items
            .where((it) => (it['barcode'] as String?)?.isNotEmpty == true)
            .toList();
    if (withBarcode.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.itmNoBarcodes)));
      return;
    }

    final selected = <String>{for (final it in withBarcode) it['id'] as String};

    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final allSelected = selected.length == withBarcode.length;
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
                        Icons.print_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.t.printLabels,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${selected.length} of ${withBarcode.length} selected',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            () => setSheetState(() {
                              if (allSelected) {
                                selected.clear();
                              } else {
                                selected
                                  ..clear()
                                  ..addAll(
                                    withBarcode.map((it) => it['id'] as String),
                                  );
                              }
                            }),
                        child: Text(
                          allSelected
                              ? context.t.deselectAll
                              : context.t.selectAll,
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 360),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: withBarcode.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, i) {
                        final it = withBarcode[i];
                        final id = it['id'] as String;
                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(context.itemName(it['name'])),
                          subtitle: Text(formatMoney(it['price'])),
                          value: selected.contains(id),
                          onChanged:
                              (v) => setSheetState(() {
                                if (v == true) {
                                  selected.add(id);
                                } else {
                                  selected.remove(id);
                                }
                              }),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  GradientButton(
                    icon: Icons.print,
                    label: context.t.itmPrintCount(selected.length),
                    onPressed:
                        selected.isEmpty
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

    final toPrint =
        withBarcode
            .where((it) => selected.contains(it['id']))
            .map(
              (it) => LabelItem(
                name: it['name'] as String,
                price: (it['price'] as num).toString(),
                code: it['barcode'] as String,
              ),
            )
            .toList();
    await printBarcodeLabels(toPrint);
  }

  Future<void> addItem() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddItemScreen()),
    );
    if (result == true) fetchItems();
  }

  Widget _summaryLine() {
    final lowStockCount = items.where(_isLowStock).length;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: AppCard(
        radius: 20,
        shadowStrength: 0.5,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconBadge(
              Icons.inventory_2_outlined,
              Theme.of(context).colorScheme.primary,
              size: 34,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: items.length.toDouble()),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                builder:
                    (context, value, _) => Text(
                      context.t.itemCount(value.round()),
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
              ),
            ),
            if (lowStockCount > 0)
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: lowStockCount.toDouble()),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                builder:
                    (context, value, _) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppStyle.tint(context, Colors.orange.shade800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        context.t.itmLowStockBadge(value.round()),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange.shade800,
                        ),
                      ),
                    ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AdaptiveColumn(
      children: [
        if (_selecting) _selectionBar(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Row(
            children: [
              Expanded(
                child: GlassSearchBar(
                  controller: _searchController,
                  hintText: context.t.itmSearchHint,
                  onChanged: applySearch,
                ),
              ),
              const SizedBox(width: 4),
              AppIconButton(
                icon: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  color: _isListening ? Colors.red : null,
                ),
                tooltip:
                    _isListening
                        ? context.t.itmStopListening
                        : context.t.itmVoiceSearch,
                onPressed: _toggleVoiceSearch,
              ),
              PopupMenuButton<_ItemSort>(
                icon: const Icon(Icons.sort),
                tooltip: context.t.itmSort,
                initialValue: _sortMode,
                onSelected: _setSort,
                itemBuilder:
                    (context) => [
                      PopupMenuItem(
                        value: _ItemSort.name,
                        child: Text(context.t.itmSortName),
                      ),
                      PopupMenuItem(
                        value: _ItemSort.stockLow,
                        child: Text(context.t.itmSortStockLow),
                      ),
                      PopupMenuItem(
                        value: _ItemSort.recent,
                        child: Text(context.t.itmSortRecent),
                      ),
                    ],
              ),
            ],
          ),
        ),
        if (items.isNotEmpty) _summaryLine(),
        if (_availableCategories.isNotEmpty || items.any(_isLowStock))
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                CategoryChip(
                  label: context.t.itmFilterAll,
                  selected: _selectedCategory == null,
                  onSelected: (_) => _selectCategory(null),
                ),
                if (items.any(_isLowStock))
                  CategoryChip(
                    label: context.t.itmFilterLowStock,
                    color: Colors.orange.shade700,
                    selected: _lowStockOnly,
                    onSelected: (_) => _toggleLowStockOnly(),
                  ),
                for (final cat in _availableCategories)
                  CategoryChip(
                    label: context.categoryName(cat),
                    selected: _selectedCategory == cat,
                    color: AppStyle.colorForKey(cat),
                    onSelected: (_) => _selectCategory(cat),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        Expanded(
          child:
              isLoading
                  ? const SkeletonListLoader()
                  : errorMessage != null
                  ? errorRetry(errorMessage!, fetchItems)
                  : RefreshIndicator(
                    onRefresh: fetchItems,
                    child:
                        filteredItems.isEmpty
                            ? ListView(
                              children: [
                                const SizedBox(height: 120),
                                Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        items.isEmpty
                                            ? Icons.inventory_2_outlined
                                            : Icons.search_off,
                                        size: 48,
                                        color: theme
                                            .colorScheme
                                            .onSurfaceVariant
                                            .withValues(alpha: 0.5),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        items.isEmpty
                                            ? context.t.itmNoItemsYet
                                            : context.t.itmNoItemsMatch,
                                        style: TextStyle(
                                          color:
                                              theme
                                                  .colorScheme
                                                  .onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                            : ListView.builder(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                final item = filteredItems[index];
                                final id = item['id'] as String;
                                final tile = Dismissible(
                                  key: Key(item['id']),
                                  direction:
                                      _selecting
                                          ? DismissDirection.none
                                          : DismissDirection.horizontal,
                                  background: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                      await _editItem(item);
                                      return false;
                                    }
                                    return confirmDelete(
                                      context,
                                      title: context.t.itmDeleteTitle,
                                      message: context.t.itmCannotUndo,
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
                                          '${AppConfig.baseUrl}/items/${item['id']}',
                                        ),
                                      );
                                    } catch (_) {
                                      if (mounted) {
                                        messenger.showSnackBar(
                                          SnackBar(
                                            content: Text(t.itmDeleteOffline),
                                          ),
                                        );
                                      }
                                    }
                                    fetchItems();
                                  },
                                  child: _itemCard(context, item),
                                );
                                return GestureDetector(
                                  onLongPress:
                                      () => setState(() {
                                        _selecting = true;
                                        _selectedIds.add(id);
                                      }),
                                  onTap:
                                      !_selecting
                                          ? null
                                          : () => setState(() {
                                            if (_selectedIds.contains(id)) {
                                              _selectedIds.remove(id);
                                              if (_selectedIds.isEmpty) {
                                                _selecting = false;
                                              }
                                            } else {
                                              _selectedIds.add(id);
                                            }
                                          }),
                                  child: tile,
                                );
                              },
                            ),
                  ),
        ),
      ],
    );
  }

  Widget _plainAvatar(Color fillColor, String initial) => CircleAvatar(
    radius: 24,
    backgroundColor: fillColor,
    child: Text(
      initial,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w800,
        fontSize: 18,
      ),
    ),
  );

  Widget _itemThumbnail(
    dynamic item,
    Color avatarColor,
    String initial, {
    required bool selected,
  }) {
    final imageUrl = item['image_url'] as String?;
    final fillColor = AppStyle.highContrastFill(context, avatarColor);
    final hasPhoto = imageUrl != null && imageUrl.isNotEmpty;

    final avatar =
        hasPhoto
            ? GestureDetector(
              onTap:
                  _selecting
                      ? null
                      : () => showDialog(
                        context: context,
                        builder:
                            (context) => Dialog(
                              child: Image.network(
                                AppConfig.mediaUrl(imageUrl),
                              ),
                            ),
                      ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  AppConfig.mediaUrl(imageUrl),
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stack) =>
                          _plainAvatar(fillColor, initial),
                ),
              ),
            )
            : _plainAvatar(fillColor, initial);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        if (selected)
          const Positioned(
            right: -2,
            bottom: -2,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Icon(Icons.check, size: 14, color: Colors.white),
            ),
          )
        else if (!hasPhoto && !_selecting)
          Positioned(
            right: -2,
            bottom: -2,
            child: GestureDetector(
              onTap: () => _quickAddPhoto(item),
              child: IconBadge(
                Icons.add_a_photo,
                Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _showPriceHistory(String itemId, String itemName) async {
    List<dynamic> history = [];
    String? error;
    final t = context.t;
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/items/$itemId/price-history'),
      );
      if (response.statusCode == 200) {
        history = jsonDecode(response.body);
      } else {
        error = t.serverError(response.statusCode);
      }
    } catch (e) {
      error = t.couldNotConnect('$e');
    }
    if (!mounted) return;

    final rows = <HistoryRow>[];
    for (var i = 0; i < history.length; i++) {
      final entry = history[history.length - 1 - i];
      final by = entry['created_by_name'] ?? entry['created_by_email'];
      final prev =
          i + 1 < history.length ? history[history.length - 2 - i] : null;
      final price = (entry['price'] as num).toDouble();
      final prevPrice = (prev?['price'] as num?)?.toDouble();
      final diff = prevPrice == null ? null : price - prevPrice;
      rows.add(
        HistoryRow(
          icon:
              diff == null
                  ? Icons.fiber_manual_record_outlined
                  : diff > 0
                  ? Icons.trending_up_rounded
                  : diff < 0
                  ? Icons.trending_down_rounded
                  : Icons.trending_flat_rounded,
          color:
              diff == null || diff == 0
                  ? Colors.blueGrey
                  : diff > 0
                  ? Colors.red.shade400
                  : Colors.green.shade500,
          title: formatMoney(price, decimals: 2),
          subtitle: [
            _stamp(entry['changed_at'] as String),
            if (by != null) by as String,
            if (entry['cost_price'] != null)
              t.itmCost(formatMoney((entry['cost_price'] as num), decimals: 2)),
          ].join(' • '),
          badge:
              diff == null || diff == 0
                  ? null
                  : '‎${diff > 0 ? '+' : '-'}${formatMoney(diff.abs(), decimals: 2)}',
        ),
      );
    }

    HistorySummary? summary;
    if (error == null && history.isNotEmpty) {
      final prices = [for (final e in history) (e['price'] as num).toDouble()];
      final change =
          prices.length > 1 && prices.first != 0
              ? (prices.last - prices.first) / prices.first * 100
              : null;
      summary = HistorySummary(
        value: formatMoney(prices.last, decimals: 2),
        delta:
            change == null || change == 0
                ? null
                : '‎${change > 0 ? '+' : ''}${change.toStringAsFixed(1)}%',
        deltaColor:
            (change ?? 0) > 0 ? Colors.red.shade400 : Colors.green.shade500,
        spark: prices,
      );
    }

    showHistorySheet(
      context,
      icon: Icons.sell_outlined,
      title: t.itmMenuPriceHistory,
      itemName: context.itemName(itemName),
      emptyText: t.itmNoPriceChanges,
      error: error,
      rows: rows,
      summary: summary,
      resetLabel: t.itmResetHistory,
      onReset: () => _resetHistory(itemId, 'price-history'),
      shareLabel: t.itmSendPdf,
      onShare: () => _sendHistoryPdf(itemId, 'price-history', t.itmMenuPriceHistory),
      editLabel: t.itmEditEntry,
      removeLabel: t.itmRemoveEntry,
      onEdit: (i) => _editPriceEntry(itemId, history[history.length - 1 - i]),
      onRemove:
          (i) => _removeEntry(
            itemId,
            'price-history',
            history[history.length - 1 - i]['id'] as String,
          ),
      onChanged: () => _showPriceHistory(itemId, itemName),
    );
  }

  Future<void> _showStockHistory(String itemId, String itemName) async {
    List<dynamic> history = [];
    String? error;
    final t = context.t;
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/items/$itemId/stock-adjustments'),
      );
      if (response.statusCode == 200) {
        history = jsonDecode(response.body);
      } else {
        error = t.serverError(response.statusCode);
      }
    } catch (e) {
      error = t.couldNotConnect('$e');
    }
    if (!mounted) return;

    final rows = <HistoryRow>[];
    for (var i = 0; i < history.length; i++) {
      final entry = history[history.length - 1 - i];
      final prevQty = (entry['previous_quantity'] as num).toDouble();
      final newQty = (entry['new_quantity'] as num).toDouble();
      final diff = newQty - prevQty;
      final by = entry['created_by_name'] ?? entry['created_by_email'];
      rows.add(
        HistoryRow(
          icon:
              diff > 0
                  ? Icons.north_east_rounded
                  : diff < 0
                  ? Icons.south_east_rounded
                  : Icons.trending_flat_rounded,
          color:
              diff > 0
                  ? Colors.green.shade500
                  : diff < 0
                  ? Colors.red.shade400
                  : Colors.blueGrey,
          title: '‎${_fmtQty(prevQty)} → ${_fmtQty(newQty)}',
          subtitle: [
            _stamp(entry['created_at'] as String),
            if (by != null) by as String,
          ].join(' • '),
          badge: diff == 0 ? null : '‎${diff > 0 ? '+' : ''}${_fmtQty(diff)}',
          note: entry['note'] as String?,
        ),
      );
    }

    HistorySummary? summary;
    if (error == null && history.isNotEmpty) {
      final qty = [
        (history.first['previous_quantity'] as num).toDouble(),
        for (final e in history) (e['new_quantity'] as num).toDouble(),
      ];
      final net = qty.last - qty.first;
      summary = HistorySummary(
        value: _fmtQty(qty.last),
        delta: net == 0 ? null : '‎${net > 0 ? '+' : ''}${_fmtQty(net)}',
        deltaColor: net > 0 ? Colors.green.shade500 : Colors.red.shade400,
        spark: qty,
      );
    }

    showHistorySheet(
      context,
      icon: Icons.inventory_2_outlined,
      title: t.itmMenuStockHistory,
      itemName: context.itemName(itemName),
      emptyText: t.itmNoStockCorrections,
      error: error,
      rows: rows,
      summary: summary,
      resetLabel: t.itmResetHistory,
      onReset: () => _resetHistory(itemId, 'stock-adjustments'),
      shareLabel: t.itmSendPdf,
      onShare:
          () => _sendHistoryPdf(
            itemId,
            'stock-adjustments',
            t.itmMenuStockHistory,
          ),
      editLabel: t.itmEditEntry,
      removeLabel: t.itmRemoveEntry,
      onEdit: (i) => _editStockEntry(itemId, history[history.length - 1 - i]),
      onRemove:
          (i) => _removeEntry(
            itemId,
            'stock-adjustments',
            history[history.length - 1 - i]['id'] as String,
          ),
      onChanged: () => _showStockHistory(itemId, itemName),
    );
  }

  Future<bool> _resetHistory(String itemId, String path) async {
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    final ok = await confirmDelete(
      context,
      title: t.itmResetHistory,
      message: t.itmResetHistoryMsg,
    );
    if (!ok) return false;
    try {
      final r = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/items/$itemId/$path'),
      );
      if (r.statusCode == 200) return true;
      messenger.showSnackBar(SnackBar(content: Text(t.serverError(r.statusCode))));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(t.couldNotConnect('$e'))));
    }
    return false;
  }

  String _stamp(String iso) {
    final utc = iso.endsWith('Z') || iso.contains('+') ? iso : '${iso}Z';
    final d = DateTime.parse(utc).toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)} ${two(d.hour)}:${two(d.minute)}';
  }

  Future<void> _sendHistoryPdf(String itemId, String path, String label) =>
      fetchAndPrintPdf(
        context,
        url:
            '${AppConfig.baseUrl}/items/$itemId/$path/pdf?language=${Localizations.localeOf(context).languageCode}&tz=${DateTime.now().timeZoneOffset.inMinutes}',
        errorLabel: label,
      );

  Future<bool> _entryCall(Future<dynamic> Function() send) async {
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      final r = await send();
      if (r.statusCode == 200) return true;
      messenger.showSnackBar(
        SnackBar(content: Text(t.serverError(r.statusCode as int))),
      );
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(t.couldNotConnect('$e'))));
    }
    return false;
  }

  Future<bool> _removeEntry(String itemId, String path, String entryId) async {
    final t = context.t;
    final ok = await confirmDelete(
      context,
      title: t.itmRemoveEntry,
      message: t.itmRemoveEntryMsg,
    );
    if (!ok || !mounted) return false;
    return _entryCall(
      () => http.delete(
        Uri.parse('${AppConfig.baseUrl}/items/$itemId/$path/$entryId'),
      ),
    );
  }

  Future<bool> _putEntry(
    String itemId,
    String path,
    String entryId,
    Map<String, dynamic> body,
  ) => _entryCall(
    () => http.put(
      Uri.parse('${AppConfig.baseUrl}/items/$itemId/$path/$entryId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    ),
  );

  Future<bool> _editDialog(
    List<({String label, TextEditingController c, bool number})> fields,
  ) async {
    final t = context.t;
    final ok = await showDialog<bool>(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(t.itmEditEntry),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final f in fields)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextField(
                        controller: f.c,
                        keyboardType:
                            f.number
                                ? const TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: true,
                                )
                                : TextInputType.text,
                        decoration: InputDecoration(labelText: f.label),
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(t.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(t.itmSaveChanges),
              ),
            ],
          ),
    );
    return ok == true && mounted;
  }

  Future<bool> _editPriceEntry(String itemId, dynamic e) async {
    final t = context.t;
    final messenger = ScaffoldMessenger.of(context);
    final cost = e['cost_price'] as num?;
    final price = TextEditingController(
      text: _fmtQty((e['price'] as num).toDouble()),
    );
    final costField = TextEditingController(
      text: cost == null ? '' : _fmtQty(cost.toDouble()),
    );
    final ok = await _editDialog([
      (label: t.itmPricePkr, c: price, number: true),
      (label: t.itmPurchaseCost, c: costField, number: true),
    ]);
    if (!ok) return false;
    final p = double.tryParse(price.text.trim());
    final c = double.tryParse(costField.text.trim());
    if (p == null || (costField.text.trim().isNotEmpty && c == null)) {
      messenger.showSnackBar(SnackBar(content: Text(t.saveFailed(422))));
      return false;
    }
    return _putEntry(itemId, 'price-history', e['id'] as String, {
      'price': p,
      'cost_price': c,
    });
  }

  Future<bool> _editStockEntry(String itemId, dynamic e) async {
    final t = context.t;
    final messenger = ScaffoldMessenger.of(context);
    final prev = TextEditingController(
      text: _fmtQty((e['previous_quantity'] as num).toDouble()),
    );
    final next = TextEditingController(
      text: _fmtQty((e['new_quantity'] as num).toDouble()),
    );
    final note = TextEditingController(text: (e['note'] as String?) ?? '');
    final ok = await _editDialog([
      (label: t.itmPrevQty, c: prev, number: true),
      (label: t.itmNewQty, c: next, number: true),
      (label: t.itmNoteOptional, c: note, number: false),
    ]);
    if (!ok) return false;
    final a = double.tryParse(prev.text.trim());
    final b = double.tryParse(next.text.trim());
    if (a == null || b == null) {
      messenger.showSnackBar(SnackBar(content: Text(t.saveFailed(422))));
      return false;
    }
    return _putEntry(itemId, 'stock-adjustments', e['id'] as String, {
      'previous_quantity': a,
      'new_quantity': b,
      'note': note.text,
    });
  }

  String _fmtQty(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toString();

  Widget _itemCard(BuildContext context, dynamic item) {
    final theme = Theme.of(context);
    final avatarColor = AppStyle.colorForKey(item['category'] as String?);
    final stockQty = item['stock_quantity'] as num;
    final lowStock = stockQty <= (item['low_stock_threshold'] as num);
    final outOfStock = stockQty <= 0;
    final name = context.itemName(item['name']);
    final initial = name.trim().isNotEmpty ? name.trim()[0].toUpperCase() : '?';

    final details = <String>[
      context.unitName(item['unit']),
      if (item['category'] != null) context.categoryName(item['category']),
    ].join(' \u2022 ');
    final stockLine = [
      context.t.itmStockLine('${item['stock_quantity']}'),
      if (item['hsn_code'] != null) 'HSN ${item['hsn_code']}',
      if (item['gst_rate'] != null) 'GST ${item['gst_rate']}%',
    ].join(' \u2022 ');

    final glow = theme.colorScheme.primary;
    final dark = AppStyle.isDark(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: glow.withValues(alpha: dark ? 0.45 : 0.30),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GlassContainer(
        borderRadius: 22,
        tint: glow,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: avatarColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      _itemThumbnail(
                        item,
                        avatarColor,
                        initial,
                        selected: _selectedIds.contains(item['id']),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${formatMoney(item['price'])} / $details',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.5,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              stockLine,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color:
                                    outOfStock
                                        ? Colors.red.shade700
                                        : lowStock
                                        ? Colors.orange.shade800
                                        : theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (lowStock)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child:
                              outOfStock
                                  ? AnimatedBuilder(
                                    animation: _pulseController,
                                    builder:
                                        (context, child) => Opacity(
                                          opacity:
                                              0.6 +
                                              0.4 * _pulseController.value,
                                          child: child,
                                        ),
                                    child: Icon(
                                      Icons.remove_shopping_cart,
                                      color: Colors.red.shade700,
                                      size: 20,
                                    ),
                                  )
                                  : const Icon(
                                    Icons.warning_amber_rounded,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                        ),
                      PopupMenuButton<VoidCallback>(
                        icon: const Icon(Icons.more_vert, size: 20),
                        tooltip: context.t.itmMore,
                        padding: const EdgeInsets.all(4),
                        onSelected: (action) => action(),
                        itemBuilder:
                            (context) => [
                              PopupMenuItem(
                                value: () => _editItem(item),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: IconBadge(
                                    Icons.edit_outlined,
                                    Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                  title: Text(
                                    context.t.edit,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              if (item['barcode'] != null)
                                PopupMenuItem(
                                  value:
                                      () => printBarcodeLabel(
                                        name: item['name'],
                                        price:
                                            (item['price'] as num).toString(),
                                        code: (item['barcode'] as String),
                                      ),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: IconBadge(
                                      Icons.print_outlined,
                                      Theme.of(context).colorScheme.primary,
                                      size: 30,
                                    ),
                                    title: Text(
                                      context.t.itmMenuPrintLabel,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              if (lowStock &&
                                  item['preferred_supplier_id'] != null)
                                PopupMenuItem(
                                  value: () => _reorderItem(item),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: IconBadge(
                                      Icons.add_shopping_cart_outlined,
                                      Colors.orange.shade800,
                                      size: 30,
                                    ),
                                    title: Text(
                                      context.t.reorder,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              PopupMenuItem(
                                value: () => _duplicateItem(item),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: IconBadge(
                                    Icons.copy_outlined,
                                    Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                  title: Text(
                                    context.t.itmMenuDuplicate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value:
                                    () => _showPriceHistory(
                                      item['id'],
                                      item['name'],
                                    ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: IconBadge(
                                    Icons.history,
                                    Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                  title: Text(
                                    context.t.itmMenuPriceHistory,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value:
                                    () => _showStockHistory(
                                      item['id'],
                                      item['name'],
                                    ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: IconBadge(
                                    Icons.fact_check_outlined,
                                    Theme.of(context).colorScheme.primary,
                                    size: 30,
                                  ),
                                  title: Text(
                                    context.t.itmMenuStockHistory,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const PopupMenuDivider(height: 1),
                              PopupMenuItem(
                                value: () => _deleteItem(item),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: IconBadge(
                                    Icons.delete_outline,
                                    Colors.red.shade700,
                                    size: 30,
                                  ),
                                  title: Text(
                                    context.t.delete,
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                      ),
                    ],
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

class AddItemScreen extends StatefulWidget {
  final String? itemId;
  final String? initialName;
  final String? initialUnit;
  final String? initialPrice;
  final String? initialCategory;
  final String? initialHsnCode;
  final double? initialGstRate;
  final String? initialStock;
  final String? initialThreshold;
  final String? initialBarcode;
  final String? initialCostPrice;
  final String? initialWholesalePrice;
  final String? initialContractorPrice;
  final String? initialImageUrl;
  final String? initialPreferredSupplierId;

  const AddItemScreen({
    super.key,
    this.itemId,
    this.initialName,
    this.initialUnit,
    this.initialPrice,
    this.initialCategory,
    this.initialHsnCode,
    this.initialGstRate,
    this.initialStock,
    this.initialThreshold,
    this.initialBarcode,
    this.initialCostPrice,
    this.initialWholesalePrice,
    this.initialContractorPrice,
    this.initialImageUrl,
    this.initialPreferredSupplierId,
  });

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _categoryController;
  late final TextEditingController _hsnController;
  late final TextEditingController _gstController;
  late final TextEditingController _stockController;
  late final TextEditingController _thresholdController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _costController;
  late final TextEditingController _wholesalePriceController;
  late final TextEditingController _contractorPriceController;
  late String _unit;
  bool isSaving = false;
  String? errorMessage;
  String? _existingImageUrl;
  XFile? _pickedImage;
  Uint8List? _pickedImageBytes;
  List<dynamic> _suppliers = [];
  String? _preferredSupplierId;
  final _supplierController = TextEditingController();
  final _supplierFocusNode = FocusNode();
  List<dynamic> _frequentlyBoughtWith = [];

  bool get isEditing => widget.itemId != null;

  final List<String> unitOptions = [
    'piece',
    'kg',
    'meter',
    'box',
    'dozen',
    'liter',
    'bag',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _priceController = TextEditingController(text: widget.initialPrice ?? '');
    _categoryController = TextEditingController(
      text: widget.initialCategory ?? '',
    );
    _hsnController = TextEditingController(text: widget.initialHsnCode ?? '');
    _gstController = TextEditingController(
      text:
          widget.initialGstRate != null ? widget.initialGstRate.toString() : '',
    );
    _stockController = TextEditingController(text: widget.initialStock ?? '0');
    _thresholdController = TextEditingController(
      text: widget.initialThreshold ?? '5',
    );
    _barcodeController = TextEditingController(
      text: widget.initialBarcode ?? '',
    );
    _costController = TextEditingController(
      text: widget.initialCostPrice ?? '',
    );
    _wholesalePriceController = TextEditingController(
      text: widget.initialWholesalePrice ?? '',
    );
    _contractorPriceController = TextEditingController(
      text: widget.initialContractorPrice ?? '',
    );
    _unit = widget.initialUnit ?? 'piece';
    _existingImageUrl = widget.initialImageUrl;
    _preferredSupplierId = widget.initialPreferredSupplierId;
    _fetchSuppliers();
    if (isEditing) _fetchFrequentlyBoughtWith();
  }

  Future<void> _fetchSuppliers() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/suppliers'),
      );
      if (response.statusCode == 200 && mounted) {
        setState(() {
          _suppliers = jsonDecode(response.body);
          if (_preferredSupplierId != null) {
            final match = _suppliers.cast<Map<String, dynamic>>().firstWhere(
              (s) => s['id'] == _preferredSupplierId,
              orElse: () => {},
            );
            _supplierController.text = match['name'] as String? ?? '';
          }
        });
      }
    } catch (_) {}
  }

  Future<void> _fetchFrequentlyBoughtWith() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/items/${widget.itemId}/frequently-bought-with',
        ),
      );
      if (response.statusCode == 200 && mounted) {
        setState(() => _frequentlyBoughtWith = jsonDecode(response.body));
      }
    } catch (_) {}
  }

  Future<void> _pickImage() async {
    final picked = await pickImageFile(context);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    setState(() {
      _pickedImage = picked;
      _pickedImageBytes = bytes;
    });
  }

  Future<void> _uploadImageIfPicked(String itemId) async {
    if (_pickedImage == null || _pickedImageBytes == null) return;
    try {
      final uri = Uri.parse('${AppConfig.baseUrl}/items/$itemId/image');
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          _pickedImageBytes!,
          filename: _pickedImage!.name,
        ),
      );
      final streamed = await request.send().timeout(http.uploadTimeout);
      if (streamed.statusCode != 200) {
        debugPrint('[Items] Image upload failed: ${streamed.statusCode}');
      }
    } catch (e) {
      debugPrint('[Items] Image upload error: $e');
    }
  }

  Future<void> saveItem() async {
    final t = context.t;
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isSaving = true;
      errorMessage = null;
    });

    final body = jsonEncode({
      'name': _nameController.text.trim(),
      'unit': _unit,
      'price': double.parse(_priceController.text.trim()),
      'category':
          _categoryController.text.trim().isEmpty
              ? null
              : _categoryController.text.trim(),
      'hsn_code':
          _hsnController.text.trim().isEmpty
              ? null
              : _hsnController.text.trim(),
      'gst_rate':
          _gstController.text.trim().isEmpty
              ? null
              : double.tryParse(_gstController.text.trim()),
      'stock_quantity': double.tryParse(_stockController.text.trim()) ?? 0,
      'low_stock_threshold':
          double.tryParse(_thresholdController.text.trim()) ?? 5,
      'barcode':
          _barcodeController.text.trim().isEmpty
              ? null
              : _barcodeController.text.trim(),
      'image_url': _existingImageUrl,
      'cost_price':
          _costController.text.trim().isEmpty
              ? null
              : double.tryParse(_costController.text.trim()),
      'wholesale_price':
          _wholesalePriceController.text.trim().isEmpty
              ? null
              : double.tryParse(_wholesalePriceController.text.trim()),
      'contractor_price':
          _contractorPriceController.text.trim().isEmpty
              ? null
              : double.tryParse(_contractorPriceController.text.trim()),
      'preferred_supplier_id': _preferredSupplierId,
    });

    try {
      final response =
          isEditing
              ? await http.put(
                Uri.parse('${AppConfig.baseUrl}/items/${widget.itemId}'),
                headers: {'Content-Type': 'application/json'},
                body: body,
              )
              : await http.post(
                Uri.parse('${AppConfig.baseUrl}/items'),
                headers: {'Content-Type': 'application/json'},
                body: body,
              );

      if (response.statusCode == 200) {
        final savedId =
            widget.itemId ?? jsonDecode(response.body)['id'] as String;
        await _uploadImageIfPicked(savedId);
        if (mounted) Navigator.pop(context, true);
      } else if (mounted) {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isSaving = false;
        });
      }
    } catch (e) {
      await LocalDb.instance.enqueueWrite(
        method: isEditing ? 'PUT' : 'POST',
        path: isEditing ? '/items/${widget.itemId}' : '/items',
        label: t.qItem(_nameController.text.trim()),
        payload: jsonDecode(body),
        photoBytes: _pickedImageBytes,
        photoFilename: _pickedImage?.name,
        photoUploadSuffix: 'image',
      );
      await SyncService.instance.refreshPendingCount();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.itmOfflineSaved)));
        Navigator.pop(context, true);
      }
    }
  }

  @override
  void dispose() {
    _supplierController.dispose();
    _supplierFocusNode.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    _hsnController.dispose();
    _gstController.dispose();
    _stockController.dispose();
    _thresholdController.dispose();
    _barcodeController.dispose();
    _costController.dispose();
    _wholesalePriceController.dispose();
    _contractorPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(
        title: isEditing ? context.t.itmEditItem : context.t.itmAddItem,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: _imagePicker(context)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: context.t.itmItemName,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.t.itmNameRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: context.t.itmPricePkr,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.t.itmPriceRequired;
                    }
                    if (double.tryParse(value.trim()) == null) {
                      return context.t.itmValidNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _unit,
                  decoration: InputDecoration(
                    labelText: context.t.itmUnit,
                    border: OutlineInputBorder(),
                  ),
                  items:
                      unitOptions
                          .map(
                            (u) => DropdownMenuItem(
                              value: u,
                              child: Text(context.unitName(u)),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() => _unit = value!);
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _categoryController,
                  decoration: InputDecoration(
                    labelText: context.t.itmCategoryHint,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                RawAutocomplete<Map<String, dynamic>>(
                  textEditingController: _supplierController,
                  focusNode: _supplierFocusNode,
                  displayStringForOption: (s) => s['name'] as String,
                  optionsBuilder: (textEditingValue) {
                    final q = textEditingValue.text.trim().toLowerCase();
                    final suppliers = _suppliers.cast<Map<String, dynamic>>();
                    if (q.isEmpty) return suppliers;
                    return suppliers.where(
                      (s) => (s['name'] as String).toLowerCase().contains(q),
                    );
                  },
                  onSelected:
                      (s) => setState(
                        () => _preferredSupplierId = s['id'] as String,
                      ),
                  fieldViewBuilder: (context, controller, focusNode, _) {
                    return TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        labelText: context.t.itmPreferredSupplier,
                        helperText: context.t.itmPreferredSupplierHelper,
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          tooltip: context.t.itmClear,
                          onPressed: () {
                            controller.clear();
                            setState(() => _preferredSupplierId = null);
                          },
                        ),
                      ),
                      onChanged: (v) {
                        if (v.isEmpty) {
                          setState(() => _preferredSupplierId = null);
                        }
                      },
                    );
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(8),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              final s = options.elementAt(index);
                              return ListTile(
                                title: Text(context.partyName(s['name'])),
                                onTap: () => onSelected(s),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _hsnController,
                        decoration: InputDecoration(
                          labelText: context.t.itmHsn,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _gstController,
                        decoration: InputDecoration(
                          labelText: context.t.itmGstRate,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _barcodeController,
                        decoration: InputDecoration(
                          labelText: context.t.itmBarcodeOptional,
                          hintText: context.t.itmScanOrType,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AppIconButton(
                      onPressed: () async {
                        final code = await scanBarcode(context);
                        if (code != null) {
                          _barcodeController.text = code;
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.qr_code_scanner),
                      tooltip: context.t.itmScanBarcode,
                    ),
                  ],
                ),
                if (_barcodeController.text.trim().isNotEmpty) ...[
                  const SizedBox(height: 16),
                  BarcodeWidget(
                    barcode: _barcodeFor(_barcodeController.text),
                    data: _barcodeController.text.trim(),
                    height: 80,
                  ),
                  TextButton.icon(
                    onPressed:
                        () => printBarcodeLabel(
                          name: _nameController.text.trim(),
                          price: _priceController.text.trim(),
                          code: _barcodeController.text.trim(),
                        ),
                    icon: const Icon(Icons.print),
                    label: Text(context.t.itmMenuPrintLabel),
                  ),
                ],
                const SizedBox(height: 16),
                TextFormField(
                  controller: _costController,
                  decoration: InputDecoration(
                    labelText: context.t.itmPurchaseCost,
                    hintText: context.t.itmPurchaseCostHint,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _wholesalePriceController,
                        decoration: InputDecoration(
                          labelText: context.t.itmWholesale,
                          hintText: context.t.itmFallsBack,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _contractorPriceController,
                        decoration: InputDecoration(
                          labelText: context.t.itmContractor,
                          hintText: context.t.itmFallsBack,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _stockController,
                        decoration: InputDecoration(
                          labelText: context.t.itmStockQty,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _thresholdController,
                        decoration: InputDecoration(
                          labelText: context.t.itmLowStockAlert,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                if (isEditing && _frequentlyBoughtWith.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Text(
                    context.t.itmFrequently,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final entry in _frequentlyBoughtWith)
                        Chip(
                          avatar: const Icon(
                            Icons.shopping_basket_outlined,
                            size: 16,
                          ),
                          label: Text(context.itemName(entry['item_name'])),
                        ),
                    ],
                  ),
                ],
                const SizedBox(height: 24),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                GradientButton(
                  label:
                      isEditing
                          ? context.t.itmSaveChanges
                          : context.t.itmSaveItem,
                  loading: isSaving,
                  onPressed: isSaving ? null : saveItem,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePicker(BuildContext context) {
    final theme = Theme.of(context);
    Widget content;
    if (_pickedImageBytes != null) {
      content = Image.memory(_pickedImageBytes!, fit: BoxFit.cover);
    } else if (_existingImageUrl != null && _existingImageUrl!.isNotEmpty) {
      content = Image.network(
        AppConfig.mediaUrl(_existingImageUrl!),
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stack) => Icon(
              Icons.inventory_2_outlined,
              size: 40,
              color: theme.colorScheme.onSurfaceVariant,
            ),
      );
    } else {
      content = Icon(
        Icons.add_a_photo_outlined,
        size: 32,
        color: theme.colorScheme.onSurfaceVariant,
      );
    }

    return Semantics(
      button: true,
      label: context.t.itmPhotoSemantics,
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppStyle.borderColor(context)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(child: content),
              Positioned(
                right: 6,
                bottom: 6,
                child: IconBadge(
                  Icons.camera_alt,
                  theme.colorScheme.primary,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
