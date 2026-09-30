import 'package:flutter/material.dart';
import '../l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';
import 'auth_service.dart';
import 'auth_glass.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  bool _obscure = true;
  bool _keepSignedIn = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _loading = true);
    try {
      await AuthService.instance.signInWithEmail(
        _emailCtrl.text,
        _passCtrl.text,
      );
      await _saveKeepSignedIn();
    } on Exception catch (e) {
      debugPrint('[Auth] email sign-in failed: $e');
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(_friendlyError(e))));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _googleSignIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _loading = true);
    try {
      await AuthService.instance.signInWithGoogle();
      await _saveKeepSignedIn();
    } on Exception catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(_friendlyError(e))));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _resetPassword() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final email = _emailCtrl.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.lnEnterEmailFirst)));
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    try {
      await AuthService.instance.sendPasswordReset(email);
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(context.t.lnResetSent)));
    } on Exception catch (e) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(_friendlyError(e))));
    }
  }

  Future<void> _saveKeepSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('keepSignedIn', _keepSignedIn);
  }

  String _friendlyError(Exception e) {
    final msg = e.toString();
    if (msg.contains('user-not-found')) {
      return context.t.lnNoAccount;
    }
    if (msg.contains('wrong-password')) return context.t.lnWrongPassword;
    if (msg.contains('invalid-email')) {
      return context.t.lnInvalidEmail;
    }
    if (msg.contains('user-disabled')) return context.t.lnDisabled;
    if (msg.contains('too-many-requests')) {
      return context.t.lnTooMany;
    }
    if (msg.contains('network-request-failed')) {
      return context.t.lnNoInternet;
    }
    if (msg.contains('weak-password')) {
      return context.t.lnWeakPassword;
    }
    if (msg.contains('[firebase_auth/')) {
      return context.t.lnCouldNotSignIn;
    }
    if (msg.contains('Incorrect username')) return context.t.lnWrongUsername;
    if (msg.contains('Try again or tap')) return context.t.lnWrongPasswordHint;
    if (msg.contains('Incorrect email or password')) {
      return context.t.lnWrongEmailOrPassword;
    }
    if (msg.contains('Incorrect email')) return context.t.lnWrongEmail;
    if (msg.contains('Incorrect password')) return context.t.lnWrongPassword;
    return msg.replaceFirst(RegExp(r'^Exception:\s*'), '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AuthGlassScaffold(
      child: Column(
        children: [
          AuthHeader(
            icon: Icons.auto_stories_rounded,
            title: context.t.lnWelcome,
            subtitle: context.t.lnSignInTo('Hardware Store Book Keeper'),
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
                      controller: _emailCtrl,
                      label: context.t.lnEmailOrUsername,
                      icon: Icons.alternate_email_rounded,
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
                      controller: _passCtrl,
                      label: context.t.acctPassword,
                      icon: Icons.lock_outline_rounded,
                      obscure: _obscure,
                      onToggleObscure:
                          () => setState(() => _obscure = !_obscure),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _signIn(),
                      validator:
                          (v) =>
                              (v == null || v.isEmpty)
                                  ? context.t.acctRequired
                                  : null,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: _keepSignedIn,
                              onChanged:
                                  _loading
                                      ? null
                                      : (v) => setState(
                                        () => _keepSignedIn = v ?? true,
                                      ),
                              activeColor: Colors.white,
                              checkColor: theme.colorScheme.primary,
                              side: BorderSide(
                                color: Colors.white.withValues(alpha: 0.8),
                                width: 1.5,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            Text(
                              context.t.lnRemember,

                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        TextButton(
                          onPressed: _loading ? null : _resetPassword,
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                          child: Text(
                            context.t.lnForgot,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    AuthPrimaryButton(
                      label: context.t.lnSignIn,
                      loading: _loading,
                      onPressed: _loading ? null : _signIn,
                    ),
                    if (AppConfig.googleWebClientId.isNotEmpty) ...[
                      const SizedBox(height: 18),
                      const AuthOrDivider(),
                      const SizedBox(height: 18),
                      AuthOutlineButton(
                        label: context.t.lnGoogle,
                        onPressed: _loading ? null : _googleSignIn,
                        leading: const Text(
                          'G',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
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
              prefix: context.t.lnNew,
              action: context.t.lnCreate,
              onTap:
                  _loading
                      ? null
                      : () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
