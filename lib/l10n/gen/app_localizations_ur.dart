// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get navHome => 'ہوم';

  @override
  String get navCustomers => 'گاہک';

  @override
  String get navItems => 'اشیاء';

  @override
  String get navSuppliers => 'سپلائرز';

  @override
  String get navReports => 'رپورٹس';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String get settingsShopDetailsTitle => 'دکان کی تفصیلات';

  @override
  String get settingsShopDetailsSubtitle => 'آپ کے انوائسز پر ظاہر ہوتا ہے۔';

  @override
  String get settingsShopNameLabel => 'دکان کا نام';

  @override
  String get settingsShopAddressLabel => 'دکان کا پتہ';

  @override
  String get settingsPhoneLabel => 'فون';

  @override
  String get settingsSaveShopDetails => 'دکان کی تفصیلات محفوظ کریں';

  @override
  String get settingsAppearanceTitle => 'ظاہری شکل';

  @override
  String get settingsAppearanceSubtitle => 'پوری ایپ کے لیے تھیم منتخب کریں۔';

  @override
  String get themeLight => 'ہلکا';

  @override
  String get themeDark => 'گہرا';

  @override
  String get themeSystem => 'سسٹم';

  @override
  String get settingsLanguageTitle => 'زبان';

  @override
  String get settingsLanguageSubtitle => 'ایپ کی ڈسپلے زبان منتخب کریں۔';

  @override
  String get sortNameNewest => 'ترتیب: نام / تازہ ترین';

  @override
  String get addCustomer => 'گاہک شامل کریں';

  @override
  String get importCsv => 'CSV درآمد کریں';

  @override
  String get searchShop => 'دکان میں تلاش کریں';

  @override
  String get scanToFindItem => 'چیز ڈھونڈنے کے لیے اسکین کریں';

  @override
  String get bulkAdd => 'ایک ساتھ شامل کریں';

  @override
  String get updateStock => 'اسٹاک اپ ڈیٹ کریں';

  @override
  String get printLabels => 'لیبل پرنٹ کریں';

  @override
  String get mergeDuplicates => 'ڈپلیکیٹ ملائیں';

  @override
  String get addSupplier => 'سپلائر شامل کریں';

  @override
  String get scanPurchaseInvoice => 'خریداری کا انوائس اسکین کریں';

  @override
  String askNoAnswer(String reason) {
    return 'جواب نہیں مل سکا: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'رابطہ نہیں ہو سکا: $error';
  }

  @override
  String get micPermissionNeeded => 'آواز سے پوچھنے کے لیے مائیکروفون کی اجازت درکار ہے۔';

  @override
  String get speechUnavailable => 'اس ڈیوائس پر آواز کی شناخت دستیاب نہیں ہے۔';

  @override
  String get askYourShop => 'اپنی دکان سے پوچھیں';

  @override
  String get close => 'بند کریں';

  @override
  String get askIntro => 'جاننا چاہتے ہیں دکان کیسی چل رہی ہے؟ مجھ سے پوچھیں، آپ کے کھاتے میں جو درج ہے اسی سے جواب ملے گا۔';

  @override
  String get askListening => 'سن رہا ہے…';

  @override
  String get askThinkingWords => 'سوچ رہا ہے…|کام ہو رہا ہے…|حساب لگا رہا ہے…|کھاتے دیکھ رہا ہے…|جوڑ رہا ہے…|اعداد و شمار دیکھ رہا ہے…';

  @override
  String get askSayQuestion => 'اپنا سوال بولیں — منسوخ کرنے کے لیے گولے کو ٹیپ کریں';

  @override
  String briefingRefreshFailed(int code) {
    return 'بریفنگ تازہ نہیں ہو سکی ($code)۔';
  }

  @override
  String get refreshFailedOffline => 'تازہ نہیں ہو سکا — اپنا کنکشن چیک کریں۔';

  @override
  String get newBillFailed => 'نیا بل شروع نہیں ہو سکا — کنکشن چیک کر کے دوبارہ کوشش کریں۔';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'پہلے $name کے لیے پسندیدہ سپلائر مقرر کریں (ترمیم کے لیے ٹیپ کریں)۔';
  }

  @override
  String get reorderBySupplier => 'سپلائر کے حساب سے دوبارہ آرڈر';

  @override
  String get supplier => 'سپلائر';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں',
      one: '1 چیز',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'کم اسٹاک والی کسی چیز کا پسندیدہ سپلائر ابھی مقرر نہیں۔';

  @override
  String get thisSupplier => 'یہ سپلائر';

  @override
  String supplierNoPhone(String name) {
    return '$name کا فون نمبر درج نہیں ہے۔';
  }

  @override
  String get tabOverview => 'خلاصہ';

  @override
  String get tabStock => 'اسٹاک';

  @override
  String get tabMoney => 'رقم';

  @override
  String get taglineOverview => 'آج کے بقایا جات، اسٹاک اور نقدی ایک نظر میں۔';

  @override
  String get taglineStock => 'کیا بک رہا ہے، کیا کم ہو رہا ہے۔';

  @override
  String get taglineMoney => 'اخراجات، حساب کا ملان اور وصولیاں۔';

  @override
  String loadingDashboard(int done, int total) {
    return 'ڈیش بورڈ لوڈ ہو رہا ہے… $total میں سے $done';
  }

  @override
  String get dashboardLoadFailed => 'ڈیش بورڈ لوڈ نہیں ہو سکا';

  @override
  String get checkConnectionRetry => 'اپنا کنکشن چیک کریں اور دوبارہ کوشش کریں۔';

  @override
  String get retry => 'دوبارہ کوشش';

  @override
  String get aiBriefing => 'AI بریفنگ';

  @override
  String get briefingPrompt => 'کل کا کاروبار چند جملوں میں دیکھیں۔';

  @override
  String get getBriefing => 'بریفنگ لیں';

  @override
  String get refreshBriefing => 'بریفنگ تازہ کریں';

  @override
  String updatedAt(String time) {
    return 'اپ ڈیٹ $time';
  }

  @override
  String get customersUnknown => '— گاہک';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گاہک',
      one: '1 گاہک',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'پچھلا مہینہ';

  @override
  String get nextMonth => 'اگلا مہینہ';

  @override
  String get salesMonth => 'فروخت (مہینہ)';

  @override
  String get outstanding => 'بقایا';

  @override
  String get profitMonth => 'منافع (مہینہ)';

  @override
  String get cashToday => 'آج کی نقدی';

  @override
  String get newBill => 'نیا بل';

  @override
  String get scanHandwrittenBill => 'ہاتھ سے لکھا بل اسکین کریں';

  @override
  String get topOutstanding => 'سب سے زیادہ بقایا جات';

  @override
  String viewAllInDues(int count) {
    return 'واجبات میں تمام $count دیکھیں';
  }

  @override
  String get lowStockAlerts => 'کم اسٹاک کی اطلاعات';

  @override
  String get noLowStock => 'کوئی چیز کم اسٹاک میں نہیں — اسٹاک ٹھیک ہے۔';

  @override
  String get whatsappAll => 'سب کو واٹس ایپ';

  @override
  String get reorderAll => 'سب دوبارہ آرڈر کریں';

  @override
  String suggestReorder(String qty, String unit) {
    return 'تجویز: $qty $unit دوبارہ آرڈر کریں';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit باقی';
  }

  @override
  String get reorder => 'دوبارہ آرڈر';

  @override
  String get whatsappSupplier => 'سپلائر کو واٹس ایپ';

  @override
  String get topItemsByRevenue => 'آمدنی کے لحاظ سے سرفہرست چیزیں';

  @override
  String get noSalesYet => 'ابھی کوئی فروخت درج نہیں۔';

  @override
  String qtyLabel(String qty) {
    return 'مقدار: $qty';
  }

  @override
  String get monthExpenses => 'اس مہینے کے اخراجات';

  @override
  String get noExpensesMonth => 'اس مہینے کوئی خرچ درج نہیں۔';

  @override
  String get quickActions => 'فوری کام';

  @override
  String get dailyCashReconciliation => 'روزانہ نقدی کا ملان';

  @override
  String get collectMoney => 'رقم وصول کریں';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تبدیلیاں آف لائن محفوظ',
      one: '1 تبدیلی آف لائن محفوظ',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'آن لائن ہوتے ہی خود بخود سنک ہو جائے گا';

  @override
  String get syncing => 'سنک ہو رہا ہے';

  @override
  String get sync => 'سنک';

  @override
  String get shopProfile => 'دکان کی پروفائل';

  @override
  String get insights => 'جائزہ';

  @override
  String get notifications => 'اطلاعات';

  @override
  String get backupExport => 'بیک اپ اور ایکسپورٹ';

  @override
  String get adminPanel => 'ایڈمن پینل';

  @override
  String get toolsSync => 'ٹولز اور سنک';

  @override
  String get account => 'اکاؤنٹ';

  @override
  String get shopDetailsSaved => 'دکان کی تفصیلات محفوظ ہو گئیں۔';

  @override
  String saveFailed(int code) {
    return 'محفوظ نہیں ہو سکا ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'محفوظ نہیں ہو سکا: $error';
  }

  @override
  String get logoUpdated => 'لوگو اپ ڈیٹ ہو گیا۔';

  @override
  String logoUploadFailed(int code) {
    return 'لوگو اپ لوڈ نہیں ہو سکا ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'لوگو اپ لوڈ نہیں ہو سکا: $error';
  }

  @override
  String get healthGood => 'مجموعی طور پر سب ٹھیک ہے۔';

  @override
  String get healthSome => 'کچھ چیزوں پر توجہ کی ضرورت ہے۔';

  @override
  String get healthMany => 'کئی چیزوں پر توجہ کی ضرورت ہے۔';

  @override
  String get shopHealth => 'دکان کی صحت';

  @override
  String get healthIntro => 'ایک چھوٹی سی یاد دہانی، ایک اور رپورٹ نہیں۔';

  @override
  String get couldNotLoadCheckConnection => 'لوڈ نہیں ہو سکا — اپنا کنکشن چیک کریں۔';

  @override
  String get itemPhotos => 'چیزوں کی تصاویر';

  @override
  String get barcodes => 'بارکوڈ';

  @override
  String get lowStockItems => 'کم اسٹاک والی چیزیں';

  @override
  String get lastBackup => 'آخری بیک اپ';

  @override
  String get today => 'آج';

  @override
  String get yesterday => 'کل';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days دن پہلے',
      one: '1 دن پہلے',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'آف لائن حالت';

  @override
  String get online => 'آن لائن';

  @override
  String get offline => 'آف لائن';

  @override
  String get waitingToSync => 'سنک کے منتظر';

  @override
  String get syncNow => 'ابھی سنک کریں';

  @override
  String get searchSettings => 'ترتیبات میں تلاش کریں';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\" سے کوئی ترتیب نہیں ملی';
  }

  @override
  String get businessInfo => 'کاروباری معلومات';

  @override
  String get payment => 'ادائیگی';

  @override
  String get shopNameRequired => 'دکان کا نام ضروری ہے';

  @override
  String phoneIncomplete(int digits) {
    return 'مکمل $digits ہندسوں کا فون نمبر درج کریں';
  }

  @override
  String get jazzcashOptional => 'JazzCash نمبر (اختیاری)';

  @override
  String get saved => 'محفوظ!';

  @override
  String get languageSubtitle => 'ایپ کی زبان تبدیل کریں';

  @override
  String get notificationsSubtitle => 'کم اسٹاک، واجب الادا ادائیگیاں اور روزانہ خلاصہ';

  @override
  String get backupSubtitle => 'دکان کا ڈیٹا ڈاؤن لوڈ، بحال اور ایکسپورٹ کریں';

  @override
  String get appUpdate => 'ایپ اپ ڈیٹ';

  @override
  String get appUpdateSubtitle => 'نیا ورژن چیک کریں';

  @override
  String get adminSubtitle => 'اکاؤنٹس اور دکان کا ڈیٹا منظم کریں';

  @override
  String get accountSubtitle => 'سائن اِن، پاس ورڈ اور یوزر نیم';

  @override
  String get privacyPolicy => 'رازداری کی پالیسی';

  @override
  String get privacySubtitle => 'ہم کون سا ڈیٹا جمع کرتے ہیں اور کیوں';

  @override
  String get yourShop => 'آپ کی دکان';

  @override
  String get uploadingLogo => 'دکان کا لوگو اپ لوڈ ہو رہا ہے';

  @override
  String get logoTapToChange => 'دکان کا لوگو، بدلنے کے لیے ٹیپ کریں';

  @override
  String get brandTagline => 'دکان مصروف، حساب پُرسکون۔';

  @override
  String serverError(int code) {
    return 'سرور کی خرابی: $code';
  }

  @override
  String get deleteCustomer => 'گاہک حذف کریں';

  @override
  String deleteCustomerMessage(String name) {
    return '$name اور ان کے تمام بل حذف کریں؟ یہ واپس نہیں ہو سکتا۔';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'حذف نہیں ہو سکا: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'حذف نہیں ہو سکا — کنکشن چیک کر کے دوبارہ کوشش کریں۔';

  @override
  String get actions => 'اقدامات';

  @override
  String get edit => 'ترمیم';

  @override
  String get delete => 'حذف کریں';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گاہک حذف کریں',
      one: '1 گاہک حذف کریں',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گاہک اور ان کے تمام بل حذف کریں؟ یہ واپس نہیں ہو سکتا۔',
      one: '1 گاہک اور اس کے تمام بل حذف کریں؟ یہ واپس نہیں ہو سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'سب کا انتخاب ختم کریں';

  @override
  String get selectAll => 'سب منتخب کریں';

  @override
  String selectedCount(int count) {
    return '$count منتخب';
  }

  @override
  String get cancel => 'منسوخ';

  @override
  String get newTag => 'نیا';

  @override
  String get csvNeedsRows => 'CSV میں ہیڈر کی قطار اور کم از کم ایک گاہک ہونا ضروری ہے۔';

  @override
  String get csvNeedsName => 'CSV ہیڈر میں \"name\" کالم ہونا ضروری ہے۔';

  @override
  String csvLineMissingName(int line) {
    return 'لائن $line: نام موجود نہیں — فائل ٹھیک کر کے دوبارہ کوشش کریں۔';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'لائن $line: غلط credit_limit \"$value\" — فائل ٹھیک کر کے دوبارہ کوشش کریں۔';
  }

  @override
  String get importCustomers => 'گاہک درآمد کریں';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" میں $count گاہک ملے۔ سب درآمد کریں؟',
      one: '\"$file\" میں 1 گاہک ملا۔ درآمد کریں؟',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'درآمد کریں';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گاہک درآمد ہو گئے۔',
      one: '1 گاہک درآمد ہو گیا۔',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'درآمد ناکام: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'درآمد ناکام — رابطہ نہیں ہو سکا: $error';
  }

  @override
  String get noPhone => 'فون نہیں';

  @override
  String get offlineShowingSaved => 'آف لائن — محفوظ شدہ نقل دکھائی جا رہی ہے';

  @override
  String get searchCustomersHint => 'گاہک یا فون تلاش کریں...';

  @override
  String get noCustomersYet => 'ابھی کوئی گاہک نہیں۔ شامل کرنے کے لیے + ٹیپ کریں۔';

  @override
  String get noCustomersMatch => 'تلاش سے کوئی گاہک نہیں ملا۔';

  @override
  String get owesMoney => 'رقم باقی ہے';

  @override
  String get settledUp => 'حساب برابر';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what لوڈ نہیں ہو سکا: $error';
  }

  @override
  String get takePhoto => 'تصویر لیں';

  @override
  String get chooseFromGallery => 'گیلری سے منتخب کریں';

  @override
  String get back => 'واپس';

  @override
  String callPhone(String phone) {
    return '$phone پر کال کریں';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone پر واٹس ایپ';
  }

  @override
  String get clearSearch => 'تلاش صاف کریں';

  @override
  String get askHint => 'مثلاً اس مہینے مجھے کتنا منافع ہوا؟';

  @override
  String get acctTurnOffLockTitle => 'ایپ لاک بند کریں؟';

  @override
  String get acctTurnOffLockBody => 'اس فون والا کوئی بھی شخص PIN کے بغیر ایپ کھول سکے گا۔';

  @override
  String get acctTurnOff => 'بند کریں';

  @override
  String get acctSetPinTitle => 'PIN مقرر کریں';

  @override
  String get acctPinLabel => '4 سے 6 ہندسوں کا PIN';

  @override
  String get acctPinMin => 'کم از کم 4 ہندسے';

  @override
  String get acctConfirmPin => 'PIN کی تصدیق کریں';

  @override
  String get acctPinMismatch => 'PIN آپس میں نہیں ملتے';

  @override
  String get acctSetPin => 'PIN مقرر کریں';

  @override
  String get acctBiometricTitle => 'فنگر پرنٹ/چہرہ بھی استعمال کریں؟';

  @override
  String get acctBiometricBody => 'بایومیٹرک ناکام ہو جائے تو بھی آپ PIN استعمال کر سکتے ہیں۔';

  @override
  String get acctNoThanks => 'نہیں، شکریہ';

  @override
  String get acctEnable => 'فعال کریں';

  @override
  String get acctSetPasswordTitle => 'پاس ورڈ مقرر کریں';

  @override
  String get acctSetPasswordIntro => 'ایک پاس ورڈ چنیں تاکہ آپ اگلی بار صرف Google کے بجائے ای میل + پاس ورڈ سے بھی سائن اِن کر سکیں۔';

  @override
  String get acctPassword => 'پاس ورڈ';

  @override
  String get acctPasswordMin => 'کم از کم 6 حروف ہونے چاہییں';

  @override
  String get acctConfirmPassword => 'پاس ورڈ کی تصدیق کریں';

  @override
  String get acctPasswordsMismatch => 'پاس ورڈ آپس میں نہیں ملتے';

  @override
  String get acctSetPasswordButton => 'پاس ورڈ مقرر کریں';

  @override
  String get acctPasswordSet => 'پاس ورڈ مقرر ہو گیا — اب آپ اس سے بھی سائن اِن کر سکتے ہیں۔';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'پاس ورڈ مقرر نہیں ہو سکا: $error';
  }

  @override
  String get acctChangePasswordTitle => 'پاس ورڈ تبدیل کریں';

  @override
  String get acctCurrentPassword => 'موجودہ پاس ورڈ';

  @override
  String get acctRequired => 'ضروری ہے';

  @override
  String get acctNewPassword => 'نیا پاس ورڈ';

  @override
  String get acctConfirmNewPassword => 'نئے پاس ورڈ کی تصدیق کریں';

  @override
  String get acctChange => 'تبدیل کریں';

  @override
  String get acctPasswordChanged => 'پاس ورڈ تبدیل ہو گیا۔';

  @override
  String get acctWrongPassword => 'موجودہ پاس ورڈ غلط ہے۔';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'پاس ورڈ تبدیل نہیں ہو سکا: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'صارف نام تبدیل کریں';

  @override
  String get acctUsername => 'صارف نام';

  @override
  String get acctUsernameEmpty => 'صارف نام خالی نہیں ہو سکتا';

  @override
  String get acctUsernameChanged => 'صارف نام تبدیل ہو گیا۔';

  @override
  String get acctChangeEmailTitle => 'ای میل تبدیل کریں';

  @override
  String get acctNewEmail => 'نئی ای میل';

  @override
  String get acctValidEmail => 'درست ای میل درج کریں';

  @override
  String get acctRequiredConfirm => 'آپ کی شناخت کی تصدیق کے لیے ضروری ہے';

  @override
  String get acctGoogleConfirmFirst => 'پہلے آپ سے Google کے ذریعے تصدیق کروائی جائے گی۔';

  @override
  String acctCheckEmail(String email) {
    return 'تبدیلی کی تصدیق کے لنک کے لیے $email چیک کریں۔';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'پاس ورڈ سائن اِن';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider ہٹائیں؟';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'آپ اس اکاؤنٹ پر $provider سے سائن اِن نہیں کر سکیں گے۔';
  }

  @override
  String get acctRemove => 'ہٹائیں';

  @override
  String acctRemoved(String provider) {
    return '$provider ہٹا دیا گیا۔';
  }

  @override
  String get acctSignedIn => 'سائن اِن ہیں';

  @override
  String get acctEmailNotVerified => 'ای میل کی ابھی تصدیق نہیں ہوئی۔';

  @override
  String get acctVerificationSent => 'تصدیقی ای میل بھیج دی گئی۔';

  @override
  String get acctResend => 'دوبارہ بھیجیں';

  @override
  String get acctSectionSignIn => 'سائن اِن اور سکیورٹی';

  @override
  String get acctRowChangeUsername => 'صارف نام تبدیل کریں';

  @override
  String get acctRowChangeEmail => 'ای میل تبدیل کریں';

  @override
  String get acctRowSetPassword => 'پاس ورڈ مقرر کریں';

  @override
  String get acctRowChangePassword => 'پاس ورڈ تبدیل کریں';

  @override
  String get acctRowUnlinkGoogle => 'Google ان لنک کریں';

  @override
  String get acctRowRemovePassword => 'پاس ورڈ ہٹائیں';

  @override
  String get acctRowAppLock => 'ایپ لاک (PIN)';

  @override
  String get acctRowBiometric => 'فنگر پرنٹ/چہرہ استعمال کریں';

  @override
  String get acctSignOutTitle => 'سائن آؤٹ کریں؟';

  @override
  String get acctSignOutBody => 'ایپ استعمال کرنے کے لیے آپ کو دوبارہ سائن اِن کرنا ہوگا۔';

  @override
  String get acctSignOut => 'سائن آؤٹ';

  @override
  String get acctDeleteAccount => 'اکاؤنٹ حذف کریں';

  @override
  String get acctDeleting => 'حذف ہو رہا ہے...';

  @override
  String get acctDeleteTitle => 'اکاؤنٹ حذف کریں؟';

  @override
  String get acctDeleteBody => 'یہ آپ کے سائن اِن کی معلومات ہمیشہ کے لیے حذف کر دے گا۔ ایپ استعمال کرنے کے لیے دوبارہ سائن اپ کرنا ہوگا۔ یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String acctCouldNotDelete(String error) {
    return 'اکاؤنٹ حذف نہیں ہو سکا: $error';
  }

  @override
  String get itmNotFoundTitle => 'چیز نہیں ملی';

  @override
  String itmNotFoundBody(String barcode) {
    return 'بارکوڈ $barcode والی کوئی چیز موجود نہیں۔ کیا اسے ابھی نئی چیز کے طور پر شامل کریں؟';
  }

  @override
  String get itmAddItem => 'چیز شامل کریں';

  @override
  String get itmEditItem => 'چیز میں ترمیم کریں';

  @override
  String get itmMergeTitle => 'ڈپلیکیٹ چیزیں ملائیں';

  @override
  String get itmMergeBody => 'ایک ہی نام والی چیزیں سب سے پرانی اندراج میں ملا دی جائیں گی اور ان کا اسٹاک جمع ہو جائے گا۔ یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String get itmMerge => 'ملائیں';

  @override
  String get itmNoDuplicates => 'کوئی ڈپلیکیٹ چیز نہیں ملی۔';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ڈپلیکیٹ چیزیں ملا دی گئیں۔',
      one: '1 ڈپلیکیٹ چیز ملا دی گئی۔',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'چیز حذف کریں';

  @override
  String get itmCannotUndo => 'یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String get itmDeleteOffline => 'حذف نہیں ہو سکا — اپنا کنکشن چیک کر کے دوبارہ کوشش کریں۔';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں حذف کریں',
      one: '1 چیز حذف کریں',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں حذف کریں؟ یہ عمل واپس نہیں ہو سکتا۔',
      one: '1 چیز حذف کریں؟ یہ عمل واپس نہیں ہو سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'تصویر اپ لوڈ نہیں ہو سکی ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'تصویر اپ لوڈ نہیں ہو سکی: $error';
  }

  @override
  String get itmNoBarcodes => 'ابھی کسی چیز کا بارکوڈ نہیں ہے۔';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count لیبل پرنٹ کریں',
      one: '1 لیبل پرنٹ کریں',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'چیز یا زمرہ تلاش کریں...';

  @override
  String get itmStopListening => 'سننا بند کریں';

  @override
  String get itmVoiceSearch => 'آواز سے تلاش';

  @override
  String get itmSort => 'ترتیب';

  @override
  String get itmSortName => 'نام (الف-ے)';

  @override
  String get itmSortStockLow => 'اسٹاک: کم سے زیادہ';

  @override
  String get itmSortRecent => 'حال ہی میں شامل';

  @override
  String get itmFilterAll => 'سب';

  @override
  String get itmFilterLowStock => 'کم اسٹاک';

  @override
  String get itmNoItemsYet => 'ابھی کوئی چیز نہیں۔ شامل کرنے کے لیے + دبائیں۔';

  @override
  String get itmNoItemsMatch => 'آپ کی تلاش سے کوئی چیز نہیں ملی۔';

  @override
  String get itmNoPriceChanges => 'ابھی قیمت میں کوئی تبدیلی درج نہیں۔';

  @override
  String get itmNoStockCorrections => 'ابھی اسٹاک کی کوئی درستگی درج نہیں۔';

  @override
  String get itmResetHistory => 'تاریخ ری سیٹ کریں';

  @override
  String get itmResetHistoryMsg => 'اس آئٹم کی تاریخ ری سیٹ کریں؟ اسے واپس نہیں کیا جا سکتا۔';

  @override
  String get itmSendPdf => 'PDF کے طور پر بھیجیں';

  @override
  String get itmNoteOptional => 'نوٹ (اختیاری)';

  @override
  String get itmNoteHint => 'اس تبدیلی کے لیے نوٹ شامل کریں';

  @override
  String get itmRemoveEntry => 'اندراج ہٹائیں';

  @override
  String get itmRemoveEntryMsg => 'اس اندراج کو تاریخ سے ہٹائیں؟ اسے واپس نہیں کیا جا سکتا۔';

  @override
  String get itmEditEntry => 'اندراج میں ترمیم کریں';

  @override
  String get itmPrevQty => 'پہلے';

  @override
  String get itmNewQty => 'نیا';

  @override
  String itmCost(String amount) {
    return 'لاگت: $amount';
  }

  @override
  String get itmMore => 'مزید';

  @override
  String get itmMenuPrintLabel => 'لیبل پرنٹ کریں';

  @override
  String get itmMenuDuplicate => 'نقل بنائیں';

  @override
  String get itmMenuPriceHistory => 'قیمت کی تاریخ';

  @override
  String get itmMenuStockHistory => 'اسٹاک درستگی کی تاریخ';

  @override
  String itmLowStockBadge(int count) {
    return '$count کم اسٹاک';
  }

  @override
  String itmStockLine(String qty) {
    return 'اسٹاک: $qty';
  }

  @override
  String get itmOfflineSaved => 'آف لائن — چیز اس ڈیوائس پر محفوظ ہو گئی، آن لائن ہوتے ہی خود سنک ہو جائے گی';

  @override
  String get itmItemName => 'چیز کا نام';

  @override
  String get itmNameRequired => 'نام ضروری ہے';

  @override
  String get itmPricePkr => 'قیمت (PKR)';

  @override
  String get itmPriceRequired => 'قیمت ضروری ہے';

  @override
  String get itmValidNumber => 'درست نمبر درج کریں';

  @override
  String get itmUnit => 'اکائی';

  @override
  String get itmCategoryHint => 'زمرہ (اختیاری، مثلاً پلمبنگ)';

  @override
  String get itmPreferredSupplier => 'پسندیدہ سپلائر (اختیاری)';

  @override
  String get itmPreferredSupplierHelper => 'ایک ٹیپ والے دوبارہ آرڈر میں استعمال ہوتا ہے';

  @override
  String get itmClear => 'صاف کریں';

  @override
  String get itmHsn => 'HSN کوڈ (اختیاری)';

  @override
  String get itmGstRate => 'GST شرح % (اختیاری)';

  @override
  String get itmBarcodeOptional => 'بارکوڈ (اختیاری)';

  @override
  String get itmScanOrType => 'اسکین کریں یا لکھیں';

  @override
  String get itmScanBarcode => 'بارکوڈ اسکین کریں';

  @override
  String get itmPurchaseCost => 'خریداری لاگت (فی اکائی)';

  @override
  String get itmPurchaseCostHint => 'اسٹاک خریدتے وقت آپ کتنا ادا کرتے ہیں';

  @override
  String get itmWholesale => 'تھوک قیمت (اختیاری)';

  @override
  String get itmContractor => 'ٹھیکیدار قیمت (اختیاری)';

  @override
  String get itmFallsBack => 'نہ ہو تو عام قیمت لاگو ہوگی';

  @override
  String get itmStockQty => 'اسٹاک کی مقدار';

  @override
  String get itmLowStockAlert => 'کم اسٹاک کا الرٹ اس سے نیچے';

  @override
  String get itmFrequently => 'اکثر ساتھ خریدی جانے والی';

  @override
  String get itmSaveChanges => 'تبدیلیاں محفوظ کریں';

  @override
  String get itmSaveItem => 'چیز محفوظ کریں';

  @override
  String get itmPhotoSemantics => 'چیز کی تصویر، بدلنے کے لیے ٹیپ کریں';

  @override
  String get cdUpdateStatusTitle => 'ادائیگی کی حالت اپ ڈیٹ کریں';

  @override
  String get cdMarkPaidQ => 'اس بل کو ادا شدہ نشان زد کریں؟';

  @override
  String get cdMarkUnpaidQ => 'اس بل کو غیر ادا شدہ نشان زد کریں؟';

  @override
  String get cdConfirm => 'تصدیق کریں';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'اپ ڈیٹ نہیں ہو سکا: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'آف لائن — تبدیلی اس ڈیوائس پر محفوظ ہو گئی، آن لائن ہوتے ہی خود سنک ہو جائے گی';

  @override
  String get cdConvertTitle => 'بل میں تبدیل کریں';

  @override
  String get cdConvertBody => 'اس سے ان چیزوں کا اسٹاک کم ہو جائے گا اور کوٹیشن اصل بل بن جائے گی۔ جاری رکھیں؟';

  @override
  String get cdConvert => 'تبدیل کریں';

  @override
  String cdCouldNotConvert(String detail) {
    return 'تبدیل نہیں ہو سکا: $detail';
  }

  @override
  String get cdReturnItems => 'چیزیں واپس کریں';

  @override
  String get cdReturnHint => 'ہر چیز کی واپسی کی مقدار مقرر کریں۔ فروخت برقرار رکھنے کے لیے 0 رہنے دیں۔';

  @override
  String get cdDecreaseQty => 'مقدار کم کریں';

  @override
  String get cdIncreaseQty => 'مقدار بڑھائیں';

  @override
  String get cdCreditTotal => 'کریڈٹ کل';

  @override
  String get cdReturnSelected => 'منتخب واپس کریں';

  @override
  String cdCouldNotReturn(String detail) {
    return 'واپس نہیں ہو سکا: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'منسوخ نہیں ہو سکا: $detail';
  }

  @override
  String get cdNoPreviousBill => 'دہرانے کے لیے کوئی پچھلا بل نہیں';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'آخری بل لوڈ نہیں ہو سکا: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'انوائس گاہک کو ای میل کر دی گئی۔';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'انوائس ای میل نہیں ہو سکی: $detail';
  }

  @override
  String get cdStatementEmailed => 'اسٹیٹمنٹ گاہک کو ای میل کر دی گئی۔';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'اسٹیٹمنٹ ای میل نہیں ہو سکی: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'بل حذف کریں';

  @override
  String get cdBillVoided => 'منسوخ';

  @override
  String get cdBillReturn => 'واپسی';

  @override
  String get cdBillQuote => 'کوٹیشن';

  @override
  String get cdBillPaid => 'ادا شدہ';

  @override
  String get cdBillPartial => 'جزوی';

  @override
  String get cdBillUnpaid => 'غیر ادا شدہ';

  @override
  String get cdBill => 'بل';

  @override
  String cdVoidedReason(String reason) {
    return 'منسوخ: $reason';
  }

  @override
  String get cdViewInvoice => 'انوائس دیکھیں';

  @override
  String get cdEmailInvoice => 'انوائس ای میل کریں';

  @override
  String get cdEditBill => 'بل میں ترمیم کریں';

  @override
  String get cdReturnBill => 'بل واپس کریں';

  @override
  String get cdVoidBill => 'بل منسوخ کریں';

  @override
  String get cdNoItems => 'کوئی چیز نہیں';

  @override
  String get cdRepeatLast => 'آخری بل دہرائیں';

  @override
  String get cdLedgerPdf => 'کھاتہ PDF';

  @override
  String get cdEmailStatement => 'اسٹیٹمنٹ ای میل کریں';

  @override
  String get cdCollectPayment => 'ادائیگی وصول کریں';

  @override
  String get cdSendReminder => 'واٹس ایپ یاددہانی بھیجیں';

  @override
  String get cdTotalBilled => 'کل بل شدہ';

  @override
  String get cdPaid => 'ادا شدہ';

  @override
  String get cdNoBills => 'ابھی کوئی بل نہیں';

  @override
  String get cdBillActions => 'بل کے اختیارات';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'کریڈٹ حد کا $limit میں سے $outstanding استعمال ہوا';
  }

  @override
  String get cdVoidBody => 'یہ اسے بیلنس اور رپورٹوں سے ہٹا دے گا مگر تاریخ میں رکھے گا۔ اسٹاک بحال ہو جائے گا۔ یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String get cdReason => 'وجہ (اختیاری)';

  @override
  String get frmOfflineCustomer => 'آف لائن — گاہک اس ڈیوائس پر محفوظ ہو گیا، آن لائن ہوتے ہی خود سنک ہو جائے گا';

  @override
  String get frmOfflineSupplier => 'آف لائن — سپلائر اس ڈیوائس پر محفوظ ہو گیا، آن لائن ہوتے ہی خود سنک ہو جائے گا';

  @override
  String get frmEditCustomer => 'گاہک میں ترمیم کریں';

  @override
  String get frmCustomerName => 'گاہک کا نام';

  @override
  String get frmPhoneOptional => 'فون (اختیاری)';

  @override
  String get frmCreditLimit => 'کریڈٹ حد (PKR، اختیاری)';

  @override
  String get frmCreditHelper => 'اس گاہک کا بیلنس اس سے بڑھنے پر خبردار کریں';

  @override
  String get frmPriceTier => 'قیمت کا درجہ';

  @override
  String get frmRetail => 'پرچون';

  @override
  String get frmWholesale => 'تھوک';

  @override
  String get frmContractor => 'ٹھیکیدار';

  @override
  String get frmPriceTierHelper => 'بل بناتے وقت اس گاہک کے لیے کون سی قیمت پہلے سے بھری جائے';

  @override
  String get frmStrn => 'STRN (اختیاری)';

  @override
  String get frmStrnCustomer => 'انوائس کے لیے 13 ہندسوں کا سیلز ٹیکس رجسٹریشن نمبر';

  @override
  String get frmStrnSupplier => 'خریداری بلوں کے لیے 13 ہندسوں کا سیلز ٹیکس رجسٹریشن نمبر';

  @override
  String get frmAddress => 'پتہ (اختیاری)';

  @override
  String get frmEmail => 'ای میل (اختیاری)';

  @override
  String get frmEmailHelper => 'اس گاہک کو انوائس یا اسٹیٹمنٹ ای میل کرنے کی سہولت';

  @override
  String get frmSaveCustomer => 'گاہک محفوظ کریں';

  @override
  String get frmEditSupplier => 'سپلائر میں ترمیم کریں';

  @override
  String get frmSupplierName => 'سپلائر کا نام';

  @override
  String get frmSaveSupplier => 'سپلائر محفوظ کریں';

  @override
  String get sdDeletePurchaseTitle => 'خریداری حذف کریں';

  @override
  String get sdDeletePurchaseBody => 'اس خریداری کا اسٹاک بحال ہو جائے گا۔ یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String get sdReturnToSupplier => 'سپلائر کو واپس کریں';

  @override
  String get sdReturnHint => 'ہر چیز کی واپس بھیجنے کی مقدار مقرر کریں۔ رکھنے کے لیے 0 رہنے دیں۔';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'موصول شدہ نشان زد نہیں ہو سکا: $detail';
  }

  @override
  String get sdMarkPaidQ => 'اس خریداری کو ادا شدہ نشان زد کریں؟';

  @override
  String get sdMarkUnpaidQ => 'اس خریداری کو غیر ادا شدہ نشان زد کریں؟';

  @override
  String get sdTotalPurchased => 'کل خریداری';

  @override
  String get sdPayable => 'قابلِ ادائیگی';

  @override
  String sdPayableAmount(String amount) {
    return '$amount قابلِ ادائیگی';
  }

  @override
  String get sdNoPurchases => 'ابھی کوئی خریداری نہیں';

  @override
  String get sdPo => 'پی او';

  @override
  String get sdDraftPo => 'مسودہ پی او';

  @override
  String get sdPurchase => 'خریداری';

  @override
  String get sdDraftNote => 'مسودہ خریداری آرڈر — ابھی موصول نہیں ہوا، اسٹاک یا لاگت میں ابھی کوئی تبدیلی نہیں۔';

  @override
  String get sdReturnNote => 'سپلائر کو واپسی / کریڈٹ نوٹ۔';

  @override
  String get sdMarkReceived => 'موصول شدہ نشان زد کریں';

  @override
  String get sdEditPurchase => 'خریداری میں ترمیم کریں';

  @override
  String get sdPurchaseActions => 'خریداری کے اختیارات';

  @override
  String get slDeleteSupplier => 'سپلائر حذف کریں';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر حذف کریں',
      one: '1 سپلائر حذف کریں',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر اور ان کی تمام خریداریاں حذف کریں؟ یہ عمل واپس نہیں ہو سکتا۔',
      one: '1 سپلائر اور اس کی تمام خریداریاں حذف کریں؟ یہ عمل واپس نہیں ہو سکتا۔',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV میں ہیڈر قطار کے علاوہ کم از کم ایک سپلائر ہونا ضروری ہے۔';

  @override
  String get slImportTitle => 'سپلائر درآمد کریں';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" میں $count سپلائر ملے۔ سب درآمد کریں؟',
      one: '\"$file\" میں 1 سپلائر ملا۔ سب درآمد کریں؟',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر درآمد ہو گئے۔',
      one: '1 سپلائر درآمد ہو گیا۔',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'ابھی کوئی سپلائر نہیں۔ شامل کرنے کے لیے + دبائیں۔';

  @override
  String get slSearchHint => 'سپلائر یا فون تلاش کریں...';

  @override
  String get slNoMatch => 'آپ کی تلاش سے کوئی سپلائر نہیں ملا۔';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر',
      one: '1 سپلائر',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'سپلائر کے واجبات';

  @override
  String get sduNothingOwed => 'سپلائرز کو کچھ ادا کرنا باقی نہیں 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائرز کو ادائیگی باقی',
      one: '1 سپلائر کو ادائیگی باقی',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'سب سے پرانی غیر ادا خریداری کو $days دن ہوئے',
      one: 'سب سے پرانی غیر ادا خریداری کو 1 دن ہوا',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 دن';

  @override
  String get duBucket1 => '30–60 دن';

  @override
  String get duBucket2 => '60+ دن';

  @override
  String get duTitle => 'واجبات مرکز';

  @override
  String get duNoDues => 'کوئی واجب الادا رقم نہیں 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گاہکوں کے ذمے واجبات',
      one: '1 گاہک کے ذمے واجبات',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'سب سے پرانے غیر ادا بل کو $days دن ہوئے',
      one: 'سب سے پرانے غیر ادا بل کو 1 دن ہوا',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount واجب الادا';
  }

  @override
  String get cpNoOutstanding => 'اس گاہک کا کوئی واجب الادا بیلنس نہیں';

  @override
  String get cpValidAmount => 'درست رقم درج کریں';

  @override
  String cpExceeds(String amount) {
    return 'رقم واجب الادا بیلنس $amount سے زیادہ ہے';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name سے $amount وصول ہوئے';
  }

  @override
  String get cpOfflineSaved => 'آف لائن — ادائیگی اس ڈیوائس پر محفوظ ہو گئی، آن لائن ہوتے ہی خود سنک ہو جائے گی';

  @override
  String cpOwes(String amount, String name) {
    return '$name کے ذمے $amount ہیں۔ یہ سب سے پرانے غیر ادا بل (بلوں) پر پہلے لاگو ہوں گے۔';
  }

  @override
  String get cpAmountLabel => 'وصول شدہ رقم (PKR)';

  @override
  String get cpCollect => 'وصول کریں';

  @override
  String get usNoItems => 'اپ ڈیٹ کرنے کے لیے کوئی چیز نہیں۔';

  @override
  String get usHelp => 'ہر چیز کا نیا اسٹاک مقرر کریں، پھر سب محفوظ کریں دبائیں۔';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  موجودہ: $qty';
  }

  @override
  String usNew(String qty) {
    return 'نیا: $qty';
  }

  @override
  String get usSubtract => '1 گھٹائیں';

  @override
  String get usAdd => '1 بڑھائیں';

  @override
  String get usNoChanges => 'کوئی تبدیلی نہیں';

  @override
  String usSaveAll(int count) {
    return 'سب محفوظ کریں ($count تبدیل)';
  }

  @override
  String get srHint => 'گاہک، چیزیں، رقوم تلاش کریں...';

  @override
  String get srFailed => 'تلاش ناکام — اپنا کنکشن چیک کریں۔';

  @override
  String get srTitle => 'اپنی دکان میں تلاش کریں';

  @override
  String get srSubtitle => 'گاہکوں کو نام یا فون سے، بلوں کو رقم سے ڈھونڈیں۔';

  @override
  String srNoMatches(String query) {
    return '\"$query\" کے لیے کوئی نتیجہ نہیں';
  }

  @override
  String get srTryDifferent => 'کوئی دوسرا نام، فون نمبر یا رقم آزمائیں۔';

  @override
  String get srBills => 'بل';

  @override
  String get srNoItemList => 'چیزوں کی فہرست نہیں';

  @override
  String get abAddAtLeastOne => 'کم از کم ایک چیز شامل کریں';

  @override
  String get abQuotationUpdated => 'کوٹیشن اپ ڈیٹ ہو گئی!';

  @override
  String get abBillUpdated => 'بل اپ ڈیٹ ہو گیا!';

  @override
  String get abQuotationSaved => 'کوٹیشن محفوظ ہو گئی!';

  @override
  String get abBillCreated => 'بل کامیابی سے بن گیا!';

  @override
  String abTotalAmount(String amount) {
    return 'کل: $amount';
  }

  @override
  String get abShare => 'شیئر کریں';

  @override
  String get abDoneReturn => 'مکمل اور واپس';

  @override
  String get abOverLimitBody => 'اس سے گاہک اپنی کریڈٹ حد سے بڑھ جائے گا۔';

  @override
  String get abOverLimitTitle => 'کریڈٹ حد سے زیادہ';

  @override
  String get abBillAnyway => 'پھر بھی بل بنائیں';

  @override
  String get abOfflineBill => 'آف لائن — بل اس ڈیوائس پر محفوظ ہو گیا، آن لائن ہوتے ہی خود سنک ہو جائے گا';

  @override
  String get abEditQuotation => 'کوٹیشن میں ترمیم کریں';

  @override
  String get abEditBill => 'بل میں ترمیم کریں';

  @override
  String get abNewQuotation => 'نئی کوٹیشن';

  @override
  String get abAddBill => 'بل بنائیں';

  @override
  String get abCouldNotLoadItems => 'چیزیں لوڈ نہیں ہو سکیں۔';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'اس بل سے گاہک کا بیلنس $total ہو جائے گا، جو اس کی $limit کریڈٹ حد سے زیادہ ہے۔';
  }

  @override
  String get abTapAddItemBill => 'بل شروع کرنے کے لیے نیچے \"چیز شامل کریں\" دبائیں';

  @override
  String get abNoCatalog => 'کیٹلاگ میں ابھی کوئی چیز نہیں';

  @override
  String get abScan => 'اسکین';

  @override
  String get abDiscountRs => 'رعایت (روپے)';

  @override
  String get abSubtotal => 'ذیلی کل';

  @override
  String get abTotal => 'کل';

  @override
  String get abSaveAsQuotation => 'کوٹیشن کے طور پر محفوظ کریں';

  @override
  String get abQuotationLocked => 'موجودہ بل کو واپس کوٹیشن نہیں بنایا جا سکتا';

  @override
  String get abQuotationNote => 'بل میں تبدیل ہونے تک اسٹاک کم نہیں ہوگا';

  @override
  String get abPaymentStatus => 'ادائیگی کی حالت';

  @override
  String get abUnpaid => 'غیر ادا شدہ';

  @override
  String get abPaymentMethod => 'ادائیگی کا طریقہ';

  @override
  String get abCash => 'نقد';

  @override
  String get abBankTransfer => 'بینک ٹرانسفر';

  @override
  String get abCheque => 'چیک';

  @override
  String get abSaveQuotation => 'کوٹیشن محفوظ کریں';

  @override
  String get abSaveBill => 'بل محفوظ کریں';

  @override
  String abAdded(String name) {
    return '$name شامل ہو گئی';
  }

  @override
  String get apNewItem => 'نئی چیز…';

  @override
  String get apNewItemHint => 'پہلے کیٹلاگ میں نئی چیز شامل کریں';

  @override
  String get apOfflinePurchase => 'آف لائن — خریداری اس ڈیوائس پر محفوظ ہو گئی، آن لائن ہوتے ہی خود سنک ہو جائے گی';

  @override
  String get apEditPo => 'خریداری آرڈر میں ترمیم کریں';

  @override
  String get apNewPo => 'نیا خریداری آرڈر';

  @override
  String get apAddPurchase => 'خریداری شامل کریں';

  @override
  String get apTapAddItem => 'خریداری شروع کرنے کے لیے نیچے \"چیز شامل کریں\" دبائیں';

  @override
  String get apSaveAsPo => 'خریداری آرڈر کے طور پر محفوظ کریں';

  @override
  String get apPoLocked => 'موصول شدہ خریداری کو واپس مسودہ آرڈر نہیں بنایا جا سکتا';

  @override
  String get apPoNote => 'سامان موصول نشان زد ہونے تک اسٹاک یا لاگت میں کوئی تبدیلی نہیں ہوگی';

  @override
  String get apUnpaidCredit => 'غیر ادا شدہ (ادھار)';

  @override
  String get apSavePo => 'خریداری آرڈر محفوظ کریں';

  @override
  String get apSavePurchase => 'خریداری محفوظ کریں';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'موجودہ لاگت: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'لاگت مقرر نہیں  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'اسکین ناکام: سرور کی خرابی $code';
  }

  @override
  String get scOfflineSaved => 'آف لائن — تصویر محفوظ ہو گئی، آن لائن ہوتے ہی خود پڑھ لی جائے گی';

  @override
  String get scStillOffline => 'ابھی بھی آف لائن';

  @override
  String get scCouldNotCreateCustomer => 'گاہک نہیں بن سکا — دوبارہ کوشش کریں۔';

  @override
  String get scCouldNotCreateSupplier => 'سپلائر نہیں بن سکا — دوبارہ کوشش کریں۔';

  @override
  String scBillSavedFor(String name) {
    return '$name کے لیے بل محفوظ ہو گیا';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name سے خریداری محفوظ ہو گئی';
  }

  @override
  String get scWhichCustomer => 'یہ کون سا گاہک ہے؟';

  @override
  String get scWhichSupplier => 'یہ کون سا سپلائر ہے؟';

  @override
  String scClosestMatch(String name, int score) {
    return 'ریکارڈ میں قریب ترین مماثلت: $name ($score% مشابہ)';
  }

  @override
  String scYesThisIs(String name) {
    return 'ہاں، یہ $name ہے';
  }

  @override
  String get scOtherwiseCustomer => 'ورنہ نیا گاہک بنائیں:';

  @override
  String get scOtherwiseSupplier => 'ورنہ نیا سپلائر بنائیں:';

  @override
  String get scNoMatchCustomer => 'کوئی مماثل گاہک نہیں ملا۔ نیا بنائیں:';

  @override
  String get scNoMatchSupplier => 'کوئی مماثل سپلائر نہیں ملا۔ نیا بنائیں:';

  @override
  String get scCustomerName => 'گاہک کا نام';

  @override
  String get scSupplierName => 'سپلائر کا نام';

  @override
  String get scCreateNew => 'نیا بنائیں';

  @override
  String get scTitleBill => 'بل اسکین کریں';

  @override
  String get scIntroBill => 'بل کی تصویر کھینچیں۔ ہاتھ سے لکھا ہو تو بھی ٹھیک ہے، اور سندھی، اردو یا انگریزی سب چلتی ہیں۔ محفوظ ہونے سے پہلے آپ اسے دیکھ سکیں گے۔';

  @override
  String get scIntroPurchase => 'سپلائر کے انوائس کی تصویر کھینچیں۔ سندھی، اردو یا انگریزی سب چلتی ہیں۔ محفوظ ہونے سے پہلے آپ اسے دیکھ سکیں گے۔';

  @override
  String get scReadingBill => 'بل پڑھا جا رہا ہے…';

  @override
  String get scScanBill => 'بل اسکین کریں';

  @override
  String get scReadingInvoice => 'انوائس پڑھی جا رہی ہے…';

  @override
  String get scScanInvoice => 'انوائس اسکین کریں';

  @override
  String get scQueued => 'قطار میں اسکین';

  @override
  String get scReady => 'جائزے کے لیے تیار';

  @override
  String get scFailed => 'ناکام';

  @override
  String get scWaiting => 'کنکشن کا انتظار';

  @override
  String get scRetry => 'دوبارہ کوشش کریں';

  @override
  String rpCouldNotLoad(String error) {
    return 'رپورٹیں لوڈ نہیں ہو سکیں: $error';
  }

  @override
  String get rpHeadline => 'اس مہینے کے اہم اعداد و شمار';

  @override
  String get rpProfitThisMonth => 'اس مہینے کا منافع';

  @override
  String get rpNoData => 'ابھی کوئی ڈیٹا نہیں';

  @override
  String get rpSalesTax => 'سیلز ٹیکس';

  @override
  String rpSalesTaxFor(String month) {
    return '$month کی سیلز ٹیکس رپورٹ';
  }

  @override
  String get rpViewSalesTax => 'سیلز ٹیکس رپورٹ دیکھیں';

  @override
  String get rpQuickReports => 'فوری رپورٹیں';

  @override
  String get rpQuickSub => 'سیدھے کسی مخصوص رپورٹ پر جائیں';

  @override
  String get expensesTitle => 'اخراجات';

  @override
  String get rpRateCard => 'ریٹ کارڈ';

  @override
  String get rpDetails => 'تفصیلات';

  @override
  String get rpDetailsSub => 'مکمل تفصیل اور درجہ بندی';

  @override
  String get rpOutstandingByCustomer => 'گاہک کے حساب سے واجبات';

  @override
  String get rpNoOutstanding => 'کوئی واجب الادا بیلنس نہیں';

  @override
  String get rpMonthlyTotals => 'ماہانہ کل';

  @override
  String get rpMostSold => 'سب سے زیادہ فروخت ہونے والی چیزیں';

  @override
  String get rpNoItemsRecorded => 'ابھی کوئی چیز درج نہیں';

  @override
  String get rpTopCustomers => 'آمدنی کے لحاظ سے سرفہرست گاہک';

  @override
  String get rpNoSalesRecorded => 'ابھی کوئی فروخت درج نہیں';

  @override
  String get rpTotalOutstanding => 'کل واجبات';

  @override
  String get rpViewCustomers => 'گاہک دیکھیں';

  @override
  String get lblInvoice => 'انوائس';

  @override
  String get lblLedger => 'کھاتہ';

  @override
  String get lblRateCard => 'ریٹ کارڈ';

  @override
  String get exCsvNeedsRows => 'CSV میں ہیڈر قطار کے علاوہ کم از کم ایک خرچہ ہونا ضروری ہے۔';

  @override
  String get exCsvHeader => 'CSV ہیڈر میں \"description\" اور \"amount\" کالم ہونے چاہییں۔';

  @override
  String exLineBadAmount(int line) {
    return 'لائن $line: تفصیل غائب یا رقم غلط — فائل درست کر کے دوبارہ کوشش کریں۔';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'لائن $line: غلط تاریخ \"$date\" — YYYY-MM-DD استعمال کریں۔';
  }

  @override
  String get exImportTitle => 'اخراجات درآمد کریں';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" میں $count خرچے ملے۔ سب درآمد کریں؟',
      one: '\"$file\" میں 1 خرچہ ملا۔ سب درآمد کریں؟',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خرچے درآمد ہو گئے۔',
      one: '1 خرچہ درآمد ہو گیا۔',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'درآمد ناکام: سرور کی خرابی $code';
  }

  @override
  String get exDeleteTitle => 'خرچہ حذف کریں';

  @override
  String get exAdd => 'خرچہ شامل کریں';

  @override
  String get exEdit => 'خرچے میں ترمیم کریں';

  @override
  String get exDescription => 'تفصیل';

  @override
  String get exAmountRs => 'رقم (روپے)';

  @override
  String get exCategory => 'زمرہ';

  @override
  String exDate(String date) {
    return 'تاریخ: $date';
  }

  @override
  String get exRepeats => 'ہر مہینے دہرائیں';

  @override
  String get exRepeatsHint => 'کرایہ، بجلی، اجرت وغیرہ';

  @override
  String get exReceiptTap => 'رسید کی تصویر، بدلنے کے لیے ٹیپ کریں';

  @override
  String get exReceiptOptional => 'رسید کی تصویر (اختیاری)';

  @override
  String get exEnterValid => 'تفصیل اور درست رقم درج کریں۔';

  @override
  String get exOffline => 'آف لائن — خرچہ اس ڈیوائس پر محفوظ ہو گیا، آن لائن ہوتے ہی خود سنک ہو جائے گا';

  @override
  String get exSave => 'خرچہ محفوظ کریں';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'اس مہینے $count بار بار آنے والے خرچے واجب ہیں',
      one: 'اس مہینے 1 بار بار آنے والا خرچہ واجب ہے',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'شامل کریں';

  @override
  String get exTotal => 'کل اخراجات';

  @override
  String exCategoryChip(String name) {
    return 'زمرہ: $name';
  }

  @override
  String get exNoneLogged => 'ابھی کوئی خرچہ درج نہیں';

  @override
  String exNoneInCategory(String name) {
    return 'ابھی $name کا کوئی خرچہ نہیں';
  }

  @override
  String get exViewReceipt => 'رسید دیکھیں';

  @override
  String get exEditRow => 'خرچے میں ترمیم کریں';

  @override
  String get exDeleteRow => 'خرچہ حذف کریں';

  @override
  String gstServerReturned(String first, String second) {
    return 'سرور نے $first/$second واپس کیا';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST ڈیٹا لوڈ نہیں ہو سکا: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'ڈاؤن لوڈ ناکام ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename محفوظ ہو گئی';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'ڈاؤن لوڈز/$filename میں محفوظ ہو گئی';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'ڈاؤن لوڈ نہیں ہو سکا: $error';
  }

  @override
  String get gstTitle => 'سیلز ٹیکس رپورٹ';

  @override
  String get gstOutwardDetail => 'بیرونی فروخت — انوائس کی تفصیل';

  @override
  String get gstNoBills => 'اس مہینے کوئی بل نہیں۔';

  @override
  String get gstHsn => 'HSN خلاصہ';

  @override
  String get gstInvoiceWise => 'انوائس وار تفصیلات';

  @override
  String get gstMonthly => 'ماہانہ خلاصہ';

  @override
  String get gstOutwardTaxable => 'قابلِ ٹیکس بیرونی سپلائیز';

  @override
  String get gstItc => 'ان پٹ ٹیکس کریڈٹ (خریداریوں سے)';

  @override
  String get gstSave => 'محفوظ کریں';

  @override
  String get rcValidAmount => 'درست رقم درج کریں۔';

  @override
  String get rcExpected => 'متوقع نقد (آج کی نقد فروخت)';

  @override
  String get rcAlsoCollected => 'آج وصول بھی ہوا (دراز میں شمار نہیں)';

  @override
  String get rcCounted => 'دراز میں گنی گئی نقد (روپے)';

  @override
  String get rcCompare => 'موازنہ کریں';

  @override
  String get rcMatches => 'بالکل ٹھیک ملتا ہے!';

  @override
  String rcExtra(String amount) {
    return 'دراز میں $amount زیادہ';
  }

  @override
  String rcMissing(String amount) {
    return 'دراز میں $amount کم';
  }

  @override
  String get pbiTitle => 'چیز کے حساب سے منافع';

  @override
  String get pbiNoSales => 'ابھی کوئی فروخت نہیں';

  @override
  String get pbiByCategory => 'زمرے کے حساب سے';

  @override
  String get pbiItemsByProfit => 'منافع کے لحاظ سے چیزیں';

  @override
  String get svTitle => 'اسٹاک کی قدر';

  @override
  String get svNone => 'اسٹاک موجود نہیں';

  @override
  String get svItemsByValue => 'قدر کے لحاظ سے چیزیں';

  @override
  String svSummary(String items, String units) {
    return '$items چیزیں · شیلف پر $units یونٹ';
  }

  @override
  String svTied(String amount) {
    return 'اسٹاک میں $amount لگے ہیں';
  }

  @override
  String get svEstimated => 'فروخت کی قیمت سے اندازہ';

  @override
  String get bkRestoreTitle => 'بیک اپ بحال کریں؟';

  @override
  String bkRestoreBody(String filename) {
    return 'یہ تمام موجودہ ڈیٹا کو بیک اپ فائل \"$filename\" سے بدل دے گا۔ جاری رکھیں؟';
  }

  @override
  String get bkRestore => 'بحال کریں';

  @override
  String get bkRestoreDoneTitle => 'بحالی مکمل';

  @override
  String get bkRestoreDoneBody => 'آپ کا ڈیٹا بحال ہو گیا ہے۔';

  @override
  String get bkOk => 'ٹھیک ہے';

  @override
  String bkRestoreFailed(String detail) {
    return 'بحالی ناکام: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'بحال نہیں ہو سکا: $error';
  }

  @override
  String get bkSaveToDownloads => 'ڈاؤن لوڈز میں محفوظ کریں';

  @override
  String get bkIntroAdmin => 'آپ کا سارا ڈیٹا ایک ڈیٹا بیس فائل میں ہے۔ باقاعدگی سے ایک کاپی ڈاؤن لوڈ کریں، اور کچھ گڑبڑ ہو تو اسے بحال کریں۔';

  @override
  String get bkIntroStaff => 'مکمل ڈیٹا بیس بیک اپ اور بحالی صرف ایڈمن کے لیے ہے۔ ایڈمن سے کہیں، یا جو چاہیے وہ نیچے CSV میں ایکسپورٹ کریں۔';

  @override
  String get bkBackupDb => 'ڈیٹا بیس کا بیک اپ';

  @override
  String get bkBackupDbSub => 'پورا ڈیٹا بیس ایک فائل میں ڈاؤن لوڈ کر کے شیئر کریں (واٹس ایپ، ڈرائیو، ای میل)۔';

  @override
  String get bkDownloadPhone => 'بیک اپ فون میں ڈاؤن لوڈ کریں';

  @override
  String get bkShareBackup => 'بیک اپ شیئر کریں';

  @override
  String get bkAutoTitle => 'خودکار بیک اپ';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سرور پر $count روزانہ بیک اپ محفوظ ہیں، تازہ ترین $time کا۔ یہ خود چلتا ہے — یہاں کچھ کرنے کی ضرورت نہیں۔',
      one: 'سرور پر 1 روزانہ بیک اپ محفوظ ہے، تازہ ترین $time کا۔ یہ خود چلتا ہے — یہاں کچھ کرنے کی ضرورت نہیں۔',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'موجودہ ڈیٹا بدلنے کے لیے محفوظ کردہ بیک اپ فائل چنیں۔';

  @override
  String get bkRestoreFromFile => 'بیک اپ فائل سے بحال کریں';

  @override
  String get bkExportCsv => 'CSV میں ایکسپورٹ کریں';

  @override
  String get bkExportSub => 'انہیں ایکسل میں کھولیں یا شیئر کریں۔';

  @override
  String get bkRangeAll => 'بل/اخراجات: تمام وقت';

  @override
  String bkRangeSome(String end, String start) {
    return 'بل/اخراجات: $start سے $end تک';
  }

  @override
  String get bkSetRange => 'حد مقرر کریں';

  @override
  String get bkClearRange => 'حد ہٹائیں';

  @override
  String get ntNever => 'کبھی نہیں چلا';

  @override
  String get ntJustNow => 'ابھی ابھی';

  @override
  String ntMinutesAgo(int count) {
    return '$count منٹ پہلے';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count گھنٹے پہلے';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count دن پہلے';
  }

  @override
  String get ntTitle => 'سمارٹ اطلاعات';

  @override
  String get ntTapHint => 'اطلاع چلانے اور لائیو نتائج دیکھنے کے لیے \"ابھی چیک کریں\" دبائیں۔';

  @override
  String get ntLowStockSub => 'چیزیں دوبارہ آرڈر کی سطح سے نیچے جائیں تو اطلاع دیں۔';

  @override
  String get ntCheckNow => 'ابھی چیک کریں';

  @override
  String get ntOverdue => 'واجب الادا ادائیگی کی یاددہانیاں';

  @override
  String get ntOverdueSub => 'پچھلے دنوں کے غیر ادا بلوں کی اطلاع دیں۔';

  @override
  String get ntDaily => 'روزانہ کاروباری خلاصہ';

  @override
  String get ntDailySub => 'کل کی فروخت، وصولیاں اور منافع ایک نظر میں۔';

  @override
  String get ntSendSummary => 'خلاصہ بھیجیں';

  @override
  String get ntRunning => 'چل رہا ہے…';

  @override
  String get ntLowStockItems => 'کم اسٹاک والی چیزیں';

  @override
  String get ntSales => 'فروخت';

  @override
  String get ntCollected => 'وصول شدہ';

  @override
  String get ntProfit => 'منافع';

  @override
  String get auChecking => 'اپ ڈیٹس چیک ہو رہی ہیں…';

  @override
  String get auLatest => 'آپ کے پاس تازہ ترین ورژن ہے۔';

  @override
  String get auAvailable => 'اپ ڈیٹ دستیاب ہے';

  @override
  String auNewer(int code) {
    return 'Book-Keep کا نیا ورژن (بلڈ $code) تیار ہے۔';
  }

  @override
  String get auLater => 'بعد میں';

  @override
  String get auUpdate => 'اپ ڈیٹ کریں';

  @override
  String get auDownloading => 'اپ ڈیٹ ڈاؤن لوڈ ہو رہی ہے';

  @override
  String auSaved(String name) {
    return '$name آپ کے ڈاؤن لوڈز فولڈر میں محفوظ ہو گئی۔';
  }

  @override
  String get auAllowInstall => 'Book-Keep کو ایپس انسٹال کرنے کی اجازت دیں، پھر دوبارہ اپ ڈیٹ دبائیں۔';

  @override
  String get auFailed => 'اپ ڈیٹ نہیں ہو سکی — اپنا کنکشن چیک کر کے دوبارہ کوشش کریں۔';

  @override
  String get lgSearch => 'زبانیں تلاش کریں';

  @override
  String lgNoMatch(String query) {
    return '\"$query\" سے کوئی زبان نہیں ملتی';
  }

  @override
  String get alVoided => 'بل منسوخ کیا';

  @override
  String get alDeletedBill => 'بل حذف کیا';

  @override
  String get alReturned => 'بل واپس کیا';

  @override
  String get alDeletedCustomer => 'گاہک حذف کیا';

  @override
  String get alDeletedSupplier => 'سپلائر حذف کیا';

  @override
  String get alCreatedAccount => 'اکاؤنٹ بنایا';

  @override
  String get alUpdatedAccount => 'اکاؤنٹ اپ ڈیٹ کیا';

  @override
  String get alDeletedAccount => 'اکاؤنٹ حذف کیا';

  @override
  String get alTitle => 'سرگرمی کا ریکارڈ';

  @override
  String get alNone => 'ابھی کوئی سرگرمی درج نہیں';

  @override
  String get blkEnterOne => 'کم از کم ایک چیز درج کریں';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count چیزیں کامیابی سے شامل ہو گئیں',
      one: '1 چیز کامیابی سے شامل ہو گئی',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'ایک ساتھ چیزیں شامل کریں';

  @override
  String get blkFormat => 'ہر لائن میں ایک چیز، ترتیب: نام، قیمت، اکائی، زمرہ';

  @override
  String get blkOptional => 'اکائی اور زمرہ اختیاری ہیں (ڈیفالٹ: piece، کوئی نہیں)';

  @override
  String get blkAddAll => 'تمام چیزیں شامل کریں';

  @override
  String get prSend => 'ادائیگی کی یاددہانی بھیجیں';

  @override
  String get prTone => 'لہجہ چنیں:';

  @override
  String get prPolite => 'شائستہ';

  @override
  String get prStandard => 'معیاری';

  @override
  String get prUrgent => 'فوری';

  @override
  String get prPreviewQr => 'جاز کیش ادائیگی QR کا پیش منظر';

  @override
  String get prShareText => 'متن شیئر کریں';

  @override
  String get dsRemaining => 'باقی';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount رعایت شامل ہے';
  }

  @override
  String get dsItems => 'چیزیں';

  @override
  String get dsDiscount => 'رعایت';

  @override
  String get lkWrongPin => 'غلط PIN';

  @override
  String get lkEnterPin => 'PIN درج کریں';

  @override
  String get lkChecking => 'فنگر پرنٹ چیک ہو رہا ہے...';

  @override
  String get bcTitle => 'بارکوڈ اسکین کریں';

  @override
  String get bcTorchNa => 'اس ڈیوائس پر ٹارچ دستیاب نہیں';

  @override
  String get bcTorch => 'ٹارچ';

  @override
  String get bcPoint => 'کیمرہ بارکوڈ کی طرف کریں';

  @override
  String get qrNoNumber => 'کوئی جاز کیش نمبر مقرر نہیں۔ ادائیگی کا QR دکھانے کے لیے اسے سیٹنگز میں مقرر کریں۔';

  @override
  String get qrPay => 'جاز کیش سے ادائیگی کریں';

  @override
  String get qrInvalid => 'غلط QR ڈیٹا';

  @override
  String qrAmount(String amount) {
    return 'رقم: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'جاز کیش: $number';
  }

  @override
  String get qrCopy => 'جاز کیش نمبر کاپی کریں';

  @override
  String get qrCopied => 'جاز کیش نمبر کلپ بورڈ میں کاپی ہو گیا';

  @override
  String get qrHint => 'ادائیگی کے لیے یہ نمبر اپنی جاز کیش ایپ میں اسکین یا کاپی کریں۔';

  @override
  String clOwed(String amount) {
    return '$amount واجب الادا';
  }

  @override
  String get lnEnterEmailFirst => 'پہلے اوپر درست ای میل درج کریں۔';

  @override
  String get lnResetSent => 'پاس ورڈ ری سیٹ کی ای میل بھیج دی گئی — اپنا ان باکس دیکھیں۔';

  @override
  String get lnNoAccount => 'اس ای میل کا کوئی اکاؤنٹ نہیں ملا۔';

  @override
  String get lnWrongPassword => 'پاس ورڈ غلط ہے۔';

  @override
  String get lnInvalidEmail => 'یہ درست ای میل پتہ نہیں لگتا۔';

  @override
  String get lnDisabled => 'یہ اکاؤنٹ بند کر دیا گیا ہے۔';

  @override
  String get lnTooMany => 'بہت زیادہ کوششیں — ایک منٹ بعد دوبارہ کوشش کریں۔';

  @override
  String get lnNoInternet => 'انٹرنیٹ کنکشن نہیں ہے۔';

  @override
  String get lnWeakPassword => 'پاس ورڈ کم از کم 6 حروف کا ہونا چاہیے۔';

  @override
  String get lnCouldNotSignIn => 'سائن اِن نہیں ہو سکا۔ براہِ کرم دوبارہ کوشش کریں۔';

  @override
  String get lnWrongPasswordHint => 'پاس ورڈ غلط ہے۔ دوبارہ کوشش کریں یا \"پاس ورڈ بھول گئے؟\" دبائیں۔';

  @override
  String get lnWrongEmail => 'ای میل غلط ہے — اس پتے کا کوئی اکاؤنٹ نہیں۔';

  @override
  String get lnWrongEmailOrPassword => 'ای میل یا پاس ورڈ غلط ہے۔';

  @override
  String get lnWrongUsername => 'صارف نام غلط ہے — اس نام کا کوئی اکاؤنٹ نہیں۔';

  @override
  String get lnWelcome => 'خوش آمدید';

  @override
  String lnSignInTo(String app) {
    return '$app میں سائن اِن کریں';
  }

  @override
  String get lnEmailOrUsername => 'ای میل یا صارف نام';

  @override
  String get lnRemember => 'مجھے یاد رکھیں';

  @override
  String get lnForgot => 'پاس ورڈ بھول گئے؟';

  @override
  String get lnSignIn => 'سائن اِن';

  @override
  String get lnGoogle => 'Google کے ساتھ جاری رکھیں';

  @override
  String get lnNew => 'نئے ہیں؟';

  @override
  String get lnCreate => 'اکاؤنٹ بنائیں';

  @override
  String suCreated(String email) {
    return '$email کے لیے اکاؤنٹ بن گیا۔ تصدیقی ای میل بھیج دی گئی ہے (اختیاری)۔';
  }

  @override
  String suSetup(String app) {
    return '$app ترتیب دیں';
  }

  @override
  String get suName => 'نام';

  @override
  String get suEmail => 'ای میل';

  @override
  String suPhoneDigits(int digits) {
    return 'درست $digits ہندسوں کا نمبر درج کریں';
  }

  @override
  String get suCreateBtn => 'اکاؤنٹ بنائیں';

  @override
  String get suHaveAccount => 'پہلے سے اکاؤنٹ ہے؟';

  @override
  String get suAlreadyExists => 'اس ای میل کا اکاؤنٹ پہلے سے موجود ہے۔';

  @override
  String get suInvalidEmail => 'ای میل پتہ درست نہیں۔';

  @override
  String get agShow => 'پاس ورڈ دکھائیں';

  @override
  String get agHide => 'پاس ورڈ چھپائیں';

  @override
  String get adAccounts => 'اکاؤنٹس';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رجسٹرڈ اکاؤنٹس',
      one: '1 رجسٹرڈ اکاؤنٹ',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'شامل کریں';

  @override
  String get adNoAccounts => 'کوئی اکاؤنٹ نہیں ملا۔';

  @override
  String get adAccountability => 'جوابدہی';

  @override
  String get adAccountabilitySub => 'کس نے کیا منسوخ، حذف یا واپس کیا، اور اکاؤنٹ کی تبدیلیاں۔';

  @override
  String get adActivitySub => 'منسوخ بل، حذف اور اکاؤنٹ کی تبدیلیاں';

  @override
  String get adServer => 'سرور';

  @override
  String get adServerSub => 'یہ ایپ کس سے بات کرتی ہے۔ سیٹ اپ کے بعد شاذ ہی بدلنے کی ضرورت پڑتی ہے۔';

  @override
  String get adServerHint => 'ایمولیٹر 10.0.2.2 استعمال کرتا ہے؛ اصلی فون کو اسی وائی فائی پر لیپ ٹاپ کا IP چاہیے۔ اسے بدلنے کا اثر ہر اکاؤنٹ پر پڑتا ہے۔';

  @override
  String get adApiBase => 'API بنیادی URL';

  @override
  String get adSaveServer => 'سرور کا پتہ محفوظ کریں';

  @override
  String get adEmailSetSub => 'ترتیب شدہ — عملہ گاہکوں کو انوائس/اسٹیٹمنٹ ای میل کر سکتا ہے۔';

  @override
  String get adNotSetUp => 'ابھی ترتیب نہیں دی گئی۔';

  @override
  String get adEmailSetBody => 'ای میل ترتیب شدہ ہے۔ عملہ سیدھا گاہک کو انوائس یا اسٹیٹمنٹ ای میل کر سکتا ہے۔';

  @override
  String get adEmailHelp => 'Gmail پتہ ایپ پاس ورڈ کے ساتھ چلتا ہے (smtp.gmail.com، پورٹ 587)، یا اپنے ای میل فراہم کنندہ کی SMTP تفصیلات استعمال کریں۔';

  @override
  String get adSmtpHost => 'SMTP ہوسٹ';

  @override
  String get adSmtpPort => 'SMTP پورٹ';

  @override
  String get adEmailAddress => 'ای میل پتہ';

  @override
  String get adPwKeep => 'پاس ورڈ (موجودہ رکھنے کے لیے خالی چھوڑیں)';

  @override
  String get adPwApp => 'پاس ورڈ (ایپ پاس ورڈ، لاگ اِن پاس ورڈ نہیں)';

  @override
  String get adFromName => 'بھیجنے والے کا نام (اختیاری)';

  @override
  String get adFromHint => 'میری ہارڈویئر دکان';

  @override
  String get adSaving => 'محفوظ ہو رہا ہے...';

  @override
  String get adSaveEmail => 'ای میل سیٹنگز محفوظ کریں';

  @override
  String get adAddAccount => 'اکاؤنٹ شامل کریں';

  @override
  String get adNameOpt => 'نام (اختیاری)';

  @override
  String get adAtLeast6 => 'کم از کم 6 حروف';

  @override
  String get adGrantAdmin => 'ایڈمن بنائیں';

  @override
  String get adCanManage => 'منسوخ/حذف/واپس کر سکتا ہے';

  @override
  String get adCanManageHint => 'بل منسوخ یا حذف کرنا، بل واپس کرنا، یا گاہک/سپلائر حذف کرنا۔ ایڈمن کے پاس یہ ہمیشہ ہوتا ہے۔';

  @override
  String get adCreate => 'بنائیں';

  @override
  String get adAccountCreated => 'اکاؤنٹ بن گیا۔';

  @override
  String adCreateFailed(String error) {
    return 'بنانا ناکام: $error';
  }

  @override
  String get adEditAccount => 'اکاؤنٹ میں ترمیم کریں';

  @override
  String get adAdminSwitch => 'ایڈمن';

  @override
  String get adAdminHint => 'ایڈمن پینل کھول سکتا ہے';

  @override
  String get adDisabled => 'بند';

  @override
  String get adDisabledHint => 'سائن اِن سے روکا گیا';

  @override
  String get adAccountUpdated => 'اکاؤنٹ اپ ڈیٹ ہو گیا۔';

  @override
  String adUpdateFailed(String error) {
    return 'اپ ڈیٹ ناکام: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label ہمیشہ کے لیے ہٹا دیا جائے گا اور مزید سائن اِن نہیں کر سکے گا۔';
  }

  @override
  String get adAccountDeleted => 'اکاؤنٹ حذف ہو گیا۔';

  @override
  String adDeleteFailed(String error) {
    return 'حذف ناکام: $error';
  }

  @override
  String get adBadgeAdmin => 'ایڈمن';

  @override
  String get adBadgeDisabled => 'بند';

  @override
  String get adOff => 'ایڈمن پینل بند ہے';

  @override
  String get adCheckAgain => 'دوبارہ چیک کریں';

  @override
  String get adAccessRequired => 'ایڈمن رسائی ضروری ہے';

  @override
  String get adAccessBody => 'صرف دکان کے ایڈمن اکاؤنٹس کا انتظام کر سکتے ہیں۔ دکان کے مالک سے ایڈمن رسائی مانگیں۔';

  @override
  String get adCouldNotLoad => 'ایڈمن پینل لوڈ نہیں ہو سکا۔';

  @override
  String get adBadPort => 'درست SMTP پورٹ نمبر درج کریں۔';

  @override
  String get adEmailSaved => 'ای میل سیٹنگز محفوظ ہو گئیں۔';

  @override
  String adEmailSaveFailed(String error) {
    return 'ای میل سیٹنگز محفوظ نہیں ہو سکیں: $error';
  }

  @override
  String get adServerEmpty => 'سرور کا پتہ خالی نہیں ہو سکتا۔';

  @override
  String get adServerSaved => 'سرور کا پتہ محفوظ ہو گیا۔ اسکرینیں اگلی لوڈنگ پر اسے استعمال کریں گی۔';

  @override
  String get lnOr => 'یا';

  @override
  String get scNotABill => 'یہ بل نہیں لگتا۔ بل کی صاف تصویر کے ساتھ دوبارہ کوشش کریں۔';

  @override
  String get scNotAnInvoice => 'یہ انوائس نہیں لگتی۔ سپلائر کے انوائس کی صاف تصویر کے ساتھ دوبارہ کوشش کریں۔';

  @override
  String get jqOpenFull => 'بڑا کریں';

  @override
  String get jqCopy => 'نمبر کاپی کریں';

  @override
  String get jqSheetTitle => 'جاز کیش QR';

  @override
  String get jqSheetHint => 'گاہک ادائیگی کے لیے اسے اپنی جاز کیش ایپ میں اسکین کرتے ہیں۔';

  @override
  String get jqCheck => 'نمبر دوبارہ دیکھیں';

  @override
  String get askVoice => 'آواز';

  @override
  String get askVoiceFallbackNote => 'یہ آپ کے فون کی آواز میں پڑھا جا رہا ہے۔';

  @override
  String get askPace => 'رفتار';

  @override
  String get askTone => 'لہجہ';

  @override
  String get askPaceSlower => 'آہستہ';

  @override
  String get askPaceNormal => 'عام';

  @override
  String get askPaceFaster => 'تیز';

  @override
  String get askToneCalm => 'پرسکون';

  @override
  String get askToneWarm => 'گرم جوش';

  @override
  String get askToneCheerful => 'خوش مزاج';

  @override
  String qPaymentUpdate(String amount) {
    return 'ادائیگی کی تازہ کاری: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'گاہک: $name';
  }

  @override
  String qSupplier(String name) {
    return 'سپلائر: $name';
  }

  @override
  String qItem(String name) {
    return 'شے: $name';
  }

  @override
  String qExpense(String name) {
    return 'خرچ: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'خریداری: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$name سے ادائیگی وصول ہوئی: $amount';
  }

  @override
  String gstAmount(String amount) {
    return 'ٹیکس $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'قابلِ ٹیکس $taxable  ·  ٹیکس $tax  ·  کل $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'آمدنی: $revenue  •  مال کی لاگت: $cogs  •  اخراجات: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'السلام علیکم $customer، $shop کی طرف سے آداب! آپ کا کل واجب الادا بقایا $amount ہے۔ شکریہ!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'السلام علیکم $customer، $shop کی طرف سے $amount کے بقایا کی ادائیگی کی یاد دہانی۔ براہِ کرم جلد از جلد ادا کر دیں۔';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'فوری اطلاع: محترم $customer، $shop میں آپ کے $amount کے بقایا کی ادائیگی باقی ہے۔ براہِ کرم فوراً ادا کریں۔';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'جاز کیش کے ذریعے ادائیگی کریں: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop کی طرف سے بل\nکل: $total\nاشیاء: $items\nحالت: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'السلام علیکم $supplier، میں $shop سے بول رہا ہوں۔ ہم درج ذیل اشیاء کا آرڈر دینا چاہتے ہیں:\n$lines\n\nبراہِ کرم دستیابی اور قیمت کی تصدیق کریں۔ شکریہ۔';
  }

  @override
  String ppUpdated(String date) {
    return 'آخری تازہ کاری: $date';
  }

  @override
  String get ppWhoH => 'ہم کون ہیں';

  @override
  String ppWho(String owner, String email) {
    return '$owner، جو Book-keep چلاتا ہے۔\nرابطہ: $email';
  }

  @override
  String get ppCollectH => 'ہم کیا جمع کرتے ہیں';

  @override
  String get ppCollectAccount => 'اکاؤنٹ: ای میل، فون نمبر اور صارف نام، Firebase Authentication کے ذریعے۔';

  @override
  String get ppCollectShop => 'دکان کا پروفائل: دکان کا نام، پتہ، فون نمبر، JazzCash نمبر اور دکان کا لوگو، جو دکان کا مالک سیٹنگز میں درج کرتا ہے۔';

  @override
  String get ppCollectRecords => 'کاروباری ریکارڈ جو آپ بناتے ہیں: گاہکوں اور سپلائرز کے نام اور فون نمبر، بل، خریداریاں، اشیاء کی فہرست (بشمول اشیاء کی تصاویر اور بارکوڈ) اور اخراجات (بشمول رسیدوں کی تصاویر)۔ یہ ایپ کا بنیادی ڈیٹا ہے — حساب کتاب اسی طرح چلتا ہے۔';

  @override
  String get ppCollectDevice => 'آلے اور تشخیصی ڈیٹا: پش نوٹیفکیشن ٹوکن (کم اسٹاک، واجب الادا ادائیگیوں اور روزانہ خلاصے کے الرٹس کے لیے) اور کریش رپورٹس (آلے کی معلومات اور اسٹیک ٹریس) Firebase Crashlytics کے ذریعے، جو ایپ کریش ہونے پر خود بخود بھیجی جاتی ہیں۔';

  @override
  String ppCollectAi(String askShop) {
    return 'اے آئی خصوصیات: $askShop، اے آئی صبح کا خلاصہ اور اے آئی بل/خریداری اسکینر متعلقہ کاروباری ڈیٹا کا ایک نمونہ (رپورٹ کے اعداد یا بل کی تصویر) Google کے Gemini API کو بھیجتے ہیں تاکہ جواب، خلاصہ یا نکالی گئی لائنیں بن سکیں۔ یہ ڈیٹا Google جواب بنانے کے لیے پروسیس کرتا ہے؛ ہم اور Google اسے Google کی معیاری API شرائط سے باہر ماڈلز کی تربیت کے لیے استعمال نہیں کرتے۔';
  }

  @override
  String get ppDontH => 'ہم کیا نہیں کرتے';

  @override
  String get ppDontLocation => 'ہم آپ کی لوکیشن ٹریک نہیں کرتے۔';

  @override
  String get ppDontAds => 'ہم اشتہاری نیٹ ورکس یا رویّے کے تجزیے/سیشن ریکارڈنگ کے ٹولز استعمال نہیں کرتے۔';

  @override
  String get ppDontSell => 'ہم آپ کا ڈیٹا یا آپ کے گاہکوں کا ڈیٹا کسی کو نہیں بیچتے۔';

  @override
  String get ppWhereH => 'ڈیٹا کہاں رہتا ہے';

  @override
  String get ppWhereDb => 'ڈیٹابیس: Neon (Postgres)، ایک تیسرے فریق کی کلاؤڈ ڈیٹابیس فراہم کنندہ۔';

  @override
  String get ppWhereFirebase => 'تصدیق، پش نوٹیفکیشن، کریش رپورٹس، تصاویر کا ذخیرہ: Firebase (Google)۔';

  @override
  String get ppWhereAi => 'اے آئی پروسیسنگ: Google Gemini API۔';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'انوائس ای میلز: اس SMTP اکاؤنٹ کے ذریعے بھیجی جاتی ہیں جو آپ کی دکان کا ایڈمن $adminPanel میں ترتیب دیتا ہے۔ ہمارے پاس کوئی میلنگ لسٹ نہیں؛ یہ ای میلز آپ کے اپنے گاہکوں کو انفرادی بل/اسٹیٹمنٹس ہیں، بڑے پیمانے کی مارکیٹنگ نہیں۔';
  }

  @override
  String get ppYoursH => 'آپ کا ڈیٹا، آپ کے گاہکوں کا ڈیٹا';

  @override
  String get ppYours => 'آپ جو کچھ درج کرتے ہیں — گاہک، سپلائرز، بل، اشیاء — آپ کی دکان کی ملکیت ہے۔ Book-keep استعمال کرنے والی دوسری دکانیں اسے نہیں دیکھ سکتیں۔ آپ کے بنائے ہوئے اسٹاف اکاؤنٹس صرف وہی دیکھتے ہیں جس کی آپ انہیں رسائی دیں۔';

  @override
  String get ppControlsH => 'آپ کے اختیارات';

  @override
  String ppControlExport(String path) {
    return 'اپنا ڈیٹا ایکسپورٹ یا بیک اپ کریں: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'اپنا اکاؤنٹ حذف کریں: $path۔ اس سے صرف آپ کی سائن اِن اسناد ہٹتی ہیں؛ آپ کی دکان کا کاروباری ریکارڈ (بل، گاہک، اشیاء وغیرہ) نہیں مٹتا، جیسے کسی اسٹاف ممبر کو ہٹانے سے اس کا بنایا ہوا ریکارڈ نہیں مٹتا۔';
  }

  @override
  String ppControlNotif(String path) {
    return 'نوٹیفکیشنز: $path میں قسم کے لحاظ سے بند کیے جا سکتے ہیں۔';
  }

  @override
  String get ppChildrenH => 'بچے';

  @override
  String get ppChildren => 'Book-keep دکان مالکان اور عملے کے لیے ایک کاروباری ٹول ہے۔ یہ بچوں کے لیے نہیں ہے اور نہ ہی بچے اسے جان بوجھ کر استعمال کرتے ہیں۔';

  @override
  String get ppChangesH => 'اس پالیسی میں تبدیلیاں';

  @override
  String get ppChanges => 'اگر ہم جو جمع کرتے ہیں یا وہ جہاں جاتا ہے بدل جائے تو ہم اس صفحے کو اپ ڈیٹ کریں گے اور اوپر کی تاریخ بدل دیں گے۔';

  @override
  String get ppContactH => 'رابطہ';

  @override
  String ppContact(String email) {
    return 'اس پالیسی یا آپ کے ڈیٹا کے بارے میں سوالات: $email';
  }

  @override
  String get waHello => 'السلام علیکم!';

  @override
  String waHelloNamed(String name) {
    return 'السلام علیکم $name،';
  }

  @override
  String get gstTaxable => 'قابلِ ٹیکس';

  @override
  String get gstTax => 'ٹیکس';

  @override
  String get gstTaxableValue => 'قابلِ ٹیکس مالیت';

  @override
  String get gstTotalTax => 'کل ٹیکس';

  @override
  String get gstTotalItc => 'کل ان پٹ ٹیکس کریڈٹ';

  @override
  String get gstExempt => 'مستثنیٰ فروخت';

  @override
  String get gstNetPayable => 'قابلِ ادائیگی خالص ٹیکس';

  @override
  String get unknownName => 'نامعلوم';

  @override
  String get unitPiece => 'عدد';

  @override
  String get unitKg => 'کلو';

  @override
  String get unitMeter => 'میٹر';

  @override
  String get unitBox => 'ڈبہ';

  @override
  String get unitDozen => 'درجن';

  @override
  String get unitLiter => 'لیٹر';

  @override
  String get unitBag => 'بوری';

  @override
  String deleteSupplierMessage(String name) {
    return '$name اور اس کی تمام خریداریاں حذف کریں؟ یہ عمل واپس نہیں ہو سکتا۔';
  }
}
