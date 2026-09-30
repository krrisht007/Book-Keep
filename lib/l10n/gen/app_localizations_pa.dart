// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get navHome => 'ਘਰ';

  @override
  String get navCustomers => 'ਗਾਹਕ';

  @override
  String get navItems => 'ਵਸਤੂਆਂ';

  @override
  String get navSuppliers => 'ਸਪਲਾਇਰ';

  @override
  String get navReports => 'ਰਿਪੋਰਟਾਂ';

  @override
  String get navSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get settingsShopDetailsTitle => 'ਦੁਕਾਨ ਦੇ ਵੇਰਵੇ';

  @override
  String get settingsShopDetailsSubtitle => 'ਤੁਹਾਡੇ ਇਨਵੌਇਸਾਂ \'ਤੇ ਦਿਖਾਇਆ ਜਾਂਦਾ ਹੈ।';

  @override
  String get settingsShopNameLabel => 'ਦੁਕਾਨ ਦਾ ਨਾਮ';

  @override
  String get settingsShopAddressLabel => 'ਦੁਕਾਨ ਦਾ ਪਤਾ';

  @override
  String get settingsPhoneLabel => 'ਫ਼ੋਨ';

  @override
  String get settingsSaveShopDetails => 'ਦੁਕਾਨ ਦੇ ਵੇਰਵੇ ਸੰਭਾਲੋ';

  @override
  String get settingsAppearanceTitle => 'ਦਿੱਖ';

  @override
  String get settingsAppearanceSubtitle => 'ਪੂਰੀ ਐਪ ਲਈ ਥੀਮ ਚੁਣੋ।';

  @override
  String get themeLight => 'ਹਲਕਾ';

  @override
  String get themeDark => 'ਗੂੜ੍ਹਾ';

  @override
  String get themeSystem => 'ਸਿਸਟਮ';

  @override
  String get settingsLanguageTitle => 'ਭਾਸ਼ਾ';

  @override
  String get settingsLanguageSubtitle => 'ਐਪ ਦੀ ਡਿਸਪਲੇ ਭਾਸ਼ਾ ਚੁਣੋ।';

  @override
  String get sortNameNewest => 'ਕ੍ਰਮ: ਨਾਮ / ਨਵੀਨਤਮ';

  @override
  String get addCustomer => 'ਗਾਹਕ ਜੋੜੋ';

  @override
  String get importCsv => 'CSV ਆਯਾਤ ਕਰੋ';

  @override
  String get searchShop => 'ਦੁਕਾਨ ਵਿੱਚ ਖੋਜੋ';

  @override
  String get scanToFindItem => 'ਚੀਜ਼ ਲੱਭਣ ਲਈ ਸਕੈਨ ਕਰੋ';

  @override
  String get bulkAdd => 'ਇਕੱਠੇ ਜੋੜੋ';

  @override
  String get updateStock => 'ਸਟਾਕ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get printLabels => 'ਲੇਬਲ ਪ੍ਰਿੰਟ ਕਰੋ';

  @override
  String get mergeDuplicates => 'ਡੁਪਲੀਕੇਟ ਮਿਲਾਓ';

  @override
  String get addSupplier => 'ਸਪਲਾਇਰ ਜੋੜੋ';

  @override
  String get scanPurchaseInvoice => 'ਖਰੀਦ ਇਨਵੌਇਸ ਸਕੈਨ ਕਰੋ';

  @override
  String askNoAnswer(String reason) {
    return 'ਜਵਾਬ ਨਹੀਂ ਮਿਲ ਸਕਿਆ: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'ਕਨੈਕਟ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get micPermissionNeeded => 'ਆਵਾਜ਼ ਨਾਲ ਪੁੱਛਣ ਲਈ ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਦੀ ਇਜਾਜ਼ਤ ਚਾਹੀਦੀ ਹੈ।';

  @override
  String get speechUnavailable => 'ਇਸ ਡਿਵਾਈਸ \'ਤੇ ਆਵਾਜ਼ ਪਛਾਣ ਉਪਲਬਧ ਨਹੀਂ ਹੈ।';

  @override
  String get askYourShop => 'ਆਪਣੀ ਦੁਕਾਨ ਤੋਂ ਪੁੱਛੋ';

  @override
  String get close => 'ਬੰਦ ਕਰੋ';

  @override
  String get askIntro => 'ਜਾਣਨਾ ਚਾਹੁੰਦੇ ਹੋ ਦੁਕਾਨ ਕਿਵੇਂ ਚੱਲ ਰਹੀ ਹੈ? ਮੈਨੂੰ ਪੁੱਛੋ, ਤੁਹਾਡੀ ਵਹੀ ਵਿੱਚ ਜੋ ਦਰਜ ਹੈ ਉਸੇ ਤੋਂ ਜਵਾਬ ਮਿਲੇਗਾ।';

  @override
  String get askListening => 'ਸੁਣ ਰਿਹਾ ਹੈ…';

  @override
  String get askThinkingWords => 'ਸੋਚ ਰਿਹਾ ਹੈ…|ਕੰਮ ਚੱਲ ਰਿਹਾ ਹੈ…|ਹਿਸਾਬ ਲਗਾ ਰਿਹਾ ਹੈ…|ਖਾਤੇ ਵੇਖ ਰਿਹਾ ਹੈ…|ਜੋੜ ਰਿਹਾ ਹੈ…|ਅੰਕੜੇ ਵੇਖ ਰਿਹਾ ਹੈ…';

  @override
  String get askSayQuestion => 'ਆਪਣਾ ਸਵਾਲ ਬੋਲੋ — ਰੱਦ ਕਰਨ ਲਈ ਗੋਲੇ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String briefingRefreshFailed(int code) {
    return 'ਬ੍ਰੀਫ਼ਿੰਗ ਤਾਜ਼ਾ ਨਹੀਂ ਹੋ ਸਕੀ ($code)।';
  }

  @override
  String get refreshFailedOffline => 'ਤਾਜ਼ਾ ਨਹੀਂ ਹੋ ਸਕਿਆ — ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ।';

  @override
  String get newBillFailed => 'ਨਵਾਂ ਬਿੱਲ ਸ਼ੁਰੂ ਨਹੀਂ ਹੋ ਸਕਿਆ — ਕਨੈਕਸ਼ਨ ਜਾਂਚ ਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'ਪਹਿਲਾਂ $name ਲਈ ਪਸੰਦੀਦਾ ਸਪਲਾਇਰ ਚੁਣੋ (ਬਦਲਣ ਲਈ ਟੈਪ ਕਰੋ)।';
  }

  @override
  String get reorderBySupplier => 'ਸਪਲਾਇਰ ਅਨੁਸਾਰ ਮੁੜ ਆਰਡਰ';

  @override
  String get supplier => 'ਸਪਲਾਇਰ';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਚੀਜ਼ਾਂ',
      one: '1 ਚੀਜ਼',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'ਘੱਟ ਸਟਾਕ ਵਾਲੀ ਕਿਸੇ ਚੀਜ਼ ਦਾ ਪਸੰਦੀਦਾ ਸਪਲਾਇਰ ਹਾਲੇ ਤੈਅ ਨਹੀਂ।';

  @override
  String get thisSupplier => 'ਇਹ ਸਪਲਾਇਰ';

  @override
  String supplierNoPhone(String name) {
    return '$name ਦਾ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਨਹੀਂ ਹੈ।';
  }

  @override
  String get tabOverview => 'ਸਾਰ';

  @override
  String get tabStock => 'ਸਟਾਕ';

  @override
  String get tabMoney => 'ਪੈਸਾ';

  @override
  String get taglineOverview => 'ਅੱਜ ਦਾ ਬਕਾਇਆ, ਸਟਾਕ ਅਤੇ ਨਕਦ ਇੱਕ ਨਜ਼ਰ ਵਿੱਚ।';

  @override
  String get taglineStock => 'ਕੀ ਵਿਕ ਰਿਹਾ ਹੈ, ਕੀ ਘੱਟ ਰਿਹਾ ਹੈ।';

  @override
  String get taglineMoney => 'ਖਰਚੇ, ਮਿਲਾਨ ਅਤੇ ਵਸੂਲੀ।';

  @override
  String loadingDashboard(int done, int total) {
    return 'ਡੈਸ਼ਬੋਰਡ ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ… $total ਵਿੱਚੋਂ $done';
  }

  @override
  String get dashboardLoadFailed => 'ਡੈਸ਼ਬੋਰਡ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ';

  @override
  String get checkConnectionRetry => 'ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ ਅਤੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get retry => 'ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get aiBriefing => 'AI ਬ੍ਰੀਫ਼ਿੰਗ';

  @override
  String get briefingPrompt => 'ਕੱਲ੍ਹ ਦਾ ਕਾਰੋਬਾਰ ਕੁਝ ਵਾਕਾਂ ਵਿੱਚ ਵੇਖੋ।';

  @override
  String get getBriefing => 'ਬ੍ਰੀਫ਼ਿੰਗ ਲਵੋ';

  @override
  String get refreshBriefing => 'ਬ੍ਰੀਫ਼ਿੰਗ ਤਾਜ਼ਾ ਕਰੋ';

  @override
  String updatedAt(String time) {
    return 'ਅੱਪਡੇਟ $time';
  }

  @override
  String get customersUnknown => '— ਗਾਹਕ';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਗਾਹਕ',
      one: '1 ਗਾਹਕ',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'ਪਿਛਲਾ ਮਹੀਨਾ';

  @override
  String get nextMonth => 'ਅਗਲਾ ਮਹੀਨਾ';

  @override
  String get salesMonth => 'ਵਿਕਰੀ (ਮਹੀਨਾ)';

  @override
  String get outstanding => 'ਬਕਾਇਆ';

  @override
  String get profitMonth => 'ਮੁਨਾਫ਼ਾ (ਮਹੀਨਾ)';

  @override
  String get cashToday => 'ਅੱਜ ਦਾ ਨਕਦ';

  @override
  String get newBill => 'ਨਵਾਂ ਬਿੱਲ';

  @override
  String get scanHandwrittenBill => 'ਹੱਥ ਨਾਲ ਲਿਖਿਆ ਬਿੱਲ ਸਕੈਨ ਕਰੋ';

  @override
  String get topOutstanding => 'ਸਭ ਤੋਂ ਵੱਧ ਬਕਾਏ';

  @override
  String viewAllInDues(int count) {
    return 'ਬਕਾਇਆ ਕੇਂਦਰ ਵਿੱਚ ਸਾਰੇ $count ਵੇਖੋ';
  }

  @override
  String get lowStockAlerts => 'ਘੱਟ ਸਟਾਕ ਚੇਤਾਵਨੀਆਂ';

  @override
  String get noLowStock => 'ਕੋਈ ਚੀਜ਼ ਘੱਟ ਸਟਾਕ ਵਿੱਚ ਨਹੀਂ — ਸਟਾਕ ਠੀਕ ਹੈ।';

  @override
  String get whatsappAll => 'ਸਭ ਨੂੰ WhatsApp';

  @override
  String get reorderAll => 'ਸਭ ਮੁੜ ਆਰਡਰ ਕਰੋ';

  @override
  String suggestReorder(String qty, String unit) {
    return 'ਸੁਝਾਅ: $qty $unit ਮੁੜ ਆਰਡਰ ਕਰੋ';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit ਬਾਕੀ';
  }

  @override
  String get reorder => 'ਮੁੜ ਆਰਡਰ';

  @override
  String get whatsappSupplier => 'ਸਪਲਾਇਰ ਨੂੰ WhatsApp';

  @override
  String get topItemsByRevenue => 'ਕਮਾਈ ਅਨੁਸਾਰ ਸਿਖਰਲੀਆਂ ਚੀਜ਼ਾਂ';

  @override
  String get noSalesYet => 'ਹਾਲੇ ਕੋਈ ਵਿਕਰੀ ਦਰਜ ਨਹੀਂ।';

  @override
  String qtyLabel(String qty) {
    return 'ਮਾਤਰਾ: $qty';
  }

  @override
  String get monthExpenses => 'ਇਸ ਮਹੀਨੇ ਦੇ ਖਰਚੇ';

  @override
  String get noExpensesMonth => 'ਇਸ ਮਹੀਨੇ ਕੋਈ ਖਰਚਾ ਦਰਜ ਨਹੀਂ।';

  @override
  String get quickActions => 'ਤੁਰੰਤ ਕੰਮ';

  @override
  String get dailyCashReconciliation => 'ਰੋਜ਼ਾਨਾ ਨਕਦ ਮਿਲਾਨ';

  @override
  String get collectMoney => 'ਪੈਸਾ ਵਸੂਲੋ';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਤਬਦੀਲੀਆਂ ਆਫ਼ਲਾਈਨ ਸੰਭਾਲੀਆਂ',
      one: '1 ਤਬਦੀਲੀ ਆਫ਼ਲਾਈਨ ਸੰਭਾਲੀ',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗਾ';

  @override
  String get syncing => 'ਸਿੰਕ ਹੋ ਰਿਹਾ ਹੈ';

  @override
  String get sync => 'ਸਿੰਕ';

  @override
  String get shopProfile => 'ਦੁਕਾਨ ਪ੍ਰੋਫ਼ਾਈਲ';

  @override
  String get insights => 'ਜਾਣਕਾਰੀ';

  @override
  String get notifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get backupExport => 'ਬੈਕਅੱਪ ਅਤੇ ਐਕਸਪੋਰਟ';

  @override
  String get adminPanel => 'ਐਡਮਿਨ ਪੈਨਲ';

  @override
  String get toolsSync => 'ਟੂਲ ਅਤੇ ਸਿੰਕ';

  @override
  String get account => 'ਖਾਤਾ';

  @override
  String get shopDetailsSaved => 'ਦੁਕਾਨ ਦਾ ਵੇਰਵਾ ਸੰਭਾਲਿਆ ਗਿਆ।';

  @override
  String saveFailed(int code) {
    return 'ਸੰਭਾਲਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'ਸੰਭਾਲਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get logoUpdated => 'ਲੋਗੋ ਅੱਪਡੇਟ ਹੋ ਗਿਆ।';

  @override
  String logoUploadFailed(int code) {
    return 'ਲੋਗੋ ਅੱਪਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'ਲੋਗੋ ਅੱਪਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get healthGood => 'ਕੁੱਲ ਮਿਲਾ ਕੇ ਸਭ ਠੀਕ ਹੈ।';

  @override
  String get healthSome => 'ਕੁਝ ਚੀਜ਼ਾਂ ਵੱਲ ਧਿਆਨ ਦੇਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get healthMany => 'ਕਈ ਚੀਜ਼ਾਂ ਵੱਲ ਧਿਆਨ ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get shopHealth => 'ਦੁਕਾਨ ਦੀ ਸਿਹਤ';

  @override
  String get healthIntro => 'ਇੱਕ ਛੋਟਾ ਜਿਹਾ ਇਸ਼ਾਰਾ, ਇੱਕ ਹੋਰ ਰਿਪੋਰਟ ਨਹੀਂ।';

  @override
  String get couldNotLoadCheckConnection => 'ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ — ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਜਾਂਚੋ।';

  @override
  String get itemPhotos => 'ਚੀਜ਼ਾਂ ਦੀਆਂ ਫ਼ੋਟੋਆਂ';

  @override
  String get barcodes => 'ਬਾਰਕੋਡ';

  @override
  String get lowStockItems => 'ਘੱਟ ਸਟਾਕ ਵਾਲੀਆਂ ਚੀਜ਼ਾਂ';

  @override
  String get lastBackup => 'ਆਖਰੀ ਬੈਕਅੱਪ';

  @override
  String get today => 'ਅੱਜ';

  @override
  String get yesterday => 'ਕੱਲ੍ਹ';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ਦਿਨ ਪਹਿਲਾਂ',
      one: '1 ਦਿਨ ਪਹਿਲਾਂ',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'ਆਫ਼ਲਾਈਨ ਸਥਿਤੀ';

  @override
  String get online => 'ਆਨਲਾਈਨ';

  @override
  String get offline => 'ਆਫ਼ਲਾਈਨ';

  @override
  String get waitingToSync => 'ਸਿੰਕ ਦੀ ਉਡੀਕ';

  @override
  String get syncNow => 'ਹੁਣੇ ਸਿੰਕ ਕਰੋ';

  @override
  String get searchSettings => 'ਸੈਟਿੰਗਾਂ ਖੋਜੋ';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\" ਨਾਲ ਕੋਈ ਸੈਟਿੰਗ ਨਹੀਂ ਮਿਲੀ';
  }

  @override
  String get businessInfo => 'ਕਾਰੋਬਾਰ ਜਾਣਕਾਰੀ';

  @override
  String get payment => 'ਭੁਗਤਾਨ';

  @override
  String get shopNameRequired => 'ਦੁਕਾਨ ਦਾ ਨਾਮ ਲਾਜ਼ਮੀ ਹੈ';

  @override
  String phoneIncomplete(int digits) {
    return 'ਪੂਰਾ $digits ਅੰਕਾਂ ਦਾ ਫ਼ੋਨ ਨੰਬਰ ਦਰਜ ਕਰੋ';
  }

  @override
  String get jazzcashOptional => 'JazzCash ਨੰਬਰ (ਵਿਕਲਪਿਕ)';

  @override
  String get saved => 'ਸੰਭਾਲਿਆ!';

  @override
  String get languageSubtitle => 'ਐਪ ਦੀ ਭਾਸ਼ਾ ਬਦਲੋ';

  @override
  String get notificationsSubtitle => 'ਘੱਟ ਸਟਾਕ, ਬਕਾਇਆ ਭੁਗਤਾਨ ਅਤੇ ਰੋਜ਼ਾਨਾ ਸਾਰ';

  @override
  String get backupSubtitle => 'ਦੁਕਾਨ ਦਾ ਡਾਟਾ ਡਾਊਨਲੋਡ, ਬਹਾਲ ਅਤੇ ਐਕਸਪੋਰਟ ਕਰੋ';

  @override
  String get appUpdate => 'ਐਪ ਅੱਪਡੇਟ';

  @override
  String get appUpdateSubtitle => 'ਨਵਾਂ ਵਰਜਨ ਜਾਂਚੋ';

  @override
  String get adminSubtitle => 'ਖਾਤੇ ਅਤੇ ਦੁਕਾਨ ਦਾ ਡਾਟਾ ਸੰਭਾਲੋ';

  @override
  String get accountSubtitle => 'ਸਾਈਨ-ਇਨ, ਪਾਸਵਰਡ ਅਤੇ ਯੂਜ਼ਰਨੇਮ';

  @override
  String get privacyPolicy => 'ਪਰਦੇਦਾਰੀ ਨੀਤੀ';

  @override
  String get privacySubtitle => 'ਅਸੀਂ ਕਿਹੜਾ ਡਾਟਾ ਲੈਂਦੇ ਹਾਂ ਅਤੇ ਕਿਉਂ';

  @override
  String get yourShop => 'ਤੁਹਾਡੀ ਦੁਕਾਨ';

  @override
  String get uploadingLogo => 'ਦੁਕਾਨ ਦਾ ਲੋਗੋ ਅੱਪਲੋਡ ਹੋ ਰਿਹਾ ਹੈ';

  @override
  String get logoTapToChange => 'ਦੁਕਾਨ ਦਾ ਲੋਗੋ, ਬਦਲਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get brandTagline => 'ਦੁਕਾਨ ਰੁੱਝੀ, ਹਿਸਾਬ ਸ਼ਾਂਤ।';

  @override
  String serverError(int code) {
    return 'ਸਰਵਰ ਗਲਤੀ: $code';
  }

  @override
  String get deleteCustomer => 'ਗਾਹਕ ਹਟਾਓ';

  @override
  String deleteCustomerMessage(String name) {
    return '$name ਅਤੇ ਉਹਨਾਂ ਦੇ ਸਾਰੇ ਬਿੱਲ ਹਟਾਉਣੇ ਹਨ? ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋਵੇਗਾ।';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'ਹਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'ਹਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ — ਕਨੈਕਸ਼ਨ ਜਾਂਚ ਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get actions => 'ਕਾਰਵਾਈਆਂ';

  @override
  String get edit => 'ਸੋਧੋ';

  @override
  String get delete => 'ਹਟਾਓ';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਗਾਹਕ ਹਟਾਓ',
      one: '1 ਗਾਹਕ ਹਟਾਓ',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਗਾਹਕ ਅਤੇ ਉਹਨਾਂ ਦੇ ਸਾਰੇ ਬਿੱਲ ਹਟਾਉਣੇ ਹਨ? ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋਵੇਗਾ।',
      one: '1 ਗਾਹਕ ਅਤੇ ਉਸਦੇ ਸਾਰੇ ਬਿੱਲ ਹਟਾਉਣੇ ਹਨ? ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋਵੇਗਾ।',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'ਸਭ ਦੀ ਚੋਣ ਹਟਾਓ';

  @override
  String get selectAll => 'ਸਭ ਚੁਣੋ';

  @override
  String selectedCount(int count) {
    return '$count ਚੁਣੇ';
  }

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get newTag => 'ਨਵਾਂ';

  @override
  String get csvNeedsRows => 'CSV ਵਿੱਚ ਹੈਡਰ ਕਤਾਰ ਅਤੇ ਘੱਟੋ-ਘੱਟ ਇੱਕ ਗਾਹਕ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get csvNeedsName => 'CSV ਹੈਡਰ ਵਿੱਚ \"name\" ਕਾਲਮ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String csvLineMissingName(int line) {
    return 'ਲਾਈਨ $line: ਨਾਮ ਨਹੀਂ ਹੈ — ਫ਼ਾਈਲ ਠੀਕ ਕਰਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'ਲਾਈਨ $line: ਗਲਤ credit_limit \"$value\" — ਫ਼ਾਈਲ ਠੀਕ ਕਰਕੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';
  }

  @override
  String get importCustomers => 'ਗਾਹਕ ਆਯਾਤ ਕਰੋ';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" ਵਿੱਚ $count ਗਾਹਕ ਮਿਲੇ। ਸਭ ਆਯਾਤ ਕਰੀਏ?',
      one: '\"$file\" ਵਿੱਚ 1 ਗਾਹਕ ਮਿਲਿਆ। ਆਯਾਤ ਕਰੀਏ?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'ਆਯਾਤ ਕਰੋ';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਗਾਹਕ ਆਯਾਤ ਹੋਏ।',
      one: '1 ਗਾਹਕ ਆਯਾਤ ਹੋਇਆ।',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'ਆਯਾਤ ਅਸਫਲ: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'ਆਯਾਤ ਅਸਫਲ — ਕਨੈਕਟ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get noPhone => 'ਫ਼ੋਨ ਨਹੀਂ';

  @override
  String get offlineShowingSaved => 'ਆਫ਼ਲਾਈਨ — ਸੰਭਾਲੀ ਕਾਪੀ ਦਿਖਾਈ ਜਾ ਰਹੀ ਹੈ';

  @override
  String get searchCustomersHint => 'ਗਾਹਕ ਜਾਂ ਫ਼ੋਨ ਖੋਜੋ...';

  @override
  String get noCustomersYet => 'ਹਾਲੇ ਕੋਈ ਗਾਹਕ ਨਹੀਂ। ਜੋੜਨ ਲਈ + ਟੈਪ ਕਰੋ।';

  @override
  String get noCustomersMatch => 'ਖੋਜ ਨਾਲ ਕੋਈ ਗਾਹਕ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get owesMoney => 'ਪੈਸੇ ਬਾਕੀ ਹਨ';

  @override
  String get settledUp => 'ਹਿਸਾਬ ਬਰਾਬਰ';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get takePhoto => 'ਫ਼ੋਟੋ ਲਵੋ';

  @override
  String get chooseFromGallery => 'ਗੈਲਰੀ ਤੋਂ ਚੁਣੋ';

  @override
  String get back => 'ਵਾਪਸ';

  @override
  String callPhone(String phone) {
    return '$phone \'ਤੇ ਕਾਲ ਕਰੋ';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone \'ਤੇ WhatsApp';
  }

  @override
  String get clearSearch => 'ਖੋਜ ਸਾਫ਼ ਕਰੋ';

  @override
  String get askHint => 'ਜਿਵੇਂ ਇਸ ਮਹੀਨੇ ਮੈਨੂੰ ਕਿੰਨਾ ਮੁਨਾਫ਼ਾ ਹੋਇਆ?';

  @override
  String get acctTurnOffLockTitle => 'ਐਪ ਲਾਕ ਬੰਦ ਕਰੋ?';

  @override
  String get acctTurnOffLockBody => 'ਇਸ ਫ਼ੋਨ ਵਾਲਾ ਕੋਈ ਵੀ ਵਿਅਕਤੀ PIN ਤੋਂ ਬਿਨਾਂ ਐਪ ਖੋਲ੍ਹ ਸਕੇਗਾ।';

  @override
  String get acctTurnOff => 'ਬੰਦ ਕਰੋ';

  @override
  String get acctSetPinTitle => 'PIN ਸੈੱਟ ਕਰੋ';

  @override
  String get acctPinLabel => '4-6 ਅੰਕਾਂ ਦਾ PIN';

  @override
  String get acctPinMin => 'ਘੱਟੋ-ਘੱਟ 4 ਅੰਕ';

  @override
  String get acctConfirmPin => 'PIN ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get acctPinMismatch => 'PIN ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get acctSetPin => 'PIN ਸੈੱਟ ਕਰੋ';

  @override
  String get acctBiometricTitle => 'ਫਿੰਗਰਪ੍ਰਿੰਟ/ਚਿਹਰਾ ਵੀ ਵਰਤਣਾ ਹੈ?';

  @override
  String get acctBiometricBody => 'ਬਾਇਓਮੈਟ੍ਰਿਕ ਫੇਲ੍ਹ ਹੋਣ ਤੇ ਵੀ ਤੁਸੀਂ PIN ਵਰਤ ਸਕਦੇ ਹੋ।';

  @override
  String get acctNoThanks => 'ਨਹੀਂ, ਧੰਨਵਾਦ';

  @override
  String get acctEnable => 'ਚਾਲੂ ਕਰੋ';

  @override
  String get acctSetPasswordTitle => 'ਪਾਸਵਰਡ ਸੈੱਟ ਕਰੋ';

  @override
  String get acctSetPasswordIntro => 'ਇੱਕ ਪਾਸਵਰਡ ਚੁਣੋ ਤਾਂ ਜੋ ਅਗਲੀ ਵਾਰ ਸਿਰਫ਼ Google ਦੀ ਥਾਂ ਈਮੇਲ + ਪਾਸਵਰਡ ਨਾਲ ਵੀ ਸਾਈਨ ਇਨ ਕਰ ਸਕੋ।';

  @override
  String get acctPassword => 'ਪਾਸਵਰਡ';

  @override
  String get acctPasswordMin => 'ਘੱਟੋ-ਘੱਟ 6 ਅੱਖਰ ਹੋਣੇ ਚਾਹੀਦੇ ਹਨ';

  @override
  String get acctConfirmPassword => 'ਪਾਸਵਰਡ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get acctPasswordsMismatch => 'ਪਾਸਵਰਡ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get acctSetPasswordButton => 'ਪਾਸਵਰਡ ਸੈੱਟ ਕਰੋ';

  @override
  String get acctPasswordSet => 'ਪਾਸਵਰਡ ਸੈੱਟ ਹੋ ਗਿਆ — ਹੁਣ ਤੁਸੀਂ ਇਸ ਨਾਲ ਵੀ ਸਾਈਨ ਇਨ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'ਪਾਸਵਰਡ ਸੈੱਟ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get acctChangePasswordTitle => 'ਪਾਸਵਰਡ ਬਦਲੋ';

  @override
  String get acctCurrentPassword => 'ਮੌਜੂਦਾ ਪਾਸਵਰਡ';

  @override
  String get acctRequired => 'ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get acctNewPassword => 'ਨਵਾਂ ਪਾਸਵਰਡ';

  @override
  String get acctConfirmNewPassword => 'ਨਵੇਂ ਪਾਸਵਰਡ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get acctChange => 'ਬਦਲੋ';

  @override
  String get acctPasswordChanged => 'ਪਾਸਵਰਡ ਬਦਲ ਗਿਆ।';

  @override
  String get acctWrongPassword => 'ਮੌਜੂਦਾ ਪਾਸਵਰਡ ਗ਼ਲਤ ਹੈ।';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'ਪਾਸਵਰਡ ਬਦਲਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'ਯੂਜ਼ਰਨੇਮ ਬਦਲੋ';

  @override
  String get acctUsername => 'ਯੂਜ਼ਰਨੇਮ';

  @override
  String get acctUsernameEmpty => 'ਯੂਜ਼ਰਨੇਮ ਖ਼ਾਲੀ ਨਹੀਂ ਹੋ ਸਕਦਾ';

  @override
  String get acctUsernameChanged => 'ਯੂਜ਼ਰਨੇਮ ਬਦਲ ਗਿਆ।';

  @override
  String get acctChangeEmailTitle => 'ਈਮੇਲ ਬਦਲੋ';

  @override
  String get acctNewEmail => 'ਨਵੀਂ ਈਮੇਲ';

  @override
  String get acctValidEmail => 'ਸਹੀ ਈਮੇਲ ਦਰਜ ਕਰੋ';

  @override
  String get acctRequiredConfirm => 'ਤੁਹਾਡੀ ਪਛਾਣ ਦੀ ਪੁਸ਼ਟੀ ਲਈ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get acctGoogleConfirmFirst => 'ਪਹਿਲਾਂ ਤੁਹਾਨੂੰ Google ਨਾਲ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਕਿਹਾ ਜਾਵੇਗਾ।';

  @override
  String acctCheckEmail(String email) {
    return 'ਤਬਦੀਲੀ ਦੀ ਪੁਸ਼ਟੀ ਦੇ ਲਿੰਕ ਲਈ $email ਵੇਖੋ।';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'ਪਾਸਵਰਡ ਨਾਲ ਸਾਈਨ-ਇਨ';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider ਹਟਾਉਣਾ ਹੈ?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'ਤੁਸੀਂ ਇਸ ਖਾਤੇ ਵਿੱਚ $provider ਨਾਲ ਸਾਈਨ ਇਨ ਨਹੀਂ ਕਰ ਸਕੋਗੇ।';
  }

  @override
  String get acctRemove => 'ਹਟਾਓ';

  @override
  String acctRemoved(String provider) {
    return '$provider ਹਟਾ ਦਿੱਤਾ ਗਿਆ।';
  }

  @override
  String get acctSignedIn => 'ਸਾਈਨ ਇਨ ਹੈ';

  @override
  String get acctEmailNotVerified => 'ਈਮੇਲ ਦੀ ਹਾਲੇ ਪੁਸ਼ਟੀ ਨਹੀਂ ਹੋਈ।';

  @override
  String get acctVerificationSent => 'ਪੁਸ਼ਟੀ ਵਾਲੀ ਈਮੇਲ ਭੇਜ ਦਿੱਤੀ ਗਈ।';

  @override
  String get acctResend => 'ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String get acctSectionSignIn => 'ਸਾਈਨ-ਇਨ ਅਤੇ ਸੁਰੱਖਿਆ';

  @override
  String get acctRowChangeUsername => 'ਯੂਜ਼ਰਨੇਮ ਬਦਲੋ';

  @override
  String get acctRowChangeEmail => 'ਈਮੇਲ ਬਦਲੋ';

  @override
  String get acctRowSetPassword => 'ਪਾਸਵਰਡ ਸੈੱਟ ਕਰੋ';

  @override
  String get acctRowChangePassword => 'ਪਾਸਵਰਡ ਬਦਲੋ';

  @override
  String get acctRowUnlinkGoogle => 'Google ਅਣਲਿੰਕ ਕਰੋ';

  @override
  String get acctRowRemovePassword => 'ਪਾਸਵਰਡ ਹਟਾਓ';

  @override
  String get acctRowAppLock => 'ਐਪ ਲਾਕ (PIN)';

  @override
  String get acctRowBiometric => 'ਫਿੰਗਰਪ੍ਰਿੰਟ/ਚਿਹਰਾ ਵਰਤੋ';

  @override
  String get acctSignOutTitle => 'ਸਾਈਨ ਆਊਟ ਕਰਨਾ ਹੈ?';

  @override
  String get acctSignOutBody => 'ਐਪ ਵਰਤਣ ਲਈ ਤੁਹਾਨੂੰ ਦੁਬਾਰਾ ਸਾਈਨ ਇਨ ਕਰਨਾ ਪਵੇਗਾ।';

  @override
  String get acctSignOut => 'ਸਾਈਨ ਆਊਟ';

  @override
  String get acctDeleteAccount => 'ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get acctDeleting => 'ਮਿਟਾਇਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get acctDeleteTitle => 'ਖਾਤਾ ਮਿਟਾਉਣਾ ਹੈ?';

  @override
  String get acctDeleteBody => 'ਇਹ ਤੁਹਾਡੀ ਸਾਈਨ-ਇਨ ਜਾਣਕਾਰੀ ਪੱਕੇ ਤੌਰ ਤੇ ਮਿਟਾ ਦੇਵੇਗਾ। ਐਪ ਵਰਤਣ ਲਈ ਤੁਹਾਨੂੰ ਦੁਬਾਰਾ ਸਾਈਨ ਅੱਪ ਕਰਨਾ ਪਵੇਗਾ। ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String acctCouldNotDelete(String error) {
    return 'ਖਾਤਾ ਮਿਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $error';
  }

  @override
  String get itmNotFoundTitle => 'ਆਈਟਮ ਨਹੀਂ ਮਿਲੀ';

  @override
  String itmNotFoundBody(String barcode) {
    return 'ਬਾਰਕੋਡ $barcode ਵਾਲੀ ਕੋਈ ਆਈਟਮ ਨਹੀਂ ਹੈ। ਕੀ ਇਸਨੂੰ ਹੁਣੇ ਨਵੀਂ ਆਈਟਮ ਵਜੋਂ ਜੋੜਨਾ ਹੈ?';
  }

  @override
  String get itmAddItem => 'ਆਈਟਮ ਜੋੜੋ';

  @override
  String get itmEditItem => 'ਆਈਟਮ ਸੋਧੋ';

  @override
  String get itmMergeTitle => 'ਡੁਪਲੀਕੇਟ ਆਈਟਮਾਂ ਮਿਲਾਓ';

  @override
  String get itmMergeBody => 'ਇੱਕੋ ਨਾਂ ਵਾਲੀਆਂ ਆਈਟਮਾਂ ਸਭ ਤੋਂ ਪੁਰਾਣੀ ਐਂਟਰੀ ਵਿੱਚ ਮਿਲਾ ਦਿੱਤੀਆਂ ਜਾਣਗੀਆਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦਾ ਸਟਾਕ ਜੋੜ ਦਿੱਤਾ ਜਾਵੇਗਾ। ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get itmMerge => 'ਮਿਲਾਓ';

  @override
  String get itmNoDuplicates => 'ਕੋਈ ਡੁਪਲੀਕੇਟ ਆਈਟਮ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਡੁਪਲੀਕੇਟ ਆਈਟਮਾਂ ਮਿਲਾਈਆਂ ਗਈਆਂ।',
      one: '1 ਡੁਪਲੀਕੇਟ ਆਈਟਮ ਮਿਲਾਈ ਗਈ।',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'ਆਈਟਮ ਮਿਟਾਓ';

  @override
  String get itmCannotUndo => 'ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get itmDeleteOffline => 'ਮਿਟਾਇਆ ਨਹੀਂ ਜਾ ਸਕਿਆ — ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਚੈੱਕ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਆਈਟਮਾਂ ਮਿਟਾਓ',
      one: '1 ਆਈਟਮ ਮਿਟਾਓ',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਆਈਟਮਾਂ ਮਿਟਾਉਣੀਆਂ ਹਨ? ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।',
      one: '1 ਆਈਟਮ ਮਿਟਾਉਣੀ ਹੈ? ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'ਫੋਟੋ ਅੱਪਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀ ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'ਫੋਟੋ ਅੱਪਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀ: $error';
  }

  @override
  String get itmNoBarcodes => 'ਹਾਲੇ ਕਿਸੇ ਆਈਟਮ ਦਾ ਬਾਰਕੋਡ ਨਹੀਂ ਹੈ।';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਲੇਬਲ ਪ੍ਰਿੰਟ ਕਰੋ',
      one: '1 ਲੇਬਲ ਪ੍ਰਿੰਟ ਕਰੋ',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'ਆਈਟਮ ਜਾਂ ਸ਼੍ਰੇਣੀ ਖੋਜੋ...';

  @override
  String get itmStopListening => 'ਸੁਣਨਾ ਬੰਦ ਕਰੋ';

  @override
  String get itmVoiceSearch => 'ਆਵਾਜ਼ ਨਾਲ ਖੋਜ';

  @override
  String get itmSort => 'ਕ੍ਰਮ';

  @override
  String get itmSortName => 'ਨਾਂ (ੳ-ੜ)';

  @override
  String get itmSortStockLow => 'ਸਟਾਕ: ਘੱਟ ਤੋਂ ਵੱਧ';

  @override
  String get itmSortRecent => 'ਹਾਲ ਹੀ ਵਿੱਚ ਜੋੜੀਆਂ';

  @override
  String get itmFilterAll => 'ਸਾਰੇ';

  @override
  String get itmFilterLowStock => 'ਘੱਟ ਸਟਾਕ';

  @override
  String get itmNoItemsYet => 'ਹਾਲੇ ਕੋਈ ਆਈਟਮ ਨਹੀਂ। ਜੋੜਨ ਲਈ + ਦਬਾਓ।';

  @override
  String get itmNoItemsMatch => 'ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਕੋਈ ਆਈਟਮ ਮੇਲ ਨਹੀਂ ਖਾਂਦੀ।';

  @override
  String get itmNoPriceChanges => 'ਹਾਲੇ ਕੀਮਤ ਵਿੱਚ ਕੋਈ ਤਬਦੀਲੀ ਦਰਜ ਨਹੀਂ ਹੋਈ।';

  @override
  String get itmNoStockCorrections => 'ਹਾਲੇ ਕੋਈ ਸਟਾਕ ਸੁਧਾਰ ਦਰਜ ਨਹੀਂ ਹੋਇਆ।';

  @override
  String get itmResetHistory => 'ਇਤਿਹਾਸ ਰੀਸੈੱਟ ਕਰੋ';

  @override
  String get itmResetHistoryMsg => 'ਇਸ ਆਈਟਮ ਦਾ ਇਤਿਹਾਸ ਰੀਸੈੱਟ ਕਰਨਾ ਹੈ? ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋ ਸਕਦਾ।';

  @override
  String get itmSendPdf => 'PDF ਵਜੋਂ ਭੇਜੋ';

  @override
  String get itmNoteOptional => 'ਨੋਟ (ਵਿਕਲਪਿਕ)';

  @override
  String get itmNoteHint => 'ਇਸ ਬਦਲਾਅ ਲਈ ਨੋਟ ਜੋੜੋ';

  @override
  String get itmRemoveEntry => 'ਐਂਟਰੀ ਹਟਾਓ';

  @override
  String get itmRemoveEntryMsg => 'ਇਸ ਐਂਟਰੀ ਨੂੰ ਇਤਿਹਾਸ ਵਿੱਚੋਂ ਹਟਾਉਣਾ ਹੈ? ਇਹ ਵਾਪਸ ਨਹੀਂ ਹੋ ਸਕਦਾ।';

  @override
  String get itmEditEntry => 'ਐਂਟਰੀ ਸੋਧੋ';

  @override
  String get itmPrevQty => 'ਪਹਿਲਾਂ';

  @override
  String get itmNewQty => 'ਨਵਾਂ';

  @override
  String itmCost(String amount) {
    return 'ਲਾਗਤ: $amount';
  }

  @override
  String get itmMore => 'ਹੋਰ';

  @override
  String get itmMenuPrintLabel => 'ਲੇਬਲ ਪ੍ਰਿੰਟ ਕਰੋ';

  @override
  String get itmMenuDuplicate => 'ਡੁਪਲੀਕੇਟ ਬਣਾਓ';

  @override
  String get itmMenuPriceHistory => 'ਕੀਮਤ ਦਾ ਇਤਿਹਾਸ';

  @override
  String get itmMenuStockHistory => 'ਸਟਾਕ ਸੁਧਾਰ ਦਾ ਇਤਿਹਾਸ';

  @override
  String itmLowStockBadge(int count) {
    return '$count ਘੱਟ ਸਟਾਕ';
  }

  @override
  String itmStockLine(String qty) {
    return 'ਸਟਾਕ: $qty';
  }

  @override
  String get itmOfflineSaved => 'ਆਫ਼ਲਾਈਨ — ਆਈਟਮ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਈ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗੀ';

  @override
  String get itmItemName => 'ਆਈਟਮ ਦਾ ਨਾਂ';

  @override
  String get itmNameRequired => 'ਨਾਂ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get itmPricePkr => 'ਕੀਮਤ (PKR)';

  @override
  String get itmPriceRequired => 'ਕੀਮਤ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get itmValidNumber => 'ਸਹੀ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get itmUnit => 'ਇਕਾਈ';

  @override
  String get itmCategoryHint => 'ਸ਼੍ਰੇਣੀ (ਵਿਕਲਪਿਕ, ਜਿਵੇਂ ਪਲੰਬਿੰਗ)';

  @override
  String get itmPreferredSupplier => 'ਪਸੰਦੀਦਾ ਸਪਲਾਇਰ (ਵਿਕਲਪਿਕ)';

  @override
  String get itmPreferredSupplierHelper => 'ਇੱਕ-ਟੈਪ ਰੀਆਰਡਰ ਵਿੱਚ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get itmClear => 'ਸਾਫ਼ ਕਰੋ';

  @override
  String get itmHsn => 'HSN ਕੋਡ (ਵਿਕਲਪਿਕ)';

  @override
  String get itmGstRate => 'GST ਦਰ % (ਵਿਕਲਪਿਕ)';

  @override
  String get itmBarcodeOptional => 'ਬਾਰਕੋਡ (ਵਿਕਲਪਿਕ)';

  @override
  String get itmScanOrType => 'ਸਕੈਨ ਕਰੋ ਜਾਂ ਲਿਖੋ';

  @override
  String get itmScanBarcode => 'ਬਾਰਕੋਡ ਸਕੈਨ ਕਰੋ';

  @override
  String get itmPurchaseCost => 'ਖਰੀਦ ਲਾਗਤ (ਪ੍ਰਤੀ ਇਕਾਈ)';

  @override
  String get itmPurchaseCostHint => 'ਸਟਾਕ ਖਰੀਦਣ ਵੇਲੇ ਤੁਸੀਂ ਕਿੰਨਾ ਦਿੰਦੇ ਹੋ';

  @override
  String get itmWholesale => 'ਥੋਕ ਕੀਮਤ (ਵਿਕਲਪਿਕ)';

  @override
  String get itmContractor => 'ਠੇਕੇਦਾਰ ਕੀਮਤ (ਵਿਕਲਪਿਕ)';

  @override
  String get itmFallsBack => 'ਨਾ ਹੋਣ ਤੇ ਆਮ ਕੀਮਤ ਲਾਗੂ ਹੋਵੇਗੀ';

  @override
  String get itmStockQty => 'ਸਟਾਕ ਮਾਤਰਾ';

  @override
  String get itmLowStockAlert => 'ਘੱਟ ਸਟਾਕ ਅਲਰਟ ਇਸ ਤੋਂ ਹੇਠਾਂ';

  @override
  String get itmFrequently => 'ਅਕਸਰ ਨਾਲ ਖਰੀਦੀਆਂ ਜਾਂਦੀਆਂ';

  @override
  String get itmSaveChanges => 'ਤਬਦੀਲੀਆਂ ਸੇਵ ਕਰੋ';

  @override
  String get itmSaveItem => 'ਆਈਟਮ ਸੇਵ ਕਰੋ';

  @override
  String get itmPhotoSemantics => 'ਆਈਟਮ ਦੀ ਫੋਟੋ, ਬਦਲਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get cdUpdateStatusTitle => 'ਭੁਗਤਾਨ ਦੀ ਸਥਿਤੀ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get cdMarkPaidQ => 'ਇਸ ਬਿੱਲ ਨੂੰ ਅਦਾ ਕੀਤਾ ਮਾਰਕ ਕਰਨਾ ਹੈ?';

  @override
  String get cdMarkUnpaidQ => 'ਇਸ ਬਿੱਲ ਨੂੰ ਬਿਨਾਂ ਅਦਾ ਕੀਤਾ ਮਾਰਕ ਕਰਨਾ ਹੈ?';

  @override
  String get cdConfirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'ਅੱਪਡੇਟ ਨਹੀਂ ਹੋ ਸਕਿਆ: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'ਆਫ਼ਲਾਈਨ — ਤਬਦੀਲੀ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਈ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗੀ';

  @override
  String get cdConvertTitle => 'ਬਿੱਲ ਵਿੱਚ ਬਦਲੋ';

  @override
  String get cdConvertBody => 'ਇਸ ਨਾਲ ਇਨ੍ਹਾਂ ਆਈਟਮਾਂ ਦਾ ਸਟਾਕ ਘਟੇਗਾ ਅਤੇ ਕੋਟੇਸ਼ਨ ਅਸਲ ਬਿੱਲ ਬਣ ਜਾਵੇਗੀ। ਜਾਰੀ ਰੱਖਣਾ ਹੈ?';

  @override
  String get cdConvert => 'ਬਦਲੋ';

  @override
  String cdCouldNotConvert(String detail) {
    return 'ਬਦਲਿਆ ਨਹੀਂ ਜਾ ਸਕਿਆ: $detail';
  }

  @override
  String get cdReturnItems => 'ਆਈਟਮਾਂ ਵਾਪਸ ਕਰੋ';

  @override
  String get cdReturnHint => 'ਹਰ ਆਈਟਮ ਦੀ ਵਾਪਸੀ ਦੀ ਮਾਤਰਾ ਤੈਅ ਕਰੋ। ਵਿਕਰੀ ਕਾਇਮ ਰੱਖਣ ਲਈ 0 ਰਹਿਣ ਦਿਓ।';

  @override
  String get cdDecreaseQty => 'ਮਾਤਰਾ ਘਟਾਓ';

  @override
  String get cdIncreaseQty => 'ਮਾਤਰਾ ਵਧਾਓ';

  @override
  String get cdCreditTotal => 'ਕ੍ਰੈਡਿਟ ਕੁੱਲ';

  @override
  String get cdReturnSelected => 'ਚੁਣੀਆਂ ਵਾਪਸ ਕਰੋ';

  @override
  String cdCouldNotReturn(String detail) {
    return 'ਵਾਪਸ ਨਹੀਂ ਹੋ ਸਕਿਆ: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'ਰੱਦ ਨਹੀਂ ਹੋ ਸਕਿਆ: $detail';
  }

  @override
  String get cdNoPreviousBill => 'ਦੁਹਰਾਉਣ ਲਈ ਕੋਈ ਪਿਛਲਾ ਬਿੱਲ ਨਹੀਂ';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'ਆਖ਼ਰੀ ਬਿੱਲ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'ਇਨਵਾਇਸ ਗਾਹਕ ਨੂੰ ਈਮੇਲ ਕਰ ਦਿੱਤੀ ਗਈ।';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'ਇਨਵਾਇਸ ਈਮੇਲ ਨਹੀਂ ਹੋ ਸਕੀ: $detail';
  }

  @override
  String get cdStatementEmailed => 'ਸਟੇਟਮੈਂਟ ਗਾਹਕ ਨੂੰ ਈਮੇਲ ਕਰ ਦਿੱਤੀ ਗਈ।';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'ਸਟੇਟਮੈਂਟ ਈਮੇਲ ਨਹੀਂ ਹੋ ਸਕੀ: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'ਬਿੱਲ ਮਿਟਾਓ';

  @override
  String get cdBillVoided => 'ਰੱਦ';

  @override
  String get cdBillReturn => 'ਵਾਪਸੀ';

  @override
  String get cdBillQuote => 'ਕੋਟੇਸ਼ਨ';

  @override
  String get cdBillPaid => 'ਅਦਾ ਕੀਤਾ';

  @override
  String get cdBillPartial => 'ਅੰਸ਼ਕ';

  @override
  String get cdBillUnpaid => 'ਬਕਾਇਆ';

  @override
  String get cdBill => 'ਬਿੱਲ';

  @override
  String cdVoidedReason(String reason) {
    return 'ਰੱਦ: $reason';
  }

  @override
  String get cdViewInvoice => 'ਇਨਵਾਇਸ ਵੇਖੋ';

  @override
  String get cdEmailInvoice => 'ਇਨਵਾਇਸ ਈਮੇਲ ਕਰੋ';

  @override
  String get cdEditBill => 'ਬਿੱਲ ਸੋਧੋ';

  @override
  String get cdReturnBill => 'ਬਿੱਲ ਵਾਪਸ ਕਰੋ';

  @override
  String get cdVoidBill => 'ਬਿੱਲ ਰੱਦ ਕਰੋ';

  @override
  String get cdNoItems => 'ਕੋਈ ਆਈਟਮ ਨਹੀਂ';

  @override
  String get cdRepeatLast => 'ਆਖ਼ਰੀ ਬਿੱਲ ਦੁਹਰਾਓ';

  @override
  String get cdLedgerPdf => 'ਖਾਤਾ PDF';

  @override
  String get cdEmailStatement => 'ਸਟੇਟਮੈਂਟ ਈਮੇਲ ਕਰੋ';

  @override
  String get cdCollectPayment => 'ਭੁਗਤਾਨ ਵਸੂਲੋ';

  @override
  String get cdSendReminder => 'ਵਟਸਐਪ ਯਾਦ-ਦਹਾਨੀ ਭੇਜੋ';

  @override
  String get cdTotalBilled => 'ਕੁੱਲ ਬਿੱਲ';

  @override
  String get cdPaid => 'ਅਦਾ ਕੀਤਾ';

  @override
  String get cdNoBills => 'ਹਾਲੇ ਕੋਈ ਬਿੱਲ ਨਹੀਂ';

  @override
  String get cdBillActions => 'ਬਿੱਲ ਦੇ ਵਿਕਲਪ';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'ਕ੍ਰੈਡਿਟ ਹੱਦ $limit ਵਿੱਚੋਂ $outstanding ਵਰਤਿਆ ਗਿਆ';
  }

  @override
  String get cdVoidBody => 'ਇਹ ਇਸਨੂੰ ਬੈਲੇਂਸ ਅਤੇ ਰਿਪੋਰਟਾਂ ਵਿੱਚੋਂ ਹਟਾ ਦੇਵੇਗਾ ਪਰ ਇਤਿਹਾਸ ਵਿੱਚ ਰੱਖੇਗਾ। ਸਟਾਕ ਬਹਾਲ ਹੋ ਜਾਵੇਗਾ। ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get cdReason => 'ਕਾਰਨ (ਵਿਕਲਪਿਕ)';

  @override
  String get frmOfflineCustomer => 'ਆਫ਼ਲਾਈਨ — ਗਾਹਕ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਿਆ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗਾ';

  @override
  String get frmOfflineSupplier => 'ਆਫ਼ਲਾਈਨ — ਸਪਲਾਇਰ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਿਆ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗਾ';

  @override
  String get frmEditCustomer => 'ਗਾਹਕ ਸੋਧੋ';

  @override
  String get frmCustomerName => 'ਗਾਹਕ ਦਾ ਨਾਂ';

  @override
  String get frmPhoneOptional => 'ਫ਼ੋਨ (ਵਿਕਲਪਿਕ)';

  @override
  String get frmCreditLimit => 'ਕ੍ਰੈਡਿਟ ਹੱਦ (PKR, ਵਿਕਲਪਿਕ)';

  @override
  String get frmCreditHelper => 'ਇਸ ਗਾਹਕ ਦਾ ਬੈਲੇਂਸ ਇਸ ਤੋਂ ਵੱਧ ਹੋਣ ਤੇ ਚੇਤਾਵਨੀ ਦਿਓ';

  @override
  String get frmPriceTier => 'ਕੀਮਤ ਦਾ ਪੱਧਰ';

  @override
  String get frmRetail => 'ਪ੍ਰਚੂਨ';

  @override
  String get frmWholesale => 'ਥੋਕ';

  @override
  String get frmContractor => 'ਠੇਕੇਦਾਰ';

  @override
  String get frmPriceTierHelper => 'ਬਿੱਲ ਬਣਾਉਣ ਵੇਲੇ ਇਸ ਗਾਹਕ ਲਈ ਕਿਹੜੀ ਕੀਮਤ ਪਹਿਲਾਂ ਤੋਂ ਭਰੀ ਜਾਵੇ';

  @override
  String get frmStrn => 'STRN (ਵਿਕਲਪਿਕ)';

  @override
  String get frmStrnCustomer => 'ਇਨਵਾਇਸ ਲਈ 13 ਅੰਕਾਂ ਦਾ ਸੇਲਜ਼ ਟੈਕਸ ਰਜਿਸਟ੍ਰੇਸ਼ਨ ਨੰਬਰ';

  @override
  String get frmStrnSupplier => 'ਖਰੀਦ ਬਿੱਲਾਂ ਲਈ 13 ਅੰਕਾਂ ਦਾ ਸੇਲਜ਼ ਟੈਕਸ ਰਜਿਸਟ੍ਰੇਸ਼ਨ ਨੰਬਰ';

  @override
  String get frmAddress => 'ਪਤਾ (ਵਿਕਲਪਿਕ)';

  @override
  String get frmEmail => 'ਈਮੇਲ (ਵਿਕਲਪਿਕ)';

  @override
  String get frmEmailHelper => 'ਇਸ ਗਾਹਕ ਨੂੰ ਇਨਵਾਇਸ ਜਾਂ ਸਟੇਟਮੈਂਟ ਈਮੇਲ ਕਰਨ ਦੀ ਸਹੂਲਤ';

  @override
  String get frmSaveCustomer => 'ਗਾਹਕ ਸੇਵ ਕਰੋ';

  @override
  String get frmEditSupplier => 'ਸਪਲਾਇਰ ਸੋਧੋ';

  @override
  String get frmSupplierName => 'ਸਪਲਾਇਰ ਦਾ ਨਾਂ';

  @override
  String get frmSaveSupplier => 'ਸਪਲਾਇਰ ਸੇਵ ਕਰੋ';

  @override
  String get sdDeletePurchaseTitle => 'ਖਰੀਦ ਮਿਟਾਓ';

  @override
  String get sdDeletePurchaseBody => 'ਇਸ ਖਰੀਦ ਦਾ ਸਟਾਕ ਬਹਾਲ ਹੋ ਜਾਵੇਗਾ। ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get sdReturnToSupplier => 'ਸਪਲਾਇਰ ਨੂੰ ਵਾਪਸ ਕਰੋ';

  @override
  String get sdReturnHint => 'ਹਰ ਆਈਟਮ ਦੀ ਵਾਪਸ ਭੇਜਣ ਵਾਲੀ ਮਾਤਰਾ ਤੈਅ ਕਰੋ। ਰੱਖਣ ਲਈ 0 ਰਹਿਣ ਦਿਓ।';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'ਪ੍ਰਾਪਤ ਮਾਰਕ ਨਹੀਂ ਹੋ ਸਕਿਆ: $detail';
  }

  @override
  String get sdMarkPaidQ => 'ਇਸ ਖਰੀਦ ਨੂੰ ਅਦਾ ਕੀਤੀ ਮਾਰਕ ਕਰਨਾ ਹੈ?';

  @override
  String get sdMarkUnpaidQ => 'ਇਸ ਖਰੀਦ ਨੂੰ ਬਿਨਾਂ ਅਦਾ ਕੀਤੀ ਮਾਰਕ ਕਰਨਾ ਹੈ?';

  @override
  String get sdTotalPurchased => 'ਕੁੱਲ ਖਰੀਦ';

  @override
  String get sdPayable => 'ਦੇਣਯੋਗ';

  @override
  String sdPayableAmount(String amount) {
    return '$amount ਦੇਣਯੋਗ';
  }

  @override
  String get sdNoPurchases => 'ਹਾਲੇ ਕੋਈ ਖਰੀਦ ਨਹੀਂ';

  @override
  String get sdPo => 'ਪੀਓ';

  @override
  String get sdDraftPo => 'ਡਰਾਫ਼ਟ ਪੀਓ';

  @override
  String get sdPurchase => 'ਖਰੀਦ';

  @override
  String get sdDraftNote => 'ਡਰਾਫ਼ਟ ਖਰੀਦ ਆਰਡਰ — ਹਾਲੇ ਪ੍ਰਾਪਤ ਨਹੀਂ ਹੋਇਆ, ਸਟਾਕ ਜਾਂ ਲਾਗਤ ਵਿੱਚ ਹਾਲੇ ਕੋਈ ਤਬਦੀਲੀ ਨਹੀਂ।';

  @override
  String get sdReturnNote => 'ਸਪਲਾਇਰ ਨੂੰ ਵਾਪਸੀ / ਕ੍ਰੈਡਿਟ ਨੋਟ।';

  @override
  String get sdMarkReceived => 'ਪ੍ਰਾਪਤ ਮਾਰਕ ਕਰੋ';

  @override
  String get sdEditPurchase => 'ਖਰੀਦ ਸੋਧੋ';

  @override
  String get sdPurchaseActions => 'ਖਰੀਦ ਦੇ ਵਿਕਲਪ';

  @override
  String get slDeleteSupplier => 'ਸਪਲਾਇਰ ਮਿਟਾਓ';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸਪਲਾਇਰ ਮਿਟਾਓ',
      one: '1 ਸਪਲਾਇਰ ਮਿਟਾਓ',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸਪਲਾਇਰ ਅਤੇ ਉਨ੍ਹਾਂ ਦੀਆਂ ਸਾਰੀਆਂ ਖਰੀਦਾਂ ਮਿਟਾਉਣੀਆਂ ਹਨ? ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।',
      one: '1 ਸਪਲਾਇਰ ਅਤੇ ਉਸਦੀਆਂ ਸਾਰੀਆਂ ਖਰੀਦਾਂ ਮਿਟਾਉਣੀਆਂ ਹਨ? ਇਸਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV ਵਿੱਚ ਹੈਡਰ ਕਤਾਰ ਤੋਂ ਇਲਾਵਾ ਘੱਟੋ-ਘੱਟ ਇੱਕ ਸਪਲਾਇਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get slImportTitle => 'ਸਪਲਾਇਰ ਇੰਪੋਰਟ ਕਰੋ';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" ਵਿੱਚ $count ਸਪਲਾਇਰ ਮਿਲੇ। ਸਾਰੇ ਇੰਪੋਰਟ ਕਰਨੇ ਹਨ?',
      one: '\"$file\" ਵਿੱਚ 1 ਸਪਲਾਇਰ ਮਿਲਿਆ। ਸਾਰੇ ਇੰਪੋਰਟ ਕਰਨੇ ਹਨ?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸਪਲਾਇਰ ਇੰਪੋਰਟ ਹੋਏ।',
      one: '1 ਸਪਲਾਇਰ ਇੰਪੋਰਟ ਹੋਇਆ।',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'ਹਾਲੇ ਕੋਈ ਸਪਲਾਇਰ ਨਹੀਂ। ਜੋੜਨ ਲਈ + ਦਬਾਓ।';

  @override
  String get slSearchHint => 'ਸਪਲਾਇਰ ਜਾਂ ਫ਼ੋਨ ਖੋਜੋ...';

  @override
  String get slNoMatch => 'ਤੁਹਾਡੀ ਖੋਜ ਨਾਲ ਕੋਈ ਸਪਲਾਇਰ ਮੇਲ ਨਹੀਂ ਖਾਂਦਾ।';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸਪਲਾਇਰ',
      one: '1 ਸਪਲਾਇਰ',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'ਸਪਲਾਇਰ ਬਕਾਏ';

  @override
  String get sduNothingOwed => 'ਸਪਲਾਇਰਾਂ ਨੂੰ ਕੁਝ ਦੇਣਾ ਬਾਕੀ ਨਹੀਂ 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸਪਲਾਇਰਾਂ ਨੂੰ ਭੁਗਤਾਨ ਬਾਕੀ',
      one: '1 ਸਪਲਾਇਰ ਨੂੰ ਭੁਗਤਾਨ ਬਾਕੀ',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'ਸਭ ਤੋਂ ਪੁਰਾਣੀ ਬਿਨਾਂ ਅਦਾ ਖਰੀਦ ਨੂੰ $days ਦਿਨ ਹੋਏ',
      one: 'ਸਭ ਤੋਂ ਪੁਰਾਣੀ ਬਿਨਾਂ ਅਦਾ ਖਰੀਦ ਨੂੰ 1 ਦਿਨ ਹੋਇਆ',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 ਦਿਨ';

  @override
  String get duBucket1 => '30–60 ਦਿਨ';

  @override
  String get duBucket2 => '60+ ਦਿਨ';

  @override
  String get duTitle => 'ਬਕਾਇਆ ਕੇਂਦਰ';

  @override
  String get duNoDues => 'ਕੋਈ ਬਕਾਇਆ ਨਹੀਂ 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਗਾਹਕਾਂ ਦਾ ਬਕਾਇਆ',
      one: '1 ਗਾਹਕ ਦਾ ਬਕਾਇਆ',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'ਸਭ ਤੋਂ ਪੁਰਾਣੇ ਬਿਨਾਂ ਅਦਾ ਬਿੱਲ ਨੂੰ $days ਦਿਨ ਹੋਏ',
      one: 'ਸਭ ਤੋਂ ਪੁਰਾਣੇ ਬਿਨਾਂ ਅਦਾ ਬਿੱਲ ਨੂੰ 1 ਦਿਨ ਹੋਇਆ',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount ਬਕਾਇਆ';
  }

  @override
  String get cpNoOutstanding => 'ਇਸ ਗਾਹਕ ਦਾ ਕੋਈ ਬਕਾਇਆ ਬੈਲੇਂਸ ਨਹੀਂ';

  @override
  String get cpValidAmount => 'ਸਹੀ ਰਕਮ ਦਰਜ ਕਰੋ';

  @override
  String cpExceeds(String amount) {
    return 'ਰਕਮ ਬਕਾਇਆ ਬੈਲੇਂਸ $amount ਤੋਂ ਵੱਧ ਹੈ';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name ਤੋਂ $amount ਵਸੂਲ ਹੋਏ';
  }

  @override
  String get cpOfflineSaved => 'ਆਫ਼ਲਾਈਨ — ਭੁਗਤਾਨ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਿਆ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗਾ';

  @override
  String cpOwes(String amount, String name) {
    return '$name ਦਾ $amount ਬਕਾਇਆ ਹੈ। ਇਹ ਪਹਿਲਾਂ ਸਭ ਤੋਂ ਪੁਰਾਣੇ ਬਿਨਾਂ ਅਦਾ ਬਿੱਲ(ਬਿੱਲਾਂ) ਤੇ ਲਾਗੂ ਹੋਵੇਗਾ।';
  }

  @override
  String get cpAmountLabel => 'ਵਸੂਲੀ ਰਕਮ (PKR)';

  @override
  String get cpCollect => 'ਵਸੂਲੋ';

  @override
  String get usNoItems => 'ਅੱਪਡੇਟ ਕਰਨ ਲਈ ਕੋਈ ਆਈਟਮ ਨਹੀਂ।';

  @override
  String get usHelp => 'ਹਰ ਆਈਟਮ ਦਾ ਨਵਾਂ ਸਟਾਕ ਤੈਅ ਕਰੋ, ਫਿਰ ਸਭ ਸੇਵ ਕਰੋ ਦਬਾਓ।';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  ਮੌਜੂਦਾ: $qty';
  }

  @override
  String usNew(String qty) {
    return 'ਨਵਾਂ: $qty';
  }

  @override
  String get usSubtract => '1 ਘਟਾਓ';

  @override
  String get usAdd => '1 ਵਧਾਓ';

  @override
  String get usNoChanges => 'ਕੋਈ ਤਬਦੀਲੀ ਨਹੀਂ';

  @override
  String usSaveAll(int count) {
    return 'ਸਭ ਸੇਵ ਕਰੋ ($count ਬਦਲੇ)';
  }

  @override
  String get srHint => 'ਗਾਹਕ, ਆਈਟਮਾਂ, ਰਕਮਾਂ ਖੋਜੋ...';

  @override
  String get srFailed => 'ਖੋਜ ਅਸਫਲ — ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਚੈੱਕ ਕਰੋ।';

  @override
  String get srTitle => 'ਆਪਣੀ ਦੁਕਾਨ ਵਿੱਚ ਖੋਜੋ';

  @override
  String get srSubtitle => 'ਗਾਹਕਾਂ ਨੂੰ ਨਾਂ ਜਾਂ ਫ਼ੋਨ ਨਾਲ, ਬਿੱਲਾਂ ਨੂੰ ਰਕਮ ਨਾਲ ਲੱਭੋ।';

  @override
  String srNoMatches(String query) {
    return '\"$query\" ਲਈ ਕੋਈ ਨਤੀਜਾ ਨਹੀਂ';
  }

  @override
  String get srTryDifferent => 'ਕੋਈ ਹੋਰ ਨਾਂ, ਫ਼ੋਨ ਨੰਬਰ ਜਾਂ ਰਕਮ ਅਜ਼ਮਾਓ।';

  @override
  String get srBills => 'ਬਿੱਲ';

  @override
  String get srNoItemList => 'ਆਈਟਮ ਸੂਚੀ ਨਹੀਂ';

  @override
  String get abAddAtLeastOne => 'ਘੱਟੋ-ਘੱਟ ਇੱਕ ਆਈਟਮ ਜੋੜੋ';

  @override
  String get abQuotationUpdated => 'ਕੋਟੇਸ਼ਨ ਅੱਪਡੇਟ ਹੋ ਗਈ!';

  @override
  String get abBillUpdated => 'ਬਿੱਲ ਅੱਪਡੇਟ ਹੋ ਗਿਆ!';

  @override
  String get abQuotationSaved => 'ਕੋਟੇਸ਼ਨ ਸੇਵ ਹੋ ਗਈ!';

  @override
  String get abBillCreated => 'ਬਿੱਲ ਸਫਲਤਾ ਨਾਲ ਬਣ ਗਿਆ!';

  @override
  String abTotalAmount(String amount) {
    return 'ਕੁੱਲ: $amount';
  }

  @override
  String get abShare => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get abDoneReturn => 'ਹੋ ਗਿਆ ਅਤੇ ਵਾਪਸ ਜਾਓ';

  @override
  String get abOverLimitBody => 'ਇਸ ਨਾਲ ਗਾਹਕ ਆਪਣੀ ਕ੍ਰੈਡਿਟ ਹੱਦ ਤੋਂ ਵੱਧ ਜਾਵੇਗਾ।';

  @override
  String get abOverLimitTitle => 'ਕ੍ਰੈਡਿਟ ਹੱਦ ਤੋਂ ਵੱਧ';

  @override
  String get abBillAnyway => 'ਫਿਰ ਵੀ ਬਿੱਲ ਬਣਾਓ';

  @override
  String get abOfflineBill => 'ਆਫ਼ਲਾਈਨ — ਬਿੱਲ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਿਆ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗਾ';

  @override
  String get abEditQuotation => 'ਕੋਟੇਸ਼ਨ ਸੋਧੋ';

  @override
  String get abEditBill => 'ਬਿੱਲ ਸੋਧੋ';

  @override
  String get abNewQuotation => 'ਨਵੀਂ ਕੋਟੇਸ਼ਨ';

  @override
  String get abAddBill => 'ਬਿੱਲ ਜੋੜੋ';

  @override
  String get abCouldNotLoadItems => 'ਆਈਟਮਾਂ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀਆਂ।';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'ਇਸ ਬਿੱਲ ਨਾਲ ਗਾਹਕ ਦਾ ਬੈਲੇਂਸ $total ਹੋ ਜਾਵੇਗਾ, ਜੋ ਉਸਦੀ $limit ਕ੍ਰੈਡਿਟ ਹੱਦ ਤੋਂ ਵੱਧ ਹੈ।';
  }

  @override
  String get abTapAddItemBill => 'ਬਿੱਲ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਹੇਠਾਂ \"ਆਈਟਮ ਜੋੜੋ\" ਦਬਾਓ';

  @override
  String get abNoCatalog => 'ਕੈਟਾਲਾਗ ਵਿੱਚ ਹਾਲੇ ਕੋਈ ਆਈਟਮ ਨਹੀਂ';

  @override
  String get abScan => 'ਸਕੈਨ';

  @override
  String get abDiscountRs => 'ਛੋਟ (ਰੁ)';

  @override
  String get abSubtotal => 'ਉਪ-ਕੁੱਲ';

  @override
  String get abTotal => 'ਕੁੱਲ';

  @override
  String get abSaveAsQuotation => 'ਕੋਟੇਸ਼ਨ ਵਜੋਂ ਸੇਵ ਕਰੋ';

  @override
  String get abQuotationLocked => 'ਮੌਜੂਦਾ ਬਿੱਲ ਨੂੰ ਵਾਪਸ ਕੋਟੇਸ਼ਨ ਨਹੀਂ ਬਣਾਇਆ ਜਾ ਸਕਦਾ';

  @override
  String get abQuotationNote => 'ਬਿੱਲ ਵਿੱਚ ਬਦਲਣ ਤੱਕ ਸਟਾਕ ਨਹੀਂ ਘਟੇਗਾ';

  @override
  String get abPaymentStatus => 'ਭੁਗਤਾਨ ਦੀ ਸਥਿਤੀ';

  @override
  String get abUnpaid => 'ਬਕਾਇਆ';

  @override
  String get abPaymentMethod => 'ਭੁਗਤਾਨ ਦਾ ਤਰੀਕਾ';

  @override
  String get abCash => 'ਨਕਦ';

  @override
  String get abBankTransfer => 'ਬੈਂਕ ਟ੍ਰਾਂਸਫ਼ਰ';

  @override
  String get abCheque => 'ਚੈੱਕ';

  @override
  String get abSaveQuotation => 'ਕੋਟੇਸ਼ਨ ਸੇਵ ਕਰੋ';

  @override
  String get abSaveBill => 'ਬਿੱਲ ਸੇਵ ਕਰੋ';

  @override
  String abAdded(String name) {
    return '$name ਜੋੜਿਆ ਗਿਆ';
  }

  @override
  String get apNewItem => 'ਨਵੀਂ ਆਈਟਮ…';

  @override
  String get apNewItemHint => 'ਪਹਿਲਾਂ ਕੈਟਾਲਾਗ ਵਿੱਚ ਨਵੀਂ ਆਈਟਮ ਜੋੜੋ';

  @override
  String get apOfflinePurchase => 'ਆਫ਼ਲਾਈਨ — ਖਰੀਦ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਈ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗੀ';

  @override
  String get apEditPo => 'ਖਰੀਦ ਆਰਡਰ ਸੋਧੋ';

  @override
  String get apNewPo => 'ਨਵਾਂ ਖਰੀਦ ਆਰਡਰ';

  @override
  String get apAddPurchase => 'ਖਰੀਦ ਜੋੜੋ';

  @override
  String get apTapAddItem => 'ਖਰੀਦ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਹੇਠਾਂ \"ਆਈਟਮ ਜੋੜੋ\" ਦਬਾਓ';

  @override
  String get apSaveAsPo => 'ਖਰੀਦ ਆਰਡਰ ਵਜੋਂ ਸੇਵ ਕਰੋ';

  @override
  String get apPoLocked => 'ਪ੍ਰਾਪਤ ਹੋ ਚੁੱਕੀ ਖਰੀਦ ਨੂੰ ਵਾਪਸ ਡਰਾਫ਼ਟ ਆਰਡਰ ਨਹੀਂ ਬਣਾਇਆ ਜਾ ਸਕਦਾ';

  @override
  String get apPoNote => 'ਮਾਲ ਪ੍ਰਾਪਤ ਮਾਰਕ ਹੋਣ ਤੱਕ ਸਟਾਕ ਜਾਂ ਲਾਗਤ ਨਹੀਂ ਬਦਲੇਗੀ';

  @override
  String get apUnpaidCredit => 'ਬਿਨਾਂ ਅਦਾ (ਉਧਾਰ)';

  @override
  String get apSavePo => 'ਖਰੀਦ ਆਰਡਰ ਸੇਵ ਕਰੋ';

  @override
  String get apSavePurchase => 'ਖਰੀਦ ਸੇਵ ਕਰੋ';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'ਮੌਜੂਦਾ ਲਾਗਤ: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'ਲਾਗਤ ਤੈਅ ਨਹੀਂ  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'ਸਕੈਨ ਅਸਫਲ: ਸਰਵਰ ਗਲਤੀ $code';
  }

  @override
  String get scOfflineSaved => 'ਆਫ਼ਲਾਈਨ — ਫੋਟੋ ਸੇਵ ਹੋ ਗਈ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਪੜ੍ਹੀ ਜਾਵੇਗੀ';

  @override
  String get scStillOffline => 'ਹਾਲੇ ਵੀ ਆਫ਼ਲਾਈਨ';

  @override
  String get scCouldNotCreateCustomer => 'ਗਾਹਕ ਨਹੀਂ ਬਣ ਸਕਿਆ — ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get scCouldNotCreateSupplier => 'ਸਪਲਾਇਰ ਨਹੀਂ ਬਣ ਸਕਿਆ — ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String scBillSavedFor(String name) {
    return '$name ਲਈ ਬਿੱਲ ਸੇਵ ਹੋ ਗਿਆ';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name ਤੋਂ ਖਰੀਦ ਸੇਵ ਹੋ ਗਈ';
  }

  @override
  String get scWhichCustomer => 'ਇਹ ਕਿਹੜਾ ਗਾਹਕ ਹੈ?';

  @override
  String get scWhichSupplier => 'ਇਹ ਕਿਹੜਾ ਸਪਲਾਇਰ ਹੈ?';

  @override
  String scClosestMatch(String name, int score) {
    return 'ਰਿਕਾਰਡ ਵਿੱਚ ਸਭ ਤੋਂ ਨੇੜਲਾ ਮੇਲ: $name ($score% ਮਿਲਦਾ-ਜੁਲਦਾ)';
  }

  @override
  String scYesThisIs(String name) {
    return 'ਹਾਂ, ਇਹ $name ਹੈ';
  }

  @override
  String get scOtherwiseCustomer => 'ਨਹੀਂ ਤਾਂ ਨਵਾਂ ਗਾਹਕ ਬਣਾਓ:';

  @override
  String get scOtherwiseSupplier => 'ਨਹੀਂ ਤਾਂ ਨਵਾਂ ਸਪਲਾਇਰ ਬਣਾਓ:';

  @override
  String get scNoMatchCustomer => 'ਕੋਈ ਮਿਲਦਾ-ਜੁਲਦਾ ਗਾਹਕ ਨਹੀਂ ਮਿਲਿਆ। ਨਵਾਂ ਬਣਾਓ:';

  @override
  String get scNoMatchSupplier => 'ਕੋਈ ਮਿਲਦਾ-ਜੁਲਦਾ ਸਪਲਾਇਰ ਨਹੀਂ ਮਿਲਿਆ। ਨਵਾਂ ਬਣਾਓ:';

  @override
  String get scCustomerName => 'ਗਾਹਕ ਦਾ ਨਾਂ';

  @override
  String get scSupplierName => 'ਸਪਲਾਇਰ ਦਾ ਨਾਂ';

  @override
  String get scCreateNew => 'ਨਵਾਂ ਬਣਾਓ';

  @override
  String get scTitleBill => 'ਬਿੱਲ ਸਕੈਨ ਕਰੋ';

  @override
  String get scIntroBill => 'ਬਿੱਲ ਦੀ ਫੋਟੋ ਖਿੱਚੋ। ਹੱਥ ਨਾਲ ਲਿਖਿਆ ਹੋਵੇ ਤਾਂ ਵੀ ਠੀਕ ਹੈ, ਅਤੇ ਸਿੰਧੀ, ਉਰਦੂ ਜਾਂ ਅੰਗਰੇਜ਼ੀ ਸਭ ਚੱਲਦੀਆਂ ਹਨ। ਸੇਵ ਹੋਣ ਤੋਂ ਪਹਿਲਾਂ ਤੁਸੀਂ ਇਸਨੂੰ ਵੇਖ ਸਕੋਗੇ।';

  @override
  String get scIntroPurchase => 'ਸਪਲਾਇਰ ਦੇ ਇਨਵਾਇਸ ਦੀ ਫੋਟੋ ਖਿੱਚੋ। ਸਿੰਧੀ, ਉਰਦੂ ਜਾਂ ਅੰਗਰੇਜ਼ੀ ਸਭ ਚੱਲਦੀਆਂ ਹਨ। ਸੇਵ ਹੋਣ ਤੋਂ ਪਹਿਲਾਂ ਤੁਸੀਂ ਇਸਨੂੰ ਵੇਖ ਸਕੋਗੇ।';

  @override
  String get scReadingBill => 'ਬਿੱਲ ਪੜ੍ਹਿਆ ਜਾ ਰਿਹਾ ਹੈ…';

  @override
  String get scScanBill => 'ਬਿੱਲ ਸਕੈਨ ਕਰੋ';

  @override
  String get scReadingInvoice => 'ਇਨਵਾਇਸ ਪੜ੍ਹੀ ਜਾ ਰਹੀ ਹੈ…';

  @override
  String get scScanInvoice => 'ਇਨਵਾਇਸ ਸਕੈਨ ਕਰੋ';

  @override
  String get scQueued => 'ਕਤਾਰ ਵਿੱਚ ਸਕੈਨ';

  @override
  String get scReady => 'ਜਾਂਚ ਲਈ ਤਿਆਰ';

  @override
  String get scFailed => 'ਅਸਫਲ';

  @override
  String get scWaiting => 'ਕਨੈਕਸ਼ਨ ਦੀ ਉਡੀਕ';

  @override
  String get scRetry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String rpCouldNotLoad(String error) {
    return 'ਰਿਪੋਰਟਾਂ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕੀਆਂ: $error';
  }

  @override
  String get rpHeadline => 'ਇਸ ਮਹੀਨੇ ਦੇ ਮੁੱਖ ਅੰਕੜੇ';

  @override
  String get rpProfitThisMonth => 'ਇਸ ਮਹੀਨੇ ਦਾ ਮੁਨਾਫ਼ਾ';

  @override
  String get rpNoData => 'ਹਾਲੇ ਕੋਈ ਡਾਟਾ ਨਹੀਂ';

  @override
  String get rpSalesTax => 'ਸੇਲਜ਼ ਟੈਕਸ';

  @override
  String rpSalesTaxFor(String month) {
    return '$month ਦੀ ਸੇਲਜ਼ ਟੈਕਸ ਰਿਪੋਰਟ';
  }

  @override
  String get rpViewSalesTax => 'ਸੇਲਜ਼ ਟੈਕਸ ਰਿਪੋਰਟ ਵੇਖੋ';

  @override
  String get rpQuickReports => 'ਤੁਰੰਤ ਰਿਪੋਰਟਾਂ';

  @override
  String get rpQuickSub => 'ਸਿੱਧੇ ਕਿਸੇ ਖਾਸ ਰਿਪੋਰਟ ਤੇ ਜਾਓ';

  @override
  String get expensesTitle => 'ਖਰਚੇ';

  @override
  String get rpRateCard => 'ਰੇਟ ਕਾਰਡ';

  @override
  String get rpDetails => 'ਵੇਰਵੇ';

  @override
  String get rpDetailsSub => 'ਪੂਰਾ ਵੇਰਵਾ ਅਤੇ ਦਰਜਾਬੰਦੀ';

  @override
  String get rpOutstandingByCustomer => 'ਗਾਹਕ ਅਨੁਸਾਰ ਬਕਾਇਆ';

  @override
  String get rpNoOutstanding => 'ਕੋਈ ਬਕਾਇਆ ਬੈਲੇਂਸ ਨਹੀਂ';

  @override
  String get rpMonthlyTotals => 'ਮਹੀਨਾਵਾਰ ਕੁੱਲ';

  @override
  String get rpMostSold => 'ਸਭ ਤੋਂ ਵੱਧ ਵਿਕਣ ਵਾਲੀਆਂ ਆਈਟਮਾਂ';

  @override
  String get rpNoItemsRecorded => 'ਹਾਲੇ ਕੋਈ ਆਈਟਮ ਦਰਜ ਨਹੀਂ';

  @override
  String get rpTopCustomers => 'ਆਮਦਨ ਅਨੁਸਾਰ ਚੋਟੀ ਦੇ ਗਾਹਕ';

  @override
  String get rpNoSalesRecorded => 'ਹਾਲੇ ਕੋਈ ਵਿਕਰੀ ਦਰਜ ਨਹੀਂ';

  @override
  String get rpTotalOutstanding => 'ਕੁੱਲ ਬਕਾਇਆ';

  @override
  String get rpViewCustomers => 'ਗਾਹਕ ਵੇਖੋ';

  @override
  String get lblInvoice => 'ਇਨਵਾਇਸ';

  @override
  String get lblLedger => 'ਖਾਤਾ';

  @override
  String get lblRateCard => 'ਰੇਟ ਕਾਰਡ';

  @override
  String get exCsvNeedsRows => 'CSV ਵਿੱਚ ਹੈਡਰ ਕਤਾਰ ਤੋਂ ਇਲਾਵਾ ਘੱਟੋ-ਘੱਟ ਇੱਕ ਖਰਚਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get exCsvHeader => 'CSV ਹੈਡਰ ਵਿੱਚ \"description\" ਅਤੇ \"amount\" ਕਾਲਮ ਹੋਣੇ ਚਾਹੀਦੇ ਹਨ।';

  @override
  String exLineBadAmount(int line) {
    return 'ਲਾਈਨ $line: ਵੇਰਵਾ ਗਾਇਬ ਜਾਂ ਰਕਮ ਗਲਤ — ਫ਼ਾਈਲ ਠੀਕ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'ਲਾਈਨ $line: ਗਲਤ ਤਾਰੀਖ਼ \"$date\" — YYYY-MM-DD ਵਰਤੋ।';
  }

  @override
  String get exImportTitle => 'ਖਰਚੇ ਇੰਪੋਰਟ ਕਰੋ';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" ਵਿੱਚ $count ਖਰਚੇ ਮਿਲੇ। ਸਾਰੇ ਇੰਪੋਰਟ ਕਰਨੇ ਹਨ?',
      one: '\"$file\" ਵਿੱਚ 1 ਖਰਚਾ ਮਿਲਿਆ। ਸਾਰੇ ਇੰਪੋਰਟ ਕਰਨੇ ਹਨ?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਖਰਚੇ ਇੰਪੋਰਟ ਹੋਏ।',
      one: '1 ਖਰਚਾ ਇੰਪੋਰਟ ਹੋਇਆ।',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'ਇੰਪੋਰਟ ਅਸਫਲ: ਸਰਵਰ ਗਲਤੀ $code';
  }

  @override
  String get exDeleteTitle => 'ਖਰਚਾ ਮਿਟਾਓ';

  @override
  String get exAdd => 'ਖਰਚਾ ਜੋੜੋ';

  @override
  String get exEdit => 'ਖਰਚਾ ਸੋਧੋ';

  @override
  String get exDescription => 'ਵੇਰਵਾ';

  @override
  String get exAmountRs => 'ਰਕਮ (ਰੁ)';

  @override
  String get exCategory => 'ਸ਼੍ਰੇਣੀ';

  @override
  String exDate(String date) {
    return 'ਤਾਰੀਖ਼: $date';
  }

  @override
  String get exRepeats => 'ਹਰ ਮਹੀਨੇ ਦੁਹਰਾਓ';

  @override
  String get exRepeatsHint => 'ਕਿਰਾਇਆ, ਬਿਜਲੀ, ਮਜ਼ਦੂਰੀ ਆਦਿ';

  @override
  String get exReceiptTap => 'ਰਸੀਦ ਦੀ ਫੋਟੋ, ਬਦਲਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get exReceiptOptional => 'ਰਸੀਦ ਦੀ ਫੋਟੋ (ਵਿਕਲਪਿਕ)';

  @override
  String get exEnterValid => 'ਵੇਰਵਾ ਅਤੇ ਸਹੀ ਰਕਮ ਦਰਜ ਕਰੋ।';

  @override
  String get exOffline => 'ਆਫ਼ਲਾਈਨ — ਖਰਚਾ ਇਸ ਡੀਵਾਈਸ ਤੇ ਸੇਵ ਹੋ ਗਿਆ, ਆਨਲਾਈਨ ਹੁੰਦੇ ਹੀ ਆਪਣੇ ਆਪ ਸਿੰਕ ਹੋ ਜਾਵੇਗਾ';

  @override
  String get exSave => 'ਖਰਚਾ ਸੇਵ ਕਰੋ';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ਇਸ ਮਹੀਨੇ $count ਆਵਰਤੀ ਖਰਚੇ ਦੇਣਯੋਗ ਹਨ',
      one: 'ਇਸ ਮਹੀਨੇ 1 ਆਵਰਤੀ ਖਰਚਾ ਦੇਣਯੋਗ ਹੈ',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'ਜੋੜੋ';

  @override
  String get exTotal => 'ਕੁੱਲ ਖਰਚੇ';

  @override
  String exCategoryChip(String name) {
    return 'ਸ਼੍ਰੇਣੀ: $name';
  }

  @override
  String get exNoneLogged => 'ਹਾਲੇ ਕੋਈ ਖਰਚਾ ਦਰਜ ਨਹੀਂ';

  @override
  String exNoneInCategory(String name) {
    return 'ਹਾਲੇ $name ਦਾ ਕੋਈ ਖਰਚਾ ਨਹੀਂ';
  }

  @override
  String get exViewReceipt => 'ਰਸੀਦ ਵੇਖੋ';

  @override
  String get exEditRow => 'ਖਰਚਾ ਸੋਧੋ';

  @override
  String get exDeleteRow => 'ਖਰਚਾ ਮਿਟਾਓ';

  @override
  String gstServerReturned(String first, String second) {
    return 'ਸਰਵਰ ਨੇ $first/$second ਵਾਪਸ ਕੀਤਾ';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST ਡਾਟਾ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'ਡਾਊਨਲੋਡ ਅਸਫਲ ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename ਸੇਵ ਹੋ ਗਈ';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'ਡਾਊਨਲੋਡਜ਼/$filename ਵਿੱਚ ਸੇਵ ਹੋ ਗਈ';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'ਡਾਊਨਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get gstTitle => 'ਸੇਲਜ਼ ਟੈਕਸ ਰਿਪੋਰਟ';

  @override
  String get gstOutwardDetail => 'ਬਾਹਰੀ ਵਿਕਰੀ — ਇਨਵਾਇਸ ਵੇਰਵਾ';

  @override
  String get gstNoBills => 'ਇਸ ਮਹੀਨੇ ਕੋਈ ਬਿੱਲ ਨਹੀਂ।';

  @override
  String get gstHsn => 'HSN ਸਾਰ';

  @override
  String get gstInvoiceWise => 'ਇਨਵਾਇਸ-ਵਾਰ ਵੇਰਵੇ';

  @override
  String get gstMonthly => 'ਮਹੀਨਾਵਾਰ ਸਾਰ';

  @override
  String get gstOutwardTaxable => 'ਟੈਕਸ ਯੋਗ ਬਾਹਰੀ ਸਪਲਾਈ';

  @override
  String get gstItc => 'ਇਨਪੁੱਟ ਟੈਕਸ ਕ੍ਰੈਡਿਟ (ਖਰੀਦ ਤੋਂ)';

  @override
  String get gstSave => 'ਸੇਵ ਕਰੋ';

  @override
  String get rcValidAmount => 'ਸਹੀ ਰਕਮ ਦਰਜ ਕਰੋ।';

  @override
  String get rcExpected => 'ਅਨੁਮਾਨਿਤ ਨਕਦ (ਅੱਜ ਦੀ ਨਕਦ ਵਿਕਰੀ)';

  @override
  String get rcAlsoCollected => 'ਅੱਜ ਵਸੂਲ ਵੀ ਹੋਇਆ (ਦਰਾਜ਼ ਵਿੱਚ ਗਿਣਿਆ ਨਹੀਂ)';

  @override
  String get rcCounted => 'ਦਰਾਜ਼ ਵਿੱਚ ਗਿਣਿਆ ਨਕਦ (ਰੁ)';

  @override
  String get rcCompare => 'ਤੁਲਨਾ ਕਰੋ';

  @override
  String get rcMatches => 'ਬਿਲਕੁਲ ਮਿਲਦਾ ਹੈ!';

  @override
  String rcExtra(String amount) {
    return 'ਦਰਾਜ਼ ਵਿੱਚ $amount ਵੱਧ';
  }

  @override
  String rcMissing(String amount) {
    return 'ਦਰਾਜ਼ ਵਿੱਚ $amount ਘੱਟ';
  }

  @override
  String get pbiTitle => 'ਆਈਟਮ ਅਨੁਸਾਰ ਮੁਨਾਫ਼ਾ';

  @override
  String get pbiNoSales => 'ਹਾਲੇ ਕੋਈ ਵਿਕਰੀ ਨਹੀਂ';

  @override
  String get pbiByCategory => 'ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ';

  @override
  String get pbiItemsByProfit => 'ਮੁਨਾਫ਼ੇ ਅਨੁਸਾਰ ਆਈਟਮਾਂ';

  @override
  String get svTitle => 'ਸਟਾਕ ਮੁੱਲ';

  @override
  String get svNone => 'ਕੋਈ ਸਟਾਕ ਨਹੀਂ';

  @override
  String get svItemsByValue => 'ਮੁੱਲ ਅਨੁਸਾਰ ਆਈਟਮਾਂ';

  @override
  String svSummary(String items, String units) {
    return '$items ਆਈਟਮਾਂ · ਸ਼ੈਲਫ਼ ਤੇ $units ਇਕਾਈਆਂ';
  }

  @override
  String svTied(String amount) {
    return 'ਸਟਾਕ ਵਿੱਚ $amount ਫਸੇ ਹਨ';
  }

  @override
  String get svEstimated => 'ਵਿਕਰੀ ਕੀਮਤ ਤੋਂ ਅਨੁਮਾਨਿਤ';

  @override
  String get bkRestoreTitle => 'ਬੈਕਅੱਪ ਰੀਸਟੋਰ ਕਰਨਾ ਹੈ?';

  @override
  String bkRestoreBody(String filename) {
    return 'ਇਹ ਸਾਰਾ ਮੌਜੂਦਾ ਡਾਟਾ ਬੈਕਅੱਪ ਫ਼ਾਈਲ \"$filename\" ਨਾਲ ਬਦਲ ਦੇਵੇਗਾ। ਜਾਰੀ ਰੱਖਣਾ ਹੈ?';
  }

  @override
  String get bkRestore => 'ਰੀਸਟੋਰ ਕਰੋ';

  @override
  String get bkRestoreDoneTitle => 'ਰੀਸਟੋਰ ਪੂਰਾ ਹੋਇਆ';

  @override
  String get bkRestoreDoneBody => 'ਤੁਹਾਡਾ ਡਾਟਾ ਰੀਸਟੋਰ ਹੋ ਗਿਆ ਹੈ।';

  @override
  String get bkOk => 'ਠੀਕ ਹੈ';

  @override
  String bkRestoreFailed(String detail) {
    return 'ਰੀਸਟੋਰ ਅਸਫਲ: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'ਰੀਸਟੋਰ ਨਹੀਂ ਹੋ ਸਕਿਆ: $error';
  }

  @override
  String get bkSaveToDownloads => 'ਡਾਊਨਲੋਡਜ਼ ਵਿੱਚ ਸੇਵ ਕਰੋ';

  @override
  String get bkIntroAdmin => 'ਤੁਹਾਡਾ ਸਾਰਾ ਡਾਟਾ ਇੱਕ ਡਾਟਾਬੇਸ ਫ਼ਾਈਲ ਵਿੱਚ ਹੈ। ਨਿਯਮਿਤ ਤੌਰ ਤੇ ਇੱਕ ਕਾਪੀ ਡਾਊਨਲੋਡ ਕਰੋ, ਅਤੇ ਕੁਝ ਗੜਬੜ ਹੋਵੇ ਤਾਂ ਰੀਸਟੋਰ ਕਰੋ।';

  @override
  String get bkIntroStaff => 'ਪੂਰਾ ਡਾਟਾਬੇਸ ਬੈਕਅੱਪ ਅਤੇ ਰੀਸਟੋਰ ਸਿਰਫ਼ ਐਡਮਿਨ ਲਈ ਹੈ। ਐਡਮਿਨ ਨੂੰ ਕਹੋ, ਜਾਂ ਜੋ ਚਾਹੀਦਾ ਹੈ ਉਹ ਹੇਠਾਂ CSV ਵਿੱਚ ਐਕਸਪੋਰਟ ਕਰੋ।';

  @override
  String get bkBackupDb => 'ਡਾਟਾਬੇਸ ਬੈਕਅੱਪ';

  @override
  String get bkBackupDbSub => 'ਪੂਰਾ ਡਾਟਾਬੇਸ ਇੱਕ ਫ਼ਾਈਲ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕਰਕੇ ਸਾਂਝਾ ਕਰੋ (ਵਟਸਐਪ, ਡਰਾਈਵ, ਈਮੇਲ)।';

  @override
  String get bkDownloadPhone => 'ਬੈਕਅੱਪ ਫ਼ੋਨ ਵਿੱਚ ਡਾਊਨਲੋਡ ਕਰੋ';

  @override
  String get bkShareBackup => 'ਬੈਕਅੱਪ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get bkAutoTitle => 'ਆਟੋਮੈਟਿਕ ਬੈਕਅੱਪ';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ਸਰਵਰ ਤੇ $count ਰੋਜ਼ਾਨਾ ਬੈਕਅੱਪ ਸੇਵ ਹਨ, ਸਭ ਤੋਂ ਨਵਾਂ $time ਦਾ। ਇਹ ਆਪਣੇ ਆਪ ਚੱਲਦੇ ਹਨ — ਇੱਥੇ ਕੁਝ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ।',
      one: 'ਸਰਵਰ ਤੇ 1 ਰੋਜ਼ਾਨਾ ਬੈਕਅੱਪ ਸੇਵ ਹੈ, ਸਭ ਤੋਂ ਨਵਾਂ $time ਦਾ। ਇਹ ਆਪਣੇ ਆਪ ਚੱਲਦਾ ਹੈ — ਇੱਥੇ ਕੁਝ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ।',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'ਮੌਜੂਦਾ ਡਾਟਾ ਬਦਲਣ ਲਈ ਸੇਵ ਕੀਤੀ ਬੈਕਅੱਪ ਫ਼ਾਈਲ ਚੁਣੋ।';

  @override
  String get bkRestoreFromFile => 'ਬੈਕਅੱਪ ਫ਼ਾਈਲ ਤੋਂ ਰੀਸਟੋਰ ਕਰੋ';

  @override
  String get bkExportCsv => 'CSV ਵਿੱਚ ਐਕਸਪੋਰਟ ਕਰੋ';

  @override
  String get bkExportSub => 'ਇਹਨਾਂ ਨੂੰ ਐਕਸਲ ਵਿੱਚ ਖੋਲ੍ਹੋ ਜਾਂ ਸਾਂਝਾ ਕਰੋ।';

  @override
  String get bkRangeAll => 'ਬਿੱਲ/ਖਰਚੇ: ਸਾਰਾ ਸਮਾਂ';

  @override
  String bkRangeSome(String end, String start) {
    return 'ਬਿੱਲ/ਖਰਚੇ: $start ਤੋਂ $end ਤੱਕ';
  }

  @override
  String get bkSetRange => 'ਮਿਆਦ ਤੈਅ ਕਰੋ';

  @override
  String get bkClearRange => 'ਮਿਆਦ ਹਟਾਓ';

  @override
  String get ntNever => 'ਕਦੇ ਨਹੀਂ ਚੱਲਿਆ';

  @override
  String get ntJustNow => 'ਹੁਣੇ';

  @override
  String ntMinutesAgo(int count) {
    return '$count ਮਿੰਟ ਪਹਿਲਾਂ';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count ਘੰਟੇ ਪਹਿਲਾਂ';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count ਦਿਨ ਪਹਿਲਾਂ';
  }

  @override
  String get ntTitle => 'ਸਮਾਰਟ ਨੋਟੀਫ਼ਿਕੇਸ਼ਨ';

  @override
  String get ntTapHint => 'ਨੋਟੀਫ਼ਿਕੇਸ਼ਨ ਚਲਾਉਣ ਅਤੇ ਲਾਈਵ ਨਤੀਜੇ ਵੇਖਣ ਲਈ \"ਹੁਣੇ ਜਾਂਚੋ\" ਦਬਾਓ।';

  @override
  String get ntLowStockSub => 'ਆਈਟਮਾਂ ਰੀਆਰਡਰ ਪੱਧਰ ਤੋਂ ਹੇਠਾਂ ਜਾਣ ਤੇ ਸੂਚਿਤ ਕਰੋ।';

  @override
  String get ntCheckNow => 'ਹੁਣੇ ਜਾਂਚੋ';

  @override
  String get ntOverdue => 'ਬਕਾਇਆ ਭੁਗਤਾਨ ਯਾਦ-ਦਹਾਨੀਆਂ';

  @override
  String get ntOverdueSub => 'ਪਿਛਲੇ ਦਿਨਾਂ ਦੇ ਬਿਨਾਂ ਅਦਾ ਬਿੱਲਾਂ ਬਾਰੇ ਸੂਚਿਤ ਕਰੋ।';

  @override
  String get ntDaily => 'ਰੋਜ਼ਾਨਾ ਕਾਰੋਬਾਰੀ ਸਾਰ';

  @override
  String get ntDailySub => 'ਕੱਲ੍ਹ ਦੀ ਵਿਕਰੀ, ਵਸੂਲੀ ਅਤੇ ਮੁਨਾਫ਼ਾ ਇੱਕ ਨਜ਼ਰ ਵਿੱਚ।';

  @override
  String get ntSendSummary => 'ਸਾਰ ਭੇਜੋ';

  @override
  String get ntRunning => 'ਚੱਲ ਰਿਹਾ ਹੈ…';

  @override
  String get ntLowStockItems => 'ਘੱਟ ਸਟਾਕ ਵਾਲੀਆਂ ਆਈਟਮਾਂ';

  @override
  String get ntSales => 'ਵਿਕਰੀ';

  @override
  String get ntCollected => 'ਵਸੂਲ ਹੋਇਆ';

  @override
  String get ntProfit => 'ਮੁਨਾਫ਼ਾ';

  @override
  String get auChecking => 'ਅੱਪਡੇਟ ਜਾਂਚੇ ਜਾ ਰਹੇ ਹਨ…';

  @override
  String get auLatest => 'ਤੁਹਾਡੇ ਕੋਲ ਨਵੀਨਤਮ ਵਰਜਨ ਹੈ।';

  @override
  String get auAvailable => 'ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੈ';

  @override
  String auNewer(int code) {
    return 'Book-Keep ਦਾ ਨਵਾਂ ਵਰਜਨ (ਬਿਲਡ $code) ਤਿਆਰ ਹੈ।';
  }

  @override
  String get auLater => 'ਬਾਅਦ ਵਿੱਚ';

  @override
  String get auUpdate => 'ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get auDownloading => 'ਅੱਪਡੇਟ ਡਾਊਨਲੋਡ ਹੋ ਰਿਹਾ ਹੈ';

  @override
  String auSaved(String name) {
    return '$name ਤੁਹਾਡੇ ਡਾਊਨਲੋਡਜ਼ ਫੋਲਡਰ ਵਿੱਚ ਸੇਵ ਹੋ ਗਈ।';
  }

  @override
  String get auAllowInstall => 'Book-Keep ਨੂੰ ਐਪਾਂ ਇੰਸਟਾਲ ਕਰਨ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ, ਫਿਰ ਦੁਬਾਰਾ ਅੱਪਡੇਟ ਦਬਾਓ।';

  @override
  String get auFailed => 'ਅੱਪਡੇਟ ਨਹੀਂ ਹੋ ਸਕਿਆ — ਆਪਣਾ ਕਨੈਕਸ਼ਨ ਚੈੱਕ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get lgSearch => 'ਭਾਸ਼ਾਵਾਂ ਖੋਜੋ';

  @override
  String lgNoMatch(String query) {
    return '\"$query\" ਨਾਲ ਕੋਈ ਭਾਸ਼ਾ ਨਹੀਂ ਮਿਲਦੀ';
  }

  @override
  String get alVoided => 'ਬਿੱਲ ਰੱਦ ਕੀਤਾ';

  @override
  String get alDeletedBill => 'ਬਿੱਲ ਮਿਟਾਇਆ';

  @override
  String get alReturned => 'ਬਿੱਲ ਵਾਪਸ ਕੀਤਾ';

  @override
  String get alDeletedCustomer => 'ਗਾਹਕ ਮਿਟਾਇਆ';

  @override
  String get alDeletedSupplier => 'ਸਪਲਾਇਰ ਮਿਟਾਇਆ';

  @override
  String get alCreatedAccount => 'ਖਾਤਾ ਬਣਾਇਆ';

  @override
  String get alUpdatedAccount => 'ਖਾਤਾ ਅੱਪਡੇਟ ਕੀਤਾ';

  @override
  String get alDeletedAccount => 'ਖਾਤਾ ਮਿਟਾਇਆ';

  @override
  String get alTitle => 'ਗਤੀਵਿਧੀ ਲੌਗ';

  @override
  String get alNone => 'ਹਾਲੇ ਕੋਈ ਗਤੀਵਿਧੀ ਦਰਜ ਨਹੀਂ';

  @override
  String get blkEnterOne => 'ਘੱਟੋ-ਘੱਟ ਇੱਕ ਆਈਟਮ ਦਰਜ ਕਰੋ';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਆਈਟਮਾਂ ਸਫਲਤਾ ਨਾਲ ਜੁੜ ਗਈਆਂ',
      one: '1 ਆਈਟਮ ਸਫਲਤਾ ਨਾਲ ਜੁੜ ਗਈ',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'ਇੱਕੋ ਵਾਰ ਆਈਟਮਾਂ ਜੋੜੋ';

  @override
  String get blkFormat => 'ਹਰ ਲਾਈਨ ਵਿੱਚ ਇੱਕ ਆਈਟਮ, ਫਾਰਮੈਟ: ਨਾਂ, ਕੀਮਤ, ਇਕਾਈ, ਸ਼੍ਰੇਣੀ';

  @override
  String get blkOptional => 'ਇਕਾਈ ਅਤੇ ਸ਼੍ਰੇਣੀ ਵਿਕਲਪਿਕ ਹਨ (ਡਿਫ਼ਾਲਟ: piece, ਕੋਈ ਨਹੀਂ)';

  @override
  String get blkAddAll => 'ਸਾਰੀਆਂ ਆਈਟਮਾਂ ਜੋੜੋ';

  @override
  String get prSend => 'ਭੁਗਤਾਨ ਯਾਦ-ਦਹਾਨੀ ਭੇਜੋ';

  @override
  String get prTone => 'ਲਹਿਜਾ ਚੁਣੋ:';

  @override
  String get prPolite => 'ਨਿਮਰ';

  @override
  String get prStandard => 'ਆਮ';

  @override
  String get prUrgent => 'ਜ਼ਰੂਰੀ';

  @override
  String get prPreviewQr => 'ਜੈਜ਼ਕੈਸ਼ ਭੁਗਤਾਨ QR ਦੀ ਝਲਕ';

  @override
  String get prShareText => 'ਟੈਕਸਟ ਸਾਂਝਾ ਕਰੋ';

  @override
  String get dsRemaining => 'ਬਾਕੀ';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount ਦੀ ਛੋਟ ਸ਼ਾਮਲ';
  }

  @override
  String get dsItems => 'ਆਈਟਮਾਂ';

  @override
  String get dsDiscount => 'ਛੋਟ';

  @override
  String get lkWrongPin => 'ਗਲਤ PIN';

  @override
  String get lkEnterPin => 'PIN ਦਰਜ ਕਰੋ';

  @override
  String get lkChecking => 'ਫਿੰਗਰਪ੍ਰਿੰਟ ਜਾਂਚਿਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get bcTitle => 'ਬਾਰਕੋਡ ਸਕੈਨ ਕਰੋ';

  @override
  String get bcTorchNa => 'ਇਸ ਡੀਵਾਈਸ ਤੇ ਟਾਰਚ ਉਪਲਬਧ ਨਹੀਂ ਹੈ';

  @override
  String get bcTorch => 'ਟਾਰਚ';

  @override
  String get bcPoint => 'ਕੈਮਰਾ ਬਾਰਕੋਡ ਵੱਲ ਕਰੋ';

  @override
  String get qrNoNumber => 'ਕੋਈ ਜੈਜ਼ਕੈਸ਼ ਨੰਬਰ ਸੈੱਟ ਨਹੀਂ ਹੈ। ਭੁਗਤਾਨ QR ਵਿਖਾਉਣ ਲਈ ਇਸਨੂੰ ਸੈਟਿੰਗਜ਼ ਵਿੱਚ ਸੈੱਟ ਕਰੋ।';

  @override
  String get qrPay => 'ਜੈਜ਼ਕੈਸ਼ ਨਾਲ ਭੁਗਤਾਨ ਕਰੋ';

  @override
  String get qrInvalid => 'ਗਲਤ QR ਡਾਟਾ';

  @override
  String qrAmount(String amount) {
    return 'ਰਕਮ: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'ਜੈਜ਼ਕੈਸ਼: $number';
  }

  @override
  String get qrCopy => 'ਜੈਜ਼ਕੈਸ਼ ਨੰਬਰ ਕਾਪੀ ਕਰੋ';

  @override
  String get qrCopied => 'ਜੈਜ਼ਕੈਸ਼ ਨੰਬਰ ਕਲਿੱਪਬੋਰਡ ਵਿੱਚ ਕਾਪੀ ਹੋ ਗਿਆ';

  @override
  String get qrHint => 'ਭੁਗਤਾਨ ਲਈ ਇਹ ਨੰਬਰ ਆਪਣੀ ਜੈਜ਼ਕੈਸ਼ ਐਪ ਵਿੱਚ ਸਕੈਨ ਜਾਂ ਕਾਪੀ ਕਰੋ।';

  @override
  String clOwed(String amount) {
    return '$amount ਬਕਾਇਆ';
  }

  @override
  String get lnEnterEmailFirst => 'ਪਹਿਲਾਂ ਉੱਪਰ ਸਹੀ ਈਮੇਲ ਦਰਜ ਕਰੋ।';

  @override
  String get lnResetSent => 'ਪਾਸਵਰਡ ਰੀਸੈੱਟ ਈਮੇਲ ਭੇਜ ਦਿੱਤੀ ਗਈ — ਆਪਣਾ ਇਨਬਾਕਸ ਵੇਖੋ।';

  @override
  String get lnNoAccount => 'ਇਸ ਈਮੇਲ ਦਾ ਕੋਈ ਖਾਤਾ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get lnWrongPassword => 'ਪਾਸਵਰਡ ਗਲਤ ਹੈ।';

  @override
  String get lnInvalidEmail => 'ਇਹ ਸਹੀ ਈਮੇਲ ਪਤਾ ਨਹੀਂ ਲੱਗਦਾ।';

  @override
  String get lnDisabled => 'ਇਹ ਖਾਤਾ ਬੰਦ ਕਰ ਦਿੱਤਾ ਗਿਆ ਹੈ।';

  @override
  String get lnTooMany => 'ਬਹੁਤ ਜ਼ਿਆਦਾ ਕੋਸ਼ਿਸ਼ਾਂ — ਇੱਕ ਮਿੰਟ ਬਾਅਦ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get lnNoInternet => 'ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਨਹੀਂ ਹੈ।';

  @override
  String get lnWeakPassword => 'ਪਾਸਵਰਡ ਘੱਟੋ-ਘੱਟ 6 ਅੱਖਰਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get lnCouldNotSignIn => 'ਸਾਈਨ ਇਨ ਨਹੀਂ ਹੋ ਸਕਿਆ। ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get lnWrongPasswordHint => 'ਪਾਸਵਰਡ ਗਲਤ ਹੈ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ ਜਾਂ \"ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ?\" ਦਬਾਓ।';

  @override
  String get lnWrongEmail => 'ਈਮੇਲ ਗਲਤ ਹੈ — ਇਸ ਪਤੇ ਦਾ ਕੋਈ ਖਾਤਾ ਨਹੀਂ।';

  @override
  String get lnWrongEmailOrPassword => 'ਈਮੇਲ ਜਾਂ ਪਾਸਵਰਡ ਗਲਤ ਹੈ।';

  @override
  String get lnWrongUsername => 'ਯੂਜ਼ਰਨੇਮ ਗਲਤ ਹੈ — ਇਸ ਨਾਂ ਦਾ ਕੋਈ ਖਾਤਾ ਨਹੀਂ।';

  @override
  String get lnWelcome => 'ਵਾਪਸੀ ਤੇ ਸੁਆਗਤ ਹੈ';

  @override
  String lnSignInTo(String app) {
    return '$app ਵਿੱਚ ਸਾਈਨ ਇਨ ਕਰੋ';
  }

  @override
  String get lnEmailOrUsername => 'ਈਮੇਲ ਜਾਂ ਯੂਜ਼ਰਨੇਮ';

  @override
  String get lnRemember => 'ਮੈਨੂੰ ਯਾਦ ਰੱਖੋ';

  @override
  String get lnForgot => 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ?';

  @override
  String get lnSignIn => 'ਸਾਈਨ ਇਨ';

  @override
  String get lnGoogle => 'Google ਨਾਲ ਜਾਰੀ ਰੱਖੋ';

  @override
  String get lnNew => 'ਨਵੇਂ ਹੋ?';

  @override
  String get lnCreate => 'ਖਾਤਾ ਬਣਾਓ';

  @override
  String suCreated(String email) {
    return '$email ਲਈ ਖਾਤਾ ਬਣ ਗਿਆ। ਪੁਸ਼ਟੀ ਵਾਲੀ ਈਮੇਲ ਭੇਜੀ ਗਈ ਹੈ (ਵਿਕਲਪਿਕ)।';
  }

  @override
  String suSetup(String app) {
    return '$app ਸੈੱਟ ਕਰੋ';
  }

  @override
  String get suName => 'ਨਾਂ';

  @override
  String get suEmail => 'ਈਮੇਲ';

  @override
  String suPhoneDigits(int digits) {
    return 'ਸਹੀ $digits ਅੰਕਾਂ ਦਾ ਨੰਬਰ ਦਰਜ ਕਰੋ';
  }

  @override
  String get suCreateBtn => 'ਖਾਤਾ ਬਣਾਓ';

  @override
  String get suHaveAccount => 'ਪਹਿਲਾਂ ਤੋਂ ਖਾਤਾ ਹੈ?';

  @override
  String get suAlreadyExists => 'ਇਸ ਈਮੇਲ ਦਾ ਖਾਤਾ ਪਹਿਲਾਂ ਤੋਂ ਮੌਜੂਦ ਹੈ।';

  @override
  String get suInvalidEmail => 'ਈਮੇਲ ਪਤਾ ਸਹੀ ਨਹੀਂ ਹੈ।';

  @override
  String get agShow => 'ਪਾਸਵਰਡ ਵਿਖਾਓ';

  @override
  String get agHide => 'ਪਾਸਵਰਡ ਲੁਕਾਓ';

  @override
  String get adAccounts => 'ਖਾਤੇ';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਰਜਿਸਟਰਡ ਖਾਤੇ',
      one: '1 ਰਜਿਸਟਰਡ ਖਾਤਾ',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'ਜੋੜੋ';

  @override
  String get adNoAccounts => 'ਕੋਈ ਖਾਤਾ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get adAccountability => 'ਜਵਾਬਦੇਹੀ';

  @override
  String get adAccountabilitySub => 'ਕਿਸਨੇ ਕੀ ਰੱਦ, ਮਿਟਾਇਆ ਜਾਂ ਵਾਪਸ ਕੀਤਾ, ਅਤੇ ਖਾਤਿਆਂ ਵਿੱਚ ਤਬਦੀਲੀਆਂ।';

  @override
  String get adActivitySub => 'ਰੱਦ ਬਿੱਲ, ਮਿਟਾਉਣਾ ਅਤੇ ਖਾਤਿਆਂ ਵਿੱਚ ਤਬਦੀਲੀਆਂ';

  @override
  String get adServer => 'ਸਰਵਰ';

  @override
  String get adServerSub => 'ਇਹ ਐਪ ਕਿਸ ਨਾਲ ਗੱਲ ਕਰਦੀ ਹੈ। ਸੈੱਟਅੱਪ ਤੋਂ ਬਾਅਦ ਘੱਟ ਹੀ ਬਦਲਣ ਦੀ ਲੋੜ ਪੈਂਦੀ ਹੈ।';

  @override
  String get adServerHint => 'ਇਮੂਲੇਟਰ 10.0.2.2 ਵਰਤਦਾ ਹੈ; ਅਸਲੀ ਫ਼ੋਨ ਨੂੰ ਉਸੇ ਵਾਈ-ਫ਼ਾਈ ਤੇ ਲੈਪਟਾਪ ਦਾ IP ਚਾਹੀਦਾ ਹੈ। ਇਸਨੂੰ ਬਦਲਣ ਦਾ ਅਸਰ ਹਰ ਖਾਤੇ ਤੇ ਪੈਂਦਾ ਹੈ।';

  @override
  String get adApiBase => 'API ਬੇਸ URL';

  @override
  String get adSaveServer => 'ਸਰਵਰ ਦਾ ਪਤਾ ਸੇਵ ਕਰੋ';

  @override
  String get adEmailSetSub => 'ਸੈੱਟ ਹੈ — ਸਟਾਫ਼ ਗਾਹਕਾਂ ਨੂੰ ਇਨਵਾਇਸ/ਸਟੇਟਮੈਂਟ ਈਮੇਲ ਕਰ ਸਕਦਾ ਹੈ।';

  @override
  String get adNotSetUp => 'ਹਾਲੇ ਸੈੱਟ ਨਹੀਂ ਹੈ।';

  @override
  String get adEmailSetBody => 'ਈਮੇਲ ਸੈੱਟ ਹੈ। ਸਟਾਫ਼ ਸਿੱਧਾ ਗਾਹਕ ਨੂੰ ਇਨਵਾਇਸ ਜਾਂ ਸਟੇਟਮੈਂਟ ਈਮੇਲ ਕਰ ਸਕਦਾ ਹੈ।';

  @override
  String get adEmailHelp => 'Gmail ਪਤਾ ਐਪ ਪਾਸਵਰਡ ਨਾਲ ਚੱਲਦਾ ਹੈ (smtp.gmail.com, ਪੋਰਟ 587), ਜਾਂ ਆਪਣੇ ਈਮੇਲ ਪ੍ਰਦਾਤਾ ਦੇ SMTP ਵੇਰਵੇ ਵਰਤੋ।';

  @override
  String get adSmtpHost => 'SMTP ਹੋਸਟ';

  @override
  String get adSmtpPort => 'SMTP ਪੋਰਟ';

  @override
  String get adEmailAddress => 'ਈਮੇਲ ਪਤਾ';

  @override
  String get adPwKeep => 'ਪਾਸਵਰਡ (ਮੌਜੂਦਾ ਰੱਖਣ ਲਈ ਖ਼ਾਲੀ ਛੱਡੋ)';

  @override
  String get adPwApp => 'ਪਾਸਵਰਡ (ਐਪ ਪਾਸਵਰਡ, ਲਾਗਇਨ ਪਾਸਵਰਡ ਨਹੀਂ)';

  @override
  String get adFromName => 'ਭੇਜਣ ਵਾਲੇ ਦਾ ਨਾਂ (ਵਿਕਲਪਿਕ)';

  @override
  String get adFromHint => 'ਮੇਰੀ ਹਾਰਡਵੇਅਰ ਦੁਕਾਨ';

  @override
  String get adSaving => 'ਸੇਵ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get adSaveEmail => 'ਈਮੇਲ ਸੈਟਿੰਗਜ਼ ਸੇਵ ਕਰੋ';

  @override
  String get adAddAccount => 'ਖਾਤਾ ਜੋੜੋ';

  @override
  String get adNameOpt => 'ਨਾਂ (ਵਿਕਲਪਿਕ)';

  @override
  String get adAtLeast6 => 'ਘੱਟੋ-ਘੱਟ 6 ਅੱਖਰ';

  @override
  String get adGrantAdmin => 'ਐਡਮਿਨ ਬਣਾਓ';

  @override
  String get adCanManage => 'ਰੱਦ/ਮਿਟਾ/ਵਾਪਸ ਕਰ ਸਕਦਾ ਹੈ';

  @override
  String get adCanManageHint => 'ਬਿੱਲ ਰੱਦ ਜਾਂ ਮਿਟਾਉਣਾ, ਬਿੱਲ ਵਾਪਸ ਕਰਨਾ, ਜਾਂ ਗਾਹਕ/ਸਪਲਾਇਰ ਮਿਟਾਉਣਾ। ਐਡਮਿਨ ਕੋਲ ਇਹ ਹਮੇਸ਼ਾ ਹੁੰਦਾ ਹੈ।';

  @override
  String get adCreate => 'ਬਣਾਓ';

  @override
  String get adAccountCreated => 'ਖਾਤਾ ਬਣ ਗਿਆ।';

  @override
  String adCreateFailed(String error) {
    return 'ਬਣਾਉਣਾ ਅਸਫਲ: $error';
  }

  @override
  String get adEditAccount => 'ਖਾਤਾ ਸੋਧੋ';

  @override
  String get adAdminSwitch => 'ਐਡਮਿਨ';

  @override
  String get adAdminHint => 'ਐਡਮਿਨ ਪੈਨਲ ਖੋਲ੍ਹ ਸਕਦਾ ਹੈ';

  @override
  String get adDisabled => 'ਬੰਦ';

  @override
  String get adDisabledHint => 'ਸਾਈਨ ਇਨ ਤੋਂ ਰੋਕਿਆ ਗਿਆ';

  @override
  String get adAccountUpdated => 'ਖਾਤਾ ਅੱਪਡੇਟ ਹੋ ਗਿਆ।';

  @override
  String adUpdateFailed(String error) {
    return 'ਅੱਪਡੇਟ ਅਸਫਲ: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label ਪੱਕੇ ਤੌਰ ਤੇ ਹਟਾ ਦਿੱਤਾ ਜਾਵੇਗਾ ਅਤੇ ਹੋਰ ਸਾਈਨ ਇਨ ਨਹੀਂ ਕਰ ਸਕੇਗਾ।';
  }

  @override
  String get adAccountDeleted => 'ਖਾਤਾ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ।';

  @override
  String adDeleteFailed(String error) {
    return 'ਮਿਟਾਉਣਾ ਅਸਫਲ: $error';
  }

  @override
  String get adBadgeAdmin => 'ਐਡਮਿਨ';

  @override
  String get adBadgeDisabled => 'ਬੰਦ';

  @override
  String get adOff => 'ਐਡਮਿਨ ਪੈਨਲ ਬੰਦ ਹੈ';

  @override
  String get adCheckAgain => 'ਦੁਬਾਰਾ ਜਾਂਚੋ';

  @override
  String get adAccessRequired => 'ਐਡਮਿਨ ਪਹੁੰਚ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get adAccessBody => 'ਸਿਰਫ਼ ਦੁਕਾਨ ਦੇ ਐਡਮਿਨ ਖਾਤੇ ਸੰਭਾਲ ਸਕਦੇ ਹਨ। ਦੁਕਾਨ ਦੇ ਮਾਲਕ ਤੋਂ ਐਡਮਿਨ ਪਹੁੰਚ ਮੰਗੋ।';

  @override
  String get adCouldNotLoad => 'ਐਡਮਿਨ ਪੈਨਲ ਲੋਡ ਨਹੀਂ ਹੋ ਸਕਿਆ।';

  @override
  String get adBadPort => 'ਸਹੀ SMTP ਪੋਰਟ ਨੰਬਰ ਦਰਜ ਕਰੋ।';

  @override
  String get adEmailSaved => 'ਈਮੇਲ ਸੈਟਿੰਗਜ਼ ਸੇਵ ਹੋ ਗਈਆਂ।';

  @override
  String adEmailSaveFailed(String error) {
    return 'ਈਮੇਲ ਸੈਟਿੰਗਜ਼ ਸੇਵ ਨਹੀਂ ਹੋ ਸਕੀਆਂ: $error';
  }

  @override
  String get adServerEmpty => 'ਸਰਵਰ ਦਾ ਪਤਾ ਖ਼ਾਲੀ ਨਹੀਂ ਹੋ ਸਕਦਾ।';

  @override
  String get adServerSaved => 'ਸਰਵਰ ਦਾ ਪਤਾ ਸੇਵ ਹੋ ਗਿਆ। ਸਕ੍ਰੀਨਾਂ ਅਗਲੀ ਲੋਡਿੰਗ ਤੇ ਇਸਨੂੰ ਵਰਤਣਗੀਆਂ।';

  @override
  String get lnOr => 'ਜਾਂ';

  @override
  String get scNotABill => 'ਇਹ ਬਿੱਲ ਨਹੀਂ ਲੱਗਦਾ। ਬਿੱਲ ਦੀ ਸਾਫ਼ ਫੋਟੋ ਨਾਲ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get scNotAnInvoice => 'ਇਹ ਇਨਵਾਇਸ ਨਹੀਂ ਲੱਗਦੀ। ਸਪਲਾਇਰ ਦੇ ਇਨਵਾਇਸ ਦੀ ਸਾਫ਼ ਫੋਟੋ ਨਾਲ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get jqOpenFull => 'ਵੱਡਾ ਕਰੋ';

  @override
  String get jqCopy => 'ਨੰਬਰ ਕਾਪੀ ਕਰੋ';

  @override
  String get jqSheetTitle => 'ਜੈਜ਼ਕੈਸ਼ QR';

  @override
  String get jqSheetHint => 'ਗਾਹਕ ਭੁਗਤਾਨ ਲਈ ਇਸਨੂੰ ਆਪਣੀ ਜੈਜ਼ਕੈਸ਼ ਐਪ ਵਿੱਚ ਸਕੈਨ ਕਰਦੇ ਹਨ।';

  @override
  String get jqCheck => 'ਨੰਬਰ ਦੁਬਾਰਾ ਵੇਖੋ';

  @override
  String get askVoice => 'ਆਵਾਜ਼';

  @override
  String get askVoiceFallbackNote => 'ਇਹ ਤੁਹਾਡੇ ਫ਼ੋਨ ਦੀ ਆਵਾਜ਼ ਵਿੱਚ ਪੜ੍ਹਿਆ ਜਾ ਰਿਹਾ ਹੈ।';

  @override
  String get askPace => 'ਰਫ਼ਤਾਰ';

  @override
  String get askTone => 'ਲਹਿਜ਼ਾ';

  @override
  String get askPaceSlower => 'ਹੌਲੀ';

  @override
  String get askPaceNormal => 'ਆਮ';

  @override
  String get askPaceFaster => 'ਤੇਜ਼';

  @override
  String get askToneCalm => 'ਸ਼ਾਂਤ';

  @override
  String get askToneWarm => 'ਨਿੱਘਾ';

  @override
  String get askToneCheerful => 'ਖੁਸ਼ਮਿਜ਼ਾਜ';

  @override
  String qPaymentUpdate(String amount) {
    return 'ਭੁਗਤਾਨ ਅੱਪਡੇਟ: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'ਗਾਹਕ: $name';
  }

  @override
  String qSupplier(String name) {
    return 'ਸਪਲਾਇਰ: $name';
  }

  @override
  String qItem(String name) {
    return 'ਸਮਾਨ: $name';
  }

  @override
  String qExpense(String name) {
    return 'ਖਰਚਾ: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'ਖਰੀਦ: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$name ਤੋਂ ਭੁਗਤਾਨ ਪ੍ਰਾਪਤ: $amount';
  }

  @override
  String gstAmount(String amount) {
    return 'ਟੈਕਸ $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'ਟੈਕਸਯੋਗ $taxable  ·  ਟੈਕਸ $tax  ·  ਕੁੱਲ $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'ਆਮਦਨ: $revenue  •  ਮਾਲ ਦੀ ਲਾਗਤ: $cogs  •  ਖਰਚੇ: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ $customer, $shop ਵੱਲੋਂ ਸ਼ੁਭਕਾਮਨਾਵਾਂ! ਤੁਹਾਡਾ ਕੁੱਲ ਬਕਾਇਆ $amount ਹੈ। ਧੰਨਵਾਦ!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ $customer, $shop ਵੱਲੋਂ $amount ਦੇ ਬਕਾਇਆ ਭੁਗਤਾਨ ਦੀ ਯਾਦ-ਦਹਾਨੀ। ਕਿਰਪਾ ਕਰਕੇ ਜਲਦੀ ਭੁਗਤਾਨ ਕਰੋ।';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'ਜ਼ਰੂਰੀ ਸੂਚਨਾ: ਪਿਆਰੇ $customer, $shop ਵਿੱਚ ਤੁਹਾਡਾ $amount ਦਾ ਬਕਾਇਆ ਭੁਗਤਾਨ ਬਾਕੀ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਹੁਣੇ ਅਦਾ ਕਰੋ।';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCash ਰਾਹੀਂ ਭੁਗਤਾਨ ਕਰੋ: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop ਵੱਲੋਂ ਬਿੱਲ\nਕੁੱਲ: $total\nਸਮਾਨ: $items\nਸਥਿਤੀ: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ $supplier, ਮੈਂ $shop ਤੋਂ ਬੋਲ ਰਿਹਾ ਹਾਂ। ਅਸੀਂ ਹੇਠ ਲਿਖੀਆਂ ਚੀਜ਼ਾਂ ਦਾ ਆਰਡਰ ਦੇਣਾ ਚਾਹੁੰਦੇ ਹਾਂ:\n$lines\n\nਕਿਰਪਾ ਕਰਕੇ ਉਪਲਬਧਤਾ ਅਤੇ ਕੀਮਤ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ। ਧੰਨਵਾਦ।';
  }

  @override
  String ppUpdated(String date) {
    return 'ਆਖ਼ਰੀ ਅੱਪਡੇਟ: $date';
  }

  @override
  String get ppWhoH => 'ਅਸੀਂ ਕੌਣ ਹਾਂ';

  @override
  String ppWho(String owner, String email) {
    return '$owner, ਜੋ Book-keep ਚਲਾਉਂਦਾ ਹੈ।\nਸੰਪਰਕ: $email';
  }

  @override
  String get ppCollectH => 'ਅਸੀਂ ਕੀ ਇਕੱਠਾ ਕਰਦੇ ਹਾਂ';

  @override
  String get ppCollectAccount => 'ਖਾਤਾ: ਈਮੇਲ, ਫ਼ੋਨ ਨੰਬਰ ਅਤੇ ਯੂਜ਼ਰਨੇਮ, Firebase Authentication ਰਾਹੀਂ।';

  @override
  String get ppCollectShop => 'ਦੁਕਾਨ ਦੀ ਪ੍ਰੋਫਾਈਲ: ਦੁਕਾਨ ਦਾ ਨਾਮ, ਪਤਾ, ਫ਼ੋਨ ਨੰਬਰ, JazzCash ਨੰਬਰ ਅਤੇ ਦੁਕਾਨ ਦਾ ਲੋਗੋ — ਜੋ ਦੁਕਾਨ ਦਾ ਮਾਲਕ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਭਰਦਾ ਹੈ।';

  @override
  String get ppCollectRecords => 'ਤੁਹਾਡੇ ਬਣਾਏ ਕਾਰੋਬਾਰੀ ਰਿਕਾਰਡ: ਗਾਹਕਾਂ ਅਤੇ ਸਪਲਾਇਰਾਂ ਦੇ ਨਾਮ ਤੇ ਫ਼ੋਨ ਨੰਬਰ, ਬਿੱਲ, ਖਰੀਦਾਂ, ਆਈਟਮ ਕੈਟਾਲਾਗ (ਆਈਟਮ ਦੀਆਂ ਫ਼ੋਟੋਆਂ ਅਤੇ ਬਾਰਕੋਡ ਸਮੇਤ) ਅਤੇ ਖਰਚੇ (ਰਸੀਦਾਂ ਦੀਆਂ ਫ਼ੋਟੋਆਂ ਸਮੇਤ)। ਇਹ ਐਪ ਦਾ ਮੁੱਖ ਡੇਟਾ ਹੈ — ਹਿਸਾਬ-ਕਿਤਾਬ ਇਸੇ ਤਰ੍ਹਾਂ ਚੱਲਦਾ ਹੈ।';

  @override
  String get ppCollectDevice => 'ਡਿਵਾਈਸ ਅਤੇ ਡਾਇਗਨੌਸਟਿਕ ਡੇਟਾ: ਪੁਸ਼-ਨੋਟੀਫ਼ਿਕੇਸ਼ਨ ਟੋਕਨ (ਘੱਟ ਸਟਾਕ, ਬਕਾਇਆ ਭੁਗਤਾਨ ਅਤੇ ਰੋਜ਼ਾਨਾ ਸਾਰ ਦੇ ਅਲਰਟਾਂ ਲਈ) ਅਤੇ ਕਰੈਸ਼ ਰਿਪੋਰਟਾਂ (ਡਿਵਾਈਸ ਦੀ ਜਾਣਕਾਰੀ ਅਤੇ ਸਟੈਕ ਟਰੇਸ) Firebase Crashlytics ਰਾਹੀਂ, ਜੋ ਐਪ ਕਰੈਸ਼ ਹੋਣ ’ਤੇ ਆਪਣੇ-ਆਪ ਭੇਜੀਆਂ ਜਾਂਦੀਆਂ ਹਨ।';

  @override
  String ppCollectAi(String askShop) {
    return 'AI ਫ਼ੀਚਰ: $askShop, AI ਸਵੇਰ ਦਾ ਸਾਰ ਅਤੇ AI ਬਿੱਲ/ਖਰੀਦ ਸਕੈਨਰ ਜਵਾਬ, ਸਾਰ ਜਾਂ ਕੱਢੀਆਂ ਲਾਈਨਾਂ ਬਣਾਉਣ ਲਈ ਸੰਬੰਧਿਤ ਕਾਰੋਬਾਰੀ ਡੇਟਾ ਦਾ ਇੱਕ ਸਨੈਪਸ਼ੌਟ (ਰਿਪੋਰਟ ਦੇ ਅੰਕੜੇ ਜਾਂ ਬਿੱਲ ਦੀ ਫ਼ੋਟੋ) Google ਦੇ Gemini API ਨੂੰ ਭੇਜਦੇ ਹਨ। ਇਸ ਡੇਟਾ ਨੂੰ Google ਜਵਾਬ ਬਣਾਉਣ ਲਈ ਪ੍ਰੋਸੈਸ ਕਰਦਾ ਹੈ; ਅਸੀਂ ਅਤੇ Google ਇਸਨੂੰ Google ਦੀਆਂ ਮਿਆਰੀ API ਸ਼ਰਤਾਂ ਤੋਂ ਬਾਹਰ ਮਾਡਲ ਸਿਖਲਾਈ ਲਈ ਨਹੀਂ ਵਰਤਦੇ।';
  }

  @override
  String get ppDontH => 'ਅਸੀਂ ਕੀ ਨਹੀਂ ਕਰਦੇ';

  @override
  String get ppDontLocation => 'ਅਸੀਂ ਤੁਹਾਡੀ ਲੋਕੇਸ਼ਨ ਟਰੈਕ ਨਹੀਂ ਕਰਦੇ।';

  @override
  String get ppDontAds => 'ਅਸੀਂ ਇਸ਼ਤਿਹਾਰ ਨੈੱਟਵਰਕ ਜਾਂ ਵਿਵਹਾਰ-ਵਿਸ਼ਲੇਸ਼ਣ/ਸੈਸ਼ਨ-ਰਿਕਾਰਡਿੰਗ ਟੂਲ ਨਹੀਂ ਵਰਤਦੇ।';

  @override
  String get ppDontSell => 'ਅਸੀਂ ਤੁਹਾਡਾ ਡੇਟਾ ਜਾਂ ਤੁਹਾਡੇ ਗਾਹਕਾਂ ਦਾ ਡੇਟਾ ਕਿਸੇ ਨੂੰ ਨਹੀਂ ਵੇਚਦੇ।';

  @override
  String get ppWhereH => 'ਡੇਟਾ ਕਿੱਥੇ ਰਹਿੰਦਾ ਹੈ';

  @override
  String get ppWhereDb => 'ਡੇਟਾਬੇਸ: Neon (Postgres), ਇੱਕ ਤੀਜੀ-ਧਿਰ ਕਲਾਉਡ ਡੇਟਾਬੇਸ ਪ੍ਰਦਾਤਾ।';

  @override
  String get ppWhereFirebase => 'ਪ੍ਰਮਾਣੀਕਰਨ, ਪੁਸ਼ ਨੋਟੀਫ਼ਿਕੇਸ਼ਨ, ਕਰੈਸ਼ ਰਿਪੋਰਟਾਂ, ਫ਼ੋਟੋ ਸਟੋਰੇਜ: Firebase (Google)।';

  @override
  String get ppWhereAi => 'AI ਪ੍ਰੋਸੈਸਿੰਗ: Google Gemini API।';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'ਇਨਵੌਇਸ ਈਮੇਲਾਂ: ਉਸ SMTP ਖਾਤੇ ਰਾਹੀਂ ਭੇਜੀਆਂ ਜਾਂਦੀਆਂ ਹਨ ਜੋ ਤੁਹਾਡੀ ਦੁਕਾਨ ਦਾ ਐਡਮਿਨ $adminPanel ਵਿੱਚ ਸੈੱਟ ਕਰਦਾ ਹੈ। ਸਾਡੀ ਕੋਈ ਮੇਲਿੰਗ ਲਿਸਟ ਨਹੀਂ; ਇਹ ਈਮੇਲਾਂ ਤੁਹਾਡੇ ਆਪਣੇ ਗਾਹਕਾਂ ਨੂੰ ਇੱਕ-ਇੱਕ ਕਰਕੇ ਬਿੱਲ/ਸਟੇਟਮੈਂਟਾਂ ਹਨ, ਥੋਕ ਮਾਰਕੀਟਿੰਗ ਨਹੀਂ।';
  }

  @override
  String get ppYoursH => 'ਤੁਹਾਡਾ ਡੇਟਾ, ਤੁਹਾਡੇ ਗਾਹਕਾਂ ਦਾ ਡੇਟਾ';

  @override
  String get ppYours => 'ਤੁਸੀਂ ਜੋ ਵੀ ਭਰਦੇ ਹੋ — ਗਾਹਕ, ਸਪਲਾਇਰ, ਬਿੱਲ, ਆਈਟਮਾਂ — ਉਹ ਤੁਹਾਡੀ ਦੁਕਾਨ ਦਾ ਹੈ। Book-keep ਵਰਤਣ ਵਾਲੀਆਂ ਹੋਰ ਦੁਕਾਨਾਂ ਇਸਨੂੰ ਨਹੀਂ ਦੇਖ ਸਕਦੀਆਂ। ਤੁਹਾਡੇ ਬਣਾਏ ਸਟਾਫ਼ ਖਾਤੇ ਸਿਰਫ਼ ਉਹੀ ਦੇਖਦੇ ਹਨ ਜਿਸਦੀ ਤੁਸੀਂ ਇਜਾਜ਼ਤ ਦਿੰਦੇ ਹੋ।';

  @override
  String get ppControlsH => 'ਤੁਹਾਡੇ ਕੰਟਰੋਲ';

  @override
  String ppControlExport(String path) {
    return 'ਆਪਣਾ ਡੇਟਾ ਐਕਸਪੋਰਟ ਜਾਂ ਬੈਕਅੱਪ ਕਰੋ: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'ਆਪਣਾ ਖਾਤਾ ਮਿਟਾਓ: $path। ਇਸ ਨਾਲ ਸਿਰਫ਼ ਤੁਹਾਡੀ ਸਾਈਨ-ਇਨ ਪਛਾਣ ਹਟਦੀ ਹੈ; ਤੁਹਾਡੀ ਦੁਕਾਨ ਦੇ ਕਾਰੋਬਾਰੀ ਰਿਕਾਰਡ (ਬਿੱਲ, ਗਾਹਕ, ਆਈਟਮਾਂ ਆਦਿ) ਨਹੀਂ ਮਿਟਦੇ, ਜਿਵੇਂ ਕਿਸੇ ਸਟਾਫ਼ ਮੈਂਬਰ ਨੂੰ ਹਟਾਉਣ ਨਾਲ ਉਸਦੇ ਬਣਾਏ ਰਿਕਾਰਡ ਨਹੀਂ ਮਿਟਦੇ।';
  }

  @override
  String ppControlNotif(String path) {
    return 'ਨੋਟੀਫ਼ਿਕੇਸ਼ਨ: ਕਿਸਮ ਅਨੁਸਾਰ $path ਵਿੱਚ ਬੰਦ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ।';
  }

  @override
  String get ppChildrenH => 'ਬੱਚੇ';

  @override
  String get ppChildren => 'Book-keep ਦੁਕਾਨ ਮਾਲਕਾਂ ਅਤੇ ਸਟਾਫ਼ ਲਈ ਇੱਕ ਕਾਰੋਬਾਰੀ ਸੰਦ ਹੈ। ਇਹ ਬੱਚਿਆਂ ਲਈ ਨਹੀਂ ਹੈ ਅਤੇ ਬੱਚੇ ਇਸਨੂੰ ਜਾਣ-ਬੁੱਝ ਕੇ ਨਹੀਂ ਵਰਤਦੇ।';

  @override
  String get ppChangesH => 'ਇਸ ਨੀਤੀ ਵਿੱਚ ਤਬਦੀਲੀਆਂ';

  @override
  String get ppChanges => 'ਜੇ ਅਸੀਂ ਜੋ ਇਕੱਠਾ ਕਰਦੇ ਹਾਂ ਜਾਂ ਉਹ ਜਿੱਥੇ ਜਾਂਦਾ ਹੈ ਬਦਲਦਾ ਹੈ, ਤਾਂ ਅਸੀਂ ਇਹ ਸਫ਼ਾ ਅੱਪਡੇਟ ਕਰਾਂਗੇ ਅਤੇ ਉੱਪਰਲੀ ਤਾਰੀਖ਼ ਬਦਲ ਦੇਵਾਂਗੇ।';

  @override
  String get ppContactH => 'ਸੰਪਰਕ';

  @override
  String ppContact(String email) {
    return 'ਇਸ ਨੀਤੀ ਜਾਂ ਤੁਹਾਡੇ ਡੇਟਾ ਬਾਰੇ ਸਵਾਲ: $email';
  }

  @override
  String get waHello => 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ!';

  @override
  String waHelloNamed(String name) {
    return 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ $name,';
  }

  @override
  String get gstTaxable => 'ਟੈਕਸਯੋਗ';

  @override
  String get gstTax => 'ਟੈਕਸ';

  @override
  String get gstTaxableValue => 'ਟੈਕਸਯੋਗ ਮੁੱਲ';

  @override
  String get gstTotalTax => 'ਕੁੱਲ ਟੈਕਸ';

  @override
  String get gstTotalItc => 'ਕੁੱਲ ਇਨਪੁਟ ਟੈਕਸ ਕ੍ਰੈਡਿਟ';

  @override
  String get gstExempt => 'ਛੋਟ ਪ੍ਰਾਪਤ ਵਿਕਰੀ';

  @override
  String get gstNetPayable => 'ਅਦਾ ਕਰਨ ਯੋਗ ਸ਼ੁੱਧ ਟੈਕਸ';

  @override
  String get unknownName => 'ਅਣਜਾਣ';

  @override
  String get unitPiece => 'ਪੀਸ';

  @override
  String get unitKg => 'ਕਿਲੋ';

  @override
  String get unitMeter => 'ਮੀਟਰ';

  @override
  String get unitBox => 'ਡੱਬਾ';

  @override
  String get unitDozen => 'ਦਰਜਨ';

  @override
  String get unitLiter => 'ਲੀਟਰ';

  @override
  String get unitBag => 'ਬੋਰੀ';

  @override
  String deleteSupplierMessage(String name) {
    return '$name ਅਤੇ ਉਸਦੀਆਂ ਸਾਰੀਆਂ ਖਰੀਦਾਂ ਮਿਟਾਉਣੀਆਂ ਹਨ? ਇਹ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';
  }
}
