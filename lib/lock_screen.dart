import 'package:flutter/material.dart';
import 'l10n/l10n.dart';

import 'app_lock_service.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key, required this.onUnlocked});

  final VoidCallback onUnlocked;

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String _pin = '';
  String? _error;
  bool _checkingBiometric = false;

  @override
  void initState() {
    super.initState();
    _tryBiometricOnOpen();
  }

  Future<void> _tryBiometricOnOpen() async {
    if (!await AppLockService.instance.useBiometric) return;
    setState(() => _checkingBiometric = true);
    final ok = await AppLockService.instance.authenticateWithBiometrics();
    if (!mounted) return;
    setState(() => _checkingBiometric = false);
    if (ok) widget.onUnlocked();
  }

  Future<void> _submit() async {
    final ok = await AppLockService.instance.verifyPin(_pin);
    if (ok) {
      widget.onUnlocked();
      return;
    }
    setState(() {
      _error = context.t.lkWrongPin;
      _pin = '';
    });
  }

  void _tapDigit(String d) {
    if (_pin.length >= 6) return;
    setState(() {
      _error = null;
      _pin += d;
    });
    if (_pin.length >= 4) _submit();
  }

  void _backspace() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: LayoutBuilder(
          builder:
              (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 48,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.t.lkEnterPin,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (i) {
                            final filled = i < _pin.length;
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: filled ? Colors.white : Colors.white24,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 20,
                          child: Text(
                            _error ??
                                (_checkingBiometric
                                    ? context.t.lkChecking
                                    : ''),
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        const Spacer(),
                        for (final row in [
                          ['1', '2', '3'],
                          ['4', '5', '6'],
                          ['7', '8', '9'],
                          ['fingerprint', '0', 'backspace'],
                        ])
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  row.map((key) {
                                    if (key == 'fingerprint') {
                                      return _padButton(
                                        child: const Icon(
                                          Icons.fingerprint,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        onTap: _tryBiometricOnOpen,
                                      );
                                    }
                                    if (key == 'backspace') {
                                      return _padButton(
                                        child: const Icon(
                                          Icons.backspace_outlined,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                        onTap: _backspace,
                                      );
                                    }
                                    return _padButton(
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      onTap: () => _tapDigit(key),
                                    );
                                  }).toList(),
                            ),
                          ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget _padButton({required Widget child, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white10,
          ),
          child: child,
        ),
      ),
    );
  }
}
