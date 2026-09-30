import 'dart:convert';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'api.dart' as http;
import 'config.dart';
import 'widgets/app_style.dart';

class ActivityLogScreen extends StatefulWidget {
  const ActivityLogScreen({super.key});

  @override
  State<ActivityLogScreen> createState() => _ActivityLogScreenState();
}

class _ActivityLogScreenState extends State<ActivityLogScreen> {
  List<dynamic> _entries = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/admin/activity-log'),
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        setState(() {
          _entries = jsonDecode(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = context.t.serverError(response.statusCode);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = context.t.couldNotConnect('$e');
          _isLoading = false;
        });
      }
    }
  }

  static String _actionLabel(BuildContext context, String action) {
    final t = context.t;
    return switch (action) {
      'void_bill' => t.alVoided,
      'delete_bill' => t.alDeletedBill,
      'return_bill' => t.alReturned,
      'delete_customer' => t.alDeletedCustomer,
      'delete_supplier' => t.alDeletedSupplier,
      'admin_create_user' => t.alCreatedAccount,
      'admin_update_user' => t.alUpdatedAccount,
      'admin_delete_user' => t.alDeletedAccount,
      _ => action,
    };
  }

  static const _actionIcons = {
    'void_bill': Icons.block_outlined,
    'delete_bill': Icons.delete_outline,
    'return_bill': Icons.assignment_return_outlined,
    'delete_customer': Icons.person_remove_outlined,
    'delete_supplier': Icons.local_shipping_outlined,
    'admin_create_user': Icons.person_add_alt,
    'admin_update_user': Icons.manage_accounts_outlined,
    'admin_delete_user': Icons.person_off_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.alTitle),
      body:
          _isLoading
              ? const SkeletonListLoader()
              : _errorMessage != null
              ? errorRetry(_errorMessage!, _fetch)
              : _entries.isEmpty
              ? RefreshIndicator(
                onRefresh: _fetch,
                child: ListView(
                  children: [
                    SizedBox(height: 120),
                    Center(
                      child: Text(
                        context.t.alNone,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
              : RefreshIndicator(
                onRefresh: _fetch,
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _entries.length,
                  itemBuilder: (context, index) => _row(_entries[index]),
                ),
              ),
    );
  }

  Widget _row(dynamic e) {
    final action = e['action'] as String? ?? '';
    final who =
        (e['user_name'] as String?)?.isNotEmpty == true
            ? e['user_name'] as String
            : (e['user_email'] as String? ?? context.t.unknownName);
    final when =
        (e['created_at'] as String?)?.split('T').join(' ').split('.').first ??
        '';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AppCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconBadge(
              _actionIcons[action] ?? Icons.info_outline,
              Theme.of(context).colorScheme.primary,
              size: 34,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _actionLabel(context, action),
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  if ((e['details'] as String?)?.isNotEmpty == true) ...[
                    const SizedBox(height: 2),
                    Text(
                      e['details'] as String,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    '$who · $when',
                    style: const TextStyle(fontSize: 11.5, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
