import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as raw;
import 'package:path_provider/path_provider.dart';

import 'api.dart' as http;
import 'config.dart';
import 'save_to_downloads.dart';

const _channel = MethodChannel('bookkeeper/save');

Future<({int code, String url})?> _newerBuild() async {
  final current = await _channel.invokeMethod<int>('versionCode') ?? 0;
  final response = await http.get(Uri.parse('${AppConfig.baseUrl}/app/latest'));
  if (response.statusCode != 200) return null;
  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final code = data['version_code'] as int;
  final url = data['url'] as String?;
  return url != null && code > current ? (code: code, url: url) : null;
}

Future<File> _download(String url, ValueNotifier<double?> progress) async {
  final dir = Directory('${(await getTemporaryDirectory()).path}/apk');
  await dir.create(recursive: true);
  for (final old in dir.listSync()) {
    old.deleteSync();
  }
  final file = File('${dir.path}/update.apk');
  final client = raw.Client();
  try {
    final response = await client
        .send(raw.Request('GET', Uri.parse(url)))
        .timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      throw HttpException('Download failed (${response.statusCode})');
    }
    final total = response.contentLength ?? 0;
    var received = 0;
    final sink = file.openWrite();
    await for (final chunk in response.stream) {
      sink.add(chunk);
      received += chunk.length;
      if (total > 0) progress.value = received / total;
    }
    await sink.close();
  } finally {
    client.close();
  }
  return file;
}

Future<void> checkForUpdate(BuildContext context, {bool manual = false}) async {
  if (kIsWeb || !Platform.isAndroid || (kDebugMode && !manual)) return;
  final messenger = ScaffoldMessenger.of(context);
  final t = context.t;
  void say(String text) =>
      messenger.showSnackBar(SnackBar(content: Text(text)));
  if (manual) {
    messenger.showSnackBar(
      SnackBar(content: Text(t.auChecking), duration: Duration(seconds: 30)),
    );
  }
  try {
    final update = await _newerBuild();
    messenger.hideCurrentSnackBar();
    if (!context.mounted) return;
    if (update == null) {
      if (manual) say(t.auLatest);
      return;
    }
    final go = await showDialog<String>(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text(ctx.t.auAvailable),
            content: Text(ctx.t.auNewer(update.code)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(ctx.t.auLater),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, 'save'),
                child: Text(ctx.t.bkSaveToDownloads),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, 'install'),
                child: Text(ctx.t.auUpdate),
              ),
            ],
          ),
    );
    if (go == null || !context.mounted) return;

    final progress = ValueNotifier<double?>(null);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder:
          (ctx) => AlertDialog(
            title: Text(ctx.t.auDownloading),
            content: ValueListenableBuilder<double?>(
              valueListenable: progress,
              builder: (_, value, __) => LinearProgressIndicator(value: value),
            ),
          ),
    );
    final File file;
    try {
      file = await _download(update.url, progress);
    } finally {
      if (context.mounted) Navigator.of(context, rootNavigator: true).pop();
    }
    if (go == 'save') {
      final name = 'Book-Keep-build-${update.code}.apk';
      await saveToDownloads(filename: name, bytes: await file.readAsBytes());
      say(t.auSaved(name));
      return;
    }
    final started = await _channel.invokeMethod<String>('installApk', {
      'path': file.path,
    });
    if (started == 'needs_permission') {
      say(t.auAllowInstall);
    }
  } catch (_) {
    messenger.hideCurrentSnackBar();
    if (manual) say(t.auFailed);
  }
}
