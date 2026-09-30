import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'api.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'app_update.dart';
import 'config.dart';
import 'app_state.dart';
import 'account_screen.dart';
import 'privacy_policy_screen.dart';
import 'admin_screen.dart';
import 'auth/auth_service.dart';
import 'notifications_screen.dart';
import 'backup_screen.dart';
import 'language_screen.dart';
import 'gstin_utils.dart';
import 'jazzcash_qr_card.dart';
import 'phone_utils.dart';
import 'sync_service.dart';
import 'widgets/app_style.dart';
import 'native_theme.dart';
import 'l10n/l10n.dart';

class _HealthStat {
  final IconData icon;
  final String label;
  final String value;
  final bool ok;
  const _HealthStat(this.icon, this.label, this.value, {required this.ok});
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  final _shopFormKey = GlobalKey<FormState>();
  final _shopNameController = TextEditingController();
  final _shopAddressController = TextEditingController();
  final _shopPhoneController = TextEditingController();
  final _jazzcashController = TextEditingController();
  String _langFieldsFor = '';
  String _shownName = '';
  String _shownAddress = '';

  ThemeMode _themeMode = ThemeMode.system;
  bool _isLoading = true;
  String? _username;
  bool _usernameLoaded = false;
  bool _isSaving = false;
  bool _justSaved = false;

  final Map<String, String> _lastLoadedShop = {};

  bool get _shopProfileDirty =>
      _shopNameController.text != _shownName ||
      _shopAddressController.text != _shownAddress ||
      _shopPhoneController.text != (_lastLoadedShop['shop_phone'] ?? '') ||
      _jazzcashController.text != (_lastLoadedShop['upi_id'] ?? '');

  String? _existingLogoUrl;
  Uint8List? _pickedLogoBytes;
  bool _uploadingLogo = false;

  bool _isAdmin = false;

  Map<String, dynamic>? _health;
  bool _loadingHealth = true;

  bool _expandShopProfile = true;
  bool _expandAppearance = false;
  bool _expandInsights = false;
  bool _expandToolsSync = false;
  bool _expandAccount = true;

  static const _kExpandShopProfile = 'settings_expand_shop_profile';
  static const _kExpandAppearance = 'settings_expand_appearance';
  static const _kExpandInsights = 'settings_expand_insights';
  static const _kExpandToolsSync = 'settings_expand_tools_sync';
  static const _kExpandAccount = 'settings_expand_account';

  Future<void> _loadExpandPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _expandShopProfile =
          prefs.getBool(_kExpandShopProfile) ?? _expandShopProfile;
      _expandAppearance =
          prefs.getBool(_kExpandAppearance) ?? _expandAppearance;
      _expandInsights = prefs.getBool(_kExpandInsights) ?? _expandInsights;
      _expandToolsSync = prefs.getBool(_kExpandToolsSync) ?? _expandToolsSync;
      _expandAccount = prefs.getBool(_kExpandAccount) ?? _expandAccount;
    });
  }

  Future<void> _setExpand(String prefKey, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefKey, value);
  }

  final _settingsSearchCtrl = TextEditingController();
  String _settingsQuery = '';

  final _shopProfileKey = GlobalKey();
  final _appearanceKey = GlobalKey();
  final _insightsKey = GlobalKey();
  final _toolsSyncKey = GlobalKey();
  final _accountKey = GlobalKey();

  List<(String, List<String>, VoidCallback, GlobalKey)>
  get _settingsSearchIndex => [
    (
      context.t.shopProfile,
      ['shop', 'name', 'address', 'phone', 'jazzcash', 'payment'],
      () => setState(() => _expandShopProfile = true),
      _shopProfileKey,
    ),
    (
      context.t.settingsAppearanceTitle,
      ['theme', 'dark mode', 'light mode', 'color'],
      () => setState(() => _expandAppearance = true),
      _appearanceKey,
    ),
    (
      context.t.insights,
      ['ai', 'briefing', 'insights'],
      () => setState(() => _expandInsights = true),
      _insightsKey,
    ),
    (
      context.t.settingsLanguageTitle,
      ['locale', 'translation'],
      () => setState(() => _expandToolsSync = true),
      _toolsSyncKey,
    ),
    (
      context.t.notifications,
      ['alerts', 'low stock', 'overdue', 'reminders'],
      () => setState(() => _expandToolsSync = true),
      _toolsSyncKey,
    ),
    (
      context.t.backupExport,
      ['restore', 'csv', 'database', 'export'],
      () => setState(() => _expandToolsSync = true),
      _toolsSyncKey,
    ),
    (
      context.t.adminPanel,
      ['accounts', 'staff', 'server', 'email', 'smtp'],
      () => setState(() => _expandToolsSync = true),
      _toolsSyncKey,
    ),
    (
      context.t.toolsSync,
      ['offline', 'sync'],
      () => setState(() => _expandToolsSync = true),
      _toolsSyncKey,
    ),
    (
      context.t.account,
      [
        'password',
        'username',
        'email',
        'sign in',
        'sign out',
        'delete account',
        'app lock',
        'pin',
        'biometric',
        'google',
      ],
      () => setState(() => _expandAccount = true),
      _accountKey,
    ),
  ];

  List<(String, List<String>, VoidCallback, GlobalKey)>
  get _settingsSearchResults {
    final q = _settingsQuery.trim().toLowerCase();
    if (q.isEmpty) return [];
    return _settingsSearchIndex
        .where((e) => e.$1 != context.t.adminPanel || _isAdmin)
        .where(
          (e) =>
              e.$1.toLowerCase().contains(q) || e.$2.any((k) => k.contains(q)),
        )
        .toList();
  }

  bool _sectionMatches(GlobalKey key) {
    if (_settingsQuery.trim().isEmpty) return true;
    return _settingsSearchResults.any((e) => e.$4 == key);
  }

  bool get _searching => _settingsQuery.trim().isNotEmpty;

  late final AnimationController _orbController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat(reverse: true);
  late final Animation<double> _orbDrift = Tween<double>(
    begin: -6,
    end: 6,
  ).animate(CurvedAnimation(parent: _orbController, curve: Curves.easeInOut));

  final _scrollController = ScrollController();
  final ValueNotifier<double> _scrollOffset = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _themeMode = themeModeNotifier.value;
    NameTranslator.instance.addListener(_onNamesChanged);
    _loadSettings();
    _checkAdminStatus();
    _loadUsername();
    _loadHealth();
    _loadExpandPrefs();
    _scrollController.addListener(
      () => _scrollOffset.value = _scrollController.offset,
    );
  }

  Future<void> _loadUsername() async {
    String? name;
    try {
      name = await AuthService.instance.currentUsername();
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _username = (name != null && name.trim().isNotEmpty) ? name.trim() : null;
      _usernameLoaded = true;
    });
  }

  Future<void> _refreshAll() =>
      Future.wait([_loadSettings(), _checkAdminStatus(), _loadHealth()]);

  @override
  void dispose() {
    _settingsSearchCtrl.dispose();
    _orbController.dispose();
    _scrollController.dispose();
    _scrollOffset.dispose();
    _shopNameController.dispose();
    _shopAddressController.dispose();
    _shopPhoneController.dispose();
    _jazzcashController.dispose();
    NameTranslator.instance.removeListener(_onNamesChanged);
    super.dispose();
  }

  void _snack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _loadSettings() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/settings'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            final dirty = _shopProfileDirty;
            if (!dirty) {
              _shopPhoneController.text = phoneDigits(data['shop_phone'] ?? '');
              _jazzcashController.text = data['upi_id'] ?? '';
            }
            _lastLoadedShop
              ..['shop_name'] = data['shop_name'] ?? ''
              ..['shop_address'] = data['shop_address'] ?? ''
              ..['shop_phone'] = phoneDigits(data['shop_phone'] ?? '')
              ..['upi_id'] = data['upi_id'] ?? '';
            _syncShopFields(force: !dirty);
            _existingLogoUrl = data['shop_logo_url'] as String?;
            final baseName = '${data['shop_name'] ?? ''}'.trim();
            AppConfig.shopName =
                baseName.isNotEmpty ? baseName : AppConfig.shopName;
            AppConfig.jazzcashNumber = _jazzcashController.text.trim();
          });
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('upi_id', AppConfig.jazzcashNumber);
        }
      }
    } catch (_) {
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _checkAdminStatus() async {
    try {
      final response = await http.get(
        Uri.parse('${AppConfig.baseUrl}/admin/status'),
        forceRefresh: true,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (mounted) setState(() => _isAdmin = data['is_admin'] == true);
      }
    } catch (_) {}
  }

  void _onNamesChanged() {
    if (mounted) setState(() {});
  }

  String _shownFor(String kind, String base) =>
      base.isEmpty || NameTranslator.lang == 'en'
          ? base
          : NameTranslator.instance.show(kind, base);

  void _syncShopFields({bool force = false}) {
    final changed = _langFieldsFor != NameTranslator.lang;
    _langFieldsFor = NameTranslator.lang;
    void fill(TextEditingController c, String kind, String base, bool isName) {
      final prev = isName ? _shownName : _shownAddress;
      if (!(force || changed || c.text == prev)) return;
      final shown = _shownFor(kind, base);
      c.text = shown;
      if (isName) {
        _shownName = shown;
      } else {
        _shownAddress = shown;
      }
    }

    fill(_shopNameController, 'shop', _lastLoadedShop['shop_name'] ?? '', true);
    fill(
      _shopAddressController,
      'address',
      _lastLoadedShop['shop_address'] ?? '',
      false,
    );
  }

  Future<bool> _saveLangOverride(String kind, String base, String value) async {
    final response = await http.put(
      Uri.parse('${AppConfig.baseUrl}/translate/override'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'language': NameTranslator.lang,
        'kind': kind,
        'text': base,
        'translated': value,
      }),
    );
    if (response.statusCode != 200) return false;
    await NameTranslator.instance.setLocal(kind, base, value);
    return true;
  }

  Future<void> _saveShop() async {
    if (!_shopFormKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    final english = NameTranslator.lang == 'en';
    var overrideFailed = false;
    final typedName = _shopNameController.text.trim();
    final typedAddress = _shopAddressController.text.trim();
    final baseName =
        english || (_lastLoadedShop['shop_name'] ?? '').isEmpty
            ? typedName
            : _lastLoadedShop['shop_name']!;
    final baseAddress =
        english || (_lastLoadedShop['shop_address'] ?? '').isEmpty
            ? typedAddress
            : _lastLoadedShop['shop_address']!;
    try {
      final response = await http.put(
        Uri.parse('${AppConfig.baseUrl}/settings'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'shop_name': baseName,
          'shop_address': baseAddress,
          'shop_phone': formatPhoneForSave(_shopPhoneController.text),
          'upi_id': _jazzcashController.text.trim(),
        }),
      );
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('shop_name', baseName);
        await prefs.setString('upi_id', _jazzcashController.text.trim());
        if (baseName.isNotEmpty) AppConfig.shopName = baseName;
        AppConfig.jazzcashNumber = _jazzcashController.text.trim();
        if (!english) {
          try {
            if (typedName != _shownName && baseName.isNotEmpty) {
              if (await _saveLangOverride('shop', baseName, typedName)) {
                _shownName = typedName;
              } else {
                overrideFailed = true;
              }
            }
            if (typedAddress != _shownAddress && baseAddress.isNotEmpty) {
              if (await _saveLangOverride(
                'address',
                baseAddress,
                typedAddress,
              )) {
                _shownAddress = typedAddress;
              } else {
                overrideFailed = true;
              }
            }
          } catch (_) {
            overrideFailed = true;
          }
        } else {
          _shownName = typedName;
          _shownAddress = typedAddress;
        }
        _lastLoadedShop
          ..['shop_name'] = baseName
          ..['shop_address'] = baseAddress
          ..['shop_phone'] = _shopPhoneController.text
          ..['upi_id'] = _jazzcashController.text;
      }
      if (mounted) {
        if (response.statusCode == 200 && overrideFailed) {
          _snack(context.t.couldNotSave(NameTranslator.lang));
        } else if (response.statusCode == 200) {
          _snack(context.t.shopDetailsSaved);
          setState(() => _justSaved = true);
          Future.delayed(const Duration(milliseconds: 1100), () {
            if (mounted) setState(() => _justSaved = false);
          });
        } else {
          _snack(context.t.saveFailed(response.statusCode));
        }
      }
    } catch (e) {
      if (mounted) _snack(context.t.couldNotSave('$e'));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _loadHealth() async {
    int missingPhoto = 0, missingBarcode = 0, totalItems = 0;
    int lowStockCount = 0;
    String? lastBackup;
    try {
      final itemsResp = await http.get(Uri.parse('${AppConfig.baseUrl}/items'));
      if (itemsResp.statusCode == 200) {
        final items = jsonDecode(itemsResp.body) as List;
        totalItems = items.length;
        for (final it in items) {
          if (it['image_url'] == null) missingPhoto++;
          if (it['barcode'] == null) missingBarcode++;
        }
      }
    } catch (_) {}
    try {
      final lowResp = await http.get(
        Uri.parse('${AppConfig.baseUrl}/reports/low-stock'),
      );
      if (lowResp.statusCode == 200) {
        lowStockCount = (jsonDecode(lowResp.body) as List).length;
      }
    } catch (_) {}
    bool backupVisible = false;
    try {
      final backupResp = await http.get(
        Uri.parse('${AppConfig.baseUrl}/backup/history'),
      );
      if (backupResp.statusCode == 200) {
        backupVisible = true;
        final backups =
            (jsonDecode(backupResp.body)['backups'] as List).cast<dynamic>();
        if (backups.isNotEmpty) {
          lastBackup = backups.first['created_at'] as String?;
        }
      }
    } catch (_) {}
    if (mounted) {
      setState(() {
        _health = {
          'totalItems': totalItems,
          'missingPhoto': missingPhoto,
          'missingBarcode': missingBarcode,
          'lowStockCount': lowStockCount,
          'lastBackup': lastBackup,
          'backupVisible': backupVisible,
        };
        _loadingHealth = false;
      });
    }
  }

  int _healthScore(Map<String, dynamic> h) {
    final total = h['totalItems'] as int;
    if (total == 0) return 100;
    final photoPct = (total - (h['missingPhoto'] as int)) / total;
    final barcodePct = (total - (h['missingBarcode'] as int)) / total;
    final lowStockOk = (h['lowStockCount'] as int) == 0 ? 1.0 : 0.5;
    final signals = [photoPct, barcodePct, lowStockOk];
    if (h['backupVisible'] == true) {
      final backupOk =
          h['lastBackup'] != null && _backupIsRecent(h['lastBackup'] as String)
              ? 1.0
              : 0.5;
      signals.add(backupOk);
    }
    final avg = signals.reduce((a, b) => a + b) / signals.length;
    return (avg * 100).round().clamp(0, 100);
  }

  Widget _healthScoreRing(int score) {
    final color =
        score >= 80
            ? Colors.green.shade600
            : score >= 50
            ? Colors.orange.shade700
            : Colors.red.shade600;
    return Row(
      children: [
        SizedBox(
          width: 54,
          height: 54,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: score / 100),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder:
                (context, value, child) => Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      strokeWidth: 5,
                      backgroundColor: color.withValues(alpha: 0.15),
                      valueColor: AlwaysStoppedAnimation(color),
                    ),
                    Text(
                      '${(value * 100).round()}%',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12.5,
                        color: color,
                      ),
                    ),
                  ],
                ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            score >= 80
                ? context.t.healthGood
                : score >= 50
                ? context.t.healthSome
                : context.t.healthMany,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _healthCard(BuildContext context) {
    final h = _health;
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBadge(Icons.favorite_border, Colors.pink.shade400, size: 34),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  context.t.shopHealth,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            context.t.healthIntro,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 12),
          if (_loadingHealth)
            const Center(child: CircularProgressIndicator())
          else if (h == null)
            Text(context.t.couldNotLoadCheckConnection)
          else ...[
            _healthScoreRing(_healthScore(h)),
            const SizedBox(height: 14),
            _healthGrid([
              _HealthStat(
                Icons.inventory_2_outlined,
                context.t.itemPhotos,
                '${h['totalItems'] - h['missingPhoto']}/${h['totalItems']}',
                ok: h['missingPhoto'] == 0,
              ),
              _HealthStat(
                Icons.qr_code_2,
                context.t.barcodes,
                '${h['totalItems'] - h['missingBarcode']}/${h['totalItems']}',
                ok: h['missingBarcode'] == 0,
              ),
              _HealthStat(
                Icons.warning_amber_rounded,
                context.t.lowStockItems,
                '${h['lowStockCount']}',
                ok: h['lowStockCount'] == 0,
              ),
              if (h['lastBackup'] != null)
                _HealthStat(
                  Icons.backup_outlined,
                  context.t.lastBackup,
                  _formatBackupAge(h['lastBackup'] as String),
                  ok: _backupIsRecent(h['lastBackup'] as String),
                ),
            ]),
          ],
        ],
      ),
    );
  }

  Widget _healthGrid(List<_HealthStat> stats) {
    final rows = <Widget>[];
    for (var i = 0; i < stats.length; i += 2) {
      final second = i + 1 < stats.length ? stats[i + 1] : null;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: i + 2 < stats.length ? 10 : 0),
          child: Row(
            children: [
              Expanded(child: _healthTile(stats[i])),
              const SizedBox(width: 10),
              Expanded(
                child: second != null ? _healthTile(second) : const SizedBox(),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }

  Widget _healthTile(_HealthStat stat) {
    final color = stat.ok ? Colors.green.shade600 : Colors.orange.shade700;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppStyle.tint(context, color, light: 0.08, dark: 0.18),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(stat.icon, size: 18, color: color),
          const SizedBox(height: 6),
          Text(
            stat.value,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
              color: color,
            ),
          ),
          Text(
            stat.label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _healthLine(
    IconData icon,
    String label,
    String value, {
    required bool ok,
  }) {
    final color = ok ? Colors.green.shade600 : Colors.orange.shade700;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w700, color: color),
          ),
        ],
      ),
    );
  }

  String _formatBackupAge(String isoString) {
    final dt = DateTime.tryParse(isoString);
    if (dt == null) return isoString;
    final days = DateTime.now().difference(dt).inDays;
    if (days <= 0) return context.t.today;
    if (days == 1) return context.t.yesterday;
    return context.t.daysAgo(days);
  }

  bool _backupIsRecent(String isoString) {
    final dt = DateTime.tryParse(isoString);
    if (dt == null) return false;
    return DateTime.now().difference(dt).inDays <= 2;
  }

  Widget _offlineStatusCard(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconBadge(
                Icons.cloud_sync_outlined,
                Colors.blue.shade600,
                size: 34,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  context.t.offlineStatus,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: SyncService.instance.isOnline,
                builder: (context, online, _) {
                  final color =
                      online ? Colors.green.shade600 : Colors.red.shade600;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppStyle.tint(
                        context,
                        color,
                        light: 0.12,
                        dark: 0.22,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          online ? Icons.wifi : Icons.wifi_off,
                          size: 13,
                          color: color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          online ? context.t.online : context.t.offline,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<int>(
            valueListenable: SyncService.instance.pendingCount,
            builder:
                (context, count, _) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _healthLine(
                      Icons.sync,
                      context.t.waitingToSync,
                      '$count',
                      ok: count == 0,
                    ),
                    if (count > 0) ...[
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.sync),
                        label: Text(context.t.syncNow),
                        onPressed: () => SyncService.instance.syncAll(),
                      ),
                    ],
                  ],
                ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickLogo() async {
    final picked = await pickImageFile(context);
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    setState(() => _pickedLogoBytes = bytes);

    setState(() => _uploadingLogo = true);
    try {
      final uri = Uri.parse('${AppConfig.baseUrl}/settings/logo');
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await http.authHeaders());
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: picked.name),
      );
      final streamed = await request.send().timeout(http.uploadTimeout);
      final response = await http.Response.fromStream(streamed);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            _existingLogoUrl = data['shop_logo_url'] as String?;
            _pickedLogoBytes = null;
          });
          _snack(context.t.logoUpdated);
        }
      } else if (mounted) {
        _snack(context.t.logoUploadFailed(response.statusCode));
      }
    } catch (e) {
      if (mounted) _snack(context.t.couldNotUploadLogo('$e'));
    } finally {
      if (mounted) setState(() => _uploadingLogo = false);
    }
  }

  Future<void> _setTheme(ThemeMode mode) async {
    HapticFeedback.selectionClick();
    setState(() => _themeMode = mode);
    themeModeNotifier.value = mode;
    final name = themeModeByName.entries.firstWhere((e) => e.value == mode).key;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', name);
    unawaited(syncNativeNightMode(mode));
  }

  Widget _themeDial(ThemeMode mode, IconData icon) {
    final selected = _themeMode == mode;
    final primary = Theme.of(context).colorScheme.primary;
    return Pressable(
      child: Semantics(
        button: true,
        selected: selected,
        child: GestureDetector(
          onTap: () => _setTheme(mode),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: const Alignment(-0.3, -0.3),
                    colors:
                        selected
                            ? [Colors.grey.shade700, Colors.grey.shade900]
                            : [Colors.grey.shade400, Colors.grey.shade600],
                  ),
                  border: Border.all(color: Colors.black26, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                    if (selected)
                      BoxShadow(
                        color: primary.withValues(alpha: 0.7),
                        blurRadius: 16,
                        spreadRadius: 1,
                      ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? primary : Colors.white30,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      icon,
                      size: 18,
                      color: selected ? primary : Colors.white54,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                {
                  ThemeMode.light: context.t.themeLight,
                  ThemeMode.dark: context.t.themeDark,
                  ThemeMode.system: context.t.themeSystem,
                }[mode]!,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: selected ? primary : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _syncShopFields();
    return RefreshIndicator(
      onRefresh: _refreshAll,
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        cacheExtent: 5000,
        children: [
          _heroHeader(context),
          const SizedBox(height: 16),
          GlassSearchBar(
            controller: _settingsSearchCtrl,
            hintText: context.t.searchSettings,
            onChanged: (v) => setState(() => _settingsQuery = v),
          ),
          if (_settingsQuery.isNotEmpty && _settingsSearchResults.isEmpty) ...[
            const SizedBox(height: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: Padding(
                key: ValueKey('empty-$_settingsQuery'),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  context.t.noSettingsMatch(_settingsQuery),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 20),
          if (_sectionMatches(_shopProfileKey)) ...[
            KeyedSubtree(
              key: _shopProfileKey,
              child: ListenableBuilder(
                listenable: Listenable.merge([
                  _shopNameController,
                  _shopAddressController,
                  _shopPhoneController,
                  _jazzcashController,
                ]),
                builder:
                    (context, _) => _groupHeader(
                      context.t.shopProfile,
                      icon: Icons.storefront_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      expanded: _searching || _expandShopProfile,
                      showDot: _shopProfileDirty,
                      onToggle: () {
                        setState(
                          () => _expandShopProfile = !_expandShopProfile,
                        );
                        _setExpand(_kExpandShopProfile, _expandShopProfile);
                      },
                    ),
              ),
            ),
            _collapsible(
              _searching || _expandShopProfile,
              Column(
                children: [
                  const SizedBox(height: 8),
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _shopFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconBadge(
                                Icons.storefront_outlined,
                                Theme.of(context).colorScheme.primary,
                                size: 34,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  context.t.settingsShopDetailsTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              AppIconButton(
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 180),
                                  transitionBuilder:
                                      (child, anim) => ScaleTransition(
                                        scale: anim,
                                        child: child,
                                      ),
                                  child:
                                      _isSaving
                                          ? const SizedBox(
                                            key: ValueKey('saving'),
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                          : _justSaved
                                          ? Icon(
                                            Icons.check_circle,
                                            key: const ValueKey('saved'),
                                            color: Colors.green.shade600,
                                          )
                                          : const Icon(
                                            Icons.save_outlined,
                                            key: ValueKey('idle'),
                                          ),
                                ),
                                tooltip: context.t.settingsSaveShopDetails,
                                onPressed:
                                    _isSaving || _isLoading ? null : _saveShop,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            context.t.settingsShopDetailsSubtitle,
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 20),
                          _formSectionLabel(context.t.businessInfo),
                          _field(
                            _shopNameController,
                            context.t.settingsShopNameLabel,
                            icon: Icons.storefront_outlined,
                            validator:
                                (v) =>
                                    (v == null || v.trim().isEmpty)
                                        ? context.t.shopNameRequired
                                        : null,
                          ),
                          const SizedBox(height: 12),
                          _field(
                            _shopAddressController,
                            context.t.settingsShopAddressLabel,
                            icon: Icons.location_on_outlined,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 12),
                          _field(
                            _shopPhoneController,
                            context.t.settingsPhoneLabel,
                            icon: Icons.call_outlined,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [PhoneDigitsFormatter()],
                            prefixText: '$phoneFieldPrefix ',
                            validator: (v) {
                              final digits = (v ?? '').replaceAll(
                                RegExp(r'[^0-9]'),
                                '',
                              );
                              if (digits.isEmpty) return null;
                              if (digits.length != phoneLocalDigits) {
                                return context.t.phoneIncomplete(
                                  phoneLocalDigits,
                                );
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          _formSectionLabel(context.t.payment),
                          _field(
                            _jazzcashController,
                            context.t.jazzcashOptional,
                            icon: Icons.phone_android_outlined,
                            keyboardType: TextInputType.phone,
                            validator: validateJazzCashNumber,
                            suffixIcon: JazzCashQrSuffix(
                              controller: _jazzcashController,
                              shopName:
                                  () =>
                                      _lastLoadedShop['shop_name'] ??
                                      _shopNameController.text,
                            ),
                          ),
                          JazzCashStatus(controller: _jazzcashController),
                          const SizedBox(height: 16),
                          GradientButton(
                            icon:
                                _justSaved
                                    ? Icons.check_circle
                                    : Icons.save_outlined,
                            label:
                                _justSaved
                                    ? context.t.saved
                                    : context.t.settingsSaveShopDetails,
                            loading: _isSaving,
                            onPressed:
                                _isSaving || _isLoading ? null : _saveShop,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_sectionMatches(_appearanceKey)) ...[
            const SizedBox(height: 24),
            KeyedSubtree(
              key: _appearanceKey,
              child: _groupHeader(
                context.t.settingsAppearanceTitle,
                icon: Icons.palette_outlined,
                color: Theme.of(context).colorScheme.secondary,
                expanded: _searching || _expandAppearance,
                onToggle: () {
                  setState(() => _expandAppearance = !_expandAppearance);
                  _setExpand(_kExpandAppearance, _expandAppearance);
                },
              ),
            ),
            _collapsible(
              _searching || _expandAppearance,
              Column(
                children: [
                  const SizedBox(height: 8),
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconBadge(
                              Icons.palette_outlined,
                              Theme.of(context).colorScheme.secondary,
                              size: 34,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                context.t.settingsAppearanceTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          context.t.settingsAppearanceSubtitle,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _themeDial(
                              ThemeMode.light,
                              Icons.light_mode_rounded,
                            ),
                            _themeDial(ThemeMode.dark, Icons.dark_mode_rounded),
                            _themeDial(
                              ThemeMode.system,
                              Icons.brightness_auto_rounded,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_sectionMatches(_insightsKey)) ...[
            const SizedBox(height: 24),
            KeyedSubtree(
              key: _insightsKey,
              child: _groupHeader(
                context.t.insights,
                icon: Icons.auto_awesome_outlined,
                color: Colors.pink.shade400,
                expanded: _searching || _expandInsights,
                onToggle: () {
                  setState(() => _expandInsights = !_expandInsights);
                  _setExpand(_kExpandInsights, _expandInsights);
                },
              ),
            ),
            _collapsible(
              _searching || _expandInsights,
              Column(
                children: [const SizedBox(height: 8), _healthCard(context)],
              ),
            ),
          ],
          if (_sectionMatches(_toolsSyncKey)) ...[
            const SizedBox(height: 24),
            KeyedSubtree(
              key: _toolsSyncKey,
              child: _groupHeader(
                context.t.toolsSync,
                icon: Icons.cloud_sync_outlined,
                color: Colors.blue.shade600,
                expanded: _searching || _expandToolsSync,
                onToggle: () {
                  setState(() => _expandToolsSync = !_expandToolsSync);
                  _setExpand(_kExpandToolsSync, _expandToolsSync);
                },
              ),
            ),
            _collapsible(
              _searching || _expandToolsSync,
              Column(
                children: [
                  const SizedBox(height: 8),
                  _offlineStatusCard(context),
                  const SizedBox(height: 12),
                  AppListCard(
                    rows: [
                      Pressable(
                        child: ListTile(
                          leading: IconBadge(
                            Icons.language,
                            Theme.of(context).colorScheme.primary,
                            size: 38,
                          ),
                          title: Text(context.t.settingsLanguageTitle),
                          subtitle: Text(context.t.languageSubtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LanguageScreen(),
                                ),
                              ),
                        ),
                      ),
                      Pressable(
                        child: ListTile(
                          leading: IconBadge(
                            Icons.notifications_active_outlined,
                            Theme.of(context).colorScheme.primary,
                            size: 38,
                          ),
                          title: Text(context.t.notifications),
                          subtitle: Text(context.t.notificationsSubtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NotificationsScreen(),
                                ),
                              ),
                        ),
                      ),
                      Pressable(
                        child: ListTile(
                          leading: IconBadge(
                            Icons.backup_outlined,
                            Theme.of(context).colorScheme.primary,
                            size: 38,
                          ),
                          title: Text(context.t.backupExport),
                          subtitle: Text(context.t.backupSubtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const BackupScreen(),
                                ),
                              ),
                        ),
                      ),
                      Pressable(
                        child: ListTile(
                          leading: IconBadge(
                            Icons.system_update_outlined,
                            Theme.of(context).colorScheme.primary,
                            size: 38,
                          ),
                          title: Text(context.t.appUpdate),
                          subtitle: Text(context.t.appUpdateSubtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => checkForUpdate(context, manual: true),
                        ),
                      ),
                      if (_isAdmin)
                        Pressable(
                          child: ListTile(
                            leading: IconBadge(
                              Icons.admin_panel_settings,
                              Theme.of(context).colorScheme.primary,
                              size: 38,
                            ),
                            title: Text(context.t.adminPanel),
                            subtitle: Text(context.t.adminSubtitle),
                            trailing: const Icon(Icons.chevron_right),
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const AdminScreen(),
                                  ),
                                ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          if (AppConfig.firebaseReady && _sectionMatches(_accountKey)) ...[
            const SizedBox(height: 24),
            KeyedSubtree(
              key: _accountKey,
              child: _groupHeader(
                context.t.account,
                icon: Icons.person_outline,
                color: Theme.of(context).colorScheme.primary,
                expanded: _searching || _expandAccount,
                showDot: !AuthService.instance.isEmailVerified,
                onToggle: () {
                  setState(() => _expandAccount = !_expandAccount);
                  _setExpand(_kExpandAccount, _expandAccount);
                },
              ),
            ),
            _collapsible(
              _searching || _expandAccount,
              Column(
                children: [
                  const SizedBox(height: 8),
                  AppListCard(
                    rows: [
                      Pressable(
                        child: ListTile(
                          leading: IconBadge(
                            Icons.person_outline,
                            Theme.of(context).colorScheme.primary,
                            size: 38,
                          ),
                          title: Text(context.t.account),
                          subtitle: Text(
                            AuthService.instance.userEmail ??
                                context.t.accountSubtitle,
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AccountScreen(),
                                ),
                              ).then((_) => _loadUsername()),
                        ),
                      ),
                      Pressable(
                        child: ListTile(
                          leading: IconBadge(
                            Icons.privacy_tip_outlined,
                            Theme.of(context).colorScheme.primary,
                            size: 38,
                          ),
                          title: Text(context.t.privacyPolicy),
                          subtitle: Text(context.t.privacySubtitle),
                          trailing: const Icon(Icons.chevron_right),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PrivacyPolicyScreen(),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 28),
          _brandFooter(context),
        ],
      ),
    );
  }

  Widget _driftingOrb({
    required double size,
    required Color color,
    required double top,
    required double left,
    double parallaxFactor = 0.0,
  }) {
    return AnimatedBuilder(
      animation: Listenable.merge([_orbDrift, _scrollOffset]),
      builder:
          (context, child) => Positioned(
            top: top - _orbDrift.value - _scrollOffset.value * parallaxFactor,
            left: left + _orbDrift.value,
            child: child!,
          ),
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

  Widget _heroHeader(BuildContext context) {
    final theme = Theme.of(context);
    final dark = AppStyle.isDark(context);
    final primary = theme.colorScheme.primary;
    final secondary = theme.colorScheme.secondary;
    final typedShopName =
        (_lastLoadedShop['shop_name'] ?? '').trim().isNotEmpty
            ? _lastLoadedShop['shop_name']!.trim()
            : AppConfig.shopName.trim();
    final shopName =
        typedShopName.isNotEmpty
            ? context.shopText(typedShopName)
            : context.t.yourShop;
    final accountLine =
        _usernameLoaded
            ? (_username ??
                AuthService.instance.userEmail ??
                AuthService.instance.displayName)
            : null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppStyle.raisedShadow(context, strength: 0.7),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                        dark
                            ? [secondary, primary]
                            : [
                              primary,
                              Color.lerp(primary, Colors.black, 0.35)!,
                            ],
                  ),
                ),
              ),
              _driftingOrb(
                size: 70,
                color: Colors.white,
                top: -24,
                left: -16,
                parallaxFactor: 0.4,
              ),
              _driftingOrb(
                size: 110,
                color: Color.lerp(primary, Colors.white, 0.5)!,
                top: -40,
                left: 260,
                parallaxFactor: 0.15,
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    _heroLogo(context),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            shopName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 19,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (accountLine != null) ...[
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.fromLTRB(8, 5, 14, 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withValues(
                                        alpha: 0.25,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.person_rounded,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      accountLine,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.4,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heroLogo(BuildContext context) {
    Widget content;
    if (_pickedLogoBytes != null) {
      content = Image.memory(_pickedLogoBytes!, fit: BoxFit.cover);
    } else if (_existingLogoUrl != null && _existingLogoUrl!.isNotEmpty) {
      content = Image.network(
        AppConfig.mediaUrl(_existingLogoUrl!),
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stack) => const Icon(
              Icons.storefront_outlined,
              color: Colors.white,
              size: 26,
            ),
      );
    } else {
      content = const Icon(
        Icons.storefront_outlined,
        color: Colors.white,
        size: 26,
      );
    }
    return Semantics(
      button: true,
      label:
          _uploadingLogo ? context.t.uploadingLogo : context.t.logoTapToChange,
      child: GestureDetector(
        onTap: _uploadingLogo ? null : _pickLogo,
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.18),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.6),
              width: 1.5,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child:
              _uploadingLogo
                  ? const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                  )
                  : content,
        ),
      ),
    );
  }

  Widget _ornamentLine(ThemeData theme) => Container(
    width: 34,
    height: 1,
    color: theme.colorScheme.primary.withValues(alpha: 0.35),
  );

  bool _latinScript(BuildContext context) =>
      !{
        'ar',
        'ur',
        'fa',
        'ps',
        'sd',
        'hi',
        'bn',
        'pa',
        'ja',
        'ko',
        'zh',
      }.contains(Localizations.localeOf(context).languageCode);

  Widget _brandFooter(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Opacity(
            opacity: 0.55,
            child: Image.asset(
              theme.brightness == Brightness.dark
                  ? 'assets/logo/title_icon_dark.png'
                  : 'assets/logo/title_icon.png',
              width: 28,
              height: 28,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ornamentLine(theme),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '✦',
                  style: TextStyle(
                    fontSize: 10,
                    color: theme.colorScheme.primary.withValues(alpha: 0.7),
                  ),
                ),
              ),
              _ornamentLine(theme),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Book-keep',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 13,
              letterSpacing: 1.6,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            context.t.brandTagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              fontStyle: _latinScript(context) ? FontStyle.italic : null,
              letterSpacing: _latinScript(context) ? 0.3 : 0,
              color: theme.colorScheme.primary.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _collapsible(bool expanded, Widget body) {
    return AnimatedCrossFade(
      firstChild: const SizedBox(width: double.infinity),
      secondChild: body,
      crossFadeState:
          expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 220),
      sizeCurve: Curves.easeInOut,
    );
  }

  Widget _groupHeader(
    String title, {
    required IconData icon,
    required Color color,
    required bool expanded,
    required VoidCallback onToggle,
    bool showDot = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        HapticFeedback.selectionClick();
        onToggle();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            IconBadge(icon, color, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 8),
            AnimatedScale(
              scale: showDot ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
            ),
            const SizedBox(width: 8),
            AnimatedRotation(
              turns: expanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              child: Icon(
                Icons.expand_more,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    IconData? icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? prefixText,
    String? helperText,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    TextCapitalization textCapitalization = TextCapitalization.none,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      validator: validator,
      maxLines: maxLines,
      decoration: appInputDecoration(
        context,
        label: label,
        icon: icon,
        prefixText: prefixText,
        helperText: helperText,
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _formSectionLabel(String text) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 14,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
