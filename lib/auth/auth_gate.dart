import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_lock_service.dart';
import '../config.dart';
import '../lock_screen.dart';
import '../main_nav_screen.dart';
import 'login_screen.dart';
import 'auth_service.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> with WidgetsBindingObserver {
  bool _checkedKeepSignedIn = false;

  bool _wasSignedIn = false;

  bool _locked = true;
  bool _checkedLock = false;

  static const _minSplashDuration = Duration(milliseconds: 2200);
  bool _minSplashElapsed = false;

  static const _inactivityTimeout = Duration(hours: 24);
  static const _lastActiveKey = 'lastActiveEpochMs';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _enforceKeepSignedIn();
    _checkLockOnOpen();
    Future.delayed(_minSplashDuration, () {
      if (mounted) setState(() => _minSplashElapsed = true);
    });
  }

  Future<void> _checkLockOnOpen() async {
    final enabled = await AppLockService.instance.isEnabled;
    if (mounted) {
      setState(() {
        _locked = enabled;
        _checkedLock = true;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _touchLastActive();
      AppLockService.instance.isEnabled.then((enabled) {
        if (enabled && mounted) setState(() => _locked = true);
      });
    } else if (state == AppLifecycleState.resumed) {
      _enforceInactivityTimeout();
    }
  }

  Future<void> _touchLastActive() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastActiveKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _enforceInactivityTimeout() async {
    if (!AppConfig.firebaseReady) return;
    final prefs = await SharedPreferences.getInstance();
    final lastActiveMs = prefs.getInt(_lastActiveKey);
    if (lastActiveMs != null) {
      final elapsed = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(lastActiveMs),
      );
      if (elapsed > _inactivityTimeout &&
          fb.FirebaseAuth.instance.currentUser != null) {
        await AuthService.instance.signOut();
      }
    }
    await _touchLastActive();
  }

  Future<void> _enforceKeepSignedIn() async {
    if (!AppConfig.firebaseReady) return;
    final prefs = await SharedPreferences.getInstance();
    final keep = prefs.getBool('keepSignedIn') ?? true;
    if (!keep && fb.FirebaseAuth.instance.currentUser != null) {
      await AuthService.instance.signOut();
    }
    await _enforceInactivityTimeout();
    if (mounted) setState(() => _checkedKeepSignedIn = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!AppConfig.firebaseReady) return const MainNavScreen();

    return StreamBuilder<fb.User?>(
      stream: fb.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        final stillRestoring =
            !_checkedKeepSignedIn ||
            !_checkedLock ||
            !_minSplashElapsed ||
            snap.connectionState == ConnectionState.waiting;
        if (stillRestoring) return const _BootSplash();
        if (snap.hasData) {
          _wasSignedIn = true;
        } else {
          if (_wasSignedIn) {
            _wasSignedIn = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
            });
          }
          return const LoginScreen();
        }
        if (_locked) {
          return LockScreen(onUnlocked: () => setState(() => _locked = false));
        }
        return const MainNavScreen();
      },
    );
  }
}

const _gold = Color(0xFFE8B84B);
const _funkyPink = Color(0xFFFF6FA8);
const _funkyCyan = Color(0xFF4DD8E8);

class _BootSplash extends StatefulWidget {
  const _BootSplash();

  @override
  State<_BootSplash> createState() => _BootSplashState();
}

class _BootSplashState extends State<_BootSplash>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2100),
  )..forward();
  static const _letters = ['B', 'o', 'o', 'k', '-', 'k', 'e', 'e', 'p'];

  late final AnimationController _bgController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    _bgController.dispose();
    super.dispose();
  }

  Widget _letter(int i, Color primary, Color secondary) {
    final start = 0.16 + i * 0.026;
    final end = (start + 0.30).clamp(0.0, 1.0);
    final raw = ((_controller.value - start) / (end - start)).clamp(0.0, 1.0);
    final pop = Curves.elasticOut.transform(raw);
    final opacity = raw <= 0 ? 0.0 : (raw < 0.25 ? raw / 0.25 : 1.0);
    final settled = raw >= 1.0;
    final wobble =
        settled ? math.sin(_bgController.value * 2 * math.pi + i) * 0.05 : 0.0;
    return Opacity(
      opacity: opacity.clamp(0.0, 1.0),
      child: Transform.translate(
        offset: Offset(0, (1 - pop) * 22),
        child: Transform.rotate(
          angle: (1 - pop) * -0.18 + wobble,
          child: Transform.scale(
            scale: (0.3 + 0.9 * pop).clamp(0.0, 1.25),
            child: Text(
              _letters[i],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: i.isEven ? primary : secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sparkle(double t, double top, double left, double size, Color color) {
    final pop = Curves.elasticOut.transform(t);
    return Positioned(
      top: top,
      left: left,
      child: Opacity(
        opacity: t <= 0 ? 0.0 : 1.0,
        child: Transform.scale(
          scale: pop.clamp(0.0, 1.3),
          child: Transform.rotate(
            angle: (1 - pop) * 0.6,
            child: Icon(Icons.auto_awesome, size: size, color: color),
          ),
        ),
      ),
    );
  }

  double _intervalT(double start, double end) =>
      ((_controller.value - start) / (end - start)).clamp(0.0, 1.0);

  Widget _logoMark(ThemeData theme, double t) {
    final eased = Curves.easeOutCubic.transform(t);
    final dark = theme.brightness == Brightness.dark;
    return Opacity(
      opacity: t <= 0 ? 0.0 : eased.clamp(0.0, 1.0),
      child: Transform.scale(
        scale: 0.8 + 0.2 * eased,
        child: SizedBox(
          width: 90,
          height: 90,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 26, sigmaY: 26),
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withValues(alpha: dark ? 0.32 : 0.4),
                          Colors.white.withValues(alpha: dark ? 0.08 : 0.14),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: dark ? 0.5 : 0.7),
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/logo/app_icon_foreground.png',
                width: 58,
                height: 58,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wordmarkArea(ThemeData theme) {
    final dark = theme.brightness == Brightness.dark;
    final primary = dark ? Colors.white : theme.colorScheme.primary;
    final secondary = dark ? _gold : theme.colorScheme.secondary;
    final logoT = _intervalT(0.0, 0.14);
    final waveProgress = _intervalT(0.56, 0.80);
    final sparkle1 = _intervalT(0.74, 0.90);
    final sparkle2 = _intervalT(0.80, 0.96);
    final sparkle3 = _intervalT(0.86, 1.0);

    // The app name is always English, so it reads left to right in every
    // language: inside a right-to-left app the letters would otherwise come out
    // reversed ("peek-kooB").
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 220,
        height: 140,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(top: 0, child: _logoMark(theme, logoT)),
            Positioned(
              top: 58,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < _letters.length; i++)
                    _letter(i, primary, secondary),
                ],
              ),
            ),
            Positioned(
              top: 104,
              child: CustomPaint(
                size: const Size(190, 20),
                painter: _WavyLinePainter(waveProgress, primary, secondary),
              ),
            ),
            _sparkle(sparkle1, 50, 18, 16, secondary),
            _sparkle(sparkle2, 52, 186, 14, primary),
            _sparkle(sparkle3, 108, 98, 18, secondary),
          ],
        ),
      ),
    );
  }

  static const _floaters = [
    (dx: 0.12, dy: 0.15, size: 14.0, phase: 0.0, dot: true, color: _gold),
    (dx: 0.85, dy: 0.12, size: 10.0, phase: 0.3, dot: false, color: _funkyCyan),
    (dx: 0.15, dy: 0.8, size: 12.0, phase: 0.6, dot: true, color: _funkyPink),
    (dx: 0.88, dy: 0.75, size: 16.0, phase: 0.15, dot: false, color: _gold),
    (
      dx: 0.06,
      dy: 0.45,
      size: 8.0,
      phase: 0.45,
      dot: true,
      color: Colors.white,
    ),
    (dx: 0.92, dy: 0.42, size: 9.0, phase: 0.75, dot: true, color: _funkyCyan),
    (dx: 0.75, dy: 0.9, size: 11.0, phase: 0.9, dot: false, color: _funkyPink),
    (dx: 0.25, dy: 0.05, size: 9.0, phase: 0.2, dot: true, color: Colors.white),
  ];

  Widget _floater(Size screen, int i) {
    final f = _floaters[i];
    final t = (_bgController.value + f.phase) % 1.0;
    final bob = math.sin(t * 2 * math.pi) * 14;
    return Positioned(
      left: screen.width * f.dx,
      top: screen.height * f.dy + bob,
      child: Transform.rotate(
        angle: t * 2 * math.pi,
        child: Container(
          width: f.size,
          height: f.dot ? f.size : f.size * 0.35,
          decoration: BoxDecoration(
            color: f.color.withValues(alpha: 0.5),
            shape: f.dot ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: f.dot ? null : BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final screen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([_controller, _bgController]),
        builder: (context, _) {
          final angle = _bgController.value * 2 * math.pi;
          final begin = Alignment(math.cos(angle), math.sin(angle));
          final end = Alignment(-math.cos(angle), -math.sin(angle));
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin,
                end: end,
                colors:
                    dark
                        ? [
                          theme.colorScheme.secondary,
                          theme.colorScheme.primary,
                          _funkyPink.withValues(alpha: 0.55),
                        ]
                        : [
                          theme.colorScheme.primary,
                          Color.lerp(
                            theme.colorScheme.primary,
                            Colors.black,
                            0.35,
                          )!,
                          _funkyCyan.withValues(alpha: 0.45),
                        ],
              ),
            ),
            child: Stack(
              children: [
                for (var i = 0; i < _floaters.length; i++) _floater(screen, i),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _wordmarkArea(theme),
                      const SizedBox(height: 28),
                      const _DotLoader(colors: [_gold, _funkyPink, _funkyCyan]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DotLoader extends StatefulWidget {
  final List<Color> colors;

  const _DotLoader({required this.colors});

  @override
  State<_DotLoader> createState() => _DotLoaderState();
}

class _DotLoaderState extends State<_DotLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final t = (_controller.value + i / 3) % 1.0;
            final wave = 1 - (2 * t - 1).abs();
            final scale = 0.4 + 0.6 * wave;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Transform.translate(
                offset: Offset(0, -6 * wave),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: widget.colors[i % widget.colors.length],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _WavyLinePainter extends CustomPainter {
  final double progress;
  final Color start;
  final Color end;

  _WavyLinePainter(this.progress, this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;
    final path =
        Path()
          ..moveTo(0, size.height * 0.5)
          ..quadraticBezierTo(
            size.width * 0.15,
            0,
            size.width * 0.25,
            size.height * 0.5,
          )
          ..quadraticBezierTo(
            size.width * 0.35,
            size.height,
            size.width * 0.45,
            size.height * 0.5,
          )
          ..quadraticBezierTo(
            size.width * 0.55,
            0,
            size.width * 0.65,
            size.height * 0.5,
          )
          ..quadraticBezierTo(
            size.width * 0.75,
            size.height,
            size.width * 0.85,
            size.height * 0.5,
          )
          ..quadraticBezierTo(
            size.width * 0.95,
            0,
            size.width,
            size.height * 0.5,
          );
    final metric = path.computeMetrics().first;
    final extracted = metric.extractPath(0, metric.length * progress);
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..shader = LinearGradient(
            colors: [start, end],
          ).createShader(Offset.zero & size);
    canvas.drawPath(extracted, paint);
  }

  @override
  bool shouldRepaint(covariant _WavyLinePainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.start != start ||
      oldDelegate.end != end;
}
