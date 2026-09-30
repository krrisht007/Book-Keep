import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'gstin_utils.dart';
import 'phone_utils.dart';
import 'widgets/app_style.dart';
import 'local_db.dart';
import 'sync_service.dart';

class AddCustomerScreen extends StatefulWidget {
  final String? customerId;
  final String? initialName;
  final String? initialPhone;
  final String? initialCreditLimit;
  final String? initialStrn;
  final String? initialAddress;
  final String? initialEmail;
  final String? initialPriceTier;

  const AddCustomerScreen({
    super.key,
    this.customerId,
    this.initialName,
    this.initialPhone,
    this.initialCreditLimit,
    this.initialStrn,
    this.initialAddress,
    this.initialEmail,
    this.initialPriceTier,
  });
  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _creditLimitController;
  late final TextEditingController _strnController;
  late final TextEditingController _addressController;
  late final TextEditingController _emailController;
  late String _priceTier;
  bool isSaving = false;
  String? errorMessage;

  bool get isEditing => widget.customerId != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _phoneController = TextEditingController(
      text: phoneDigits(widget.initialPhone ?? ''),
    );
    _creditLimitController = TextEditingController(
      text: widget.initialCreditLimit ?? '',
    );
    _strnController = TextEditingController(text: widget.initialStrn ?? '');
    _addressController = TextEditingController(
      text: widget.initialAddress ?? '',
    );
    _emailController = TextEditingController(text: widget.initialEmail ?? '');
    _priceTier = widget.initialPriceTier ?? 'retail';
  }

  Future<void> saveCustomer() async {
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
      'credit_limit':
          _creditLimitController.text.trim().isEmpty
              ? null
              : double.tryParse(_creditLimitController.text.trim()),
      'strn':
          _strnController.text.trim().isEmpty
              ? null
              : _strnController.text.trim(),
      'address':
          _addressController.text.trim().isEmpty
              ? null
              : _addressController.text.trim(),
      'email':
          _emailController.text.trim().isEmpty
              ? null
              : _emailController.text.trim(),
      'price_tier': _priceTier,
    });

    try {
      final response =
          isEditing
              ? await http.put(
                Uri.parse(
                  '${AppConfig.baseUrl}/customers/${widget.customerId}',
                ),
                headers: {'Content-Type': 'application/json'},
                body: body,
              )
              : await http.post(
                Uri.parse('${AppConfig.baseUrl}/customers'),
                headers: {'Content-Type': 'application/json'},
                body: body,
              );

      if (response.statusCode == 200) {
        if (mounted) Navigator.pop(context, true);
      } else {
        setState(() {
          errorMessage = context.t.serverError(response.statusCode);
          isSaving = false;
        });
      }
    } catch (e) {
      await LocalDb.instance.enqueueWrite(
        method: isEditing ? 'PUT' : 'POST',
        path: isEditing ? '/customers/${widget.customerId}' : '/customers',
        label: t.qCustomer(_nameController.text.trim()),
        payload: jsonDecode(body),
      );
      await SyncService.instance.refreshPendingCount();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.frmOfflineCustomer)));
        Navigator.pop(context, true);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _creditLimitController.dispose();
    _strnController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(
        title: isEditing ? context.t.frmEditCustomer : context.t.addCustomer,
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
                    label: context.t.frmCustomerName,
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
                  controller: _creditLimitController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmCreditLimit,
                    helperText: context.t.frmCreditHelper,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Text(
                  context.t.frmPriceTier,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                SegmentedButton<String>(
                  segments: [
                    ButtonSegment(
                      value: 'retail',
                      label: Text(context.t.frmRetail),
                    ),
                    ButtonSegment(
                      value: 'wholesale',
                      label: Text(context.t.frmWholesale),
                    ),
                    ButtonSegment(
                      value: 'contractor',
                      label: Text(context.t.frmContractor),
                    ),
                  ],
                  selected: {_priceTier},
                  onSelectionChanged:
                      (s) => setState(() => _priceTier = s.first),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    context.t.frmPriceTierHelper,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _strnController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmStrn,
                    helperText: context.t.frmStrnCustomer,
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
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: appInputDecoration(
                    context,
                    label: context.t.frmEmail,
                    helperText: context.t.frmEmailHelper,
                  ),
                  keyboardType: TextInputType.emailAddress,
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
                          : context.t.frmSaveCustomer,
                  loading: isSaving,
                  onPressed: isSaving ? null : saveCustomer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
