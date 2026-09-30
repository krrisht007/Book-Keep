import 'dart:async';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'add_bill_screen.dart';
import 'add_customer_screen.dart';
import 'csv_utils.dart';
import 'customer_detail_screen.dart';
import 'config.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';
import 'l10n/l10n.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => CustomerListScreenState();
}

class CustomerListScreenState extends State<CustomerListScreen> {
  List<dynamic> customers = [];
  bool isLoading = true;
  bool isOffline = false;
  String? errorMessage;
  final _searchController = TextEditingController();
  bool _sortAlphabetical = true;

  Map<String, double> _outstandingByCustomer = {};
  bool _outstandingLoaded = false;

  bool _selecting = false;
  final Set<String> _selectedIds = {};

  @override
  void initState() {
    super.initState();
    fetchCustomers();
    _searchController.addListener(() => setState(() {}));
    SyncService.instance.syncTick.addListener(_onSyncTick);
  }

  void _onSyncTick() {
    if (mounted) fetchCustomers();
  }

  @override
  void dispose() {
    SyncService.instance.syncTick.removeListener(_onSyncTick);
    _searchController.dispose();
    super.dispose();
  }

  void toggleSort() => setState(() => _sortAlphabetical = !_sortAlphabetical);

  List<dynamic> get _visibleCustomers {
    final q = _searchController.text.trim().toLowerCase();
    final list =
        q.isEmpty
            ? List.of(customers)
            : customers.where((c) {
              final name = (c['name'] as String? ?? '').toLowerCase();
              final shown =
                  NameTranslator.instance
                      .show('party', c['name'])
                      .toLowerCase();
              final phone = (c['phone'] as String? ?? '').toLowerCase();
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

  Future<void> _fetchOutstanding() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/outstanding'),
      );
      if (response.statusCode == 200 && mounted) {
        final data = jsonDecode(response.body) as List;
        setState(() {
          _outstandingByCustomer = {
            for (final r in data)
              r['customer_id'] as String: (r['outstanding'] as num).toDouble(),
          };
          _outstandingLoaded = true;
        });
      }
    } catch (_) {}
  }

  Future<void> fetchCustomers() async {
    unawaited(_fetchOutstanding());
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/customers'),
      );
      if (response.statusCode == 200) {
        await LocalDb.instance.upsertCustomers(jsonDecode(response.body));
        if (!mounted) return;
        setState(() {
          customers = jsonDecode(response.body);
          isLoading = false;
          isOffline = false;
          errorMessage = null;
        });
      } else if (mounted) {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isLoading = false;
        });
      }
    } catch (e) {
      final cached = await LocalDb.instance.getCachedCustomers();
      if (!mounted) return;
      setState(() {
        if (cached.isNotEmpty) {
          customers = cached;
          isOffline = true;
          errorMessage = null;
        } else {
          errorMessage = context.t.couldNotConnect('$e');
        }
        isLoading = false;
      });
    }
  }

  Future<void> _deleteCustomer(dynamic customer) async {
    final messenger = ScaffoldMessenger.of(context);
    final confirm = await confirmDelete(
      context,
      title: context.t.deleteCustomer,
      message: context.t.deleteCustomerMessage(
        context.partyName(customer['name']),
      ),
    );
    if (!confirm) return;
    try {
      final response = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/customers/${customer['id']}'),
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
    fetchCustomers();
  }

  Future<void> _editCustomer(dynamic customer) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddCustomerScreen(
              customerId: customer['id'],
              initialName: customer['name'],
              initialPhone: customer['phone'],
              initialCreditLimit: customer['credit_limit']?.toString(),
              initialStrn: customer['strn'],
              initialAddress: customer['address'],
              initialEmail: customer['email'],
              initialPriceTier: customer['price_tier'],
            ),
      ),
    );
    if (result == true) fetchCustomers();
  }

  Widget _customerActionsMenu(dynamic customer) {
    return PopupMenuButton<VoidCallback>(
      icon: const Icon(Icons.more_vert, size: 20),
      tooltip: context.t.actions,
      padding: const EdgeInsets.all(4),
      onSelected: (action) => action(),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: () => _editCustomer(customer),
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
              value: () => _deleteCustomer(customer),
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
    );
  }

  Future<void> _bulkDelete() async {
    final count = _selectedIds.length;
    final confirm = await confirmDelete(
      context,
      title: context.t.deleteCustomersTitle(count),
      message: context.t.deleteCustomersMessage(count),
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
            .delete(Uri.parse('${AppConfig.baseUrl}/customers/$id'))
            .catchError((_) => http.Response('', 0)),
      ),
    );
    fetchCustomers();
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
                  _selectedIds.length == _visibleCustomers.length
                      ? context.t.deselectAll
                      : context.t.selectAll,
              icon: Icon(
                _selectedIds.length == _visibleCustomers.length
                    ? Icons.deselect
                    : Icons.select_all,
                color: Colors.white,
              ),
              onPressed:
                  () => setState(() {
                    final allIds = _visibleCustomers.map(
                      (it) => it['id'] as String,
                    );
                    if (_selectedIds.length == _visibleCustomers.length) {
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

  Widget? _customerFooter(dynamic customer) {
    final outstanding = _outstandingByCustomer[customer['id']];
    final creditLimit = (customer['credit_limit'] as num?)?.toDouble();
    final createdAt = DateTime.tryParse(
      customer['created_at'] as String? ?? '',
    );
    final isNew =
        createdAt != null &&
        DateTime.now().difference(createdAt) < const Duration(days: 7);

    final rows = <Widget>[
      if (isNew) _newTag(),
      if (creditLimit != null && creditLimit > 0)
        _creditBar(outstanding, creditLimit),
    ];
    if (rows.isEmpty) return null;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0) const SizedBox(height: 8),
            rows[i],
          ],
        ],
      ),
    );
  }

  Widget _newTag() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.blue.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      context.t.newTag,
      style: TextStyle(
        fontSize: 9.5,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
        color: Colors.blue.shade700,
      ),
    ),
  );

  double _creditFraction(double? outstanding, double creditLimit) =>
      creditLimit <= 0 ? 0 : (outstanding ?? 0) / creditLimit;

  Widget _creditBar(double? outstanding, double creditLimit) {
    final overLimit = _creditFraction(outstanding, creditLimit) >= 1.0;
    return Text(
      context.t.cdCreditUsed(
        formatMoney(creditLimit),
        formatMoney(outstanding ?? 0),
      ),
      style: TextStyle(
        fontSize: 10.5,
        color: overLimit ? Colors.red.shade700 : Colors.grey.shade600,
        fontWeight: overLimit ? FontWeight.w700 : FontWeight.w500,
      ),
    );
  }

  Widget _groupHeader(String text, int count, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 10),
      child: Row(
        children: [
          IconBadge(icon, color, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                color: color,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppStyle.tint(context, color),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addCustomer() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCustomerScreen()),
    );
    if (result == true) fetchCustomers();
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
      ).showSnackBar(SnackBar(content: Text(context.t.csvNeedsRows)));
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
    final creditLimitCol = header.indexOf('credit_limit');
    final strnCol = header.indexOf('strn');
    final addressCol = header.indexOf('address');
    final emailCol = header.indexOf('email');

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
      final creditLimitStr = field(creditLimitCol);
      final creditLimit =
          creditLimitStr.isEmpty ? null : double.tryParse(creditLimitStr);
      if (creditLimitStr.isNotEmpty && creditLimit == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.csvLineBadCredit(lineNo, creditLimitStr)),
          ),
        );
        return;
      }
      rows.add({
        'name': name,
        'phone': field(phoneCol).isEmpty ? null : field(phoneCol),
        'credit_limit': creditLimit,
        'strn': field(strnCol).isEmpty ? null : field(strnCol),
        'address': field(addressCol).isEmpty ? null : field(addressCol),
        'email': field(emailCol).isEmpty ? null : field(emailCol),
      });
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.importCustomers),
            content: Text(
              context.t.importCustomersConfirm(
                rows.length,
                result.files.single.name,
              ),
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
        Uri.parse('${AppConfig.baseUrl}/customers/bulk'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(rows),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.importedCustomers(rows.length))),
        );
        fetchCustomers();
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

  Widget _customerTile(dynamic customer) {
    final id = customer['id'] as String;
    final name = customer['name'] as String;
    final shownName = context.partyName(name);
    final phone = customer['phone'] as String?;
    final hasPhone = phone != null && phone.trim().isNotEmpty;
    final initial =
        shownName.trim().isNotEmpty ? shownName.trim()[0].toUpperCase() : '?';
    final selected = _selectedIds.contains(id);
    final creditLimit = (customer['credit_limit'] as num?)?.toDouble();
    final overLimit =
        creditLimit != null &&
        creditLimit > 0 &&
        _creditFraction(_outstandingByCustomer[id], creditLimit) >= 1.0;
    final tile = Dismissible(
      key: Key(id),
      direction:
          _selecting ? DismissDirection.none : DismissDirection.horizontal,
      background: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade600,
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 22),
        child: const Icon(Icons.receipt_long, color: Colors.white),
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
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => AddBillScreen(
                    customerId: customer['id'],
                    customerCreditLimit:
                        (customer['credit_limit'] as num?)?.toDouble(),
                    customerCurrentOutstanding:
                        _outstandingByCustomer[customer['id']],
                    customerPriceTier: customer['price_tier'] as String?,
                  ),
            ),
          );
          if (result == true) fetchCustomers();
          return false;
        }
        return confirmDelete(
          context,
          title: context.t.deleteCustomer,
          message: context.t.deleteCustomerMessage(
            context.partyName(customer['name']),
          ),
        );
      },
      onDismissed: (direction) async {
        final messenger = ScaffoldMessenger.of(context);
        try {
          final response = await http.delete(
            Uri.parse('${AppConfig.baseUrl}/customers/${customer['id']}'),
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
        fetchCustomers();
      },
      child: AvatarListRow(
        title: shownName,
        subtitle: customer['phone'] ?? context.t.noPhone,
        initial: selected ? '✓' : initial,
        avatarColor: AppStyle.colorForKey(customer['id']),
        avatarRadius: 28,
        glowColor: Theme.of(context).colorScheme.primary,
        ringColor: overLimit ? Colors.red.shade600 : null,
        footer: _customerFooter(customer),
        sideAction: hasPhone ? contactSideAction(phone, name) : null,
        trailing: _customerActionsMenu(customer),
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
                  (context) => CustomerDetailScreen(
                    customerId: customer['id'],
                    customerName: customer['name'],
                    customerPhone: customer['phone'],
                    customerCreditLimit:
                        customer['credit_limit'] != null
                            ? (customer['credit_limit'] as num).toDouble()
                            : null,
                  ),
            ),
          );
        },
      ),
    );
    final row = GestureDetector(
      onLongPress:
          () => setState(() {
            _selecting = true;
            _selectedIds.add(id);
          }),
      child: tile,
    );
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 4,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppStyle.colorForKey(id),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
          Expanded(child: row),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const SkeletonListLoader();
    if (errorMessage != null) return errorRetry(errorMessage!, fetchCustomers);
    final visible = _visibleCustomers;
    final owing =
        _outstandingLoaded
            ? visible
                .where((c) => _outstandingByCustomer.containsKey(c['id']))
                .toList()
            : <dynamic>[];
    final settled =
        _outstandingLoaded
            ? visible
                .where((c) => !_outstandingByCustomer.containsKey(c['id']))
                .toList()
            : <dynamic>[];
    final showSections = owing.isNotEmpty && settled.isNotEmpty;
    return AdaptiveColumn(
      children: [
        if (isOffline)
          Container(
            width: double.infinity,
            color: Colors.orange.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.cloud_off, size: 18, color: Colors.orange.shade900),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.t.offlineShowingSaved,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        if (_selecting) _selectionBar(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: GlassSearchBar(
            controller: _searchController,
            hintText: context.t.searchCustomersHint,
            onChanged: (_) {},
          ),
        ),
        if (customers.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
            child: AppCard(
              radius: 20,
              shadowStrength: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconBadge(
                    Icons.people_alt_outlined,
                    Theme.of(context).colorScheme.primary,
                    size: 34,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: customers.length.toDouble(),
                      ),
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      builder:
                          (context, value, _) => Text(
                            context.t.customerCount(value.round()),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                    ),
                  ),
                  if (_outstandingLoaded && _outstandingByCustomer.isNotEmpty)
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: _outstandingByCustomer.values.reduce(
                          (a, b) => a + b,
                        ),
                      ),
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutCubic,
                      builder:
                          (context, value, _) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppStyle.tint(
                                context,
                                Colors.red.shade700,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              context.t.clOwed(formatMoney(value)),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.red.shade700,
                              ),
                            ),
                          ),
                    ),
                ],
              ),
            ),
          ),
        if (visible.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    customers.isEmpty ? Icons.people_outline : Icons.search_off,
                    size: 48,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    customers.isEmpty
                        ? context.t.noCustomersYet
                        : context.t.noCustomersMatch,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          )
        else if (showSections)
          Expanded(
            child: RefreshIndicator(
              onRefresh: fetchCustomers,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                children: [
                  _groupHeader(
                    context.t.owesMoney,
                    owing.length,
                    Icons.warning_amber_rounded,
                    Colors.red.shade700,
                  ),
                  for (final c in owing) _customerTile(c),
                  const SizedBox(height: 10),
                  _groupHeader(
                    context.t.settledUp,
                    settled.length,
                    Icons.check_circle_outline,
                    Theme.of(context).colorScheme.primary,
                  ),
                  for (final c in settled) _customerTile(c),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: fetchCustomers,
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                itemCount: visible.length,
                itemBuilder: (context, index) => _customerTile(visible[index]),
              ),
            ),
          ),
      ],
    );
  }
}
