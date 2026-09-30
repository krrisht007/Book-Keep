import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'gstin_utils.dart';
import 'local_db.dart';
import 'phone_utils.dart';
import 'sync_service.dart';
import 'widgets/app_style.dart';

class AddSupplierScreen extends StatefulWidget {
  final String? supplierId;
  final String? initialName;
  final String? initialPhone;
  final String? initialStrn;
  final String? initialAddress;

  const AddSupplierScreen({
    super.key,
    this.supplierId,
    this.initialName,
    this.initialPhone,
    this.initialStrn,
    this.initialAddress,
  });
  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _strnController;
  late final TextEditingController _addressController;
  bool isSaving = false;
  String? errorMessage;

  bool get isEditing => widget.supplierId != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _phoneController = TextEditingController(
      text: phoneDigits(widget.initialPhone ?? ''),
    );
    _strnController = TextEditingController(text: widget.initialStrn ?? '');
    _addressController = TextEditingController(
      text: widget.initialAddress ?? '',
    );
  }

  Future<void> saveSupplier() async {
    final t = context.t;
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isSaving = true;
      errorMessage = null;
    });

    final body = jsonEncode({
      'name': _nameController.text.trim(),
      'phone':
          _phoneController.text.trim().isEmpty
              ? null
              : formatPhoneForSave(_phoneController.text),
      'strn':
          _strnController.text.trim().isEmpty
              ? null
              : _strnController.text.trim(),
      'address':
          _addressController.text.trim().isEmpty
              ? null
              : _addressController.text.trim(),
    });

    try {
      final response =
          isEditing
              ? await http.put(
                Uri.parse(
                  '${AppConfig.baseUrl}/suppliers/${widget.supplierId}',
                ),
                headers: {'Content-Type': 'application/json'},
                body: body,
              )
              : await http.post(
                Uri.parse('${AppConfig.baseUrl}/suppliers'),
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
        path: isEditing ? '/suppliers/${widget.supplierId}' : '/suppliers',
        label: t.qSupplier(_nameController.text.trim()),
        payload: jsonDecode(body),
      );
      await SyncService.instance.refreshPendingCount();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.frmOfflineSupplier)));
        Navigator.pop(context, true);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _strnController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(
        title: isEditing ? context.t.frmEditSupplier : context.t.addSupplier,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmSupplierName,
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
                  controller: _phoneController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmPhoneOptional,
                    prefixText: phoneFieldPrefix,
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [PhoneDigitsFormatter()],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _strnController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmStrn,
                    helperText: context.t.frmStrnSupplier,
                  ),
                  keyboardType: TextInputType.number,
                  validator: validateStrn,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmAddress,
                  ),
                  maxLines: 2,
                ),
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
                          : context.t.frmSaveSupplier,
                  loading: isSaving,
                  onPressed: isSaving ? null : saveSupplier,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
