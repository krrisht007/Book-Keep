import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'l10n/l10n.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'customer_detail_screen.dart';
import 'config.dart';
import 'widgets/app_style.dart';
import 'widgets/money.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  List<dynamic> customerResults = [];
  List<dynamic> billResults = [];
  bool isLoading = false;
  bool hasSearched = false;
  bool hasError = false;
  Timer? _debounce;

  void onQueryChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => runSearch(v));
  }

  Future<void> runSearch(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        customerResults = [];
        billResults = [];
        hasSearched = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final response = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/search?q=${Uri.encodeQueryComponent(query)}',
        ),
      );
      if (response.statusCode == 200 &&
          mounted &&
          _controller.text.trim() == query.trim()) {
        final data = jsonDecode(response.body);
        setState(() {
          customerResults = data['customers'];
          billResults = data['bills'];
          isLoading = false;
          hasSearched = true;
        });
      } else if (mounted) {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: FloatingAppBar(
        titleWidget: TextField(
          controller: _controller,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: context.t.srHint,
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
            border: InputBorder.none,
            suffixIcon:
                _controller.text.isEmpty
                    ? null
                    : AppIconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      tooltip: context.t.clearSearch,
                      onPressed: () {
                        _debounce?.cancel();
                        _controller.clear();
                        runSearch('');
                        setState(() {});
                      },
                    ),
          ),
          onChanged: (v) {
            onQueryChanged(v);
            setState(() {});
          },
        ),
      ),
      body:
          isLoading
              ? Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              )
              : hasError
              ? errorRetry(
                context.t.srFailed,
                () => runSearch(_controller.text),
              )
              : !hasSearched
              ? _placeholder(
                icon: Icons.search,
                title: context.t.srTitle,
                subtitle: context.t.srSubtitle,
              )
              : (customerResults.isEmpty && billResults.isEmpty)
              ? _placeholder(
                icon: Icons.manage_search,
                title: context.t.srNoMatches(_controller.text.trim()),
                subtitle: context.t.srTryDifferent,
              )
              : ListView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
                children: [
                  if (customerResults.isNotEmpty) ...[
                    _sectionHeader(
                      Icons.people_outline,
                      context.t.navCustomers,
                      theme.colorScheme.primary,
                      customerResults.length,
                    ),
                    const SizedBox(height: 8),
                    ...customerResults.map((c) {
                      final name = context.partyName(c['name']);
                      final initial =
                          name.trim().isNotEmpty
                              ? name.trim()[0].toUpperCase()
                              : '?';
                      return AvatarListRow(
                        title: name,
                        subtitle: c['phone'] ?? context.t.noPhone,
                        initial: initial,
                        avatarColor: AppStyle.colorForKey(c['id']),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => CustomerDetailScreen(
                                    customerId: c['id'],
                                    customerName: c['name'],
                                    customerPhone: c['phone'],
                                  ),
                            ),
                          );
                        },
                      );
                    }),
                    const SizedBox(height: 18),
                  ],
                  if (billResults.isNotEmpty) ...[
                    _sectionHeader(
                      Icons.receipt_long_outlined,
                      context.t.srBills,
                      Colors.orange.shade800,
                      billResults.length,
                    ),
                    const SizedBox(height: 8),
                    AppListCard(
                      rows:
                          billResults.map<Widget>((b) {
                            final paid = b['payment_status'] == 'paid';
                            return ListTile(
                              leading: IconBadge(
                                Icons.receipt_long_outlined,
                                Colors.orange.shade800,
                                size: 34,
                              ),
                              title: Text(
                                formatMoney(b['amount']),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                (b['items'] as String?)?.isNotEmpty == true
                                    ? b['items']
                                    : context.t.srNoItemList,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: (paid ? Colors.green : Colors.orange)
                                      .withValues(alpha: 0.16),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  b['payment_status'] ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        paid
                                            ? Colors.green.shade800
                                            : Colors.orange.shade800,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ],
              ),
    );
  }

  Widget _sectionHeader(IconData icon, String label, Color color, int count) {
    return Row(
      children: [
        IconBadge(icon, color, size: 30),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: color.withValues(alpha: _isDark ? 0.2 : 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$count',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _placeholder({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 48,
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _isDark ? Colors.white60 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
