import 'dart:async';

import 'package:bookkeeper_app/api.dart' as api;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  test('identical in-flight GETs share one request; a write breaks the share',
      () async {
    var getCalls = 0;
    var gate = Completer<void>();
    final url = Uri.parse('http://test.invalid/items');

    await http.runWithClient(() async {
      final a = api.get(url);
      final b = api.get(url);
      await Future<void>.delayed(Duration.zero);
      gate.complete();
      await Future.wait([a, b]);
      expect(getCalls, 1);

      gate = Completer<void>();
      final c = api.get(url);
      await Future<void>.delayed(Duration.zero);
      await api.post(Uri.parse('http://test.invalid/write'));
      final d = api.get(url);
      await Future<void>.delayed(Duration.zero);
      gate.complete();
      await Future.wait([c, d]);
      expect(getCalls, 3);
    }, () => MockClient((req) async {
      if (req.method == 'GET') {
        getCalls++;
        await gate.future;
      }
      return http.Response('ok', 200);
    }));
  });
}
