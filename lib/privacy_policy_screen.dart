import 'package:flutter/material.dart';

import 'l10n/l10n.dart';

const _lastUpdated = '[DATE — fill in before publishing]';
const _owner = '[LEGAL ENTITY / OWNER NAME]';
const _supportEmail = '[SUPPORT EMAIL]';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final settings = t.navSettings;
    return Scaffold(
      appBar: AppBar(title: Text(t.privacyPolicy)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Book-keep',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              t.ppUpdated(_lastUpdated),
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 20),
            _Heading(t.ppWhoH),
            _Body(t.ppWho(_owner, _supportEmail)),
            _Heading(t.ppCollectH),
            _Body(t.ppCollectAccount),
            _Body(t.ppCollectShop),
            _Body(t.ppCollectRecords),
            _Body(t.ppCollectDevice),
            _Body(t.ppCollectAi(t.askYourShop)),
            _Heading(t.ppDontH),
            _Bullet(t.ppDontLocation),
            _Bullet(t.ppDontAds),
            _Bullet(t.ppDontSell),
            _Heading(t.ppWhereH),
            _Bullet(t.ppWhereDb),
            _Bullet(t.ppWhereFirebase),
            _Bullet(t.ppWhereAi),
            _Bullet(t.ppWhereEmail(t.adminPanel)),
            _Heading(t.ppYoursH),
            _Body(t.ppYours),
            _Heading(t.ppControlsH),
            _Bullet(t.ppControlExport('$settings → ${t.backupExport}')),
            _Bullet(
              t.ppControlDelete(
                '$settings → ${t.account} → ${t.acctDeleteAccount}',
              ),
            ),
            _Bullet(t.ppControlNotif('$settings → ${t.notifications}')),
            _Heading(t.ppChildrenH),
            _Body(t.ppChildren),
            _Heading(t.ppChangesH),
            _Body(t.ppChanges),
            _Heading(t.ppContactH),
            _Body(t.ppContact(_supportEmail)),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String text;
  const _Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String text;
  const _Body(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', style: TextStyle(fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
