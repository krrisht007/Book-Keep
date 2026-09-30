import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

import 'app_style.dart';
import 'money.dart';

Future<void> showDocumentSheet(
  BuildContext context, {
  required String title,
  required num amount,
  required String date,
  required String statusLabel,
  required Color statusColor,
  required List<dynamic> lines,
  num? paid,
  String? remainingLabel,
  num discount = 0,
  List<({String text, Color color})> notes = const [],
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.9,
    ),
    builder:
        (ctx) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 12, 8),
              child: Row(
                children: [
                  IconBadge(
                    Icons.receipt_long_outlined,
                    Theme.of(ctx).colorScheme.primary,
                    size: 36,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  AppIconButton(
                    icon: const Icon(Icons.close),
                    tooltip: context.t.close,
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Reveal(
                      index: 0,
                      child: _Hero(
                        amount: amount,
                        date: date,
                        statusLabel: statusLabel,
                        statusColor: statusColor,
                        discount: discount,
                      ),
                    ),
                    for (final n in notes) ...[
                      const SizedBox(height: 10),
                      _Reveal(
                        index: 1,
                        child: Text(
                          n.text,
                          style: TextStyle(
                            color: n.color,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                    if (paid != null) ...[
                      const SizedBox(height: 14),
                      _Reveal(
                        index: 1,
                        child: _Tiles(
                          amount: amount,
                          paid: paid,
                          remainingLabel: remainingLabel,
                        ),
                      ),
                    ],
                    const SizedBox(height: 14),
                    _Reveal(
                      index: 2,
                      child: _ItemsCard(
                        lines: lines,
                        amount: amount,
                        discount: discount,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
  );
}

class _Reveal extends StatelessWidget {
  final int index;
  final Widget child;
  const _Reveal({required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 260 + index * 90),
      curve: Curves.easeOutCubic,
      builder:
          (_, t, c) => Opacity(
            opacity: t,
            child: Transform.translate(
              offset: Offset(0, 16 * (1 - t)),
              child: c,
            ),
          ),
      child: child,
    );
  }
}

class _Hero extends StatelessWidget {
  final num amount;
  final String date;
  final String statusLabel;
  final Color statusColor;
  final num discount;
  const _Hero({
    required this.amount,
    required this.date,
    required this.statusLabel,
    required this.statusColor,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final start = Color.lerp(primary, Colors.black, 0.25)!;
    final end = Color.lerp(primary, Colors.black, 0.5)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [start, end],
        ),
        boxShadow: [
          BoxShadow(
            color: start.withValues(alpha: 0.22),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      statusLabel,
                      style: TextStyle(
                        color: Color.lerp(statusColor, Colors.black, 0.25),
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(Icons.event_outlined, size: 15, color: Colors.white70),
              const SizedBox(width: 5),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            formatMoney(amount),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),
          if (discount > 0) ...[
            const SizedBox(height: 4),
            Text(
              context.t.dsIncludesDiscount(formatMoney(discount)),
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Tiles extends StatelessWidget {
  final num amount;
  final num paid;
  final String? remainingLabel;
  const _Tiles({
    required this.amount,
    required this.paid,
    required this.remainingLabel,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = (amount - paid).clamp(0, double.infinity);
    return Row(
      children: [
        Expanded(
          child: _Tile(label: context.t.abTotal, value: formatMoney(amount)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _Tile(
            label: context.t.cdPaid,
            value: formatMoney(paid),
            color: Colors.green.shade600,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _Tile(
            label: remainingLabel ?? context.t.dsRemaining,
            value: formatMoney(remaining),
            color: remaining > 0 ? Colors.red.shade600 : Colors.green.shade600,
          ),
        ),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  const _Tile({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(
          alpha: AppStyle.isDark(context) ? 0.14 : 0.07,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppStyle.borderColor(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemsCard extends StatelessWidget {
  final List<dynamic> lines;
  final num amount;
  final num discount;
  const _ItemsCard({
    required this.lines,
    required this.amount,
    required this.discount,
  });

  String _qty(num q) => q.toStringAsFixed(q % 1 == 0 ? 0 : 1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;
    final divider = Divider(height: 1, color: AppStyle.borderColor(context));
    return AppCard(
      shadowStrength: 0.25,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                context.t.dsItems,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${lines.length}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (lines.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 18, color: muted),
                  const SizedBox(width: 8),
                  Text(context.t.cdNoItems, style: TextStyle(color: muted)),
                ],
              ),
            )
          else
            for (var i = 0; i < lines.length; i++) ...[
              if (i > 0) divider,
              _LineRow(
                name: lines[i]['item_name'] as String? ?? '',
                detail:
                    '${_qty(lines[i]['quantity'] as num)} × ${formatMoney(lines[i]['unit_price'] as num)}',
                total: formatMoney(lines[i]['line_total'] as num),
              ),
            ],
          divider,
          if (discount > 0)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(context.t.dsDiscount, style: TextStyle(color: muted)),
                  const Spacer(),
                  Text(
                    '- ${formatMoney(discount)}',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Text(
                  context.t.abTotal,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                Text(
                  formatMoney(amount),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LineRow extends StatelessWidget {
  final String name;
  final String detail;
  final String total;
  const _LineRow({
    required this.name,
    required this.detail,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).colorScheme.onSurfaceVariant;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyle.highContrastFill(
                context,
                AppStyle.colorForKey(name),
              ),
            ),
            child: Text(
              name.isEmpty ? '?' : name.characters.first.toUpperCase(),
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                Text(detail, style: TextStyle(fontSize: 12, color: muted)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(total, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}
