import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLockService {
  AppLockService._();
  static final AppLockService instance = AppLockService._();

  static const _enabledKey = 'app_lock_enabled';
  static const _pinHashKey = 'app_lock_pin_hash';
  static const _useBiometricKey = 'app_lock_use_biometric';

  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> get isEnabled async =>
      (await SharedPreferences.getInstance()).getBool(_enabledKey) ?? false;

  Future<bool> get useBiometric async =>
      (await SharedPreferences.getInstance()).getBool(_useBiometricKey) ??
      false;

  Future<void> setUseBiometric(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_useBiometricKey, value);
  }

  Future<bool> canUseBiometrics() async {
    try {
      final supported = await _localAuth.isDeviceSupported();
      final enrolled = await _localAuth.getAvailableBiometrics();
      debugPrint('AppLock biometrics: supported=$supported enrolled=$enrolled');
      return supported && enrolled.isNotEmpty;
    } catch (e) {
      debugPrint('AppLock biometrics check failed: $e');
      return false;
    }
  }

  String _hash(String pin) => sha256.convert(utf8.encode(pin)).toString();

  Future<void> enable(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pinHashKey, _hash(pin));
    await prefs.setBool(_enabledKey, true);
  }

  Future<void> disable() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pinHashKey);
    await prefs.setBool(_enabledKey, false);
    await prefs.setBool(_useBiometricKey, false);
  }

  Future<bool> verifyPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_pinHashKey);
    return stored != null && stored == _hash(pin);
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Unlock Book-Keep',
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (_) {
      return false;
    }
  }
}
