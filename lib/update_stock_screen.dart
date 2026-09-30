import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';

class UpdateStockScreen extends StatefulWidget {
  const UpdateStockScreen({super.key});

  @override
  State<UpdateStockScreen> createState() => _UpdateStockScreenState();
}

class _UpdateStockScreenState extends State<UpdateStockScreen> {
  List<dynamic> items = [];
  List<dynamic> _filteredItems = [];
  final Map<String, double> _targetStock = {};
  final Map<String, TextEditingController> _controllers = {};
  final _searchController = TextEditingController();
  final _noteController = TextEditingController();
  bool isLoading = true;
  bool isSaving = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    _searchController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toString();

  Future<void> fetchItems() async {
    setState(() => isLoading = true);
    try {
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/items'));
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          items = jsonDecode(response.body);
          for (final it in items) {
            final id = it['id'] as String;
            final cur = (it['stock_quantity'] as num).toDouble();
            _targetStock[id] = cur;
            _controllers[id] = TextEditingController(text: _fmt(cur));
          }
          _filteredItems = List.of(items);
          isLoading = false;
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

  double _current(String id) {
    final it = items.firstWhere((i) => i['id'] == id);
    return (it['stock_quantity'] as num).toDouble();
  }

  void _applySearch(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filteredItems = List.of(items);
      } else {
        _filteredItems =
            items.where((item) {
              final name = (item['name'] as String).toLowerCase();
              final shown =
                  NameTranslator.instance
                      .show('item', item['name'])
                      .toLowerCase();
              final category =
                  (item['category'] as String? ?? '').toLowerCase();
              return name.contains(q) ||
                  shown.contains(q) ||
                  category.contains(q);
            }).toList();
      }
    });
  }

  int get _changedCount =>
      items.where((it) => _targetStock[it['id']] != _current(it['id'])).length;

  void _step(String id, double delta) {
    final next = (_targetStock[id] ?? 0) + delta;
    if (next < 0) return;
    _targetStock[id] = next;
    _controllers[id]?.text = _fmt(next);
    setState(() {});
  }

  void _onFieldChanged(String id, String value) {
    final parsed = double.tryParse(value);
    if (parsed != null && parsed >= 0) {
      _targetStock[id] = parsed;
      setState(() {});
    }
  }

  Future<void> _saveAll() async {
    final updates =
        items
            .where((it) => _targetStock[it['id']] != _current(it['id']))
            .map(
              (it) => {
                'item_id': it['id'],
                'stock_quantity': _targetStock[it['id']],
                'note': _noteController.text,
              },
            )
            .toList();
    setState(() => isSaving = true);
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/items/bulk-stock'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updates),
      );
      if (response.statusCode == 200) {
        if (mounted) Navigator.pop(context, true);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.saveFailed(response.statusCode))),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.couldNotSave('$e'))));
      }
    } finally {
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.updateStock),
      body:
          isLoading
              ? const SkeletonListLoader()
              : errorMessage != null
              ? errorRetry(errorMessage!, fetchItems)
              : items.isEmpty
              ? Center(child: Text(context.t.usNoItems))
              : SidePanelColumn(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                    child: GlassSearchBar(
                      controller: _searchController,
                      hintText: context.t.itmSearchHint,
                      onChanged: _applySearch,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(
                      context.t.usHelp,
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                  ),
                  Expanded(
                    child:
                        _filteredItems.isEmpty
                            ? Center(child: Text(context.t.itmNoItemsMatch))
                            : ListView.builder(
                              padding: const EdgeInsets.only(bottom: 16),
                              itemCount: _filteredItems.length,
                              itemBuilder: (context, index) {
                                final it = _filteredItems[index];
                                final id = it['id'] as String;
                                final name = it['name'] as String;
                                final unit = context.unitName(it['unit']);
                                final cur = _current(id);
                                final changed = _targetStock[id] != cur;
                                return ListTile(
                                  title: Text(
                                    context.itemName(name),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    context.t.usCurrent(_fmt(cur), unit) +
                                        (changed
                                            ? '  •  ${context.t.usNew(_fmt(_targetStock[id]!))}'
                                            : ''),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppIconButton(
                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                        onPressed: () => _step(id, -1),
                                        tooltip: context.t.usSubtract,
                                      ),
                                      SizedBox(
                                        width: 64,
                                        child: TextField(
                                          controller: _controllers[id],
                                          textAlign: TextAlign.center,
                                          keyboardType:
                                              const TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged:
                                              (v) => _onFieldChanged(id, v),
                                        ),
                                      ),
                                      AppIconButton(
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                        onPressed: () => _step(id, 1),
                                        tooltip: context.t.usAdd,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                  ),
                  if (_changedCount > 0)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                      child: TextField(
                        controller: _noteController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.sticky_note_2_outlined),
                          labelText: context.t.itmNoteOptional,
                          hintText: context.t.itmNoteHint,
                        ),
                      ),
                    ),
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Opacity(
                        opacity: _changedCount == 0 ? 0.5 : 1,
                        child: GradientButton(
                          icon: Icons.save_outlined,
                          label:
                              _changedCount == 0
                                  ? context.t.usNoChanges
                                  : context.t.usSaveAll(_changedCount),
                          loading: isSaving,
                          onPressed:
                              _changedCount == 0 || isSaving ? null : _saveAll,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
