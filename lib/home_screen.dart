import 'dart:async';
import 'dart:math' show Random;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'ask_voice.dart';
import 'dart:convert';
import 'api.dart' as http;
import 'config.dart';
import 'add_bill_screen.dart';
import 'add_customer_screen.dart';
import 'reconciliation_screen.dart';
import 'items_screen.dart';
import 'expenses_screen.dart';
import 'customer_detail_screen.dart';
import 'dues_screen.dart';
import 'add_purchase_screen.dart';
import 'scan_bill_screen.dart';
import 'sync_service.dart';
import 'walk_in_customer.dart';
import 'whatsapp.dart';
import 'widgets/adaptive_column.dart';
import 'widgets/app_style.dart';
import 'widgets/voice_settings_sheet.dart';
import 'widgets/money.dart';
import 'widgets/thinking_orb.dart';
import 'l10n/l10n.dart';
import 'date_locale.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onGoToCustomers;
  final VoidCallback onGoToItems;
  final VoidCallback onGoToReports;

  const HomeScreen({
    super.key,
    required this.onGoToCustomers,
    required this.onGoToItems,
    required this.onGoToReports,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<dynamic> outstanding = [];
  List<dynamic> monthly = [];
  List<dynamic> profitMonthly = [];
  List<dynamic> lowStock = [];
  List<dynamic> expenseCategories = [];
  List<dynamic> topRevenueItems = [];
  int customerCount = 0;
  double cashToday = 0;

  DateTime _selectedMonth = DateTime.now();
  Map<String, dynamic> itemsById = {};
  Map<String, dynamic> suppliersById = {};
  bool _showTopItems = true;
  bool _showExpenses = true;
  bool _showLowStock = true;
  bool _showOutstanding = true;
  bool _showQuickActions = true;

  static const _fieldKeys = [
    'outstanding',
    'monthly',
    'customers',
    'lowStock',
    'profitMonthly',
    'cashToday',
    'expenses',
    'topRevenue',
    'items',
    'suppliers',
  ];
  final Set<String> _loadedFields = {};
  final Set<String> _failedFields = {};

  bool get isLoading => _loadedFields.isEmpty && _failedFields.isEmpty;

  bool get hasError =>
      _loadedFields.isEmpty && _failedFields.length == _fieldKeys.length;

  String? _briefingText;
  DateTime? _briefingGeneratedAt;
  bool _briefingRefreshing = false;

  int _tabIndex = 0;

  final _askController = TextEditingController();
  String? _askAnswer;
  bool _asking = false;
  OrbStyle _askOrbStyle = OrbStyle.working;
  bool _sendPressed = false;

  final stt.SpeechToText _askSpeech = stt.SpeechToText();
  final AskVoice _askTts = AskVoice();
  bool _askListening = false;
  bool _askSheetOpen = false;

  late final AnimationController _orbController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat(reverse: true);
  late final Animation<double> _orbDrift = Tween<double>(
    begin: -6,
    end: 6,
  ).animate(CurvedAnimation(parent: _orbController, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
    fetchDashboard();
    _askTts.loadSettings();
    SyncService.instance.syncTick.addListener(_onSyncTick);
  }

  void _onSyncTick() {
    if (mounted) fetchDashboard();
  }

  @override
  void dispose() {
    SyncService.instance.syncTick.removeListener(_onSyncTick);
    _orbController.dispose();
    _askSpeech.stop();
    _askTts.stop();
    _askTts.dispose();
    _askController.dispose();
    super.dispose();
  }

  static const _minThinkingTime = Duration(milliseconds: 700);

  Future<void> _askShop() async {
    final question = _askController.text.trim();
    if (question.isEmpty) return;
    final languageCode = Localizations.localeOf(context).languageCode;
    setState(() {
      _asking = true;
      _askAnswer = null;
      _askOrbStyle = randomOrbStyle();
    });
    final started = DateTime.now();
    try {
      final response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/reports/ask'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'question': question, 'language': languageCode}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final answer = data['answer'] as String;
        setState(() => _askAnswer = answer);
        if (_askSheetOpen) unawaited(_askTts.speak(answer, languageCode));
      } else {
        String reason = 'status ${response.statusCode}';
        try {
          final data = jsonDecode(response.body) as Map<String, dynamic>;
          if (data['detail'] is String) reason = data['detail'] as String;
        } catch (_) {}
        setState(() => _askAnswer = context.t.askNoAnswer(reason));
      }
    } catch (e) {
      setState(() => _askAnswer = context.t.couldNotConnect('$e'));
    } finally {
      final elapsed = DateTime.now().difference(started);
      if (elapsed < _minThinkingTime) {
        await Future.delayed(_minThinkingTime - elapsed);
      }
      if (mounted) setState(() => _asking = false);
    }
  }

  Future<void> _toggleVoiceAsk(
    void Function(void Function()) setSheetState,
    void Function() submitAsk,
  ) async {
    if (_askListening) {
      await _askSpeech.stop();
      if (mounted) setSheetState(() => _askListening = false);
      return;
    }
    final status = await Permission.microphone.request();
    if (!status.isGranted) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.micPermissionNeeded)));
      }
      return;
    }
    final available = await _askSpeech.initialize(
      onStatus: (status) {
        if ((status == 'done' || status == 'notListening') && mounted) {
          setSheetState(() => _askListening = false);
        }
      },
      onError: (_) {
        if (mounted) setSheetState(() => _askListening = false);
      },
    );
    if (!available) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.speechUnavailable)));
      }
      return;
    }
    setSheetState(() => _askListening = true);
    _askSpeech.listen(
      onResult: (result) {
        _askController.text = result.recognizedWords;
        setSheetState(() {});
        if (result.finalResult && result.recognizedWords.trim().isNotEmpty) {
          setSheetState(() => _askListening = false);
          submitAsk();
        }
      },
    );
  }

  void _openAskShopSheet() {
    _askSheetOpen = true;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (context, setSheetState) {
              void submitAsk() {
                if (_asking) return;
                _askShop().then((_) {
                  if (sheetContext.mounted) setSheetState(() {});
                });
                setSheetState(() {});
              }

              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _accent.withValues(alpha: _isDark ? 0.4 : 0.22),
                      blurRadius: 44,
                      spreadRadius: -4,
                      offset: const Offset(0, -10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        20,
                        20,
                        20 + MediaQuery.of(context).padding.bottom,
                      ),
                      decoration: BoxDecoration(
                        color: (_isDark ? Colors.black : Colors.white)
                            .withValues(alpha: _isDark ? 0.45 : 0.6),
                        border: Border(
                          top: BorderSide(
                            color: Colors.white.withValues(
                              alpha: _isDark ? 0.12 : 0.7,
                            ),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: -50,
                            right: -50,
                            child: IgnorePointer(
                              child: Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      _accent.withValues(
                                        alpha: _isDark ? 0.35 : 0.22,
                                      ),
                                      _accent.withValues(alpha: 0.0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 0, end: 1),
                                      duration: const Duration(
                                        milliseconds: 380,
                                      ),
                                      curve: Curves.easeOutBack,
                                      builder:
                                          (context, t, child) =>
                                              Transform.scale(
                                                scale: t,
                                                child: Opacity(
                                                  opacity: t.clamp(0, 1),
                                                  child: child,
                                                ),
                                              ),
                                      child: IconBadge(
                                        Icons.auto_awesome_outlined,
                                        _accent,
                                        size: 34,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        context.t.askYourShop,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.record_voice_over_outlined,
                                      ),
                                      tooltip: context.t.askVoice,
                                      onPressed: () async {
                                        final before = _askTts.settingsKey;
                                        await showVoiceSettingsSheet(
                                          sheetContext,
                                          _askTts,
                                        );
                                        final answer = _askAnswer;
                                        if (before != _askTts.settingsKey &&
                                            answer != null &&
                                            answer.isNotEmpty &&
                                            _askSheetOpen &&
                                            sheetContext.mounted) {
                                          unawaited(
                                            _askTts.speak(
                                              answer,
                                              Localizations.localeOf(
                                                sheetContext,
                                              ).languageCode,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close),
                                      tooltip: context.t.close,
                                      onPressed:
                                          () =>
                                              Navigator.of(sheetContext).pop(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  context.t.askIntro,
                                  style: TextStyle(
                                    color:
                                        _isDark
                                            ? Colors.white60
                                            : Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                if (_askListening || _asking) ...[
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap:
                                        _askListening
                                            ? () => _toggleVoiceAsk(
                                              setSheetState,
                                              submitAsk,
                                            )
                                            : null,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            _PopIn(
                                              key: ValueKey(
                                                _askListening
                                                    ? 'listening'
                                                    : _askOrbStyle,
                                              ),
                                              child: ThinkingOrb(
                                                size: 140,
                                                color:
                                                    _isDark
                                                        ? Colors.black
                                                        : _accent,
                                                style: _askOrbStyle,
                                              ),
                                            ),
                                            const SizedBox(height: 18),
                                            _CyclingWord(
                                              words:
                                                  _askListening
                                                      ? [context.t.askListening]
                                                      : context
                                                          .t
                                                          .askThinkingWords
                                                          .split('|'),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    _isDark
                                                        ? Colors.white70
                                                        : Colors.grey.shade700,
                                              ),
                                            ),
                                            if (_askListening) ...[
                                              const SizedBox(height: 6),
                                              Text(
                                                _askController.text.isEmpty
                                                    ? context.t.askSayQuestion
                                                    : _askController.text,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color:
                                                      _isDark
                                                          ? Colors.white54
                                                          : Colors
                                                              .grey
                                                              .shade600,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else ...[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            color: Colors.white.withValues(
                                              alpha: _isDark ? 0.08 : 0.55,
                                            ),
                                            border: Border.all(
                                              color: Colors.white.withValues(
                                                alpha: _isDark ? 0.10 : 0.85,
                                              ),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: _accent.withValues(
                                                  alpha: _isDark ? 0.25 : 0.15,
                                                ),
                                                blurRadius: 16,
                                                offset: const Offset(0, 6),
                                              ),
                                              BoxShadow(
                                                color: Colors.white.withValues(
                                                  alpha: _isDark ? 0.05 : 0.9,
                                                ),
                                                blurRadius: 0,
                                                spreadRadius: -1,
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            controller: _askController,
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: context.t.askHint,
                                              isDense: true,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                    vertical: 12,
                                                  ),
                                            ),
                                            onSubmitted: (_) => submitAsk(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap:
                                            () => _toggleVoiceAsk(
                                              setSheetState,
                                              submitAsk,
                                            ),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color.lerp(
                                                  _accent,
                                                  Colors.white,
                                                  0.4,
                                                )!,
                                                Color.lerp(
                                                  _accent,
                                                  Colors.white,
                                                  0.05,
                                                )!,
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: _accent.withValues(
                                                  alpha: 0.4,
                                                ),
                                                blurRadius: 16,
                                                offset: const Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.mic_none,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: submitAsk,
                                        onTapDown:
                                            (_) => setSheetState(
                                              () => _sendPressed = true,
                                            ),
                                        onTapUp:
                                            (_) => setSheetState(
                                              () => _sendPressed = false,
                                            ),
                                        onTapCancel:
                                            () => setSheetState(
                                              () => _sendPressed = false,
                                            ),
                                        child: AnimatedScale(
                                          scale: _sendPressed ? 0.88 : 1.0,
                                          duration: const Duration(
                                            milliseconds: 100,
                                          ),
                                          curve: Curves.easeOut,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color.lerp(
                                                    _accent,
                                                    Colors.white,
                                                    0.15,
                                                  )!,
                                                  Color.lerp(
                                                    _accent,
                                                    Colors.black,
                                                    0.2,
                                                  )!,
                                                ],
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: _accent.withValues(
                                                    alpha: 0.55,
                                                  ),
                                                  blurRadius: 20,
                                                  offset: const Offset(0, 6),
                                                ),
                                              ],
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(
                                                Icons.send,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                if (_askAnswer != null) ...[
                                  const SizedBox(height: 16),
                                  AnimatedSize(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeOut,
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(
                                          alpha: _isDark ? 0.07 : 0.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.white.withValues(
                                            alpha: _isDark ? 0.10 : 0.8,
                                          ),
                                          width: 1.5,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: _accent.withValues(
                                              alpha: _isDark ? 0.2 : 0.12,
                                            ),
                                            blurRadius: 14,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Text(_askAnswer!),
                                    ),
                                  ),
                                  ValueListenableBuilder<bool>(
                                    valueListenable: _askTts.usingPhoneVoice,
                                    builder:
                                        (context, usingPhone, _) =>
                                            usingPhone
                                                ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        top: 8,
                                                        left: 4,
                                                      ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.phone_android,
                                                        size: 14,
                                                        color:
                                                            _isDark
                                                                ? Colors.white54
                                                                : Colors
                                                                    .grey
                                                                    .shade600,
                                                      ),
                                                      const SizedBox(width: 6),
                                                      Flexible(
                                                        child: Text(
                                                          context
                                                              .t
                                                              .askVoiceFallbackNote,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                _isDark
                                                                    ? Colors
                                                                        .white54
                                                                    : Colors
                                                                        .grey
                                                                        .shade600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                                : const SizedBox.shrink(),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    ).whenComplete(() {
      _askSheetOpen = false;
      _askTts.stop();
      _askSpeech.stop();
    });
  }

  List<(String, Uri, void Function(dynamic))> get _fieldSpecs => [
    (
      'outstanding',
      Uri.parse('${AppConfig.baseUrl}/reports/outstanding'),
      (d) => outstanding = d,
    ),
    (
      'monthly',
      Uri.parse('${AppConfig.baseUrl}/reports/monthly'),
      (d) => monthly = d,
    ),
    (
      'customers',
      Uri.parse('${AppConfig.baseUrl}/customers'),
      (d) => customerCount = (d as List).length,
    ),
    (
      'lowStock',
      Uri.parse('${AppConfig.baseUrl}/reports/low-stock'),
      (d) => lowStock = d,
    ),
    (
      'profitMonthly',
      Uri.parse('${AppConfig.baseUrl}/reports/profit-monthly'),
      (d) => profitMonthly = d,
    ),
    (
      'cashToday',
      Uri.parse('${AppConfig.baseUrl}/reports/cash-today'),
      (d) => cashToday = (d['expected_cash'] as num).toDouble(),
    ),
    (
      'expenses',
      Uri.parse('${AppConfig.baseUrl}/reports/expenses-by-category'),
      (d) => expenseCategories = d,
    ),
    (
      'topRevenue',
      Uri.parse('${AppConfig.baseUrl}/reports/top-items-by-revenue'),
      (d) => topRevenueItems = d,
    ),
    (
      'items',
      Uri.parse('${AppConfig.baseUrl}/items'),
      (d) {
        final items = d as List;
        itemsById = {for (final it in items) it['id'] as String: it};
      },
    ),
    (
      'suppliers',
      Uri.parse('${AppConfig.baseUrl}/suppliers'),
      (d) {
        final suppliers = d as List;
        suppliersById = {for (final s in suppliers) s['id'] as String: s};
      },
    ),
  ];

  Future<void> _fetchField(
    String key,
    Uri url,
    void Function(dynamic) apply,
  ) async {
    try {
      final res = await http.get(url);
      final decoded = jsonDecode(res.body);
      if (!mounted) return;
      setState(() {
        apply(decoded);
        _loadedFields.add(key);
        _failedFields.remove(key);
      });
    } catch (e) {
      debugPrint('dashboard field "$key" failed: ${e.runtimeType}: $e');
      if (!mounted) return;
      if (!_loadedFields.contains(key)) {
        setState(() => _failedFields.add(key));
      }
    }
  }

  Future<void> fetchDashboard({List<String>? only}) async {
    final specs = _fieldSpecs.where((s) => only == null || only.contains(s.$1));
    await Future.wait([for (final s in specs) _fetchField(s.$1, s.$2, s.$3)]);
  }

  Future<void> _refreshBriefing() async {
    setState(() => _briefingRefreshing = true);
    try {
      final res = await http.get(
        Uri.parse(
          '${AppConfig.baseUrl}/notifications/morning-briefing'
          '?language=${Localizations.localeOf(context).languageCode}',
        ),
        timeout: const Duration(seconds: 45),
      );
      if (!mounted) return;
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        setState(() {
          _briefingText = data['message'] as String?;
          _briefingGeneratedAt = DateTime.now();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.briefingRefreshFailed(res.statusCode)),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.t.refreshFailedOffline)));
      }
    } finally {
      if (mounted) setState(() => _briefingRefreshing = false);
    }
  }

  Future<void> _startWalkInSale() async {
    final customerId = await getOrCreateWalkInCustomer();
    if (!mounted) return;
    if (customerId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.newBillFailed)));
      return;
    }
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBillScreen(customerId: customerId),
      ),
    );
    if (result == true) fetchDashboard();
  }

  double get totalOutstanding =>
      outstanding.fold(0.0, (sum, o) => sum + (o['outstanding'] as num));

  String get _selectedMonthKey =>
      '${_selectedMonth.year}-${_selectedMonth.month.toString().padLeft(2, '0')}';

  String get _selectedMonthLabel => monthYear(_selectedMonth);

  bool get _isCurrentMonth {
    final now = DateTime.now();
    return _selectedMonth.year == now.year && _selectedMonth.month == now.month;
  }

  void _shiftMonth(int delta) {
    setState(
      () =>
          _selectedMonth = DateTime(
            _selectedMonth.year,
            _selectedMonth.month + delta,
          ),
    );
  }

  double get thisMonthTotal {
    final match = monthly.firstWhere(
      (m) => m['month'] == _selectedMonthKey,
      orElse: () => {'total': 0},
    );
    return (match['total'] as num).toDouble();
  }

  double get thisMonthProfit {
    final match = profitMonthly.firstWhere(
      (m) => m['month'] == _selectedMonthKey,
      orElse: () => {'profit': 0},
    );
    return (match['profit'] as num).toDouble();
  }

  List<double> _monthlySeries(List<dynamic> series, String field) {
    final sorted = [...series]
      ..sort((a, b) => (a['month'] as String).compareTo(b['month'] as String));
    return sorted
        .skip((sorted.length - 6).clamp(0, sorted.length))
        .map((m) => (m[field] as num).toDouble())
        .toList();
  }

  Future<void> _editItemById(String? itemId) async {
    if (itemId == null) {
      widget.onGoToItems();
      return;
    }
    final item = itemsById[itemId];
    if (item == null) {
      widget.onGoToItems();
      return;
    }
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddItemScreen(
              itemId: item['id'],
              initialName: item['name'],
              initialUnit: item['unit'],
              initialPrice: item['price']?.toString(),
              initialCategory: item['category'],
              initialHsnCode: item['hsn_code'],
              initialGstRate:
                  item['gst_rate'] != null
                      ? (item['gst_rate'] as num).toDouble()
                      : null,
              initialStock: item['stock_quantity']?.toString(),
              initialThreshold: item['low_stock_threshold']?.toString(),
              initialBarcode: item['barcode'],
              initialCostPrice: item['cost_price']?.toString(),
              initialImageUrl: item['image_url'],
              initialPreferredSupplierId: item['preferred_supplier_id'],
            ),
      ),
    );
    if (result == true) fetchDashboard();
  }

  Map<String, dynamic> _reorderLineFor(dynamic item) {
    final threshold = (item['low_stock_threshold'] as num?)?.toDouble() ?? 5;
    final current = (item['stock_quantity'] as num?)?.toDouble() ?? 0;
    final suggested = (item['suggested_reorder_qty'] as num?)?.toDouble() ?? 0;
    final suggestedQty =
        suggested > 0
            ? suggested
            : (threshold * 2 - current).clamp(1, double.infinity);
    return {
      'item_id': item['id'],
      'item_name': item['name'],
      'unit_price': (item['cost_price'] as num?)?.toDouble() ?? 0.0,
      'quantity': suggestedQty,
    };
  }

  Future<void> _reorderItem(dynamic item) async {
    final supplierId = item['preferred_supplier_id'] as String?;
    if (supplierId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t.setPreferredSupplierFirst(context.itemName(item['name'])),
          ),
        ),
      );
      return;
    }
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddPurchaseScreen(
              supplierId: supplierId,
              initialLineItems: [_reorderLineFor(item)],
            ),
      ),
    );
    if (result == true) fetchDashboard();
  }

  Future<void> _bulkReorderForSupplier(
    String supplierId,
    List<dynamic> items,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddPurchaseScreen(
              supplierId: supplierId,
              initialLineItems: items.map(_reorderLineFor).toList(),
            ),
      ),
    );
    if (result == true) fetchDashboard();
  }

  Map<String, List<dynamic>> _lowStockGroupsBySupplier() {
    final groups = <String, List<dynamic>>{};
    for (final item in lowStock) {
      final supplierId = item['preferred_supplier_id'] as String?;
      if (supplierId == null) continue;
      groups.putIfAbsent(supplierId, () => []).add(item);
    }
    return groups;
  }

  Future<MapEntry<String, List<dynamic>>?> _pickSupplierGroup(
    Map<String, List<dynamic>> groups,
  ) {
    return showModalBottomSheet<MapEntry<String, List<dynamic>>>(
      context: context,
      builder:
          (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.t.reorderBySupplier,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                for (final entry in groups.entries)
                  ListTile(
                    leading: const Icon(Icons.local_shipping_outlined),
                    title: Text(
                      (suppliersById[entry.key]?['name'] as String?) ??
                          context.t.supplier,
                    ),
                    subtitle: Text(context.t.itemCount(entry.value.length)),
                    onTap: () => Navigator.pop(context, entry),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
    );
  }

  Future<void> _bulkReorderAll() async {
    final groups = _lowStockGroupsBySupplier();
    if (groups.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.noLowStockWithSupplier)));
      return;
    }
    if (groups.length == 1) {
      final entry = groups.entries.first;
      await _bulkReorderForSupplier(entry.key, entry.value);
      return;
    }
    final chosen = await _pickSupplierGroup(groups);
    if (chosen != null) {
      await _bulkReorderForSupplier(chosen.key, chosen.value);
    }
  }

  String _whatsAppReorderMessage(String supplierName, List<dynamic> items) {
    final lines = items
        .map((i) {
          final qty = (_reorderLineFor(i)['quantity'] as num).toDouble();
          final qtyStr =
              qty == qty.roundToDouble()
                  ? qty.toInt().toString()
                  : qty.toString();
          return '- ${i['name']} x $qtyStr ${context.unitName(i['unit'])}';
        })
        .join('\n');
    return context.t.msgReorder(lines, AppConfig.shopName, supplierName);
  }

  Future<void> _whatsAppReorderForSupplier(
    String supplierId,
    List<dynamic> items,
  ) async {
    final supplier = suppliersById[supplierId];
    final phone = supplier?['phone'] as String?;
    final name = (supplier?['name'] as String?) ?? context.t.thisSupplier;
    if (phone == null || phone.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.supplierNoPhone(name))));
      return;
    }
    await sendWhatsApp(phone, _whatsAppReorderMessage(name, items));
  }

  Future<void> _whatsAppReorderItem(dynamic item) async {
    final supplierId = item['preferred_supplier_id'] as String?;
    if (supplierId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.t.setPreferredSupplierFirst(context.itemName(item['name'])),
          ),
        ),
      );
      return;
    }
    await _whatsAppReorderForSupplier(supplierId, [item]);
  }

  Future<void> _bulkWhatsAppReorderAll() async {
    final groups = _lowStockGroupsBySupplier();
    if (groups.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.noLowStockWithSupplier)));
      return;
    }
    if (groups.length == 1) {
      final entry = groups.entries.first;
      await _whatsAppReorderForSupplier(entry.key, entry.value);
      return;
    }
    final chosen = await _pickSupplierGroup(groups);
    if (chosen != null) {
      await _whatsAppReorderForSupplier(chosen.key, chosen.value);
    }
  }

  bool get _isDark => Theme.of(context).brightness == Brightness.dark;

  Color get _heroTop => _isDark ? const Color(0xFF8A3010) : _accent;
  Color get _heroBottom =>
      _isDark
          ? const Color(0xFF5C1E0A)
          : Color.lerp(_accent, Colors.black, 0.35)!;
  Color get _pageBg =>
      _isDark ? const Color(0xFF1B1512) : const Color(0xFFFAF7F1);
  Color get _cardBg => _isDark ? const Color(0xFF2A211C) : Colors.white;
  Color get _accent =>
      _isDark ? const Color(0xFFFF9A5C) : const Color(0xFF0F766E);

  Widget _driftingOrb({
    required double size,
    required Color color,
    required double top,
    required double left,
  }) {
    return AnimatedBuilder(
      animation: _orbDrift,
      builder:
          (context, child) => Positioned(
            top: top - _orbDrift.value,
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

  List<String> get _tabLabels => [
    context.t.tabOverview,
    context.t.tabStock,
    context.t.tabMoney,
  ];
  List<String> get _tabTaglines => [
    context.t.taglineOverview,
    context.t.taglineStock,
    context.t.taglineMoney,
  ];

  double get _fabBottomClearance =>
      24 + 56 + 16 + MediaQuery.of(context).padding.bottom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: _pageBg,
          child: AdaptiveColumn(
            children: [
              _hero(),
              Expanded(
                child:
                    hasError
                        ? _dashboardError()
                        : isLoading
                        ? _dashboardSkeleton()
                        : IndexedStack(
                          index: _tabIndex,
                          children: [
                            _buildOverview(),
                            _buildStock(),
                            _buildMoney(),
                          ],
                        ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16 + MediaQuery.of(context).padding.bottom,
          child: FloatingActionButton(
            heroTag: 'askYourShop',
            backgroundColor: _accent,
            onPressed: _openAskShopSheet,
            child: const Icon(Icons.auto_awesome_outlined, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _dashboardSkeleton() {
    Widget box({double width = double.infinity, double height = 14}) {
      return SkeletonPulse(
        width: width,
        height: height,
        color: _isDark ? Colors.white24 : Colors.black12,
      );
    }

    Widget row() => Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [Expanded(child: box(width: 120)), box(width: 60)]),
    );

    return ListView(
      padding: const EdgeInsets.all(14),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Text(
          context.t.loadingDashboard(
            _loadedFields.length + _failedFields.length,
            _fieldKeys.length,
          ),
          style: TextStyle(
            color: _isDark ? Colors.white60 : Colors.black54,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 14),
        row(),
        row(),
        row(),
        row(),
      ],
    );
  }

  Widget _dashboardError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off, size: 40, color: _accent),
            const SizedBox(height: 12),
            Text(
              context.t.dashboardLoadFailed,
              style: TextStyle(
                color: _isDark ? Colors.white70 : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              context.t.checkConnectionRetry,
              style: TextStyle(
                color: _isDark ? Colors.white54 : Colors.black54,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                setState(_failedFields.clear);
                fetchDashboard();
              },
              icon: const Icon(Icons.refresh, size: 18),
              label: Text(context.t.retry),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldRetryChip(String fieldKey, {String? label}) {
    final warn = Colors.red.shade700;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => fetchDashboard(only: [fieldKey]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.refresh, size: 14, color: warn),
          const SizedBox(width: 4),
          Text(
            label ?? context.t.retry,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: warn,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionBody({
    required String fieldKey,
    required List list,
    required Widget empty,
    required Widget Function() builder,
  }) {
    if (!_loadedFields.contains(fieldKey) &&
        !_failedFields.contains(fieldKey)) {
      return _listCard([
        SkeletonPulse(color: _isDark ? Colors.white24 : Colors.black12),
        const SizedBox(height: 10),
        SkeletonPulse(color: _isDark ? Colors.white24 : Colors.black12),
      ]);
    }
    if (_failedFields.contains(fieldKey)) {
      return AppCard(
        radius: 18,
        shadowStrength: 0.5,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(child: _fieldRetryChip(fieldKey)),
      );
    }
    return list.isEmpty ? empty : builder();
  }

  Widget _hero() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: _heroTop.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [_heroTop, _heroBottom],
                  ),
                ),
              ),
            ),
            _driftingOrb(size: 70, color: Colors.white, top: -55, left: -55),
            _driftingOrb(
              size: 120,
              color: Color.lerp(_heroTop, Colors.white, 0.5)!,
              top: -50,
              left: 220,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _tabLabels[_tabIndex],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _tabTaglines[_tabIndex],
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _pillSwitcher(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pillSwitcher() {
    return GlassContainer(
      borderRadius: 30,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            for (var i = 0; i < _tabLabels.length; i++)
              Expanded(
                child: Semantics(
                  button: true,
                  selected: i == _tabIndex,
                  child: GestureDetector(
                    onTap: () {
                      if (i == _tabIndex) return;
                      HapticFeedback.selectionClick();
                      setState(() => _tabIndex = i);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      decoration: BoxDecoration(
                        color:
                            i == _tabIndex ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _tabLabels[i],
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color:
                              i == _tabIndex
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<BoxShadow> _raisedShadow({double strength = 1}) {
    if (_isDark) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.55 * strength),
          blurRadius: 28,
          offset: const Offset(0, 14),
        ),
      ];
    }
    return [
      BoxShadow(
        color: _accent.withValues(alpha: 0.16 * strength),
        blurRadius: 28,
        offset: const Offset(0, 14),
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.04 * strength),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ];
  }

  Widget _cardShell({required Widget child, EdgeInsetsGeometry? padding}) {
    return AppCard(padding: padding, child: child);
  }

  Widget _listCard(List<Widget> rows) {
    return AppListCard(rows: rows);
  }

  Widget _gradientButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.lerp(_accent, Colors.white, 0.22)!, _accent],
        ),
        boxShadow: [
          BoxShadow(
            color: _accent.withValues(alpha: _isDark ? 0.6 : 0.45),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dashListTile({
    required IconData icon,
    required Color color,
    required String title,
    String? subtitle,
    required String trailing,
    Color? trailingColor,
    VoidCallback? onTap,
    Widget? trailingAction,
  }) {
    return Pressable(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        leading: IconBadge(icon, color),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle:
            subtitle == null
                ? null
                : Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: _isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
        trailing:
            trailingAction == null
                ? Text(
                  trailing,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color:
                        trailingColor ??
                        (_isDark ? Colors.white : Colors.black87),
                  ),
                )
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      trailing,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color:
                            trailingColor ??
                            (_isDark ? Colors.white : Colors.black87),
                      ),
                    ),
                    trailingAction,
                  ],
                ),
      ),
    );
  }

  BoxDecoration _briefingCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: AppStyle.tint(context, _accent, light: 0.08, dark: 0.18),
      borderRadius: BorderRadius.circular(20),
      boxShadow: AppStyle.raisedShadow(context, strength: 0.5),
    );
  }

  Widget _briefingHeader({Widget? trailing}) {
    return Row(
      children: [
        IconBadge(Icons.auto_awesome, _accent, size: 26),
        const SizedBox(width: 8),
        Text(
          context.t.aiBriefing,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13.5,
            color: _isDark ? Colors.white : _accent,
          ),
        ),
        const Spacer(),
        if (trailing != null) trailing,
      ],
    );
  }

  Widget _briefingCard() {
    if (_briefingText == null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: _briefingCardDecoration(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _briefingHeader(),
              const SizedBox(height: 10),
              Text(
                context.t.briefingPrompt,
                style: TextStyle(
                  fontSize: 12.5,
                  color: _isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 150,
                height: 32,
                child: GradientButton(
                  label: context.t.getBriefing,
                  icon: Icons.auto_awesome,
                  height: 32,
                  loading: _briefingRefreshing,
                  onPressed: _briefingRefreshing ? null : _refreshBriefing,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: _briefingCardDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _briefingHeader(
              trailing:
                  _briefingRefreshing
                      ? const Padding(
                        padding: EdgeInsets.all(8),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                      : AppIconButton(
                        icon: const Icon(Icons.refresh, size: 20),
                        tooltip: context.t.refreshBriefing,
                        onPressed: _refreshBriefing,
                      ),
            ),
            const SizedBox(height: 10),
            Text(
              _briefingText!,
              style: const TextStyle(fontSize: 13, height: 1.4),
            ),
            if (_briefingGeneratedAt != null) ...[
              const SizedBox(height: 8),
              Text(
                context.t.updatedAt(clockTime(_briefingGeneratedAt!)),
                style: TextStyle(
                  fontSize: 11,
                  color: _isDark ? Colors.white38 : Colors.black38,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _emptyCard(String message, {IconData icon = Icons.inbox_outlined}) {
    return AppCard(
      radius: 18,
      shadowStrength: 0.5,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        children: [
          Icon(
            icon,
            size: 28,
            color: _isDark ? Colors.white38 : Colors.black38,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: _isDark ? Colors.white60 : Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    final profitColor =
        thisMonthProfit >= 0 ? Colors.green.shade700 : Colors.red.shade700;
    final hasOutstanding = totalOutstanding > 0;
    final outstandingColor = hasOutstanding ? Colors.red.shade700 : _accent;
    final outstandingIcon =
        hasOutstanding
            ? Icons.warning_amber_rounded
            : Icons.account_balance_wallet_outlined;
    return RefreshIndicator(
      onRefresh: fetchDashboard,
      color: _accent,
      child: ListView(
        padding: EdgeInsets.fromLTRB(16, 14, 16, _fabBottomClearance),
        children: [
          ValueListenableBuilder<int>(
            valueListenable: SyncService.instance.pendingCount,
            builder: (context, pending, _) {
              if (pending == 0) return const SizedBox.shrink();
              return _pendingSyncCard(pending);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: widget.onGoToCustomers,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppStyle.tint(context, _accent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.people_outline, size: 16, color: _accent),
                      const SizedBox(width: 6),
                      if (!_loadedFields.contains('customers') &&
                          !_failedFields.contains('customers'))
                        SkeletonPulse(
                          width: 50,
                          height: 13,
                          color: _accent.withValues(alpha: 0.25),
                        )
                      else
                        Text(
                          _failedFields.contains('customers')
                              ? context.t.customersUnknown
                              : context.t.customerCount(customerCount),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: _accent,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  AppIconButton(
                    icon: const Icon(Icons.chevron_left),
                    tooltip: context.t.previousMonth,
                    onPressed: () => _shiftMonth(-1),
                  ),
                  Text(
                    _selectedMonthLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  AppIconButton(
                    icon: const Icon(Icons.chevron_right),
                    tooltip: context.t.nextMonth,
                    onPressed: _isCurrentMonth ? null : () => _shiftMonth(1),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          _heroStatCard(
            label: context.t.salesMonth,
            fieldKey: 'monthly',
            rawValue: thisMonthTotal,
            icon: Icons.trending_up,
            color: _accent,
            trend: _monthlySeries(monthly, 'total'),
            onTap: widget.onGoToReports,
            secondary: [
              _miniStat(
                label: context.t.outstanding,
                fieldKey: 'outstanding',
                rawValue: totalOutstanding,
                icon: outstandingIcon,
                color: outstandingColor,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DuesScreen(),
                      ),
                    ),
              ),
              _miniStat(
                label: context.t.profitMonth,
                fieldKey: 'profitMonthly',
                rawValue: thisMonthProfit,
                icon: Icons.savings_outlined,
                color: profitColor,
                onTap: widget.onGoToReports,
              ),
              _miniStat(
                label: context.t.cashToday,
                fieldKey: 'cashToday',
                rawValue: cashToday,
                icon: Icons.payments_outlined,
                color: _accent,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReconciliationScreen(),
                    ),
                  );
                  if (mounted) fetchDashboard();
                },
              ),
            ],
          ),
          const SizedBox(height: 14),
          _briefingCard(),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _gradientButton(
                  icon: Icons.receipt_long,
                  label: context.t.newBill,
                  onPressed: _startWalkInSale,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCustomerScreen(),
                      ),
                    );
                    if (result == true) fetchDashboard();
                  },
                  icon: const Icon(Icons.person_add),
                  label: Text(context.t.addCustomer),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _accent,
                    side: BorderSide(color: _accent.withValues(alpha: 0.4)),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScanBillScreen()),
              );
              if (mounted) fetchDashboard();
            },
            icon: const Icon(Icons.document_scanner_outlined),
            label: Text(context.t.scanHandwrittenBill),
            style: OutlinedButton.styleFrom(
              foregroundColor: _accent,
              side: BorderSide(color: _accent.withValues(alpha: 0.4)),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          if (!_loadedFields.contains('outstanding') ||
              outstanding.isNotEmpty) ...[
            const SizedBox(height: 26),
            _sectionHeader(
              Icons.account_balance_wallet_outlined,
              context.t.topOutstanding,
              Colors.red.shade700,
              expanded: _showOutstanding,
              count:
                  _loadedFields.contains('outstanding')
                      ? outstanding.length
                      : null,
              onTap: () => setState(() => _showOutstanding = !_showOutstanding),
            ),
            const SizedBox(height: 8),
            if (_showOutstanding)
              _sectionBody(
                fieldKey: 'outstanding',
                list: outstanding,
                empty: const SizedBox.shrink(),
                builder:
                    () => _listCard(
                      outstanding
                          .take(5)
                          .map<Widget>(
                            (o) => _dashListTile(
                              icon: Icons.person_outline,
                              color: Colors.red.shade700,
                              title: context.partyName(o['customer_name']),
                              trailing: formatMoney(o['outstanding']),
                              trailingColor: Colors.red.shade700,
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => CustomerDetailScreen(
                                          customerId: o['customer_id'],
                                          customerName: o['customer_name'],
                                        ),
                                  ),
                                );
                                if (mounted) fetchDashboard();
                              },
                            ),
                          )
                          .toList(),
                    ),
              ),
            if (_showOutstanding &&
                _loadedFields.contains('outstanding') &&
                outstanding.length > 5)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DuesScreen(),
                      ),
                    );
                    if (mounted) fetchDashboard();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(context.t.viewAllInDues(outstanding.length)),
                      const Icon(Icons.chevron_right, size: 18),
                    ],
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildStock() {
    return RefreshIndicator(
      onRefresh: fetchDashboard,
      color: _accent,
      child: ListView(
        padding: EdgeInsets.fromLTRB(16, 14, 16, _fabBottomClearance),
        children: [
          _sectionHeader(
            Icons.warning_amber_rounded,
            context.t.lowStockAlerts,
            Colors.orange.shade800,
            expanded: _showLowStock,
            count:
                _loadedFields.contains('lowStock') && lowStock.isNotEmpty
                    ? lowStock.length
                    : null,
            onTap: () => setState(() => _showLowStock = !_showLowStock),
          ),
          const SizedBox(height: 8),
          if (_showLowStock)
            _sectionBody(
              fieldKey: 'lowStock',
              list: lowStock,
              empty: _emptyCard(
                context.t.noLowStock,
                icon: Icons.check_circle_outline,
              ),
              builder:
                  () => Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: AppStyle.tint(
                            context,
                            Colors.orange.shade800,
                            light: 0.08,
                            dark: 0.14,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              onPressed: _bulkWhatsAppReorderAll,
                              icon: const Icon(Icons.chat_outlined, size: 18),
                              label: Text(context.t.whatsappAll),
                            ),
                            TextButton.icon(
                              onPressed: _bulkReorderAll,
                              icon: const Icon(
                                Icons.add_shopping_cart_outlined,
                                size: 18,
                              ),
                              label: Text(context.t.reorderAll),
                            ),
                          ],
                        ),
                      ),
                      _listCard(
                        lowStock
                            .map<Widget>(
                              (i) => _dashListTile(
                                icon: Icons.inventory_2_outlined,
                                color: Colors.orange.shade800,
                                title: context.itemName(i['name']),
                                subtitle:
                                    (i['suggested_reorder_qty'] as num? ?? 0) >
                                            0
                                        ? context.t.suggestReorder(
                                          '${i['suggested_reorder_qty']}',
                                          context.unitName(i['unit']),
                                        )
                                        : null,
                                trailing: context.t.stockLeft(
                                  '${i['stock_quantity']}',
                                  context.unitName(i['unit']),
                                ),
                                trailingColor: Colors.orange.shade800,
                                onTap: () => _editItemById(i['id']),
                                trailingAction: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppIconButton(
                                      icon: const Icon(
                                        Icons.add_shopping_cart_outlined,
                                        size: 20,
                                      ),
                                      tooltip: context.t.reorder,
                                      onPressed: () => _reorderItem(i),
                                    ),
                                    AppIconButton(
                                      icon: const Icon(
                                        Icons.chat_outlined,
                                        size: 20,
                                      ),
                                      tooltip: context.t.whatsappSupplier,
                                      onPressed: () => _whatsAppReorderItem(i),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
            ),
          const SizedBox(height: 26),
          _sectionHeader(
            Icons.leaderboard_outlined,
            context.t.topItemsByRevenue,
            _accent,
            expanded: _showTopItems,
            count:
                _loadedFields.contains('topRevenue') &&
                        topRevenueItems.isNotEmpty
                    ? topRevenueItems.length
                    : null,
            onTap: () => setState(() => _showTopItems = !_showTopItems),
          ),
          const SizedBox(height: 8),
          if (_showTopItems)
            _sectionBody(
              fieldKey: 'topRevenue',
              list: topRevenueItems,
              empty: _emptyCard(context.t.noSalesYet),
              builder:
                  () => _listCard(
                    topRevenueItems
                        .map<Widget>(
                          (it) => _dashListTile(
                            icon: Icons.sell_outlined,
                            color: _accent,
                            title: it['item'],
                            subtitle: context.t.qtyLabel('${it['quantity']}'),
                            trailing: formatMoney(it['revenue']),
                            trailingColor: Colors.green.shade700,
                            onTap: () => _editItemById(it['item_id']),
                          ),
                        )
                        .toList(),
                  ),
            ),
        ],
      ),
    );
  }

  Widget _buildMoney() {
    return RefreshIndicator(
      onRefresh: fetchDashboard,
      color: _accent,
      child: ListView(
        padding: EdgeInsets.fromLTRB(16, 14, 16, _fabBottomClearance),
        children: [
          _sectionHeader(
            Icons.pie_chart_outline,
            context.t.monthExpenses,
            Colors.red.shade700,
            expanded: _showExpenses,
            count:
                _loadedFields.contains('expenses') &&
                        expenseCategories.isNotEmpty
                    ? expenseCategories.length
                    : null,
            onTap: () => setState(() => _showExpenses = !_showExpenses),
          ),
          const SizedBox(height: 8),
          if (_showExpenses)
            _sectionBody(
              fieldKey: 'expenses',
              list: expenseCategories,
              empty: _emptyCard(context.t.noExpensesMonth),
              builder:
                  () => _cardShell(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _expenseCategoryRows(),
                    ),
                  ),
            ),
          const SizedBox(height: 26),
          _sectionHeader(
            Icons.bolt_outlined,
            context.t.quickActions,
            _accent,
            expanded: _showQuickActions,
            onTap: () => setState(() => _showQuickActions = !_showQuickActions),
          ),
          const SizedBox(height: 8),
          if (_showQuickActions)
            _listCard([
              _actionTile(
                icon: Icons.point_of_sale,
                color: _accent,
                label: context.t.dailyCashReconciliation,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReconciliationScreen(),
                    ),
                  );
                  if (mounted) fetchDashboard();
                },
              ),
              _actionTile(
                icon: Icons.payments,
                color: Colors.green.shade700,
                label: context.t.collectMoney,
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DuesScreen()),
                  );
                  if (mounted) fetchDashboard();
                },
              ),
            ]),
        ],
      ),
    );
  }

  Widget _actionTile({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return Pressable(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        leading: IconBadge(icon, color),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: _isDark ? Colors.white38 : Colors.black38,
        ),
      ),
    );
  }

  List<Widget> _expenseCategoryRows() {
    final maxTotal = expenseCategories.fold<double>(
      0.0,
      (m, e) =>
          m > (e['total'] as num).toDouble()
              ? m
              : (e['total'] as num).toDouble(),
    );
    return expenseCategories.map<Widget>((e) {
      final total = (e['total'] as num).toDouble();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ExpensesScreen(initialCategory: e['category']),
              ),
            );
            if (mounted) fetchDashboard();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      (e['category'] as String).toUpperCase(),
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                        color: _isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    formatMoney(total),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 13.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: maxTotal > 0 ? total / maxTotal : 0,
                  minHeight: 7,
                  backgroundColor: AppStyle.tint(
                    context,
                    _accent,
                    light: 0.14,
                    dark: 0.18,
                  ),
                  color: _accent,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _pendingSyncCard(int pending) {
    final warn = Colors.orange.shade800;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppStyle.tint(context, warn, light: 0.10, dark: 0.16),
          borderRadius: BorderRadius.circular(22),
          boxShadow: _raisedShadow(strength: 0.6),
        ),
        child: Row(
          children: [
            IconBadge(Icons.cloud_off, warn),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.t.changesSavedOffline(pending),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: _isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    context.t.willSyncOnline,
                    style: TextStyle(
                      fontSize: 12,
                      color: _isDark ? Colors.white60 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ValueListenableBuilder<bool>(
              valueListenable: SyncService.instance.isSyncing,
              builder: (context, syncing, _) {
                return FilledButton.icon(
                  onPressed:
                      syncing
                          ? null
                          : () async {
                            await SyncService.instance.syncAll();
                            if (mounted) fetchDashboard();
                          },
                  style: FilledButton.styleFrom(
                    backgroundColor: warn,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                  icon:
                      syncing
                          ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : const Icon(Icons.sync, size: 18),
                  label: Text(syncing ? context.t.syncing : context.t.sync),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroStatCard({
    required String label,
    required String fieldKey,
    required double rawValue,
    required IconData icon,
    required Color color,
    List<double>? trend,
    VoidCallback? onTap,
    List<Widget> secondary = const [],
  }) {
    final loading =
        !_loadedFields.contains(fieldKey) && !_failedFields.contains(fieldKey);
    final failed = _failedFields.contains(fieldKey);
    final dividerColor =
        _isDark ? Colors.white12 : Colors.black.withValues(alpha: 0.06);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.lerp(_cardBg, color, _isDark ? 0.16 : 0.09)!, _cardBg],
          stops: const [0.0, 0.6],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: _raisedShadow(),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconBadge(icon, color, size: 36),
                        const Spacer(),
                        if (onTap != null)
                          Icon(
                            Icons.chevron_right,
                            size: 18,
                            color: _isDark ? Colors.white38 : Colors.black38,
                          ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                        color: _isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 3),
                    if (loading)
                      SkeletonPulse(
                        width: 70,
                        height: 20,
                        color: _isDark ? Colors.white24 : Colors.black12,
                      )
                    else if (failed)
                      _fieldRetryChip(fieldKey)
                    else
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: rawValue),
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutCubic,
                        builder:
                            (context, value, _) => Text(
                              formatMoney(value),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.3,
                                color: color,
                              ),
                            ),
                      ),
                    if (trend != null && trend.length >= 2) ...[
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 22,
                        width: double.infinity,
                        child: CustomPaint(
                          painter: _SparklinePainter(trend, color),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          if (secondary.isNotEmpty) ...[
            Divider(height: 1, thickness: 1, color: dividerColor),
            IntrinsicHeight(
              child: Row(
                children: [
                  for (var i = 0; i < secondary.length; i++) ...[
                    if (i > 0)
                      VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: dividerColor,
                      ),
                    Expanded(child: secondary[i]),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _miniStat({
    required String label,
    required String fieldKey,
    required double rawValue,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    final loading =
        !_loadedFields.contains(fieldKey) && !_failedFields.contains(fieldKey);
    final failed = _failedFields.contains(fieldKey);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: color.withValues(alpha: _isDark ? 0.10 : 0.06),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withValues(alpha: _isDark ? 0.24 : 0.16),
                  ),
                  child: Icon(icon, size: 14, color: color),
                ),
                const SizedBox(height: 6),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: _isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 2),
                if (loading)
                  SkeletonPulse(
                    width: 40,
                    height: 14,
                    color: _isDark ? Colors.white24 : Colors.black12,
                  )
                else if (failed)
                  _fieldRetryChip(fieldKey, label: '--')
                else
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: rawValue),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutCubic,
                    builder:
                        (context, value, _) => Text(
                          formatMoney(value),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            color: color,
                          ),
                        ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(
    IconData icon,
    String title,
    Color color, {
    bool expanded = true,
    int? count,
    VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            IconBadge(icon, color, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            if (count != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppStyle.tint(context, color),
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
              const SizedBox(width: 6),
            ],
            Icon(
              expanded ? Icons.expand_less : Icons.expand_more,
              color: _isDark ? Colors.white60 : Colors.black54,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> values;
  final Color color;
  _SparklinePainter(this.values, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final minV = values.reduce((a, b) => a < b ? a : b);
    final maxV = values.reduce((a, b) => a > b ? a : b);
    final range = maxV - minV;
    final points = [
      for (var i = 0; i < values.length; i++)
        Offset(
          size.width * i / (values.length - 1),
          range == 0
              ? size.height / 2
              : size.height * (1 - (values[i] - minV) / range),
        ),
    ];

    final linePaint =
        Paint()
          ..color = color.withValues(alpha: 0.55)
          ..strokeWidth = 1.6
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;
    final line = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      line.lineTo(p.dx, p.dy);
    }
    canvas.drawPath(line, linePaint);

    final fill =
        Path.from(line)
          ..lineTo(points.last.dx, size.height)
          ..lineTo(points.first.dx, size.height)
          ..close();
    final fillPaint =
        Paint()
          ..shader = ui.Gradient.linear(Offset(0, 0), Offset(0, size.height), [
            color.withValues(alpha: 0.22),
            color.withValues(alpha: 0.0),
          ]);
    canvas.drawPath(fill, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) =>
      oldDelegate.values != values || oldDelegate.color != color;
}

class _CyclingWord extends StatefulWidget {
  const _CyclingWord({required this.words, required this.style});

  final List<String> words;
  final TextStyle style;

  @override
  State<_CyclingWord> createState() => _CyclingWordState();
}

class _CyclingWordState extends State<_CyclingWord> {
  int _i = Random().nextInt(1 << 16);
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) => setState(() => _i++),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final word = widget.words[_i % widget.words.length];
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: const Interval(0.5, 1),
      switchOutCurve: const Interval(0.5, 1),
      child: Text(word, key: ValueKey(word), style: widget.style),
    );
  }
}

class _PopIn extends StatelessWidget {
  const _PopIn({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutBack,
      builder:
          (context, t, child) => Transform.scale(
            scale: t,
            child: Opacity(opacity: t.clamp(0, 1), child: child),
          ),
      child: child,
    );
  }
}
