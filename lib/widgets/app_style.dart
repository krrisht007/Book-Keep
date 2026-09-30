import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api.dart' as http;
import '../whatsapp.dart';
import '../l10n/l10n.dart';

Future<void> fetchAndPrintPdf(
  BuildContext context, {
  required String url,
  required String errorLabel,
}) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.serverError(response.statusCode))),
        );
      }
      return;
    }
    await Printing.layoutPdf(onLayout: (format) async => response.bodyBytes);
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.couldNotLoadLabel(errorLabel, '$e'))),
      );
    }
  }
}

Future<XFile?> pickImageFile(BuildContext context) async {
  final source = await showModalBottomSheet<ImageSource>(
    context: context,
    builder:
        (context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined),
                title: Text(context.t.takePhoto),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(context.t.chooseFromGallery),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        ),
  );
  if (source == null) return null;
  return ImagePicker().pickImage(
    source: source,
    maxWidth: 1024,
    imageQuality: 82,
  );
}

class AppStyle {
  AppStyle._();

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color tint(
    BuildContext context,
    Color c, {
    double light = 0.10,
    double dark = 0.20,
  }) => c.withValues(alpha: isDark(context) ? dark : light);

  static List<BoxShadow> raisedShadow(
    BuildContext context, {
    double strength = 1,
  }) {
    final primary = Theme.of(context).colorScheme.primary;
    if (isDark(context)) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.40 * strength),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.06 * strength),
          blurRadius: 14,
          offset: const Offset(-6, -6),
        ),
      ];
    }
    return [
      BoxShadow(
        color: primary.withValues(alpha: 0.16 * strength),
        blurRadius: 16,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: primary.withValues(alpha: 0.06 * strength),
        blurRadius: 3,
        offset: const Offset(0, 2),
      ),
      BoxShadow(
        color: Colors.white,
        blurRadius: 16,
        offset: const Offset(-8, -8),
      ),
    ];
  }

  static Color borderColor(BuildContext context) => Theme.of(
    context,
  ).colorScheme.outlineVariant.withValues(alpha: isDark(context) ? 0.3 : 0.6);

  static Color highContrastFill(BuildContext context, Color color) =>
      MediaQuery.highContrastOf(context)
          ? Color.lerp(color, Colors.black, 0.35)!
          : color;

  static const List<Color> categoryPalette = [
    Color(0xFFA5B4FC),
    Color(0xFF86EFAC),
    Color(0xFFFCA5A5),
    Color(0xFFFDE68A),
    Color(0xFF7DD3FC),
    Color(0xFFF9A8D4),
    Color(0xFFD8B4FE),
  ];

  static Color colorForKey(String? key) {
    final k = (key == null || key.trim().isEmpty) ? 'default' : key;
    return categoryPalette[k.hashCode.abs() % categoryPalette.length];
  }

  static Color creditColor(double usedFraction) {
    final f = usedFraction.clamp(0.0, 1.0);
    if (f >= 1.0) return Colors.red.shade600;
    if (f <= 0.7) return Colors.green.shade600;
    final t = (f - 0.7) / 0.3;
    return t < 0.5
        ? Color.lerp(Colors.green.shade600, Colors.amber.shade700, t * 2)!
        : Color.lerp(
          Colors.amber.shade700,
          Colors.red.shade600,
          (t - 0.5) * 2,
        )!;
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double radius;
  final double shadowStrength;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.radius = 24,
    this.shadowStrength = 0.7,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: AppStyle.raisedShadow(context, strength: shadowStrength),
      ),
      child: GlassContainer(
        borderRadius: radius,
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }
}

class AppListCard extends StatelessWidget {
  final List<Widget> rows;
  const AppListCard({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            rows[i],
            if (i != rows.length - 1)
              Divider(
                height: 1,
                indent: 14,
                endIndent: 14,
                color: AppStyle.borderColor(context),
              ),
          ],
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const IconBadge(this.icon, this.color, {super.key, this.size = 38});

  @override
  Widget build(BuildContext context) {
    final dark = AppStyle.isDark(context);
    final fillColor = AppStyle.highContrastFill(context, color);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.lerp(fillColor, Colors.white, 0.32)!, fillColor],
        ),
        boxShadow: [
          BoxShadow(
            color: fillColor.withValues(alpha: dark ? 0.28 : 0.22),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.48),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool loading;
  final VoidCallback? onPressed;
  final double height;

  const GradientButton({
    super.key,
    required this.label,
    this.icon,
    this.loading = false,
    required this.onPressed,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final dark = AppStyle.isDark(context);
    return Pressable(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: primary.withValues(alpha: dark ? 0.22 : 0.18),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primary,
                  Color.lerp(primary, Colors.black, dark ? 0.25 : 0.15)!,
                ],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(14),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: onPressed,
                child: Center(
                  child:
                      loading
                          ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (icon != null) ...[
                                Icon(icon, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                              ],
                              Text(
                                label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color? color;
  final ValueChanged<bool> onSelected;

  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GlassContainer(
        borderRadius: 20,
        tint: selected ? chipColor : null,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => onSelected(!selected),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: selected ? Colors.black87 : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AvatarListRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String initial;
  final Color avatarColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  final Widget? footer;

  final Widget? sideAction;

  final Color? ringColor;

  final double avatarRadius;

  final Color? glowColor;

  const AvatarListRow({
    super.key,
    required this.title,
    this.subtitle,
    required this.initial,
    required this.avatarColor,
    this.trailing,
    this.onTap,
    this.footer,
    this.sideAction,
    this.ringColor,
    this.avatarRadius = 24,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = AppStyle.isDark(context);
    return Pressable(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow:
              glowColor == null
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: glowColor!.withValues(alpha: dark ? 0.45 : 0.30),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
        ),
        child: GlassContainer(
          borderRadius: 22,
          tint: glowColor,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(ringColor == null ? 0 : 2),
                      decoration:
                          ringColor == null
                              ? null
                              : BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ringColor!, width: 2),
                              ),
                      child: CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: AppStyle.highContrastFill(
                          context,
                          avatarColor,
                        ),
                        child: Text(
                          initial,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: avatarRadius * 0.75,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          if (subtitle != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              subtitle!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.5,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                          if (footer != null) footer!,
                        ],
                      ),
                    ),
                    if (sideAction != null) ...[
                      const SizedBox(width: 2),
                      sideAction!,
                      if (trailing != null)
                        Container(
                          width: 1,
                          height: 22,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          color: theme.colorScheme.outlineVariant,
                        ),
                    ],
                    if (trailing != null) trailing!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FloatingOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double top;
  final double left;

  const FloatingOrb({
    super.key,
    required this.size,
    required this.color,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withValues(alpha: 0.85),
              color.withValues(alpha: 0.35),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthHeroBackdrop extends StatelessWidget {
  final double height;
  const AuthHeroBackdrop({super.key, this.height = 300});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = AppStyle.isDark(context);
    final primary = theme.colorScheme.primary;
    final secondary = theme.colorScheme.secondary;
    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:
                  dark
                      ? [secondary, primary]
                      : [primary, Color.lerp(primary, Colors.black, 0.35)!],
            ),
          ),
        ),
        SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const FloatingOrb(
                size: 90,
                color: Colors.white,
                top: 30,
                left: -20,
              ),
              const FloatingOrb(
                size: 40,
                color: Colors.white,
                top: 130,
                left: 40,
              ),
              FloatingOrb(
                size: 130,
                color: Color.lerp(primary, Colors.white, 0.5)!,
                top: -40,
                left: 250,
              ),
              const FloatingOrb(
                size: 26,
                color: Colors.white,
                top: 210,
                left: 300,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FloatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  const FloatingAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
  }) : assert(
         title != null || titleWidget != null,
         'FloatingAppBar needs a title or a titleWidget',
       );

  @override
  Size get preferredSize => const Size.fromHeight(78);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final canPop =
        automaticallyImplyLeading && (ModalRoute.of(context)?.canPop ?? false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 6),
          child: Material(
            color: theme.colorScheme.primary,
            elevation: 6,
            shadowColor: theme.colorScheme.primary.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(22),
            child: IconTheme.merge(
              data: const IconThemeData(color: Colors.white),
              child: SizedBox(
                height: 56,
                child: Row(
                  children: [
                    if (leading != null)
                      leading!
                    else if (canPop)
                      AppIconButton(
                        icon: const Icon(Icons.arrow_back),
                        tooltip: context.t.back,
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    else
                      const SizedBox(width: 18),
                    Expanded(
                      child:
                          titleWidget ??
                          Text(
                            title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    if (actions != null) ...actions!,
                    const SizedBox(width: 6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> confirmDelete(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder:
        (context) => confirmDialogShell(
          context: context,
          title: title,
          message: message,
          actions: [
            EatingDeleteButton(onConfirmed: () => Navigator.pop(context, true)),
            AnimatedCancelButton(
              onCancelled: () => Navigator.pop(context, false),
            ),
          ],
        ),
  );
  return confirmed ?? false;
}

Widget confirmDialogShell({
  required BuildContext context,
  required String title,
  required String message,
  required List<Widget> actions,
}) {
  final scheme = Theme.of(context).colorScheme;
  return AlertDialog(
    backgroundColor: scheme.surface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: scheme.onSurface, fontWeight: FontWeight.w700),
    ),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: scheme.onSurface.withValues(alpha: 0.7)),
    ),
    actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    actions: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(color: scheme.outlineVariant, height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: actions,
          ),
        ],
      ),
    ],
  );
}

class EatingDeleteButton extends StatefulWidget {
  final String? label;
  final VoidCallback onConfirmed;

  const EatingDeleteButton({super.key, this.label, required this.onConfirmed});

  @override
  State<EatingDeleteButton> createState() => _EatingDeleteButtonState();
}

enum _EatPhase { idle, eating, collapsed }

class _EatingDeleteButtonState extends State<EatingDeleteButton>
    with SingleTickerProviderStateMixin {
  static const _eatDuration = Duration(milliseconds: 650);
  static const _spinDuration = Duration(milliseconds: 420);
  static const _pillHeight = 44.0;

  late final AnimationController _controller;
  _EatPhase _phase = _EatPhase.idle;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _eatDuration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _run() async {
    if (_phase != _EatPhase.idle) return;
    setState(() => _phase = _EatPhase.eating);
    await _controller.forward(from: 0);
    if (!mounted) return;
    setState(() => _phase = _EatPhase.collapsed);
    await Future.delayed(_spinDuration);
    if (!mounted) return;
    widget.onConfirmed();
  }

  static double _letterProgress(double controllerValue, int i, int count) {
    const span = 0.45;
    final step = count > 1 ? (1 - span) / (count - 1) : 0.0;
    final start = i * step;
    final raw = (controllerValue - start) / span;
    return Curves.easeIn.transform(raw.clamp(0.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label ?? context.t.delete;
    final idle = _phase == _EatPhase.idle;
    final collapsed = _phase == _EatPhase.collapsed;
    return GestureDetector(
      onTapDown: idle ? (_) => setState(() => _pressed = true) : null,
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: idle ? _run : null,
      child: AnimatedScale(
        scale: _pressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final v = _phase == _EatPhase.eating ? _controller.value : 0.0;
            final bite =
                _phase == _EatPhase.eating
                    ? 1 + 0.22 * math.sin(v * label.length * math.pi).abs()
                    : 1.0;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOut,
              height: _pillHeight,
              width: collapsed ? _pillHeight : null,
              padding:
                  collapsed
                      ? EdgeInsets.zero
                      : const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_pillHeight / 2),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red.shade600, Colors.red.shade400],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withValues(alpha: 0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child:
                  collapsed
                      ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                      : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: bite,
                            child: const Icon(
                              Icons.delete_outline,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 6),
                          ...List.generate(label.length, (i) {
                            final t =
                                _phase == _EatPhase.eating
                                    ? _letterProgress(v, i, label.length)
                                    : 0.0;
                            return AnimatedSize(
                              duration: const Duration(milliseconds: 90),
                              curve: Curves.easeOut,
                              child:
                                  t >= 0.999
                                      ? const SizedBox.shrink()
                                      : Opacity(
                                        opacity: 1 - t,
                                        child: Transform.translate(
                                          offset: Offset(-2 * t, -8 * t),
                                          child: Transform.rotate(
                                            angle: 0.5 * t,
                                            child: Transform.scale(
                                              scale: 1 - 0.55 * t,
                                              child: Text(
                                                label[i],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                            );
                          }),
                        ],
                      ),
            );
          },
        ),
      ),
    );
  }
}

class AnimatedCancelButton extends StatefulWidget {
  final VoidCallback onCancelled;

  const AnimatedCancelButton({super.key, required this.onCancelled});

  @override
  State<AnimatedCancelButton> createState() => _AnimatedCancelButtonState();
}

class _AnimatedCancelButtonState extends State<AnimatedCancelButton>
    with SingleTickerProviderStateMixin {
  static const _dismissDuration = Duration(milliseconds: 320);

  late final AnimationController _controller;
  bool _running = false;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _dismissDuration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _run() async {
    if (_running) return;
    setState(() => _running = true);
    await _controller.forward(from: 0);
    if (!mounted) return;
    widget.onCancelled();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTapDown: !_running ? (_) => setState(() => _pressed = true) : null,
      onTapCancel: () => setState(() => _pressed = false),
      onTapUp: (_) => setState(() => _pressed = false),
      onTap: !_running ? _run : null,
      child: AnimatedScale(
        scale: _pressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final t = Curves.easeIn.transform(_controller.value);
            return Opacity(
              opacity: 1 - t,
              child: Transform.translate(
                offset: Offset(0, 10 * t),
                child: Transform.scale(scale: 1 - 0.25 * t, child: child),
              ),
            );
          },
          child: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: primary.withValues(alpha: 0.1),
              border: Border.all(color: primary.withValues(alpha: 0.45)),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.close_rounded, size: 18, color: primary),
                const SizedBox(width: 6),
                Text(
                  context.t.cancel,
                  style: TextStyle(color: primary, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget errorRetry(String message, VoidCallback onRetry) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: Builder(builder: (context) => Text(context.t.retry)),
          ),
        ],
      ),
    ),
  );
}

Widget contactSideAction(String phone, String name) {
  return Builder(
    builder:
        (context) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIconButton(
              icon: Icon(Icons.call, size: 20, color: Colors.grey.shade700),
              tooltip: context.t.callPhone(phone),
              onPressed: () => launchUrl(Uri(scheme: 'tel', path: phone)),
            ),
            AppIconButton(
              icon: const Icon(Icons.chat, size: 20, color: Color(0xFF25D366)),
              tooltip: context.t.whatsappPhone(phone),
              onPressed:
                  () => sendWhatsApp(
                    phone,
                    name.isEmpty
                        ? context.t.waHello
                        : context.t.waHelloNamed(name),
                  ),
            ),
          ],
        ),
  );
}

InputDecoration appInputDecoration(
  BuildContext context, {
  required String label,
  IconData? icon,
  Widget? suffixIcon,
  String? hint,
  String? helperText,
  String? prefixText,
}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    helperText: helperText,
    prefixText: prefixText,
    prefixIcon: icon != null ? Icon(icon) : null,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  );
}

class Pressable extends StatefulWidget {
  final Widget child;
  final double scale;

  const Pressable({super.key, required this.child, this.scale = 0.96});

  @override
  State<Pressable> createState() => _PressableState();
}

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final VisualDensity? visualDensity;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        tooltip: tooltip,
        visualDensity: visualDensity,
      ),
    );
  }
}

class _PressableState extends State<Pressable> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() => _pressed = true),
      onPointerUp: (_) => setState(() => _pressed = false),
      onPointerCancel: (_) => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? widget.scale : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blurSigma;

  final Color? tint;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.blurSigma = 14,
    this.tint,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppStyle.isDark(context);
    final base = tint ?? Colors.white;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          decoration: BoxDecoration(
            color: base.withValues(alpha: dark ? 0.12 : 0.16),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withValues(alpha: dark ? 0.14 : 0.4),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool autofocus;

  const GlassSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.autofocus = false,
  });

  @override
  State<GlassSearchBar> createState() => _GlassSearchBarState();
}

class _GlassSearchBarState extends State<GlassSearchBar> {
  final _focus = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() => _focused = _focus.hasFocus));
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focused = _focused;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          if (focused)
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.35),
              blurRadius: 24,
              offset: const Offset(0, 8),
            )
          else
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: GlassContainer(
        borderRadius: 28,
        tint: focused ? theme.colorScheme.primary : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color:
                  focused
                      ? theme.colorScheme.primary.withValues(alpha: 0.6)
                      : Colors.transparent,
              width: 1.4,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              AnimatedScale(
                scale: focused ? 1.15 : 1.0,
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                child: AnimatedRotation(
                  turns: focused ? 0.04 : 0.0,
                  duration: const Duration(milliseconds: 220),
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color:
                        focused
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focus,
                  autofocus: widget.autofocus,
                  onChanged: (v) {
                    widget.onChanged(v);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 160),
                transitionBuilder:
                    (child, anim) => ScaleTransition(scale: anim, child: child),
                child:
                    widget.controller.text.isEmpty
                        ? const SizedBox(width: 8, key: ValueKey('empty'))
                        : AppIconButton(
                          key: const ValueKey('clear'),
                          icon: const Icon(Icons.clear, size: 18),
                          tooltip: context.t.clearSearch,
                          onPressed: () {
                            widget.controller.clear();
                            widget.onChanged('');
                            setState(() {});
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonPulse extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  final Color? color;

  const SkeletonPulse({
    super.key,
    this.width = double.infinity,
    this.height = 14,
    this.borderRadius,
    this.color,
  });

  @override
  State<SkeletonPulse> createState() => _SkeletonPulseState();
}

class _SkeletonPulseState extends State<SkeletonPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppStyle.isDark(context);
    final color = widget.color ?? (dark ? Colors.white24 : Colors.black12);
    return AnimatedBuilder(
      animation: _controller,
      builder:
          (context, _) => Opacity(
            opacity: 0.4 + _controller.value * 0.4,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
            ),
          ),
    );
  }
}

class SkeletonListLoader extends StatelessWidget {
  final int rows;
  final EdgeInsetsGeometry padding;

  const SkeletonListLoader({
    super.key,
    this.rows = 4,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var i = 0; i < rows; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AppCard(
              radius: 16,
              shadowStrength: 0.3,
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const Expanded(child: SkeletonPulse(width: 120)),
                  const SizedBox(width: 12),
                  const SkeletonPulse(width: 60),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

SnackBarThemeData appSnackBarTheme({required bool dark}) => SnackBarThemeData(
  behavior: SnackBarBehavior.floating,
  backgroundColor: dark ? const Color(0xFF3A2F29) : const Color(0xFF16302C),
  contentTextStyle: const TextStyle(
    color: Colors.white,
    fontSize: 14.5,
    height: 1.3,
    fontWeight: FontWeight.w500,
  ),
  elevation: 10,
  insetPadding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
  ),
  actionTextColor: const Color(0xFF7FE0D0),
);

class SnackMessage extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const SnackMessage({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.2),
          ),
          child: Icon(icon, size: 20, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class ScanIntroCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const ScanIntroCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 16, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primary.withValues(alpha: 0.14),
            primary.withValues(alpha: 0.05),
          ],
        ),
        border: Border.all(color: primary.withValues(alpha: 0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primary.withValues(alpha: 0.16),
            ),
            child: Icon(icon, color: primary, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DialogThemeData appDialogTheme({required bool dark}) => DialogThemeData(
  backgroundColor: dark ? const Color(0xFF2A211C) : Colors.white,
  surfaceTintColor: Colors.transparent,
  elevation: 14,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
  titleTextStyle: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w800,
    color: dark ? Colors.white : const Color(0xFF16302C),
  ),
  contentTextStyle: TextStyle(
    fontSize: 14.5,
    height: 1.45,
    color: dark ? Colors.white70 : Colors.black87,
  ),
);

BottomSheetThemeData appBottomSheetTheme({required bool dark}) =>
    BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: dark ? const Color(0xFF2A211C) : Colors.white,
      surfaceTintColor: Colors.transparent,
      modalElevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
    );
