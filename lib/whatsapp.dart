import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendWhatsApp(String phone, String message) async {
  final cleanPhone = phone.replaceAll(RegExp(r'[^0-9]'), '');
  final uri = Uri.parse(
    'https://wa.me/$cleanPhone?text=${Uri.encodeComponent(message)}',
  );
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    await Share.share(message);
  }
}
