import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gstin_utils.dart';
import 'l10n/l10n.dart';

String? cleanJazzCashNumber(String raw) {
  final v = raw.replaceAll(RegExp(r'[\s-]'), '');
  if (v.isEmpty || validateJazzCashNumber(v) != null) return null;
  return v;
}

String _spaced(String n) =>
    n.length == 11 ? '${n.substring(0, 4)} ${n.substring(4)}' : n;

Widget _qrBox(String data, double size) => Container(
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: BarcodeWidget(
    barcode: Barcode.qrCode(),
    data: data,
    width: size,
    height: size,
    color: Colors.black,
  ),
);

void _copy(BuildContext context, String number) {
  Clipboard.setData(ClipboardData(text: number));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(context.t.qrCopied),
      duration: const Duration(seconds: 2),
    ),
  );
}

Future<void> showJazzCashQrSheet(
  BuildContext context,
  String number,
  String shopName,
) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder:
        (ctx) => Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ctx.t.jqSheetTitle,
                style: Theme.of(
                  ctx,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              if (shopName.trim().isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  ctx.shopText(shopName.trim()),
                  style: TextStyle(
                    color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              const SizedBox(height: 18),
              _qrBox(number, 240),
              const SizedBox(height: 14),
              Text(
                _spaced(number),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                ctx.t.jqSheetHint,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.tonalIcon(
                onPressed: () => _copy(ctx, number),
                icon: const Icon(Icons.copy, size: 18),
                label: Text(ctx.t.jqCopy),
              ),
            ],
          ),
        ),
  );
}

class JazzCashQrSuffix extends StatelessWidget {
  final TextEditingController controller;
  final String Function() shopName;

  const JazzCashQrSuffix({
    super.key,
    required this.controller,
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final number = cleanJazzCashNumber(value.text);
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child:
              number == null
                  ? const SizedBox(key: ValueKey('none'), width: 14)
                  : Padding(
                    key: const ValueKey('qr'),
                    padding: const EdgeInsets.only(left: 14, right: 10),
                    child: Tooltip(
                      message: context.t.jqOpenFull,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap:
                            () => showJazzCashQrSheet(
                              context,
                              number,
                              shopName(),
                            ),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                          ),
                          child: BarcodeWidget(
                            barcode: Barcode.qrCode(),
                            data: number,
                            width: 34,
                            height: 34,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
        );
      },
    );
  }
}

class JazzCashStatus extends StatelessWidget {
  final TextEditingController controller;

  const JazzCashStatus({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        if (value.text.trim().isEmpty ||
            cleanJazzCashNumber(value.text) != null) {
          return const SizedBox.shrink();
        }
        final color = Colors.amber.shade800;
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 4),
          child: Row(
            children: [
              Icon(Icons.error_outline, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                context.t.jqCheck,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
