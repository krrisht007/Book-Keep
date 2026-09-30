import 'dart:async';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'add_supplier_screen.dart';
import 'csv_utils.dart';
import 'supplier_detail_screen.dart';
import 'config.dart';
import 'sync_service.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class SupplierListScreen extends StatefulWidget {
  const SupplierListScreen({super.key});

  @override
  State<SupplierListScreen> createState() => SupplierListScreenState();
}

class SupplierListScreenState extends State<SupplierListScreen> {
  List<dynamic> suppliers = [];
  bool isLoading = true;
  String? errorMessage;
  final _searchController = TextEditingController();
  bool _sortAlphabetical = true;
  bool _selecting = false;
  final Set<String> _selectedIds = {};

  Map<String, double> _payableBySupplier = {};
  bool _payableLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchSuppliers();
    _searchController.addListener(() => setState(() {}));
    SyncService.instance.syncTick.addListener(_onSyncTick);
  }

  void _onSyncTick() {
    if (mounted) fetchSuppliers();
  }

  @override
  void dispose() {
    SyncService.instance.syncTick.removeListener(_onSyncTick);
    _searchController.dispose();
    super.dispose();
  }

  void toggleSort() => setState(() => _sortAlphabetical = !_sortAlphabetical);

  List<dynamic> get _visibleSuppliers {
    final q = _searchController.text.trim().toLowerCase();
    final list =
        q.isEmpty
            ? List.of(suppliers)
            : suppliers.where((s) {
              final name = (s['name'] as String? ?? '').toLowerCase();
              final shown =
                  NameTranslator.instance
                      .show('party', s['name'])
                      .toLowerCase();
              final phone = (s['phone'] as String? ?? '').toLowerCase();
              return name.contains(q) || shown.contains(q) || phone.contains(q);
            }).toList();
    list.sort((a, b) {
      if (_sortAlphabetical) {
        return (a['name'] as String? ?? '').toLowerCase().compareTo(
          (b['name'] as String? ?? '').toLowerCase(),
        );
      }
      final aC = a['created_at'] as String? ?? '';
      final bC = b['created_at'] as String? ?? '';
      return bC.compareTo(aC);
    });
    return list;
  }

  Future<void> _fetchPayable() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/payables-aging'),
      );
      if (response.statusCode == 200 && mounted) {
        final data = jsonDecode(response.body) as List;
        setState(() {
          _payableBySupplier = {
            for (final r in data)
              r['supplier_id'] as String: (r['outstanding'] as num).toDouble(),
          };
          _payableLoaded = true;
        });
      }
    } catch (_) {}
  }

  Future<void> fetchSuppliers() async {
    unawaited(_fetchPayable());
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/suppliers'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          suppliers = jsonDecode(response.body);
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

  Future<void> _editSupplier(dynamic supplier) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddSupplierScreen(
              supplierId: supplier['id'],
              initialName: supplier['name'],
              initialPhone: supplier['phone'],
              initialStrn: supplier['strn'],
              initialAddress: supplier['address'],
            ),
      ),
    );
    if (result == true) fetchSuppliers();
  }

  Future<void> _deleteSupplier(dynamic supplier) async {
    final messenger = ScaffoldMessenger.of(context);
    final confirm = await confirmDelete(
      context,
      title: context.t.slDeleteSupplier,
      message: context.t.deleteSupplierMessage(
        context.partyName(supplier['name']),
      ),
    );
    if (!confirm) return;
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/suppliers/${supplier['id']}'),
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
    fetchSuppliers();
  }

  Future<void> _bulkDelete() async {
    final count = _selectedIds.length;
    final confirm = await confirmDelete(
      context,
      title: context.t.slDeleteManyTitle(count),
      message: context.t.slDeleteManyBody(count),
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
            .delete(Uri.parse('${AppConfig.baseUrl}/suppliers/$id'))
            .catchError((_) => http.Response('', 0)),
      ),
    );
    fetchSuppliers();
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
                  _selectedIds.length == _visibleSuppliers.length
                      ? context.t.deselectAll
                      : context.t.selectAll,
              icon: Icon(
                _selectedIds.length == _visibleSuppliers.length
                    ? Icons.deselect
                    : Icons.select_all,
                color: Colors.white,
              ),
              onPressed:
                  () => setState(() {
                    final allIds = _visibleSuppliers.map(
                      (it) => it['id'] as String,
                    );
                    if (_selectedIds.length == _visibleSuppliers.length) {
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
              onPressed:
                  () => setState(() {
                    _selecting = false;
                    _selectedIds.clear();
                  }),
              child: Text(
                context.t.cancel,
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: _selectedIds.isEmpty ? null : _bulkDelete,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: Text(
                context.t.delete,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addSupplier() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddSupplierScreen()),
    );
    if (result == true) fetchSuppliers();
  }

  Future<void> importCsv() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      withData: true,
    );
    if (result == null || result.files.single.bytes == null) return;
    if (!mounted) return;

    final lines =
        utf8
            .decode(result.files.single.bytes!)
            .split(RegExp(r'\r?\n'))
            .where((l) => l.trim().isNotEmpty)
            .toList();
    if (lines.length < 2) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.slCsvNeedsRows)));
      return;
    }

    final header =
        parseCsvLine(lines.first).map((h) => h.toLowerCase()).toList();
    final nameCol = header.indexOf('name');
    if (nameCol == -1) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.csvNeedsName)));
      return;
    }
    final phoneCol = header.indexOf('phone');
    final strnCol = header.indexOf('strn');
    final addressCol = header.indexOf('address');

    final rows = <Map<String, dynamic>>[];
    for (int i = 1; i < lines.length; i++) {
      final fields = parseCsvLine(lines[i]);
      final lineNo = i + 1;
      String field(int col) =>
          col >= 0 && col < fields.length ? fields[col] : '';

      final name = field(nameCol);
      if (name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.csvLineMissingName(lineNo))),
        );
        return;
      }
      rows.add({
        'name': name,
        'phone': field(phoneCol).isEmpty ? null : field(phoneCol),
        'strn': field(strnCol).isEmpty ? null : field(strnCol),
        'address': field(addressCol).isEmpty ? null : field(addressCol),
      });
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.slImportTitle),
            content: Text(
              context.t.slImportConfirm(rows.length, result.files.single.name),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.t.importAction),
              ),
            ],
          ),
    );
    if (confirmed != true) return;

    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/suppliers/bulk'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(rows),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.slImported(rows.length))),
        );
        fetchSuppliers();
      } else {
        String detail = context.t.serverError(response.statusCode);
        try {
          detail = (jsonDecode(response.body)['detail'] as String?) ?? detail;
        } catch (_) {}
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.importFailed(detail))));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.importFailedOffline('$e'))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const SkeletonListLoader();
    if (errorMessage != null) return errorRetry(errorMessage!, fetchSuppliers);
    if (suppliers.isEmpty) {
      return Center(
        child: Text(
          context.t.slNoSuppliers,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    final visible = _visibleSuppliers;
    final owing =
        _payableLoaded
            ? visible
                .where((s) => _payableBySupplier.containsKey(s['id']))
                .toList()
            : <dynamic>[];
    final settled =
        _payableLoaded
            ? visible
                .where((s) => !_payableBySupplier.containsKey(s['id']))
                .toList()
            : <dynamic>[];
    final showSections = owing.isNotEmpty && settled.isNotEmpty;
    return AdaptiveColumn(
      children: [
        if (_selecting) _selectionBar(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: GlassSearchBar(
            controller: _searchController,
            hintText: context.t.slSearchHint,
            onChanged: (_) {},
          ),
        ),
        if (suppliers.isNotEmpty) _summaryLine(),
        if (visible.isEmpty)
          Expanded(
            child: Center(
              child: Text(
                context.t.slNoMatch,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        else if (showSections)
          Expanded(
            child: RefreshIndicator(
              onRefresh: fetchSuppliers,
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  _groupHeader(
                    context.t.sdPayable,
                    owing.length,
                    Colors.red.shade700,
                  ),
                  for (final s in owing) _supplierTile(s),
                  const SizedBox(height: 10),
                  _groupHeader(
                    context.t.settledUp,
                    settled.length,
                    Theme.of(context).colorScheme.primary,
                  ),
                  for (final s in settled) _supplierTile(s),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: fetchSuppliers,
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: visible.length,
                itemBuilder: (context, index) => _supplierTile(visible[index]),
              ),
            ),
          ),
      ],
    );
  }

  Widget _summaryLine() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Row(
        children: [
          Text(
            context.t.slCount(suppliers.length),
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          if (_payableLoaded && _payableBySupplier.isNotEmpty)
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: _payableBySupplier.values.reduce((a, b) => a + b),
              ),
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              builder:
                  (context, value, _) => Text(
                    ' · ${context.t.sdPayableAmount(formatMoney(value))}',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
            ),
        ],
      ),
    );
  }

  Widget _groupHeader(String text, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 14,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$text ($count)',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _supplierTile(dynamic supplier) {
    final name = supplier['name'] as String;
    final shownName = context.partyName(name);
    final initial =
        shownName.trim().isNotEmpty ? shownName.trim()[0].toUpperCase() : '?';
    final payable = _payableBySupplier[supplier['id']];
    final phone = supplier['phone'] as String?;
    final hasPhone = phone != null && phone.trim().isNotEmpty;
    final id = supplier['id'] as String;
    final selected = _selectedIds.contains(id);
    final tile = Dismissible(
      key: Key(supplier['id']),
      direction:
          _selecting ? DismissDirection.none : DismissDirection.horizontal,
      background: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 22),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      secondaryBackground: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 22),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          await _editSupplier(supplier);
          return false;
        }
        return confirmDelete(
          context,
          title: context.t.slDeleteSupplier,
          message: context.t.deleteSupplierMessage(
            context.partyName(supplier['name']),
          ),
        );
      },
      onDismissed: (direction) async {
        final messenger = ScaffoldMessenger.of(context);
        try {
          final response = await http.delete(
            Uri.parse('${AppConfig.baseUrl}/suppliers/${supplier['id']}'),
          );
          if (response.statusCode != 200 && mounted) {
            String detail = context.t.serverError(response.statusCode);
            try {
              detail =
                  (jsonDecode(response.body)['detail'] as String?) ?? detail;
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
        fetchSuppliers();
      },
      child: AvatarListRow(
        title: shownName,
        subtitle: supplier['phone'] ?? context.t.noPhone,
        initial: selected ? '✓' : initial,
        avatarColor: AppStyle.colorForKey(supplier['id']),
        avatarRadius: 28,
        glowColor: Theme.of(context).colorScheme.primary,
        footer:
            payable == null
                ? null
                : Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    context.t.sdPayableAmount(formatMoney(payable)),
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
        sideAction: hasPhone ? contactSideAction(phone, name) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton<VoidCallback>(
              icon: const Icon(Icons.more_vert, size: 20),
              tooltip: context.t.itmMore,
              padding: EdgeInsets.zero,
              onSelected: (action) => action(),
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: () => _editSupplier(supplier),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: IconBadge(
                          Icons.edit_outlined,
                          Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                        title: Text(
                          context.t.edit,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const PopupMenuDivider(height: 1),
                    PopupMenuItem(
                      value: () => _deleteSupplier(supplier),
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
        onTap: () {
          if (_selecting) {
            setState(() {
              if (selected) {
                _selectedIds.remove(id);
                if (_selectedIds.isEmpty) _selecting = false;
              } else {
                _selectedIds.add(id);
              }
            });
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => SupplierDetailScreen(
                    supplierId: supplier['id'],
                    supplierName: supplier['name'],
                    supplierPhone: supplier['phone'],
                  ),
            ),
          );
        },
      ),
    );
    return GestureDetector(
      onLongPress:
          () => setState(() {
            _selecting = true;
            _selectedIds.add(id);
          }),
      child: tile,
    );
  }
}
