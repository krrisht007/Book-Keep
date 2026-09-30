import 'dart:math' as math;

import 'package:flutter/material.dart';

enum OrbStyle { working, searching, solving, listening, weaving, breathing }

final _random = math.Random();

OrbStyle randomOrbStyle() =>
    OrbStyle.values[_random.nextInt(OrbStyle.values.length)];

class _StyleConfig {
  const _StyleConfig({
    required this.pointCount,
    required this.jitter,
    required this.speed,
    required this.dotScale,
  });

  final int pointCount;
  final double jitter;
  final double speed;
  final double dotScale;
}

const Map<OrbStyle, _StyleConfig> _styleConfigs = {
  OrbStyle.listening: _StyleConfig(
    pointCount: 6,
    jitter: 0.02,
    speed: 0.45,
    dotScale: 0.30,
  ),
  OrbStyle.working: _StyleConfig(
    pointCount: 14,
    jitter: 0.45,
    speed: 1.0,
    dotScale: 0.19,
  ),
  OrbStyle.breathing: _StyleConfig(
    pointCount: 18,
    jitter: 0.55,
    speed: 0.22,
    dotScale: 0.21,
  ),
  OrbStyle.searching: _StyleConfig(
    pointCount: 32,
    jitter: 0.08,
    speed: 1.7,
    dotScale: 0.11,
  ),
  OrbStyle.solving: _StyleConfig(
    pointCount: 48,
    jitter: 0.20,
    speed: 0.7,
    dotScale: 0.085,
  ),
  OrbStyle.weaving: _StyleConfig(
    pointCount: 72,
    jitter: 0.02,
    speed: 1.3,
    dotScale: 0.055,
  ),
};

class ThinkingOrb extends StatefulWidget {
  const ThinkingOrb({
    super.key,
    this.size = 20,
    this.color = Colors.white,
    this.style = OrbStyle.working,
  });

  final double size;
  final Color color;
  final OrbStyle style;

  @override
  State<ThinkingOrb> createState() => _ThinkingOrbState();
}

class _ThinkingOrbState extends State<ThinkingOrb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _OrbPainter(
              t: _controller.value * 2 * math.pi,
              color: widget.color,
              style: widget.style,
            ),
          );
        },
      ),
    );
  }
}

class _SpherePoint {
  const _SpherePoint(this.x, this.y, this.z);
  final double x, y, z;
}

final Map<OrbStyle, List<_SpherePoint>> _spherePointsByStyle = {
  for (final style in OrbStyle.values)
    style: _makeSphere(
      _styleConfigs[style]!.pointCount,
      jitter: _styleConfigs[style]!.jitter,
    ),
};

List<_SpherePoint> _makeSphere(int n, {required double jitter}) {
  final points = <_SpherePoint>[];
  final rand = math.Random(7);
  final golden = math.pi * (3 - math.sqrt(5));
  for (var i = 0; i < n; i++) {
    final y = 1 - (i / (n - 1)) * 2;
    final r = math.sqrt(1 - y * y);
    final theta = golden * i;
    var x = math.cos(theta) * r;
    var z = math.sin(theta) * r;
    x += (rand.nextDouble() - 0.5) * jitter;
    z += (rand.nextDouble() - 0.5) * jitter;
    points.add(_SpherePoint(x, y, z));
  }
  return points;
}

class _OrbPainter extends CustomPainter {
  _OrbPainter({required this.t, required this.color, required this.style});

  final double t;
  final Color color;
  final OrbStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final cfg = _styleConfigs[style]!;
    final points = _spherePointsByStyle[style]!;
    final cx = size.width / 2;
    final cy = size.height / 2;
    final radius = size.shortestSide * 0.42;

    final ay = t * cfg.speed;
    final ax = t * cfg.speed * 0.7;
    final cosY = math.cos(ay), sinY = math.sin(ay);
    final cosX = math.cos(ax), sinX = math.sin(ax);

    final projected =
        points.map((p) {
            final x = p.x * cosY - p.z * sinY;
            var z = p.x * sinY + p.z * cosY;
            final y = p.y * cosX - z * sinX;
            z = p.y * sinX + z * cosX;
            return _SpherePoint(x, y, z);
          }).toList()
          ..sort((a, b) => a.z.compareTo(b.z));

    final paint = Paint()..style = PaintingStyle.fill;
    for (final p in projected) {
      final depth = (p.z + 1) / 2;
      final dotRadius = radius * cfg.dotScale * (0.55 + depth * 0.8);
      paint.color = color.withValues(alpha: 0.25 + depth * 0.75);
      canvas.drawCircle(
        Offset(cx + p.x * radius, cy + p.y * radius),
        dotRadius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _OrbPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.style != style;
}
