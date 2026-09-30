import 'dart:math' as math;

import 'package:flutter/material.dart';

class HistoryRow {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  final String? badge;
  final String? note;

  const HistoryRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    this.badge,
    this.note,
  });
}

class HistorySummary {
  final String value;
  final String? delta;
  final Color? deltaColor;
  final List<double> spark;

  const HistorySummary({
    required this.value,
    this.delta,
    this.deltaColor,
    this.spark = const [],
  });
}

Future<void> showHistorySheet(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String itemName,
  required String emptyText,
  required List<HistoryRow> rows,
  HistorySummary? summary,
  String? error,
  String? resetLabel,
  Future<bool> Function()? onReset,
  String? shareLabel,
  Future<void> Function()? onShare,
  String? editLabel,
  String? removeLabel,
  Future<bool> Function(int row)? onEdit,
  Future<bool> Function(int row)? onRemove,
  VoidCallback? onChanged,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (ctx) {
      final theme = Theme.of(ctx);
      final primary = theme.colorScheme.primary;
      final muted = theme.colorScheme.onSurfaceVariant;

      // After an edit or a removal the sheet closes and the caller reopens it with
      // the fresh entries.
      Future<void> change(Future<bool> Function(int row) action, int row) async {
        if (await action(row) && ctx.mounted) {
          Navigator.pop(ctx);
          onChanged?.call();
        }
      }

      Widget body;
      if (error != null) {
        body = Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          child: Text(error, style: const TextStyle(color: Colors.red)),
        );
      } else if (rows.isEmpty) {
        body = Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary.withValues(alpha: 0.1),
                ),
                child: Icon(
                  icon,
                  size: 36,
                  color: primary.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                emptyText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.4, color: muted),
              ),
            ],
          ),
        );
      } else {
        body = ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          itemCount: rows.length,
          itemBuilder:
              (_, i) => _TimelineRow(
                row: rows[i],
                index: i,
                first: i == 0,
                last: i == rows.length - 1,
                editLabel: editLabel,
                removeLabel: removeLabel,
                onEdit: onEdit == null ? null : () => change(onEdit, i),
                onRemove: onRemove == null ? null : () => change(onRemove, i),
              ),
        );
      }

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(ctx).size.height * 0.82,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [primary, primary.withValues(alpha: 0.7)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: primary.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(icon, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 19,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          itemName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13.5, color: muted),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (summary != null && error == null && rows.isNotEmpty)
              _SummaryCard(summary: summary),
            if ((onReset != null || onShare != null) &&
                error == null &&
                rows.isNotEmpty)
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 4,
                    children: [
                      if (onShare != null)
                        TextButton.icon(
                          icon: const Icon(
                            Icons.picture_as_pdf_outlined,
                            size: 18,
                          ),
                          label: Text(shareLabel ?? ''),
                          onPressed: onShare,
                        ),
                      if (onReset != null)
                        TextButton.icon(
                          icon: const Icon(Icons.restart_alt_rounded, size: 18),
                          label: Text(resetLabel ?? ''),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red.shade600,
                          ),
                          onPressed: () async {
                            if (await onReset() && ctx.mounted) {
                              Navigator.pop(ctx);
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            Flexible(child: body),
          ],
        ),
      );
    },
  );
}

class _SummaryCard extends StatelessWidget {
  final HistorySummary summary;
  const _SummaryCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final deltaColor = summary.deltaColor ?? primary;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      padding: const EdgeInsets.fromLTRB(18, 14, 14, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primary.withValues(alpha: 0.18),
            primary.withValues(alpha: 0.05),
          ],
        ),
        border: Border.all(color: primary.withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    summary.value,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                    ),
                  ),
                ),
                if (summary.delta != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: deltaColor.withValues(alpha: 0.16),
                    ),
                    child: Text(
                      summary.delta!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: deltaColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (summary.spark.length > 1)
            Directionality(
              textDirection: TextDirection.ltr,
              child: SizedBox(
                width: 118,
                height: 62,
                child: CustomPaint(
                  painter: _SparkPainter(summary.spark, primary),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SparkPainter extends CustomPainter {
  final List<double> values;
  final Color color;
  _SparkPainter(this.values, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final lo = values.reduce(math.min);
    final hi = values.reduce(math.max);
    final span = hi - lo;
    const pad = 6.0;
    final w = size.width - pad * 2;
    final h = size.height - pad * 2;
    final pts = <Offset>[
      for (var i = 0; i < values.length; i++)
        Offset(
          pad + w * i / (values.length - 1),
          span == 0 ? size.height / 2 : pad + h * (1 - (values[i] - lo) / span),
        ),
    ];

    final line = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 1; i < pts.length; i++) {
      final mid = (pts[i - 1].dx + pts[i].dx) / 2;
      line.cubicTo(mid, pts[i - 1].dy, mid, pts[i].dy, pts[i].dx, pts[i].dy);
    }
    final fill =
        Path.from(line)
          ..lineTo(pts.last.dx, size.height)
          ..lineTo(pts.first.dx, size.height)
          ..close();

    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.35), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.6
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(
      pts.last,
      6.5,
      Paint()..color = color.withValues(alpha: 0.25),
    );
    canvas.drawCircle(pts.last, 4, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_SparkPainter old) =>
      old.color != color || old.values != values;
}

class _TimelineRow extends StatelessWidget {
  final HistoryRow row;
  final int index;
  final bool first;
  final bool last;
  final String? editLabel;
  final String? removeLabel;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  const _TimelineRow({
    required this.row,
    required this.index,
    required this.first,
    required this.last,
    this.editLabel,
    this.removeLabel,
    this.onEdit,
    this.onRemove,
  });

  static const _dot = 34.0;
  static const _dotTop = 6.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final lineColor = theme.colorScheme.outlineVariant.withValues(alpha: 0.7);
    final r = row;

    final card = Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient:
            first
                ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    r.color.withValues(alpha: 0.16),
                    r.color.withValues(alpha: 0.04),
                  ],
                )
                : null,
        color:
            first
                ? null
                : theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
        border: Border.all(
          color:
              first
                  ? r.color.withValues(alpha: 0.4)
                  : theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  r.subtitle,
                  style: TextStyle(fontSize: 12.5, color: muted),
                ),
                if (r.note != null) ...[
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.sticky_note_2_outlined, size: 14, color: muted),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          r.note!,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontStyle: FontStyle.italic,
                            color: muted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (r.badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: r.color.withValues(alpha: 0.16),
              ),
              child: Text(
                r.badge!,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: r.color,
                ),
              ),
            ),
          if (onEdit != null || onRemove != null)
            PopupMenuButton<int>(
              padding: EdgeInsets.zero,
              iconSize: 20,
              icon: Icon(Icons.more_vert, color: muted),
              onSelected: (v) => v == 0 ? onEdit?.call() : onRemove?.call(),
              itemBuilder:
                  (_) => [
                    if (onEdit != null)
                      PopupMenuItem(value: 0, child: Text(editLabel ?? '')),
                    if (onRemove != null)
                      PopupMenuItem(
                        value: 1,
                        child: Text(
                          removeLabel ?? '',
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                  ],
            ),
        ],
      ),
    );

    final rail = SizedBox(
      width: _dot + 10,
      child: Stack(
        children: [
          if (!(first && last))
            Positioned(
              top: first ? _dotTop + _dot / 2 : 0,
              bottom: last ? null : 0,
              height: last ? _dotTop + _dot / 2 : null,
              left: 0,
              right: 10,
              child: Center(child: Container(width: 2, color: lineColor)),
            ),
          Positioned(
            top: _dotTop,
            left: 0,
            right: 10,
            child: Center(
              child: Container(
                width: _dot,
                height: _dot,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.surface,
                  border: Border.all(color: r.color, width: 2),
                  boxShadow:
                      first
                          ? [
                            BoxShadow(
                              color: r.color.withValues(alpha: 0.45),
                              blurRadius: 12,
                            ),
                          ]
                          : null,
                ),
                child: Icon(r.icon, color: r.color, size: 17),
              ),
            ),
          ),
        ],
      ),
    );

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 700),
      curve: Interval(math.min(index, 7) * 0.08, 1, curve: Curves.easeOutCubic),
      builder:
          (_, v, child) => Opacity(
            opacity: v,
            child: Transform.translate(
              offset: Offset(0, 16 * (1 - v)),
              child: child,
            ),
          ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [rail, Expanded(child: card)],
        ),
      ),
    );
  }
}
