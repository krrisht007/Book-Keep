import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/app_style.dart';

class BulkAddItemsScreen extends StatefulWidget {
  const BulkAddItemsScreen({super.key});

  @override
  State<BulkAddItemsScreen> createState() => _BulkAddItemsScreenState();
}

class _BulkAddItemsScreenState extends State<BulkAddItemsScreen> {
  final _textController = TextEditingController();
  bool isSaving = false;
  String? errorMessage;
  String? successMessage;

  final String placeholder =
      'Nails 2 inch, 150, kg, Hardware\nPVC Pipe 1 inch, 120, meter, Plumbing\nWire 2.5mm, 45, meter, Electrical\nPaint Brush Small, 80, piece, Paint';

  List<Map<String, dynamic>>? parseLines() {
    final lines =
        _textController.text
            .split('\n')
            .map((l) => l.trim())
            .where((l) => l.isNotEmpty)
            .toList();

    if (lines.isEmpty) return null;

    final parsed = <Map<String, dynamic>>[];
    for (final line in lines) {
      final parts = line.split(',').map((p) => p.trim()).toList();
      if (parts.isEmpty || parts[0].isEmpty) continue;

      final name = parts[0];
      final price = parts.length > 1 ? double.tryParse(parts[1]) ?? 0 : 0.0;
      final unit = parts.length > 2 && parts[2].isNotEmpty ? parts[2] : null;
      final category =
          parts.length > 3 && parts[3].isNotEmpty ? parts[3] : null;

      parsed.add({
        'name': name,
        'price': price,
        if (unit != null) 'unit': unit,
        if (category != null) 'category': category,
        'stock_quantity': 0,
        'low_stock_threshold': 5,
      });
    }
    return parsed;
  }

  Future<void> saveBulk() async {
    final items = parseLines();
    if (items == null || items.isEmpty) {
      setState(() => errorMessage = context.t.blkEnterOne);
      return;
    }

    setState(() {
      isSaving = true;
      errorMessage = null;
      successMessage = null;
    });

    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/items/bulk'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(items),
      );

      if (!mounted) return;
      if (response.statusCode == 200) {
        final saved = jsonDecode(response.body) as List;
        setState(() {
          isSaving = false;
          successMessage = context.t.blkAdded(saved.length);
          _textController.clear();
        });
      } else {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isSaving = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = context.t.couldNotConnect('$e');
          isSaving = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.blkTitle),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.t.blkFormat,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              context.t.blkOptional,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: _textController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            if (successMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  successMessage!,
                  style: const TextStyle(color: Colors.green),
                ),
              ),
            GradientButton(
              label: context.t.blkAddAll,
              loading: isSaving,
              onPressed: isSaving ? null : saveBulk,
            ),
          ],
        ),
      ),
    );
  }
}
