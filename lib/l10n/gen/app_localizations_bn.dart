// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get navHome => 'হোম';

  @override
  String get navCustomers => 'গ্রাহক';

  @override
  String get navItems => 'পণ্য';

  @override
  String get navSuppliers => 'সরবরাহকারী';

  @override
  String get navReports => 'রিপোর্ট';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String get settingsShopDetailsTitle => 'দোকানের বিবরণ';

  @override
  String get settingsShopDetailsSubtitle => 'আপনার চালানে দেখানো হয়।';

  @override
  String get settingsShopNameLabel => 'দোকানের নাম';

  @override
  String get settingsShopAddressLabel => 'দোকানের ঠিকানা';

  @override
  String get settingsPhoneLabel => 'ফোন';

  @override
  String get settingsSaveShopDetails => 'দোকানের বিবরণ সংরক্ষণ করুন';

  @override
  String get settingsAppearanceTitle => 'চেহারা';

  @override
  String get settingsAppearanceSubtitle => 'পুরো অ্যাপের জন্য থিম বেছে নিন।';

  @override
  String get themeLight => 'হালকা';

  @override
  String get themeDark => 'গাঢ়';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get settingsLanguageTitle => 'ভাষা';

  @override
  String get settingsLanguageSubtitle => 'অ্যাপের প্রদর্শন ভাষা বেছে নিন।';

  @override
  String get sortNameNewest => 'সাজান: নাম / নতুন';

  @override
  String get addCustomer => 'গ্রাহক যোগ করুন';

  @override
  String get importCsv => 'CSV আমদানি করুন';

  @override
  String get searchShop => 'দোকানে খুঁজুন';

  @override
  String get scanToFindItem => 'পণ্য খুঁজতে স্ক্যান করুন';

  @override
  String get bulkAdd => 'একসাথে যোগ করুন';

  @override
  String get updateStock => 'স্টক আপডেট করুন';

  @override
  String get printLabels => 'লেবেল প্রিন্ট করুন';

  @override
  String get mergeDuplicates => 'ডুপ্লিকেট একত্র করুন';

  @override
  String get addSupplier => 'সরবরাহকারী যোগ করুন';

  @override
  String get scanPurchaseInvoice => 'ক্রয় চালান স্ক্যান করুন';

  @override
  String askNoAnswer(String reason) {
    return 'উত্তর পাওয়া যায়নি: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'সংযোগ করা যায়নি: $error';
  }

  @override
  String get micPermissionNeeded => 'ভয়েস ইনপুটের জন্য মাইক্রোফোনের অনুমতি প্রয়োজন।';

  @override
  String get speechUnavailable => 'এই ডিভাইসে কণ্ঠস্বর শনাক্তকরণ উপলব্ধ নয়।';

  @override
  String get askYourShop => 'আপনার দোকানকে জিজ্ঞাসা করুন';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get askIntro => 'দোকানের অবস্থা কেমন জানতে চান? আমাকে জিজ্ঞেস করুন, আপনার খাতার হিসাব দেখে উত্তর দেব।';

  @override
  String get askListening => 'শুনছে…';

  @override
  String get askThinkingWords => 'ভাবছে…|কাজ চলছে…|হিসাব করছে…|খাতা দেখছে…|যোগ করছে…|সংখ্যা দেখছে…';

  @override
  String get askSayQuestion => 'আপনার প্রশ্ন বলুন — বাতিল করতে গোলকে ট্যাপ করুন';

  @override
  String briefingRefreshFailed(int code) {
    return 'ব্রিফিং রিফ্রেশ করা যায়নি ($code)।';
  }

  @override
  String get refreshFailedOffline => 'রিফ্রেশ করা যায়নি — সংযোগ পরীক্ষা করুন।';

  @override
  String get newBillFailed => 'নতুন বিল শুরু করা যায়নি — সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'আগে $name-এর জন্য পছন্দের সরবরাহকারী ঠিক করুন (সম্পাদনা করতে ট্যাপ করুন)।';
  }

  @override
  String get reorderBySupplier => 'সরবরাহকারী অনুযায়ী পুনরায় অর্ডার';

  @override
  String get supplier => 'সরবরাহকারী';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পণ্য',
      one: '1টি পণ্য',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'কম স্টকের কোনো পণ্যের পছন্দের সরবরাহকারী এখনো ঠিক করা নেই।';

  @override
  String get thisSupplier => 'এই সরবরাহকারী';

  @override
  String supplierNoPhone(String name) {
    return '$name-এর কোনো ফোন নম্বর নেই।';
  }

  @override
  String get tabOverview => 'সারসংক্ষেপ';

  @override
  String get tabStock => 'স্টক';

  @override
  String get tabMoney => 'টাকা';

  @override
  String get taglineOverview => 'আজকের বকেয়া, স্টক ও নগদ এক নজরে।';

  @override
  String get taglineStock => 'কী বিক্রি হচ্ছে, কী কমে যাচ্ছে।';

  @override
  String get taglineMoney => 'খরচ, মিলানো ও আদায়।';

  @override
  String loadingDashboard(int done, int total) {
    return 'ড্যাশবোর্ড লোড হচ্ছে… $totalটির মধ্যে $doneটি';
  }

  @override
  String get dashboardLoadFailed => 'ড্যাশবোর্ড লোড করা যায়নি';

  @override
  String get checkConnectionRetry => 'সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get aiBriefing => 'AI ব্রিফিং';

  @override
  String get briefingPrompt => 'গতকালের ব্যবসা কয়েকটি বাক্যে দেখুন।';

  @override
  String get getBriefing => 'ব্রিফিং নিন';

  @override
  String get refreshBriefing => 'ব্রিফিং রিফ্রেশ করুন';

  @override
  String updatedAt(String time) {
    return 'আপডেট $time';
  }

  @override
  String get customersUnknown => '— গ্রাহক';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন গ্রাহক',
      one: '1 জন গ্রাহক',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'আগের মাস';

  @override
  String get nextMonth => 'পরের মাস';

  @override
  String get salesMonth => 'বিক্রি (মাস)';

  @override
  String get outstanding => 'বকেয়া';

  @override
  String get profitMonth => 'লাভ (মাস)';

  @override
  String get cashToday => 'আজকের নগদ';

  @override
  String get newBill => 'নতুন বিল';

  @override
  String get scanHandwrittenBill => 'হাতে লেখা বিল স্ক্যান করুন';

  @override
  String get topOutstanding => 'সর্বোচ্চ বকেয়া';

  @override
  String viewAllInDues(int count) {
    return 'বকেয়া কেন্দ্রে সব $countটি দেখুন';
  }

  @override
  String get lowStockAlerts => 'কম স্টকের সতর্কতা';

  @override
  String get noLowStock => 'কোনো পণ্যের স্টক কম নয় — স্টক ঠিক আছে।';

  @override
  String get whatsappAll => 'সবাইকে WhatsApp';

  @override
  String get reorderAll => 'সব পুনরায় অর্ডার করুন';

  @override
  String suggestReorder(String qty, String unit) {
    return 'পরামর্শ: $qty $unit পুনরায় অর্ডার করুন';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit বাকি';
  }

  @override
  String get reorder => 'পুনরায় অর্ডার';

  @override
  String get whatsappSupplier => 'সরবরাহকারীকে WhatsApp';

  @override
  String get topItemsByRevenue => 'আয় অনুযায়ী শীর্ষ পণ্য';

  @override
  String get noSalesYet => 'এখনো কোনো বিক্রি নেই।';

  @override
  String qtyLabel(String qty) {
    return 'পরিমাণ: $qty';
  }

  @override
  String get monthExpenses => 'এই মাসের খরচ';

  @override
  String get noExpensesMonth => 'এই মাসে কোনো খরচ নেই।';

  @override
  String get quickActions => 'দ্রুত কাজ';

  @override
  String get dailyCashReconciliation => 'দৈনিক নগদ মিলানো';

  @override
  String get collectMoney => 'টাকা আদায় করুন';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি পরিবর্তন অফলাইনে সংরক্ষিত',
      one: '1টি পরিবর্তন অফলাইনে সংরক্ষিত',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'অনলাইনে ফিরলে স্বয়ংক্রিয়ভাবে সিঙ্ক হবে';

  @override
  String get syncing => 'সিঙ্ক হচ্ছে';

  @override
  String get sync => 'সিঙ্ক';

  @override
  String get shopProfile => 'দোকানের প্রোফাইল';

  @override
  String get insights => 'অন্তর্দৃষ্টি';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String get backupExport => 'ব্যাকআপ ও এক্সপোর্ট';

  @override
  String get adminPanel => 'অ্যাডমিন প্যানেল';

  @override
  String get toolsSync => 'টুলস ও সিঙ্ক';

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get shopDetailsSaved => 'দোকানের বিবরণ সংরক্ষিত হয়েছে।';

  @override
  String saveFailed(int code) {
    return 'সংরক্ষণ করা যায়নি ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'সংরক্ষণ করা যায়নি: $error';
  }

  @override
  String get logoUpdated => 'লোগো আপডেট হয়েছে।';

  @override
  String logoUploadFailed(int code) {
    return 'লোগো আপলোড করা যায়নি ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'লোগো আপলোড করা যায়নি: $error';
  }

  @override
  String get healthGood => 'সব মিলিয়ে ভালো আছে।';

  @override
  String get healthSome => 'কয়েকটি বিষয়ে মনোযোগ দরকার।';

  @override
  String get healthMany => 'অনেকগুলো বিষয়ে মনোযোগ দরকার।';

  @override
  String get shopHealth => 'দোকানের অবস্থা';

  @override
  String get healthIntro => 'একটু মনে করিয়ে দেওয়া, আরেকটি রিপোর্ট নয়।';

  @override
  String get couldNotLoadCheckConnection => 'লোড করা যায়নি — সংযোগ পরীক্ষা করুন।';

  @override
  String get itemPhotos => 'পণ্যের ছবি';

  @override
  String get barcodes => 'বারকোড';

  @override
  String get lowStockItems => 'কম স্টকের পণ্য';

  @override
  String get lastBackup => 'শেষ ব্যাকআপ';

  @override
  String get today => 'আজ';

  @override
  String get yesterday => 'গতকাল';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days দিন আগে',
      one: '1 দিন আগে',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'অফলাইন অবস্থা';

  @override
  String get online => 'অনলাইন';

  @override
  String get offline => 'অফলাইন';

  @override
  String get waitingToSync => 'সিঙ্কের অপেক্ষায়';

  @override
  String get syncNow => 'এখন সিঙ্ক করুন';

  @override
  String get searchSettings => 'সেটিংস খুঁজুন';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\"-এর সাথে কোনো সেটিং মেলেনি';
  }

  @override
  String get businessInfo => 'ব্যবসার তথ্য';

  @override
  String get payment => 'পেমেন্ট';

  @override
  String get shopNameRequired => 'দোকানের নাম আবশ্যক';

  @override
  String phoneIncomplete(int digits) {
    return 'সম্পূর্ণ $digits অঙ্কের ফোন নম্বর দিন';
  }

  @override
  String get jazzcashOptional => 'JazzCash নম্বর (ঐচ্ছিক)';

  @override
  String get saved => 'সংরক্ষিত!';

  @override
  String get languageSubtitle => 'অ্যাপের ভাষা পরিবর্তন করুন';

  @override
  String get notificationsSubtitle => 'কম স্টক, বকেয়া পেমেন্ট ও দৈনিক সারাংশ';

  @override
  String get backupSubtitle => 'দোকানের ডেটা ডাউনলোড, পুনরুদ্ধার ও এক্সপোর্ট করুন';

  @override
  String get appUpdate => 'অ্যাপ আপডেট';

  @override
  String get appUpdateSubtitle => 'নতুন সংস্করণ দেখুন';

  @override
  String get adminSubtitle => 'অ্যাকাউন্ট ও দোকানের ডেটা পরিচালনা করুন';

  @override
  String get accountSubtitle => 'সাইন-ইন, পাসওয়ার্ড ও ইউজারনেম';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get privacySubtitle => 'আমরা কোন ডেটা সংগ্রহ করি এবং কেন';

  @override
  String get yourShop => 'আপনার দোকান';

  @override
  String get uploadingLogo => 'দোকানের লোগো আপলোড হচ্ছে';

  @override
  String get logoTapToChange => 'দোকানের লোগো, বদলাতে ট্যাপ করুন';

  @override
  String get brandTagline => 'দোকানে ব্যস্ততা, হিসাবে শান্তি।';

  @override
  String serverError(int code) {
    return 'সার্ভার ত্রুটি: $code';
  }

  @override
  String get deleteCustomer => 'গ্রাহক মুছুন';

  @override
  String deleteCustomerMessage(String name) {
    return '$name এবং তার সব বিল মুছবেন? এটি ফেরানো যাবে না।';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'মোছা যায়নি: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'মোছা যায়নি — সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get actions => 'কাজ';

  @override
  String get edit => 'সম্পাদনা';

  @override
  String get delete => 'মুছুন';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন গ্রাহক মুছুন',
      one: '1 জন গ্রাহক মুছুন',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন গ্রাহক এবং তাদের সব বিল মুছবেন? এটি ফেরানো যাবে না।',
      one: '1 জন গ্রাহক এবং তার সব বিল মুছবেন? এটি ফেরানো যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'সব নির্বাচন বাতিল';

  @override
  String get selectAll => 'সব নির্বাচন করুন';

  @override
  String selectedCount(int count) {
    return '$countটি নির্বাচিত';
  }

  @override
  String get cancel => 'বাতিল';

  @override
  String get newTag => 'নতুন';

  @override
  String get csvNeedsRows => 'CSV-তে একটি হেডার সারি ও অন্তত একজন গ্রাহক থাকতে হবে।';

  @override
  String get csvNeedsName => 'CSV হেডারে \"name\" কলাম থাকতে হবে।';

  @override
  String csvLineMissingName(int line) {
    return 'লাইন $line: নাম নেই — ফাইল ঠিক করে আবার চেষ্টা করুন।';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'লাইন $line: ভুল credit_limit \"$value\" — ফাইল ঠিক করে আবার চেষ্টা করুন।';
  }

  @override
  String get importCustomers => 'গ্রাহক আমদানি করুন';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\"-এ $count জন গ্রাহক পাওয়া গেছে। সব আমদানি করবেন?',
      one: '\"$file\"-এ 1 জন গ্রাহক পাওয়া গেছে। আমদানি করবেন?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'আমদানি';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন গ্রাহক আমদানি হয়েছে।',
      one: '1 জন গ্রাহক আমদানি হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'আমদানি ব্যর্থ: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'আমদানি ব্যর্থ — সংযোগ করা যায়নি: $error';
  }

  @override
  String get noPhone => 'ফোন নেই';

  @override
  String get offlineShowingSaved => 'অফলাইন — সংরক্ষিত কপি দেখানো হচ্ছে';

  @override
  String get searchCustomersHint => 'গ্রাহক বা ফোন খুঁজুন...';

  @override
  String get noCustomersYet => 'এখনো কোনো গ্রাহক নেই। যোগ করতে + ট্যাপ করুন।';

  @override
  String get noCustomersMatch => 'আপনার খোঁজের সাথে কোনো গ্রাহক মেলেনি।';

  @override
  String get owesMoney => 'টাকা বাকি';

  @override
  String get settledUp => 'হিসাব মিটেছে';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what লোড করা যায়নি: $error';
  }

  @override
  String get takePhoto => 'ছবি তুলুন';

  @override
  String get chooseFromGallery => 'গ্যালারি থেকে বাছুন';

  @override
  String get back => 'ফিরে যান';

  @override
  String callPhone(String phone) {
    return '$phone-এ কল করুন';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone-এ WhatsApp';
  }

  @override
  String get clearSearch => 'খোঁজ মুছুন';

  @override
  String get askHint => 'যেমন এই মাসে আমার কত লাভ হয়েছে?';

  @override
  String get acctTurnOffLockTitle => 'অ্যাপ লক বন্ধ করবেন?';

  @override
  String get acctTurnOffLockBody => 'এই ফোনটি যার হাতে থাকবে সে-ই PIN ছাড়া অ্যাপ খুলতে পারবে।';

  @override
  String get acctTurnOff => 'বন্ধ করুন';

  @override
  String get acctSetPinTitle => 'PIN সেট করুন';

  @override
  String get acctPinLabel => '৪-৬ সংখ্যার PIN';

  @override
  String get acctPinMin => 'কমপক্ষে ৪টি সংখ্যা';

  @override
  String get acctConfirmPin => 'PIN নিশ্চিত করুন';

  @override
  String get acctPinMismatch => 'PIN মিলছে না';

  @override
  String get acctSetPin => 'PIN সেট করুন';

  @override
  String get acctBiometricTitle => 'আঙুলের ছাপ/মুখও ব্যবহার করবেন?';

  @override
  String get acctBiometricBody => 'বায়োমেট্রিক কাজ না করলেও আপনি PIN ব্যবহার করতে পারবেন।';

  @override
  String get acctNoThanks => 'না, ধন্যবাদ';

  @override
  String get acctEnable => 'চালু করুন';

  @override
  String get acctSetPasswordTitle => 'পাসওয়ার্ড সেট করুন';

  @override
  String get acctSetPasswordIntro => 'একটি পাসওয়ার্ড বেছে নিন, যাতে পরের বার শুধু Google নয়, ইমেইল + পাসওয়ার্ড দিয়েও সাইন ইন করতে পারেন।';

  @override
  String get acctPassword => 'পাসওয়ার্ড';

  @override
  String get acctPasswordMin => 'কমপক্ষে ৬টি অক্ষর হতে হবে';

  @override
  String get acctConfirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get acctPasswordsMismatch => 'পাসওয়ার্ড মিলছে না';

  @override
  String get acctSetPasswordButton => 'পাসওয়ার্ড সেট করুন';

  @override
  String get acctPasswordSet => 'পাসওয়ার্ড সেট হয়েছে — এখন এটি দিয়েও সাইন ইন করতে পারবেন।';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'পাসওয়ার্ড সেট করা যায়নি: $error';
  }

  @override
  String get acctChangePasswordTitle => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get acctCurrentPassword => 'বর্তমান পাসওয়ার্ড';

  @override
  String get acctRequired => 'আবশ্যক';

  @override
  String get acctNewPassword => 'নতুন পাসওয়ার্ড';

  @override
  String get acctConfirmNewPassword => 'নতুন পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get acctChange => 'পরিবর্তন করুন';

  @override
  String get acctPasswordChanged => 'পাসওয়ার্ড পরিবর্তন হয়েছে।';

  @override
  String get acctWrongPassword => 'বর্তমান পাসওয়ার্ড ভুল।';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'পাসওয়ার্ড পরিবর্তন করা যায়নি: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'ইউজারনেম পরিবর্তন করুন';

  @override
  String get acctUsername => 'ইউজারনেম';

  @override
  String get acctUsernameEmpty => 'ইউজারনেম খালি রাখা যাবে না';

  @override
  String get acctUsernameChanged => 'ইউজারনেম পরিবর্তন হয়েছে।';

  @override
  String get acctChangeEmailTitle => 'ইমেইল পরিবর্তন করুন';

  @override
  String get acctNewEmail => 'নতুন ইমেইল';

  @override
  String get acctValidEmail => 'একটি সঠিক ইমেইল দিন';

  @override
  String get acctRequiredConfirm => 'আপনার পরিচয় নিশ্চিত করতে প্রয়োজন';

  @override
  String get acctGoogleConfirmFirst => 'আগে Google দিয়ে নিশ্চিত করতে বলা হবে।';

  @override
  String acctCheckEmail(String email) {
    return 'পরিবর্তন নিশ্চিত করার লিংকের জন্য $email দেখুন।';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'পাসওয়ার্ড দিয়ে সাইন-ইন';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider সরাবেন?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'এই অ্যাকাউন্টে আপনি আর $provider দিয়ে সাইন ইন করতে পারবেন না।';
  }

  @override
  String get acctRemove => 'সরান';

  @override
  String acctRemoved(String provider) {
    return '$provider সরানো হয়েছে।';
  }

  @override
  String get acctSignedIn => 'সাইন ইন করা আছে';

  @override
  String get acctEmailNotVerified => 'ইমেইল এখনও যাচাই হয়নি।';

  @override
  String get acctVerificationSent => 'যাচাইকরণ ইমেইল পাঠানো হয়েছে।';

  @override
  String get acctResend => 'আবার পাঠান';

  @override
  String get acctSectionSignIn => 'সাইন-ইন ও নিরাপত্তা';

  @override
  String get acctRowChangeUsername => 'ইউজারনেম পরিবর্তন';

  @override
  String get acctRowChangeEmail => 'ইমেইল পরিবর্তন';

  @override
  String get acctRowSetPassword => 'পাসওয়ার্ড সেট করুন';

  @override
  String get acctRowChangePassword => 'পাসওয়ার্ড পরিবর্তন';

  @override
  String get acctRowUnlinkGoogle => 'Google আনলিংক করুন';

  @override
  String get acctRowRemovePassword => 'পাসওয়ার্ড সরান';

  @override
  String get acctRowAppLock => 'অ্যাপ লক (PIN)';

  @override
  String get acctRowBiometric => 'আঙুলের ছাপ/মুখ ব্যবহার করুন';

  @override
  String get acctSignOutTitle => 'সাইন আউট করবেন?';

  @override
  String get acctSignOutBody => 'অ্যাপ ব্যবহার করতে আপনাকে আবার সাইন ইন করতে হবে।';

  @override
  String get acctSignOut => 'সাইন আউট';

  @override
  String get acctDeleteAccount => 'অ্যাকাউন্ট মুছুন';

  @override
  String get acctDeleting => 'মোছা হচ্ছে...';

  @override
  String get acctDeleteTitle => 'অ্যাকাউন্ট মুছবেন?';

  @override
  String get acctDeleteBody => 'এটি আপনার সাইন-ইন তথ্য স্থায়ীভাবে মুছে ফেলবে। অ্যাপ ব্যবহার করতে আবার সাইন আপ করতে হবে। এটি ফেরানো যাবে না।';

  @override
  String acctCouldNotDelete(String error) {
    return 'অ্যাকাউন্ট মোছা যায়নি: $error';
  }

  @override
  String get itmNotFoundTitle => 'আইটেম পাওয়া যায়নি';

  @override
  String itmNotFoundBody(String barcode) {
    return 'বারকোড $barcode সহ কোনো আইটেম নেই। এখনই নতুন আইটেম হিসেবে যোগ করবেন?';
  }

  @override
  String get itmAddItem => 'আইটেম যোগ করুন';

  @override
  String get itmEditItem => 'আইটেম সম্পাদনা করুন';

  @override
  String get itmMergeTitle => 'ডুপ্লিকেট আইটেম মার্জ করুন';

  @override
  String get itmMergeBody => 'একই নামের আইটেমগুলো সবচেয়ে পুরনো এন্ট্রিতে মার্জ হবে এবং তাদের স্টক যোগ হবে। এটি ফেরানো যাবে না।';

  @override
  String get itmMerge => 'মার্জ করুন';

  @override
  String get itmNoDuplicates => 'কোনো ডুপ্লিকেট আইটেম পাওয়া যায়নি।';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ডুপ্লিকেট আইটেম মার্জ হয়েছে।',
      one: '১টি ডুপ্লিকেট আইটেম মার্জ হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'আইটেম মুছুন';

  @override
  String get itmCannotUndo => 'এটি ফেরানো যাবে না।';

  @override
  String get itmDeleteOffline => 'মোছা যায়নি — সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি আইটেম মুছুন',
      one: '১টি আইটেম মুছুন',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি আইটেম মুছবেন? এটি ফেরানো যাবে না।',
      one: '১টি আইটেম মুছবেন? এটি ফেরানো যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'ছবি আপলোড করা যায়নি ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'ছবি আপলোড করা যায়নি: $error';
  }

  @override
  String get itmNoBarcodes => 'এখনও কোনো আইটেমের বারকোড নেই।';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি লেবেল প্রিন্ট করুন',
      one: '১টি লেবেল প্রিন্ট করুন',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'আইটেম বা ক্যাটাগরি খুঁজুন...';

  @override
  String get itmStopListening => 'শোনা বন্ধ করুন';

  @override
  String get itmVoiceSearch => 'ভয়েস সার্চ';

  @override
  String get itmSort => 'সাজান';

  @override
  String get itmSortName => 'নাম (ক-হ)';

  @override
  String get itmSortStockLow => 'স্টক: কম থেকে বেশি';

  @override
  String get itmSortRecent => 'সম্প্রতি যোগ করা';

  @override
  String get itmFilterAll => 'সব';

  @override
  String get itmFilterLowStock => 'কম স্টক';

  @override
  String get itmNoItemsYet => 'এখনও কোনো আইটেম নেই। যোগ করতে + চাপুন।';

  @override
  String get itmNoItemsMatch => 'আপনার খোঁজে কোনো আইটেম মেলেনি।';

  @override
  String get itmNoPriceChanges => 'এখনও দামে কোনো পরিবর্তন নথিভুক্ত হয়নি।';

  @override
  String get itmNoStockCorrections => 'এখনও কোনো স্টক সংশোধন নথিভুক্ত হয়নি।';

  @override
  String get itmResetHistory => 'ইতিহাস রিসেট করুন';

  @override
  String get itmResetHistoryMsg => 'এই আইটেমের ইতিহাস রিসেট করবেন? এটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get itmSendPdf => 'PDF হিসেবে পাঠান';

  @override
  String get itmNoteOptional => 'নোট (ঐচ্ছিক)';

  @override
  String get itmNoteHint => 'এই পরিবর্তনের জন্য একটি নোট যোগ করুন';

  @override
  String get itmRemoveEntry => 'এন্ট্রি সরান';

  @override
  String get itmRemoveEntryMsg => 'ইতিহাস থেকে এই এন্ট্রিটি সরাবেন? এটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get itmEditEntry => 'এন্ট্রি সম্পাদনা করুন';

  @override
  String get itmPrevQty => 'আগের';

  @override
  String get itmNewQty => 'নতুন';

  @override
  String itmCost(String amount) {
    return 'খরচ: $amount';
  }

  @override
  String get itmMore => 'আরও';

  @override
  String get itmMenuPrintLabel => 'লেবেল প্রিন্ট করুন';

  @override
  String get itmMenuDuplicate => 'ডুপ্লিকেট করুন';

  @override
  String get itmMenuPriceHistory => 'দামের ইতিহাস';

  @override
  String get itmMenuStockHistory => 'স্টক সমন্বয়ের ইতিহাস';

  @override
  String itmLowStockBadge(int count) {
    return '$countটি কম স্টক';
  }

  @override
  String itmStockLine(String qty) {
    return 'স্টক: $qty';
  }

  @override
  String get itmOfflineSaved => 'অফলাইন — আইটেম এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get itmItemName => 'আইটেমের নাম';

  @override
  String get itmNameRequired => 'নাম আবশ্যক';

  @override
  String get itmPricePkr => 'দাম (PKR)';

  @override
  String get itmPriceRequired => 'দাম আবশ্যক';

  @override
  String get itmValidNumber => 'একটি সঠিক সংখ্যা দিন';

  @override
  String get itmUnit => 'একক';

  @override
  String get itmCategoryHint => 'ক্যাটাগরি (ঐচ্ছিক, যেমন প্লাম্বিং)';

  @override
  String get itmPreferredSupplier => 'পছন্দের সরবরাহকারী (ঐচ্ছিক)';

  @override
  String get itmPreferredSupplierHelper => 'এক-ট্যাপ রিঅর্ডারে ব্যবহৃত হয়';

  @override
  String get itmClear => 'মুছুন';

  @override
  String get itmHsn => 'HSN কোড (ঐচ্ছিক)';

  @override
  String get itmGstRate => 'GST হার % (ঐচ্ছিক)';

  @override
  String get itmBarcodeOptional => 'বারকোড (ঐচ্ছিক)';

  @override
  String get itmScanOrType => 'স্ক্যান করুন বা লিখুন';

  @override
  String get itmScanBarcode => 'বারকোড স্ক্যান করুন';

  @override
  String get itmPurchaseCost => 'ক্রয়মূল্য (প্রতি একক)';

  @override
  String get itmPurchaseCostHint => 'স্টক কেনার সময় আপনি যা দেন';

  @override
  String get itmWholesale => 'পাইকারি দাম (ঐচ্ছিক)';

  @override
  String get itmContractor => 'ঠিকাদার দাম (ঐচ্ছিক)';

  @override
  String get itmFallsBack => 'না থাকলে সাধারণ দাম প্রযোজ্য হবে';

  @override
  String get itmStockQty => 'স্টকের পরিমাণ';

  @override
  String get itmLowStockAlert => 'কম স্টকের সতর্কতা এর নিচে';

  @override
  String get itmFrequently => 'প্রায়ই একসাথে কেনা হয়';

  @override
  String get itmSaveChanges => 'পরিবর্তন সেভ করুন';

  @override
  String get itmSaveItem => 'আইটেম সেভ করুন';

  @override
  String get itmPhotoSemantics => 'আইটেমের ছবি, বদলাতে ট্যাপ করুন';

  @override
  String get cdUpdateStatusTitle => 'পেমেন্টের অবস্থা আপডেট করুন';

  @override
  String get cdMarkPaidQ => 'এই বিলটি পরিশোধিত হিসেবে চিহ্নিত করবেন?';

  @override
  String get cdMarkUnpaidQ => 'এই বিলটি অপরিশোধিত হিসেবে চিহ্নিত করবেন?';

  @override
  String get cdConfirm => 'নিশ্চিত করুন';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'আপডেট করা যায়নি: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'অফলাইন — পরিবর্তন এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get cdConvertTitle => 'বিলে রূপান্তর করুন';

  @override
  String get cdConvertBody => 'এতে এই আইটেমগুলোর স্টক কমবে এবং কোটেশন আসল বিল হয়ে যাবে। চালিয়ে যাবেন?';

  @override
  String get cdConvert => 'রূপান্তর করুন';

  @override
  String cdCouldNotConvert(String detail) {
    return 'রূপান্তর করা যায়নি: $detail';
  }

  @override
  String get cdReturnItems => 'আইটেম ফেরত দিন';

  @override
  String get cdReturnHint => 'প্রতিটি আইটেম কত ফেরত যাবে ঠিক করুন। বিক্রি রাখতে 0 রাখুন।';

  @override
  String get cdDecreaseQty => 'পরিমাণ কমান';

  @override
  String get cdIncreaseQty => 'পরিমাণ বাড়ান';

  @override
  String get cdCreditTotal => 'ক্রেডিট মোট';

  @override
  String get cdReturnSelected => 'নির্বাচিতগুলো ফেরত দিন';

  @override
  String cdCouldNotReturn(String detail) {
    return 'ফেরত দেওয়া যায়নি: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'বাতিল করা যায়নি: $detail';
  }

  @override
  String get cdNoPreviousBill => 'পুনরায় করার মতো কোনো আগের বিল নেই';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'শেষ বিল লোড করা যায়নি: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'ইনভয়েস গ্রাহককে ইমেইল করা হয়েছে।';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'ইনভয়েস ইমেইল করা যায়নি: $detail';
  }

  @override
  String get cdStatementEmailed => 'স্টেটমেন্ট গ্রাহককে ইমেইল করা হয়েছে।';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'স্টেটমেন্ট ইমেইল করা যায়নি: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'বিল মুছুন';

  @override
  String get cdBillVoided => 'বাতিল';

  @override
  String get cdBillReturn => 'ফেরত';

  @override
  String get cdBillQuote => 'কোটেশন';

  @override
  String get cdBillPaid => 'পরিশোধিত';

  @override
  String get cdBillPartial => 'আংশিক';

  @override
  String get cdBillUnpaid => 'অপরিশোধিত';

  @override
  String get cdBill => 'বিল';

  @override
  String cdVoidedReason(String reason) {
    return 'বাতিল: $reason';
  }

  @override
  String get cdViewInvoice => 'ইনভয়েস দেখুন';

  @override
  String get cdEmailInvoice => 'ইনভয়েস ইমেইল করুন';

  @override
  String get cdEditBill => 'বিল সম্পাদনা করুন';

  @override
  String get cdReturnBill => 'বিল ফেরত দিন';

  @override
  String get cdVoidBill => 'বিল বাতিল করুন';

  @override
  String get cdNoItems => 'কোনো আইটেম নেই';

  @override
  String get cdRepeatLast => 'শেষ বিল পুনরায় করুন';

  @override
  String get cdLedgerPdf => 'খাতা PDF';

  @override
  String get cdEmailStatement => 'স্টেটমেন্ট ইমেইল করুন';

  @override
  String get cdCollectPayment => 'পেমেন্ট আদায় করুন';

  @override
  String get cdSendReminder => 'হোয়াটসঅ্যাপ রিমাইন্ডার পাঠান';

  @override
  String get cdTotalBilled => 'মোট বিল';

  @override
  String get cdPaid => 'পরিশোধিত';

  @override
  String get cdNoBills => 'এখনও কোনো বিল নেই';

  @override
  String get cdBillActions => 'বিলের অ্যাকশন';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'ক্রেডিট সীমা $limit-এর মধ্যে $outstanding ব্যবহৃত';
  }

  @override
  String get cdVoidBody => 'এটি ব্যালেন্স ও রিপোর্ট থেকে সরে যাবে, তবে ইতিহাসে থাকবে। স্টক ফিরে আসবে। এটি ফেরানো যাবে না।';

  @override
  String get cdReason => 'কারণ (ঐচ্ছিক)';

  @override
  String get frmOfflineCustomer => 'অফলাইন — গ্রাহক এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get frmOfflineSupplier => 'অফলাইন — সরবরাহকারী এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get frmEditCustomer => 'গ্রাহক সম্পাদনা করুন';

  @override
  String get frmCustomerName => 'গ্রাহকের নাম';

  @override
  String get frmPhoneOptional => 'ফোন (ঐচ্ছিক)';

  @override
  String get frmCreditLimit => 'ক্রেডিট সীমা (PKR, ঐচ্ছিক)';

  @override
  String get frmCreditHelper => 'এই গ্রাহকের ব্যালেন্স এর বেশি হলে সতর্ক করুন';

  @override
  String get frmPriceTier => 'দামের স্তর';

  @override
  String get frmRetail => 'খুচরা';

  @override
  String get frmWholesale => 'পাইকারি';

  @override
  String get frmContractor => 'ঠিকাদার';

  @override
  String get frmPriceTierHelper => 'বিল তৈরির সময় এই গ্রাহকের জন্য কোন দাম আগে থেকে বসবে';

  @override
  String get frmStrn => 'STRN (ঐচ্ছিক)';

  @override
  String get frmStrnCustomer => 'ইনভয়েসের জন্য ১৩ অঙ্কের সেলস ট্যাক্স রেজিস্ট্রেশন নম্বর';

  @override
  String get frmStrnSupplier => 'ক্রয় বিলের জন্য ১৩ অঙ্কের সেলস ট্যাক্স রেজিস্ট্রেশন নম্বর';

  @override
  String get frmAddress => 'ঠিকানা (ঐচ্ছিক)';

  @override
  String get frmEmail => 'ইমেইল (ঐচ্ছিক)';

  @override
  String get frmEmailHelper => 'এই গ্রাহককে ইনভয়েস বা স্টেটমেন্ট ইমেইল করতে দেয়';

  @override
  String get frmSaveCustomer => 'গ্রাহক সেভ করুন';

  @override
  String get frmEditSupplier => 'সরবরাহকারী সম্পাদনা করুন';

  @override
  String get frmSupplierName => 'সরবরাহকারীর নাম';

  @override
  String get frmSaveSupplier => 'সরবরাহকারী সেভ করুন';

  @override
  String get sdDeletePurchaseTitle => 'ক্রয় মুছুন';

  @override
  String get sdDeletePurchaseBody => 'এই ক্রয়ের স্টক ফিরে আসবে। এটি ফেরানো যাবে না।';

  @override
  String get sdReturnToSupplier => 'সরবরাহকারীকে ফেরত দিন';

  @override
  String get sdReturnHint => 'প্রতিটি আইটেম কত ফেরত পাঠাবেন ঠিক করুন। রাখতে 0 রাখুন।';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'প্রাপ্ত হিসেবে চিহ্নিত করা যায়নি: $detail';
  }

  @override
  String get sdMarkPaidQ => 'এই ক্রয়টি পরিশোধিত হিসেবে চিহ্নিত করবেন?';

  @override
  String get sdMarkUnpaidQ => 'এই ক্রয়টি অপরিশোধিত হিসেবে চিহ্নিত করবেন?';

  @override
  String get sdTotalPurchased => 'মোট ক্রয়';

  @override
  String get sdPayable => 'প্রদেয়';

  @override
  String sdPayableAmount(String amount) {
    return '$amount প্রদেয়';
  }

  @override
  String get sdNoPurchases => 'এখনও কোনো ক্রয় নেই';

  @override
  String get sdPo => 'পিও';

  @override
  String get sdDraftPo => 'খসড়া পিও';

  @override
  String get sdPurchase => 'ক্রয়';

  @override
  String get sdDraftNote => 'খসড়া ক্রয় আদেশ — এখনও পাওয়া যায়নি, স্টক বা খরচে এখনও কোনো পরিবর্তন নেই।';

  @override
  String get sdReturnNote => 'সরবরাহকারীকে ফেরত / ক্রেডিট নোট।';

  @override
  String get sdMarkReceived => 'প্রাপ্ত হিসেবে চিহ্নিত করুন';

  @override
  String get sdEditPurchase => 'ক্রয় সম্পাদনা করুন';

  @override
  String get sdPurchaseActions => 'ক্রয়ের অ্যাকশন';

  @override
  String get slDeleteSupplier => 'সরবরাহকারী মুছুন';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন সরবরাহকারী মুছুন',
      one: '১ জন সরবরাহকারী মুছুন',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন সরবরাহকারী ও তাঁদের সব ক্রয় মুছবেন? এটি ফেরানো যাবে না।',
      one: '১ জন সরবরাহকারী ও তাঁর সব ক্রয় মুছবেন? এটি ফেরানো যাবে না।',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV-তে একটি হেডার সারি এবং অন্তত একজন সরবরাহকারী থাকতে হবে।';

  @override
  String get slImportTitle => 'সরবরাহকারী ইমপোর্ট করুন';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\"-এ $count জন সরবরাহকারী পাওয়া গেছে। সবাইকে ইমপোর্ট করবেন?',
      one: '\"$file\"-এ ১ জন সরবরাহকারী পাওয়া গেছে। সবাইকে ইমপোর্ট করবেন?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন সরবরাহকারী ইমপোর্ট হয়েছে।',
      one: '১ জন সরবরাহকারী ইমপোর্ট হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'এখনও কোনো সরবরাহকারী নেই। যোগ করতে + চাপুন।';

  @override
  String get slSearchHint => 'সরবরাহকারী বা ফোন খুঁজুন...';

  @override
  String get slNoMatch => 'আপনার খোঁজে কোনো সরবরাহকারী মেলেনি।';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন সরবরাহকারী',
      one: '১ জন সরবরাহকারী',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'সরবরাহকারীর পাওনা';

  @override
  String get sduNothingOwed => 'সরবরাহকারীদের কিছু দেওয়ার বাকি নেই 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন সরবরাহকারীর পাওনা বাকি',
      one: '১ জন সরবরাহকারীর পাওনা বাকি',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'সবচেয়ে পুরনো অপরিশোধিত ক্রয়ের $days দিন হয়েছে',
      one: 'সবচেয়ে পুরনো অপরিশোধিত ক্রয়ের ১ দিন হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '০–৩০ দিন';

  @override
  String get duBucket1 => '৩০–৬০ দিন';

  @override
  String get duBucket2 => '৬০+ দিন';

  @override
  String get duTitle => 'বকেয়া কেন্দ্র';

  @override
  String get duNoDues => 'কোনো বকেয়া নেই 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count জন গ্রাহকের বকেয়া আছে',
      one: '১ জন গ্রাহকের বকেয়া আছে',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'সবচেয়ে পুরনো অপরিশোধিত বিলের $days দিন হয়েছে',
      one: 'সবচেয়ে পুরনো অপরিশোধিত বিলের ১ দিন হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount বকেয়া';
  }

  @override
  String get cpNoOutstanding => 'এই গ্রাহকের কোনো বকেয়া ব্যালেন্স নেই';

  @override
  String get cpValidAmount => 'সঠিক পরিমাণ দিন';

  @override
  String cpExceeds(String amount) {
    return 'পরিমাণ বকেয়া ব্যালেন্স $amount-এর বেশি';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name থেকে $amount আদায় হয়েছে';
  }

  @override
  String get cpOfflineSaved => 'অফলাইন — পেমেন্ট এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String cpOwes(String amount, String name) {
    return '$name-এর কাছে $amount পাওনা। এটি আগে সবচেয়ে পুরনো অপরিশোধিত বিল(গুলো)তে প্রযোজ্য হবে।';
  }

  @override
  String get cpAmountLabel => 'আদায়কৃত পরিমাণ (PKR)';

  @override
  String get cpCollect => 'আদায় করুন';

  @override
  String get usNoItems => 'আপডেট করার মতো কোনো আইটেম নেই।';

  @override
  String get usHelp => 'প্রতিটি আইটেমের নতুন স্টক ঠিক করুন, তারপর সব সেভ করুন চাপুন।';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  বর্তমান: $qty';
  }

  @override
  String usNew(String qty) {
    return 'নতুন: $qty';
  }

  @override
  String get usSubtract => '১ কমান';

  @override
  String get usAdd => '১ যোগ করুন';

  @override
  String get usNoChanges => 'কোনো পরিবর্তন নেই';

  @override
  String usSaveAll(int count) {
    return 'সব সেভ করুন ($countটি বদলেছে)';
  }

  @override
  String get srHint => 'গ্রাহক, আইটেম, পরিমাণ খুঁজুন...';

  @override
  String get srFailed => 'খোঁজা ব্যর্থ — সংযোগ পরীক্ষা করুন।';

  @override
  String get srTitle => 'আপনার দোকানে খুঁজুন';

  @override
  String get srSubtitle => 'নাম বা ফোন দিয়ে গ্রাহক, পরিমাণ দিয়ে বিল খুঁজুন।';

  @override
  String srNoMatches(String query) {
    return '\"$query\"-এর জন্য কিছু মেলেনি';
  }

  @override
  String get srTryDifferent => 'অন্য নাম, ফোন নম্বর বা পরিমাণ চেষ্টা করুন।';

  @override
  String get srBills => 'বিল';

  @override
  String get srNoItemList => 'কোনো আইটেম তালিকা নেই';

  @override
  String get abAddAtLeastOne => 'কমপক্ষে একটি আইটেম যোগ করুন';

  @override
  String get abQuotationUpdated => 'কোটেশন আপডেট হয়েছে!';

  @override
  String get abBillUpdated => 'বিল আপডেট হয়েছে!';

  @override
  String get abQuotationSaved => 'কোটেশন সেভ হয়েছে!';

  @override
  String get abBillCreated => 'বিল সফলভাবে তৈরি হয়েছে!';

  @override
  String abTotalAmount(String amount) {
    return 'মোট: $amount';
  }

  @override
  String get abShare => 'শেয়ার করুন';

  @override
  String get abDoneReturn => 'হয়েছে ও ফিরে যান';

  @override
  String get abOverLimitBody => 'এতে গ্রাহক তাঁর ক্রেডিট সীমা ছাড়িয়ে যাবেন।';

  @override
  String get abOverLimitTitle => 'ক্রেডিট সীমা ছাড়িয়েছে';

  @override
  String get abBillAnyway => 'তবুও বিল করুন';

  @override
  String get abOfflineBill => 'অফলাইন — বিল এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get abEditQuotation => 'কোটেশন সম্পাদনা করুন';

  @override
  String get abEditBill => 'বিল সম্পাদনা করুন';

  @override
  String get abNewQuotation => 'নতুন কোটেশন';

  @override
  String get abAddBill => 'বিল যোগ করুন';

  @override
  String get abCouldNotLoadItems => 'আইটেম লোড করা যায়নি।';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'এই বিলে গ্রাহকের ব্যালেন্স হবে $total, যা তাঁর $limit ক্রেডিট সীমার বেশি।';
  }

  @override
  String get abTapAddItemBill => 'বিল শুরু করতে নিচে \"আইটেম যোগ করুন\" চাপুন';

  @override
  String get abNoCatalog => 'ক্যাটালগে এখনও কোনো আইটেম নেই';

  @override
  String get abScan => 'স্ক্যান';

  @override
  String get abDiscountRs => 'ছাড় (রুপি)';

  @override
  String get abSubtotal => 'উপমোট';

  @override
  String get abTotal => 'মোট';

  @override
  String get abSaveAsQuotation => 'কোটেশন হিসেবে সেভ করুন';

  @override
  String get abQuotationLocked => 'বিদ্যমান বিলকে আবার কোটেশন করা যায় না';

  @override
  String get abQuotationNote => 'বিলে রূপান্তর না হওয়া পর্যন্ত স্টক কমবে না';

  @override
  String get abPaymentStatus => 'পেমেন্টের অবস্থা';

  @override
  String get abUnpaid => 'অপরিশোধিত';

  @override
  String get abPaymentMethod => 'পেমেন্টের পদ্ধতি';

  @override
  String get abCash => 'নগদ';

  @override
  String get abBankTransfer => 'ব্যাংক ট্রান্সফার';

  @override
  String get abCheque => 'চেক';

  @override
  String get abSaveQuotation => 'কোটেশন সেভ করুন';

  @override
  String get abSaveBill => 'বিল সেভ করুন';

  @override
  String abAdded(String name) {
    return '$name যোগ হয়েছে';
  }

  @override
  String get apNewItem => 'নতুন আইটেম…';

  @override
  String get apNewItemHint => 'আগে ক্যাটালগে নতুন আইটেম যোগ করুন';

  @override
  String get apOfflinePurchase => 'অফলাইন — ক্রয় এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get apEditPo => 'ক্রয় আদেশ সম্পাদনা করুন';

  @override
  String get apNewPo => 'নতুন ক্রয় আদেশ';

  @override
  String get apAddPurchase => 'ক্রয় যোগ করুন';

  @override
  String get apTapAddItem => 'ক্রয় শুরু করতে নিচে \"আইটেম যোগ করুন\" চাপুন';

  @override
  String get apSaveAsPo => 'ক্রয় আদেশ হিসেবে সেভ করুন';

  @override
  String get apPoLocked => 'ইতিমধ্যে প্রাপ্ত ক্রয়কে আবার খসড়া আদেশ করা যায় না';

  @override
  String get apPoNote => 'মাল প্রাপ্ত হিসেবে চিহ্নিত না হওয়া পর্যন্ত স্টক বা খরচ বদলাবে না';

  @override
  String get apUnpaidCredit => 'অপরিশোধিত (বাকি)';

  @override
  String get apSavePo => 'ক্রয় আদেশ সেভ করুন';

  @override
  String get apSavePurchase => 'ক্রয় সেভ করুন';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'বর্তমান খরচ: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'খরচ ঠিক করা নেই  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'স্ক্যান ব্যর্থ: সার্ভার ত্রুটি $code';
  }

  @override
  String get scOfflineSaved => 'অফলাইন — ছবি সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই পড়া হবে';

  @override
  String get scStillOffline => 'এখনও অফলাইন';

  @override
  String get scCouldNotCreateCustomer => 'গ্রাহক তৈরি করা যায়নি — আবার চেষ্টা করুন।';

  @override
  String get scCouldNotCreateSupplier => 'সরবরাহকারী তৈরি করা যায়নি — আবার চেষ্টা করুন।';

  @override
  String scBillSavedFor(String name) {
    return '$name-এর জন্য বিল সেভ হয়েছে';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name থেকে ক্রয় সেভ হয়েছে';
  }

  @override
  String get scWhichCustomer => 'এটি কোন গ্রাহক?';

  @override
  String get scWhichSupplier => 'এটি কোন সরবরাহকারী?';

  @override
  String scClosestMatch(String name, int score) {
    return 'রেকর্ডে সবচেয়ে কাছের মিল: $name ($score% সদৃশ)';
  }

  @override
  String scYesThisIs(String name) {
    return 'হ্যাঁ, এটি $name';
  }

  @override
  String get scOtherwiseCustomer => 'না হলে নতুন গ্রাহক তৈরি করুন:';

  @override
  String get scOtherwiseSupplier => 'না হলে নতুন সরবরাহকারী তৈরি করুন:';

  @override
  String get scNoMatchCustomer => 'কোনো মিলে যাওয়া গ্রাহক পাওয়া যায়নি। নতুন তৈরি করুন:';

  @override
  String get scNoMatchSupplier => 'কোনো মিলে যাওয়া সরবরাহকারী পাওয়া যায়নি। নতুন তৈরি করুন:';

  @override
  String get scCustomerName => 'গ্রাহকের নাম';

  @override
  String get scSupplierName => 'সরবরাহকারীর নাম';

  @override
  String get scCreateNew => 'নতুন তৈরি করুন';

  @override
  String get scTitleBill => 'বিল স্ক্যান করুন';

  @override
  String get scIntroBill => 'বিলের একটা ছবি তুলুন। হাতে লেখা হলেও চলবে, আর সিন্ধি, উর্দু বা ইংরেজি সবই চলে। সেভ হওয়ার আগে আপনি দেখে নিতে পারবেন।';

  @override
  String get scIntroPurchase => 'সরবরাহকারীর ইনভয়েসের একটা ছবি তুলুন। সিন্ধি, উর্দু বা ইংরেজি সবই চলে। সেভ হওয়ার আগে আপনি দেখে নিতে পারবেন।';

  @override
  String get scReadingBill => 'বিল পড়া হচ্ছে…';

  @override
  String get scScanBill => 'বিল স্ক্যান করুন';

  @override
  String get scReadingInvoice => 'ইনভয়েস পড়া হচ্ছে…';

  @override
  String get scScanInvoice => 'ইনভয়েস স্ক্যান করুন';

  @override
  String get scQueued => 'সারিতে থাকা স্ক্যান';

  @override
  String get scReady => 'পর্যালোচনার জন্য প্রস্তুত';

  @override
  String get scFailed => 'ব্যর্থ';

  @override
  String get scWaiting => 'সংযোগের অপেক্ষায়';

  @override
  String get scRetry => 'আবার চেষ্টা করুন';

  @override
  String rpCouldNotLoad(String error) {
    return 'রিপোর্ট লোড করা যায়নি: $error';
  }

  @override
  String get rpHeadline => 'এই মাসের প্রধান সংখ্যা';

  @override
  String get rpProfitThisMonth => 'এই মাসের মুনাফা';

  @override
  String get rpNoData => 'এখনও কোনো ডেটা নেই';

  @override
  String get rpSalesTax => 'সেলস ট্যাক্স';

  @override
  String rpSalesTaxFor(String month) {
    return '$month মাসের সেলস ট্যাক্স রিপোর্ট';
  }

  @override
  String get rpViewSalesTax => 'সেলস ট্যাক্স রিপোর্ট দেখুন';

  @override
  String get rpQuickReports => 'দ্রুত রিপোর্ট';

  @override
  String get rpQuickSub => 'সরাসরি নির্দিষ্ট রিপোর্টে যান';

  @override
  String get expensesTitle => 'খরচ';

  @override
  String get rpRateCard => 'রেট কার্ড';

  @override
  String get rpDetails => 'বিবরণ';

  @override
  String get rpDetailsSub => 'পূর্ণ বিশ্লেষণ ও র‍্যাঙ্কিং';

  @override
  String get rpOutstandingByCustomer => 'গ্রাহক অনুযায়ী বকেয়া';

  @override
  String get rpNoOutstanding => 'কোনো বকেয়া ব্যালেন্স নেই';

  @override
  String get rpMonthlyTotals => 'মাসিক মোট';

  @override
  String get rpMostSold => 'সবচেয়ে বেশি বিক্রিত আইটেম';

  @override
  String get rpNoItemsRecorded => 'এখনও কোনো আইটেম নথিভুক্ত হয়নি';

  @override
  String get rpTopCustomers => 'আয় অনুযায়ী শীর্ষ গ্রাহক';

  @override
  String get rpNoSalesRecorded => 'এখনও কোনো বিক্রি নথিভুক্ত হয়নি';

  @override
  String get rpTotalOutstanding => 'মোট বকেয়া';

  @override
  String get rpViewCustomers => 'গ্রাহক দেখুন';

  @override
  String get lblInvoice => 'ইনভয়েস';

  @override
  String get lblLedger => 'খাতা';

  @override
  String get lblRateCard => 'রেট কার্ড';

  @override
  String get exCsvNeedsRows => 'CSV-তে একটি হেডার সারি এবং অন্তত একটি খরচ থাকতে হবে।';

  @override
  String get exCsvHeader => 'CSV হেডারে \"description\" ও \"amount\" কলাম থাকতে হবে।';

  @override
  String exLineBadAmount(int line) {
    return 'সারি $line: বিবরণ নেই বা পরিমাণ ভুল — ফাইল ঠিক করে আবার চেষ্টা করুন।';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'সারি $line: ভুল তারিখ \"$date\" — YYYY-MM-DD ব্যবহার করুন।';
  }

  @override
  String get exImportTitle => 'খরচ ইমপোর্ট করুন';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\"-এ $countটি খরচ পাওয়া গেছে। সবগুলো ইমপোর্ট করবেন?',
      one: '\"$file\"-এ ১টি খরচ পাওয়া গেছে। সবগুলো ইমপোর্ট করবেন?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি খরচ ইমপোর্ট হয়েছে।',
      one: '১টি খরচ ইমপোর্ট হয়েছে।',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'ইমপোর্ট ব্যর্থ: সার্ভার ত্রুটি $code';
  }

  @override
  String get exDeleteTitle => 'খরচ মুছুন';

  @override
  String get exAdd => 'খরচ যোগ করুন';

  @override
  String get exEdit => 'খরচ সম্পাদনা করুন';

  @override
  String get exDescription => 'বিবরণ';

  @override
  String get exAmountRs => 'পরিমাণ (রুপি)';

  @override
  String get exCategory => 'ক্যাটাগরি';

  @override
  String exDate(String date) {
    return 'তারিখ: $date';
  }

  @override
  String get exRepeats => 'প্রতি মাসে পুনরাবৃত্তি';

  @override
  String get exRepeatsHint => 'ভাড়া, বিদ্যুৎ, মজুরি ইত্যাদি';

  @override
  String get exReceiptTap => 'রসিদের ছবি, বদলাতে ট্যাপ করুন';

  @override
  String get exReceiptOptional => 'রসিদের ছবি (ঐচ্ছিক)';

  @override
  String get exEnterValid => 'বিবরণ ও সঠিক পরিমাণ দিন।';

  @override
  String get exOffline => 'অফলাইন — খরচ এই ডিভাইসে সেভ হয়েছে, অনলাইনে ফিরলে নিজে থেকেই সিঙ্ক হবে';

  @override
  String get exSave => 'খরচ সেভ করুন';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'এই মাসে $countটি পুনরাবৃত্ত খরচ বাকি',
      one: 'এই মাসে ১টি পুনরাবৃত্ত খরচ বাকি',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'যোগ করুন';

  @override
  String get exTotal => 'মোট খরচ';

  @override
  String exCategoryChip(String name) {
    return 'ক্যাটাগরি: $name';
  }

  @override
  String get exNoneLogged => 'এখনও কোনো খরচ নথিভুক্ত হয়নি';

  @override
  String exNoneInCategory(String name) {
    return 'এখনও $name-এর কোনো খরচ নেই';
  }

  @override
  String get exViewReceipt => 'রসিদ দেখুন';

  @override
  String get exEditRow => 'খরচ সম্পাদনা করুন';

  @override
  String get exDeleteRow => 'খরচ মুছুন';

  @override
  String gstServerReturned(String first, String second) {
    return 'সার্ভার $first/$second ফেরত দিয়েছে';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST ডেটা লোড করা যায়নি: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'ডাউনলোড ব্যর্থ ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename সেভ হয়েছে';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'ডাউনলোডস/$filename-এ সেভ হয়েছে';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'ডাউনলোড করা যায়নি: $error';
  }

  @override
  String get gstTitle => 'সেলস ট্যাক্স রিপোর্ট';

  @override
  String get gstOutwardDetail => 'বহির্গামী বিক্রি — ইনভয়েস বিবরণ';

  @override
  String get gstNoBills => 'এই মাসে কোনো বিল নেই।';

  @override
  String get gstHsn => 'HSN সারসংক্ষেপ';

  @override
  String get gstInvoiceWise => 'ইনভয়েস অনুযায়ী বিবরণ';

  @override
  String get gstMonthly => 'মাসিক সারসংক্ষেপ';

  @override
  String get gstOutwardTaxable => 'করযোগ্য বহির্গামী সরবরাহ';

  @override
  String get gstItc => 'ইনপুট ট্যাক্স ক্রেডিট (ক্রয় থেকে)';

  @override
  String get gstSave => 'সেভ করুন';

  @override
  String get rcValidAmount => 'সঠিক পরিমাণ দিন।';

  @override
  String get rcExpected => 'প্রত্যাশিত নগদ (আজকের নগদ বিক্রি)';

  @override
  String get rcAlsoCollected => 'আজ আদায়ও হয়েছে (ড্রয়ারে গণনা হয়নি)';

  @override
  String get rcCounted => 'ড্রয়ারে গোনা নগদ (রুপি)';

  @override
  String get rcCompare => 'তুলনা করুন';

  @override
  String get rcMatches => 'হুবহু মিলেছে!';

  @override
  String rcExtra(String amount) {
    return 'ড্রয়ারে $amount বেশি';
  }

  @override
  String rcMissing(String amount) {
    return 'ড্রয়ারে $amount কম';
  }

  @override
  String get pbiTitle => 'আইটেম অনুযায়ী মুনাফা';

  @override
  String get pbiNoSales => 'এখনও কোনো বিক্রি নেই';

  @override
  String get pbiByCategory => 'ক্যাটাগরি অনুযায়ী';

  @override
  String get pbiItemsByProfit => 'মুনাফা অনুযায়ী আইটেম';

  @override
  String get svTitle => 'স্টকের মূল্য';

  @override
  String get svNone => 'হাতে কোনো স্টক নেই';

  @override
  String get svItemsByValue => 'মূল্য অনুযায়ী আইটেম';

  @override
  String svSummary(String items, String units) {
    return '$itemsটি আইটেম · তাকে $units ইউনিট';
  }

  @override
  String svTied(String amount) {
    return 'স্টকে $amount আটকে আছে';
  }

  @override
  String get svEstimated => 'বিক্রয়মূল্য থেকে আনুমানিক';

  @override
  String get bkRestoreTitle => 'ব্যাকআপ রিস্টোর করবেন?';

  @override
  String bkRestoreBody(String filename) {
    return 'এটি বর্তমান সব ডেটা ব্যাকআপ ফাইল \"$filename\" দিয়ে বদলে দেবে। চালিয়ে যাবেন?';
  }

  @override
  String get bkRestore => 'রিস্টোর করুন';

  @override
  String get bkRestoreDoneTitle => 'রিস্টোর সম্পন্ন';

  @override
  String get bkRestoreDoneBody => 'আপনার ডেটা রিস্টোর হয়েছে।';

  @override
  String get bkOk => 'ঠিক আছে';

  @override
  String bkRestoreFailed(String detail) {
    return 'রিস্টোর ব্যর্থ: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'রিস্টোর করা যায়নি: $error';
  }

  @override
  String get bkSaveToDownloads => 'ডাউনলোডসে সেভ করুন';

  @override
  String get bkIntroAdmin => 'আপনার সব ডেটা একটি ডেটাবেস ফাইলে আছে। নিয়মিত একটি কপি ডাউনলোড করুন, আর কিছু গোলমাল হলে রিস্টোর করুন।';

  @override
  String get bkIntroStaff => 'পুরো ডেটাবেস ব্যাকআপ ও রিস্টোর শুধু অ্যাডমিনদের জন্য। অ্যাডমিনকে বলুন, অথবা যা দরকার নিচে CSV-তে এক্সপোর্ট করুন।';

  @override
  String get bkBackupDb => 'ডেটাবেস ব্যাকআপ';

  @override
  String get bkBackupDbSub => 'পুরো ডেটাবেস একটি ফাইলে ডাউনলোড করে শেয়ার করুন (হোয়াটসঅ্যাপ, ড্রাইভ, ইমেইল)।';

  @override
  String get bkDownloadPhone => 'ব্যাকআপ ফোনে ডাউনলোড করুন';

  @override
  String get bkShareBackup => 'ব্যাকআপ শেয়ার করুন';

  @override
  String get bkAutoTitle => 'স্বয়ংক্রিয় ব্যাকআপ';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'সার্ভারে $countটি দৈনিক ব্যাকআপ জমা আছে, সবচেয়ে নতুনটি $time-এর। এটি নিজে থেকেই চলে — এখানে কিছু করার নেই।',
      one: 'সার্ভারে ১টি দৈনিক ব্যাকআপ জমা আছে, সবচেয়ে নতুনটি $time-এর। এটি নিজে থেকেই চলে — এখানে কিছু করার নেই।',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'বর্তমান ডেটা বদলাতে একটি সেভ করা ব্যাকআপ ফাইল বেছে নিন।';

  @override
  String get bkRestoreFromFile => 'ব্যাকআপ ফাইল থেকে রিস্টোর করুন';

  @override
  String get bkExportCsv => 'CSV-তে এক্সপোর্ট করুন';

  @override
  String get bkExportSub => 'এগুলো এক্সেলে খুলুন বা শেয়ার করুন।';

  @override
  String get bkRangeAll => 'বিল/খরচ: সব সময়';

  @override
  String bkRangeSome(String end, String start) {
    return 'বিল/খরচ: $start থেকে $end';
  }

  @override
  String get bkSetRange => 'সময়সীমা ঠিক করুন';

  @override
  String get bkClearRange => 'সময়সীমা মুছুন';

  @override
  String get ntNever => 'কখনও চালানো হয়নি';

  @override
  String get ntJustNow => 'এইমাত্র';

  @override
  String ntMinutesAgo(int count) {
    return '$count মিনিট আগে';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count ঘণ্টা আগে';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count দিন আগে';
  }

  @override
  String get ntTitle => 'স্মার্ট নোটিফিকেশন';

  @override
  String get ntTapHint => 'নোটিফিকেশন চালিয়ে সরাসরি ফলাফল দেখতে \"এখনই দেখুন\" চাপুন।';

  @override
  String get ntLowStockSub => 'আইটেম রিঅর্ডার স্তরের নিচে নামলে জানান।';

  @override
  String get ntCheckNow => 'এখনই দেখুন';

  @override
  String get ntOverdue => 'বকেয়া পেমেন্ট রিমাইন্ডার';

  @override
  String get ntOverdueSub => 'আগের দিনের অপরিশোধিত বিলের বিষয়ে জানান।';

  @override
  String get ntDaily => 'দৈনিক ব্যবসার সারসংক্ষেপ';

  @override
  String get ntDailySub => 'গতকালের বিক্রি, আদায় ও মুনাফা এক নজরে।';

  @override
  String get ntSendSummary => 'সারসংক্ষেপ পাঠান';

  @override
  String get ntRunning => 'চলছে…';

  @override
  String get ntLowStockItems => 'কম স্টকের আইটেম';

  @override
  String get ntSales => 'বিক্রি';

  @override
  String get ntCollected => 'আদায়';

  @override
  String get ntProfit => 'মুনাফা';

  @override
  String get auChecking => 'আপডেট খোঁজা হচ্ছে…';

  @override
  String get auLatest => 'আপনার কাছে সর্বশেষ সংস্করণ আছে।';

  @override
  String get auAvailable => 'আপডেট পাওয়া যাচ্ছে';

  @override
  String auNewer(int code) {
    return 'Book-Keep-এর নতুন সংস্করণ (বিল্ড $code) প্রস্তুত।';
  }

  @override
  String get auLater => 'পরে';

  @override
  String get auUpdate => 'আপডেট করুন';

  @override
  String get auDownloading => 'আপডেট ডাউনলোড হচ্ছে';

  @override
  String auSaved(String name) {
    return '$name আপনার ডাউনলোড ফোল্ডারে সেভ হয়েছে।';
  }

  @override
  String get auAllowInstall => 'Book-Keep-কে অ্যাপ ইনস্টল করার অনুমতি দিন, তারপর আবার আপডেট চাপুন।';

  @override
  String get auFailed => 'আপডেট করা যায়নি — সংযোগ পরীক্ষা করে আবার চেষ্টা করুন।';

  @override
  String get lgSearch => 'ভাষা খুঁজুন';

  @override
  String lgNoMatch(String query) {
    return '\"$query\"-এর সাথে কোনো ভাষা মেলেনি';
  }

  @override
  String get alVoided => 'একটি বিল বাতিল করেছেন';

  @override
  String get alDeletedBill => 'একটি বিল মুছেছেন';

  @override
  String get alReturned => 'একটি বিল ফেরত দিয়েছেন';

  @override
  String get alDeletedCustomer => 'একজন গ্রাহক মুছেছেন';

  @override
  String get alDeletedSupplier => 'একজন সরবরাহকারী মুছেছেন';

  @override
  String get alCreatedAccount => 'একটি অ্যাকাউন্ট তৈরি করেছেন';

  @override
  String get alUpdatedAccount => 'একটি অ্যাকাউন্ট আপডেট করেছেন';

  @override
  String get alDeletedAccount => 'একটি অ্যাকাউন্ট মুছেছেন';

  @override
  String get alTitle => 'কার্যকলাপের লগ';

  @override
  String get alNone => 'এখনও কোনো কার্যকলাপ নথিভুক্ত হয়নি';

  @override
  String get blkEnterOne => 'কমপক্ষে একটি আইটেম দিন';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি আইটেম সফলভাবে যোগ হয়েছে',
      one: '১টি আইটেম সফলভাবে যোগ হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'একসাথে আইটেম যোগ করুন';

  @override
  String get blkFormat => 'প্রতি লাইনে একটি আইটেম, ফরম্যাট: নাম, দাম, একক, ক্যাটাগরি';

  @override
  String get blkOptional => 'একক ও ক্যাটাগরি ঐচ্ছিক (ডিফল্ট: piece, কিছু নয়)';

  @override
  String get blkAddAll => 'সব আইটেম যোগ করুন';

  @override
  String get prSend => 'পেমেন্ট রিমাইন্ডার পাঠান';

  @override
  String get prTone => 'সুর বেছে নিন:';

  @override
  String get prPolite => 'বিনয়ী';

  @override
  String get prStandard => 'সাধারণ';

  @override
  String get prUrgent => 'জরুরি';

  @override
  String get prPreviewQr => 'জ্যাজক্যাশ পেমেন্ট QR-এর প্রিভিউ';

  @override
  String get prShareText => 'টেক্সট শেয়ার করুন';

  @override
  String get dsRemaining => 'বাকি';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount ছাড় সহ';
  }

  @override
  String get dsItems => 'আইটেম';

  @override
  String get dsDiscount => 'ছাড়';

  @override
  String get lkWrongPin => 'ভুল PIN';

  @override
  String get lkEnterPin => 'PIN দিন';

  @override
  String get lkChecking => 'আঙুলের ছাপ যাচাই করা হচ্ছে...';

  @override
  String get bcTitle => 'বারকোড স্ক্যান করুন';

  @override
  String get bcTorchNa => 'এই ডিভাইসে টর্চ পাওয়া যাচ্ছে না';

  @override
  String get bcTorch => 'টর্চ';

  @override
  String get bcPoint => 'ক্যামেরা বারকোডের দিকে ধরুন';

  @override
  String get qrNoNumber => 'কোনো জ্যাজক্যাশ নম্বর সেট করা নেই। পেমেন্ট QR দেখাতে সেটিংসে এটি সেট করুন।';

  @override
  String get qrPay => 'জ্যাজক্যাশে পেমেন্ট করুন';

  @override
  String get qrInvalid => 'অবৈধ QR ডেটা';

  @override
  String qrAmount(String amount) {
    return 'পরিমাণ: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'জ্যাজক্যাশ: $number';
  }

  @override
  String get qrCopy => 'জ্যাজক্যাশ নম্বর কপি করুন';

  @override
  String get qrCopied => 'জ্যাজক্যাশ নম্বর ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get qrHint => 'পেমেন্ট করতে এই নম্বরটি আপনার জ্যাজক্যাশ অ্যাপে স্ক্যান বা কপি করুন।';

  @override
  String clOwed(String amount) {
    return '$amount বকেয়া';
  }

  @override
  String get lnEnterEmailFirst => 'আগে উপরে একটি সঠিক ইমেইল দিন।';

  @override
  String get lnResetSent => 'পাসওয়ার্ড রিসেট ইমেইল পাঠানো হয়েছে — আপনার ইনবক্স দেখুন।';

  @override
  String get lnNoAccount => 'এই ইমেইলের কোনো অ্যাকাউন্ট পাওয়া যায়নি।';

  @override
  String get lnWrongPassword => 'পাসওয়ার্ড ভুল।';

  @override
  String get lnInvalidEmail => 'এটি সঠিক ইমেইল ঠিকানা মনে হচ্ছে না।';

  @override
  String get lnDisabled => 'এই অ্যাকাউন্টটি বন্ধ করা হয়েছে।';

  @override
  String get lnTooMany => 'অনেক বেশি চেষ্টা — এক মিনিট পরে আবার চেষ্টা করুন।';

  @override
  String get lnNoInternet => 'ইন্টারনেট সংযোগ নেই।';

  @override
  String get lnWeakPassword => 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে।';

  @override
  String get lnCouldNotSignIn => 'সাইন ইন করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get lnWrongPasswordHint => 'পাসওয়ার্ড ভুল। আবার চেষ্টা করুন বা \"পাসওয়ার্ড ভুলে গেছেন?\" চাপুন।';

  @override
  String get lnWrongEmail => 'ইমেইল ভুল — এই ঠিকানার কোনো অ্যাকাউন্ট নেই।';

  @override
  String get lnWrongEmailOrPassword => 'ইমেইল বা পাসওয়ার্ড ভুল।';

  @override
  String get lnWrongUsername => 'ইউজারনেম ভুল — এই নামের কোনো অ্যাকাউন্ট নেই।';

  @override
  String get lnWelcome => 'ফিরে আসায় স্বাগতম';

  @override
  String lnSignInTo(String app) {
    return '$app-এ সাইন ইন করুন';
  }

  @override
  String get lnEmailOrUsername => 'ইমেইল বা ইউজারনেম';

  @override
  String get lnRemember => 'আমাকে মনে রাখুন';

  @override
  String get lnForgot => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get lnSignIn => 'সাইন ইন';

  @override
  String get lnGoogle => 'Google দিয়ে চালিয়ে যান';

  @override
  String get lnNew => 'নতুন?';

  @override
  String get lnCreate => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String suCreated(String email) {
    return '$email-এর জন্য অ্যাকাউন্ট তৈরি হয়েছে। একটি যাচাইকরণ ইমেইল পাঠানো হয়েছে (ঐচ্ছিক)।';
  }

  @override
  String suSetup(String app) {
    return '$app সেট আপ করুন';
  }

  @override
  String get suName => 'নাম';

  @override
  String get suEmail => 'ইমেইল';

  @override
  String suPhoneDigits(int digits) {
    return 'একটি সঠিক $digits অঙ্কের নম্বর দিন';
  }

  @override
  String get suCreateBtn => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get suHaveAccount => 'আগে থেকেই অ্যাকাউন্ট আছে?';

  @override
  String get suAlreadyExists => 'এই ইমেইলের অ্যাকাউন্ট আগে থেকেই আছে।';

  @override
  String get suInvalidEmail => 'ইমেইল ঠিকানা সঠিক নয়।';

  @override
  String get agShow => 'পাসওয়ার্ড দেখান';

  @override
  String get agHide => 'পাসওয়ার্ড লুকান';

  @override
  String get adAccounts => 'অ্যাকাউন্ট';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি নিবন্ধিত অ্যাকাউন্ট',
      one: '১টি নিবন্ধিত অ্যাকাউন্ট',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'যোগ করুন';

  @override
  String get adNoAccounts => 'কোনো অ্যাকাউন্ট পাওয়া যায়নি।';

  @override
  String get adAccountability => 'জবাবদিহি';

  @override
  String get adAccountabilitySub => 'কে কী বাতিল, মুছেছে বা ফেরত দিয়েছে, এবং অ্যাকাউন্টের পরিবর্তন।';

  @override
  String get adActivitySub => 'বাতিল বিল, মোছা এবং অ্যাকাউন্টের পরিবর্তন';

  @override
  String get adServer => 'সার্ভার';

  @override
  String get adServerSub => 'এই অ্যাপ কার সাথে কথা বলে। সেটআপের পর প্রায় বদলানোর দরকার হয় না।';

  @override
  String get adServerHint => 'এমুলেটর 10.0.2.2 ব্যবহার করে; আসল ফোনে একই ওয়াই-ফাইয়ে ল্যাপটপের IP লাগে। এটি বদলালে সব অ্যাকাউন্টে প্রভাব পড়ে।';

  @override
  String get adApiBase => 'API বেস URL';

  @override
  String get adSaveServer => 'সার্ভারের ঠিকানা সেভ করুন';

  @override
  String get adEmailSetSub => 'সেট আপ করা আছে — কর্মীরা গ্রাহকদের ইনভয়েস/স্টেটমেন্ট ইমেইল করতে পারে।';

  @override
  String get adNotSetUp => 'এখনও সেট আপ করা হয়নি।';

  @override
  String get adEmailSetBody => 'ইমেইল সেট আপ করা আছে। কর্মীরা সরাসরি গ্রাহককে ইনভয়েস বা স্টেটমেন্ট ইমেইল করতে পারে।';

  @override
  String get adEmailHelp => 'Gmail ঠিকানা অ্যাপ পাসওয়ার্ডসহ কাজ করে (smtp.gmail.com, পোর্ট 587), অথবা আপনার ইমেইল প্রদানকারীর SMTP তথ্য ব্যবহার করুন।';

  @override
  String get adSmtpHost => 'SMTP হোস্ট';

  @override
  String get adSmtpPort => 'SMTP পোর্ট';

  @override
  String get adEmailAddress => 'ইমেইল ঠিকানা';

  @override
  String get adPwKeep => 'পাসওয়ার্ড (বর্তমানটি রাখতে ফাঁকা রাখুন)';

  @override
  String get adPwApp => 'পাসওয়ার্ড (অ্যাপ পাসওয়ার্ড, লগইন পাসওয়ার্ড নয়)';

  @override
  String get adFromName => 'প্রেরকের নাম (ঐচ্ছিক)';

  @override
  String get adFromHint => 'আমার হার্ডওয়্যার দোকান';

  @override
  String get adSaving => 'সেভ হচ্ছে...';

  @override
  String get adSaveEmail => 'ইমেইল সেটিংস সেভ করুন';

  @override
  String get adAddAccount => 'অ্যাকাউন্ট যোগ করুন';

  @override
  String get adNameOpt => 'নাম (ঐচ্ছিক)';

  @override
  String get adAtLeast6 => 'কমপক্ষে ৬টি অক্ষর';

  @override
  String get adGrantAdmin => 'অ্যাডমিন করুন';

  @override
  String get adCanManage => 'বাতিল/মোছা/ফেরত দিতে পারে';

  @override
  String get adCanManageHint => 'বিল বাতিল বা মোছা, বিল ফেরত দেওয়া, বা গ্রাহক/সরবরাহকারী মোছা। অ্যাডমিনের এটি সবসময় থাকে।';

  @override
  String get adCreate => 'তৈরি করুন';

  @override
  String get adAccountCreated => 'অ্যাকাউন্ট তৈরি হয়েছে।';

  @override
  String adCreateFailed(String error) {
    return 'তৈরি ব্যর্থ: $error';
  }

  @override
  String get adEditAccount => 'অ্যাকাউন্ট সম্পাদনা করুন';

  @override
  String get adAdminSwitch => 'অ্যাডমিন';

  @override
  String get adAdminHint => 'অ্যাডমিন প্যানেল খুলতে পারে';

  @override
  String get adDisabled => 'বন্ধ';

  @override
  String get adDisabledHint => 'সাইন ইন থেকে আটকানো';

  @override
  String get adAccountUpdated => 'অ্যাকাউন্ট আপডেট হয়েছে।';

  @override
  String adUpdateFailed(String error) {
    return 'আপডেট ব্যর্থ: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label স্থায়ীভাবে সরিয়ে দেওয়া হবে এবং আর সাইন ইন করতে পারবে না।';
  }

  @override
  String get adAccountDeleted => 'অ্যাকাউন্ট মোছা হয়েছে।';

  @override
  String adDeleteFailed(String error) {
    return 'মোছা ব্যর্থ: $error';
  }

  @override
  String get adBadgeAdmin => 'অ্যাডমিন';

  @override
  String get adBadgeDisabled => 'বন্ধ';

  @override
  String get adOff => 'অ্যাডমিন প্যানেল বন্ধ';

  @override
  String get adCheckAgain => 'আবার দেখুন';

  @override
  String get adAccessRequired => 'অ্যাডমিন অ্যাক্সেস প্রয়োজন';

  @override
  String get adAccessBody => 'শুধু দোকানের অ্যাডমিনরা অ্যাকাউন্ট পরিচালনা করতে পারেন। দোকানের মালিকের কাছে অ্যাডমিন অ্যাক্সেস চান।';

  @override
  String get adCouldNotLoad => 'অ্যাডমিন প্যানেল লোড করা যায়নি।';

  @override
  String get adBadPort => 'একটি সঠিক SMTP পোর্ট নম্বর দিন।';

  @override
  String get adEmailSaved => 'ইমেইল সেটিংস সেভ হয়েছে।';

  @override
  String adEmailSaveFailed(String error) {
    return 'ইমেইল সেটিংস সেভ করা যায়নি: $error';
  }

  @override
  String get adServerEmpty => 'সার্ভারের ঠিকানা খালি রাখা যাবে না।';

  @override
  String get adServerSaved => 'সার্ভারের ঠিকানা সেভ হয়েছে। স্ক্রিনগুলো পরের লোডে এটি ব্যবহার করবে।';

  @override
  String get lnOr => 'অথবা';

  @override
  String get scNotABill => 'এটা বিল বলে মনে হচ্ছে না। বিলের একটা পরিষ্কার ছবি দিয়ে আবার চেষ্টা করুন।';

  @override
  String get scNotAnInvoice => 'এটা ইনভয়েস বলে মনে হচ্ছে না। সরবরাহকারীর ইনভয়েসের একটা পরিষ্কার ছবি দিয়ে আবার চেষ্টা করুন।';

  @override
  String get jqOpenFull => 'বড় করুন';

  @override
  String get jqCopy => 'নম্বর কপি করুন';

  @override
  String get jqSheetTitle => 'জ্যাজক্যাশ QR';

  @override
  String get jqSheetHint => 'গ্রাহকরা আপনাকে পেমেন্ট করতে এটি তাদের জ্যাজক্যাশ অ্যাপে স্ক্যান করেন।';

  @override
  String get jqCheck => 'নম্বরটা আবার দেখুন';

  @override
  String get askVoice => 'কণ্ঠ';

  @override
  String get askVoiceFallbackNote => 'আপনার ফোনের কণ্ঠে এটি পড়া হচ্ছে।';

  @override
  String get askPace => 'গতি';

  @override
  String get askTone => 'সুর';

  @override
  String get askPaceSlower => 'ধীরে';

  @override
  String get askPaceNormal => 'স্বাভাবিক';

  @override
  String get askPaceFaster => 'দ্রুত';

  @override
  String get askToneCalm => 'শান্ত';

  @override
  String get askToneWarm => 'উষ্ণ';

  @override
  String get askToneCheerful => 'প্রফুল্ল';

  @override
  String qPaymentUpdate(String amount) {
    return 'পেমেন্ট আপডেট: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'গ্রাহক: $name';
  }

  @override
  String qSupplier(String name) {
    return 'সরবরাহকারী: $name';
  }

  @override
  String qItem(String name) {
    return 'পণ্য: $name';
  }

  @override
  String qExpense(String name) {
    return 'খরচ: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'ক্রয়: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$name-এর কাছ থেকে পেমেন্ট সংগ্রহ: $amount';
  }

  @override
  String gstAmount(String amount) {
    return 'কর $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'করযোগ্য $taxable  ·  কর $tax  ·  মোট $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'আয়: $revenue  •  পণ্যের খরচ: $cogs  •  খরচ: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'হ্যালো $customer, $shop-এর পক্ষ থেকে শুভেচ্ছা! আপনার মোট বকেয়া $amount। ধন্যবাদ!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'হ্যালো $customer, $shop-এর পক্ষ থেকে $amount বকেয়া পরিশোধের অনুস্মারক। অনুগ্রহ করে দ্রুততম সময়ে পরিশোধ করুন।';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'জরুরি নোটিশ: প্রিয় $customer, $shop-এ আপনার $amount বকেয়া অপরিশোধিত। অনুগ্রহ করে এখনই পরিশোধ করুন।';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCash-এ পরিশোধ করুন: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop-এর চালান\nমোট: $total\nপণ্য: $items\nঅবস্থা: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'হ্যালো $supplier, আমরা $shop। আমরা নিম্নলিখিত পণ্যের অর্ডার দিতে চাই:\n$lines\n\nঅনুগ্রহ করে প্রাপ্যতা ও দাম নিশ্চিত করুন। ধন্যবাদ।';
  }

  @override
  String ppUpdated(String date) {
    return 'সর্বশেষ হালনাগাদ: $date';
  }

  @override
  String get ppWhoH => 'আমরা কারা';

  @override
  String ppWho(String owner, String email) {
    return '$owner, যিনি Book-keep পরিচালনা করেন।\nযোগাযোগ: $email';
  }

  @override
  String get ppCollectH => 'আমরা কী সংগ্রহ করি';

  @override
  String get ppCollectAccount => 'অ্যাকাউন্ট: ইমেইল, ফোন নম্বর ও ইউজারনেম, Firebase Authentication-এর মাধ্যমে।';

  @override
  String get ppCollectShop => 'দোকানের প্রোফাইল: দোকানের নাম, ঠিকানা, ফোন নম্বর, JazzCash নম্বর ও দোকানের লোগো — যা দোকানের মালিক সেটিংসে দেন।';

  @override
  String get ppCollectRecords => 'আপনার তৈরি ব্যবসায়িক রেকর্ড: ক্রেতা ও সরবরাহকারীর নাম ও ফোন নম্বর, বিল, ক্রয়, পণ্যের তালিকা (পণ্যের ছবি ও বারকোড সহ) এবং খরচ (রসিদের ছবি সহ)। এটি অ্যাপের মূল তথ্য — হিসাব-নিকাশ এভাবেই কাজ করে।';

  @override
  String get ppCollectDevice => 'ডিভাইস ও ডায়াগনস্টিক তথ্য: পুশ-নোটিফিকেশন টোকেন (কম স্টক, বকেয়া পেমেন্ট ও দৈনিক সারসংক্ষেপের সতর্কতার জন্য) এবং Firebase Crashlytics-এর মাধ্যমে ক্র্যাশ রিপোর্ট (ডিভাইসের তথ্য ও স্ট্যাক ট্রেস), যা অ্যাপ ক্র্যাশ করলে স্বয়ংক্রিয়ভাবে পাঠানো হয়।';

  @override
  String ppCollectAi(String askShop) {
    return 'AI সুবিধা: $askShop, AI সকালের সারসংক্ষেপ এবং AI বিল/ক্রয় স্ক্যানার উত্তর, সারসংক্ষেপ বা বের করা লাইন তৈরির জন্য সংশ্লিষ্ট ব্যবসায়িক তথ্যের একটি স্ন্যাপশট (রিপোর্টের সংখ্যা বা বিলের ছবি) Google-এর Gemini API-তে পাঠায়। উত্তর তৈরির জন্য Google এই তথ্য প্রক্রিয়া করে; আমরা বা Google এটি Google-এর স্ট্যান্ডার্ড API শর্তের বাইরে মডেল প্রশিক্ষণে ব্যবহার করি না।';
  }

  @override
  String get ppDontH => 'আমরা যা করি না';

  @override
  String get ppDontLocation => 'আমরা আপনার অবস্থান ট্র্যাক করি না।';

  @override
  String get ppDontAds => 'আমরা বিজ্ঞাপন নেটওয়ার্ক বা আচরণ-বিশ্লেষণ/সেশন-রেকর্ডিং টুল ব্যবহার করি না।';

  @override
  String get ppDontSell => 'আমরা আপনার তথ্য বা আপনার ক্রেতাদের তথ্য কারও কাছে বিক্রি করি না।';

  @override
  String get ppWhereH => 'তথ্য কোথায় থাকে';

  @override
  String get ppWhereDb => 'ডেটাবেস: Neon (Postgres), একটি তৃতীয় পক্ষের ক্লাউড ডেটাবেস প্রদানকারী।';

  @override
  String get ppWhereFirebase => 'প্রমাণীকরণ, পুশ নোটিফিকেশন, ক্র্যাশ রিপোর্ট, ছবি সংরক্ষণ: Firebase (Google)।';

  @override
  String get ppWhereAi => 'AI প্রক্রিয়াকরণ: Google Gemini API।';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'ইনভয়েস ইমেইল: আপনার দোকানের অ্যাডমিন $adminPanel-এ যে SMTP অ্যাকাউন্ট সেট করেন তার মাধ্যমে পাঠানো হয়। আমাদের কোনো মেইলিং লিস্ট নেই; এই ইমেইলগুলো আপনার নিজের ক্রেতাদের কাছে একে একে পাঠানো বিল/স্টেটমেন্ট, গণ-বিপণন নয়।';
  }

  @override
  String get ppYoursH => 'আপনার তথ্য, আপনার ক্রেতাদের তথ্য';

  @override
  String get ppYours => 'আপনি যা কিছু দেন — ক্রেতা, সরবরাহকারী, বিল, পণ্য — সবই আপনার দোকানের। Book-keep ব্যবহারকারী অন্য দোকান তা দেখতে পারে না। আপনার তৈরি স্টাফ অ্যাকাউন্ট শুধু সেটুকুই দেখে যতটুকুর অনুমতি আপনি দেন।';

  @override
  String get ppControlsH => 'আপনার নিয়ন্ত্রণ';

  @override
  String ppControlExport(String path) {
    return 'আপনার তথ্য এক্সপোর্ট বা ব্যাকআপ করুন: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'আপনার অ্যাকাউন্ট মুছুন: $path। এতে শুধু আপনার সাইন-ইন তথ্য মুছে যায়; আপনার দোকানের ব্যবসায়িক রেকর্ড (বিল, ক্রেতা, পণ্য ইত্যাদি) মুছে যায় না, যেমন কোনো স্টাফ সদস্যকে সরালে তাঁর তৈরি রেকর্ড মুছে যায় না।';
  }

  @override
  String ppControlNotif(String path) {
    return 'নোটিফিকেশন: ধরন অনুযায়ী $path-এ বন্ধ করা যায়।';
  }

  @override
  String get ppChildrenH => 'শিশু';

  @override
  String get ppChildren => 'Book-keep দোকান মালিক ও কর্মীদের জন্য একটি ব্যবসায়িক টুল। এটি শিশুদের জন্য নয় এবং শিশুরা জেনেশুনে এটি ব্যবহার করে না।';

  @override
  String get ppChangesH => 'এই নীতিতে পরিবর্তন';

  @override
  String get ppChanges => 'আমরা যা সংগ্রহ করি বা তা যেখানে যায় তা বদলালে আমরা এই পাতা হালনাগাদ করব এবং উপরের তারিখ বদলাব।';

  @override
  String get ppContactH => 'যোগাযোগ';

  @override
  String ppContact(String email) {
    return 'এই নীতি বা আপনার তথ্য নিয়ে প্রশ্ন: $email';
  }

  @override
  String get waHello => 'হ্যালো!';

  @override
  String waHelloNamed(String name) {
    return 'হ্যালো $name,';
  }

  @override
  String get gstTaxable => 'করযোগ্য';

  @override
  String get gstTax => 'কর';

  @override
  String get gstTaxableValue => 'করযোগ্য মূল্য';

  @override
  String get gstTotalTax => 'মোট কর';

  @override
  String get gstTotalItc => 'মোট ইনপুট ট্যাক্স ক্রেডিট';

  @override
  String get gstExempt => 'করমুক্ত সরবরাহ';

  @override
  String get gstNetPayable => 'নিট প্রদেয় কর';

  @override
  String get unknownName => 'অজানা';

  @override
  String get unitPiece => 'পিস';

  @override
  String get unitKg => 'কেজি';

  @override
  String get unitMeter => 'মিটার';

  @override
  String get unitBox => 'বাক্স';

  @override
  String get unitDozen => 'ডজন';

  @override
  String get unitLiter => 'লিটার';

  @override
  String get unitBag => 'ব্যাগ';

  @override
  String deleteSupplierMessage(String name) {
    return '$name এবং তাঁর সব ক্রয় মুছে ফেলবেন? এটি ফেরানো যাবে না।';
  }
}
