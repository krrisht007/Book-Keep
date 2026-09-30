library;

import 'dart:convert' show Encoding;

import 'package:http/http.dart' as http;

import 'auth/auth_service.dart';

export 'package:http/http.dart' hide get, post, put, patch, delete;

/// Every wrapped call below is bounded by this — without it, a request to a
/// server that accepts the connection but never responds (a common flaky-
/// mobile-network failure mode, distinct from a connection being flat-out
/// refused) hangs forever: no exception ever fires, so every screen's own
/// "could not connect" / offline-queue fallback never triggers and a saving
/// spinner just spins indefinitely. A [TimeoutException] is caught by those
/// same existing `catch (e)` blocks exactly like any other network failure.
const _requestTimeout = Duration(seconds: 20);

const uploadTimeout = Duration(seconds: 60);

Future<Map<String, String>> authHeaders({
  Map<String, String>? extra,
  bool forceRefresh = false,
}) async {
  final token = await AuthService.instance.getIdToken(
    forceRefresh: forceRefresh,
  );
  return {...?extra, if (token != null) 'Authorization': 'Bearer $token'};
}

final http.Client _client = http.Client();

final Map<String, Future<http.Response>> _inflight = {};

Future<http.Response> get(
  Uri url, {
  Map<String, String>? headers,
  Duration timeout = _requestTimeout,
  bool forceRefresh = false,
}) {
  if (headers != null || forceRefresh) {
    return _get(url, headers, timeout, forceRefresh);
  }
  final key = url.toString();
  final pending = _inflight[key];
  if (pending != null) return pending.timeout(timeout);
  final request = _get(url, null, timeout, false);
  _inflight[key] = request;
  return request.whenComplete(() {
    if (identical(_inflight[key], request)) _inflight.remove(key);
  });
}

Future<http.Response> _get(
  Uri url,
  Map<String, String>? headers,
  Duration timeout,
  bool forceRefresh,
) async {
  final h = await authHeaders(extra: headers, forceRefresh: forceRefresh);
  try {
    return await _client.get(url, headers: h).timeout(timeout);
  } on http.ClientException {
    return _client.get(url, headers: h).timeout(timeout);
  }
}

Future<Map<String, String>> _writeHeaders(Map<String, String>? extra) {
  _inflight.clear();
  return authHeaders(extra: extra);
}

Future<http.Response> post(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async => _client
    .post(
      url,
      headers: await _writeHeaders(headers),
      body: body,
      encoding: encoding,
    )
    .timeout(_requestTimeout);

Future<http.Response> put(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async => _client
    .put(
      url,
      headers: await _writeHeaders(headers),
      body: body,
      encoding: encoding,
    )
    .timeout(_requestTimeout);

Future<http.Response> patch(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async => _client
    .patch(
      url,
      headers: await _writeHeaders(headers),
      body: body,
      encoding: encoding,
    )
    .timeout(_requestTimeout);

Future<http.Response> delete(
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async => _client
    .delete(
      url,
      headers: await _writeHeaders(headers),
      body: body,
      encoding: encoding,
    )
    .timeout(_requestTimeout);
