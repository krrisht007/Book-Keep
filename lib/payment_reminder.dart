import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import 'config.dart';
import 'upi_qr_widget.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

Future<void> showPaymentReminderSheet({
  required BuildContext context,
  required String customerName,
  required String? phone,
  required double outstanding,
}) async {
  if (outstanding <= 0) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(context.t.cpNoOutstanding)));
    return;
  }

  int selectedTone = 1;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          String buildMessage(int tone) {
            final t = context.t;
            final shop = AppConfig.shopName;
            final amount = formatMoney(outstanding, decimals: 2);
            var baseMsg = switch (tone) {
              0 => t.msgReminderGentle(amount, customerName, shop),
              2 => t.msgReminderUrgent(amount, customerName, shop),
              _ => t.msgReminderStandard(amount, customerName, shop),
            };
            if (AppConfig.jazzcashNumber.isNotEmpty) {
              baseMsg +=
                  '\n\n${t.msgPayViaJazzCash(AppConfig.jazzcashNumber.trim())}';
            }
            return baseMsg;
          }

          final currentText = buildMessage(selectedTone);

          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.t.prSend,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      AppIconButton(
                        icon: const Icon(Icons.close),
                        tooltip: context.t.close,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.t.prTone,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  SegmentedButton<int>(
                    segments: [
                      ButtonSegment(value: 0, label: Text(context.t.prPolite)),
                      ButtonSegment(
                        value: 1,
                        label: Text(context.t.prStandard),
                      ),
                      ButtonSegment(value: 2, label: Text(context.t.prUrgent)),
                    ],
                    selected: {selectedTone},
                    onSelectionChanged: (val) {
                      setModalState(() => selectedTone = val.first);
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppStyle.borderColor(context)),
                    ),
                    child: Text(
                      currentText,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (AppConfig.jazzcashNumber.isNotEmpty) ...[
                    OutlinedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder:
                              (_) => Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: JazzCashQrWidget(
                                  jazzcashNumber: AppConfig.jazzcashNumber,
                                  amount: outstanding,
                                ),
                              ),
                        );
                      },
                      icon: const Icon(Icons.qr_code),
                      label: Text(context.t.prPreviewQr),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(42),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            Navigator.pop(context);
                            final cleanPhone = (phone ?? '').replaceAll(
                              RegExp(r'[^0-9]'),
                              '',
                            );
                            final encoded = Uri.encodeComponent(currentText);
                            final waUri = Uri.parse(
                              'https://wa.me/$cleanPhone?text=$encoded',
                            );
                            if (await canLaunchUrl(waUri)) {
                              await launchUrl(
                                waUri,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              await Share.share(currentText);
                            }
                          },
                          icon: const Icon(Icons.send),
                          label: const Text('WhatsApp'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF25D366),
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(44),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            Navigator.pop(context);
                            final cleanPhone = (phone ?? '').replaceAll(
                              RegExp(r'[^0-9]'),
                              '',
                            );
                            var smsUri = Uri(
                              scheme: 'sms',
                              path: cleanPhone,
                              queryParameters: {'body': currentText},
                            );
                            if (Platform.isIOS) {
                              smsUri = Uri.parse(
                                smsUri.toString().replaceFirst('?', '&'),
                              );
                            }
                            if (await canLaunchUrl(smsUri)) {
                              await launchUrl(smsUri);
                            } else {
                              await Share.share(currentText);
                            }
                          },
                          icon: const Icon(Icons.sms_outlined),
                          label: const Text('SMS'),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(44),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      Share.share(currentText);
                    },
                    icon: const Icon(Icons.share),
                    label: Text(context.t.prShareText),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
