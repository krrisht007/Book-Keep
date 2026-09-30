import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'app_lock_service.dart';
import 'auth/auth_service.dart';
import 'l10n/l10n.dart';
import 'widgets/app_style.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(title: context.t.account),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [_AccountCard()],
      ),
    );
  }
}

class _AccountCard extends StatefulWidget {
  const _AccountCard();

  @override
  State<_AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<_AccountCard> {
  bool _linkingPassword = false;
  bool _changingUsername = false;
  bool _changingEmail = false;
  bool _unlinkingProvider = false;
  bool _deletingAccount = false;
  String? _username;

  bool _lockEnabled = false;
  bool _canBiometric = false;
  bool _useBiometric = false;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadLockState();
  }

  Future<void> _loadUsername() async {
    final username = await AuthService.instance.currentUsername();
    if (mounted) setState(() => _username = username);
  }

  Future<void> _loadLockState() async {
    final enabled = await AppLockService.instance.isEnabled;
    final canBio = await AppLockService.instance.canUseBiometrics();
    final useBio = await AppLockService.instance.useBiometric;
    if (mounted) {
      setState(() {
        _lockEnabled = enabled;
        _canBiometric = canBio;
        _useBiometric = useBio;
      });
    }
  }

  Future<void> _toggleLock(bool value) async {
    if (!value) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(context.t.acctTurnOffLockTitle),
              content: Text(context.t.acctTurnOffLockBody),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(context.t.cancel),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    context.t.acctTurnOff,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
              ],
            ),
      );
      if (confirmed != true) return;
      await AppLockService.instance.disable();
      if (mounted) {
        setState(() {
          _lockEnabled = false;
          _useBiometric = false;
        });
      }
      return;
    }

    final pinCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final pin = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            scrollable: true,
            title: Text(context.t.acctSetPinTitle),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: pinCtrl,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      labelText: context.t.acctPinLabel,
                    ),
                    validator:
                        (v) =>
                            (v == null || v.length < 4)
                                ? context.t.acctPinMin
                                : null,
                  ),
                  TextFormField(
                    controller: confirmCtrl,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      labelText: context.t.acctConfirmPin,
                    ),
                    validator:
                        (v) =>
                            v != pinCtrl.text
                                ? context.t.acctPinMismatch
                                : null,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.t.cancel),
              ),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context, pinCtrl.text);
                  }
                },
                child: Text(context.t.acctSetPin),
              ),
            ],
          ),
    );
    if (pin == null) return;
    await AppLockService.instance.enable(pin);
    final canBio = await AppLockService.instance.canUseBiometrics();
    if (mounted) {
      setState(() {
        _lockEnabled = true;
        _canBiometric = canBio;
      });
    }

    if (canBio && mounted) {
      final useBio = await showDialog<bool>(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(context.t.acctBiometricTitle),
              content: Text(context.t.acctBiometricBody),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(context.t.acctNoThanks),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(context.t.acctEnable),
                ),
              ],
            ),
      );
      if (useBio == true) {
        await AppLockService.instance.setUseBiometric(true);
        if (mounted) setState(() => _useBiometric = true);
      }
    }
  }

  Future<void> _toggleBiometric(bool value) async {
    await AppLockService.instance.setUseBiometric(value);
    if (mounted) setState(() => _useBiometric = value);
  }

  Future<void> _setPassword() async {
    final passCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final password = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            scrollable: true,
            title: Text(context.t.acctSetPasswordTitle),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.t.acctSetPasswordIntro,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passCtrl,
                    obscureText: true,
                    autofocus: true,
                    decoration: appInputDecoration(
                      context,
                      label: context.t.acctPassword,
                    ),
                    validator:
                        (v) =>
                            (v == null || v.length < 6)
                                ? context.t.acctPasswordMin
                                : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: confirmCtrl,
                    obscureText: true,
                    decoration: appInputDecoration(
                      context,
                      label: context.t.acctConfirmPassword,
                    ),
                    validator:
                        (v) =>
                            v != passCtrl.text
                                ? context.t.acctPasswordsMismatch
                                : null,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context, passCtrl.text);
                  }
                },
                child: Text(context.t.acctSetPasswordButton),
              ),
            ],
          ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      passCtrl.dispose();
      confirmCtrl.dispose();
    });
    if (password == null || !mounted) return;

    setState(() => _linkingPassword = true);
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      await AuthService.instance.linkPassword(password);
      messenger.showSnackBar(SnackBar(content: Text(t.acctPasswordSet)));
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(t.acctCouldNotSetPassword('$e'))),
      );
    } finally {
      if (mounted) setState(() => _linkingPassword = false);
    }
  }

  Future<void> _changePassword() async {
    final currentCtrl = TextEditingController();
    final newCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final newPassword = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            scrollable: true,
            title: Text(context.t.acctChangePasswordTitle),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: currentCtrl,
                    obscureText: true,
                    autofocus: true,
                    decoration: appInputDecoration(
                      context,
                      label: context.t.acctCurrentPassword,
                    ),
                    validator:
                        (v) =>
                            (v == null || v.isEmpty)
                                ? context.t.acctRequired
                                : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: newCtrl,
                    obscureText: true,
                    decoration: appInputDecoration(
                      context,
                      label: context.t.acctNewPassword,
                    ),
                    validator:
                        (v) =>
                            (v == null || v.length < 6)
                                ? context.t.acctPasswordMin
                                : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: confirmCtrl,
                    obscureText: true,
                    decoration: appInputDecoration(
                      context,
                      label: context.t.acctConfirmNewPassword,
                    ),
                    validator:
                        (v) =>
                            v != newCtrl.text
                                ? context.t.acctPasswordsMismatch
                                : null,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context, newCtrl.text);
                  }
                },
                child: Text(context.t.acctChange),
              ),
            ],
          ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      currentCtrl.dispose();
      newCtrl.dispose();
      confirmCtrl.dispose();
    });
    if (newPassword == null || !mounted) return;

    setState(() => _linkingPassword = true);
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      await AuthService.instance.changePassword(
        currentPassword: currentCtrl.text,
        newPassword: newPassword,
      );
      messenger.showSnackBar(SnackBar(content: Text(t.acctPasswordChanged)));
    } on fb.FirebaseAuthException catch (e) {
      final msg =
          (e.code == 'wrong-password' || e.code == 'invalid-credential')
              ? t.acctWrongPassword
              : e.message ?? e.code;
      messenger.showSnackBar(SnackBar(content: Text(msg)));
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(t.acctCouldNotChangePassword('$e'))),
      );
    } finally {
      if (mounted) setState(() => _linkingPassword = false);
    }
  }

  Future<void> _changeUsername() async {
    final usernameCtrl = TextEditingController(text: _username ?? '');
    final formKey = GlobalKey<FormState>();
    final newUsername = await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            scrollable: true,
            title: Text(context.t.acctChangeUsernameTitle),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: usernameCtrl,
                autofocus: true,
                decoration: appInputDecoration(
                  context,
                  label: context.t.acctUsername,
                ),
                validator:
                    (v) =>
                        (v == null || v.trim().isEmpty)
                            ? context.t.acctUsernameEmpty
                            : null,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context, usernameCtrl.text.trim());
                  }
                },
                child: Text(context.t.acctChange),
              ),
            ],
          ),
    );
    Future.delayed(const Duration(milliseconds: 300), usernameCtrl.dispose);
    if (newUsername == null || !mounted || newUsername == _username) return;

    setState(() => _changingUsername = true);
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      await AuthService.instance.changeUsername(newUsername);
      if (mounted) setState(() => _username = newUsername);
      messenger.showSnackBar(SnackBar(content: Text(t.acctUsernameChanged)));
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _changingUsername = false);
    }
  }

  Future<void> _changeEmail() async {
    final svc = AuthService.instance;
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            scrollable: true,
            title: Text(context.t.acctChangeEmailTitle),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: appInputDecoration(
                      context,
                      label: context.t.acctNewEmail,
                    ),
                    validator:
                        (v) =>
                            (v == null || !v.contains('@'))
                                ? context.t.acctValidEmail
                                : null,
                  ),
                  if (svc.hasPasswordProvider) ...[
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: passwordCtrl,
                      obscureText: true,
                      decoration: appInputDecoration(
                        context,
                        label: context.t.acctCurrentPassword,
                      ),
                      validator:
                          (v) =>
                              (v == null || v.isEmpty)
                                  ? context.t.acctRequiredConfirm
                                  : null,
                    ),
                  ] else ...[
                    const SizedBox(height: 8),
                    Text(
                      context.t.acctGoogleConfirmFirst,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context, true);
                  }
                },
                child: Text(context.t.acctChange),
              ),
            ],
          ),
    );
    final newEmail = emailCtrl.text.trim();
    final password = passwordCtrl.text;
    Future.delayed(const Duration(milliseconds: 300), () {
      emailCtrl.dispose();
      passwordCtrl.dispose();
    });
    if (result != true || !mounted) return;

    setState(() => _changingEmail = true);
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      await svc.changeEmail(newEmail: newEmail, currentPassword: password);
      messenger.showSnackBar(
        SnackBar(content: Text(t.acctCheckEmail(newEmail))),
      );
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _changingEmail = false);
    }
  }

  Future<void> _unlink(String providerId) async {
    final label =
        providerId == 'google.com'
            ? context.t.acctProviderGoogle
            : context.t.acctProviderPassword;
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.acctRemoveTitle(label)),
            content: Text(context.t.acctRemoveBody(label)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  context.t.acctRemove,
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
            ],
          ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _unlinkingProvider = true);
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      await AuthService.instance.unlinkProvider(providerId);
      messenger.showSnackBar(SnackBar(content: Text(t.acctRemoved(label))));
      if (mounted) setState(() {});
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
      );
    } finally {
      if (mounted) setState(() => _unlinkingProvider = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final svc = AuthService.instance;
    final email = svc.userEmail ?? svc.displayName ?? context.t.acctSignedIn;

    return AppCard(
      padding: const EdgeInsets.all(20),
      shadowStrength: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.6),
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  (_username?.isNotEmpty == true ? _username! : email)[0]
                      .toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    if (_username != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        '@$_username',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 13,
                        ),
                      ),
                    ],
                    if (svc.hasGoogleProvider) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppStyle.tint(context, Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.g_mobiledata,
                              size: 18,
                              color: Colors.blue.shade700,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (!svc.isEmailVerified) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: 18,
                  color: Colors.orange.shade700,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.t.acctEmailNotVerified,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final t = context.t;
                    await AuthService.instance.sendVerificationEmail();
                    messenger.showSnackBar(
                      SnackBar(content: Text(t.acctVerificationSent)),
                    );
                  },
                  child: Text(context.t.acctResend),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionLabel(context.t.acctSectionSignIn),
                _row(
                  icon: Icons.alternate_email,
                  color: Colors.teal.shade600,
                  label: context.t.acctRowChangeUsername,
                  busy: _changingUsername,
                  onTap: _changeUsername,
                ),
                const Divider(height: 1),
                _row(
                  icon: Icons.email_outlined,
                  color: Colors.teal.shade600,
                  label: context.t.acctRowChangeEmail,
                  busy: _changingEmail,
                  onTap: _changeEmail,
                ),
                const Divider(height: 1),
                if (!svc.hasPasswordProvider)
                  _row(
                    icon: Icons.password_outlined,
                    color: Colors.indigo.shade400,
                    label: context.t.acctRowSetPassword,
                    busy: _linkingPassword,
                    onTap: _setPassword,
                  )
                else
                  _row(
                    icon: Icons.password_outlined,
                    color: Colors.indigo.shade400,
                    label: context.t.acctRowChangePassword,
                    busy: _linkingPassword,
                    onTap: _changePassword,
                  ),
                if (svc.hasGoogleProvider && svc.hasPasswordProvider) ...[
                  const Divider(height: 1),
                  _row(
                    icon: Icons.link_off,
                    color: Colors.orange.shade600,
                    label: context.t.acctRowUnlinkGoogle,
                    busy: _unlinkingProvider,
                    onTap: () => _unlink('google.com'),
                  ),
                  const Divider(height: 1),
                  _row(
                    icon: Icons.link_off,
                    color: Colors.orange.shade600,
                    label: context.t.acctRowRemovePassword,
                    busy: _unlinkingProvider,
                    onTap: () => _unlink('password'),
                  ),
                ],
                const Divider(height: 1),
                _row(
                  icon: Icons.lock_outline,
                  color: Colors.purple.shade300,
                  label: context.t.acctRowAppLock,
                  trailing: Switch(value: _lockEnabled, onChanged: _toggleLock),
                ),
                if (_lockEnabled && _canBiometric) ...[
                  const Divider(height: 1),
                  _row(
                    icon: Icons.fingerprint,
                    color: Colors.purple.shade300,
                    label: context.t.acctRowBiometric,
                    trailing: Switch(
                      value: _useBiometric,
                      onChanged: _toggleBiometric,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text(context.t.acctSignOutTitle),
                            content: Text(context.t.acctSignOutBody),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text(context.t.cancel),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text(
                                  context.t.acctSignOut,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                    );
                    if (confirmed == true) {
                      await AuthService.instance.signOut();
                    }
                  },
                  icon: const Icon(Icons.logout, size: 18),
                  label: Text(context.t.acctSignOut),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _deletingAccount ? null : _deleteAccount,
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    size: 18,
                    color: Colors.red.shade700,
                  ),
                  label: Text(
                    _deletingAccount
                        ? context.t.acctDeleting
                        : context.t.acctDeleteAccount,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                    side: BorderSide(color: Colors.red.shade200),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 4, top: 4),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    ),
  );

  Widget _row({
    required IconData icon,
    required String label,
    Color? color,
    bool busy = false,
    Future<void> Function()? onTap,
    Widget? trailing,
  }) {
    final onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      minLeadingWidth: 28,
      leading: Icon(icon, size: 20, color: color ?? onSurfaceVariant),
      title: Text(label, style: const TextStyle(fontSize: 14)),
      trailing:
          trailing ??
          (busy
              ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : (onTap != null
                  ? Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: onSurfaceVariant.withValues(alpha: 0.7),
                  )
                  : null)),
      onTap: (onTap == null || busy) ? null : () => onTap(),
    );
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.t.acctDeleteTitle),
            content: Text(context.t.acctDeleteBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.t.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  context.t.delete,
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
            ],
          ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _deletingAccount = true);
    final messenger = ScaffoldMessenger.of(context);
    final t = context.t;
    try {
      await AuthService.instance.deleteAccount();
    } catch (e) {
      if (mounted) {
        setState(() => _deletingAccount = false);
        messenger.showSnackBar(
          SnackBar(content: Text(t.acctCouldNotDelete('$e'))),
        );
      }
    }
  }
}
