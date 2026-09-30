import 'dart:convert';

import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart' as http;
import 'activity_log_screen.dart';
import 'config.dart';
import 'widgets/app_style.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool _loading = true;
  String? _error;

  final _baseUrlController = TextEditingController();
  final _smtpHostController = TextEditingController();
  final _smtpPortController = TextEditingController();
  final _smtpUsernameController = TextEditingController();
  final _smtpPasswordController = TextEditingController();
  final _smtpFromNameController = TextEditingController();
  bool _smtpConfigured = false;
  bool _smtpSaving = false;

  bool _expandServer = false;
  bool _expandEmail = false;
  bool _expandAccounts = true;
  bool _expandAccountability = true;

  Map<String, dynamic> _status = {};
  List<Map<String, dynamic>> _users = [];

  bool get _isAdmin => _status['is_admin'] == true;

  @override
  void initState() {
    super.initState();
    _baseUrlController.text = AppConfig.baseUrl;
    _load();
  }

  @override
  void dispose() {
    _baseUrlController.dispose();
    _smtpHostController.dispose();
    _smtpPortController.dispose();
    _smtpUsernameController.dispose();
    _smtpPasswordController.dispose();
    _smtpFromNameController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final statusRes = await http.get(
        Uri.parse('${AppConfig.baseUrl}/admin/status'),
      );
      if (statusRes.statusCode != 200) {
        throw Exception('Status ${statusRes.statusCode}: ${statusRes.body}');
      }
      final status = jsonDecode(statusRes.body) as Map<String, dynamic>;

      List<Map<String, dynamic>> users = [];
      if (status['is_admin'] == true) {
        final usersRes = await http.get(
          Uri.parse('${AppConfig.baseUrl}/admin/users'),
        );
        if (usersRes.statusCode == 200) {
          users =
              (jsonDecode(usersRes.body) as List).cast<Map<String, dynamic>>();
        }
        await _loadSmtp();
      }

      if (!mounted) return;
      setState(() {
        _status = status;
        _users = users;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _loadSmtp() async {
    try {
      final res = await http.get(
        Uri.parse('${AppConfig.baseUrl}/admin/smtp-settings'),
      );
      if (res.statusCode != 200) return;
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      _smtpHostController.text = (data['smtp_host'] ?? '') as String;
      _smtpPortController.text = data['smtp_port']?.toString() ?? '';
      _smtpUsernameController.text = (data['smtp_username'] ?? '') as String;
      _smtpFromNameController.text = (data['smtp_from_name'] ?? '') as String;
      _smtpConfigured = data['configured'] == true;
    } catch (_) {}
  }

  Future<void> _saveSmtp() async {
    final port = int.tryParse(_smtpPortController.text.trim());
    if (_smtpHostController.text.trim().isNotEmpty && port == null) {
      _showError(context.t.adBadPort);
      return;
    }
    setState(() => _smtpSaving = true);
    try {
      final body = <String, dynamic>{
        'smtp_host': _smtpHostController.text.trim(),
        'smtp_port': port,
        'smtp_username': _smtpUsernameController.text.trim(),
        'smtp_from_name': _smtpFromNameController.text.trim(),
      };
      if (_smtpPasswordController.text.isNotEmpty) {
        body['smtp_password'] = _smtpPasswordController.text;
      }
      final res = await http.put(
        Uri.parse('${AppConfig.baseUrl}/admin/smtp-settings'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (res.statusCode != 200) {
        throw Exception(_detail(res.body));
      }
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      _smtpConfigured = data['configured'] == true;
      _smtpPasswordController.clear();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.adEmailSaved)));
      }
    } catch (e) {
      _showErrorT((t) => t.adEmailSaveFailed('$e'));
    } finally {
      if (mounted) setState(() => _smtpSaving = false);
    }
  }

  Future<void> _saveBaseUrl() async {
    final url = _baseUrlController.text.trim();
    if (url.isEmpty) {
      _showError(context.t.adServerEmpty);
      return;
    }
    AppConfig.baseUrl = url;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('base_url', url);
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.adServerSaved)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.adminPanel),
      body:
          _loading
              ? const SkeletonListLoader()
              : _error != null
              ? _ErrorView(message: _error!, onRetry: _load)
              : _isAdmin
              ? _buildAdminView()
              : _buildNotAdminView(),
    );
  }

  Widget _buildNotAdminView() {
    final mode = _status['mode'];
    if (mode == 'open') {
      return _SetupCard(reason: _status['reason'] ?? '', onRetry: _load);
    }
    return _AccessDeniedView();
  }

  Widget _buildAdminView() {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _collapsibleHeader(
            icon: Icons.people_alt_rounded,
            title: context.t.adAccounts,
            subtitle: context.t.adAccountsSub(_users.length),
            expanded: _expandAccounts,
            onToggle: () => setState(() => _expandAccounts = !_expandAccounts),
            trailing: TextButton.icon(
              onPressed: _showCreateUserDialog,
              icon: const Icon(Icons.person_add_alt, size: 18),
              label: Text(context.t.adAdd),
            ),
          ),
          if (_expandAccounts) ...[
            const SizedBox(height: 8),
            if (_users.isEmpty)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(context.t.adNoAccounts),
                ),
              )
            else
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    for (final u in _users)
                      _UserTile(user: u, onTap: () => _showEditSheet(u)),
                  ],
                ),
              ),
          ],

          const SizedBox(height: 24),
          _collapsibleHeader(
            icon: Icons.fact_check_rounded,
            title: context.t.adAccountability,
            subtitle: context.t.adAccountabilitySub,
            expanded: _expandAccountability,
            onToggle:
                () => setState(
                  () => _expandAccountability = !_expandAccountability,
                ),
          ),
          if (_expandAccountability) ...[
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: IconBadge(
                  Icons.history,
                  theme.colorScheme.primary,
                  size: 38,
                ),
                title: Text(context.t.alTitle),
                subtitle: Text(context.t.adActivitySub),
                trailing: const Icon(Icons.chevron_right),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ActivityLogScreen(),
                      ),
                    ),
              ),
            ),
          ],

          const SizedBox(height: 24),
          _collapsibleHeader(
            icon: Icons.dns_rounded,
            title: context.t.adServer,
            subtitle: context.t.adServerSub,
            expanded: _expandServer,
            onToggle: () => setState(() => _expandServer = !_expandServer),
          ),
          if (_expandServer) ...[
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t.adServerHint,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _baseUrlController,
                      decoration: InputDecoration(
                        labelText: context.t.adApiBase,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _saveBaseUrl,
                        icon: const Icon(Icons.link),
                        label: Text(context.t.adSaveServer),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 24),
          _collapsibleHeader(
            icon: Icons.email_rounded,
            title: context.t.suEmail,
            subtitle:
                _smtpConfigured
                    ? context.t.adEmailSetSub
                    : context.t.adNotSetUp,
            expanded: _expandEmail,
            onToggle: () => setState(() => _expandEmail = !_expandEmail),
          ),
          if (_expandEmail) ...[
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _smtpConfigured
                          ? context.t.adEmailSetBody
                          : context.t.adEmailHelp,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _smtpHostController,
                      decoration: InputDecoration(
                        labelText: context.t.adSmtpHost,
                        hintText: 'smtp.gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _smtpPortController,
                      decoration: InputDecoration(
                        labelText: context.t.adSmtpPort,
                        hintText: '587',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _smtpUsernameController,
                      decoration: InputDecoration(
                        labelText: context.t.adEmailAddress,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _smtpPasswordController,
                      decoration: InputDecoration(
                        labelText:
                            _smtpConfigured
                                ? context.t.adPwKeep
                                : context.t.adPwApp,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _smtpFromNameController,
                      decoration: InputDecoration(
                        labelText: context.t.adFromName,
                        hintText: context.t.adFromHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _smtpSaving ? null : _saveSmtp,
                        icon: const Icon(Icons.email_outlined),
                        label: Text(
                          _smtpSaving
                              ? context.t.adSaving
                              : context.t.adSaveEmail,
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _collapsibleHeader({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool expanded,
    required VoidCallback onToggle,
    Widget? trailing,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
            trailing ??
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey.shade600,
                ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCreateUserDialog() async {
    final ctrlEmail = TextEditingController();
    final ctrlPass = TextEditingController();
    final ctrlName = TextEditingController();
    var makeAdmin = false;
    var canManage = false;
    final formKey = GlobalKey<FormState>();

    final created = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setDialogState) => AlertDialog(
                  scrollable: true,
                  title: Text(context.t.adAddAccount),
                  content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: context.t.suEmail,
                          ),
                          validator:
                              (v) =>
                                  (v == null || !v.contains('@'))
                                      ? context.t.acctValidEmail
                                      : null,
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: ctrlName,
                          decoration: InputDecoration(
                            labelText: context.t.adNameOpt,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: ctrlPass,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: context.t.acctPassword,
                          ),
                          validator:
                              (v) =>
                                  (v == null || v.length < 6)
                                      ? context.t.adAtLeast6
                                      : null,
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.adGrantAdmin),
                          value: makeAdmin,
                          onChanged: (v) => setDialogState(() => makeAdmin = v),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.adCanManage),
                          subtitle: Text(context.t.adCanManageHint),
                          value: makeAdmin || canManage,
                          onChanged:
                              makeAdmin
                                  ? null
                                  : (v) => setDialogState(() => canManage = v),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(context.t.cancel),
                    ),
                    FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context, true);
                        }
                      },
                      child: Text(context.t.adCreate),
                    ),
                  ],
                ),
          ),
    );
    if (created != true) {
      ctrlEmail.dispose();
      ctrlPass.dispose();
      ctrlName.dispose();
      return;
    }

    try {
      final res = await http.post(
        Uri.parse('${AppConfig.baseUrl}/admin/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': ctrlEmail.text.trim(),
          'password': ctrlPass.text,
          'name': ctrlName.text.trim().isEmpty ? null : ctrlName.text.trim(),
          'admin': makeAdmin,
          'can_manage': canManage,
        }),
      );
      if (res.statusCode != 200) {
        throw Exception(_detail(res.body));
      }
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.adAccountCreated)));
      _load();
    } catch (e) {
      _showErrorT((t) => t.adCreateFailed('$e'));
    } finally {
      ctrlEmail.dispose();
      ctrlPass.dispose();
      ctrlName.dispose();
    }
  }

  Future<void> _showEditSheet(Map<String, dynamic> user) async {
    final uid = user['uid'] as String;
    final ctrlName = TextEditingController(
      text: (user['display_name'] ?? '') as String?,
    );
    final ctrlEmail = TextEditingController(
      text: (user['email'] ?? '') as String?,
    );
    var admin = user['is_admin'] == true;
    var canManage = user['can_manage'] == true;
    var disabled = user['disabled'] == true;

    final save = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setSheetState) => Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.adEditAccount,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: context.t.suEmail,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: ctrlName,
                          decoration: InputDecoration(
                            labelText: context.t.suName,
                          ),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.adAdminSwitch),
                          subtitle: Text(context.t.adAdminHint),
                          value: admin,
                          onChanged: (v) => setSheetState(() => admin = v),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.adCanManage),
                          subtitle: Text(context.t.adCanManageHint),
                          value: admin || canManage,
                          onChanged:
                              admin
                                  ? null
                                  : (v) => setSheetState(() => canManage = v),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(context.t.adDisabled),
                          subtitle: Text(context.t.adDisabledHint),
                          value: disabled,
                          onChanged: (v) => setSheetState(() => disabled = v),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () => Navigator.pop(context, false),
                              icon: const Icon(Icons.close, size: 18),
                              label: Text(context.t.cancel),
                            ),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: () async {
                                final ok = await _confirmDelete(
                                  uid,
                                  (user['email'] ?? 'account').toString(),
                                );
                                if (ok && context.mounted) {
                                  Navigator.pop(context, false);
                                  _load();
                                }
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              icon: const Icon(Icons.delete_outline, size: 18),
                              label: Text(context.t.delete),
                            ),
                            FilledButton.icon(
                              onPressed: () => Navigator.pop(context, true),
                              icon: const Icon(Icons.save_outlined, size: 18),
                              label: Text(context.t.gstSave),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
    );

    if (save != true) {
      ctrlName.dispose();
      ctrlEmail.dispose();
      return;
    }

    final patch = <String, dynamic>{
      'name': ctrlName.text.trim(),
      'email': ctrlEmail.text.trim(),
      'admin': admin,
      'can_manage': canManage,
      'disabled': disabled,
    };
    try {
      final res = await http.patch(
        Uri.parse('${AppConfig.baseUrl}/admin/users/$uid'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(patch),
      );
      if (res.statusCode != 200) {
        throw Exception(_detail(res.body));
      }
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.adAccountUpdated)));
      _load();
    } catch (e) {
      _showErrorT((t) => t.adUpdateFailed('$e'));
    } finally {
      ctrlName.dispose();
      ctrlEmail.dispose();
    }
  }

  Future<bool> _confirmDelete(String uid, String label) async {
    final ok = await showDialog<bool>(
      context: context,
      builder:
          (context) => confirmDialogShell(
            context: context,
            title: context.t.acctDeleteTitle,
            message: context.t.adDeleteBody(label),
            actions: [
              EatingDeleteButton(
                onConfirmed: () => Navigator.pop(context, true),
              ),
              AnimatedCancelButton(
                onCancelled: () => Navigator.pop(context, false),
              ),
            ],
          ),
    );
    if (ok != true) return false;

    try {
      final res = await http.delete(
        Uri.parse('${AppConfig.baseUrl}/admin/users/$uid'),
      );
      if (res.statusCode != 200) {
        throw Exception(_detail(res.body));
      }
      if (!mounted) return true;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.adAccountDeleted)));
      return true;
    } catch (e) {
      _showErrorT((t) => t.adDeleteFailed('$e'));
      return false;
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showErrorT(String Function(AppLocalizations t) build) {
    if (!mounted) return;
    _showError(build(context.t));
  }

  String _detail(String body) {
    try {
      final decoded = jsonDecode(body);
      if (decoded is Map && decoded['detail'] != null) {
        return decoded['detail'].toString();
      }
    } catch (_) {}
    return body.length > 200 ? body.substring(0, 200) : body;
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({required this.user, required this.onTap});

  final Map<String, dynamic> user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final email = (user['email'] ?? 'no email') as String;
    final name = (user['display_name'] ?? '') as String;
    final isAdmin = user['is_admin'] == true;
    final disabled = user['disabled'] == true;

    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor:
            isAdmin
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Icon(
          isAdmin ? Icons.admin_panel_settings : Icons.person,
          size: 20,
        ),
      ),
      title: Text(name.isEmpty ? email : name, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        name.isEmpty ? '' : email,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isAdmin)
            _Badge(label: context.t.adBadgeAdmin, color: Colors.teal)
          else
            const SizedBox.shrink(),
          if (disabled) ...[
            const SizedBox(width: 6),
            _Badge(label: context.t.adBadgeDisabled, color: Colors.orange),
          ],
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: color,
        ),
      ),
    );
  }
}

class _SetupCard extends StatelessWidget {
  const _SetupCard({required this.reason, required this.onRetry});

  final String reason;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Icon(Icons.admin_panel_settings, size: 56, color: Colors.grey),
        const SizedBox(height: 12),
        Text(
          context.t.adOff,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(reason, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Steps to enable:\n\n'
              '1. Firebase console → Project settings → Service accounts → '
              'Generate new private key → save the JSON.\n'
              '2. In backend/.env set FIREBASE_SERVICE_ACCOUNT_PATH to that '
              'file.\n'
              '3. Set ADMIN_EMAILS to your own email (comma-separated for '
              'more).\n'
              '4. Restart the backend, then reopen this screen.',
            ),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: Text(context.t.adCheckAgain),
        ),
      ],
    );
  }
}

class _AccessDeniedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock_outline, size: 56, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              context.t.adAccessRequired,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(context.t.adAccessBody, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 56, color: Colors.red.shade300),
            const SizedBox(height: 12),
            Text(context.t.adCouldNotLoad),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(context.t.retry),
            ),
          ],
        ),
      ),
    );
  }
}
