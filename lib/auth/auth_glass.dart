import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import '../l10n/l10n.dart';
import 'package:flutter/services.dart';

const _entrance = Duration(milliseconds: 1600);
const _driftLoop = Duration(seconds: 60);

class _AuthEntrance extends InheritedNotifier<AnimationController> {
  const _AuthEntrance({
    required AnimationController controller,
    required super.child,
  }) : super(notifier: controller);

  static AnimationController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AuthEntrance>()?.notifier;
}

class AuthGlassScaffold extends StatefulWidget {
  const AuthGlassScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<AuthGlassScaffold> createState() => _AuthGlassScaffoldState();
}

class _AuthGlassScaffoldState extends State<AuthGlassScaffold>
    with TickerProviderStateMixin {
  late final AnimationController _enter = AnimationController(
    vsync: this,
    duration: _entrance,
  );
  late final AnimationController _drift = AnimationController(
    vsync: this,
    duration: _driftLoop,
  );
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (MediaQuery.disableAnimationsOf(context)) {
      _enter.value = 1;
      _drift.value = 0.25;
    } else {
      _enter.forward();
      _drift.repeat();
    }
  }

  @override
  void dispose() {
    _enter.dispose();
    _drift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RepaintBoundary(child: _AuthBackground(drift: _drift)),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, box) {
                final top =
                    MediaQuery.sizeOf(context).height < 520 ? 12.0 : 28.0;
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(22, top, 22, 0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: box.maxHeight - top),
                    child: IntrinsicHeight(
                      child: _AuthEntrance(
                        controller: _enter,
                        child: widget.child,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthBackground extends StatelessWidget {
  const _AuthBackground({required this.drift});

  final Animation<double> drift;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final cs = theme.colorScheme;
    final colors =
        dark
            ? [
              Color.lerp(cs.secondary, Colors.black, 0.4)!,
              cs.secondary,
              cs.primary,
            ]
            : [
              Color.lerp(cs.primary, Colors.black, 0.4)!,
              cs.primary,
              Color.lerp(cs.primary, const Color(0xFF2DD4BF), 0.5)!,
            ];
    final glow = dark ? const Color(0xFFFFC9A8) : const Color(0xFF8AF0E2);
    final shade = Color.lerp(colors.first, Colors.black, 0.35)!;

    return AnimatedBuilder(
      animation: drift,
      builder: (context, _) {
        double s(int turns) => math.sin(2 * math.pi * turns * drift.value);
        double c(int turns) => math.cos(2 * math.pi * turns * drift.value);
        return Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: colors,
                  ),
                ),
              ),
            ),
            _orb(
              top: -70 + 16 * s(9),
              left: -50 + 20 * c(7),
              size: 240,
              color: Colors.white,
              alpha: 0.2,
            ),
            _orb(
              top: 200 + 22 * c(6),
              right: -90 + 18 * s(8),
              size: 290,
              color: glow,
              alpha: 0.32,
            ),
            _orb(
              bottom: -90 + 14 * s(5),
              left: -40 + 22 * c(4),
              size: 300,
              color: shade,
              alpha: 0.6,
            ),
            _orb(
              top: 60 + 12 * s(13),
              right: 50 + 10 * c(10),
              size: 64,
              color: Colors.white,
              alpha: 0.28,
            ),
            _orb(
              top: 430 + 18 * s(11),
              left: 24 + 12 * c(9),
              size: 46,
              color: Colors.white,
              alpha: 0.2,
            ),
          ],
        );
      },
    );
  }

  Widget _orb({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double size,
    required Color color,
    required double alpha,
  }) => Positioned(
    top: top,
    left: left,
    right: right,
    bottom: bottom,
    child: IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withValues(alpha: alpha),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    ),
  );
}

class AuthReveal extends StatelessWidget {
  const AuthReveal({
    super.key,
    required this.start,
    required this.seconds,
    required this.child,
    this.dy = 16,
    this.pop = false,
  });

  final double start;
  final double seconds;
  final double dy;
  final bool pop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final controller = _AuthEntrance.of(context);
    final now = controller == null ? 99.0 : controller.value * 1.6;
    final p = ((now - start) / seconds).clamp(0.0, 1.0);
    if (p >= 1) return child;
    final eased = Curves.easeOutCubic.transform(p);
    Widget out = Opacity(
      opacity: eased,
      child: Transform.translate(
        offset: Offset(0, (1 - eased) * dy),
        child: child,
      ),
    );
    if (pop) {
      out = Transform.scale(
        scale: Curves.elasticOut.transform(p).clamp(0.0, 1.4),
        child: out,
      );
    }
    return out;
  }
}

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).height < 520) {
      return AuthReveal(
        start: 0.05,
        seconds: 0.8,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthGlassBadge(icon: icon, size: 52),
              const SizedBox(width: 14),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.4,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      children: [
        AuthReveal(
          start: 0.05,
          seconds: 1.0,
          pop: true,
          child: AuthGlassBadge(icon: icon),
        ),
        const SizedBox(height: 20),
        AuthReveal(
          start: 0.35,
          seconds: 0.6,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(height: 6),
        AuthReveal(
          start: 0.5,
          seconds: 0.55,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.5,
              color: Colors.white.withValues(alpha: 0.85),
            ),
          ),
        ),
        const SizedBox(height: 26),
      ],
    );
  }
}

class AuthGlassBadge extends StatelessWidget {
  const AuthGlassBadge({super.key, required this.icon, this.size = 92});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.42),
            Colors.white.withValues(alpha: 0.1),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.6),
          width: 1.4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.25),
            blurRadius: 30,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.48),
    );
  }
}

class AuthGlassCard extends StatelessWidget {
  const AuthGlassCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.38),
              width: 1.2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

const _errorText = Color(0xFFFFD9D3);

class AuthGlassField extends StatefulWidget {
  const AuthGlassField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.validator,
    this.obscure = false,
    this.onToggleObscure,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.prefixText,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool obscure;

  final VoidCallback? onToggleObscure;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;

  @override
  State<AuthGlassField> createState() => _AuthGlassFieldState();
}

class _AuthGlassFieldState extends State<AuthGlassField> {
  final _focus = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (mounted) setState(() => _focused = _focus.hasFocus);
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  OutlineInputBorder _border(Color color, double width) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color, width: width),
  );

  @override
  Widget build(BuildContext context) {
    const white = Colors.white;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          if (_focused)
            BoxShadow(color: white.withValues(alpha: 0.28), blurRadius: 18),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focus,
        obscureText: widget.obscure,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        cursorColor: white,
        style: const TextStyle(color: white, fontSize: 16),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: white.withValues(alpha: 0.8)),
          floatingLabelStyle: const TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
          ),
          prefixText: widget.prefixText,
          prefixStyle: const TextStyle(color: white, fontSize: 16),
          prefixIcon: Icon(widget.icon, color: white.withValues(alpha: 0.8)),
          suffixIcon:
              widget.onToggleObscure == null
                  ? null
                  : IconButton(
                    tooltip:
                        widget.obscure ? context.t.agShow : context.t.agHide,
                    icon: Icon(
                      widget.obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: white.withValues(alpha: 0.85),
                    ),
                    onPressed: widget.onToggleObscure,
                  ),
          filled: true,
          fillColor: white.withValues(alpha: _focused ? 0.2 : 0.13),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: _border(white.withValues(alpha: 0.3), 1),
          enabledBorder: _border(white.withValues(alpha: 0.3), 1),
          focusedBorder: _border(white.withValues(alpha: 0.95), 1.6),
          errorBorder: _border(_errorText, 1.2),
          focusedErrorBorder: _border(_errorText, 1.6),
          errorStyle: const TextStyle(
            color: _errorText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class AuthPrimaryButton extends StatefulWidget {
  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  State<AuthPrimaryButton> createState() => _AuthPrimaryButtonState();
}

class _AuthPrimaryButtonState extends State<AuthPrimaryButton> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ink =
        theme.brightness == Brightness.dark
            ? Color.lerp(theme.colorScheme.secondary, Colors.black, 0.3)!
            : Color.lerp(theme.colorScheme.primary, Colors.black, 0.1)!;
    return AnimatedScale(
      scale: _down ? 0.96 : 1,
      duration: const Duration(milliseconds: 110),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: widget.onPressed,
            onHighlightChanged: (v) => setState(() => _down = v),
            child: Center(
              child:
                  widget.loading
                      ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: ink,
                        ),
                      )
                      : Text(
                        widget.label,
                        style: TextStyle(
                          color: ink,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthOutlineButton extends StatelessWidget {
  const AuthOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leading,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.6),
          width: 1.3,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(26),
        child: InkWell(
          borderRadius: BorderRadius.circular(26),
          onTap: onPressed,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leading != null) ...[leading!, const SizedBox(width: 10)],
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthOrDivider extends StatelessWidget {
  const AuthOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final line = Divider(color: Colors.white.withValues(alpha: 0.35));
    return Row(
      children: [
        Expanded(child: line),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            context.t.lnOr,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
          ),
        ),
        Expanded(child: line),
      ],
    );
  }
}

class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    super.key,
    required this.prefix,
    required this.action,
    required this.onTap,
  });

  final String prefix;
  final String action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Text.rich(
          TextSpan(
            text: '$prefix  ',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 15,
            ),
            children: [
              TextSpan(
                text: action,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
