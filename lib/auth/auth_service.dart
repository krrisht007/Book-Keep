import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api.dart' as http;
import '../config.dart';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  fb.FirebaseAuth get _auth => fb.FirebaseAuth.instance;

  bool _googleInitialized = false;

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    await GoogleSignIn.instance.initialize(
      serverClientId: AppConfig.googleWebClientId,
    );
    _googleInitialized = true;
  }

  Future<String?> getIdToken({bool forceRefresh = false}) async {
    if (!AppConfig.firebaseReady) return null;
    return _auth.currentUser?.getIdToken(forceRefresh);
  }

  fb.User? get currentUser =>
      AppConfig.firebaseReady ? _auth.currentUser : null;

  String? get userEmail => currentUser?.email;

  String? get displayName => currentUser?.displayName;

  bool get hasPasswordProvider =>
      currentUser?.providerData.any((p) => p.providerId == 'password') ?? false;

  bool get hasGoogleProvider =>
      currentUser?.providerData.any((p) => p.providerId == 'google.com') ??
      false;

  Future<void> linkPassword(String password) async {
    final user = currentUser;
    final email = user?.email;
    if (user == null || email == null) {
      throw Exception('Not signed in.');
    }
    final credential = fb.EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await user.linkWithCredential(credential);
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = currentUser;
    final email = user?.email;
    if (user == null || email == null) {
      throw Exception('Not signed in.');
    }
    final credential = fb.EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);
    await user.updatePassword(newPassword);
  }

  Future<void> changeEmail({
    required String newEmail,
    String? currentPassword,
  }) async {
    final user = currentUser;
    if (user == null) throw Exception('Not signed in.');
    if (hasPasswordProvider) {
      final email = user.email;
      if (email == null || currentPassword == null || currentPassword.isEmpty) {
        throw Exception('Current password is required.');
      }
      await user.reauthenticateWithCredential(
        fb.EmailAuthProvider.credential(
          email: email,
          password: currentPassword,
        ),
      );
    } else {
      await _ensureGoogleInitialized();
      final GoogleSignInAccount googleUser;
      try {
        googleUser = await GoogleSignIn.instance.authenticate();
      } on GoogleSignInException catch (e) {
        if (e.code == GoogleSignInExceptionCode.canceled) return;
        rethrow;
      }
      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        throw Exception('Could not verify your Google account.');
      }
      await user.reauthenticateWithCredential(
        fb.GoogleAuthProvider.credential(idToken: idToken),
      );
    }
    await user.verifyBeforeUpdateEmail(newEmail.trim());
  }

  Future<void> unlinkProvider(String providerId) async {
    final user = currentUser;
    if (user == null) throw Exception('Not signed in.');
    final remaining =
        user.providerData.where((p) => p.providerId != providerId).length;
    if (remaining == 0) {
      throw Exception(
        "Add another sign-in method first — you can't remove your only one.",
      );
    }
    await user.unlink(providerId);
  }

  Future<fb.User?> signInWithEmail(
    String emailOrUsername,
    String password,
  ) async {
    final identifier = emailOrUsername.trim();
    final email =
        identifier.contains('@')
            ? identifier
            : await _resolveUsername(identifier);
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      debugPrint(
        '[Auth] Signed in: ${cred.user?.email} '
        '(verified: ${cred.user?.emailVerified})',
      );
      return cred.user;
    } on fb.FirebaseAuthException catch (e) {
      debugPrint('[Auth] sign-in failed: ${e.code}: ${e.message}');
      if (const {
        'invalid-credential',
        'invalid-login-credentials',
        'wrong-password',
        'user-not-found',
      }.contains(e.code)) {
        throw Exception(await _explainBadLogin(identifier, email));
      }
      rethrow;
    }
  }

  Future<String> _explainBadLogin(String identifier, String email) async {
    if (!identifier.contains('@')) return 'Incorrect password.';
    try {
      final res = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/users/resolve-username/email-exists/'
          '${Uri.encodeComponent(email.trim())}',
        ),
      );
      if (res.statusCode == 200) {
        final exists = (jsonDecode(res.body) as Map)['exists'] == true;
        return exists
            ? 'Incorrect password. Try again or tap "Forgot password?".'
            : 'Incorrect email — no account uses that address.';
      }
    } catch (_) {}
    return 'Incorrect email or password.';
  }

  Future<String> _resolveUsername(String username) async {
    final res = await http.get(
      Uri.parse('${AppConfig.baseUrl}/users/resolve-username/$username'),
    );
    if (res.statusCode != 200) {
      throw Exception('Incorrect username — no account uses that name.');
    }
    final email = (jsonDecode(res.body) as Map)['email'] as String?;
    if (email == null || email.isEmpty) {
      throw Exception('Incorrect username — no account uses that name.');
    }
    return email;
  }

  Future<fb.User?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    if (cred.user != null) {
      await cred.user!.updateDisplayName(name.trim());
    }
    await _savePhone(phone);
    await sendVerificationEmail();
    return cred.user;
  }

  Future<void> deleteAccount() async {
    final response = await http.delete(
      Uri.parse('${AppConfig.baseUrl}/users/me'),
    );
    if (response.statusCode != 200) {
      throw Exception('Could not delete account: ${response.body}');
    }
    await signOut();
  }

  Future<void> _savePhone(String phone) async {
    if (phone.isEmpty) return;
    try {
      await http.post(
        Uri.parse('${AppConfig.baseUrl}/users/phone'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone}),
      );
    } catch (e) {
      debugPrint('[Auth] Could not save phone number: $e');
    }
  }

  Future<String?> currentUsername() async {
    if (!AppConfig.firebaseReady) return null;
    final result = await _auth.currentUser?.getIdTokenResult(true);
    return result?.claims?['username'] as String?;
  }

  Future<void> changeUsername(String username) async {
    final trimmed = username.trim();
    if (trimmed.isEmpty) throw Exception("Username can't be empty.");
    final res = await http.post(
      Uri.parse('${AppConfig.baseUrl}/users/username'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': trimmed}),
    );
    if (res.statusCode != 200) {
      String? detail;
      try {
        detail = (jsonDecode(res.body) as Map)['detail'] as String?;
      } catch (_) {}
      throw Exception(detail ?? 'Could not change username.');
    }
  }

  bool get isEmailVerified =>
      AppConfig.firebaseReady && (_auth.currentUser?.emailVerified ?? false);

  Future<void> sendVerificationEmail() async {
    if (!AppConfig.firebaseReady) return;
    final user = _auth.currentUser;
    if (user == null) return;
    try {
      await user.sendEmailVerification();
      debugPrint('[Auth] Verification email sent');
    } catch (e) {
      debugPrint('[Auth] Could not send verification email: $e');
    }
  }

  Future<fb.User?> signInWithGoogle() async {
    if (AppConfig.googleWebClientId.isEmpty) {
      throw Exception(
        'Google Sign-In is not configured yet.\n'
        'Set googleWebClientId in lib/config.dart from Firebase console → '
        'Authentication → Sign-in method → Google → Web client ID.',
      );
    }
    await _ensureGoogleInitialized();
    final GoogleSignInAccount googleUser;
    try {
      googleUser = await GoogleSignIn.instance.authenticate();
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    }

    final idToken = googleUser.authentication.idToken;
    if (idToken == null) {
      throw Exception(
        'Could not get a Google ID token. Check that the Web client ID in '
        'lib/config.dart matches the one in the Firebase console.',
      );
    }
    final credential = fb.GoogleAuthProvider.credential(idToken: idToken);
    return (await _auth.signInWithCredential(credential)).user;
  }

  Future<void> signOut() async {
    if (!AppConfig.firebaseReady) return;
    try {
      if (_googleInitialized) {
        await GoogleSignIn.instance.signOut();
      }
    } catch (_) {}
    await _auth.signOut();
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }
}
