// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sindhi (`sd`).
class AppLocalizationsSd extends AppLocalizations {
  AppLocalizationsSd([String locale = 'sd']) : super(locale);

  @override
  String get navHome => 'گھر';

  @override
  String get navCustomers => 'گراهڪ';

  @override
  String get navItems => 'شيون';

  @override
  String get navSuppliers => 'سپلائر';

  @override
  String get navReports => 'رپورٽون';

  @override
  String get navSettings => 'سيٽنگون';

  @override
  String get settingsShopDetailsTitle => 'دڪان جي تفصيل';

  @override
  String get settingsShopDetailsSubtitle => 'توهان جي انوائسز تي ڏيکاريو ويندو آهي.';

  @override
  String get settingsShopNameLabel => 'دڪان جو نالو';

  @override
  String get settingsShopAddressLabel => 'دڪان جو پتو';

  @override
  String get settingsPhoneLabel => 'فون';

  @override
  String get settingsSaveShopDetails => 'دڪان جي تفصيل محفوظ ڪريو';

  @override
  String get settingsAppearanceTitle => 'ظاهري شڪل';

  @override
  String get settingsAppearanceSubtitle => 'پوري ايپ لاءِ ٿيم چونڊيو.';

  @override
  String get themeLight => 'هلڪو';

  @override
  String get themeDark => 'اونداهو';

  @override
  String get themeSystem => 'سسٽم';

  @override
  String get settingsLanguageTitle => 'ٻولي';

  @override
  String get settingsLanguageSubtitle => 'ايپ جي ڏيکارڻ واري ٻولي چونڊيو.';

  @override
  String get sortNameNewest => 'ترتيب: نالو / نئون';

  @override
  String get addCustomer => 'گراهڪ شامل ڪريو';

  @override
  String get importCsv => 'CSV درآمد ڪريو';

  @override
  String get searchShop => 'دڪان ۾ ڳوليو';

  @override
  String get scanToFindItem => 'شيءِ ڳولڻ لاءِ اسڪين ڪريو';

  @override
  String get bulkAdd => 'گڏ شامل ڪريو';

  @override
  String get updateStock => 'اسٽاڪ تازو ڪريو';

  @override
  String get printLabels => 'ليبل ڇاپيو';

  @override
  String get mergeDuplicates => 'ٻٽا گڏ ڪريو';

  @override
  String get addSupplier => 'سپلائر شامل ڪريو';

  @override
  String get scanPurchaseInvoice => 'خريداري انوائس اسڪين ڪريو';

  @override
  String askNoAnswer(String reason) {
    return 'جواب نه ملي سگهيو: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'رابطو نه ٿي سگهيو: $error';
  }

  @override
  String get micPermissionNeeded => 'آواز سان پڇڻ لاءِ مائيڪروفون جي اجازت گهرجي.';

  @override
  String get speechUnavailable => 'هن ڊوائيس تي آواز جي سڃاڻپ موجود ناهي.';

  @override
  String get askYourShop => 'پنهنجي دڪان کان پڇو';

  @override
  String get close => 'بند ڪريو';

  @override
  String get askIntro => 'ڄاڻڻ چاهيو ٿا دڪان ڪيئن هلي رهيو آهي؟ مون کان پڇو، توهان جي کاتي ۾ جيڪو درج آهي ان مان جواب ملندو.';

  @override
  String get askListening => 'ٻڌي رهيو آهي…';

  @override
  String get askThinkingWords => 'سوچي رهيو آهي…|ڪم ٿي رهيو آهي…|حساب ڪري رهيو آهي…|کاتا ڏسي رهيو آهي…|جوڙي رهيو آهي…|انگ اکر ڏسي رهيو آهي…';

  @override
  String get askSayQuestion => 'پنهنجو سوال ڳالهايو — رد ڪرڻ لاءِ گولي تي ٽيپ ڪريو';

  @override
  String briefingRefreshFailed(int code) {
    return 'بريفنگ تازي نه ٿي سگهي ($code).';
  }

  @override
  String get refreshFailedOffline => 'تازو نه ٿي سگهيو — پنهنجو ڪنيڪشن چيڪ ڪريو.';

  @override
  String get newBillFailed => 'نئون بل شروع نه ٿي سگهيو — ڪنيڪشن چيڪ ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'پهريان $name لاءِ پسنديده سپلائر مقرر ڪريو (ترميم لاءِ ٽيپ ڪريو).';
  }

  @override
  String get reorderBySupplier => 'سپلائر موجب ٻيهر آرڊر';

  @override
  String get supplier => 'سپلائر';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شيون',
      one: '1 شيءِ',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'گهٽ اسٽاڪ واري ڪنهن به شيءِ جو پسنديده سپلائر اڃا مقرر ناهي.';

  @override
  String get thisSupplier => 'هي سپلائر';

  @override
  String supplierNoPhone(String name) {
    return '$name جو فون نمبر درج ناهي.';
  }

  @override
  String get tabOverview => 'خلاصو';

  @override
  String get tabStock => 'اسٽاڪ';

  @override
  String get tabMoney => 'رقم';

  @override
  String get taglineOverview => 'اڄ جا بقايا، اسٽاڪ ۽ نقدي هڪ نظر ۾.';

  @override
  String get taglineStock => 'ڇا وڪامي رهيو آهي، ڇا گهٽجي رهيو آهي.';

  @override
  String get taglineMoney => 'خرچ، حساب جو ملان ۽ وصولي.';

  @override
  String loadingDashboard(int done, int total) {
    return 'ڊيش بورڊ لوڊ ٿي رهيو آهي… $total مان $done';
  }

  @override
  String get dashboardLoadFailed => 'ڊيش بورڊ لوڊ نه ٿي سگهيو';

  @override
  String get checkConnectionRetry => 'پنهنجو ڪنيڪشن چيڪ ڪريو ۽ ٻيهر ڪوشش ڪريو.';

  @override
  String get retry => 'ٻيهر ڪوشش';

  @override
  String get aiBriefing => 'AI بريفنگ';

  @override
  String get briefingPrompt => 'ڪالهه جو ڪاروبار ڪجهه جملن ۾ ڏسو.';

  @override
  String get getBriefing => 'بريفنگ وٺو';

  @override
  String get refreshBriefing => 'بريفنگ تازي ڪريو';

  @override
  String updatedAt(String time) {
    return 'تازو ٿيو $time';
  }

  @override
  String get customersUnknown => '— گراهڪ';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گراهڪ',
      one: '1 گراهڪ',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'پويون مهينو';

  @override
  String get nextMonth => 'ايندڙ مهينو';

  @override
  String get salesMonth => 'وڪرو (مهينو)';

  @override
  String get outstanding => 'بقايا';

  @override
  String get profitMonth => 'نفعو (مهينو)';

  @override
  String get cashToday => 'اڄ جي نقدي';

  @override
  String get newBill => 'نئون بل';

  @override
  String get scanHandwrittenBill => 'هٿ سان لکيل بل اسڪين ڪريو';

  @override
  String get topOutstanding => 'سڀ کان وڌيڪ بقايا';

  @override
  String viewAllInDues(int count) {
    return 'بقايا مرڪز ۾ سڀ $count ڏسو';
  }

  @override
  String get lowStockAlerts => 'گهٽ اسٽاڪ جون اطلاعون';

  @override
  String get noLowStock => 'ڪا به شيءِ گهٽ اسٽاڪ ۾ ناهي — اسٽاڪ ٺيڪ آهي.';

  @override
  String get whatsappAll => 'سڀني کي WhatsApp';

  @override
  String get reorderAll => 'سڀ ٻيهر آرڊر ڪريو';

  @override
  String suggestReorder(String qty, String unit) {
    return 'صلاح: $qty $unit ٻيهر آرڊر ڪريو';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit باقي';
  }

  @override
  String get reorder => 'ٻيهر آرڊر';

  @override
  String get whatsappSupplier => 'سپلائر کي WhatsApp';

  @override
  String get topItemsByRevenue => 'آمدني موجب مٿيون شيون';

  @override
  String get noSalesYet => 'اڃا ڪو وڪرو درج ناهي.';

  @override
  String qtyLabel(String qty) {
    return 'مقدار: $qty';
  }

  @override
  String get monthExpenses => 'هن مهيني جا خرچ';

  @override
  String get noExpensesMonth => 'هن مهيني ڪو خرچ درج ناهي.';

  @override
  String get quickActions => 'جلدي ڪم';

  @override
  String get dailyCashReconciliation => 'روزاني نقدي جو ملان';

  @override
  String get collectMoney => 'رقم وصول ڪريو';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تبديليون آف لائن محفوظ',
      one: '1 تبديلي آف لائن محفوظ',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'آن لائن ٿيندي ئي پاڻمرادو سنڪ ٿي ويندو';

  @override
  String get syncing => 'سنڪ ٿي رهيو آهي';

  @override
  String get sync => 'سنڪ';

  @override
  String get shopProfile => 'دڪان جي پروفائل';

  @override
  String get insights => 'جائزو';

  @override
  String get notifications => 'اطلاعون';

  @override
  String get backupExport => 'بيڪ اپ ۽ ايڪسپورٽ';

  @override
  String get adminPanel => 'ايڊمن پينل';

  @override
  String get toolsSync => 'اوزار ۽ سنڪ';

  @override
  String get account => 'اڪائونٽ';

  @override
  String get shopDetailsSaved => 'دڪان جا تفصيل محفوظ ٿي ويا.';

  @override
  String saveFailed(int code) {
    return 'محفوظ نه ٿي سگهيو ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'محفوظ نه ٿي سگهيو: $error';
  }

  @override
  String get logoUpdated => 'لوگو تازو ٿي ويو.';

  @override
  String logoUploadFailed(int code) {
    return 'لوگو اپلوڊ نه ٿي سگهيو ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'لوگو اپلوڊ نه ٿي سگهيو: $error';
  }

  @override
  String get healthGood => 'مجموعي طور سڀ ٺيڪ آهي.';

  @override
  String get healthSome => 'ڪجهه شين تي ڌيان ڏيڻ گهرجي.';

  @override
  String get healthMany => 'ڪيترين ئي شين تي ڌيان جي ضرورت آهي.';

  @override
  String get shopHealth => 'دڪان جي صحت';

  @override
  String get healthIntro => 'هڪ ننڍڙو اشارو، ٻي رپورٽ نه.';

  @override
  String get couldNotLoadCheckConnection => 'لوڊ نه ٿي سگهيو — پنهنجو ڪنيڪشن چيڪ ڪريو.';

  @override
  String get itemPhotos => 'شين جون تصويرون';

  @override
  String get barcodes => 'بارڪوڊ';

  @override
  String get lowStockItems => 'گهٽ اسٽاڪ واريون شيون';

  @override
  String get lastBackup => 'آخري بيڪ اپ';

  @override
  String get today => 'اڄ';

  @override
  String get yesterday => 'ڪالهه';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ڏينهن اڳ',
      one: '1 ڏينهن اڳ',
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
  String get waitingToSync => 'سنڪ جو انتظار';

  @override
  String get syncNow => 'هاڻي سنڪ ڪريو';

  @override
  String get searchSettings => 'سيٽنگون ڳوليو';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\" سان ڪا سيٽنگ نه ملي';
  }

  @override
  String get businessInfo => 'ڪاروباري معلومات';

  @override
  String get payment => 'ادائگي';

  @override
  String get shopNameRequired => 'دڪان جو نالو ضروري آهي';

  @override
  String phoneIncomplete(int digits) {
    return 'مڪمل $digits انگن جو فون نمبر لکو';
  }

  @override
  String get jazzcashOptional => 'JazzCash نمبر (اختياري)';

  @override
  String get saved => 'محفوظ!';

  @override
  String get languageSubtitle => 'ايپ جي ٻولي تبديل ڪريو';

  @override
  String get notificationsSubtitle => 'گهٽ اسٽاڪ، بقايا ادائگيون ۽ روزانو خلاصو';

  @override
  String get backupSubtitle => 'دڪان جو ڊيٽا ڊائونلوڊ، بحال ۽ ايڪسپورٽ ڪريو';

  @override
  String get appUpdate => 'ايپ اپڊيٽ';

  @override
  String get appUpdateSubtitle => 'نئون ورزن چيڪ ڪريو';

  @override
  String get adminSubtitle => 'اڪائونٽس ۽ دڪان جو ڊيٽا سنڀاليو';

  @override
  String get accountSubtitle => 'سائن ان، پاسورڊ ۽ يوزر نيم';

  @override
  String get privacyPolicy => 'رازداري پاليسي';

  @override
  String get privacySubtitle => 'اسين ڪهڙو ڊيٽا گڏ ڪريون ٿا ۽ ڇو';

  @override
  String get yourShop => 'توهان جو دڪان';

  @override
  String get uploadingLogo => 'دڪان جو لوگو اپلوڊ ٿي رهيو آهي';

  @override
  String get logoTapToChange => 'دڪان جو لوگو، بدلائڻ لاءِ ٽيپ ڪريو';

  @override
  String get brandTagline => 'دڪان مصروف، حساب آرامده.';

  @override
  String serverError(int code) {
    return 'سرور جي خرابي: $code';
  }

  @override
  String get deleteCustomer => 'گراهڪ ختم ڪريو';

  @override
  String deleteCustomerMessage(String name) {
    return '$name ۽ انهن جا سڀ بل ختم ڪجن؟ اهو واپس نه ٿي سگهندو.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'ختم نه ٿي سگهيو: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'ختم نه ٿي سگهيو — ڪنيڪشن چيڪ ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String get actions => 'عمل';

  @override
  String get edit => 'ترميم';

  @override
  String get delete => 'ختم ڪريو';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گراهڪ ختم ڪريو',
      one: '1 گراهڪ ختم ڪريو',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گراهڪ ۽ انهن جا سڀ بل ختم ڪجن؟ اهو واپس نه ٿي سگهندو.',
      one: '1 گراهڪ ۽ ان جا سڀ بل ختم ڪجن؟ اهو واپس نه ٿي سگهندو.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'سڀني جي چونڊ هٽايو';

  @override
  String get selectAll => 'سڀ چونڊيو';

  @override
  String selectedCount(int count) {
    return '$count چونڊيل';
  }

  @override
  String get cancel => 'رد ڪريو';

  @override
  String get newTag => 'نئون';

  @override
  String get csvNeedsRows => 'CSV ۾ هيڊر قطار ۽ گهٽ ۾ گهٽ هڪ گراهڪ هجڻ ضروري آهي.';

  @override
  String get csvNeedsName => 'CSV هيڊر ۾ \"name\" ڪالم هجڻ ضروري آهي.';

  @override
  String csvLineMissingName(int line) {
    return 'لائن $line: نالو ناهي — فائل درست ڪري ٻيهر ڪوشش ڪريو.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'لائن $line: غلط credit_limit \"$value\" — فائل درست ڪري ٻيهر ڪوشش ڪريو.';
  }

  @override
  String get importCustomers => 'گراهڪ درآمد ڪريو';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" ۾ $count گراهڪ مليا. سڀ درآمد ڪجن؟',
      one: '\"$file\" ۾ 1 گراهڪ مليو. درآمد ڪجي؟',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'درآمد ڪريو';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گراهڪ درآمد ٿيا.',
      one: '1 گراهڪ درآمد ٿيو.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'درآمد ناڪام: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'درآمد ناڪام — رابطو نه ٿي سگهيو: $error';
  }

  @override
  String get noPhone => 'فون ناهي';

  @override
  String get offlineShowingSaved => 'آف لائن — محفوظ ڪاپي ڏيکاري پئي وڃي';

  @override
  String get searchCustomersHint => 'گراهڪ يا فون ڳوليو...';

  @override
  String get noCustomersYet => 'اڃا ڪو گراهڪ ناهي. شامل ڪرڻ لاءِ + ٽيپ ڪريو.';

  @override
  String get noCustomersMatch => 'ڳولا سان ڪو گراهڪ نه مليو.';

  @override
  String get owesMoney => 'رقم باقي آهي';

  @override
  String get settledUp => 'حساب برابر';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what لوڊ نه ٿي سگهيو: $error';
  }

  @override
  String get takePhoto => 'تصوير ڪڍو';

  @override
  String get chooseFromGallery => 'گيلري مان چونڊيو';

  @override
  String get back => 'واپس';

  @override
  String callPhone(String phone) {
    return '$phone تي ڪال ڪريو';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone تي WhatsApp';
  }

  @override
  String get clearSearch => 'ڳولا صاف ڪريو';

  @override
  String get askHint => 'مثال هن مهيني مون کي ڪيترو نفعو ٿيو؟';

  @override
  String get acctTurnOffLockTitle => 'ايپ لاڪ بند ڪجي؟';

  @override
  String get acctTurnOffLockBody => 'هن فون واري ڪنهن به شخص کي PIN کانسواءِ ايپ کولڻ جي اجازت هوندي.';

  @override
  String get acctTurnOff => 'بند ڪريو';

  @override
  String get acctSetPinTitle => 'PIN مقرر ڪريو';

  @override
  String get acctPinLabel => '4 کان 6 انگن وارو PIN';

  @override
  String get acctPinMin => 'گهٽ ۾ گهٽ 4 انگ';

  @override
  String get acctConfirmPin => 'PIN جي تصديق ڪريو';

  @override
  String get acctPinMismatch => 'PIN هڪ جهڙا ناهن';

  @override
  String get acctSetPin => 'PIN مقرر ڪريو';

  @override
  String get acctBiometricTitle => 'آڱر جو نشان/منهن به استعمال ڪجي؟';

  @override
  String get acctBiometricBody => 'بايوميٽرڪ ناڪام ٿئي ته به توهان PIN استعمال ڪري سگهو ٿا.';

  @override
  String get acctNoThanks => 'نه، مهرباني';

  @override
  String get acctEnable => 'فعال ڪريو';

  @override
  String get acctSetPasswordTitle => 'پاسورڊ مقرر ڪريو';

  @override
  String get acctSetPasswordIntro => 'هڪ پاسورڊ چونڊيو ته جيئن ايندڙ ڀيري صرف Google بدران اي ميل + پاسورڊ سان به سائن ان ڪري سگهو.';

  @override
  String get acctPassword => 'پاسورڊ';

  @override
  String get acctPasswordMin => 'گهٽ ۾ گهٽ 6 اکر هئڻ گهرجن';

  @override
  String get acctConfirmPassword => 'پاسورڊ جي تصديق ڪريو';

  @override
  String get acctPasswordsMismatch => 'پاسورڊ هڪ جهڙا ناهن';

  @override
  String get acctSetPasswordButton => 'پاسورڊ مقرر ڪريو';

  @override
  String get acctPasswordSet => 'پاسورڊ مقرر ٿي ويو — هاڻي توهان ان سان به سائن ان ڪري سگهو ٿا.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'پاسورڊ مقرر نه ٿي سگهيو: $error';
  }

  @override
  String get acctChangePasswordTitle => 'پاسورڊ تبديل ڪريو';

  @override
  String get acctCurrentPassword => 'موجوده پاسورڊ';

  @override
  String get acctRequired => 'ضروري آهي';

  @override
  String get acctNewPassword => 'نئون پاسورڊ';

  @override
  String get acctConfirmNewPassword => 'نئين پاسورڊ جي تصديق ڪريو';

  @override
  String get acctChange => 'تبديل ڪريو';

  @override
  String get acctPasswordChanged => 'پاسورڊ تبديل ٿي ويو.';

  @override
  String get acctWrongPassword => 'موجوده پاسورڊ غلط آهي.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'پاسورڊ تبديل نه ٿي سگهيو: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'يوزرنيم تبديل ڪريو';

  @override
  String get acctUsername => 'يوزرنيم';

  @override
  String get acctUsernameEmpty => 'يوزرنيم خالي نٿو ٿي سگهي';

  @override
  String get acctUsernameChanged => 'يوزرنيم تبديل ٿي ويو.';

  @override
  String get acctChangeEmailTitle => 'اي ميل تبديل ڪريو';

  @override
  String get acctNewEmail => 'نئين اي ميل';

  @override
  String get acctValidEmail => 'صحيح اي ميل داخل ڪريو';

  @override
  String get acctRequiredConfirm => 'توهان جي سڃاڻپ جي تصديق لاءِ ضروري آهي';

  @override
  String get acctGoogleConfirmFirst => 'پهرين توهان کي Google ذريعي تصديق ڪرڻ لاءِ چيو ويندو.';

  @override
  String acctCheckEmail(String email) {
    return 'تبديلي جي تصديق واري لنڪ لاءِ $email ڏسو.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'پاسورڊ سان سائن ان';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider هٽائجي؟';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'توهان هن اڪائونٽ ۾ $provider سان سائن ان نه ڪري سگهندا.';
  }

  @override
  String get acctRemove => 'هٽايو';

  @override
  String acctRemoved(String provider) {
    return '$provider هٽايو ويو.';
  }

  @override
  String get acctSignedIn => 'سائن ان آهيو';

  @override
  String get acctEmailNotVerified => 'اي ميل جي اڃا تصديق نه ٿي آهي.';

  @override
  String get acctVerificationSent => 'تصديق واري اي ميل موڪلي وئي.';

  @override
  String get acctResend => 'ٻيهر موڪليو';

  @override
  String get acctSectionSignIn => 'سائن ان ۽ سيڪيورٽي';

  @override
  String get acctRowChangeUsername => 'يوزرنيم تبديل ڪريو';

  @override
  String get acctRowChangeEmail => 'اي ميل تبديل ڪريو';

  @override
  String get acctRowSetPassword => 'پاسورڊ مقرر ڪريو';

  @override
  String get acctRowChangePassword => 'پاسورڊ تبديل ڪريو';

  @override
  String get acctRowUnlinkGoogle => 'Google اڻ لنڪ ڪريو';

  @override
  String get acctRowRemovePassword => 'پاسورڊ هٽايو';

  @override
  String get acctRowAppLock => 'ايپ لاڪ (PIN)';

  @override
  String get acctRowBiometric => 'آڱر جو نشان/منهن استعمال ڪريو';

  @override
  String get acctSignOutTitle => 'سائن آئوٽ ڪجي؟';

  @override
  String get acctSignOutBody => 'ايپ استعمال ڪرڻ لاءِ توهان کي ٻيهر سائن ان ڪرڻو پوندو.';

  @override
  String get acctSignOut => 'سائن آئوٽ';

  @override
  String get acctDeleteAccount => 'اڪائونٽ ڊليٽ ڪريو';

  @override
  String get acctDeleting => 'ڊليٽ ٿي رهيو آهي...';

  @override
  String get acctDeleteTitle => 'اڪائونٽ ڊليٽ ڪجي؟';

  @override
  String get acctDeleteBody => 'هي توهان جي سائن ان جي معلومات هميشه لاءِ ڊليٽ ڪري ڇڏيندو. ايپ استعمال ڪرڻ لاءِ توهان کي ٻيهر سائن اپ ڪرڻو پوندو. هي ڪم واپس نٿو ٿي سگهي.';

  @override
  String acctCouldNotDelete(String error) {
    return 'اڪائونٽ ڊليٽ نه ٿي سگهيو: $error';
  }

  @override
  String get itmNotFoundTitle => 'شيءِ نه مليو';

  @override
  String itmNotFoundBody(String barcode) {
    return 'بارڪوڊ $barcode وارو ڪو شيءِ ناهي. ڇا ان کي هاڻي نئين شيءِ طور شامل ڪجي؟';
  }

  @override
  String get itmAddItem => 'شيءِ شامل ڪريو';

  @override
  String get itmEditItem => 'شيءِ ۾ ترميم ڪريو';

  @override
  String get itmMergeTitle => 'ڊپليڪيٽ شيون ملايو';

  @override
  String get itmMergeBody => 'ساڳي نالي وارا شيون سڀ کان پراڻي اندراج ۾ ملايا ويندا ۽ انهن جو اسٽاڪ گڏ ٿي ويندو. هي ڪم واپس نٿو ٿي سگهي.';

  @override
  String get itmMerge => 'ملايو';

  @override
  String get itmNoDuplicates => 'ڪا به ڊپليڪيٽ شيءِ نه ملي.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ڊپليڪيٽ شيون ملايون ويون.',
      one: '1 ڊپليڪيٽ شيءِ ملائي وئي.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'شيءِ ڊليٽ ڪريو';

  @override
  String get itmCannotUndo => 'هي ڪم واپس نٿو ٿي سگهي.';

  @override
  String get itmDeleteOffline => 'ڊليٽ نه ٿي سگهي — پنهنجو ڪنيڪشن چيڪ ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شيون ڊليٽ ڪريو',
      one: '1 شيءِ ڊليٽ ڪريو',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شيون ڊليٽ ڪجن؟ هي ڪم واپس نٿو ٿي سگهي.',
      one: '1 شيءِ ڊليٽ ڪجي؟ هي ڪم واپس نٿو ٿي سگهي.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'تصوير اپلوڊ نه ٿي سگهي ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'تصوير اپلوڊ نه ٿي سگهي: $error';
  }

  @override
  String get itmNoBarcodes => 'اڃا ڪنهن شيءِ جو بارڪوڊ ناهي.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ليبل پرنٽ ڪريو',
      one: '1 ليبل پرنٽ ڪريو',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'شيءِ يا درجو ڳوليو...';

  @override
  String get itmStopListening => 'ٻڌڻ بند ڪريو';

  @override
  String get itmVoiceSearch => 'آواز سان ڳولا';

  @override
  String get itmSort => 'ترتيب';

  @override
  String get itmSortName => 'نالو (ا-ي)';

  @override
  String get itmSortStockLow => 'اسٽاڪ: گهٽ کان وڌ';

  @override
  String get itmSortRecent => 'تازو شامل ٿيل';

  @override
  String get itmFilterAll => 'سڀ';

  @override
  String get itmFilterLowStock => 'گهٽ اسٽاڪ';

  @override
  String get itmNoItemsYet => 'اڃا ڪا شيءِ ناهي. شامل ڪرڻ لاءِ + دٻايو.';

  @override
  String get itmNoItemsMatch => 'توهان جي ڳولا سان ڪا شيءِ نٿي ملي.';

  @override
  String get itmNoPriceChanges => 'اڃا قيمت ۾ ڪا تبديلي رڪارڊ نه ٿي آهي.';

  @override
  String get itmNoStockCorrections => 'اڃا اسٽاڪ جي ڪا درستي رڪارڊ نه ٿي آهي.';

  @override
  String get itmResetHistory => 'تاريخ ري سيٽ ڪريو';

  @override
  String get itmResetHistoryMsg => 'هن شيءِ جي تاريخ ري سيٽ ڪجي؟ اهو واپس نٿو ٿي سگهي.';

  @override
  String get itmSendPdf => 'PDF طور موڪليو';

  @override
  String get itmNoteOptional => 'نوٽ (اختياري)';

  @override
  String get itmNoteHint => 'هن تبديلي لاءِ نوٽ شامل ڪريو';

  @override
  String get itmRemoveEntry => 'اندراج هٽايو';

  @override
  String get itmRemoveEntryMsg => 'هي اندراج تاريخ مان هٽايو؟ اهو واپس نٿو ٿي سگهي.';

  @override
  String get itmEditEntry => 'اندراج ۾ ترميم ڪريو';

  @override
  String get itmPrevQty => 'اڳيون';

  @override
  String get itmNewQty => 'نئون';

  @override
  String itmCost(String amount) {
    return 'قيمت خريد: $amount';
  }

  @override
  String get itmMore => 'وڌيڪ';

  @override
  String get itmMenuPrintLabel => 'ليبل پرنٽ ڪريو';

  @override
  String get itmMenuDuplicate => 'نقل ٺاهيو';

  @override
  String get itmMenuPriceHistory => 'قيمت جي تاريخ';

  @override
  String get itmMenuStockHistory => 'اسٽاڪ درستين جي تاريخ';

  @override
  String itmLowStockBadge(int count) {
    return '$count گهٽ اسٽاڪ';
  }

  @override
  String itmStockLine(String qty) {
    return 'اسٽاڪ: $qty';
  }

  @override
  String get itmOfflineSaved => 'آف لائن — شيءِ هن ڊوائيس تي محفوظ ٿي وئي، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندي';

  @override
  String get itmItemName => 'شيءِ جو نالو';

  @override
  String get itmNameRequired => 'نالو ضروري آهي';

  @override
  String get itmPricePkr => 'قيمت (PKR)';

  @override
  String get itmPriceRequired => 'قيمت ضروري آهي';

  @override
  String get itmValidNumber => 'صحيح نمبر داخل ڪريو';

  @override
  String get itmUnit => 'اکائي';

  @override
  String get itmCategoryHint => 'درجو (اختياري، مثال پلمبنگ)';

  @override
  String get itmPreferredSupplier => 'پسنديده سپلائر (اختياري)';

  @override
  String get itmPreferredSupplierHelper => 'هڪ ٽيپ واري ٻيهر آرڊر ۾ استعمال ٿئي ٿو';

  @override
  String get itmClear => 'صاف ڪريو';

  @override
  String get itmHsn => 'HSN ڪوڊ (اختياري)';

  @override
  String get itmGstRate => 'GST شرح % (اختياري)';

  @override
  String get itmBarcodeOptional => 'بارڪوڊ (اختياري)';

  @override
  String get itmScanOrType => 'اسڪين ڪريو يا لکو';

  @override
  String get itmScanBarcode => 'بارڪوڊ اسڪين ڪريو';

  @override
  String get itmPurchaseCost => 'خريداري لاڳت (في اکائي)';

  @override
  String get itmPurchaseCostHint => 'اسٽاڪ خريد ڪرڻ وقت توهان ڪيترو ادا ڪريو ٿا';

  @override
  String get itmWholesale => 'ٿوڪ قيمت (اختياري)';

  @override
  String get itmContractor => 'ٺيڪيدار قيمت (اختياري)';

  @override
  String get itmFallsBack => 'نه هجي ته عام قيمت لاڳو ٿيندي';

  @override
  String get itmStockQty => 'اسٽاڪ جو مقدار';

  @override
  String get itmLowStockAlert => 'گهٽ اسٽاڪ الرٽ هن کان هيٺ';

  @override
  String get itmFrequently => 'اڪثر گڏ خريد ٿيندڙ';

  @override
  String get itmSaveChanges => 'تبديليون محفوظ ڪريو';

  @override
  String get itmSaveItem => 'شيءِ محفوظ ڪريو';

  @override
  String get itmPhotoSemantics => 'شيءِ جي تصوير، بدلائڻ لاءِ ٽيپ ڪريو';

  @override
  String get cdUpdateStatusTitle => 'ادائگي جي حالت اپڊيٽ ڪريو';

  @override
  String get cdMarkPaidQ => 'هن بل کي ادا ٿيل نشان ڪجي؟';

  @override
  String get cdMarkUnpaidQ => 'هن بل کي اڻ ادا ٿيل نشان ڪجي؟';

  @override
  String get cdConfirm => 'تصديق ڪريو';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'اپڊيٽ نه ٿي سگهيو: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'آف لائن — تبديلي هن ڊوائيس تي محفوظ ٿي وئي، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندي';

  @override
  String get cdConvertTitle => 'بل ۾ تبديل ڪريو';

  @override
  String get cdConvertBody => 'هن سان انهن شين جو اسٽاڪ گهٽجي ويندو ۽ ڪوٽيشن حقيقي بل بڻجي ويندي. جاري رکجي؟';

  @override
  String get cdConvert => 'تبديل ڪريو';

  @override
  String cdCouldNotConvert(String detail) {
    return 'تبديل نه ٿي سگهيو: $detail';
  }

  @override
  String get cdReturnItems => 'شيون واپس ڪريو';

  @override
  String get cdReturnHint => 'هر شيءِ جي واپسي جو مقدار مقرر ڪريو. وڪرو قائم رکڻ لاءِ 0 ڇڏيو.';

  @override
  String get cdDecreaseQty => 'مقدار گهٽ ڪريو';

  @override
  String get cdIncreaseQty => 'مقدار وڌايو';

  @override
  String get cdCreditTotal => 'ڪريڊٽ ڪل';

  @override
  String get cdReturnSelected => 'چونڊيل واپس ڪريو';

  @override
  String cdCouldNotReturn(String detail) {
    return 'واپس نه ٿي سگهيو: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'رد نه ٿي سگهيو: $detail';
  }

  @override
  String get cdNoPreviousBill => 'ورجائڻ لاءِ ڪو پويون بل ناهي';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'آخري بل لوڊ نه ٿي سگهيو: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'انوائس گراهڪ کي اي ميل ڪئي وئي.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'انوائس اي ميل نه ٿي سگهي: $detail';
  }

  @override
  String get cdStatementEmailed => 'اسٽيٽمينٽ گراهڪ کي اي ميل ڪئي وئي.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'اسٽيٽمينٽ اي ميل نه ٿي سگهي: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'بل ڊليٽ ڪريو';

  @override
  String get cdBillVoided => 'رد';

  @override
  String get cdBillReturn => 'واپسي';

  @override
  String get cdBillQuote => 'ڪوٽيشن';

  @override
  String get cdBillPaid => 'ادا ٿيل';

  @override
  String get cdBillPartial => 'جزوي';

  @override
  String get cdBillUnpaid => 'اڻ ادا ٿيل';

  @override
  String get cdBill => 'بل';

  @override
  String cdVoidedReason(String reason) {
    return 'رد: $reason';
  }

  @override
  String get cdViewInvoice => 'انوائس ڏسو';

  @override
  String get cdEmailInvoice => 'انوائس اي ميل ڪريو';

  @override
  String get cdEditBill => 'بل ۾ ترميم ڪريو';

  @override
  String get cdReturnBill => 'بل واپس ڪريو';

  @override
  String get cdVoidBill => 'بل رد ڪريو';

  @override
  String get cdNoItems => 'ڪا به شيءِ ناهي';

  @override
  String get cdRepeatLast => 'آخري بل ورجايو';

  @override
  String get cdLedgerPdf => 'کاتي جو PDF';

  @override
  String get cdEmailStatement => 'اسٽيٽمينٽ اي ميل ڪريو';

  @override
  String get cdCollectPayment => 'ادائگي وصول ڪريو';

  @override
  String get cdSendReminder => 'واٽس ايپ ياد ڏياريندڙ موڪليو';

  @override
  String get cdTotalBilled => 'ڪل بل ٿيل';

  @override
  String get cdPaid => 'ادا ٿيل';

  @override
  String get cdNoBills => 'اڃا ڪو بل ناهي';

  @override
  String get cdBillActions => 'بل جا اختيار';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'ڪريڊٽ حد $limit مان $outstanding استعمال ٿيو';
  }

  @override
  String get cdVoidBody => 'هي ان کي بيلنس ۽ رپورٽن مان هٽائي ڇڏيندو پر تاريخ ۾ رکندو. اسٽاڪ بحال ٿي ويندو. هي ڪم واپس نٿو ٿي سگهي.';

  @override
  String get cdReason => 'سبب (اختياري)';

  @override
  String get frmOfflineCustomer => 'آف لائن — گراهڪ هن ڊوائيس تي محفوظ ٿي ويو، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندو';

  @override
  String get frmOfflineSupplier => 'آف لائن — سپلائر هن ڊوائيس تي محفوظ ٿي ويو، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندو';

  @override
  String get frmEditCustomer => 'گراهڪ ۾ ترميم ڪريو';

  @override
  String get frmCustomerName => 'گراهڪ جو نالو';

  @override
  String get frmPhoneOptional => 'فون (اختياري)';

  @override
  String get frmCreditLimit => 'ڪريڊٽ حد (PKR، اختياري)';

  @override
  String get frmCreditHelper => 'هن گراهڪ جو بيلنس هن کان وڌي ته خبردار ڪريو';

  @override
  String get frmPriceTier => 'قيمت جو درجو';

  @override
  String get frmRetail => 'پرچون';

  @override
  String get frmWholesale => 'ٿوڪ';

  @override
  String get frmContractor => 'ٺيڪيدار';

  @override
  String get frmPriceTierHelper => 'بل ٺاهڻ وقت هن گراهڪ لاءِ ڪهڙي قيمت اڳ ۾ ڀريل هجي';

  @override
  String get frmStrn => 'STRN (اختياري)';

  @override
  String get frmStrnCustomer => 'انوائس لاءِ 13 انگن وارو سيلز ٽيڪس رجسٽريشن نمبر';

  @override
  String get frmStrnSupplier => 'خريداري بلن لاءِ 13 انگن وارو سيلز ٽيڪس رجسٽريشن نمبر';

  @override
  String get frmAddress => 'پتو (اختياري)';

  @override
  String get frmEmail => 'اي ميل (اختياري)';

  @override
  String get frmEmailHelper => 'هن گراهڪ کي انوائس يا اسٽيٽمينٽ اي ميل ڪرڻ جي سهولت';

  @override
  String get frmSaveCustomer => 'گراهڪ محفوظ ڪريو';

  @override
  String get frmEditSupplier => 'سپلائر ۾ ترميم ڪريو';

  @override
  String get frmSupplierName => 'سپلائر جو نالو';

  @override
  String get frmSaveSupplier => 'سپلائر محفوظ ڪريو';

  @override
  String get sdDeletePurchaseTitle => 'خريداري ڊليٽ ڪريو';

  @override
  String get sdDeletePurchaseBody => 'هن خريداري جو اسٽاڪ بحال ٿي ويندو. هي ڪم واپس نٿو ٿي سگهي.';

  @override
  String get sdReturnToSupplier => 'سپلائر کي واپس ڪريو';

  @override
  String get sdReturnHint => 'هر شيءِ جي واپس موڪلڻ جو مقدار مقرر ڪريو. رکڻ لاءِ 0 ڇڏيو.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'وصول ٿيل نشان نه ٿي سگهيو: $detail';
  }

  @override
  String get sdMarkPaidQ => 'هن خريداري کي ادا ٿيل نشان ڪجي؟';

  @override
  String get sdMarkUnpaidQ => 'هن خريداري کي اڻ ادا ٿيل نشان ڪجي؟';

  @override
  String get sdTotalPurchased => 'ڪل خريداري';

  @override
  String get sdPayable => 'ادا ڪرڻ جوڳو';

  @override
  String sdPayableAmount(String amount) {
    return '$amount ادا ڪرڻ جوڳو';
  }

  @override
  String get sdNoPurchases => 'اڃا ڪا خريداري ناهي';

  @override
  String get sdPo => 'پي او';

  @override
  String get sdDraftPo => 'مسودو پي او';

  @override
  String get sdPurchase => 'خريداري';

  @override
  String get sdDraftNote => 'مسودو خريداري آرڊر — اڃا وصول نه ٿيو، اسٽاڪ يا لاڳت ۾ اڃا ڪا تبديلي ناهي.';

  @override
  String get sdReturnNote => 'سپلائر کي واپسي / ڪريڊٽ نوٽ.';

  @override
  String get sdMarkReceived => 'وصول ٿيل نشان ڪريو';

  @override
  String get sdEditPurchase => 'خريداري ۾ ترميم ڪريو';

  @override
  String get sdPurchaseActions => 'خريداري جا اختيار';

  @override
  String get slDeleteSupplier => 'سپلائر ڊليٽ ڪريو';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر ڊليٽ ڪريو',
      one: '1 سپلائر ڊليٽ ڪريو',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر ۽ انهن جون سڀ خريداريون ڊليٽ ڪجن؟ هي ڪم واپس نٿو ٿي سگهي.',
      one: '1 سپلائر ۽ ان جون سڀ خريداريون ڊليٽ ڪجن؟ هي ڪم واپس نٿو ٿي سگهي.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV ۾ هيڊر قطار کانسواءِ گهٽ ۾ گهٽ هڪ سپلائر هجڻ گهرجي.';

  @override
  String get slImportTitle => 'سپلائر امپورٽ ڪريو';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" ۾ $count سپلائر مليا. سڀ امپورٽ ڪجن؟',
      one: '\"$file\" ۾ 1 سپلائر مليو. سڀ امپورٽ ڪجن؟',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائر امپورٽ ٿيا.',
      one: '1 سپلائر امپورٽ ٿيو.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'اڃا ڪو سپلائر ناهي. شامل ڪرڻ لاءِ + دٻايو.';

  @override
  String get slSearchHint => 'سپلائر يا فون ڳوليو...';

  @override
  String get slNoMatch => 'توهان جي ڳولا سان ڪو سپلائر نٿو ملي.';

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
  String get sduTitle => 'سپلائر جا بقايا';

  @override
  String get sduNothingOwed => 'سپلائرن کي ڪجهه ڏيڻو ناهي 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سپلائرن کي ادائگي باقي',
      one: '1 سپلائر کي ادائگي باقي',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'سڀ کان پراڻي اڻ ادا خريداري کي $days ڏينهن ٿيا',
      one: 'سڀ کان پراڻي اڻ ادا خريداري کي 1 ڏينهن ٿيو',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 ڏينهن';

  @override
  String get duBucket1 => '30–60 ڏينهن';

  @override
  String get duBucket2 => '60+ ڏينهن';

  @override
  String get duTitle => 'بقايا مرڪز';

  @override
  String get duNoDues => 'ڪو بقايا ناهي 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count گراهڪن جو بقايا',
      one: '1 گراهڪ جو بقايا',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'سڀ کان پراڻي اڻ ادا بل کي $days ڏينهن ٿيا',
      one: 'سڀ کان پراڻي اڻ ادا بل کي 1 ڏينهن ٿيو',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount بقايا';
  }

  @override
  String get cpNoOutstanding => 'هن گراهڪ جو ڪو بقايا بيلنس ناهي';

  @override
  String get cpValidAmount => 'صحيح رقم داخل ڪريو';

  @override
  String cpExceeds(String amount) {
    return 'رقم بقايا بيلنس $amount کان وڌيڪ آهي';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name کان $amount وصول ٿيا';
  }

  @override
  String get cpOfflineSaved => 'آف لائن — ادائگي هن ڊوائيس تي محفوظ ٿي وئي، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندي';

  @override
  String cpOwes(String amount, String name) {
    return '$name جا $amount بقايا آهن. هي پهرين سڀ کان پراڻن اڻ ادا بلن تي لاڳو ٿيندو.';
  }

  @override
  String get cpAmountLabel => 'وصول ٿيل رقم (PKR)';

  @override
  String get cpCollect => 'وصول ڪريو';

  @override
  String get usNoItems => 'اپڊيٽ ڪرڻ لاءِ ڪا شيءِ ناهي.';

  @override
  String get usHelp => 'هر شيءِ جو نئون اسٽاڪ مقرر ڪريو، پوءِ سڀ محفوظ ڪريو دٻايو.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  موجوده: $qty';
  }

  @override
  String usNew(String qty) {
    return 'نئون: $qty';
  }

  @override
  String get usSubtract => '1 گھٽايو';

  @override
  String get usAdd => '1 وڌايو';

  @override
  String get usNoChanges => 'ڪا تبديلي ناهي';

  @override
  String usSaveAll(int count) {
    return 'سڀ محفوظ ڪريو ($count تبديل)';
  }

  @override
  String get srHint => 'گراهڪ، شيون، رقمون ڳوليو...';

  @override
  String get srFailed => 'ڳولا ناڪام — پنهنجو ڪنيڪشن چيڪ ڪريو.';

  @override
  String get srTitle => 'پنهنجي دڪان ۾ ڳوليو';

  @override
  String get srSubtitle => 'گراهڪن کي نالي يا فون سان، بلن کي رقم سان ڳوليو.';

  @override
  String srNoMatches(String query) {
    return '\"$query\" لاءِ ڪو نتيجو ناهي';
  }

  @override
  String get srTryDifferent => 'ڪو ٻيو نالو، فون نمبر يا رقم آزمايو.';

  @override
  String get srBills => 'بل';

  @override
  String get srNoItemList => 'شين جي فهرست ناهي';

  @override
  String get abAddAtLeastOne => 'گهٽ ۾ گهٽ هڪ شيءِ شامل ڪريو';

  @override
  String get abQuotationUpdated => 'ڪوٽيشن اپڊيٽ ٿي وئي!';

  @override
  String get abBillUpdated => 'بل اپڊيٽ ٿي ويو!';

  @override
  String get abQuotationSaved => 'ڪوٽيشن محفوظ ٿي وئي!';

  @override
  String get abBillCreated => 'بل ڪاميابي سان ٺهي ويو!';

  @override
  String abTotalAmount(String amount) {
    return 'ڪل: $amount';
  }

  @override
  String get abShare => 'شيئر ڪريو';

  @override
  String get abDoneReturn => 'ٿي ويو ۽ واپس';

  @override
  String get abOverLimitBody => 'هن سان گراهڪ پنهنجي ڪريڊٽ حد کان وڌي ويندو.';

  @override
  String get abOverLimitTitle => 'ڪريڊٽ حد کان وڌيڪ';

  @override
  String get abBillAnyway => 'تڏهن به بل ٺاهيو';

  @override
  String get abOfflineBill => 'آف لائن — بل هن ڊوائيس تي محفوظ ٿي ويو، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندو';

  @override
  String get abEditQuotation => 'ڪوٽيشن ۾ ترميم ڪريو';

  @override
  String get abEditBill => 'بل ۾ ترميم ڪريو';

  @override
  String get abNewQuotation => 'نئين ڪوٽيشن';

  @override
  String get abAddBill => 'بل شامل ڪريو';

  @override
  String get abCouldNotLoadItems => 'شيون لوڊ نه ٿي سگهيون.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'هن بل سان گراهڪ جو بيلنس $total ٿي ويندو، جيڪو هن جي $limit ڪريڊٽ حد کان وڌيڪ آهي.';
  }

  @override
  String get abTapAddItemBill => 'بل شروع ڪرڻ لاءِ هيٺ \"شيءِ شامل ڪريو\" دٻايو';

  @override
  String get abNoCatalog => 'ڪيٽلاگ ۾ اڃا ڪا شيءِ ناهي';

  @override
  String get abScan => 'اسڪين';

  @override
  String get abDiscountRs => 'رعايت (روپيا)';

  @override
  String get abSubtotal => 'ذيلي ڪل';

  @override
  String get abTotal => 'ڪل';

  @override
  String get abSaveAsQuotation => 'ڪوٽيشن طور محفوظ ڪريو';

  @override
  String get abQuotationLocked => 'موجوده بل کي واپس ڪوٽيشن نٿو بڻائي سگهجي';

  @override
  String get abQuotationNote => 'بل ۾ تبديل ٿيڻ تائين اسٽاڪ نه گهٽبو';

  @override
  String get abPaymentStatus => 'ادائگي جي حالت';

  @override
  String get abUnpaid => 'اڻ ادا ٿيل';

  @override
  String get abPaymentMethod => 'ادائگي جو طريقو';

  @override
  String get abCash => 'نقد';

  @override
  String get abBankTransfer => 'بئنڪ ٽرانسفر';

  @override
  String get abCheque => 'چيڪ';

  @override
  String get abSaveQuotation => 'ڪوٽيشن محفوظ ڪريو';

  @override
  String get abSaveBill => 'بل محفوظ ڪريو';

  @override
  String abAdded(String name) {
    return '$name شامل ٿي وئي';
  }

  @override
  String get apNewItem => 'نئين شيءِ…';

  @override
  String get apNewItemHint => 'پهرين ڪيٽلاگ ۾ نئين شيءِ شامل ڪريو';

  @override
  String get apOfflinePurchase => 'آف لائن — خريداري هن ڊوائيس تي محفوظ ٿي وئي، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندي';

  @override
  String get apEditPo => 'خريداري آرڊر ۾ ترميم ڪريو';

  @override
  String get apNewPo => 'نئون خريداري آرڊر';

  @override
  String get apAddPurchase => 'خريداري شامل ڪريو';

  @override
  String get apTapAddItem => 'خريداري شروع ڪرڻ لاءِ هيٺ \"شيءِ شامل ڪريو\" دٻايو';

  @override
  String get apSaveAsPo => 'خريداري آرڊر طور محفوظ ڪريو';

  @override
  String get apPoLocked => 'وصول ٿيل خريداري کي واپس مسودو آرڊر نٿو بڻائي سگهجي';

  @override
  String get apPoNote => 'سامان وصول نشان ٿيڻ تائين اسٽاڪ يا لاڳت نه بدلبي';

  @override
  String get apUnpaidCredit => 'اڻ ادا ٿيل (ادھار)';

  @override
  String get apSavePo => 'خريداري آرڊر محفوظ ڪريو';

  @override
  String get apSavePurchase => 'خريداري محفوظ ڪريو';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'موجوده لاڳت: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'لاڳت مقرر ناهي  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'اسڪين ناڪام: سرور جي غلطي $code';
  }

  @override
  String get scOfflineSaved => 'آف لائن — تصوير محفوظ ٿي وئي، آن لائن ٿيڻ تي پاڻمرادو پڙهي ويندي';

  @override
  String get scStillOffline => 'اڃا به آف لائن';

  @override
  String get scCouldNotCreateCustomer => 'گراهڪ ٺاهي نه سگهيو — ٻيهر ڪوشش ڪريو.';

  @override
  String get scCouldNotCreateSupplier => 'سپلائر ٺاهي نه سگهيو — ٻيهر ڪوشش ڪريو.';

  @override
  String scBillSavedFor(String name) {
    return '$name لاءِ بل محفوظ ٿي ويو';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name کان خريداري محفوظ ٿي وئي';
  }

  @override
  String get scWhichCustomer => 'هي ڪهڙو گراهڪ آهي؟';

  @override
  String get scWhichSupplier => 'هي ڪهڙو سپلائر آهي؟';

  @override
  String scClosestMatch(String name, int score) {
    return 'رڪارڊ ۾ سڀ کان ويجهو ميل: $name ($score% ملندڙ)';
  }

  @override
  String scYesThisIs(String name) {
    return 'ها، هي $name آهي';
  }

  @override
  String get scOtherwiseCustomer => 'نه ته نئون گراهڪ ٺاهيو:';

  @override
  String get scOtherwiseSupplier => 'نه ته نئون سپلائر ٺاهيو:';

  @override
  String get scNoMatchCustomer => 'ڪو ملندڙ گراهڪ نه مليو. نئون ٺاهيو:';

  @override
  String get scNoMatchSupplier => 'ڪو ملندڙ سپلائر نه مليو. نئون ٺاهيو:';

  @override
  String get scCustomerName => 'گراهڪ جو نالو';

  @override
  String get scSupplierName => 'سپلائر جو نالو';

  @override
  String get scCreateNew => 'نئون ٺاهيو';

  @override
  String get scTitleBill => 'بل اسڪين ڪريو';

  @override
  String get scIntroBill => 'بل جي تصوير ڪڍو. هٿ سان لکيل هجي ته به ٺيڪ آهي، ۽ سنڌي، اردو يا انگريزي سڀ هلن ٿيون. محفوظ ٿيڻ کان اڳ توهان ان کي ڏسي سگهندا.';

  @override
  String get scIntroPurchase => 'سپلائر جي انوائس جي تصوير ڪڍو. سنڌي، اردو يا انگريزي سڀ هلن ٿيون. محفوظ ٿيڻ کان اڳ توهان ان کي ڏسي سگهندا.';

  @override
  String get scReadingBill => 'بل پڙهيو پيو وڃي…';

  @override
  String get scScanBill => 'بل اسڪين ڪريو';

  @override
  String get scReadingInvoice => 'انوائس پڙهي پئي وڃي…';

  @override
  String get scScanInvoice => 'انوائس اسڪين ڪريو';

  @override
  String get scQueued => 'قطار ۾ اسڪين';

  @override
  String get scReady => 'جاچ لاءِ تيار';

  @override
  String get scFailed => 'ناڪام';

  @override
  String get scWaiting => 'ڪنيڪشن جو انتظار';

  @override
  String get scRetry => 'ٻيهر ڪوشش ڪريو';

  @override
  String rpCouldNotLoad(String error) {
    return 'رپورٽون لوڊ نه ٿي سگهيون: $error';
  }

  @override
  String get rpHeadline => 'هن مهيني جا اهم انگ';

  @override
  String get rpProfitThisMonth => 'هن مهيني جو نفعو';

  @override
  String get rpNoData => 'اڃا ڪو ڊيٽا ناهي';

  @override
  String get rpSalesTax => 'سيلز ٽيڪس';

  @override
  String rpSalesTaxFor(String month) {
    return '$month جي سيلز ٽيڪس رپورٽ';
  }

  @override
  String get rpViewSalesTax => 'سيلز ٽيڪس رپورٽ ڏسو';

  @override
  String get rpQuickReports => 'تڪڙيون رپورٽون';

  @override
  String get rpQuickSub => 'سڌو ڪنهن خاص رپورٽ تي وڃو';

  @override
  String get expensesTitle => 'خرچ';

  @override
  String get rpRateCard => 'ريٽ ڪارڊ';

  @override
  String get rpDetails => 'تفصيل';

  @override
  String get rpDetailsSub => 'مڪمل تفصيل ۽ درجه بندي';

  @override
  String get rpOutstandingByCustomer => 'گراهڪ موجب بقايا';

  @override
  String get rpNoOutstanding => 'ڪو بقايا بيلنس ناهي';

  @override
  String get rpMonthlyTotals => 'مهيني وار ڪل';

  @override
  String get rpMostSold => 'سڀ کان وڌيڪ وڪرو ٿيندڙ شيون';

  @override
  String get rpNoItemsRecorded => 'اڃا ڪا شيءِ رڪارڊ نه ٿي آهي';

  @override
  String get rpTopCustomers => 'آمدني موجب مٿيان گراهڪ';

  @override
  String get rpNoSalesRecorded => 'اڃا ڪو وڪرو رڪارڊ نه ٿيو آهي';

  @override
  String get rpTotalOutstanding => 'ڪل بقايا';

  @override
  String get rpViewCustomers => 'گراهڪ ڏسو';

  @override
  String get lblInvoice => 'انوائس';

  @override
  String get lblLedger => 'کاتو';

  @override
  String get lblRateCard => 'ريٽ ڪارڊ';

  @override
  String get exCsvNeedsRows => 'CSV ۾ هيڊر قطار کانسواءِ گهٽ ۾ گهٽ هڪ خرچ هجڻ گهرجي.';

  @override
  String get exCsvHeader => 'CSV هيڊر ۾ \"description\" ۽ \"amount\" ڪالم هجڻ گهرجن.';

  @override
  String exLineBadAmount(int line) {
    return 'لائن $line: تفصيل غائب يا رقم غلط — فائل درست ڪري ٻيهر ڪوشش ڪريو.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'لائن $line: غلط تاريخ \"$date\" — YYYY-MM-DD استعمال ڪريو.';
  }

  @override
  String get exImportTitle => 'خرچ امپورٽ ڪريو';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" ۾ $count خرچ مليا. سڀ امپورٽ ڪجن؟',
      one: '\"$file\" ۾ 1 خرچ مليو. سڀ امپورٽ ڪجن؟',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خرچ امپورٽ ٿيا.',
      one: '1 خرچ امپورٽ ٿيو.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'امپورٽ ناڪام: سرور جي غلطي $code';
  }

  @override
  String get exDeleteTitle => 'خرچ ڊليٽ ڪريو';

  @override
  String get exAdd => 'خرچ شامل ڪريو';

  @override
  String get exEdit => 'خرچ ۾ ترميم ڪريو';

  @override
  String get exDescription => 'تفصيل';

  @override
  String get exAmountRs => 'رقم (روپيا)';

  @override
  String get exCategory => 'درجو';

  @override
  String exDate(String date) {
    return 'تاريخ: $date';
  }

  @override
  String get exRepeats => 'هر مهيني ورجايو';

  @override
  String get exRepeatsHint => 'ڀاڙو، بجلي، اجرت وغيره';

  @override
  String get exReceiptTap => 'رسيد جي تصوير، بدلائڻ لاءِ ٽيپ ڪريو';

  @override
  String get exReceiptOptional => 'رسيد جي تصوير (اختياري)';

  @override
  String get exEnterValid => 'تفصيل ۽ صحيح رقم داخل ڪريو.';

  @override
  String get exOffline => 'آف لائن — خرچ هن ڊوائيس تي محفوظ ٿي ويو، آن لائن ٿيڻ تي پاڻمرادو سنڪ ٿي ويندو';

  @override
  String get exSave => 'خرچ محفوظ ڪريو';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'هن مهيني $count ورجائجندڙ خرچ ادا ڪرڻا آهن',
      one: 'هن مهيني 1 ورجائجندڙ خرچ ادا ڪرڻو آهي',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'شامل ڪريو';

  @override
  String get exTotal => 'ڪل خرچ';

  @override
  String exCategoryChip(String name) {
    return 'درجو: $name';
  }

  @override
  String get exNoneLogged => 'اڃا ڪو خرچ رڪارڊ نه ٿيو آهي';

  @override
  String exNoneInCategory(String name) {
    return 'اڃا $name جو ڪو خرچ ناهي';
  }

  @override
  String get exViewReceipt => 'رسيد ڏسو';

  @override
  String get exEditRow => 'خرچ ۾ ترميم ڪريو';

  @override
  String get exDeleteRow => 'خرچ ڊليٽ ڪريو';

  @override
  String gstServerReturned(String first, String second) {
    return 'سرور $first/$second واپس ڪيو';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST ڊيٽا لوڊ نه ٿي سگهي: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'ڊائونلوڊ ناڪام ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename محفوظ ٿي وئي';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'ڊائونلوڊس/$filename ۾ محفوظ ٿي وئي';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'ڊائونلوڊ نه ٿي سگهيو: $error';
  }

  @override
  String get gstTitle => 'سيلز ٽيڪس رپورٽ';

  @override
  String get gstOutwardDetail => 'ٻاهريون وڪرو — انوائس جو تفصيل';

  @override
  String get gstNoBills => 'هن مهيني ڪو بل ناهي.';

  @override
  String get gstHsn => 'HSN خلاصو';

  @override
  String get gstInvoiceWise => 'انوائس وار تفصيل';

  @override
  String get gstMonthly => 'مهيني وار خلاصو';

  @override
  String get gstOutwardTaxable => 'ٽيڪس لائق ٻاهريون سپلائي';

  @override
  String get gstItc => 'ان پٽ ٽيڪس ڪريڊٽ (خريدارين مان)';

  @override
  String get gstSave => 'محفوظ ڪريو';

  @override
  String get rcValidAmount => 'صحيح رقم داخل ڪريو.';

  @override
  String get rcExpected => 'متوقع نقد (اڄ جو نقد وڪرو)';

  @override
  String get rcAlsoCollected => 'اڄ وصول به ٿيو (دراز ۾ ڳڻيو نه ويو)';

  @override
  String get rcCounted => 'دراز ۾ ڳڻيل نقد (روپيا)';

  @override
  String get rcCompare => 'ڀيٽ ڪريو';

  @override
  String get rcMatches => 'بلڪل ملي ٿو!';

  @override
  String rcExtra(String amount) {
    return 'دراز ۾ $amount وڌيڪ';
  }

  @override
  String rcMissing(String amount) {
    return 'دراز ۾ $amount گهٽ';
  }

  @override
  String get pbiTitle => 'شيءِ موجب نفعو';

  @override
  String get pbiNoSales => 'اڃا ڪو وڪرو ناهي';

  @override
  String get pbiByCategory => 'درجي موجب';

  @override
  String get pbiItemsByProfit => 'نفعي موجب شيون';

  @override
  String get svTitle => 'اسٽاڪ جي قيمت';

  @override
  String get svNone => 'ڪو اسٽاڪ ناهي';

  @override
  String get svItemsByValue => 'قيمت موجب شيون';

  @override
  String svSummary(String items, String units) {
    return '$items شيون · شيلف تي $units يونٽ';
  }

  @override
  String svTied(String amount) {
    return 'اسٽاڪ ۾ $amount ڦاٿل آهن';
  }

  @override
  String get svEstimated => 'وڪري جي قيمت مان اندازو';

  @override
  String get bkRestoreTitle => 'بيڪ اپ بحال ڪجي؟';

  @override
  String bkRestoreBody(String filename) {
    return 'هي سڀ موجوده ڊيٽا کي بيڪ اپ فائل \"$filename\" سان بدلائي ڇڏيندو. جاري رکجي؟';
  }

  @override
  String get bkRestore => 'بحال ڪريو';

  @override
  String get bkRestoreDoneTitle => 'بحالي مڪمل';

  @override
  String get bkRestoreDoneBody => 'توهان جو ڊيٽا بحال ٿي ويو آهي.';

  @override
  String get bkOk => 'ٺيڪ آهي';

  @override
  String bkRestoreFailed(String detail) {
    return 'بحالي ناڪام: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'بحال نه ٿي سگهيو: $error';
  }

  @override
  String get bkSaveToDownloads => 'ڊائونلوڊس ۾ محفوظ ڪريو';

  @override
  String get bkIntroAdmin => 'توهان جو سڀ ڊيٽا هڪ ڊيٽابيس فائل ۾ آهي. باقاعدگي سان هڪ ڪاپي ڊائونلوڊ ڪريو، ۽ ڪجهه خراب ٿئي ته بحال ڪريو.';

  @override
  String get bkIntroStaff => 'مڪمل ڊيٽابيس بيڪ اپ ۽ بحالي صرف ايڊمن لاءِ آهي. ايڊمن کي چئو، يا جيڪو گهرجي اهو هيٺ CSV ۾ ايڪسپورٽ ڪريو.';

  @override
  String get bkBackupDb => 'ڊيٽابيس جو بيڪ اپ';

  @override
  String get bkBackupDbSub => 'سمورو ڊيٽابيس هڪ فائل ۾ ڊائونلوڊ ڪري شيئر ڪريو (واٽس ايپ، ڊرائيو، اي ميل).';

  @override
  String get bkDownloadPhone => 'بيڪ اپ فون ۾ ڊائونلوڊ ڪريو';

  @override
  String get bkShareBackup => 'بيڪ اپ شيئر ڪريو';

  @override
  String get bkAutoTitle => 'خودڪار بيڪ اپ';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'سرور تي $count روزانا بيڪ اپ محفوظ آهن، تازو $time جو. اهي پاڻمرادو هلن ٿا — هتي ڪجهه ڪرڻ جي ضرورت ناهي.',
      one: 'سرور تي 1 روزانو بيڪ اپ محفوظ آهي، تازو $time جو. هي پاڻمرادو هلندو آهي — هتي ڪجهه ڪرڻ جي ضرورت ناهي.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'موجوده ڊيٽا بدلائڻ لاءِ محفوظ ٿيل بيڪ اپ فائل چونڊيو.';

  @override
  String get bkRestoreFromFile => 'بيڪ اپ فائل مان بحال ڪريو';

  @override
  String get bkExportCsv => 'CSV ۾ ايڪسپورٽ ڪريو';

  @override
  String get bkExportSub => 'انهن کي ايڪسل ۾ کوليو يا شيئر ڪريو.';

  @override
  String get bkRangeAll => 'بل/خرچ: سڀ وقت';

  @override
  String bkRangeSome(String end, String start) {
    return 'بل/خرچ: $start کان $end تائين';
  }

  @override
  String get bkSetRange => 'حد مقرر ڪريو';

  @override
  String get bkClearRange => 'حد هٽايو';

  @override
  String get ntNever => 'ڪڏهن به نه هليو';

  @override
  String get ntJustNow => 'هاڻي ئي';

  @override
  String ntMinutesAgo(int count) {
    return '$count منٽ اڳ';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count ڪلاڪ اڳ';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count ڏينهن اڳ';
  }

  @override
  String get ntTitle => 'سمارٽ نوٽيفڪيشن';

  @override
  String get ntTapHint => 'نوٽيفڪيشن هلائڻ ۽ لائيو نتيجا ڏسڻ لاءِ \"هاڻي چيڪ ڪريو\" دٻايو.';

  @override
  String get ntLowStockSub => 'شيون ٻيهر آرڊر جي سطح کان هيٺ وڃن ته ڄاڻ ڏيو.';

  @override
  String get ntCheckNow => 'هاڻي چيڪ ڪريو';

  @override
  String get ntOverdue => 'دير سان ادائگي جون ياد ڏياريندڙون';

  @override
  String get ntOverdueSub => 'اڳين ڏينهن جي اڻ ادا ٿيل بلن بابت ڄاڻ ڏيو.';

  @override
  String get ntDaily => 'روزانو ڪاروباري خلاصو';

  @override
  String get ntDailySub => 'ڪالهه جو وڪرو، وصولي ۽ نفعو هڪ نظر ۾.';

  @override
  String get ntSendSummary => 'خلاصو موڪليو';

  @override
  String get ntRunning => 'هلي رهيو آهي…';

  @override
  String get ntLowStockItems => 'گهٽ اسٽاڪ وارا شيون';

  @override
  String get ntSales => 'وڪرو';

  @override
  String get ntCollected => 'وصول ٿيل';

  @override
  String get ntProfit => 'نفعو';

  @override
  String get auChecking => 'اپڊيٽون چيڪ ٿي رهيون آهن…';

  @override
  String get auLatest => 'توهان وٽ تازو ورزن آهي.';

  @override
  String get auAvailable => 'اپڊيٽ موجود آهي';

  @override
  String auNewer(int code) {
    return 'Book-Keep جو نئون ورزن (بلڊ $code) تيار آهي.';
  }

  @override
  String get auLater => 'پوءِ';

  @override
  String get auUpdate => 'اپڊيٽ ڪريو';

  @override
  String get auDownloading => 'اپڊيٽ ڊائونلوڊ ٿي رهي آهي';

  @override
  String auSaved(String name) {
    return '$name توهان جي ڊائونلوڊس فولڊر ۾ محفوظ ٿي وئي.';
  }

  @override
  String get auAllowInstall => 'Book-Keep کي ايپس انسٽال ڪرڻ جي اجازت ڏيو، پوءِ ٻيهر اپڊيٽ دٻايو.';

  @override
  String get auFailed => 'اپڊيٽ نه ٿي سگهي — پنهنجو ڪنيڪشن چيڪ ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String get lgSearch => 'ٻوليون ڳوليو';

  @override
  String lgNoMatch(String query) {
    return '\"$query\" سان ڪا ٻولي نٿي ملي';
  }

  @override
  String get alVoided => 'بل رد ڪيو';

  @override
  String get alDeletedBill => 'بل ڊليٽ ڪيو';

  @override
  String get alReturned => 'بل واپس ڪيو';

  @override
  String get alDeletedCustomer => 'گراهڪ ڊليٽ ڪيو';

  @override
  String get alDeletedSupplier => 'سپلائر ڊليٽ ڪيو';

  @override
  String get alCreatedAccount => 'اڪائونٽ ٺاهيو';

  @override
  String get alUpdatedAccount => 'اڪائونٽ اپڊيٽ ڪيو';

  @override
  String get alDeletedAccount => 'اڪائونٽ ڊليٽ ڪيو';

  @override
  String get alTitle => 'سرگرمي لاگ';

  @override
  String get alNone => 'اڃا ڪا سرگرمي رڪارڊ نه ٿي آهي';

  @override
  String get blkEnterOne => 'گهٽ ۾ گهٽ هڪ شيءِ داخل ڪريو';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count شيون ڪاميابي سان شامل ٿيون',
      one: '1 شيءِ ڪاميابي سان شامل ٿي وئي',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'هڪ ئي وقت شيون شامل ڪريو';

  @override
  String get blkFormat => 'هر لائن ۾ هڪ شيءِ، فارميٽ: نالو، قيمت، اکائي، درجو';

  @override
  String get blkOptional => 'اکائي ۽ درجو اختياري آهن (ڊفالٽ: piece، ڪو نه)';

  @override
  String get blkAddAll => 'سڀ شيون شامل ڪريو';

  @override
  String get prSend => 'ادائگي جي ياد ڏياريندڙ موڪليو';

  @override
  String get prTone => 'لهجو چونڊيو:';

  @override
  String get prPolite => 'شائسته';

  @override
  String get prStandard => 'معياري';

  @override
  String get prUrgent => 'تڪڙو';

  @override
  String get prPreviewQr => 'جاز ڪيش ادائگي QR جو نمونو';

  @override
  String get prShareText => 'متن شيئر ڪريو';

  @override
  String get dsRemaining => 'باقي';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount رعايت شامل آهي';
  }

  @override
  String get dsItems => 'شيون';

  @override
  String get dsDiscount => 'رعايت';

  @override
  String get lkWrongPin => 'غلط PIN';

  @override
  String get lkEnterPin => 'PIN داخل ڪريو';

  @override
  String get lkChecking => 'آڱر جو نشان چيڪ ٿي رهيو آهي...';

  @override
  String get bcTitle => 'بارڪوڊ اسڪين ڪريو';

  @override
  String get bcTorchNa => 'هن ڊوائيس تي ٽارچ موجود ناهي';

  @override
  String get bcTorch => 'ٽارچ';

  @override
  String get bcPoint => 'ڪئميرا بارڪوڊ ڏانهن ڪريو';

  @override
  String get qrNoNumber => 'ڪو جاز ڪيش نمبر مقرر ناهي. ادائگي QR ڏيکارڻ لاءِ ان کي سيٽنگز ۾ مقرر ڪريو.';

  @override
  String get qrPay => 'جاز ڪيش سان ادائگي ڪريو';

  @override
  String get qrInvalid => 'غلط QR ڊيٽا';

  @override
  String qrAmount(String amount) {
    return 'رقم: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'جاز ڪيش: $number';
  }

  @override
  String get qrCopy => 'جاز ڪيش نمبر ڪاپي ڪريو';

  @override
  String get qrCopied => 'جاز ڪيش نمبر ڪلپ بورڊ ۾ ڪاپي ٿي ويو';

  @override
  String get qrHint => 'ادائگي لاءِ هي نمبر پنهنجي جاز ڪيش ايپ ۾ اسڪين يا ڪاپي ڪريو.';

  @override
  String clOwed(String amount) {
    return '$amount بقايا';
  }

  @override
  String get lnEnterEmailFirst => 'پهرين مٿي صحيح اي ميل داخل ڪريو.';

  @override
  String get lnResetSent => 'پاسورڊ ري سيٽ اي ميل موڪلي وئي — پنهنجو ان باڪس ڏسو.';

  @override
  String get lnNoAccount => 'ان اي ميل جو ڪو اڪائونٽ نه مليو.';

  @override
  String get lnWrongPassword => 'پاسورڊ غلط آهي.';

  @override
  String get lnInvalidEmail => 'هي صحيح اي ميل پتو نٿو لڳي.';

  @override
  String get lnDisabled => 'هي اڪائونٽ بند ڪيو ويو آهي.';

  @override
  String get lnTooMany => 'تمام گهڻيون ڪوششون — هڪ منٽ کان پوءِ ٻيهر ڪوشش ڪريو.';

  @override
  String get lnNoInternet => 'انٽرنيٽ ڪنيڪشن ناهي.';

  @override
  String get lnWeakPassword => 'پاسورڊ گهٽ ۾ گهٽ 6 اکرن جو هئڻ گهرجي.';

  @override
  String get lnCouldNotSignIn => 'سائن ان نه ٿي سگهيو. مهرباني ڪري ٻيهر ڪوشش ڪريو.';

  @override
  String get lnWrongPasswordHint => 'پاسورڊ غلط آهي. ٻيهر ڪوشش ڪريو يا \"پاسورڊ وسري ويو؟\" دٻايو.';

  @override
  String get lnWrongEmail => 'اي ميل غلط آهي — ان پتي جو ڪو اڪائونٽ ناهي.';

  @override
  String get lnWrongEmailOrPassword => 'اي ميل يا پاسورڊ غلط آهي.';

  @override
  String get lnWrongUsername => 'يوزرنيم غلط آهي — ان نالي جو ڪو اڪائونٽ ناهي.';

  @override
  String get lnWelcome => 'واپسي تي ڀليڪار';

  @override
  String lnSignInTo(String app) {
    return '$app ۾ سائن ان ڪريو';
  }

  @override
  String get lnEmailOrUsername => 'اي ميل يا يوزرنيم';

  @override
  String get lnRemember => 'مون کي ياد رکو';

  @override
  String get lnForgot => 'پاسورڊ وسري ويو؟';

  @override
  String get lnSignIn => 'سائن ان';

  @override
  String get lnGoogle => 'Google سان جاري رکو';

  @override
  String get lnNew => 'نوان آهيو؟';

  @override
  String get lnCreate => 'اڪائونٽ ٺاهيو';

  @override
  String suCreated(String email) {
    return '$email لاءِ اڪائونٽ ٺهي ويو. تصديق واري اي ميل موڪلي وئي آهي (اختياري).';
  }

  @override
  String suSetup(String app) {
    return '$app سيٽ ڪريو';
  }

  @override
  String get suName => 'نالو';

  @override
  String get suEmail => 'اي ميل';

  @override
  String suPhoneDigits(int digits) {
    return 'صحيح $digits انگن وارو نمبر داخل ڪريو';
  }

  @override
  String get suCreateBtn => 'اڪائونٽ ٺاهيو';

  @override
  String get suHaveAccount => 'اڳ ۾ ئي اڪائونٽ آهي؟';

  @override
  String get suAlreadyExists => 'ان اي ميل جو اڪائونٽ اڳ ۾ ئي موجود آهي.';

  @override
  String get suInvalidEmail => 'اي ميل پتو صحيح ناهي.';

  @override
  String get agShow => 'پاسورڊ ڏيکاريو';

  @override
  String get agHide => 'پاسورڊ لڪايو';

  @override
  String get adAccounts => 'اڪائونٽ';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count رجسٽرڊ اڪائونٽ',
      one: '1 رجسٽرڊ اڪائونٽ',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'شامل ڪريو';

  @override
  String get adNoAccounts => 'ڪو اڪائونٽ نه مليو.';

  @override
  String get adAccountability => 'جوابدهي';

  @override
  String get adAccountabilitySub => 'ڪنهن ڇا رد، ڊليٽ يا واپس ڪيو، ۽ اڪائونٽ ۾ تبديليون.';

  @override
  String get adActivitySub => 'رد ٿيل بل، ڊليٽ ۽ اڪائونٽ ۾ تبديليون';

  @override
  String get adServer => 'سرور';

  @override
  String get adServerSub => 'هي ايپ ڪنهن سان ڳالهائي ٿي. سيٽ اپ کان پوءِ گهٽ ئي بدلائڻ جي ضرورت پوي ٿي.';

  @override
  String get adServerHint => 'ايمولیٽر 10.0.2.2 استعمال ڪري ٿو؛ حقيقي فون کي ساڳئي وائي فائي تي ليپ ٽاپ جو IP گهرجي. ان کي بدلائڻ سان هر اڪائونٽ تي اثر پوي ٿو.';

  @override
  String get adApiBase => 'API بيس URL';

  @override
  String get adSaveServer => 'سرور جو پتو محفوظ ڪريو';

  @override
  String get adEmailSetSub => 'سيٽ ٿيل آهي — عملو گراهڪن کي انوائس/اسٽيٽمينٽ اي ميل ڪري سگهي ٿو.';

  @override
  String get adNotSetUp => 'اڃا سيٽ ناهي.';

  @override
  String get adEmailSetBody => 'اي ميل سيٽ ٿيل آهي. عملو سڌو گراهڪ کي انوائس يا اسٽيٽمينٽ اي ميل ڪري سگهي ٿو.';

  @override
  String get adEmailHelp => 'Gmail پتو ايپ پاسورڊ سان ڪم ڪري ٿو (smtp.gmail.com، پورٽ 587)، يا پنهنجي اي ميل فراهم ڪندڙ جا SMTP تفصيل استعمال ڪريو.';

  @override
  String get adSmtpHost => 'SMTP هوسٽ';

  @override
  String get adSmtpPort => 'SMTP پورٽ';

  @override
  String get adEmailAddress => 'اي ميل پتو';

  @override
  String get adPwKeep => 'پاسورڊ (موجوده رکڻ لاءِ خالي ڇڏيو)';

  @override
  String get adPwApp => 'پاسورڊ (ايپ پاسورڊ، لاگ ان پاسورڊ نه)';

  @override
  String get adFromName => 'موڪلڻ وارو نالو (اختياري)';

  @override
  String get adFromHint => 'منهنجو هارڊويئر دڪان';

  @override
  String get adSaving => 'محفوظ ٿي رهيو آهي...';

  @override
  String get adSaveEmail => 'اي ميل سيٽنگون محفوظ ڪريو';

  @override
  String get adAddAccount => 'اڪائونٽ شامل ڪريو';

  @override
  String get adNameOpt => 'نالو (اختياري)';

  @override
  String get adAtLeast6 => 'گهٽ ۾ گهٽ 6 اکر';

  @override
  String get adGrantAdmin => 'ايڊمن بڻايو';

  @override
  String get adCanManage => 'رد/ڊليٽ/واپس ڪري سگهي ٿو';

  @override
  String get adCanManageHint => 'بل رد يا ڊليٽ ڪرڻ، بل واپس ڪرڻ، يا گراهڪ/سپلائر ڊليٽ ڪرڻ. ايڊمن وٽ اهو هميشه هوندو آهي.';

  @override
  String get adCreate => 'ٺاهيو';

  @override
  String get adAccountCreated => 'اڪائونٽ ٺهي ويو.';

  @override
  String adCreateFailed(String error) {
    return 'ٺاهڻ ناڪام: $error';
  }

  @override
  String get adEditAccount => 'اڪائونٽ ۾ ترميم ڪريو';

  @override
  String get adAdminSwitch => 'ايڊمن';

  @override
  String get adAdminHint => 'ايڊمن پينل کولي سگهي ٿو';

  @override
  String get adDisabled => 'بند';

  @override
  String get adDisabledHint => 'سائن ان کان روڪيل';

  @override
  String get adAccountUpdated => 'اڪائونٽ اپڊيٽ ٿي ويو.';

  @override
  String adUpdateFailed(String error) {
    return 'اپڊيٽ ناڪام: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label هميشه لاءِ هٽايو ويندو ۽ وڌيڪ سائن ان نه ڪري سگهندو.';
  }

  @override
  String get adAccountDeleted => 'اڪائونٽ ڊليٽ ٿي ويو.';

  @override
  String adDeleteFailed(String error) {
    return 'ڊليٽ ناڪام: $error';
  }

  @override
  String get adBadgeAdmin => 'ايڊمن';

  @override
  String get adBadgeDisabled => 'بند';

  @override
  String get adOff => 'ايڊمن پينل بند آهي';

  @override
  String get adCheckAgain => 'ٻيهر چيڪ ڪريو';

  @override
  String get adAccessRequired => 'ايڊمن رسائي ضروري آهي';

  @override
  String get adAccessBody => 'صرف دڪان جا ايڊمن اڪائونٽ سنڀالي سگهن ٿا. دڪان جي مالڪ کان ايڊمن رسائي گهرو.';

  @override
  String get adCouldNotLoad => 'ايڊمن پينل لوڊ نه ٿي سگهيو.';

  @override
  String get adBadPort => 'صحيح SMTP پورٽ نمبر داخل ڪريو.';

  @override
  String get adEmailSaved => 'اي ميل سيٽنگون محفوظ ٿي ويون.';

  @override
  String adEmailSaveFailed(String error) {
    return 'اي ميل سيٽنگون محفوظ نه ٿي سگهيون: $error';
  }

  @override
  String get adServerEmpty => 'سرور جو پتو خالي نٿو ٿي سگهي.';

  @override
  String get adServerSaved => 'سرور جو پتو محفوظ ٿي ويو. اسڪرينون ايندڙ لوڊ تي ان کي استعمال ڪنديون.';

  @override
  String get lnOr => 'يا';

  @override
  String get scNotABill => 'هي بل نٿو لڳي. بل جي صاف تصوير سان ٻيهر ڪوشش ڪريو.';

  @override
  String get scNotAnInvoice => 'هي انوائس نٿي لڳي. سپلائر جي انوائس جي صاف تصوير سان ٻيهر ڪوشش ڪريو.';

  @override
  String get jqOpenFull => 'وڏو ڪريو';

  @override
  String get jqCopy => 'نمبر ڪاپي ڪريو';

  @override
  String get jqSheetTitle => 'جاز ڪيش QR';

  @override
  String get jqSheetHint => 'گراهڪ ادائگي لاءِ ان کي پنهنجي جاز ڪيش ايپ ۾ اسڪين ڪن ٿا.';

  @override
  String get jqCheck => 'نمبر ٻيهر ڏسو';

  @override
  String get askVoice => 'آواز';

  @override
  String get askVoiceFallbackNote => 'هي توهان جي فون جي آواز ۾ پڙهيو پيو وڃي.';

  @override
  String get askPace => 'رفتار';

  @override
  String get askTone => 'لهجو';

  @override
  String get askPaceSlower => 'آهستي';

  @override
  String get askPaceNormal => 'عام';

  @override
  String get askPaceFaster => 'تيز';

  @override
  String get askToneCalm => 'پرسڪون';

  @override
  String get askToneWarm => 'نرم';

  @override
  String get askToneCheerful => 'خوشمزاج';

  @override
  String qPaymentUpdate(String amount) {
    return 'ادائيگي اپڊيٽ: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'گراهڪ: $name';
  }

  @override
  String qSupplier(String name) {
    return 'سپلائر: $name';
  }

  @override
  String qItem(String name) {
    return 'شيءِ: $name';
  }

  @override
  String qExpense(String name) {
    return 'خرچ: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'خريداري: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$name کان ادائيگي ملي: $amount';
  }

  @override
  String gstAmount(String amount) {
    return 'ٽيڪس $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'ٽيڪس لاڳو رقم $taxable  ·  ٽيڪس $tax  ·  ڪل $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'آمدني: $revenue  •  مال جي لاڳت: $cogs  •  خرچ: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'ڀليڪار $customer، $shop ڏانهن کان سلام! توهان جو ڪل بقايا $amount آهي. مهرباني!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'ڀليڪار $customer، $shop طرفان $amount جي بقايا رقم جي ادائيگي جي ياد ڏياريندڙ. مهرباني ڪري جلد ادا ڪريو.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'اهم اطلاع: پيارا $customer، $shop ۾ توهان جي $amount جي بقايا ادائيگي رهيل آهي. مهرباني ڪري فوري ادا ڪريو.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCash ذريعي ادا ڪريو: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop طرفان بل\nڪل: $total\nشيون: $items\nحالت: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'ڀليڪار $supplier، مان $shop کان ڳالهائي رهيو آهيان. اسين هيٺين شين جو آرڊر ڏيڻ چاهيون ٿا:\n$lines\n\nمهرباني ڪري دستيابي ۽ قيمت جي تصديق ڪريو. مهرباني.';
  }

  @override
  String ppUpdated(String date) {
    return 'آخري تازه ڪاري: $date';
  }

  @override
  String get ppWhoH => 'اسين ڪير آهيون';

  @override
  String ppWho(String owner, String email) {
    return '$owner، جيڪو Book-keep هلائي ٿو.\nرابطو: $email';
  }

  @override
  String get ppCollectH => 'اسين ڇا گڏ ڪريون ٿا';

  @override
  String get ppCollectAccount => 'اڪائونٽ: اي ميل، فون نمبر ۽ يوزرنيم، Firebase Authentication ذريعي.';

  @override
  String get ppCollectShop => 'دڪان جي پروفائل: دڪان جو نالو، پتو، فون نمبر، JazzCash نمبر ۽ دڪان جو لوگو، جيڪي دڪان جو مالڪ سيٽنگز ۾ داخل ڪري ٿو.';

  @override
  String get ppCollectRecords => 'ڪاروباري رڪارڊ جيڪي توهان ٺاهيو ٿا: گراهڪن ۽ سپلائرن جا نالا ۽ فون نمبر، بل، خريداريون، شين جي فهرست (شين جون تصويرون ۽ بارڪوڊ سميت) ۽ خرچ (رسيدن جون تصويرون سميت). هي ايپ جو بنيادي ڊيٽا آهي — حساب ڪتاب اهڙي طرح هلندو آهي.';

  @override
  String get ppCollectDevice => 'ڊوائيس ۽ تشخيصي ڊيٽا: پش نوٽيفڪيشن ٽوڪن (گهٽ اسٽاڪ، بقايا ادائگين ۽ روزاني خلاصي جي الرٽس لاءِ) ۽ ڪريش رپورٽون (ڊوائيس جي معلومات ۽ اسٽيڪ ٽريس) Firebase Crashlytics ذريعي، جيڪي ايپ ڪريش ٿيڻ تي پاڻمرادو موڪليون وڃن ٿيون.';

  @override
  String ppCollectAi(String askShop) {
    return 'AI خاصيتون: $askShop، AI صبح جو خلاصو ۽ AI بل/خريداري اسڪينر لاڳاپيل ڪاروباري ڊيٽا جو هڪ نمونو (رپورٽ جا انگ يا بل جي تصوير) Google جي Gemini API کي موڪلين ٿا ته جواب، خلاصو يا ڪڍيل لائينون ٺاهي سگهجن. هي ڊيٽا Google جواب ٺاهڻ لاءِ پروسيس ڪري ٿو؛ اسين ۽ Google ان کي Google جي معياري API شرطن کان ٻاهر ماڊل تربيت لاءِ استعمال نٿا ڪريون.';
  }

  @override
  String get ppDontH => 'اسين ڇا نٿا ڪريون';

  @override
  String get ppDontLocation => 'اسين توهان جي لوڪيشن کي ٽريڪ نٿا ڪريون.';

  @override
  String get ppDontAds => 'اسين اشتهاري نيٽ ورڪ يا رويي جي تجزيي/سيشن رڪارڊنگ جا اوزار استعمال نٿا ڪريون.';

  @override
  String get ppDontSell => 'اسين توهان جو ڊيٽا يا توهان جي گراهڪن جو ڊيٽا ڪنهن کي به نٿا وڪڻون.';

  @override
  String get ppWhereH => 'ڊيٽا ڪٿي رهي ٿو';

  @override
  String get ppWhereDb => 'ڊيٽابيس: Neon (Postgres)، ٽئين ڌر جو ڪلائوڊ ڊيٽابيس فراهم ڪندڙ.';

  @override
  String get ppWhereFirebase => 'تصديق، پش نوٽيفڪيشن، ڪريش رپورٽون، تصويرن جو اسٽوريج: Firebase (Google).';

  @override
  String get ppWhereAi => 'AI پروسيسنگ: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'انوائس اي ميلون: ان SMTP اڪائونٽ ذريعي موڪليون وڃن ٿيون جيڪو توهان جي دڪان جو ايڊمن $adminPanel ۾ ترتيب ڏئي ٿو. اسان وٽ ڪا ميلنگ لسٽ ناهي؛ هي اي ميلون توهان جي پنهنجن گراهڪن کي انفرادي بل/اسٽيٽمينٽ آهن، وڏي پيماني تي مارڪيٽنگ نه.';
  }

  @override
  String get ppYoursH => 'توهان جو ڊيٽا، توهان جي گراهڪن جو ڊيٽا';

  @override
  String get ppYours => 'جيڪو ڪجهه توهان داخل ڪريو ٿا — گراهڪ، سپلائر، بل، شيون — توهان جي دڪان جي ملڪيت آهي. Book-keep استعمال ڪندڙ ٻيا دڪان ان کي نٿا ڏسي سگهن. توهان جا ٺاهيل اسٽاف اڪائونٽ رڳو اهو ڏسن ٿا جنهن جي توهان کين رسائي ڏيو.';

  @override
  String get ppControlsH => 'توهان جا اختيار';

  @override
  String ppControlExport(String path) {
    return 'پنهنجو ڊيٽا ايڪسپورٽ يا بيڪ اپ ڪريو: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'پنهنجو اڪائونٽ ڊليٽ ڪريو: $path. هن سان رڳو توهان جون سائن ان سنديون هٽن ٿيون؛ توهان جي دڪان جا ڪاروباري رڪارڊ (بل، گراهڪ، شيون وغيره) نٿا مٽجن، جيئن اسٽاف ميمبر کي هٽائڻ سان سندس ٺاهيل رڪارڊ نٿا مٽجن.';
  }

  @override
  String ppControlNotif(String path) {
    return 'نوٽيفڪيشنون: $path ۾ قسم موجب بند ڪري سگهجن ٿيون.';
  }

  @override
  String get ppChildrenH => 'ٻار';

  @override
  String get ppChildren => 'Book-keep دڪان مالڪن ۽ عملي لاءِ هڪ ڪاروباري اوزار آهي. هي ٻارن لاءِ ناهي ۽ نه ئي ٻار ان کي ڄاڻي واڻي استعمال ڪن ٿا.';

  @override
  String get ppChangesH => 'هن پاليسي ۾ تبديليون';

  @override
  String get ppChanges => 'جيڪڏهن اسين جيڪو گڏ ڪريون ٿا يا اهو جتي وڃي ٿو بدلجي ته اسين هي صفحو تازو ڪنداسين ۽ مٿين تاريخ کي بدلائينداسين.';

  @override
  String get ppContactH => 'رابطو';

  @override
  String ppContact(String email) {
    return 'هن پاليسي يا توهان جي ڊيٽا بابت سوال: $email';
  }

  @override
  String get waHello => 'سلام!';

  @override
  String waHelloNamed(String name) {
    return 'سلام $name،';
  }

  @override
  String get gstTaxable => 'ٽيڪس لائق';

  @override
  String get gstTax => 'ٽيڪس';

  @override
  String get gstTaxableValue => 'ٽيڪس لائق قيمت';

  @override
  String get gstTotalTax => 'ڪل ٽيڪس';

  @override
  String get gstTotalItc => 'ڪل ان پٽ ٽيڪس ڪريڊٽ';

  @override
  String get gstExempt => 'معاف وڪرو';

  @override
  String get gstNetPayable => 'ادائگي لائق خالص ٽيڪس';

  @override
  String get unknownName => 'اڻڄاتل';

  @override
  String get unitPiece => 'دانو';

  @override
  String get unitKg => 'ڪلو';

  @override
  String get unitMeter => 'ميٽر';

  @override
  String get unitBox => 'دٻو';

  @override
  String get unitDozen => 'درجن';

  @override
  String get unitLiter => 'ليٽر';

  @override
  String get unitBag => 'ٻوري';

  @override
  String deleteSupplierMessage(String name) {
    return '$name ۽ سندس سڀ خريداريون ڊليٽ ڪريون؟ هي واپس نٿو ٿي سگهي.';
  }
}
