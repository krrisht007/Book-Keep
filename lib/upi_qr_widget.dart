import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class JazzCashQrWidget extends StatelessWidget {
  final String jazzcashNumber;
  final double amount;

  const JazzCashQrWidget({
    super.key,
    required this.jazzcashNumber,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    if (jazzcashNumber.trim().isEmpty) {
      final dark = AppStyle.isDark(context);
      final accent = dark ? Colors.amber.shade300 : Colors.amber.shade900;
      return Card(
        color: AppStyle.tint(context, Colors.amber),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: accent),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.t.qrNoNumber,
                  style: TextStyle(color: accent, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.qr_code_2, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  context.t.qrPay,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outlineVariant),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: jazzcashNumber.trim(),
                width: 170,
                height: 170,
                errorBuilder:
                    (context, error) => SizedBox(
                      height: 170,
                      child: Center(child: Text(context.t.qrInvalid)),
                    ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.t.qrAmount(formatMoney(amount, decimals: 2)),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.t.qrNumber(jazzcashNumber.trim()),
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AppIconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  tooltip: context.t.qrCopy,
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: jazzcashNumber.trim()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.t.qrCopied),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              context.t.qrHint,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
