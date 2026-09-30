import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state.dart';
import 'widgets/app_style.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _select(String code) async {
    localeNotifier.value = Locale(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale_code', code);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final current = Localizations.localeOf(context).languageCode;
    final query = _query.trim().toLowerCase();
    final codes =
        query.isEmpty
            ? localeLabel.keys.toList()
            : localeLabel.keys
                .where((c) => localeLabel[c]!.toLowerCase().contains(query))
                .toList();
    return Scaffold(
      appBar: FloatingAppBar(title: t.settingsLanguageTitle),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
                ],
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    t.settingsLanguageSubtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GlassSearchBar(
            controller: _searchCtrl,
            hintText: context.t.lgSearch,
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 12),
          if (codes.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  context.t.lgNoMatch(_query),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            )
          else
            AppListCard(
              rows: [
                for (final code in codes)
                  _LanguageRow(
                    code: code,
                    selected: code == current,
                    onTap: () => _select(code),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _LanguageRow extends StatelessWidget {
  final String code;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageRow({
    required this.code,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Semantics(
      button: true,
      selected: selected,
      child: Container(
        color: selected ? primary.withValues(alpha: 0.08) : null,
        child: ListTile(
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  selected
                      ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [primary, primary.withValues(alpha: 0.6)],
                      )
                      : null,
              color:
                  selected
                      ? null
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
              boxShadow:
                  selected
                      ? [
                        BoxShadow(
                          color: primary.withValues(alpha: 0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ]
                      : null,
            ),
            alignment: Alignment.center,
            child: Text(
              code.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : Colors.grey.shade700,
              ),
            ),
          ),
          title: Text(
            localeLabel[code]!,
            style: TextStyle(
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected ? primary : null,
            ),
          ),
          trailing: selected ? Icon(Icons.check_circle, color: primary) : null,
          onTap: onTap,
        ),
      ),
    );
  }
}
