import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

import 'auth_service.dart';
import 'auth_glass.dart';
import '../phone_utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _loading = false;
  bool _obscurePass = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final messenger = ScaffoldMessenger.of(context);
      final t = context.t;
      await AuthService.instance.signUpWithEmail(
        email: _emailCtrl.text,
        password: _passCtrl.text,
        name: _nameCtrl.text,
        phone: formatPhoneForSave(_phoneCtrl.text),
      );
      messenger.showSnackBar(
        SnackBar(content: Text(t.suCreated(_emailCtrl.text.trim()))),
      );
      if (mounted) Navigator.popUntil(context, (route) => route.isFirst);
    } on Exception catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_friendlyError(e))));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _friendlyError(Exception e) {
    final msg = e.toString();
    if (msg.contains('email-already-in-use')) {
      return context.t.suAlreadyExists;
    }
    if (msg.contains('invalid-email')) return context.t.suInvalidEmail;
    if (msg.contains('weak-password')) {
      return context.t.lnWeakPassword;
    }
    if (msg.contains('network-request-failed')) {
      return context.t.lnNoInternet;
    }
    if (msg.contains('Incorrect')) return context.t.lnWrongPassword;
    return msg.replaceFirst(RegExp(r'^Exception:\s*'), '');
  }

  @override
  Widget build(BuildContext context) {
    return AuthGlassScaffold(
      child: Column(
        children: [
          AuthHeader(
            icon: Icons.person_add_alt_1_rounded,
            title: context.t.lnCreate,
            subtitle: context.t.suSetup('Hardware Store Book Keeper'),
          ),
          AuthReveal(
            start: 0.6,
            seconds: 0.8,
            dy: 60,
            child: AuthGlassCard(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthGlassField(
                      controller: _nameCtrl,
                      label: context.t.suName,
                      icon: Icons.person_outline_rounded,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return context.t.acctRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    AuthGlassField(
                      controller: _emailCtrl,
                      label: context.t.suEmail,
                      icon: Icons.alternate_email_rounded,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return context.t.acctRequired;
                        }
                        if (!v.contains('@')) {
                          return context.t.acctValidEmail;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    AuthGlassField(
                      controller: _phoneCtrl,
                      label: context.t.settingsPhoneLabel,
                      icon: Icons.phone_outlined,
                      prefixText: phoneFieldPrefix,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [PhoneDigitsFormatter()],
                      validator: (v) {
                        if (phoneDigits(v ?? '').length != phoneLocalDigits) {
                          return context.t.suPhoneDigits(phoneLocalDigits);
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    AuthGlassField(
                      controller: _passCtrl,
                      label: context.t.acctPassword,
                      icon: Icons.lock_outline_rounded,
                      obscure: _obscurePass,
                      onToggleObscure:
                          () => setState(() => _obscurePass = !_obscurePass),
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return context.t.acctRequired;
                        }
                        if (v.length < 6) {
                          return context.t.acctPasswordMin;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    AuthGlassField(
                      controller: _confirmCtrl,
                      label: context.t.acctConfirmPassword,
                      icon: Icons.lock_outline_rounded,
                      obscure: _obscureConfirm,
                      onToggleObscure:
                          () => setState(
                            () => _obscureConfirm = !_obscureConfirm,
                          ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _signUp(),
                      validator:
                          (v) =>
                              v != _passCtrl.text
                                  ? context.t.acctPasswordsMismatch
                                  : null,
                    ),
                    const SizedBox(height: 20),
                    AuthPrimaryButton(
                      label: context.t.suCreateBtn,
                      loading: _loading,
                      onPressed: _loading ? null : _signUp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          AuthReveal(
            start: 1.0,
            seconds: 0.6,
            child: AuthFooterLink(
              prefix: context.t.suHaveAccount,
              action: context.t.lnSignIn,
              onTap: _loading ? null : () => Navigator.pop(context),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
