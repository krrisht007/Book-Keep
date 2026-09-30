import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'app_state.dart';
import 'app_update.dart';
import 'l10n/l10n.dart';
import 'home_screen.dart';
import 'customer_list_screen.dart';
import 'items_screen.dart';
import 'supplier_list_screen.dart';
import 'reports_screen.dart';
import 'settings_screen.dart';
import 'sync_service.dart';
import 'notifications.dart';
import 'scan_purchase_screen.dart';
import 'search_screen.dart';
import 'widgets/app_style.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late final AnimationController _fadeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
    value: 1,
  );

  void _goTo(int index) {
    if (index == _selectedIndex) return;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _selectedIndex = index;
      _built.add(index);
    });
    _fadeController.forward(from: 0);
  }

  List<({String label, IconData icon, IconData selectedIcon})> get _sections {
    final t = AppLocalizations.of(context)!;
    return [
      (
        label: t.navHome,
        icon: Icons.home_rounded,
        selectedIcon: Icons.home_rounded,
      ),
      (
        label: t.navCustomers,
        icon: Icons.people_rounded,
        selectedIcon: Icons.people_rounded,
      ),
      (
        label: t.navItems,
        icon: Icons.inventory_2_rounded,
        selectedIcon: Icons.inventory_2_rounded,
      ),
      (
        label: t.navSuppliers,
        icon: Icons.local_shipping_rounded,
        selectedIcon: Icons.local_shipping_rounded,
      ),
      (
        label: t.navReports,
        icon: Icons.bar_chart_rounded,
        selectedIcon: Icons.bar_chart_rounded,
      ),
      (
        label: t.navSettings,
        icon: Icons.settings_rounded,
        selectedIcon: Icons.settings_rounded,
      ),
    ];
  }

  final _customerKey = GlobalKey<CustomerListScreenState>();
  final _itemsKey = GlobalKey<ItemsScreenState>();
  final _supplierKey = GlobalKey<SupplierListScreenState>();

  final _built = <int>{0};

  Timer? _buildRestTimer;

  void _buildRestInBackground() {
    var next = 1;
    _buildRestTimer = Timer(const Duration(milliseconds: 2500), () {
      _buildRestTimer = Timer.periodic(const Duration(milliseconds: 400), (t) {
        if (next > 5) return t.cancel();
        if (_built.add(next)) setState(() {});
        next++;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _buildRestInBackground();
    requestedTabNotifier.addListener(_onRequestedTab);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SyncService.instance.startConnectivityListener();
      SyncService.instance.refreshPendingCount();
      SyncService.instance.syncAll();
      NotificationService.instance.init();
      checkForUpdate(context);
    });
  }

  void _onRequestedTab() {
    final index = requestedTabNotifier.value;
    if (index == null) return;
    requestedTabNotifier.value = null;
    _goTo(index);
  }

  @override
  void dispose() {
    requestedTabNotifier.removeListener(_onRequestedTab);
    _buildRestTimer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  List<({IconData icon, String tooltip, VoidCallback? onPressed})>
  _sectionActionSpecs() {
    switch (_selectedIndex) {
      case 0:
        return [];
      case 1:
        return [
          (
            icon: Icons.sort_by_alpha,
            tooltip: context.t.sortNameNewest,
            onPressed: () => _customerKey.currentState?.toggleSort(),
          ),
          (
            icon: Icons.person_add,
            tooltip: context.t.addCustomer,
            onPressed: () => _customerKey.currentState?.addCustomer(),
          ),
          (
            icon: Icons.upload_file_outlined,
            tooltip: context.t.importCsv,
            onPressed: () => _customerKey.currentState?.importCsv(),
          ),
          (
            icon: Icons.search,
            tooltip: context.t.searchShop,
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                ),
          ),
        ];
      case 2:
        return [
          (
            icon: Icons.qr_code_scanner,
            tooltip: context.t.scanToFindItem,
            onPressed: () => _itemsKey.currentState?.scanForItem(),
          ),
          (
            icon: Icons.upload_file,
            tooltip: context.t.bulkAdd,
            onPressed: () => _itemsKey.currentState?.bulkAdd(),
          ),
          (
            icon: Icons.edit_note,
            tooltip: context.t.updateStock,
            onPressed: () => _itemsKey.currentState?.updateStock(),
          ),
          (
            icon: Icons.print_outlined,
            tooltip: context.t.printLabels,
            onPressed: () => _itemsKey.currentState?.bulkPrintLabels(),
          ),
          (
            icon: Icons.merge_type,
            tooltip: context.t.mergeDuplicates,
            onPressed: () => _itemsKey.currentState?.mergeDuplicates(),
          ),
        ];
      case 3:
        return [
          (
            icon: Icons.sort_by_alpha,
            tooltip: context.t.sortNameNewest,
            onPressed: () => _supplierKey.currentState?.toggleSort(),
          ),
          (
            icon: Icons.person_add,
            tooltip: context.t.addSupplier,
            onPressed: () => _supplierKey.currentState?.addSupplier(),
          ),
          (
            icon: Icons.upload_file_outlined,
            tooltip: context.t.importCsv,
            onPressed: () => _supplierKey.currentState?.importCsv(),
          ),
          (
            icon: Icons.document_scanner_outlined,
            tooltip: context.t.scanPurchaseInvoice,
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScanPurchaseScreen(),
                  ),
                ),
          ),
        ];
      default:
        return [];
    }
  }

  List<Widget> _buildActions() {
    final specs = _sectionActionSpecs();
    const inlineLimit = 2;
    if (specs.length <= inlineLimit) {
      return [
        for (final s in specs)
          AppIconButton(
            icon: Icon(s.icon),
            tooltip: s.tooltip,
            onPressed: s.onPressed,
          ),
      ];
    }
    final overflow = specs.skip(inlineLimit).toList();
    return [
      for (final s in specs.take(inlineLimit))
        AppIconButton(
          icon: Icon(s.icon),
          tooltip: s.tooltip,
          onPressed: s.onPressed,
        ),
      PopupMenuButton<int>(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        onSelected: (i) => overflow[i].onPressed?.call(),
        itemBuilder: (context) {
          final onSurface = Theme.of(context).colorScheme.onSurface;
          return [
            for (var i = 0; i < overflow.length; i++)
              PopupMenuItem(
                value: i,
                child: Row(
                  children: [
                    Icon(overflow[i].icon, size: 20, color: onSurface),
                    const SizedBox(width: 12),
                    Text(overflow[i].tooltip),
                  ],
                ),
              ),
          ];
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FloatingAppBar(
        titleWidget: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/logo/title_icon_dark.png'
                    : 'assets/logo/title_icon.png',
                width: 28,
                height: 28,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Book-keep',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: _buildActions(),
      ),
      body: FadeTransition(
        opacity: _fadeController,
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeScreen(
              onGoToCustomers: () => _goTo(1),
              onGoToItems: () => _goTo(2),
              onGoToReports: () => _goTo(4),
            ),
            if (_built.contains(1))
              CustomerListScreen(key: _customerKey)
            else
              const SizedBox.shrink(),
            if (_built.contains(2))
              ItemsScreen(key: _itemsKey)
            else
              const SizedBox.shrink(),
            if (_built.contains(3))
              SupplierListScreen(key: _supplierKey)
            else
              const SizedBox.shrink(),
            if (_built.contains(4))
              ReportsScreen(
                onGoToCustomers: () => _goTo(1),
                onGoToItems: () => _goTo(2),
              )
            else
              const SizedBox.shrink(),
            if (_built.contains(5))
              const SettingsScreen()
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: _floatingPillNav(),
    );
  }

  Widget _floatingPillNav() {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 14 + bottomInset),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.14),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.55),
                  width: 1.2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < _sections.length; i++) _pillNavItem(i),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pillNavItem(int index) {
    final selected = index == _selectedIndex;
    final primary = Theme.of(context).colorScheme.primary;
    final section = _sections[index];
    return Pressable(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _goTo(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: selected ? 1 : 0.8,
              duration: const Duration(milliseconds: 280),
              curve: selected ? Curves.elasticOut : Curves.easeOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(selected ? 14 : 12),
                decoration: BoxDecoration(
                  gradient:
                      selected
                          ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.lerp(primary, Colors.white, 0.65)!,
                              primary,
                            ],
                          )
                          : null,
                  color: selected ? null : Colors.transparent,
                  shape: BoxShape.circle,
                  border:
                      selected
                          ? Border.all(color: Colors.white, width: 2)
                          : null,
                  boxShadow:
                      selected
                          ? [
                            BoxShadow(
                              color: primary.withValues(alpha: 0.55),
                              blurRadius: 16,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ]
                          : null,
                ),
                child: Icon(
                  section.selectedIcon,
                  color: selected ? Colors.white : Colors.black87,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                section.label,
                style: TextStyle(
                  color: selected ? primary : Colors.black54,
                  fontSize: 10,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
