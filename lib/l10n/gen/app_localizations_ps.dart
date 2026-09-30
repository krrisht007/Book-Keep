// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Pushto Pashto (`ps`).
class AppLocalizationsPs extends AppLocalizations {
  AppLocalizationsPs([String locale = 'ps']) : super(locale);

  @override
  String get navHome => 'کور';

  @override
  String get navCustomers => 'پیرودونکي';

  @override
  String get navItems => 'توکي';

  @override
  String get navSuppliers => 'عرضه کوونکي';

  @override
  String get navReports => 'راپورونه';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String get settingsShopDetailsTitle => 'د دوکان توضیحات';

  @override
  String get settingsShopDetailsSubtitle => 'ستاسو په رسیدونو کې ښودل کیږي.';

  @override
  String get settingsShopNameLabel => 'د دوکان نوم';

  @override
  String get settingsShopAddressLabel => 'د دوکان پته';

  @override
  String get settingsPhoneLabel => 'تلیفون';

  @override
  String get settingsSaveShopDetails => 'د دوکان توضیحات خوندي کړئ';

  @override
  String get settingsAppearanceTitle => 'بڼه';

  @override
  String get settingsAppearanceSubtitle => 'د ټول اپلیکیشن لپاره یو موضوع وټاکئ.';

  @override
  String get themeLight => 'روښانه';

  @override
  String get themeDark => 'تیاره';

  @override
  String get themeSystem => 'سیسټم';

  @override
  String get settingsLanguageTitle => 'ژبه';

  @override
  String get settingsLanguageSubtitle => 'د اپلیکیشن ښودلو ژبه وټاکئ.';

  @override
  String get sortNameNewest => 'ترتیب: نوم / نوی';

  @override
  String get addCustomer => 'پیرودونکی اضافه کړئ';

  @override
  String get importCsv => 'CSV راوړئ';

  @override
  String get searchShop => 'په دوکان کې لټون';

  @override
  String get scanToFindItem => 'د توکي موندلو لپاره سکین کړئ';

  @override
  String get bulkAdd => 'په ډله ییز ډول اضافه کړئ';

  @override
  String get updateStock => 'ذخیره تازه کړئ';

  @override
  String get printLabels => 'لیبلونه چاپ کړئ';

  @override
  String get mergeDuplicates => 'دوه ګوني یو ځای کړئ';

  @override
  String get addSupplier => 'عرضه کوونکی اضافه کړئ';

  @override
  String get scanPurchaseInvoice => 'د پیرود بل سکین کړئ';

  @override
  String askNoAnswer(String reason) {
    return 'ځواب ترلاسه نه شو: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'اړیکه ونه شوه: $error';
  }

  @override
  String get micPermissionNeeded => 'د غږ لپاره د مایکروفون اجازه اړینه ده.';

  @override
  String get speechUnavailable => 'په دې وسیله کې د غږ پېژندنه شتون نه لري.';

  @override
  String get askYourShop => 'له خپل دوکان وپوښتئ';

  @override
  String get close => 'بندول';

  @override
  String get askIntro => 'غواړئ پوه شئ دوکان څنګه روان دی؟ له ما وپوښتئ، ستاسو د کتابچې له معلوماتو به ځواب درکړم.';

  @override
  String get askListening => 'اوري…';

  @override
  String get askThinkingWords => 'فکر کوي…|کار روان دی…|حساب کوي…|کتابونه ګوري…|جمع کوي…|شمېرې ګوري…';

  @override
  String get askSayQuestion => 'خپله پوښتنه ووایاست — د لغوه کولو لپاره ګولۍ ټک کړئ';

  @override
  String briefingRefreshFailed(int code) {
    return 'لنډیز تازه نه شو ($code).';
  }

  @override
  String get refreshFailedOffline => 'تازه نه شو — خپله اړیکه وګورئ.';

  @override
  String get newBillFailed => 'نوی بل پیل نه شو — اړیکه وګورئ او بیا هڅه وکړئ.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'لومړی د $name لپاره غوره عرضه کوونکی وټاکئ (د سمون لپاره ټک کړئ).';
  }

  @override
  String get reorderBySupplier => 'د عرضه کوونکي له مخې بیا فرمایش';

  @override
  String get supplier => 'عرضه کوونکی';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توکي',
      one: '1 توکی',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'د کم ذخیرې هیڅ توکي لپاره غوره عرضه کوونکی نه دی ټاکل شوی.';

  @override
  String get thisSupplier => 'دا عرضه کوونکی';

  @override
  String supplierNoPhone(String name) {
    return 'د $name د تلیفون شمېره نه ده ثبت شوې.';
  }

  @override
  String get tabOverview => 'لنډه کتنه';

  @override
  String get tabStock => 'ذخیره';

  @override
  String get tabMoney => 'پیسې';

  @override
  String get taglineOverview => 'د نن ورځې پورونه، ذخیره او نغدې په یوه نظر کې.';

  @override
  String get taglineStock => 'څه پلورل کېږي، څه کمېږي.';

  @override
  String get taglineMoney => 'لګښتونه، سمون او راټولونه.';

  @override
  String loadingDashboard(int done, int total) {
    return 'ډشبورډ پورته کېږي… له $total څخه $done';
  }

  @override
  String get dashboardLoadFailed => 'ډشبورډ پورته نه شو';

  @override
  String get checkConnectionRetry => 'خپله اړیکه وګورئ او بیا هڅه وکړئ.';

  @override
  String get retry => 'بیا هڅه';

  @override
  String get aiBriefing => 'AI لنډیز';

  @override
  String get briefingPrompt => 'د پرون کاروبار په څو جملو کې وګورئ.';

  @override
  String get getBriefing => 'لنډیز ترلاسه کړئ';

  @override
  String get refreshBriefing => 'لنډیز تازه کړئ';

  @override
  String updatedAt(String time) {
    return 'تازه شو $time';
  }

  @override
  String get customersUnknown => '— پیرودونکي';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پیرودونکي',
      one: '1 پیرودونکی',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'تېره میاشت';

  @override
  String get nextMonth => 'راتلونکې میاشت';

  @override
  String get salesMonth => 'پلور (میاشت)';

  @override
  String get outstanding => 'پاتې پور';

  @override
  String get profitMonth => 'ګټه (میاشت)';

  @override
  String get cashToday => 'د نن نغدې';

  @override
  String get newBill => 'نوی بل';

  @override
  String get scanHandwrittenBill => 'په لاس لیکلی بل سکین کړئ';

  @override
  String get topOutstanding => 'تر ټولو لوړ پورونه';

  @override
  String viewAllInDues(int count) {
    return 'په پورونو مرکز کې ټول $count وګورئ';
  }

  @override
  String get lowStockAlerts => 'د کمې ذخیرې خبرتیاوې';

  @override
  String get noLowStock => 'هیڅ توکی کمه ذخیره نه لري — ذخیره سمه ده.';

  @override
  String get whatsappAll => 'ټولو ته WhatsApp';

  @override
  String get reorderAll => 'ټول بیا فرمایش کړئ';

  @override
  String suggestReorder(String qty, String unit) {
    return 'وړاندیز: $qty $unit بیا فرمایش کړئ';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit پاتې';
  }

  @override
  String get reorder => 'بیا فرمایش';

  @override
  String get whatsappSupplier => 'عرضه کوونکي ته WhatsApp';

  @override
  String get topItemsByRevenue => 'د عاید له مخې غوره توکي';

  @override
  String get noSalesYet => 'تر اوسه هیڅ پلور نه دی ثبت شوی.';

  @override
  String qtyLabel(String qty) {
    return 'مقدار: $qty';
  }

  @override
  String get monthExpenses => 'د دې میاشتې لګښتونه';

  @override
  String get noExpensesMonth => 'پدې میاشت کې هیڅ لګښت نه دی ثبت شوی.';

  @override
  String get quickActions => 'چټک کارونه';

  @override
  String get dailyCashReconciliation => 'د ورځنیو نغدو سمون';

  @override
  String get collectMoney => 'پیسې راټولې کړئ';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count بدلونونه آفلاین خوندي شول',
      one: '1 بدلون آفلاین خوندي شو',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'کله چې آنلاین شئ پخپله همغږي کېږي';

  @override
  String get syncing => 'همغږي کېږي';

  @override
  String get sync => 'همغږي';

  @override
  String get shopProfile => 'د دوکان پروفایل';

  @override
  String get insights => 'لیدلوري';

  @override
  String get notifications => 'خبرتیاوې';

  @override
  String get backupExport => 'بیک اپ او صادرول';

  @override
  String get adminPanel => 'د مدیر پینل';

  @override
  String get toolsSync => 'وسایل او همغږي';

  @override
  String get account => 'حساب';

  @override
  String get shopDetailsSaved => 'د دوکان جزیات خوندي شول.';

  @override
  String saveFailed(int code) {
    return 'خوندي نه شو ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'خوندي نه شو: $error';
  }

  @override
  String get logoUpdated => 'لوګو تازه شو.';

  @override
  String logoUploadFailed(int code) {
    return 'لوګو پورته نه شو ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'لوګو پورته نه شو: $error';
  }

  @override
  String get healthGood => 'په ټولیز ډول هر څه سم دي.';

  @override
  String get healthSome => 'ځینې شیان پاملرنې ته اړتیا لري.';

  @override
  String get healthMany => 'ډېر شیان پاملرنې ته اړتیا لري.';

  @override
  String get shopHealth => 'د دوکان روغتیا';

  @override
  String get healthIntro => 'یوه لنډه یادونه، بل راپور نه.';

  @override
  String get couldNotLoadCheckConnection => 'پورته نه شو — خپله اړیکه وګورئ.';

  @override
  String get itemPhotos => 'د توکو انځورونه';

  @override
  String get barcodes => 'بارکوډونه';

  @override
  String get lowStockItems => 'د کمې ذخیرې توکي';

  @override
  String get lastBackup => 'وروستی بیک اپ';

  @override
  String get today => 'نن';

  @override
  String get yesterday => 'پرون';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ورځې مخکې',
      one: '1 ورځ مخکې',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'آفلاین حالت';

  @override
  String get online => 'آنلاین';

  @override
  String get offline => 'آفلاین';

  @override
  String get waitingToSync => 'همغږۍ ته انتظار';

  @override
  String get syncNow => 'اوس همغږي کړئ';

  @override
  String get searchSettings => 'په ترتیباتو کې لټون';

  @override
  String noSettingsMatch(String query) {
    return 'د \"$query\" سره هیڅ ترتیب ونه موندل شو';
  }

  @override
  String get businessInfo => 'د کاروبار معلومات';

  @override
  String get payment => 'تادیه';

  @override
  String get shopNameRequired => 'د دوکان نوم اړین دی';

  @override
  String phoneIncomplete(int digits) {
    return 'بشپړه $digits عددي تلیفون شمېره ولیکئ';
  }

  @override
  String get jazzcashOptional => 'JazzCash شمېره (اختیاري)';

  @override
  String get saved => 'خوندي شو!';

  @override
  String get languageSubtitle => 'د اپ ژبه بدله کړئ';

  @override
  String get notificationsSubtitle => 'کمه ذخیره، ځنډېدلې تادیې او ورځنی لنډیز';

  @override
  String get backupSubtitle => 'د دوکان معلومات ښکته، بېرته راوړئ او صادر کړئ';

  @override
  String get appUpdate => 'د اپ تازه کول';

  @override
  String get appUpdateSubtitle => 'نوې نسخه وګورئ';

  @override
  String get adminSubtitle => 'حسابونه او د دوکان معلومات اداره کړئ';

  @override
  String get accountSubtitle => 'ننوتل، پټنوم او کارن نوم';

  @override
  String get privacyPolicy => 'د محرمیت تګلاره';

  @override
  String get privacySubtitle => 'موږ کوم معلومات راټولوو او ولې';

  @override
  String get yourShop => 'ستاسو دوکان';

  @override
  String get uploadingLogo => 'د دوکان لوګو پورته کېږي';

  @override
  String get logoTapToChange => 'د دوکان لوګو، د بدلولو لپاره ټک کړئ';

  @override
  String get brandTagline => 'بوخت دوکان، ارام حسابونه.';

  @override
  String serverError(int code) {
    return 'د سرور تېروتنه: $code';
  }

  @override
  String get deleteCustomer => 'پیرودونکی ړنګ کړئ';

  @override
  String deleteCustomerMessage(String name) {
    return '$name او د هغوی ټول بلونه ړنګ کړئ؟ دا بېرته نه راګرځي.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'ړنګ نه شو: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'ړنګ نه شو — اړیکه وګورئ او بیا هڅه وکړئ.';

  @override
  String get actions => 'کړنې';

  @override
  String get edit => 'سمول';

  @override
  String get delete => 'ړنګول';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پیرودونکي ړنګ کړئ',
      one: '1 پیرودونکی ړنګ کړئ',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پیرودونکي او د هغوی ټول بلونه ړنګ کړئ؟ دا بېرته نه راګرځي.',
      one: '1 پیرودونکی او د هغه ټول بلونه ړنګ کړئ؟ دا بېرته نه راګرځي.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'ټول غیر ټاکل';

  @override
  String get selectAll => 'ټول وټاکئ';

  @override
  String selectedCount(int count) {
    return '$count ټاکل شوي';
  }

  @override
  String get cancel => 'لغوه';

  @override
  String get newTag => 'نوی';

  @override
  String get csvNeedsRows => 'CSV باید سرلیک کرښه او لږ تر لږه یو پیرودونکی ولري.';

  @override
  String get csvNeedsName => 'د CSV سرلیک باید \"name\" ستون ولري.';

  @override
  String csvLineMissingName(int line) {
    return 'کرښه $line: نوم نشته — فایل سم کړئ او بیا هڅه وکړئ.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'کرښه $line: ناسم credit_limit \"$value\" — فایل سم کړئ او بیا هڅه وکړئ.';
  }

  @override
  String get importCustomers => 'پیرودونکي راوړئ';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'په \"$file\" کې $count پیرودونکي وموندل شول. ټول راوړل؟',
      one: 'په \"$file\" کې 1 پیرودونکی وموندل شو. راوړل یې؟',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'راوړل';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پیرودونکي راوړل شول.',
      one: '1 پیرودونکی راوړل شو.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'راوړل ناکام شول: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'راوړل ناکام شول — اړیکه ونه شوه: $error';
  }

  @override
  String get noPhone => 'تلیفون نشته';

  @override
  String get offlineShowingSaved => 'آفلاین — خوندي نسخه ښودل کېږي';

  @override
  String get searchCustomersHint => 'پیرودونکي یا تلیفون ولټوئ...';

  @override
  String get noCustomersYet => 'تر اوسه پیرودونکی نشته. د اضافه کولو لپاره + ټک کړئ.';

  @override
  String get noCustomersMatch => 'هیڅ پیرودونکی ستاسو له لټون سره سمون نه خوري.';

  @override
  String get owesMoney => 'پور لري';

  @override
  String get settledUp => 'حساب پاک دی';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what پورته نه شو: $error';
  }

  @override
  String get takePhoto => 'انځور واخلئ';

  @override
  String get chooseFromGallery => 'له ګالرۍ وټاکئ';

  @override
  String get back => 'شاته';

  @override
  String callPhone(String phone) {
    return '$phone ته زنګ ووهئ';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone ته WhatsApp';
  }

  @override
  String get clearSearch => 'لټون پاک کړئ';

  @override
  String get askHint => 'لکه پدې میاشت کې ما څومره ګټه وکړه؟';

  @override
  String get acctTurnOffLockTitle => 'د اپ قفل بند کړئ؟';

  @override
  String get acctTurnOffLockBody => 'هر څوک چې دا ګرځنده ولري، پرته له PIN به اپ خلاص کړي شي.';

  @override
  String get acctTurnOff => 'بند کړئ';

  @override
  String get acctSetPinTitle => 'PIN وټاکئ';

  @override
  String get acctPinLabel => 'د ۴ څخه تر ۶ عددونو PIN';

  @override
  String get acctPinMin => 'لږ تر لږه ۴ عددونه';

  @override
  String get acctConfirmPin => 'PIN تایید کړئ';

  @override
  String get acctPinMismatch => 'PIN سره برابر نه دي';

  @override
  String get acctSetPin => 'PIN وټاکئ';

  @override
  String get acctBiometricTitle => 'د ګوتو نخښې/مخ هم وکاروئ؟';

  @override
  String get acctBiometricBody => 'که بایومیټریک ناکام شي، بیا هم کولی شئ PIN وکاروئ.';

  @override
  String get acctNoThanks => 'نه، مننه';

  @override
  String get acctEnable => 'فعال کړئ';

  @override
  String get acctSetPasswordTitle => 'پاسورډ وټاکئ';

  @override
  String get acctSetPasswordIntro => 'یو پاسورډ وټاکئ چې راتلونکې ځل د Google پرته د بریښنالیک + پاسورډ په مرسته هم ننوتلی شئ.';

  @override
  String get acctPassword => 'پاسورډ';

  @override
  String get acctPasswordMin => 'باید لږ تر لږه ۶ توري ولري';

  @override
  String get acctConfirmPassword => 'پاسورډ تایید کړئ';

  @override
  String get acctPasswordsMismatch => 'پاسورډونه سره برابر نه دي';

  @override
  String get acctSetPasswordButton => 'پاسورډ وټاکئ';

  @override
  String get acctPasswordSet => 'پاسورډ وټاکل شو — اوس کولی شئ په دې هم ننوتلی شئ.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'پاسورډ و نه ټاکل شو: $error';
  }

  @override
  String get acctChangePasswordTitle => 'پاسورډ بدل کړئ';

  @override
  String get acctCurrentPassword => 'اوسنی پاسورډ';

  @override
  String get acctRequired => 'اړین دی';

  @override
  String get acctNewPassword => 'نوی پاسورډ';

  @override
  String get acctConfirmNewPassword => 'نوی پاسورډ تایید کړئ';

  @override
  String get acctChange => 'بدل کړئ';

  @override
  String get acctPasswordChanged => 'پاسورډ بدل شو.';

  @override
  String get acctWrongPassword => 'اوسنی پاسورډ ناسم دی.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'پاسورډ بدل نه شو: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'کارن نوم بدل کړئ';

  @override
  String get acctUsername => 'کارن نوم';

  @override
  String get acctUsernameEmpty => 'کارن نوم نشي خالي کېدای';

  @override
  String get acctUsernameChanged => 'کارن نوم بدل شو.';

  @override
  String get acctChangeEmailTitle => 'بریښنالیک بدل کړئ';

  @override
  String get acctNewEmail => 'نوی بریښنالیک';

  @override
  String get acctValidEmail => 'سم بریښنالیک ولیکئ';

  @override
  String get acctRequiredConfirm => 'ستاسو د پیژندنې د تایید لپاره اړین دی';

  @override
  String get acctGoogleConfirmFirst => 'لومړی به له تاسو وغوښتل شي چې د Google په مټ تایید کړئ.';

  @override
  String acctCheckEmail(String email) {
    return 'د بدلون د تایید لینک لپاره $email وګورئ.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'د پاسورډ ننوتنه';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider لرې کړئ؟';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'تاسو به نور پدې حساب کې د $provider په مټ ننوتلی نشئ.';
  }

  @override
  String get acctRemove => 'لرې کړئ';

  @override
  String acctRemoved(String provider) {
    return '$provider لرې شو.';
  }

  @override
  String get acctSignedIn => 'ننوتلي یاست';

  @override
  String get acctEmailNotVerified => 'بریښنالیک لا تایید شوی نه دی.';

  @override
  String get acctVerificationSent => 'د تایید بریښنالیک ولیږل شو.';

  @override
  String get acctResend => 'بیا ولیږئ';

  @override
  String get acctSectionSignIn => 'ننوتنه او امنیت';

  @override
  String get acctRowChangeUsername => 'کارن نوم بدل کړئ';

  @override
  String get acctRowChangeEmail => 'بریښنالیک بدل کړئ';

  @override
  String get acctRowSetPassword => 'پاسورډ وټاکئ';

  @override
  String get acctRowChangePassword => 'پاسورډ بدل کړئ';

  @override
  String get acctRowUnlinkGoogle => 'Google لرې کړئ';

  @override
  String get acctRowRemovePassword => 'پاسورډ لرې کړئ';

  @override
  String get acctRowAppLock => 'د اپ قفل (PIN)';

  @override
  String get acctRowBiometric => 'د ګوتو نخښې/مخ وکاروئ';

  @override
  String get acctSignOutTitle => 'وتل غواړئ؟';

  @override
  String get acctSignOutBody => 'د اپ کارولو لپاره باید بیا ننوځئ.';

  @override
  String get acctSignOut => 'ووځئ';

  @override
  String get acctDeleteAccount => 'حساب ړنګ کړئ';

  @override
  String get acctDeleting => 'ړنګیږي...';

  @override
  String get acctDeleteTitle => 'حساب ړنګ کړئ؟';

  @override
  String get acctDeleteBody => 'دا ستاسو د ننوتنې معلومات د تل لپاره ړنګوي. د اپ کارولو لپاره باید بیا نوم ولیکئ. دا کار بیرته نشي کېدای.';

  @override
  String acctCouldNotDelete(String error) {
    return 'حساب ړنګ نه شو: $error';
  }

  @override
  String get itmNotFoundTitle => 'توکی ونه موندل شو';

  @override
  String itmNotFoundBody(String barcode) {
    return 'د بارکوډ $barcode سره هیڅ توکی نشته. اوس یې د نوي توکي په توګه زیات کړئ؟';
  }

  @override
  String get itmAddItem => 'توکی زیات کړئ';

  @override
  String get itmEditItem => 'توکی سم کړئ';

  @override
  String get itmMergeTitle => 'ورته توکي یو ځای کړئ';

  @override
  String get itmMergeBody => 'د یو ډول نوم لرونکي توکي په زاړه ثبت کې یو ځای کېږي او ذخیره یې سره جمع کېږي. دا کار بیرته نشي کېدای.';

  @override
  String get itmMerge => 'یو ځای کړئ';

  @override
  String get itmNoDuplicates => 'هیڅ ورته توکی ونه موندل شو.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ورته توکي یو ځای شول.',
      one: '۱ ورته توکی یو ځای شو.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'توکی ړنګ کړئ';

  @override
  String get itmCannotUndo => 'دا کار بیرته نشي کېدای.';

  @override
  String get itmDeleteOffline => 'ړنګ نه شو — خپل اړیکه وګورئ او بیا هڅه وکړئ.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توکي ړنګ کړئ',
      one: '۱ توکی ړنګ کړئ',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توکي ړنګ کړئ؟ دا کار بیرته نشي کېدای.',
      one: '۱ توکی ړنګ کړئ؟ دا کار بیرته نشي کېدای.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'انځور اپلوډ نه شو ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'انځور اپلوډ نه شو: $error';
  }

  @override
  String get itmNoBarcodes => 'تر اوسه د هیڅ توکي بارکوډ نشته.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count لیبلونه چاپ کړئ',
      one: '۱ لیبل چاپ کړئ',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'توکی یا کټګوري ولټوئ...';

  @override
  String get itmStopListening => 'اوریدل ودروئ';

  @override
  String get itmVoiceSearch => 'په غږ لټون';

  @override
  String get itmSort => 'ترتیب';

  @override
  String get itmSortName => 'نوم (ا-ي)';

  @override
  String get itmSortStockLow => 'ذخیره: له لږ نه ډېر';

  @override
  String get itmSortRecent => 'تازه زیات شوي';

  @override
  String get itmFilterAll => 'ټول';

  @override
  String get itmFilterLowStock => 'لږ ذخیره';

  @override
  String get itmNoItemsYet => 'تر اوسه هیڅ توکی نشته. د زیاتولو لپاره + کېکاږئ.';

  @override
  String get itmNoItemsMatch => 'ستاسو له لټون سره هیڅ توکی برابر نه دی.';

  @override
  String get itmNoPriceChanges => 'تر اوسه د بیې هیڅ بدلون نه دی ثبت شوی.';

  @override
  String get itmNoStockCorrections => 'تر اوسه د ذخیرې هیڅ سمون نه دی ثبت شوی.';

  @override
  String get itmResetHistory => 'تاریخچه بیا تنظیم کړئ';

  @override
  String get itmResetHistoryMsg => 'د دې توکي تاریخچه بیا تنظیم شي؟ دا بیرته نشي کیدی.';

  @override
  String get itmSendPdf => 'د PDF په توګه ولېږئ';

  @override
  String get itmNoteOptional => 'یادښت (اختیاري)';

  @override
  String get itmNoteHint => 'د دې بدلون لپاره یادښت اضافه کړئ';

  @override
  String get itmRemoveEntry => 'ثبت لرې کړئ';

  @override
  String get itmRemoveEntryMsg => 'دا ثبت له تاریخچې لرې شي؟ دا بیرته نشي کیدی.';

  @override
  String get itmEditEntry => 'ثبت سم کړئ';

  @override
  String get itmPrevQty => 'مخکینی';

  @override
  String get itmNewQty => 'نوی';

  @override
  String itmCost(String amount) {
    return 'لګښت: $amount';
  }

  @override
  String get itmMore => 'نور';

  @override
  String get itmMenuPrintLabel => 'لیبل چاپ کړئ';

  @override
  String get itmMenuDuplicate => 'نقل جوړ کړئ';

  @override
  String get itmMenuPriceHistory => 'د بیې تاریخچه';

  @override
  String get itmMenuStockHistory => 'د ذخیرې د سمونونو تاریخچه';

  @override
  String itmLowStockBadge(int count) {
    return '$count لږ ذخیره';
  }

  @override
  String itmStockLine(String qty) {
    return 'ذخیره: $qty';
  }

  @override
  String get itmOfflineSaved => 'آفلاین — توکی پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get itmItemName => 'د توکي نوم';

  @override
  String get itmNameRequired => 'نوم اړین دی';

  @override
  String get itmPricePkr => 'بیه (PKR)';

  @override
  String get itmPriceRequired => 'بیه اړینه ده';

  @override
  String get itmValidNumber => 'سم شمېر ولیکئ';

  @override
  String get itmUnit => 'واحد';

  @override
  String get itmCategoryHint => 'کټګوري (اختیاري، لکه نلسازي)';

  @override
  String get itmPreferredSupplier => 'غوره عرضه کوونکی (اختیاري)';

  @override
  String get itmPreferredSupplierHelper => 'د یو کېکاږنې بیا امر لپاره کارول کېږي';

  @override
  String get itmClear => 'پاک کړئ';

  @override
  String get itmHsn => 'د HSN کوډ (اختیاري)';

  @override
  String get itmGstRate => 'د GST کچه % (اختیاري)';

  @override
  String get itmBarcodeOptional => 'بارکوډ (اختیاري)';

  @override
  String get itmScanOrType => 'سکین کړئ یا ولیکئ';

  @override
  String get itmScanBarcode => 'بارکوډ سکین کړئ';

  @override
  String get itmPurchaseCost => 'د اخیستلو لګښت (د هر واحد)';

  @override
  String get itmPurchaseCostHint => 'هغه څه چې ذخیره اخیستلو پر مهال یې ورکوئ';

  @override
  String get itmWholesale => 'عمده بیه (اختیاري)';

  @override
  String get itmContractor => 'د ټیکه‌دار بیه (اختیاري)';

  @override
  String get itmFallsBack => 'که نه وي، عادي بیه به کارول کېږي';

  @override
  String get itmStockQty => 'د ذخیرې اندازه';

  @override
  String get itmLowStockAlert => 'د لږې ذخیرې خبرتیا له دې ښکته';

  @override
  String get itmFrequently => 'ډېری وخت سره اخیستل کېږي';

  @override
  String get itmSaveChanges => 'بدلونونه خوندي کړئ';

  @override
  String get itmSaveItem => 'توکی خوندي کړئ';

  @override
  String get itmPhotoSemantics => 'د توکي انځور، د بدلولو لپاره کېکاږئ';

  @override
  String get cdUpdateStatusTitle => 'د تادیې حالت نوی کړئ';

  @override
  String get cdMarkPaidQ => 'دا بل د تادیه شوي په توګه نښه کړئ؟';

  @override
  String get cdMarkUnpaidQ => 'دا بل د نه تادیه شوي په توګه نښه کړئ؟';

  @override
  String get cdConfirm => 'تایید کړئ';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'نوی نه شو: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'آفلاین — بدلون پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get cdConvertTitle => 'بل ته واړوئ';

  @override
  String get cdConvertBody => 'دا به د دې توکو ذخیره کم کړي او کوټېشن به ریښتینی بل شي. دوام ورکړئ؟';

  @override
  String get cdConvert => 'واړوئ';

  @override
  String cdCouldNotConvert(String detail) {
    return 'ونه اوښتل: $detail';
  }

  @override
  String get cdReturnItems => 'توکي بیرته ورکړئ';

  @override
  String get cdReturnHint => 'د هر توکي د بیرته ورکولو اندازه وټاکئ. د پلورلو د ساتلو لپاره 0 پریږدئ.';

  @override
  String get cdDecreaseQty => 'اندازه کمه کړئ';

  @override
  String get cdIncreaseQty => 'اندازه زیاته کړئ';

  @override
  String get cdCreditTotal => 'د کریډیټ ټولټال';

  @override
  String get cdReturnSelected => 'ټاکل شوي بیرته ورکړئ';

  @override
  String cdCouldNotReturn(String detail) {
    return 'بیرته نه شو ورکول: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'باطل نه شو: $detail';
  }

  @override
  String get cdNoPreviousBill => 'د تکرار لپاره مخکینی بل نشته';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'وروستی بل نه شو پورته کېدای: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'انوایس پیرودونکي ته ایمیل شو.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'انوایس ایمیل نه شو: $detail';
  }

  @override
  String get cdStatementEmailed => 'بیان پیرودونکي ته ایمیل شو.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'بیان ایمیل نه شو: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'بل ړنګ کړئ';

  @override
  String get cdBillVoided => 'باطل';

  @override
  String get cdBillReturn => 'بیرته ورکړه';

  @override
  String get cdBillQuote => 'کوټېشن';

  @override
  String get cdBillPaid => 'تادیه شوی';

  @override
  String get cdBillPartial => 'جزوي';

  @override
  String get cdBillUnpaid => 'نه تادیه شوی';

  @override
  String get cdBill => 'بل';

  @override
  String cdVoidedReason(String reason) {
    return 'باطل: $reason';
  }

  @override
  String get cdViewInvoice => 'انوایس وګورئ';

  @override
  String get cdEmailInvoice => 'انوایس ایمیل کړئ';

  @override
  String get cdEditBill => 'بل سم کړئ';

  @override
  String get cdReturnBill => 'بل بیرته ورکړئ';

  @override
  String get cdVoidBill => 'بل باطل کړئ';

  @override
  String get cdNoItems => 'هیڅ توکی نشته';

  @override
  String get cdRepeatLast => 'وروستی بل تکرار کړئ';

  @override
  String get cdLedgerPdf => 'د کهاتې PDF';

  @override
  String get cdEmailStatement => 'بیان ایمیل کړئ';

  @override
  String get cdCollectPayment => 'تادیه راټوله کړئ';

  @override
  String get cdSendReminder => 'د واټس‌اپ یادونه ولیږئ';

  @override
  String get cdTotalBilled => 'ټول بل شوي';

  @override
  String get cdPaid => 'تادیه شوی';

  @override
  String get cdNoBills => 'تر اوسه هیڅ بل نشته';

  @override
  String get cdBillActions => 'د بل کړنې';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'د کریډیټ له حد $limit څخه $outstanding کارول شوي';
  }

  @override
  String get cdVoidBody => 'دا به له توازن او راپورونو لرې کړي خو په تاریخچه کې به یې وساتي. ذخیره به بیرته راشي. دا کار بیرته نشي کېدای.';

  @override
  String get cdReason => 'لامل (اختیاري)';

  @override
  String get frmOfflineCustomer => 'آفلاین — پیرودونکی پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get frmOfflineSupplier => 'آفلاین — عرضه کوونکی پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get frmEditCustomer => 'پیرودونکی سم کړئ';

  @override
  String get frmCustomerName => 'د پیرودونکي نوم';

  @override
  String get frmPhoneOptional => 'تلیفون (اختیاري)';

  @override
  String get frmCreditLimit => 'د کریډیټ حد (PKR، اختیاري)';

  @override
  String get frmCreditHelper => 'کله چې د دې پیرودونکي توازن له دې ډېر شي خبرداری ورکړئ';

  @override
  String get frmPriceTier => 'د بیې کچه';

  @override
  String get frmRetail => 'پرچون';

  @override
  String get frmWholesale => 'عمده';

  @override
  String get frmContractor => 'ټیکه‌دار';

  @override
  String get frmPriceTierHelper => 'د بل جوړولو پر مهال د دې پیرودونکي لپاره کومه بیه مخکې ډکه شي';

  @override
  String get frmStrn => 'STRN (اختیاري)';

  @override
  String get frmStrnCustomer => 'د انوایسونو لپاره ۱۳ عددي د پلورنې مالیې د ثبت شمېره';

  @override
  String get frmStrnSupplier => 'د پېرود بلونو لپاره ۱۳ عددي د پلورنې مالیې د ثبت شمېره';

  @override
  String get frmAddress => 'پته (اختیاري)';

  @override
  String get frmEmail => 'بریښنالیک (اختیاري)';

  @override
  String get frmEmailHelper => 'تاسو ته اجازه درکوي دې پیرودونکي ته انوایس یا بیان ایمیل کړئ';

  @override
  String get frmSaveCustomer => 'پیرودونکی خوندي کړئ';

  @override
  String get frmEditSupplier => 'عرضه کوونکی سم کړئ';

  @override
  String get frmSupplierName => 'د عرضه کوونکي نوم';

  @override
  String get frmSaveSupplier => 'عرضه کوونکی خوندي کړئ';

  @override
  String get sdDeletePurchaseTitle => 'پېرود ړنګ کړئ';

  @override
  String get sdDeletePurchaseBody => 'د دې پېرود ذخیره به بیرته راشي. دا کار بیرته نشي کېدای.';

  @override
  String get sdReturnToSupplier => 'عرضه کوونکي ته بیرته ورکړئ';

  @override
  String get sdReturnHint => 'د هر توکي د بیرته لېږلو اندازه وټاکئ. د ساتلو لپاره 0 پریږدئ.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'د ترلاسه شوي په توګه نښه نه شو: $detail';
  }

  @override
  String get sdMarkPaidQ => 'دا پېرود د تادیه شوي په توګه نښه کړئ؟';

  @override
  String get sdMarkUnpaidQ => 'دا پېرود د نه تادیه شوي په توګه نښه کړئ؟';

  @override
  String get sdTotalPurchased => 'ټول پېرود';

  @override
  String get sdPayable => 'ورکړې وړ';

  @override
  String sdPayableAmount(String amount) {
    return '$amount ورکړې وړ';
  }

  @override
  String get sdNoPurchases => 'تر اوسه هیڅ پېرود نشته';

  @override
  String get sdPo => 'پی او';

  @override
  String get sdDraftPo => 'د پی او مسوده';

  @override
  String get sdPurchase => 'پېرود';

  @override
  String get sdDraftNote => 'د پېرود امر مسوده — لا نه دی ترلاسه شوی، د ذخیرې یا لګښت کې لا هیڅ بدلون نشته.';

  @override
  String get sdReturnNote => 'عرضه کوونکي ته بیرته ورکړه / کریډیټ نوټ.';

  @override
  String get sdMarkReceived => 'د ترلاسه شوي په توګه نښه کړئ';

  @override
  String get sdEditPurchase => 'پېرود سم کړئ';

  @override
  String get sdPurchaseActions => 'د پېرود کړنې';

  @override
  String get slDeleteSupplier => 'عرضه کوونکی ړنګ کړئ';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عرضه کوونکي ړنګ کړئ',
      one: '۱ عرضه کوونکی ړنګ کړئ',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عرضه کوونکي او د هغوی ټول پېرودونه ړنګ کړئ؟ دا کار بیرته نشي کېدای.',
      one: '۱ عرضه کوونکی او د هغه ټول پېرودونه ړنګ کړئ؟ دا کار بیرته نشي کېدای.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV ته د سرلیک قطار سربېره لږ تر لږه یو عرضه کوونکی اړین دی.';

  @override
  String get slImportTitle => 'عرضه کوونکي واردول';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'په \"$file\" کې $count عرضه کوونکي وموندل شول. ټول وارد کړئ؟',
      one: 'په \"$file\" کې ۱ عرضه کوونکی وموندل شو. ټول وارد کړئ؟',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عرضه کوونکي وارد شول.',
      one: '۱ عرضه کوونکی وارد شو.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'تر اوسه هیڅ عرضه کوونکی نشته. د زیاتولو لپاره + کېکاږئ.';

  @override
  String get slSearchHint => 'عرضه کوونکی یا تلیفون ولټوئ...';

  @override
  String get slNoMatch => 'ستاسو له لټون سره هیڅ عرضه کوونکی برابر نه دی.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عرضه کوونکي',
      one: '۱ عرضه کوونکی',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'د عرضه کوونکو پورونه';

  @override
  String get sduNothingOwed => 'عرضه کوونکو ته هیڅ پور نشته 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عرضه کوونکو ته تادیه پاتې',
      one: '۱ عرضه کوونکي ته تادیه پاتې',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'د زاړه نه تادیه شوي پېرود $days ورځې تېرې شوې',
      one: 'د زاړه نه تادیه شوي پېرود ۱ ورځ تېره شوې',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '۰–۳۰ ورځې';

  @override
  String get duBucket1 => '۳۰–۶۰ ورځې';

  @override
  String get duBucket2 => '۶۰+ ورځې';

  @override
  String get duTitle => 'د پورونو مرکز';

  @override
  String get duNoDues => 'هیڅ پاتې پور نشته 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پیرودونکي چې پور لري',
      one: '۱ پیرودونکی چې پور لري',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'د زاړه نه تادیه شوي بل $days ورځې تېرې شوې',
      one: 'د زاړه نه تادیه شوي بل ۱ ورځ تېره شوې',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount پاتې';
  }

  @override
  String get cpNoOutstanding => 'د دې پیرودونکي هیڅ پاتې توازن نشته';

  @override
  String get cpValidAmount => 'سمه اندازه ولیکئ';

  @override
  String cpExceeds(String amount) {
    return 'اندازه له پاتې توازن $amount څخه زیاته ده';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'له $name څخه $amount راټول شول';
  }

  @override
  String get cpOfflineSaved => 'آفلاین — تادیه پدې وسیله کې خوندي شوه، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String cpOwes(String amount, String name) {
    return '$name ته $amount پاتې دي. دا به لومړی پر زاړه نه تادیه شوو بلونو پلي شي.';
  }

  @override
  String get cpAmountLabel => 'راټول شوې اندازه (PKR)';

  @override
  String get cpCollect => 'راټول کړئ';

  @override
  String get usNoItems => 'د نوي کولو لپاره هیڅ توکی نشته.';

  @override
  String get usHelp => 'د هر توکي نوې ذخیره وټاکئ، بیا ټول خوندي کړئ کېکاږئ.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  اوسنی: $qty';
  }

  @override
  String usNew(String qty) {
    return 'نوی: $qty';
  }

  @override
  String get usSubtract => '۱ کم کړئ';

  @override
  String get usAdd => '۱ زیات کړئ';

  @override
  String get usNoChanges => 'هیڅ بدلون نشته';

  @override
  String usSaveAll(int count) {
    return 'ټول خوندي کړئ ($count بدل شوي)';
  }

  @override
  String get srHint => 'پیرودونکي، توکي، اندازې ولټوئ...';

  @override
  String get srFailed => 'لټون ناکام شو — خپل اړیکه وګورئ.';

  @override
  String get srTitle => 'په خپل دوکان کې ولټوئ';

  @override
  String get srSubtitle => 'پیرودونکي په نوم یا تلیفون او بلونه په اندازه ومومئ.';

  @override
  String srNoMatches(String query) {
    return 'د \"$query\" لپاره هیڅ پایله نشته';
  }

  @override
  String get srTryDifferent => 'بل نوم، تلیفون شمېره یا اندازه وازمویئ.';

  @override
  String get srBills => 'بلونه';

  @override
  String get srNoItemList => 'د توکو لیست نشته';

  @override
  String get abAddAtLeastOne => 'لږ تر لږه یو توکی زیات کړئ';

  @override
  String get abQuotationUpdated => 'کوټېشن نوی شو!';

  @override
  String get abBillUpdated => 'بل نوی شو!';

  @override
  String get abQuotationSaved => 'کوټېشن خوندي شو!';

  @override
  String get abBillCreated => 'بل په بریالیتوب جوړ شو!';

  @override
  String abTotalAmount(String amount) {
    return 'ټول: $amount';
  }

  @override
  String get abShare => 'شریک کړئ';

  @override
  String get abDoneReturn => 'بشپړ او بیرته';

  @override
  String get abOverLimitBody => 'دا به پیرودونکی د خپل کریډیټ له حد واړوي.';

  @override
  String get abOverLimitTitle => 'د کریډیټ له حد ډېر';

  @override
  String get abBillAnyway => 'بیا هم بل جوړ کړئ';

  @override
  String get abOfflineBill => 'آفلاین — بل پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get abEditQuotation => 'کوټېشن سم کړئ';

  @override
  String get abEditBill => 'بل سم کړئ';

  @override
  String get abNewQuotation => 'نوی کوټېشن';

  @override
  String get abAddBill => 'بل زیات کړئ';

  @override
  String get abCouldNotLoadItems => 'توکي پورته نه شول.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'دا بل به د پیرودونکي توازن $total کړي، چې له $limit کریډیټ حد ډېر دی.';
  }

  @override
  String get abTapAddItemBill => 'د بل پیلولو لپاره لاندې \"توکی زیات کړئ\" کېکاږئ';

  @override
  String get abNoCatalog => 'په کتلاګ کې تر اوسه هیڅ توکی نشته';

  @override
  String get abScan => 'سکین';

  @override
  String get abDiscountRs => 'تخفیف (روپۍ)';

  @override
  String get abSubtotal => 'فرعي ټولټال';

  @override
  String get abTotal => 'ټولټال';

  @override
  String get abSaveAsQuotation => 'د کوټېشن په توګه خوندي کړئ';

  @override
  String get abQuotationLocked => 'موجود بل بیرته کوټېشن نشي کېدای';

  @override
  String get abQuotationNote => 'تر بل ته اړولو پورې ذخیره نه کمېږي';

  @override
  String get abPaymentStatus => 'د تادیې حالت';

  @override
  String get abUnpaid => 'نه تادیه شوی';

  @override
  String get abPaymentMethod => 'د تادیې طریقه';

  @override
  String get abCash => 'نغدي';

  @override
  String get abBankTransfer => 'بانکي انتقال';

  @override
  String get abCheque => 'چک';

  @override
  String get abSaveQuotation => 'کوټېشن خوندي کړئ';

  @override
  String get abSaveBill => 'بل خوندي کړئ';

  @override
  String abAdded(String name) {
    return '$name زیات شو';
  }

  @override
  String get apNewItem => 'نوی توکی…';

  @override
  String get apNewItemHint => 'لومړی په کتلاګ کې نوی توکی زیات کړئ';

  @override
  String get apOfflinePurchase => 'آفلاین — پېرود پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get apEditPo => 'د پېرود امر سم کړئ';

  @override
  String get apNewPo => 'نوی د پېرود امر';

  @override
  String get apAddPurchase => 'پېرود زیات کړئ';

  @override
  String get apTapAddItem => 'د پېرود پیلولو لپاره لاندې \"توکی زیات کړئ\" کېکاږئ';

  @override
  String get apSaveAsPo => 'د پېرود امر په توګه خوندي کړئ';

  @override
  String get apPoLocked => 'ترلاسه شوی پېرود بیرته مسوده امر نشي کېدای';

  @override
  String get apPoNote => 'تر هغه چې توکي ترلاسه شوي نښه نه شي، ذخیره یا لګښت نه بدلېږي';

  @override
  String get apUnpaidCredit => 'نه تادیه شوی (په پور)';

  @override
  String get apSavePo => 'د پېرود امر خوندي کړئ';

  @override
  String get apSavePurchase => 'پېرود خوندي کړئ';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'اوسنی لګښت: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'لګښت نه دی ټاکل شوی  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'سکین ناکام شو: د سرور تېروتنه $code';
  }

  @override
  String get scOfflineSaved => 'آفلاین — انځور خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به ولوستل شي';

  @override
  String get scStillOffline => 'لا هم آفلاین';

  @override
  String get scCouldNotCreateCustomer => 'پیرودونکی جوړ نه شو — بیا هڅه وکړئ.';

  @override
  String get scCouldNotCreateSupplier => 'عرضه کوونکی جوړ نه شو — بیا هڅه وکړئ.';

  @override
  String scBillSavedFor(String name) {
    return 'د $name لپاره بل خوندي شو';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'له $name څخه پېرود خوندي شو';
  }

  @override
  String get scWhichCustomer => 'دا کوم پیرودونکی دی؟';

  @override
  String get scWhichSupplier => 'دا کوم عرضه کوونکی دی؟';

  @override
  String scClosestMatch(String name, int score) {
    return 'په ثبت کې ترټولو ورته: $name ($score٪ ورته)';
  }

  @override
  String scYesThisIs(String name) {
    return 'هو، دا $name دی';
  }

  @override
  String get scOtherwiseCustomer => 'که نه، نوی پیرودونکی جوړ کړئ:';

  @override
  String get scOtherwiseSupplier => 'که نه، نوی عرضه کوونکی جوړ کړئ:';

  @override
  String get scNoMatchCustomer => 'هیڅ ورته پیرودونکی ونه موندل شو. نوی جوړ کړئ:';

  @override
  String get scNoMatchSupplier => 'هیڅ ورته عرضه کوونکی ونه موندل شو. نوی جوړ کړئ:';

  @override
  String get scCustomerName => 'د پیرودونکي نوم';

  @override
  String get scSupplierName => 'د عرضه کوونکي نوم';

  @override
  String get scCreateNew => 'نوی جوړ کړئ';

  @override
  String get scTitleBill => 'بل سکین کړئ';

  @override
  String get scIntroBill => 'د بل انځور واخلئ. که په لاس لیکل شوی وي هم ښه دی، او سندهي، اردو یا انګلیسي ټولې کار کوي. د خوندي کېدو دمخه به یې وګورئ.';

  @override
  String get scIntroPurchase => 'د عرضه کوونکي د انوایس انځور واخلئ. سندهي، اردو یا انګلیسي ټولې کار کوي. د خوندي کېدو دمخه به یې وګورئ.';

  @override
  String get scReadingBill => 'بل لوستل کېږي…';

  @override
  String get scScanBill => 'بل سکین کړئ';

  @override
  String get scReadingInvoice => 'انوایس لوستل کېږي…';

  @override
  String get scScanInvoice => 'انوایس سکین کړئ';

  @override
  String get scQueued => 'په کتار کې سکینونه';

  @override
  String get scReady => 'د کتنې لپاره چمتو';

  @override
  String get scFailed => 'ناکام';

  @override
  String get scWaiting => 'د اړیکې انتظار';

  @override
  String get scRetry => 'بیا هڅه وکړئ';

  @override
  String rpCouldNotLoad(String error) {
    return 'راپورونه پورته نه شول: $error';
  }

  @override
  String get rpHeadline => 'د دې میاشتې مهم شمېرې';

  @override
  String get rpProfitThisMonth => 'د دې میاشتې ګټه';

  @override
  String get rpNoData => 'تر اوسه هیڅ ډاټا نشته';

  @override
  String get rpSalesTax => 'د پلورنې مالیه';

  @override
  String rpSalesTaxFor(String month) {
    return 'د $month د پلورنې مالیې راپور';
  }

  @override
  String get rpViewSalesTax => 'د پلورنې مالیې راپور وګورئ';

  @override
  String get rpQuickReports => 'چټک راپورونه';

  @override
  String get rpQuickSub => 'مستقیم یو ځانګړي راپور ته لاړ شئ';

  @override
  String get expensesTitle => 'لګښتونه';

  @override
  String get rpRateCard => 'د نرخ کارت';

  @override
  String get rpDetails => 'توضیحات';

  @override
  String get rpDetailsSub => 'بشپړ تفصیل او درجه بندي';

  @override
  String get rpOutstandingByCustomer => 'د پیرودونکي له مخې پاتې پورونه';

  @override
  String get rpNoOutstanding => 'هیڅ پاتې توازن نشته';

  @override
  String get rpMonthlyTotals => 'میاشتني ټولټالونه';

  @override
  String get rpMostSold => 'ډېر پلورل شوي توکي';

  @override
  String get rpNoItemsRecorded => 'تر اوسه هیڅ توکی نه دی ثبت شوی';

  @override
  String get rpTopCustomers => 'د عاید له مخې غوره پیرودونکي';

  @override
  String get rpNoSalesRecorded => 'تر اوسه هیڅ پلورنه نه ده ثبت شوې';

  @override
  String get rpTotalOutstanding => 'ټول پاتې پورونه';

  @override
  String get rpViewCustomers => 'پیرودونکي وګورئ';

  @override
  String get lblInvoice => 'انوایس';

  @override
  String get lblLedger => 'کهاته';

  @override
  String get lblRateCard => 'د نرخ کارت';

  @override
  String get exCsvNeedsRows => 'CSV ته د سرلیک قطار سربېره لږ تر لږه یو لګښت اړین دی.';

  @override
  String get exCsvHeader => 'د CSV سرلیک باید \"description\" او \"amount\" کالمونه ولري.';

  @override
  String exLineBadAmount(int line) {
    return 'کرښه $line: توضیح نشته یا اندازه ناسمه ده — فایل سم کړئ او بیا هڅه وکړئ.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'کرښه $line: ناسمه نېټه \"$date\" — YYYY-MM-DD وکاروئ.';
  }

  @override
  String get exImportTitle => 'لګښتونه واردول';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'په \"$file\" کې $count لګښتونه وموندل شول. ټول وارد کړئ؟',
      one: 'په \"$file\" کې ۱ لګښت وموندل شو. ټول وارد کړئ؟',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count لګښتونه وارد شول.',
      one: '۱ لګښت وارد شو.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'واردول ناکام شول: د سرور تېروتنه $code';
  }

  @override
  String get exDeleteTitle => 'لګښت ړنګ کړئ';

  @override
  String get exAdd => 'لګښت زیات کړئ';

  @override
  String get exEdit => 'لګښت سم کړئ';

  @override
  String get exDescription => 'توضیح';

  @override
  String get exAmountRs => 'اندازه (روپۍ)';

  @override
  String get exCategory => 'کټګوري';

  @override
  String exDate(String date) {
    return 'نېټه: $date';
  }

  @override
  String get exRepeats => 'هره میاشت تکرار کړئ';

  @override
  String get exRepeatsHint => 'کرایه، برېښنا، مزدوري او نور';

  @override
  String get exReceiptTap => 'د رسید انځور، د بدلولو لپاره کېکاږئ';

  @override
  String get exReceiptOptional => 'د رسید انځور (اختیاري)';

  @override
  String get exEnterValid => 'توضیح او سمه اندازه ولیکئ.';

  @override
  String get exOffline => 'آفلاین — لګښت پدې وسیله کې خوندي شو، کله چې آنلاین شئ په اتوماتیک ډول به همغږی شي';

  @override
  String get exSave => 'لګښت خوندي کړئ';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'پدې میاشت کې $count تکراري لګښتونه دي',
      one: 'پدې میاشت کې ۱ تکراري لګښت دی',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'زیات کړئ';

  @override
  String get exTotal => 'ټول لګښتونه';

  @override
  String exCategoryChip(String name) {
    return 'کټګوري: $name';
  }

  @override
  String get exNoneLogged => 'تر اوسه هیڅ لګښت نه دی ثبت شوی';

  @override
  String exNoneInCategory(String name) {
    return 'تر اوسه د $name هیڅ لګښت نشته';
  }

  @override
  String get exViewReceipt => 'رسید وګورئ';

  @override
  String get exEditRow => 'لګښت سم کړئ';

  @override
  String get exDeleteRow => 'لګښت ړنګ کړئ';

  @override
  String gstServerReturned(String first, String second) {
    return 'سرور $first/$second بیرته ورکړ';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'د GST ډاټا پورته نه شوه: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'ډاونلوډ ناکام شو ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename خوندي شو';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'په ډاونلوډونو/$filename کې خوندي شو';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'ډاونلوډ نه شو: $error';
  }

  @override
  String get gstTitle => 'د پلورنې مالیې راپور';

  @override
  String get gstOutwardDetail => 'بهرنۍ پلورنه — د انوایس توضیحات';

  @override
  String get gstNoBills => 'پدې میاشت کې هیڅ بل نشته.';

  @override
  String get gstHsn => 'د HSN لنډیز';

  @override
  String get gstInvoiceWise => 'د انوایس له مخې توضیحات';

  @override
  String get gstMonthly => 'میاشتنی لنډیز';

  @override
  String get gstOutwardTaxable => 'مالیې وړ بهرنۍ عرضه';

  @override
  String get gstItc => 'د ننوتنې مالیې کریډیټ (له پېرودونو)';

  @override
  String get gstSave => 'خوندي کړئ';

  @override
  String get rcValidAmount => 'سمه اندازه ولیکئ.';

  @override
  String get rcExpected => 'تمه شوې نغدې (د نننۍ نغدي پلورنې)';

  @override
  String get rcAlsoCollected => 'نن هم راټول شوي (په دراز کې نه دي شمېرل شوي)';

  @override
  String get rcCounted => 'په دراز کې شمېرل شوې نغدې (روپۍ)';

  @override
  String get rcCompare => 'پرتله کړئ';

  @override
  String get rcMatches => 'بشپړ سمون لري!';

  @override
  String rcExtra(String amount) {
    return 'په دراز کې $amount زیات';
  }

  @override
  String rcMissing(String amount) {
    return 'په دراز کې $amount کم';
  }

  @override
  String get pbiTitle => 'د توکي له مخې ګټه';

  @override
  String get pbiNoSales => 'تر اوسه هیڅ پلورنه نشته';

  @override
  String get pbiByCategory => 'د کټګورۍ له مخې';

  @override
  String get pbiItemsByProfit => 'د ګټې له مخې توکي';

  @override
  String get svTitle => 'د ذخیرې ارزښت';

  @override
  String get svNone => 'هیڅ ذخیره نشته';

  @override
  String get svItemsByValue => 'د ارزښت له مخې توکي';

  @override
  String svSummary(String items, String units) {
    return '$items توکي · په شیلف کې $units واحدونه';
  }

  @override
  String svTied(String amount) {
    return 'په ذخیره کې $amount بند دي';
  }

  @override
  String get svEstimated => 'د پلورنې له بیې اټکل شوی';

  @override
  String get bkRestoreTitle => 'بیک اپ بیرته پرځای کړئ؟';

  @override
  String bkRestoreBody(String filename) {
    return 'دا به ټول اوسني ډاټا د بیک اپ فایل \"$filename\" سره بدل کړي. دوام ورکړئ؟';
  }

  @override
  String get bkRestore => 'بیرته پرځای کړئ';

  @override
  String get bkRestoreDoneTitle => 'بیرته پرځای کول بشپړ شول';

  @override
  String get bkRestoreDoneBody => 'ستاسو ډاټا بیرته پرځای شوه.';

  @override
  String get bkOk => 'هو';

  @override
  String bkRestoreFailed(String detail) {
    return 'بیرته پرځای کول ناکام شول: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'بیرته پرځای نه شو: $error';
  }

  @override
  String get bkSaveToDownloads => 'په ډاونلوډونو کې خوندي کړئ';

  @override
  String get bkIntroAdmin => 'ستاسو ټول ډاټا په یوه ډاټابیس فایل کې دي. په منظم ډول یوه کاپي ډاونلوډ کړئ، او که کوم ستونزه رامنځته شوه بیرته یې پرځای کړئ.';

  @override
  String get bkIntroStaff => 'د بشپړ ډاټابیس بیک اپ او بیرته پرځای کول یوازې د اډمین لپاره دي. له اډمین وغواړئ، یا هغه څه چې ورته اړتیا لرئ لاندې په CSV کې صادر کړئ.';

  @override
  String get bkBackupDb => 'د ډاټابیس بیک اپ';

  @override
  String get bkBackupDbSub => 'ټول ډاټابیس په یوه فایل کې ډاونلوډ کړئ او شریک یې کړئ (واټس‌اپ، ډرایو، ایمیل).';

  @override
  String get bkDownloadPhone => 'بیک اپ په ټیلیفون کې ډاونلوډ کړئ';

  @override
  String get bkShareBackup => 'بیک اپ شریک کړئ';

  @override
  String get bkAutoTitle => 'اتوماتیک بیک اپونه';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'په سرور کې $count ورځني بیک اپونه خوندي دي، تر ټولو نوی د $time. دا پخپله چلیږي — دلته د کولو لپاره هیڅ نشته.',
      one: 'په سرور کې ۱ ورځنی بیک اپ خوندي دی، تر ټولو نوی د $time. دا پخپله چلیږي — دلته د کولو لپاره هیڅ نشته.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'د اوسني ډاټا د بدلولو لپاره یو خوندي شوی بیک اپ فایل وټاکئ.';

  @override
  String get bkRestoreFromFile => 'له بیک اپ فایل څخه بیرته پرځای کړئ';

  @override
  String get bkExportCsv => 'په CSV کې صادر کړئ';

  @override
  String get bkExportSub => 'دا په ایکسل کې خلاص کړئ یا شریک یې کړئ.';

  @override
  String get bkRangeAll => 'بلونه/لګښتونه: ټول وخت';

  @override
  String bkRangeSome(String end, String start) {
    return 'بلونه/لګښتونه: له $start څخه تر $end';
  }

  @override
  String get bkSetRange => 'موده وټاکئ';

  @override
  String get bkClearRange => 'موده پاکه کړئ';

  @override
  String get ntNever => 'هیڅکله نه دی چلول شوی';

  @override
  String get ntJustNow => 'همدا اوس';

  @override
  String ntMinutesAgo(int count) {
    return '$count دقیقې مخکې';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count ساعته مخکې';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count ورځې مخکې';
  }

  @override
  String get ntTitle => 'هوښیار خبرتیاوې';

  @override
  String get ntTapHint => 'د خبرتیا د چلولو او ژوندیو پایلو د لیدو لپاره \"اوس وګورئ\" کېکاږئ.';

  @override
  String get ntLowStockSub => 'کله چې توکي د بیا امر له کچې ښکته شي خبر ورکړئ.';

  @override
  String get ntCheckNow => 'اوس وګورئ';

  @override
  String get ntOverdue => 'د ځنډېدلې تادیې یادونې';

  @override
  String get ntOverdueSub => 'د تېرو ورځو د نه تادیه شوو بلونو په اړه خبر ورکړئ.';

  @override
  String get ntDaily => 'ورځنی سوداګریز لنډیز';

  @override
  String get ntDailySub => 'د پرون پلورنه، راټولونه او ګټه په یوه کتنه کې.';

  @override
  String get ntSendSummary => 'لنډیز ولیږئ';

  @override
  String get ntRunning => 'روان دی…';

  @override
  String get ntLowStockItems => 'لږ ذخیره لرونکي توکي';

  @override
  String get ntSales => 'پلورنه';

  @override
  String get ntCollected => 'راټول شوي';

  @override
  String get ntProfit => 'ګټه';

  @override
  String get auChecking => 'نوي کولو ته کتل کېږي…';

  @override
  String get auLatest => 'تاسو وروستی نسخه لرئ.';

  @override
  String get auAvailable => 'نوی کول شتون لري';

  @override
  String auNewer(int code) {
    return 'د Book-Keep نوې نسخه (جوړونه $code) چمتو ده.';
  }

  @override
  String get auLater => 'وروسته';

  @override
  String get auUpdate => 'نوی کړئ';

  @override
  String get auDownloading => 'نوی کول ډاونلوډېږي';

  @override
  String auSaved(String name) {
    return '$name ستاسو د ډاونلوډونو په پوښۍ کې خوندي شو.';
  }

  @override
  String get auAllowInstall => 'Book-Keep ته د اپونو د نصبولو اجازه ورکړئ، بیا بیا نوی کړئ کېکاږئ.';

  @override
  String get auFailed => 'نوی نه شو — خپل اړیکه وګورئ او بیا هڅه وکړئ.';

  @override
  String get lgSearch => 'ژبې ولټوئ';

  @override
  String lgNoMatch(String query) {
    return 'له \"$query\" سره هیڅ ژبه نه برابریږي';
  }

  @override
  String get alVoided => 'یو بل یې باطل کړ';

  @override
  String get alDeletedBill => 'یو بل یې ړنګ کړ';

  @override
  String get alReturned => 'یو بل یې بیرته ورکړ';

  @override
  String get alDeletedCustomer => 'یو پیرودونکی یې ړنګ کړ';

  @override
  String get alDeletedSupplier => 'یو عرضه کوونکی یې ړنګ کړ';

  @override
  String get alCreatedAccount => 'یو حساب یې جوړ کړ';

  @override
  String get alUpdatedAccount => 'یو حساب یې نوی کړ';

  @override
  String get alDeletedAccount => 'یو حساب یې ړنګ کړ';

  @override
  String get alTitle => 'د فعالیت ثبت';

  @override
  String get alNone => 'تر اوسه هیڅ فعالیت نه دی ثبت شوی';

  @override
  String get blkEnterOne => 'لږ تر لږه یو توکی ولیکئ';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توکي په بریالیتوب سره زیات شول',
      one: '۱ توکی په بریالیتوب سره زیات شو',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'توکي په یوځل زیات کړئ';

  @override
  String get blkFormat => 'په هره کرښه کې یو توکی، بڼه: نوم، بیه، واحد، کټګوري';

  @override
  String get blkOptional => 'واحد او کټګوري اختیاري دي (ډیفالټ: piece، هیڅ نه)';

  @override
  String get blkAddAll => 'ټول توکي زیات کړئ';

  @override
  String get prSend => 'د تادیې یادونه ولیږئ';

  @override
  String get prTone => 'لهجه وټاکئ:';

  @override
  String get prPolite => 'مؤدبانه';

  @override
  String get prStandard => 'معیاري';

  @override
  String get prUrgent => 'بېړنۍ';

  @override
  String get prPreviewQr => 'د جاز کیش د تادیې QR مخکتنه';

  @override
  String get prShareText => 'متن شریک کړئ';

  @override
  String get dsRemaining => 'پاتې';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount تخفیف پکې شامل دی';
  }

  @override
  String get dsItems => 'توکي';

  @override
  String get dsDiscount => 'تخفیف';

  @override
  String get lkWrongPin => 'ناسم PIN';

  @override
  String get lkEnterPin => 'PIN ولیکئ';

  @override
  String get lkChecking => 'د ګوتو نخښه کتل کېږي...';

  @override
  String get bcTitle => 'بارکوډ سکین کړئ';

  @override
  String get bcTorchNa => 'پدې وسیله کې ټارچ نشته';

  @override
  String get bcTorch => 'ټارچ';

  @override
  String get bcPoint => 'کیمره بارکوډ ته ونیسئ';

  @override
  String get qrNoNumber => 'هیڅ جاز کیش شمېره نه ده ټاکل شوې. د تادیې QR د ښودلو لپاره یې په ترتیباتو کې وټاکئ.';

  @override
  String get qrPay => 'په جاز کیش تادیه وکړئ';

  @override
  String get qrInvalid => 'ناسم QR ډاټا';

  @override
  String qrAmount(String amount) {
    return 'اندازه: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'جاز کیش: $number';
  }

  @override
  String get qrCopy => 'د جاز کیش شمېره کاپي کړئ';

  @override
  String get qrCopied => 'د جاز کیش شمېره کلیپ بورډ ته کاپي شوه';

  @override
  String get qrHint => 'د تادیې لپاره دا شمېره په خپل جاز کیش اپ کې سکین یا کاپي کړئ.';

  @override
  String clOwed(String amount) {
    return '$amount پاتې';
  }

  @override
  String get lnEnterEmailFirst => 'لومړی پورته سم بریښنالیک ولیکئ.';

  @override
  String get lnResetSent => 'د پاسورډ بیا تنظیم بریښنالیک ولېږل شو — خپل ان‌باکس وګورئ.';

  @override
  String get lnNoAccount => 'د دې بریښنالیک هیڅ حساب ونه موندل شو.';

  @override
  String get lnWrongPassword => 'پاسورډ ناسم دی.';

  @override
  String get lnInvalidEmail => 'دا د سم بریښنالیک پته نه ښکاري.';

  @override
  String get lnDisabled => 'دا حساب غیرفعال شوی دی.';

  @override
  String get lnTooMany => 'ډېرې هڅې — یوه دقیقه وروسته بیا هڅه وکړئ.';

  @override
  String get lnNoInternet => 'د انټرنیټ اړیکه نشته.';

  @override
  String get lnWeakPassword => 'پاسورډ باید لږ تر لږه ۶ توري ولري.';

  @override
  String get lnCouldNotSignIn => 'ننوتل ونه شو. مهرباني وکړئ بیا هڅه وکړئ.';

  @override
  String get lnWrongPasswordHint => 'پاسورډ ناسم دی. بیا هڅه وکړئ یا \"پاسورډ مو هیر دی؟\" کېکاږئ.';

  @override
  String get lnWrongEmail => 'بریښنالیک ناسم دی — د دې پتې هیڅ حساب نشته.';

  @override
  String get lnWrongEmailOrPassword => 'بریښنالیک یا پاسورډ ناسم دی.';

  @override
  String get lnWrongUsername => 'کارن نوم ناسم دی — د دې نوم هیڅ حساب نشته.';

  @override
  String get lnWelcome => 'بیرته ښه راغلاست';

  @override
  String lnSignInTo(String app) {
    return 'په $app کې ننوځئ';
  }

  @override
  String get lnEmailOrUsername => 'بریښنالیک یا کارن نوم';

  @override
  String get lnRemember => 'ما په یاد ولره';

  @override
  String get lnForgot => 'پاسورډ مو هیر دی؟';

  @override
  String get lnSignIn => 'ننوتل';

  @override
  String get lnGoogle => 'د Google سره دوام ورکړئ';

  @override
  String get lnNew => 'نوي یاست؟';

  @override
  String get lnCreate => 'حساب جوړ کړئ';

  @override
  String suCreated(String email) {
    return 'د $email لپاره حساب جوړ شو. د تایید بریښنالیک ولېږل شو (اختیاري).';
  }

  @override
  String suSetup(String app) {
    return '$app تنظیم کړئ';
  }

  @override
  String get suName => 'نوم';

  @override
  String get suEmail => 'بریښنالیک';

  @override
  String suPhoneDigits(int digits) {
    return 'سم $digits عددي شمېره ولیکئ';
  }

  @override
  String get suCreateBtn => 'حساب جوړ کړئ';

  @override
  String get suHaveAccount => 'مخکې حساب لرئ؟';

  @override
  String get suAlreadyExists => 'د دې بریښنالیک حساب مخکې شتون لري.';

  @override
  String get suInvalidEmail => 'د بریښنالیک پته ناسمه ده.';

  @override
  String get agShow => 'پاسورډ وښایاست';

  @override
  String get agHide => 'پاسورډ پټ کړئ';

  @override
  String get adAccounts => 'حسابونه';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ثبت شوي حسابونه',
      one: '۱ ثبت شوی حساب',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'زیات کړئ';

  @override
  String get adNoAccounts => 'هیڅ حساب ونه موندل شو.';

  @override
  String get adAccountability => 'ځوابدهي';

  @override
  String get adAccountabilitySub => 'چا څه باطل، ړنګ یا بیرته ورکړل، او د حسابونو بدلونونه.';

  @override
  String get adActivitySub => 'باطل شوي بلونه، ړنګونه، د حسابونو بدلونونه';

  @override
  String get adServer => 'سرور';

  @override
  String get adServerSub => 'دا اپ له چا سره خبرې کوي. د تنظیم وروسته ډېر کم بدلولو ته اړتیا لري.';

  @override
  String get adServerHint => 'ایمولېټر 10.0.2.2 کاروي؛ ریښتینی ټیلیفون ته په همدې وای‌فای د لپټاپ IP پکار دی. بدلول یې پر ټولو حسابونو اغېز کوي.';

  @override
  String get adApiBase => 'د API بنسټیز URL';

  @override
  String get adSaveServer => 'د سرور پته خوندي کړئ';

  @override
  String get adEmailSetSub => 'تنظیم دی — کارمندان کولی شي پیرودونکو ته انوایسونه/بیانونه ایمیل کړي.';

  @override
  String get adNotSetUp => 'لا تنظیم شوی نه دی.';

  @override
  String get adEmailSetBody => 'ایمیل تنظیم دی. کارمندانو ته اجازه ورکوي چې انوایس یا بیان مستقیم پیرودونکي ته ایمیل کړي.';

  @override
  String get adEmailHelp => 'د Gmail پته د اپ پاسورډ سره کار کوي (smtp.gmail.com، پورټ 587)، یا د خپل ایمیل وړاندې کوونکي SMTP توضیحات وکاروئ.';

  @override
  String get adSmtpHost => 'SMTP کوربه';

  @override
  String get adSmtpPort => 'SMTP پورټ';

  @override
  String get adEmailAddress => 'د ایمیل پته';

  @override
  String get adPwKeep => 'پاسورډ (اوسنی ساتلو لپاره تش پریږدئ)';

  @override
  String get adPwApp => 'پاسورډ (د اپ پاسورډ، نه د ننوتلو پاسورډ)';

  @override
  String get adFromName => 'د لیږونکي نوم (اختیاري)';

  @override
  String get adFromHint => 'زما د هارډویر دوکان';

  @override
  String get adSaving => 'خوندي کېږي...';

  @override
  String get adSaveEmail => 'د ایمیل ترتیبات خوندي کړئ';

  @override
  String get adAddAccount => 'حساب زیات کړئ';

  @override
  String get adNameOpt => 'نوم (اختیاري)';

  @override
  String get adAtLeast6 => 'لږ تر لږه ۶ توري';

  @override
  String get adGrantAdmin => 'اډمین حق ورکړئ';

  @override
  String get adCanManage => 'کولی شي باطل/ړنګ/بیرته ورکړي';

  @override
  String get adCanManageHint => 'یو بل باطل یا ړنګول، یو بل بیرته ورکول، یا پیرودونکی/عرضه کوونکی ړنګول. اډمین تل دا حق لري.';

  @override
  String get adCreate => 'جوړ کړئ';

  @override
  String get adAccountCreated => 'حساب جوړ شو.';

  @override
  String adCreateFailed(String error) {
    return 'جوړول ناکام شول: $error';
  }

  @override
  String get adEditAccount => 'حساب سم کړئ';

  @override
  String get adAdminSwitch => 'اډمین';

  @override
  String get adAdminHint => 'کولی شي د اډمین پینل خلاص کړي';

  @override
  String get adDisabled => 'غیرفعال';

  @override
  String get adDisabledHint => 'له ننوتلو څخه بند شوی';

  @override
  String get adAccountUpdated => 'حساب نوی شو.';

  @override
  String adUpdateFailed(String error) {
    return 'نوی کول ناکام شول: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label به د تل لپاره لرې شي او نور به ونه شي کولی ننوځي.';
  }

  @override
  String get adAccountDeleted => 'حساب ړنګ شو.';

  @override
  String adDeleteFailed(String error) {
    return 'ړنګول ناکام شول: $error';
  }

  @override
  String get adBadgeAdmin => 'اډمین';

  @override
  String get adBadgeDisabled => 'غیرفعال';

  @override
  String get adOff => 'د اډمین پینل بند دی';

  @override
  String get adCheckAgain => 'بیا وګورئ';

  @override
  String get adAccessRequired => 'د اډمین لاسرسی اړین دی';

  @override
  String get adAccessBody => 'یوازې د دوکان اډمینان کولی شي حسابونه اداره کړي. د دوکان له مالک څخه د اډمین لاسرسی وغواړئ.';

  @override
  String get adCouldNotLoad => 'د اډمین پینل پورته نه شو.';

  @override
  String get adBadPort => 'سم SMTP پورټ شمېره ولیکئ.';

  @override
  String get adEmailSaved => 'د ایمیل ترتیبات خوندي شول.';

  @override
  String adEmailSaveFailed(String error) {
    return 'د ایمیل ترتیبات خوندي نه شول: $error';
  }

  @override
  String get adServerEmpty => 'د سرور پته نشي تش کېدای.';

  @override
  String get adServerSaved => 'د سرور پته خوندي شوه. سکرینونه به یې په راتلونکې پورته کولو کې وکاروي.';

  @override
  String get lnOr => 'یا';

  @override
  String get scNotABill => 'دا بل نه ښکاري. د بل د پاکې انځور سره بیا هڅه وکړئ.';

  @override
  String get scNotAnInvoice => 'دا انوایس نه ښکاري. د عرضه کوونکي د انوایس د پاکې انځور سره بیا هڅه وکړئ.';

  @override
  String get jqOpenFull => 'لوی کړئ';

  @override
  String get jqCopy => 'شمېره کاپي کړئ';

  @override
  String get jqSheetTitle => 'جاز کیش QR';

  @override
  String get jqSheetHint => 'پیرودونکي د تادیې لپاره دا په خپل جاز کیش اپ کې سکین کوي.';

  @override
  String get jqCheck => 'شمېره وګورئ';

  @override
  String get askVoice => 'غږ';

  @override
  String get askVoiceFallbackNote => 'دا ستاسو د موبایل په غږ لوستل کېږي.';

  @override
  String get askPace => 'سرعت';

  @override
  String get askTone => 'لهجه';

  @override
  String get askPaceSlower => 'ورو';

  @override
  String get askPaceNormal => 'عادي';

  @override
  String get askPaceFaster => 'چټک';

  @override
  String get askToneCalm => 'آرام';

  @override
  String get askToneWarm => 'تود';

  @override
  String get askToneCheerful => 'خوشاله';

  @override
  String qPaymentUpdate(String amount) {
    return 'د پیسو تازه کول: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'پېرېدونکی: $name';
  }

  @override
  String qSupplier(String name) {
    return 'عرضه کوونکی: $name';
  }

  @override
  String qItem(String name) {
    return 'توکی: $name';
  }

  @override
  String qExpense(String name) {
    return 'لګښت: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'پیرود: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'له $name څخه پیسې ترلاسه شوې: $amount';
  }

  @override
  String gstAmount(String amount) {
    return 'مالیه $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'مالیې وړ $taxable  ·  مالیه $tax  ·  ټول $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'عاید: $revenue  •  د توکو لګښت: $cogs  •  لګښتونه: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'سلام $customer، له $shop څخه مننه! ستاسو ټول پاتې حساب $amount دی. مننه!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'سلام $customer، د $shop له خوا د $amount پاتې پیسو د ورکړې یادونه. مهرباني وکړئ ژر یې ورکړئ.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'بیړنی خبرتیا: ګرانه $customer، ستاسو $amount پاتې ورکړه په $shop کې معطله ده. مهرباني وکړئ سمدستي یې تصفیه کړئ.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'د JazzCash له لارې ورکړه وکړئ: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'د $shop بل\nټول: $total\nتوکي: $items\nحالت: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'سلام $supplier، دا $shop دی. موږ غواړو دا توکي امر کړو:\n$lines\n\nمهرباني وکړئ موجودیت او بیه تایید کړئ. مننه.';
  }

  @override
  String ppUpdated(String date) {
    return 'وروستی تازه کېدنه: $date';
  }

  @override
  String get ppWhoH => 'موږ څوک یو';

  @override
  String ppWho(String owner, String email) {
    return '$owner، د Book-keep چلوونکی.\nاړیکه: $email';
  }

  @override
  String get ppCollectH => 'موږ څه راټولوو';

  @override
  String get ppCollectAccount => 'حساب: بریښنالیک، د تلیفون شمېره او کارن نوم، د Firebase Authentication له لارې.';

  @override
  String get ppCollectShop => 'د دوکان پروفایل: د دوکان نوم، پته، د تلیفون شمېره، د JazzCash شمېره او د دوکان لوګو، چې د دوکان مالک یې په سیټینګز کې ورکوي.';

  @override
  String get ppCollectRecords => 'د کاروبار ریکارډونه چې تاسو یې جوړوئ: د پیرودونکو او عرضه کوونکو نومونه او د تلیفون شمېرې، بلونه، پیرود، د توکو لیست (د توکو انځورونه او بارکوډ په ګډون) او لګښتونه (د رسیدونو انځورونه په ګډون). دا د اپ اصلي معلومات دي — حسابداري همداسې کار کوي.';

  @override
  String get ppCollectDevice => 'د وسیلې او تشخیصي معلومات: د پُش خبرتیا ټوکن (د کم ذخیرې، ځنډېدلو تادیاتو او ورځني لنډیز خبرتیاوو لپاره) او د کریش راپورونه (د وسیلې معلومات او د تېروتنې کرښې) د Firebase Crashlytics له لارې، چې کله اپ کریش شي په اتوماتيک ډول لیږل کېږي.';

  @override
  String ppCollectAi(String askShop) {
    return 'د AI ځانګړتیاوې: $askShop، د AI سهارنی لنډیز او د AI بل/پیرود سکینر د اړوند کاروباري معلوماتو یو انځور (د راپور شمېرې یا د بل انځور) د ځواب، لنډیز یا ایستل شویو کرښو د جوړولو لپاره د Google Gemini API ته لیږي. دا معلومات Google د ځواب جوړولو لپاره پروسس کوي؛ موږ او Google یې د Google له معیاري API شرایطو بهر د موډلونو روزلو لپاره نه کاروو.';
  }

  @override
  String get ppDontH => 'هغه څه چې موږ یې نه کوو';

  @override
  String get ppDontLocation => 'موږ ستاسو موقعیت نه تعقیبوو.';

  @override
  String get ppDontAds => 'موږ د اعلاناتو شبکې یا د چلند تحلیل/د سیشن ثبتولو وسایل نه کاروو.';

  @override
  String get ppDontSell => 'موږ ستاسو معلومات یا ستاسو د پیرودونکو معلومات هیچا ته نه پلورو.';

  @override
  String get ppWhereH => 'معلومات چېرته ساتل کېږي';

  @override
  String get ppWhereDb => 'ډیټابېس: Neon (Postgres)، د دریم لوری کلاوډ ډیټابېس چمتو کوونکی.';

  @override
  String get ppWhereFirebase => 'تصدیق، پُش خبرتیاوې، د کریش راپورونه، د انځورونو ذخیره: Firebase (Google).';

  @override
  String get ppWhereAi => 'د AI پروسس: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'د انوائس بریښنالیکونه: د هغه SMTP حساب له لارې لیږل کېږي چې ستاسو د دوکان اډمین یې په $adminPanel کې تنظیموي. موږ د لیکلو لېست نه لرو؛ دا بریښنالیکونه ستاسو خپلو پیرودونکو ته انفرادي بلونه/بیانونه دي، نه ډله ییز بازارموندنه.';
  }

  @override
  String get ppYoursH => 'ستاسو معلومات، ستاسو د پیرودونکو معلومات';

  @override
  String get ppYours => 'هر څه چې تاسو یې دننه کوئ — پیرودونکي، عرضه کوونکي، بلونه، توکي — ستاسو د دوکان دي. نور دوکانونه چې Book-keep کاروي، نشي کولی وګوري. هغه کارکوونکي حسابونه چې تاسو یې جوړوئ یوازې هغه څه ویني چې تاسو ورکړئ.';

  @override
  String get ppControlsH => 'ستاسو واک';

  @override
  String ppControlExport(String path) {
    return 'خپل معلومات صادر یا بیک اپ کړئ: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'خپل حساب ړنګ کړئ: $path. دا یوازې ستاسو د ننوتلو اسناد لرې کوي؛ د دوکان د کاروبار ریکارډونه (بلونه، پیرودونکي، توکي او نور) نه پاکوي، لکه څنګه چې د کارکوونکي لرې کول د هغه جوړ شوي ریکارډونه نه ړنګوي.';
  }

  @override
  String ppControlNotif(String path) {
    return 'خبرتیاوې: د ډول له مخې په $path کې بندېدلی شي.';
  }

  @override
  String get ppChildrenH => 'ماشومان';

  @override
  String get ppChildren => 'Book-keep د دوکاندارانو او کارکوونکو لپاره د کاروبار وسیله ده. دا د ماشومانو لپاره نه ده او ماشومان یې پوهاوي سره نه کاروي.';

  @override
  String get ppChangesH => 'په دې پالیسۍ کې بدلونونه';

  @override
  String get ppChanges => 'که هغه څه چې موږ یې راټولوو یا چېرته چې ځي بدل شي، موږ به دا پاڼه نوې کړو او پورتنۍ نېټه به بدله کړو.';

  @override
  String get ppContactH => 'اړیکه';

  @override
  String ppContact(String email) {
    return 'د دې پالیسۍ یا ستاسو د معلوماتو په اړه پوښتنې: $email';
  }

  @override
  String get waHello => 'سلام!';

  @override
  String waHelloNamed(String name) {
    return 'سلام $name،';
  }

  @override
  String get gstTaxable => 'مالیه‌ورکوونکی';

  @override
  String get gstTax => 'مالیه';

  @override
  String get gstTaxableValue => 'د مالیې وړ ارزښت';

  @override
  String get gstTotalTax => 'ټوله مالیه';

  @override
  String get gstTotalItc => 'ټول د ننوتۍ مالیې کریډیټ';

  @override
  String get gstExempt => 'معاف پلورنې';

  @override
  String get gstNetPayable => 'د تادیې وړ خالص مالیه';

  @override
  String get unknownName => 'نامعلوم';

  @override
  String get unitPiece => 'ټوټه';

  @override
  String get unitKg => 'کیلو';

  @override
  String get unitMeter => 'متر';

  @override
  String get unitBox => 'بکس';

  @override
  String get unitDozen => 'درجن';

  @override
  String get unitLiter => 'لیتر';

  @override
  String get unitBag => 'بوری';

  @override
  String deleteSupplierMessage(String name) {
    return '$name او د هغه ټول پیرودونه ړنګ کړئ؟ دا بیرته نشي کېدی.';
  }
}
