import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:typed_data' show Uint8List;
import 'api.dart' as http;
import 'config.dart';
import 'csv_utils.dart';
import 'local_db.dart';
import 'sync_service.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class ExpensesScreen extends StatefulWidget {
  final String? initialCategory;

  const ExpensesScreen({super.key, this.initialCategory});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<dynamic> expenses = [];
  bool isLoading = true;
  String? errorMessage;
  String? _categoryFilter;

  final List<String> categoryOptions = [
    'rent',
    'electricity',
    'wages',
    'restock',
    'other',
  ];

  @override
  void initState() {
    super.initState();
    _categoryFilter = widget.initialCategory;
    fetchExpenses();
    SyncService.instance.syncTick.addListener(_onSyncTick);
  }

  void _onSyncTick() {
    if (mounted) fetchExpenses();
  }

  @override
  void dispose() {
    SyncService.instance.syncTick.removeListener(_onSyncTick);
    super.dispose();
  }

  Future<void> _importCsv() async {
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
      ).showSnackBar(SnackBar(content: Text(context.t.exCsvNeedsRows)));
      return;
    }

    final header =
        parseCsvLine(lines.first).map((h) => h.toLowerCase()).toList();
    final descCol = header.indexOf('description');
    final amountCol = header.indexOf('amount');
    if (descCol == -1 || amountCol == -1) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.exCsvHeader)));
      return;
    }
    final categoryCol = header.indexOf('category');
    final dateCol = header.indexOf('date');
    final recurringCol = header.indexOf('is_recurring');

    final rows = <Map<String, dynamic>>[];
    for (int i = 1; i < lines.length; i++) {
      final fields = parseCsvLine(lines[i]);
      final lineNo = i + 1;
      String field(int col) =>
          col >= 0 && col < fields.length ? fields[col] : '';

      final description = field(descCol);
      final amount = double.tryParse(field(amountCol));
      if (description.isEmpty || amount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.exLineBadAmount(lineNo))),
        );
        return;
      }
      DateTime date;
      final dateStr = field(dateCol);
      if (dateStr.isEmpty) {
        date = DateTime.now();
      } else {
        final parsed = DateTime.tryParse(dateStr);
        if (parsed == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.exLineBadDate(dateStr, lineNo))),
          );
          return;
        }
        date = parsed;
      }
      final recurringStr = field(recurringCol).toLowerCase();
      rows.add({
        'description': description,
        'amount': amount,
        'category': field(categoryCol).isEmpty ? null : field(categoryCol),
        'date': date.toIso8601String(),
        'is_recurring':
            recurringStr == 'true' ||
            recurringStr == '1' ||
            recurringStr == 'yes',
      });
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.exImportTitle),
            content: Text(
              context.t.exImportConfirm(rows.length, result.files.single.name),
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
        Uri.parse('${AppConfig.baseUrl}/expenses/bulk'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(rows),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.exImported(rows.length))),
        );
        fetchExpenses();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.exImportFailedServer(response.statusCode)),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.importFailedOffline('$e'))),
        );
      }
    }
  }

  Future<void> _deleteExpense(dynamic expense) async {
    final messenger = ScaffoldMessenger.of(context);
    final confirm = await confirmDelete(
      context,
      title: context.t.exDeleteTitle,
      message: context.t.itmCannotUndo,
    );
    if (!confirm) return;
    try {
      await http.delete(
        Uri.parse('${AppConfig.baseUrl}/expenses/${expense['id']}'),
      );
    } catch (_) {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(content: Text(context.t.couldNotDeleteOffline)),
        );
      }
    }
    fetchExpenses();
  }

  List<dynamic> get _visibleExpenses =>
      _categoryFilter == null
          ? expenses
          : expenses.where((e) => e['category'] == _categoryFilter).toList();

  Future<void> fetchExpenses() async {
    if (expenses.isEmpty) setState(() => isLoading = true);
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/expenses'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          expenses = jsonDecode(response.body);
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

  double get totalExpenses =>
      _visibleExpenses.fold(0.0, (sum, e) => sum + (e['amount'] as num));

  List<Map> get _dueRecurring {
    final now = DateTime.now();
    final latestByGroup = <String, Map>{};
    for (final e in expenses) {
      if (e['is_recurring'] != true) continue;
      final key = '${e['description']}|${e['category']}';
      final date = DateTime.parse(e['date']);
      final existing = latestByGroup[key];
      if (existing == null || DateTime.parse(existing['date']).isBefore(date)) {
        latestByGroup[key] = e as Map;
      }
    }
    return latestByGroup.values.where((e) {
      final d = DateTime.parse(e['date']);
      return d.year != now.year || d.month != now.month;
    }).toList();
  }

  Future<void> openAddExpenseSheet({Map? expense, Map? prefillFrom}) async {
    final t = context.t;
    final source = expense ?? prefillFrom;
    final descController = TextEditingController(
      text: source?['description'] ?? '',
    );
    final amountController = TextEditingController(
      text: source != null ? (source['amount'] as num).toString() : '',
    );
    String category = source?['category'] ?? 'other';
    bool recurring = source?['is_recurring'] == true;
    DateTime selectedDate =
        expense != null ? DateTime.parse(expense['date']) : DateTime.now();
    String? existingReceiptUrl = expense?['receipt_url'];
    XFile? pickedReceipt;
    Uint8List? pickedReceiptBytes;

    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      expense == null ? context.t.exAdd : context.t.exEdit,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descController,
                      decoration: InputDecoration(
                        labelText: context.t.exDescription,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: context.t.exAmountRs,
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: category,
                      decoration: InputDecoration(
                        labelText: context.t.exCategory,
                        border: OutlineInputBorder(),
                      ),
                      items:
                          categoryOptions
                              .map(
                                (c) =>
                                    DropdownMenuItem(value: c, child: Text(c)),
                              )
                              .toList(),
                      onChanged: (value) {
                        setSheetState(() => category = value!);
                      },
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        context.t.exDate(selectedDate.toString().split(' ')[0]),
                      ),
                      trailing: const Icon(Icons.calendar_today, size: 18),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null) {
                          setSheetState(() => selectedDate = picked);
                        }
                      },
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(context.t.exRepeats),
                      subtitle: Text(context.t.exRepeatsHint),
                      value: recurring,
                      onChanged: (v) => setSheetState(() => recurring = v),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Semantics(
                          button: true,
                          label: context.t.exReceiptTap,
                          child: GestureDetector(
                            onTap: () async {
                              final picked = await pickImageFile(context);
                              if (picked == null) return;
                              final bytes = await picked.readAsBytes();
                              setSheetState(() {
                                pickedReceipt = picked;
                                pickedReceiptBytes = bytes;
                              });
                            },
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppStyle.borderColor(context),
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child:
                                  pickedReceiptBytes != null
                                      ? Image.memory(
                                        pickedReceiptBytes!,
                                        fit: BoxFit.cover,
                                      )
                                      : (existingReceiptUrl != null &&
                                          existingReceiptUrl.isNotEmpty)
                                      ? Image.network(
                                        AppConfig.mediaUrl(existingReceiptUrl),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stack) =>
                                                const Icon(Icons.receipt_long),
                                      )
                                      : const Icon(Icons.add_a_photo_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            context.t.exReceiptOptional,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final amount = double.tryParse(
                          amountController.text.trim(),
                        );
                        if (descController.text.trim().isEmpty ||
                            amount == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(context.t.exEnterValid)),
                          );
                          return;
                        }
                        final path =
                            expense == null
                                ? '/expenses'
                                : '/expenses/${expense['id']}';
                        final uri = Uri.parse('${AppConfig.baseUrl}$path');
                        final body = jsonEncode({
                          'description': descController.text.trim(),
                          'amount': amount,
                          'category': category,
                          'date': selectedDate.toIso8601String(),
                          'is_recurring': recurring,
                        });
                        try {
                          final request =
                              expense == null
                                  ? http.post(
                                    uri,
                                    headers: {
                                      'Content-Type': 'application/json',
                                    },
                                    body: body,
                                  )
                                  : http.put(
                                    uri,
                                    headers: {
                                      'Content-Type': 'application/json',
                                    },
                                    body: body,
                                  );
                          final response = await request;
                          if (response.statusCode == 200) {
                            final savedId =
                                expense?['id'] ??
                                jsonDecode(response.body)['id'] as String;
                            if (pickedReceiptBytes != null) {
                              await _uploadExpenseReceipt(
                                savedId,
                                pickedReceipt!,
                                pickedReceiptBytes!,
                              );
                            }
                            if (context.mounted) Navigator.pop(context, true);
                          }
                        } catch (e) {
                          await LocalDb.instance.enqueueWrite(
                            method: expense == null ? 'POST' : 'PUT',
                            path: path,
                            label: t.qExpense(descController.text.trim()),
                            payload: jsonDecode(body),
                            photoBytes: pickedReceiptBytes,
                            photoFilename: pickedReceipt?.name,
                            photoUploadSuffix: 'receipt',
                          );
                          await SyncService.instance.refreshPendingCount();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(context.t.exOffline)),
                            );
                            Navigator.pop(context, true);
                          }
                        }
                      },
                      child: Text(
                        expense == null
                            ? context.t.exSave
                            : context.t.itmSaveChanges,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      descController.dispose();
      amountController.dispose();
    });
    if (saved == true) fetchExpenses();
  }

  Future<void> _uploadExpenseReceipt(
    String expenseId,
    XFile file,
    Uint8List bytes,
  ) async {
    try {
      final uri = Uri.parse('${AppConfig.baseUrl}/expenses/$expenseId/receipt');
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: file.name),
      );
      final streamed = await request.send().timeout(http.uploadTimeout);
      if (streamed.statusCode != 200) {
        debugPrint('[Expenses] Receipt upload failed: ${streamed.statusCode}');
      }
    } catch (e) {
      debugPrint('[Expenses] Receipt upload error: $e');
    }
  }

  Widget _recurringDueBanner() {
    final due = _dueRecurring;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppStyle.tint(context, Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppStyle.tint(
            context,
            Theme.of(context).colorScheme.primary,
            light: 0.2,
            dark: 0.3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.repeat, size: 18),
              const SizedBox(width: 8),
              Text(
                context.t.exRecurringDue(due.length),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          for (final e in due)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${e['description']} — ${formatMoney((e['amount'] as num))}',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  TextButton(
                    onPressed: () => openAddExpenseSheet(prefillFrom: e),
                    child: Text(context.t.exAddShort),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(
        title: context.t.expensesTitle,
        actions: [
          AppIconButton(
            icon: const Icon(Icons.upload_file_outlined),
            tooltip: context.t.importCsv,
            onPressed: _importCsv,
          ),
        ],
      ),
      body:
          isLoading
              ? const SkeletonListLoader()
              : errorMessage != null
              ? errorRetry(errorMessage!, fetchExpenses)
              : Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: AppStyle.tint(
                      context,
                      Colors.red,
                      light: 0.08,
                      dark: 0.16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          context.t.exTotal,
                          style: TextStyle(color: Colors.grey),
                        ),
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: totalExpenses),
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeOutCubic,
                          builder:
                              (context, value, _) => Text(
                                formatMoney(value),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  if (_dueRecurring.isNotEmpty) _recurringDueBanner(),
                  if (_categoryFilter != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Chip(
                          avatar: const Icon(Icons.filter_alt, size: 18),
                          label: Text(
                            context.t.exCategoryChip('$_categoryFilter'),
                          ),
                          deleteIcon: const Icon(Icons.clear, size: 18),
                          onDeleted:
                              () => setState(() => _categoryFilter = null),
                        ),
                      ),
                    ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: fetchExpenses,
                      child:
                          _visibleExpenses.isEmpty
                              ? ListView(
                                children: [
                                  const SizedBox(height: 120),
                                  Center(
                                    child: Text(
                                      _categoryFilter == null
                                          ? context.t.exNoneLogged
                                          : context.t.exNoneInCategory(
                                            '$_categoryFilter',
                                          ),
                                    ),
                                  ),
                                ],
                              )
                              : ListView.builder(
                                padding: const EdgeInsets.fromLTRB(
                                  12,
                                  0,
                                  12,
                                  12,
                                ),
                                itemCount: _visibleExpenses.length,
                                itemBuilder: (context, index) {
                                  final e = _visibleExpenses[index];
                                  return Dismissible(
                                    key: Key(e['id']),
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
                                    confirmDismiss:
                                        (direction) => confirmDelete(
                                          context,
                                          title: context.t.exDeleteTitle,
                                          message: context.t.itmCannotUndo,
                                        ),
                                    onDismissed: (direction) async {
                                      final messenger = ScaffoldMessenger.of(
                                        context,
                                      );
                                      final t = context.t;
                                      try {
                                        await http.delete(
                                          Uri.parse(
                                            '${AppConfig.baseUrl}/expenses/${e['id']}',
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
                                      fetchExpenses();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: AppCard(
                                        radius: 18,
                                        shadowStrength: 0.4,
                                        child: ListTile(
                                          title: Row(
                                            children: [
                                              Flexible(
                                                child: Text(e['description']),
                                              ),
                                              if (e['is_recurring'] ==
                                                  true) ...[
                                                const SizedBox(width: 6),
                                                Icon(
                                                  Icons.repeat,
                                                  size: 15,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                ),
                                              ],
                                              if (e['receipt_url'] != null &&
                                                  (e['receipt_url'] as String)
                                                      .isNotEmpty) ...[
                                                const SizedBox(width: 6),
                                                Tooltip(
                                                  message:
                                                      context.t.exViewReceipt,
                                                  child: GestureDetector(
                                                    onTap:
                                                        () => showDialog(
                                                          context: context,
                                                          builder:
                                                              (
                                                                context,
                                                              ) => Dialog(
                                                                child: Image.network(
                                                                  AppConfig.mediaUrl(
                                                                    e['receipt_url']
                                                                        as String,
                                                                  ),
                                                                ),
                                                              ),
                                                        ),
                                                    child: Icon(
                                                      Icons.receipt_long,
                                                      size: 15,
                                                      color:
                                                          Theme.of(
                                                            context,
                                                          ).colorScheme.primary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                          subtitle: Text(
                                            '${e['category'] ?? ''} \u2022 ${e['date'].toString().split('T')[0]}',
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AppIconButton(
                                                icon: const Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                                tooltip: context.t.exEditRow,
                                                onPressed:
                                                    () => openAddExpenseSheet(
                                                      expense: e,
                                                    ),
                                              ),
                                              AppIconButton(
                                                icon: const Icon(
                                                  Icons.delete_outline,
                                                  size: 20,
                                                ),
                                                tooltip: context.t.exDeleteRow,
                                                onPressed:
                                                    () => _deleteExpense(e),
                                              ),
                                              Text(
                                                formatMoney(e['amount']),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddExpenseSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
