import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'api.dart' as http;

import 'app_state.dart';
import 'config.dart';
import 'main.dart' show navigatorKey;

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FirebaseMessaging? _messaging =
      AppConfig.firebaseReady ? FirebaseMessaging.instance : null;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  String? lastError;

  Future<void> init() async {
    if (!AppConfig.firebaseReady) {
      lastError =
          'Push disabled: google-services.json missing from android/app/';
      debugPrint('[FCM] init skipped — $lastError');
      return;
    }

    final settings = await _messaging!.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    debugPrint('[FCM] Permission: ${settings.authorizationStatus}');

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );
    const initSettings = InitializationSettings(android: androidSettings);
    await _localNotifications.initialize(initSettings);

    const androidChannel = AndroidNotificationChannel(
      'payment_reminders',
      'Payment Reminders',
      description: 'Notifications for overdue customer payments',
      importance: Importance.high,
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidChannel);

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(_onNotificationTap);

    await _registerToken();
  }

  Future<void> _registerToken() async {
    try {
      final token = await _messaging!.getToken();
      if (token != null) {
        await _sendTokenToBackend(token);
      }

      _messaging.onTokenRefresh.listen(_sendTokenToBackend);
    } catch (e) {
      lastError = e.toString();
      debugPrint('[FCM] Token registration failed: $e');
    }
  }

  Future<void> _sendTokenToBackend(String token) async {
    try {
      final deviceName = await _deviceName();
      await http.post(
        Uri.parse('${AppConfig.baseUrl}/notifications/token'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': token, 'device_name': deviceName}),
      );
      debugPrint('[FCM] Token registered with backend');
    } catch (e) {
      lastError = e.toString();
      debugPrint('[FCM] Failed to send token to backend: $e');
    }
  }

  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('[FCM] Foreground message: ${message.messageId}');
    final notification = message.notification;
    if (notification == null) return;

    _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'payment_reminders',
          'Payment Reminders',
          channelDescription: 'Notifications for overdue customer payments',
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/launcher_icon',
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  static const _tabForType = {
    'low_stock': 2,
    'overdue_reminder': 0,
    'daily_summary': 4,
  };

  void _onNotificationTap(RemoteMessage message) {
    debugPrint('[FCM] Notification tap: ${message.data}');
    final tab = _tabForType[message.data['type'] as String?];
    if (tab == null) return;
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
    requestedTabNotifier.value = tab;
  }

  Future<String> _deviceName() async {
    if (Platform.isAndroid) {
      return 'Android Device';
    }
    return Platform.operatingSystem;
  }
}
