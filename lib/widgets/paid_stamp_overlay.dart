import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/l10n.dart';

const _inkRed = Color(0xFFA3372F);

class PaidStampOverlay extends StatefulWidget {
  final Widget child;
  final bool play;

  const PaidStampOverlay({super.key, required this.child, required this.play});

  @override
  State<PaidStampOverlay> createState() => _PaidStampOverlayState();
}

class _PaidStampOverlayState extends State<PaidStampOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _rotation;
  late final Animation<double> _opacityIn;
  bool _showing = false;
  bool _fadingOut = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 2.6,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 55,
      ),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 0.97), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.97, end: 1.0), weight: 25),
    ]).animate(_controller);
    _rotation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: -0.52,
          end: -0.10,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 55,
      ),
      TweenSequenceItem(tween: Tween(begin: -0.10, end: -0.19), weight: 20),
      TweenSequenceItem(tween: Tween(begin: -0.19, end: -0.16), weight: 25),
    ]).animate(_controller);
    _opacityIn = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3),
    );
    if (widget.play) _fire();
  }

  @override
  void didUpdateWidget(covariant PaidStampOverlay old) {
    super.didUpdateWidget(old);
    if (widget.play && !old.play) _fire();
  }

  Future<void> _fire() async {
    setState(() {
      _showing = true;
      _fadingOut = false;
    });
    HapticFeedback.heavyImpact();
    _playThud();
    await _controller.forward(from: 0);
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() => _fadingOut = true);
    await Future.delayed(const Duration(milliseconds: 380));
    if (!mounted) return;
    setState(() => _showing = false);
  }

  Future<void> _playThud() async {
    final player = AudioPlayer();
    try {
      await player.play(AssetSource('sounds/stamp_thud.wav'));
      await player.onPlayerComplete.first;
    } catch (_) {
    } finally {
      await player.dispose();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.child,
        if (_showing)
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: _fadingOut ? 0 : 1,
                duration: const Duration(milliseconds: 380),
                curve: Curves.easeIn,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder:
                        (context, child) => Opacity(
                          opacity: _opacityIn.value,
                          child: Transform.rotate(
                            angle: _rotation.value,
                            child: Transform.scale(
                              scale: _scale.value,
                              child: child,
                            ),
                          ),
                        ),
                    child: const _StampGraphic(),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _StampGraphic extends StatelessWidget {
  const _StampGraphic();

  String get _dateLabel {
    final now = DateTime.now();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(now.day)}·${two(now.month)}·${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: _inkRed, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: _inkRed.withValues(alpha: 0.75), width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.cdBillPaid,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                letterSpacing: 5,
                color: _inkRed,
                height: 1,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              _dateLabel,
              style: const TextStyle(
                fontSize: 10.5,
                letterSpacing: 2,
                color: _inkRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
