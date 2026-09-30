import 'package:flutter/services.dart';

Future<void> saveToDownloads({
  required String filename,
  required Uint8List bytes,
}) {
  const channel = MethodChannel('bookkeeper/save');
  return channel.invokeMethod('saveToDownloads', {
    'filename': filename,
    'bytes': bytes,
  });
}
