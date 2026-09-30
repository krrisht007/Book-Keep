import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart' as http;
import 'app_state.dart' show localeLabel, localeNotifier;
import 'config.dart';

/// Item, customer, supplier and category names in the selected language.
///
/// The names are what the shop typed, so the server asks Gemini for a rendering
/// once per language and saves it (POST /translate). This keeps the answers on
/// the phone too, so the screens show them straight away and offline. Only what
/// is *shown* changes: edit forms, search keys and what is sent to the server
/// keep using the name as typed.
class NameTranslator extends ChangeNotifier {
  NameTranslator._();
  static final instance = NameTranslator._();

  static const _batch = 100;

  final Map<String, Map<String, String>> _cache = {};
  final Set<String> _loading = {};
  final Set<String> _asked = {};
  final Map<String, ({String lang, String kind, String text})> _queue = {};
  Timer? _timer;

  static String get lang =>
      localeNotifier.value?.languageCode ??
      WidgetsBinding.instance.platformDispatcher.locale.languageCode;

  /// The name to show for [text]; the name as typed until its rendering is known.
  String show(String kind, String? text) {
    final t = text ?? '';
    final code = lang;
    if (t.isEmpty || code == 'en' || !localeLabel.containsKey(code)) return t;
    final map = _cache[code];
    if (map == null) {
      _load(code);
      return t;
    }
    final key = '$kind|$t';
    final hit = map[key];
    if (hit != null) return hit;
    if (_asked.add('$code|$key')) {
      _queue['$code|$key'] = (lang: code, kind: kind, text: t);
      _timer ??= Timer(const Duration(milliseconds: 250), _flush);
    }
    return t;
  }

  /// Remembers a rendering the shop just set, so screens show it straight away.
  Future<void> setLocal(String kind, String text, String? translated) async {
    final code = lang;
    final map = _cache.putIfAbsent(code, () => {});
    if (translated == null || translated.isEmpty) {
      map.remove('$kind|$text');
      _asked.remove('$code|$kind|$text');
    } else {
      map['$kind|$text'] = translated;
    }
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('names2_$code', jsonEncode(map));
    } catch (_) {}
  }

  Future<void> _load(String code) async {
    if (!_loading.add(code)) return;
    final map = <String, String>{};
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString('names2_$code');
      if (raw != null) {
        // An entry equal to the typed name is a fallback from a failed run (or a
        // name that needs no change): ask the server again, it answers from its
        // own saved table when it already has the rendering.
        (jsonDecode(raw) as Map<String, dynamic>).forEach((k, v) {
          if ('$v' != k.substring(k.indexOf('|') + 1)) map[k] = '$v';
        });
      }
    } catch (_) {}
    _cache[code] = map;
    _loading.remove(code);
    notifyListeners();
  }

  Future<void> _flush() async {
    _timer = null;
    final jobs = _queue.values.toList();
    _queue.clear();
    final byLang = <String, List<({String lang, String kind, String text})>>{};
    for (final j in jobs) {
      byLang.putIfAbsent(j.lang, () => []).add(j);
    }
    for (final entry in byLang.entries) {
      for (var i = 0; i < entry.value.length; i += _batch) {
        final chunk = entry.value.skip(i).take(_batch).toList();
        final keys = {for (final j in chunk) '${j.lang}|${j.kind}|${j.text}'};
        try {
          final response = await http.post(
            Uri.parse('${AppConfig.baseUrl}/translate'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'language': entry.key,
              'items': [
                for (final j in chunk) {'kind': j.kind, 'text': j.text},
              ],
            }),
          );
          if (response.statusCode != 200) {
            _retryLater(keys);
            continue;
          }
          final map = _cache.putIfAbsent(entry.key, () => {});
          for (final t in (jsonDecode(response.body)['translations'] as List)) {
            map['${t['kind']}|${t['text']}'] = '${t['translated']}';
            keys.remove('${entry.key}|${t['kind']}|${t['text']}');
          }
          _retryLater(keys);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('names2_${entry.key}', jsonEncode(map));
          notifyListeners();
        } catch (_) {
          _retryLater(keys);
        }
      }
    }
  }

  /// Names the server could not render yet (Gemini busy or out of quota) are
  /// asked for again after a pause, never saved as if they were final.
  void _retryLater(Set<String> keys) {
    if (keys.isEmpty) return;
    Timer(const Duration(minutes: 2), () {
      _asked.removeAll(keys);
      notifyListeners();
    });
  }
}

/// Rebuilds the widgets that show a translated name once its rendering arrives.
class NameScope extends InheritedNotifier<NameTranslator> {
  const NameScope({
    super.key,
    required NameTranslator super.notifier,
    required super.child,
  });
}

extension NameContext on BuildContext {
  String _name(String kind, Object? text) {
    dependOnInheritedWidgetOfExactType<NameScope>();
    return NameTranslator.instance.show(kind, text == null ? null : '$text');
  }

  String itemName(Object? text) => _name('item', text);
  String partyName(Object? text) => _name('party', text);
  String categoryName(Object? text) => _name('category', text);
  String shopText(Object? text) => _name('shop', text);
  String addressText(Object? text) => _name('address', text);
}
