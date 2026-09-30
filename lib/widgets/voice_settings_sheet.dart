import 'package:flutter/material.dart';

import '../ask_voice.dart';
import '../l10n/l10n.dart';

Future<void> showVoiceSettingsSheet(BuildContext context, AskVoice voice) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _VoiceSettings(voice: voice),
  );
}

class _VoiceSettings extends StatefulWidget {
  final AskVoice voice;
  const _VoiceSettings({required this.voice});

  @override
  State<_VoiceSettings> createState() => _VoiceSettingsState();
}

class _VoiceSettingsState extends State<_VoiceSettings> {
  AskVoice get v => widget.voice;

  Future<void> _pick(Future<void> Function() change) async {
    await change();
    if (mounted) setState(() {});
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(top: 18, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
    ),
  );

  Widget _chip(
    BuildContext context,
    String label,
    bool selected,
    VoidCallback onTap, {
    IconData? icon,
  }) {
    final scheme = Theme.of(context).colorScheme;
    final onSelected =
        ThemeData.estimateBrightnessForColor(scheme.primary) == Brightness.dark
            ? Colors.white
            : const Color(0xFF1B1512);
    final color = selected ? onSelected : scheme.onSurface;
    return ChoiceChip(
      avatar: icon == null ? null : Icon(icon, size: 16, color: color),
      label: Text(label, style: TextStyle(color: color)),
      selected: selected,
      showCheckmark: false,
      onSelected: (_) => onTap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final paceLabels = {
      'slower': t.askPaceSlower,
      'normal': t.askPaceNormal,
      'faster': t.askPaceFaster,
    };
    final toneLabels = {
      'calm': t.askToneCalm,
      'warm': t.askToneWarm,
      'cheerful': t.askToneCheerful,
    };
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.record_voice_over_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                t.askVoice,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final name in AskVoice.femaleVoices)
                _chip(
                  context,
                  name,
                  v.voice == name,
                  () => _pick(() => v.setVoice(name)),
                  icon: Icons.female,
                ),
              for (final name in AskVoice.maleVoices)
                _chip(
                  context,
                  name,
                  v.voice == name,
                  () => _pick(() => v.setVoice(name)),
                  icon: Icons.male,
                ),
            ],
          ),
          _label(t.askPace),
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              showSelectedIcon: false,
              segments: [
                for (final p in AskVoice.paces)
                  ButtonSegment(
                    value: p,
                    label: Text(
                      paceLabels[p]!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
              ],
              selected: {v.pace},
              onSelectionChanged: (s) => _pick(() => v.setPace(s.first)),
            ),
          ),
          _label(t.askTone),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tone in AskVoice.tones)
                _chip(
                  context,
                  toneLabels[tone]!,
                  v.tone == tone,
                  () => _pick(() => v.setTone(tone)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
