import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart' as http;
import 'config.dart';

class AskVoice {
  final FlutterTts _tts = FlutterTts();
  AudioPlayer? _player;
  String? _readyFor;

  static const femaleVoices = ['Leda', 'Aoede', 'Zephyr', 'Sulafat', 'Despina'];
  static const maleVoices = ['Puck', 'Charon', 'Fenrir', 'Orus'];
  static const voices = [...femaleVoices, ...maleVoices];

  static const paces = ['slower', 'normal', 'faster'];
  static const tones = ['calm', 'warm', 'cheerful'];

  static const _voiceKey = 'ask_voice';
  static const _paceKey = 'ask_voice_pace';
  static const _toneKey = 'ask_voice_tone';

  String voice = voices.first;
  String pace = 'normal';
  String tone = 'warm';

  String get settingsKey => '$voice|$pace|$tone';

  final ValueNotifier<bool> usingPhoneVoice = ValueNotifier(false);

  Future<void> loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final v = prefs.getString(_voiceKey);
      final p = prefs.getString(_paceKey);
      final t = prefs.getString(_toneKey);
      if (v != null && voices.contains(v)) voice = v;
      if (p != null && paces.contains(p)) pace = p;
      if (t != null && tones.contains(t)) tone = t;
    } catch (_) {}
  }

  Future<void> _save(String key, String value) async {
    try {
      await (await SharedPreferences.getInstance()).setString(key, value);
    } catch (_) {}
  }

  Future<void> setVoice(String name) async {
    if (!voices.contains(name)) return;
    voice = name;
    await _save(_voiceKey, name);
  }

  Future<void> setPace(String value) async {
    if (!paces.contains(value)) return;
    pace = value;
    await _save(_paceKey, value);
  }

  Future<void> setTone(String value) async {
    if (!tones.contains(value)) return;
    tone = value;
    await _save(_toneKey, value);
  }

  double get _phoneRate => switch (pace) {
    'slower' => 0.36,
    'faster' => 0.56,
    _ => 0.46,
  };

  int _generation = 0;

  static int _score(Map<dynamic, dynamic> v) {
    final name = '${v['name']}'.toLowerCase();
    var s = 0;
    if (name.contains('neural') || name.contains('wavenet')) s += 4;
    if (name.contains('network')) s += 3;
    if (name.contains('enhanced') || name.contains('premium')) s += 2;
    if (name.contains('embedded') || name.contains('compact')) s -= 2;
    return s;
  }

  Future<void> _prepare(String languageCode) async {
    if (_readyFor == languageCode) return;
    try {
      final voices = await _tts.getVoices as List<dynamic>? ?? const [];
      final mine =
          voices
              .whereType<Map>()
              .where(
                (v) => '${v['locale']}'.toLowerCase().startsWith(
                  languageCode.toLowerCase(),
                ),
              )
              .toList()
            ..sort((a, b) => _score(b).compareTo(_score(a)));
      if (mine.isNotEmpty) {
        final best = mine.first;
        await _tts.setVoice({
          'name': '${best['name']}',
          'locale': '${best['locale']}',
        });
      } else {
        await _tts.setLanguage(languageCode);
      }
    } catch (_) {}
    await _tts.setPitch(1.0);
    await _tts.setVolume(1.0);
    _readyFor = languageCode;
  }

  static String forSpeech(String text) {
    return text
        .replaceAllMapped(
          RegExp(r'\bRs\.?\s*([\d,]+(?:\.\d+)?)', caseSensitive: false),
          (m) => '${m[1]} rupees',
        )
        .replaceAll(RegExp(r'[*_`#]+'), '')
        .replaceAll(RegExp(r'^\s*[-•]\s*', multiLine: true), '')
        .replaceAll(RegExp(r'\s*\n+\s*'), '. ')
        .replaceAll(RegExp(r'\.\s*\.'), '.')
        .trim();
  }

  Future<Uint8List?> _fetchServerVoice(String text) async {
    try {
      final response = await http
          .post(
            Uri.parse('${AppConfig.baseUrl}/reports/speak'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'text': text,
              'voice': voice,
              'pace': pace,
              'tone': tone,
            }),
          )
          .timeout(const Duration(seconds: 25));
      if (response.statusCode == 200 && response.bodyBytes.isNotEmpty) {
        return response.bodyBytes;
      }
    } catch (_) {}
    return null;
  }

  static List<String> splitFirstSentence(String text) {
    final m = RegExp(r'[.!?।۔]\s+').firstMatch(text);
    if (m == null || m.start < 15) return [text];
    final rest = text.substring(m.end).trim();
    if (rest.isEmpty) return [text];
    return [text.substring(0, m.start + 1), rest];
  }

  Future<void> speak(String text, String languageCode) async {
    await stop();
    usingPhoneVoice.value = false;
    final generation = _generation;
    final parts = splitFirstSentence(text);
    final first = _fetchServerVoice(parts[0]);
    final rest = parts.length > 1 ? _fetchServerVoice(parts[1]) : null;
    final wav = await first;
    if (generation != _generation) return;
    if (wav == null) {
      await _speakWithPhone(text, languageCode);
      return;
    }
    final player = _player ??= AudioPlayer();
    await player.play(BytesSource(wav));
    if (rest == null) return;
    try {
      await player.onPlayerComplete.first;
    } catch (_) {
      return;
    }
    if (generation != _generation) return;
    final more = await rest;
    if (generation != _generation) return;
    if (more != null) {
      await player.play(BytesSource(more));
    } else {
      await _speakWithPhone(parts[1], languageCode);
    }
  }

  Future<void> _speakWithPhone(String text, String languageCode) async {
    usingPhoneVoice.value = true;
    await _prepare(languageCode);
    await _tts.setSpeechRate(_phoneRate);
    await _tts.speak(forSpeech(text));
  }

  Future<void> stop() async {
    _generation++;
    await _player?.stop();
    await _tts.stop();
  }

  Future<void> dispose() async {
    usingPhoneVoice.dispose();
    await _player?.dispose();
  }
}
