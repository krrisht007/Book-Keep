// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get navHome => 'होम';

  @override
  String get navCustomers => 'ग्राहक';

  @override
  String get navItems => 'वस्तुएं';

  @override
  String get navSuppliers => 'आपूर्तिकर्ता';

  @override
  String get navReports => 'रिपोर्ट';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get settingsShopDetailsTitle => 'दुकान का विवरण';

  @override
  String get settingsShopDetailsSubtitle => 'आपके इनवॉइस पर दिखाया जाता है।';

  @override
  String get settingsShopNameLabel => 'दुकान का नाम';

  @override
  String get settingsShopAddressLabel => 'दुकान का पता';

  @override
  String get settingsPhoneLabel => 'फ़ोन';

  @override
  String get settingsSaveShopDetails => 'दुकान का विवरण सहेजें';

  @override
  String get settingsAppearanceTitle => 'दिखावट';

  @override
  String get settingsAppearanceSubtitle => 'पूरे ऐप के लिए थीम चुनें।';

  @override
  String get themeLight => 'हल्का';

  @override
  String get themeDark => 'गहरा';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get settingsLanguageTitle => 'भाषा';

  @override
  String get settingsLanguageSubtitle => 'ऐप की प्रदर्शन भाषा चुनें।';

  @override
  String get sortNameNewest => 'क्रम: नाम / नवीनतम';

  @override
  String get addCustomer => 'ग्राहक जोड़ें';

  @override
  String get importCsv => 'CSV आयात करें';

  @override
  String get searchShop => 'दुकान में खोजें';

  @override
  String get scanToFindItem => 'सामान खोजने के लिए स्कैन करें';

  @override
  String get bulkAdd => 'एक साथ जोड़ें';

  @override
  String get updateStock => 'स्टॉक अपडेट करें';

  @override
  String get printLabels => 'लेबल प्रिंट करें';

  @override
  String get mergeDuplicates => 'डुप्लिकेट मिलाएँ';

  @override
  String get addSupplier => 'सप्लायर जोड़ें';

  @override
  String get scanPurchaseInvoice => 'खरीद इनवॉइस स्कैन करें';

  @override
  String askNoAnswer(String reason) {
    return 'जवाब नहीं मिल सका: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'कनेक्ट नहीं हो सका: $error';
  }

  @override
  String get micPermissionNeeded => 'आवाज़ से पूछने के लिए माइक्रोफ़ोन की अनुमति चाहिए।';

  @override
  String get speechUnavailable => 'इस डिवाइस पर आवाज़ पहचान उपलब्ध नहीं है।';

  @override
  String get askYourShop => 'अपनी दुकान से पूछें';

  @override
  String get close => 'बंद करें';

  @override
  String get askIntro => 'जानना चाहते हैं दुकान कैसी चल रही है? मुझसे पूछिए, आपकी बही में जो दर्ज है उसी से जवाब मिलेगा।';

  @override
  String get askListening => 'सुन रहा है…';

  @override
  String get askThinkingWords => 'सोच रहा है…|काम चल रहा है…|हिसाब लगा रहा है…|बही-खाते देख रहा है…|जोड़ रहा है…|आँकड़े देख रहा है…';

  @override
  String get askSayQuestion => 'अपना सवाल बोलें — रद्द करने के लिए गोले पर टैप करें';

  @override
  String briefingRefreshFailed(int code) {
    return 'ब्रीफ़िंग रीफ़्रेश नहीं हो सकी ($code)।';
  }

  @override
  String get refreshFailedOffline => 'रीफ़्रेश नहीं हो सका — अपना कनेक्शन जाँचें।';

  @override
  String get newBillFailed => 'नया बिल शुरू नहीं हो सका — कनेक्शन जाँचकर फिर कोशिश करें।';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'पहले $name के लिए पसंदीदा सप्लायर चुनें (बदलने के लिए टैप करें)।';
  }

  @override
  String get reorderBySupplier => 'सप्लायर के अनुसार फिर से ऑर्डर';

  @override
  String get supplier => 'सप्लायर';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सामान',
      one: '1 सामान',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'कम स्टॉक वाले किसी सामान का पसंदीदा सप्लायर अभी तय नहीं है।';

  @override
  String get thisSupplier => 'यह सप्लायर';

  @override
  String supplierNoPhone(String name) {
    return '$name का फ़ोन नंबर दर्ज नहीं है।';
  }

  @override
  String get tabOverview => 'सारांश';

  @override
  String get tabStock => 'स्टॉक';

  @override
  String get tabMoney => 'पैसा';

  @override
  String get taglineOverview => 'आज का बकाया, स्टॉक और नकद एक नज़र में।';

  @override
  String get taglineStock => 'क्या बिक रहा है, क्या कम हो रहा है।';

  @override
  String get taglineMoney => 'खर्च, मिलान और वसूली।';

  @override
  String loadingDashboard(int done, int total) {
    return 'डैशबोर्ड लोड हो रहा है… $total में से $done';
  }

  @override
  String get dashboardLoadFailed => 'डैशबोर्ड लोड नहीं हो सका';

  @override
  String get checkConnectionRetry => 'अपना कनेक्शन जाँचें और फिर कोशिश करें।';

  @override
  String get retry => 'फिर कोशिश करें';

  @override
  String get aiBriefing => 'AI ब्रीफ़िंग';

  @override
  String get briefingPrompt => 'कल का कारोबार कुछ वाक्यों में देखें।';

  @override
  String get getBriefing => 'ब्रीफ़िंग पाएँ';

  @override
  String get refreshBriefing => 'ब्रीफ़िंग रीफ़्रेश करें';

  @override
  String updatedAt(String time) {
    return 'अपडेट $time';
  }

  @override
  String get customersUnknown => '— ग्राहक';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ग्राहक',
      one: '1 ग्राहक',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'पिछला महीना';

  @override
  String get nextMonth => 'अगला महीना';

  @override
  String get salesMonth => 'बिक्री (महीना)';

  @override
  String get outstanding => 'बकाया';

  @override
  String get profitMonth => 'मुनाफ़ा (महीना)';

  @override
  String get cashToday => 'आज का नकद';

  @override
  String get newBill => 'नया बिल';

  @override
  String get scanHandwrittenBill => 'हाथ से लिखा बिल स्कैन करें';

  @override
  String get topOutstanding => 'सबसे ज़्यादा बकाया';

  @override
  String viewAllInDues(int count) {
    return 'बकाया केंद्र में सभी $count देखें';
  }

  @override
  String get lowStockAlerts => 'कम स्टॉक अलर्ट';

  @override
  String get noLowStock => 'कोई सामान कम स्टॉक में नहीं — स्टॉक ठीक है।';

  @override
  String get whatsappAll => 'सभी को WhatsApp';

  @override
  String get reorderAll => 'सब फिर से ऑर्डर करें';

  @override
  String suggestReorder(String qty, String unit) {
    return 'सुझाव: $qty $unit फिर से ऑर्डर करें';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit बाकी';
  }

  @override
  String get reorder => 'फिर से ऑर्डर';

  @override
  String get whatsappSupplier => 'सप्लायर को WhatsApp';

  @override
  String get topItemsByRevenue => 'कमाई के अनुसार शीर्ष सामान';

  @override
  String get noSalesYet => 'अभी कोई बिक्री दर्ज नहीं।';

  @override
  String qtyLabel(String qty) {
    return 'मात्रा: $qty';
  }

  @override
  String get monthExpenses => 'इस महीने के खर्च';

  @override
  String get noExpensesMonth => 'इस महीने कोई खर्च दर्ज नहीं।';

  @override
  String get quickActions => 'त्वरित काम';

  @override
  String get dailyCashReconciliation => 'रोज़ का नकद मिलान';

  @override
  String get collectMoney => 'पैसा वसूलें';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बदलाव ऑफ़लाइन सहेजे गए',
      one: '1 बदलाव ऑफ़लाइन सहेजा गया',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get syncing => 'सिंक हो रहा है';

  @override
  String get sync => 'सिंक';

  @override
  String get shopProfile => 'दुकान प्रोफ़ाइल';

  @override
  String get insights => 'जानकारी';

  @override
  String get notifications => 'सूचनाएँ';

  @override
  String get backupExport => 'बैकअप और एक्सपोर्ट';

  @override
  String get adminPanel => 'एडमिन पैनल';

  @override
  String get toolsSync => 'टूल्स और सिंक';

  @override
  String get account => 'खाता';

  @override
  String get shopDetailsSaved => 'दुकान का विवरण सहेजा गया।';

  @override
  String saveFailed(int code) {
    return 'सहेजा नहीं जा सका ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'सहेजा नहीं जा सका: $error';
  }

  @override
  String get logoUpdated => 'लोगो अपडेट हो गया।';

  @override
  String logoUploadFailed(int code) {
    return 'लोगो अपलोड नहीं हो सका ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'लोगो अपलोड नहीं हो सका: $error';
  }

  @override
  String get healthGood => 'कुल मिलाकर सब ठीक है।';

  @override
  String get healthSome => 'कुछ चीज़ों पर ध्यान देना चाहिए।';

  @override
  String get healthMany => 'कई चीज़ों पर ध्यान देने की ज़रूरत है।';

  @override
  String get shopHealth => 'दुकान की सेहत';

  @override
  String get healthIntro => 'एक छोटा सा इशारा, एक और रिपोर्ट नहीं।';

  @override
  String get couldNotLoadCheckConnection => 'लोड नहीं हो सका — अपना कनेक्शन जाँचें।';

  @override
  String get itemPhotos => 'सामान की फ़ोटो';

  @override
  String get barcodes => 'बारकोड';

  @override
  String get lowStockItems => 'कम स्टॉक वाले सामान';

  @override
  String get lastBackup => 'आखिरी बैकअप';

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'कल';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन पहले',
      one: '1 दिन पहले',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'ऑफ़लाइन स्थिति';

  @override
  String get online => 'ऑनलाइन';

  @override
  String get offline => 'ऑफ़लाइन';

  @override
  String get waitingToSync => 'सिंक की प्रतीक्षा';

  @override
  String get syncNow => 'अभी सिंक करें';

  @override
  String get searchSettings => 'सेटिंग्स खोजें';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\" से कोई सेटिंग नहीं मिली';
  }

  @override
  String get businessInfo => 'व्यापार जानकारी';

  @override
  String get payment => 'भुगतान';

  @override
  String get shopNameRequired => 'दुकान का नाम ज़रूरी है';

  @override
  String phoneIncomplete(int digits) {
    return 'पूरा $digits अंकों का फ़ोन नंबर दर्ज करें';
  }

  @override
  String get jazzcashOptional => 'JazzCash नंबर (वैकल्पिक)';

  @override
  String get saved => 'सहेजा गया!';

  @override
  String get languageSubtitle => 'ऐप की भाषा बदलें';

  @override
  String get notificationsSubtitle => 'कम स्टॉक, बकाया भुगतान और रोज़ का सारांश';

  @override
  String get backupSubtitle => 'दुकान का डेटा डाउनलोड, रीस्टोर और एक्सपोर्ट करें';

  @override
  String get appUpdate => 'ऐप अपडेट';

  @override
  String get appUpdateSubtitle => 'नया संस्करण जाँचें';

  @override
  String get adminSubtitle => 'खाते और दुकान का डेटा प्रबंधित करें';

  @override
  String get accountSubtitle => 'साइन-इन, पासवर्ड और यूज़रनेम';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get privacySubtitle => 'हम कौन सा डेटा लेते हैं और क्यों';

  @override
  String get yourShop => 'आपकी दुकान';

  @override
  String get uploadingLogo => 'दुकान का लोगो अपलोड हो रहा है';

  @override
  String get logoTapToChange => 'दुकान का लोगो, बदलने के लिए टैप करें';

  @override
  String get brandTagline => 'दुकान व्यस्त, हिसाब शांत।';

  @override
  String serverError(int code) {
    return 'सर्वर त्रुटि: $code';
  }

  @override
  String get deleteCustomer => 'ग्राहक हटाएँ';

  @override
  String deleteCustomerMessage(String name) {
    return '$name और उनके सभी बिल हटाएँ? यह वापस नहीं होगा।';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'हटाया नहीं जा सका: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'हटाया नहीं जा सका — कनेक्शन जाँचकर फिर कोशिश करें।';

  @override
  String get actions => 'कार्य';

  @override
  String get edit => 'बदलें';

  @override
  String get delete => 'हटाएँ';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ग्राहक हटाएँ',
      one: '1 ग्राहक हटाएँ',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ग्राहक और उनके सभी बिल हटाएँ? यह वापस नहीं होगा।',
      one: '1 ग्राहक और उसके सभी बिल हटाएँ? यह वापस नहीं होगा।',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'सभी का चयन हटाएँ';

  @override
  String get selectAll => 'सभी चुनें';

  @override
  String selectedCount(int count) {
    return '$count चुने गए';
  }

  @override
  String get cancel => 'रद्द करें';

  @override
  String get newTag => 'नया';

  @override
  String get csvNeedsRows => 'CSV में हेडर पंक्ति और कम से कम एक ग्राहक होना चाहिए।';

  @override
  String get csvNeedsName => 'CSV हेडर में \"name\" कॉलम होना चाहिए।';

  @override
  String csvLineMissingName(int line) {
    return 'पंक्ति $line: नाम नहीं है — फ़ाइल ठीक करके फिर कोशिश करें।';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'पंक्ति $line: गलत credit_limit \"$value\" — फ़ाइल ठीक करके फिर कोशिश करें।';
  }

  @override
  String get importCustomers => 'ग्राहक आयात करें';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" में $count ग्राहक मिले। सभी आयात करें?',
      one: '\"$file\" में 1 ग्राहक मिला। आयात करें?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'आयात करें';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ग्राहक आयात हुए।',
      one: '1 ग्राहक आयात हुआ।',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'आयात विफल: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'आयात विफल — कनेक्ट नहीं हो सका: $error';
  }

  @override
  String get noPhone => 'फ़ोन नहीं';

  @override
  String get offlineShowingSaved => 'ऑफ़लाइन — सहेजी गई कॉपी दिख रही है';

  @override
  String get searchCustomersHint => 'ग्राहक या फ़ोन खोजें...';

  @override
  String get noCustomersYet => 'अभी कोई ग्राहक नहीं। जोड़ने के लिए + टैप करें।';

  @override
  String get noCustomersMatch => 'खोज से कोई ग्राहक नहीं मिला।';

  @override
  String get owesMoney => 'पैसा बाकी है';

  @override
  String get settledUp => 'हिसाब बराबर';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what लोड नहीं हो सका: $error';
  }

  @override
  String get takePhoto => 'फ़ोटो लें';

  @override
  String get chooseFromGallery => 'गैलरी से चुनें';

  @override
  String get back => 'वापस';

  @override
  String callPhone(String phone) {
    return '$phone पर कॉल करें';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone पर WhatsApp';
  }

  @override
  String get clearSearch => 'खोज साफ़ करें';

  @override
  String get askHint => 'जैसे इस महीने मुझे कितना मुनाफ़ा हुआ?';

  @override
  String get acctTurnOffLockTitle => 'ऐप लॉक बंद करें?';

  @override
  String get acctTurnOffLockBody => 'इस फ़ोन वाला कोई भी व्यक्ति बिना PIN के ऐप खोल सकेगा।';

  @override
  String get acctTurnOff => 'बंद करें';

  @override
  String get acctSetPinTitle => 'PIN सेट करें';

  @override
  String get acctPinLabel => '4-6 अंकों का PIN';

  @override
  String get acctPinMin => 'कम से कम 4 अंक';

  @override
  String get acctConfirmPin => 'PIN की पुष्टि करें';

  @override
  String get acctPinMismatch => 'PIN मेल नहीं खाते';

  @override
  String get acctSetPin => 'PIN सेट करें';

  @override
  String get acctBiometricTitle => 'फ़िंगरप्रिंट/चेहरा भी इस्तेमाल करें?';

  @override
  String get acctBiometricBody => 'बायोमेट्रिक विफल होने पर भी आप PIN इस्तेमाल कर सकते हैं।';

  @override
  String get acctNoThanks => 'नहीं, धन्यवाद';

  @override
  String get acctEnable => 'चालू करें';

  @override
  String get acctSetPasswordTitle => 'पासवर्ड सेट करें';

  @override
  String get acctSetPasswordIntro => 'एक पासवर्ड चुनें ताकि अगली बार आप सिर्फ़ Google के बजाय ईमेल + पासवर्ड से भी साइन इन कर सकें।';

  @override
  String get acctPassword => 'पासवर्ड';

  @override
  String get acctPasswordMin => 'कम से कम 6 अक्षर होने चाहिए';

  @override
  String get acctConfirmPassword => 'पासवर्ड की पुष्टि करें';

  @override
  String get acctPasswordsMismatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get acctSetPasswordButton => 'पासवर्ड सेट करें';

  @override
  String get acctPasswordSet => 'पासवर्ड सेट हो गया — अब आप इससे भी साइन इन कर सकते हैं।';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'पासवर्ड सेट नहीं हो सका: $error';
  }

  @override
  String get acctChangePasswordTitle => 'पासवर्ड बदलें';

  @override
  String get acctCurrentPassword => 'मौजूदा पासवर्ड';

  @override
  String get acctRequired => 'ज़रूरी है';

  @override
  String get acctNewPassword => 'नया पासवर्ड';

  @override
  String get acctConfirmNewPassword => 'नए पासवर्ड की पुष्टि करें';

  @override
  String get acctChange => 'बदलें';

  @override
  String get acctPasswordChanged => 'पासवर्ड बदल गया।';

  @override
  String get acctWrongPassword => 'मौजूदा पासवर्ड ग़लत है।';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'पासवर्ड नहीं बदला जा सका: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'यूज़रनेम बदलें';

  @override
  String get acctUsername => 'यूज़रनेम';

  @override
  String get acctUsernameEmpty => 'यूज़रनेम ख़ाली नहीं हो सकता';

  @override
  String get acctUsernameChanged => 'यूज़रनेम बदल गया।';

  @override
  String get acctChangeEmailTitle => 'ईमेल बदलें';

  @override
  String get acctNewEmail => 'नया ईमेल';

  @override
  String get acctValidEmail => 'सही ईमेल दर्ज करें';

  @override
  String get acctRequiredConfirm => 'आपकी पहचान की पुष्टि के लिए ज़रूरी है';

  @override
  String get acctGoogleConfirmFirst => 'पहले आपसे Google से पुष्टि करने को कहा जाएगा।';

  @override
  String acctCheckEmail(String email) {
    return 'बदलाव की पुष्टि के लिंक के लिए $email देखें।';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'पासवर्ड साइन-इन';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider हटाएँ?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'आप इस खाते पर $provider से साइन इन नहीं कर पाएँगे।';
  }

  @override
  String get acctRemove => 'हटाएँ';

  @override
  String acctRemoved(String provider) {
    return '$provider हटा दिया गया।';
  }

  @override
  String get acctSignedIn => 'साइन इन हैं';

  @override
  String get acctEmailNotVerified => 'ईमेल की पुष्टि अभी नहीं हुई।';

  @override
  String get acctVerificationSent => 'पुष्टि वाला ईमेल भेज दिया गया।';

  @override
  String get acctResend => 'फिर भेजें';

  @override
  String get acctSectionSignIn => 'साइन-इन और सुरक्षा';

  @override
  String get acctRowChangeUsername => 'यूज़रनेम बदलें';

  @override
  String get acctRowChangeEmail => 'ईमेल बदलें';

  @override
  String get acctRowSetPassword => 'पासवर्ड सेट करें';

  @override
  String get acctRowChangePassword => 'पासवर्ड बदलें';

  @override
  String get acctRowUnlinkGoogle => 'Google अनलिंक करें';

  @override
  String get acctRowRemovePassword => 'पासवर्ड हटाएँ';

  @override
  String get acctRowAppLock => 'ऐप लॉक (PIN)';

  @override
  String get acctRowBiometric => 'फ़िंगरप्रिंट/चेहरा इस्तेमाल करें';

  @override
  String get acctSignOutTitle => 'साइन आउट करें?';

  @override
  String get acctSignOutBody => 'ऐप इस्तेमाल करने के लिए आपको दोबारा साइन इन करना होगा।';

  @override
  String get acctSignOut => 'साइन आउट';

  @override
  String get acctDeleteAccount => 'खाता हटाएँ';

  @override
  String get acctDeleting => 'हटा रहे हैं...';

  @override
  String get acctDeleteTitle => 'खाता हटाएँ?';

  @override
  String get acctDeleteBody => 'यह आपके साइन-इन क्रेडेंशियल हमेशा के लिए हटा देगा। ऐप इस्तेमाल करने के लिए आपको दोबारा साइन अप करना होगा। इसे वापस नहीं किया जा सकता।';

  @override
  String acctCouldNotDelete(String error) {
    return 'खाता नहीं हटाया जा सका: $error';
  }

  @override
  String get itmNotFoundTitle => 'आइटम नहीं मिला';

  @override
  String itmNotFoundBody(String barcode) {
    return 'बारकोड $barcode वाला कोई आइटम नहीं है। क्या इसे अभी नया आइटम बनाकर जोड़ें?';
  }

  @override
  String get itmAddItem => 'आइटम जोड़ें';

  @override
  String get itmEditItem => 'आइटम बदलें';

  @override
  String get itmMergeTitle => 'डुप्लिकेट आइटम मिलाएँ';

  @override
  String get itmMergeBody => 'एक ही नाम वाले आइटम सबसे पुरानी एंट्री में मिला दिए जाएँगे और उनका स्टॉक जुड़ जाएगा। इसे वापस नहीं किया जा सकता।';

  @override
  String get itmMerge => 'मिलाएँ';

  @override
  String get itmNoDuplicates => 'कोई डुप्लिकेट आइटम नहीं मिला।';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count डुप्लिकेट आइटम मिलाए गए।',
      one: '1 डुप्लिकेट आइटम मिलाया गया।',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'आइटम हटाएँ';

  @override
  String get itmCannotUndo => 'इसे वापस नहीं किया जा सकता।';

  @override
  String get itmDeleteOffline => 'हटाया नहीं जा सका — अपना कनेक्शन जाँचकर फिर कोशिश करें।';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आइटम हटाएँ',
      one: '1 आइटम हटाएँ',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आइटम हटाएँ? इसे वापस नहीं किया जा सकता।',
      one: '1 आइटम हटाएँ? इसे वापस नहीं किया जा सकता।',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'फ़ोटो अपलोड नहीं हो सकी ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'फ़ोटो अपलोड नहीं हो सकी: $error';
  }

  @override
  String get itmNoBarcodes => 'अभी किसी आइटम का बारकोड नहीं है।';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लेबल प्रिंट करें',
      one: '1 लेबल प्रिंट करें',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'आइटम या श्रेणी खोजें...';

  @override
  String get itmStopListening => 'सुनना बंद करें';

  @override
  String get itmVoiceSearch => 'आवाज़ से खोज';

  @override
  String get itmSort => 'क्रम';

  @override
  String get itmSortName => 'नाम (अ-ज्ञ)';

  @override
  String get itmSortStockLow => 'स्टॉक: कम से ज़्यादा';

  @override
  String get itmSortRecent => 'हाल ही में जोड़े गए';

  @override
  String get itmFilterAll => 'सभी';

  @override
  String get itmFilterLowStock => 'कम स्टॉक';

  @override
  String get itmNoItemsYet => 'अभी कोई आइटम नहीं। जोड़ने के लिए + दबाएँ।';

  @override
  String get itmNoItemsMatch => 'आपकी खोज से कोई आइटम नहीं मिला।';

  @override
  String get itmNoPriceChanges => 'अभी तक कीमत में कोई बदलाव दर्ज नहीं हुआ।';

  @override
  String get itmNoStockCorrections => 'अभी तक कोई स्टॉक सुधार दर्ज नहीं हुआ।';

  @override
  String get itmResetHistory => 'इतिहास रीसेट करें';

  @override
  String get itmResetHistoryMsg => 'इस आइटम का इतिहास रीसेट करें? इसे वापस नहीं किया जा सकता।';

  @override
  String get itmSendPdf => 'PDF के रूप में भेजें';

  @override
  String get itmNoteOptional => 'नोट (वैकल्पिक)';

  @override
  String get itmNoteHint => 'इस बदलाव के लिए नोट जोड़ें';

  @override
  String get itmRemoveEntry => 'प्रविष्टि हटाएं';

  @override
  String get itmRemoveEntryMsg => 'इस प्रविष्टि को इतिहास से हटाएं? इसे वापस नहीं किया जा सकता।';

  @override
  String get itmEditEntry => 'प्रविष्टि संपादित करें';

  @override
  String get itmPrevQty => 'पहले';

  @override
  String get itmNewQty => 'नया';

  @override
  String itmCost(String amount) {
    return 'लागत: $amount';
  }

  @override
  String get itmMore => 'और';

  @override
  String get itmMenuPrintLabel => 'लेबल प्रिंट करें';

  @override
  String get itmMenuDuplicate => 'डुप्लिकेट बनाएँ';

  @override
  String get itmMenuPriceHistory => 'कीमत का इतिहास';

  @override
  String get itmMenuStockHistory => 'स्टॉक सुधार का इतिहास';

  @override
  String itmLowStockBadge(int count) {
    return '$count कम स्टॉक';
  }

  @override
  String itmStockLine(String qty) {
    return 'स्टॉक: $qty';
  }

  @override
  String get itmOfflineSaved => 'ऑफ़लाइन — आइटम इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get itmItemName => 'आइटम का नाम';

  @override
  String get itmNameRequired => 'नाम ज़रूरी है';

  @override
  String get itmPricePkr => 'कीमत (PKR)';

  @override
  String get itmPriceRequired => 'कीमत ज़रूरी है';

  @override
  String get itmValidNumber => 'सही संख्या दर्ज करें';

  @override
  String get itmUnit => 'इकाई';

  @override
  String get itmCategoryHint => 'श्रेणी (वैकल्पिक, जैसे प्लंबिंग)';

  @override
  String get itmPreferredSupplier => 'पसंदीदा सप्लायर (वैकल्पिक)';

  @override
  String get itmPreferredSupplierHelper => 'एक-टैप रीऑर्डर में इस्तेमाल होता है';

  @override
  String get itmClear => 'साफ़ करें';

  @override
  String get itmHsn => 'HSN कोड (वैकल्पिक)';

  @override
  String get itmGstRate => 'GST दर % (वैकल्पिक)';

  @override
  String get itmBarcodeOptional => 'बारकोड (वैकल्पिक)';

  @override
  String get itmScanOrType => 'स्कैन करें या लिखें';

  @override
  String get itmScanBarcode => 'बारकोड स्कैन करें';

  @override
  String get itmPurchaseCost => 'खरीद लागत (प्रति इकाई)';

  @override
  String get itmPurchaseCostHint => 'स्टॉक खरीदते समय आप कितना देते हैं';

  @override
  String get itmWholesale => 'थोक कीमत (वैकल्पिक)';

  @override
  String get itmContractor => 'ठेकेदार कीमत (वैकल्पिक)';

  @override
  String get itmFallsBack => 'न होने पर सामान्य कीमत लागू होगी';

  @override
  String get itmStockQty => 'स्टॉक मात्रा';

  @override
  String get itmLowStockAlert => 'कम स्टॉक अलर्ट इससे नीचे';

  @override
  String get itmFrequently => 'अक्सर साथ खरीदे जाने वाले';

  @override
  String get itmSaveChanges => 'बदलाव सेव करें';

  @override
  String get itmSaveItem => 'आइटम सेव करें';

  @override
  String get itmPhotoSemantics => 'आइटम की फ़ोटो, बदलने के लिए टैप करें';

  @override
  String get cdUpdateStatusTitle => 'भुगतान की स्थिति बदलें';

  @override
  String get cdMarkPaidQ => 'इस बिल को चुकाया हुआ मार्क करें?';

  @override
  String get cdMarkUnpaidQ => 'इस बिल को बिना चुकाया मार्क करें?';

  @override
  String get cdConfirm => 'पुष्टि करें';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'अपडेट नहीं हो सका: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'ऑफ़लाइन — बदलाव इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get cdConvertTitle => 'बिल में बदलें';

  @override
  String get cdConvertBody => 'इससे इन आइटम का स्टॉक घटेगा और कोटेशन असली बिल बन जाएगा। जारी रखें?';

  @override
  String get cdConvert => 'बदलें';

  @override
  String cdCouldNotConvert(String detail) {
    return 'बदला नहीं जा सका: $detail';
  }

  @override
  String get cdReturnItems => 'आइटम वापस करें';

  @override
  String get cdReturnHint => 'हर आइटम की वापसी मात्रा तय करें। बिक्री बनाए रखने के लिए 0 रहने दें।';

  @override
  String get cdDecreaseQty => 'मात्रा घटाएँ';

  @override
  String get cdIncreaseQty => 'मात्रा बढ़ाएँ';

  @override
  String get cdCreditTotal => 'क्रेडिट कुल';

  @override
  String get cdReturnSelected => 'चुने हुए वापस करें';

  @override
  String cdCouldNotReturn(String detail) {
    return 'वापस नहीं हो सका: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'रद्द नहीं हो सका: $detail';
  }

  @override
  String get cdNoPreviousBill => 'दोहराने के लिए कोई पिछला बिल नहीं';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'पिछला बिल लोड नहीं हो सका: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'इनवॉइस ग्राहक को ईमेल कर दिया गया।';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'इनवॉइस ईमेल नहीं हो सका: $detail';
  }

  @override
  String get cdStatementEmailed => 'स्टेटमेंट ग्राहक को ईमेल कर दिया गया।';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'स्टेटमेंट ईमेल नहीं हो सका: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'बिल हटाएँ';

  @override
  String get cdBillVoided => 'रद्द';

  @override
  String get cdBillReturn => 'वापसी';

  @override
  String get cdBillQuote => 'कोटेशन';

  @override
  String get cdBillPaid => 'चुकाया';

  @override
  String get cdBillPartial => 'आंशिक';

  @override
  String get cdBillUnpaid => 'बकाया';

  @override
  String get cdBill => 'बिल';

  @override
  String cdVoidedReason(String reason) {
    return 'रद्द: $reason';
  }

  @override
  String get cdViewInvoice => 'इनवॉइस देखें';

  @override
  String get cdEmailInvoice => 'इनवॉइस ईमेल करें';

  @override
  String get cdEditBill => 'बिल बदलें';

  @override
  String get cdReturnBill => 'बिल वापस करें';

  @override
  String get cdVoidBill => 'बिल रद्द करें';

  @override
  String get cdNoItems => 'कोई आइटम नहीं';

  @override
  String get cdRepeatLast => 'पिछला बिल दोहराएँ';

  @override
  String get cdLedgerPdf => 'खाता PDF';

  @override
  String get cdEmailStatement => 'स्टेटमेंट ईमेल करें';

  @override
  String get cdCollectPayment => 'भुगतान वसूलें';

  @override
  String get cdSendReminder => 'व्हाट्सऐप रिमाइंडर भेजें';

  @override
  String get cdTotalBilled => 'कुल बिल';

  @override
  String get cdPaid => 'चुकाया';

  @override
  String get cdNoBills => 'अभी कोई बिल नहीं';

  @override
  String get cdBillActions => 'बिल के विकल्प';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'क्रेडिट सीमा का $limit में से $outstanding इस्तेमाल हुआ';
  }

  @override
  String get cdVoidBody => 'यह इसे बैलेंस और रिपोर्ट से हटा देगा, पर इतिहास में रखेगा। स्टॉक वापस जुड़ जाएगा। इसे वापस नहीं किया जा सकता।';

  @override
  String get cdReason => 'कारण (वैकल्पिक)';

  @override
  String get frmOfflineCustomer => 'ऑफ़लाइन — ग्राहक इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get frmOfflineSupplier => 'ऑफ़लाइन — सप्लायर इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get frmEditCustomer => 'ग्राहक बदलें';

  @override
  String get frmCustomerName => 'ग्राहक का नाम';

  @override
  String get frmPhoneOptional => 'फ़ोन (वैकल्पिक)';

  @override
  String get frmCreditLimit => 'क्रेडिट सीमा (PKR, वैकल्पिक)';

  @override
  String get frmCreditHelper => 'इस ग्राहक का बैलेंस इससे ज़्यादा होने पर चेतावनी दें';

  @override
  String get frmPriceTier => 'कीमत का स्तर';

  @override
  String get frmRetail => 'खुदरा';

  @override
  String get frmWholesale => 'थोक';

  @override
  String get frmContractor => 'ठेकेदार';

  @override
  String get frmPriceTierHelper => 'बिल बनाते समय इस ग्राहक के लिए कौन-सी कीमत पहले से भरी जाए';

  @override
  String get frmStrn => 'STRN (वैकल्पिक)';

  @override
  String get frmStrnCustomer => 'इनवॉइस के लिए 13 अंकों का सेल्स टैक्स पंजीकरण नंबर';

  @override
  String get frmStrnSupplier => 'खरीद बिलों के लिए 13 अंकों का सेल्स टैक्स पंजीकरण नंबर';

  @override
  String get frmAddress => 'पता (वैकल्पिक)';

  @override
  String get frmEmail => 'ईमेल (वैकल्पिक)';

  @override
  String get frmEmailHelper => 'इस ग्राहक को इनवॉइस या स्टेटमेंट ईमेल करने की सुविधा';

  @override
  String get frmSaveCustomer => 'ग्राहक सेव करें';

  @override
  String get frmEditSupplier => 'सप्लायर बदलें';

  @override
  String get frmSupplierName => 'सप्लायर का नाम';

  @override
  String get frmSaveSupplier => 'सप्लायर सेव करें';

  @override
  String get sdDeletePurchaseTitle => 'खरीद हटाएँ';

  @override
  String get sdDeletePurchaseBody => 'इस खरीद का स्टॉक वापस जुड़ जाएगा। इसे वापस नहीं किया जा सकता।';

  @override
  String get sdReturnToSupplier => 'सप्लायर को वापस करें';

  @override
  String get sdReturnHint => 'हर आइटम की वापस भेजने की मात्रा तय करें। रखने के लिए 0 रहने दें।';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'प्राप्त मार्क नहीं हो सका: $detail';
  }

  @override
  String get sdMarkPaidQ => 'इस खरीद को चुकाई हुई मार्क करें?';

  @override
  String get sdMarkUnpaidQ => 'इस खरीद को बिना चुकाई मार्क करें?';

  @override
  String get sdTotalPurchased => 'कुल खरीद';

  @override
  String get sdPayable => 'देय';

  @override
  String sdPayableAmount(String amount) {
    return '$amount देय';
  }

  @override
  String get sdNoPurchases => 'अभी कोई खरीद नहीं';

  @override
  String get sdPo => 'पीओ';

  @override
  String get sdDraftPo => 'ड्राफ़्ट पीओ';

  @override
  String get sdPurchase => 'खरीद';

  @override
  String get sdDraftNote => 'ड्राफ़्ट खरीद ऑर्डर — अभी प्राप्त नहीं हुआ, स्टॉक या लागत में अभी कोई बदलाव नहीं।';

  @override
  String get sdReturnNote => 'सप्लायर को वापसी / क्रेडिट नोट।';

  @override
  String get sdMarkReceived => 'प्राप्त मार्क करें';

  @override
  String get sdEditPurchase => 'खरीद बदलें';

  @override
  String get sdPurchaseActions => 'खरीद के विकल्प';

  @override
  String get slDeleteSupplier => 'सप्लायर हटाएँ';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सप्लायर हटाएँ',
      one: '1 सप्लायर हटाएँ',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सप्लायर और उनकी सभी खरीद हटाएँ? इसे वापस नहीं किया जा सकता।',
      one: '1 सप्लायर और उसकी सभी खरीद हटाएँ? इसे वापस नहीं किया जा सकता।',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV में हेडर पंक्ति के अलावा कम से कम एक सप्लायर होना चाहिए।';

  @override
  String get slImportTitle => 'सप्लायर इंपोर्ट करें';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" में $count सप्लायर मिले। सभी इंपोर्ट करें?',
      one: '\"$file\" में 1 सप्लायर मिला। सभी इंपोर्ट करें?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सप्लायर इंपोर्ट हुए।',
      one: '1 सप्लायर इंपोर्ट हुआ।',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'अभी कोई सप्लायर नहीं। जोड़ने के लिए + दबाएँ।';

  @override
  String get slSearchHint => 'सप्लायर या फ़ोन खोजें...';

  @override
  String get slNoMatch => 'आपकी खोज से कोई सप्लायर नहीं मिला।';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सप्लायर',
      one: '1 सप्लायर',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'सप्लायर बकाया';

  @override
  String get sduNothingOwed => 'सप्लायरों को कुछ देना बाकी नहीं 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सप्लायरों को भुगतान बाकी',
      one: '1 सप्लायर को भुगतान बाकी',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'सबसे पुरानी बिना चुकाई खरीद को $days दिन हुए',
      one: 'सबसे पुरानी बिना चुकाई खरीद को 1 दिन हुआ',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 दिन';

  @override
  String get duBucket1 => '30–60 दिन';

  @override
  String get duBucket2 => '60+ दिन';

  @override
  String get duTitle => 'बकाया केंद्र';

  @override
  String get duNoDues => 'कोई बकाया नहीं 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ग्राहकों पर बकाया',
      one: '1 ग्राहक पर बकाया',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'सबसे पुराने बिना चुकाए बिल को $days दिन हुए',
      one: 'सबसे पुराने बिना चुकाए बिल को 1 दिन हुआ',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount बकाया';
  }

  @override
  String get cpNoOutstanding => 'इस ग्राहक का कोई बकाया बैलेंस नहीं';

  @override
  String get cpValidAmount => 'सही राशि दर्ज करें';

  @override
  String cpExceeds(String amount) {
    return 'राशि बकाया बैलेंस $amount से ज़्यादा है';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name से $amount वसूल हुए';
  }

  @override
  String get cpOfflineSaved => 'ऑफ़लाइन — भुगतान इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String cpOwes(String amount, String name) {
    return '$name पर $amount बकाया है। यह पहले सबसे पुराने बिना चुकाए बिल(बिलों) पर लागू होगा।';
  }

  @override
  String get cpAmountLabel => 'वसूली गई राशि (PKR)';

  @override
  String get cpCollect => 'वसूलें';

  @override
  String get usNoItems => 'अपडेट करने के लिए कोई आइटम नहीं।';

  @override
  String get usHelp => 'हर आइटम का नया स्टॉक तय करें, फिर सब सेव करें दबाएँ।';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  मौजूदा: $qty';
  }

  @override
  String usNew(String qty) {
    return 'नया: $qty';
  }

  @override
  String get usSubtract => '1 घटाएँ';

  @override
  String get usAdd => '1 बढ़ाएँ';

  @override
  String get usNoChanges => 'कोई बदलाव नहीं';

  @override
  String usSaveAll(int count) {
    return 'सब सेव करें ($count बदले)';
  }

  @override
  String get srHint => 'ग्राहक, आइटम, राशियाँ खोजें...';

  @override
  String get srFailed => 'खोज विफल — अपना कनेक्शन जाँचें।';

  @override
  String get srTitle => 'अपनी दुकान में खोजें';

  @override
  String get srSubtitle => 'ग्राहकों को नाम या फ़ोन से, बिलों को राशि से खोजें।';

  @override
  String srNoMatches(String query) {
    return '\"$query\" के लिए कोई नतीजा नहीं';
  }

  @override
  String get srTryDifferent => 'कोई दूसरा नाम, फ़ोन नंबर या राशि आज़माएँ।';

  @override
  String get srBills => 'बिल';

  @override
  String get srNoItemList => 'आइटम सूची नहीं';

  @override
  String get abAddAtLeastOne => 'कम से कम एक आइटम जोड़ें';

  @override
  String get abQuotationUpdated => 'कोटेशन अपडेट हो गया!';

  @override
  String get abBillUpdated => 'बिल अपडेट हो गया!';

  @override
  String get abQuotationSaved => 'कोटेशन सेव हो गया!';

  @override
  String get abBillCreated => 'बिल सफलतापूर्वक बन गया!';

  @override
  String abTotalAmount(String amount) {
    return 'कुल: $amount';
  }

  @override
  String get abShare => 'शेयर करें';

  @override
  String get abDoneReturn => 'हो गया और वापस जाएँ';

  @override
  String get abOverLimitBody => 'इससे ग्राहक अपनी क्रेडिट सीमा से ऊपर चला जाएगा।';

  @override
  String get abOverLimitTitle => 'क्रेडिट सीमा पार';

  @override
  String get abBillAnyway => 'फिर भी बिल बनाएँ';

  @override
  String get abOfflineBill => 'ऑफ़लाइन — बिल इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get abEditQuotation => 'कोटेशन बदलें';

  @override
  String get abEditBill => 'बिल बदलें';

  @override
  String get abNewQuotation => 'नया कोटेशन';

  @override
  String get abAddBill => 'बिल बनाएँ';

  @override
  String get abCouldNotLoadItems => 'आइटम लोड नहीं हो सके।';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'इस बिल से ग्राहक का बैलेंस $total हो जाएगा, जो उसकी $limit क्रेडिट सीमा से ज़्यादा है।';
  }

  @override
  String get abTapAddItemBill => 'बिल शुरू करने के लिए नीचे \"आइटम जोड़ें\" दबाएँ';

  @override
  String get abNoCatalog => 'कैटलॉग में अभी कोई आइटम नहीं';

  @override
  String get abScan => 'स्कैन';

  @override
  String get abDiscountRs => 'छूट (रु)';

  @override
  String get abSubtotal => 'उप-कुल';

  @override
  String get abTotal => 'कुल';

  @override
  String get abSaveAsQuotation => 'कोटेशन के रूप में सेव करें';

  @override
  String get abQuotationLocked => 'मौजूदा बिल को वापस कोटेशन नहीं बनाया जा सकता';

  @override
  String get abQuotationNote => 'बिल में बदलने तक स्टॉक नहीं घटेगा';

  @override
  String get abPaymentStatus => 'भुगतान की स्थिति';

  @override
  String get abUnpaid => 'बकाया';

  @override
  String get abPaymentMethod => 'भुगतान का तरीका';

  @override
  String get abCash => 'नकद';

  @override
  String get abBankTransfer => 'बैंक ट्रांसफ़र';

  @override
  String get abCheque => 'चेक';

  @override
  String get abSaveQuotation => 'कोटेशन सेव करें';

  @override
  String get abSaveBill => 'बिल सेव करें';

  @override
  String abAdded(String name) {
    return '$name जोड़ा गया';
  }

  @override
  String get apNewItem => 'नया आइटम…';

  @override
  String get apNewItemHint => 'पहले कैटलॉग में नया आइटम जोड़ें';

  @override
  String get apOfflinePurchase => 'ऑफ़लाइन — खरीद इस डिवाइस पर सेव हो गई, ऑनलाइन होते ही अपने आप सिंक हो जाएगी';

  @override
  String get apEditPo => 'खरीद ऑर्डर बदलें';

  @override
  String get apNewPo => 'नया खरीद ऑर्डर';

  @override
  String get apAddPurchase => 'खरीद जोड़ें';

  @override
  String get apTapAddItem => 'खरीद शुरू करने के लिए नीचे \"आइटम जोड़ें\" दबाएँ';

  @override
  String get apSaveAsPo => 'खरीद ऑर्डर के रूप में सेव करें';

  @override
  String get apPoLocked => 'प्राप्त हो चुकी खरीद को वापस ड्राफ़्ट ऑर्डर नहीं बनाया जा सकता';

  @override
  String get apPoNote => 'माल प्राप्त मार्क होने तक स्टॉक या लागत नहीं बदलेगी';

  @override
  String get apUnpaidCredit => 'बिना चुकाई (उधार)';

  @override
  String get apSavePo => 'खरीद ऑर्डर सेव करें';

  @override
  String get apSavePurchase => 'खरीद सेव करें';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'मौजूदा लागत: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'लागत तय नहीं  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'स्कैन विफल: सर्वर त्रुटि $code';
  }

  @override
  String get scOfflineSaved => 'ऑफ़लाइन — फ़ोटो सेव हो गई, ऑनलाइन होते ही अपने आप पढ़ी जाएगी';

  @override
  String get scStillOffline => 'अभी भी ऑफ़लाइन';

  @override
  String get scCouldNotCreateCustomer => 'ग्राहक नहीं बन सका — फिर कोशिश करें।';

  @override
  String get scCouldNotCreateSupplier => 'सप्लायर नहीं बन सका — फिर कोशिश करें।';

  @override
  String scBillSavedFor(String name) {
    return '$name के लिए बिल सेव हो गया';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name से खरीद सेव हो गई';
  }

  @override
  String get scWhichCustomer => 'यह कौन-सा ग्राहक है?';

  @override
  String get scWhichSupplier => 'यह कौन-सा सप्लायर है?';

  @override
  String scClosestMatch(String name, int score) {
    return 'रिकॉर्ड में सबसे करीबी मेल: $name ($score% समान)';
  }

  @override
  String scYesThisIs(String name) {
    return 'हाँ, यह $name है';
  }

  @override
  String get scOtherwiseCustomer => 'नहीं तो नया ग्राहक बनाएँ:';

  @override
  String get scOtherwiseSupplier => 'नहीं तो नया सप्लायर बनाएँ:';

  @override
  String get scNoMatchCustomer => 'कोई मिलता-जुलता ग्राहक नहीं मिला। नया बनाएँ:';

  @override
  String get scNoMatchSupplier => 'कोई मिलता-जुलता सप्लायर नहीं मिला। नया बनाएँ:';

  @override
  String get scCustomerName => 'ग्राहक का नाम';

  @override
  String get scSupplierName => 'सप्लायर का नाम';

  @override
  String get scCreateNew => 'नया बनाएँ';

  @override
  String get scTitleBill => 'बिल स्कैन करें';

  @override
  String get scIntroBill => 'बिल की फ़ोटो खींचिए। हाथ से लिखा हो तो भी चलेगा, और सिंधी, उर्दू या अंग्रेज़ी सब चलती हैं। सेव होने से पहले आप उसे देख सकेंगे।';

  @override
  String get scIntroPurchase => 'सप्लायर के इनवॉइस की फ़ोटो खींचिए। सिंधी, उर्दू या अंग्रेज़ी सब चलती हैं। सेव होने से पहले आप उसे देख सकेंगे।';

  @override
  String get scReadingBill => 'बिल पढ़ा जा रहा है…';

  @override
  String get scScanBill => 'बिल स्कैन करें';

  @override
  String get scReadingInvoice => 'इनवॉइस पढ़ा जा रहा है…';

  @override
  String get scScanInvoice => 'इनवॉइस स्कैन करें';

  @override
  String get scQueued => 'कतार में स्कैन';

  @override
  String get scReady => 'समीक्षा के लिए तैयार';

  @override
  String get scFailed => 'विफल';

  @override
  String get scWaiting => 'कनेक्शन का इंतज़ार';

  @override
  String get scRetry => 'फिर कोशिश करें';

  @override
  String rpCouldNotLoad(String error) {
    return 'रिपोर्ट लोड नहीं हो सकीं: $error';
  }

  @override
  String get rpHeadline => 'इस महीने के मुख्य आँकड़े';

  @override
  String get rpProfitThisMonth => 'इस महीने का मुनाफ़ा';

  @override
  String get rpNoData => 'अभी कोई डेटा नहीं';

  @override
  String get rpSalesTax => 'सेल्स टैक्स';

  @override
  String rpSalesTaxFor(String month) {
    return '$month की सेल्स टैक्स रिपोर्ट';
  }

  @override
  String get rpViewSalesTax => 'सेल्स टैक्स रिपोर्ट देखें';

  @override
  String get rpQuickReports => 'त्वरित रिपोर्ट';

  @override
  String get rpQuickSub => 'सीधे किसी ख़ास रिपोर्ट पर जाएँ';

  @override
  String get expensesTitle => 'खर्चे';

  @override
  String get rpRateCard => 'रेट कार्ड';

  @override
  String get rpDetails => 'विवरण';

  @override
  String get rpDetailsSub => 'पूरा ब्योरा और रैंकिंग';

  @override
  String get rpOutstandingByCustomer => 'ग्राहक के अनुसार बकाया';

  @override
  String get rpNoOutstanding => 'कोई बकाया बैलेंस नहीं';

  @override
  String get rpMonthlyTotals => 'मासिक कुल';

  @override
  String get rpMostSold => 'सबसे ज़्यादा बिकने वाले आइटम';

  @override
  String get rpNoItemsRecorded => 'अभी कोई आइटम दर्ज नहीं';

  @override
  String get rpTopCustomers => 'आय के हिसाब से शीर्ष ग्राहक';

  @override
  String get rpNoSalesRecorded => 'अभी कोई बिक्री दर्ज नहीं';

  @override
  String get rpTotalOutstanding => 'कुल बकाया';

  @override
  String get rpViewCustomers => 'ग्राहक देखें';

  @override
  String get lblInvoice => 'इनवॉइस';

  @override
  String get lblLedger => 'खाता';

  @override
  String get lblRateCard => 'रेट कार्ड';

  @override
  String get exCsvNeedsRows => 'CSV में हेडर पंक्ति के अलावा कम से कम एक खर्चा होना चाहिए।';

  @override
  String get exCsvHeader => 'CSV हेडर में \"description\" और \"amount\" कॉलम होने चाहिए।';

  @override
  String exLineBadAmount(int line) {
    return 'पंक्ति $line: विवरण ग़ायब या राशि ग़लत — फ़ाइल ठीक करके फिर कोशिश करें।';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'पंक्ति $line: ग़लत तारीख़ \"$date\" — YYYY-MM-DD इस्तेमाल करें।';
  }

  @override
  String get exImportTitle => 'खर्चे इंपोर्ट करें';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" में $count खर्चे मिले। सभी इंपोर्ट करें?',
      one: '\"$file\" में 1 खर्चा मिला। सभी इंपोर्ट करें?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count खर्चे इंपोर्ट हुए।',
      one: '1 खर्चा इंपोर्ट हुआ।',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'इंपोर्ट विफल: सर्वर त्रुटि $code';
  }

  @override
  String get exDeleteTitle => 'खर्चा हटाएँ';

  @override
  String get exAdd => 'खर्चा जोड़ें';

  @override
  String get exEdit => 'खर्चा बदलें';

  @override
  String get exDescription => 'विवरण';

  @override
  String get exAmountRs => 'राशि (रु)';

  @override
  String get exCategory => 'श्रेणी';

  @override
  String exDate(String date) {
    return 'तारीख़: $date';
  }

  @override
  String get exRepeats => 'हर महीने दोहराएँ';

  @override
  String get exRepeatsHint => 'किराया, बिजली, मज़दूरी आदि';

  @override
  String get exReceiptTap => 'रसीद की फ़ोटो, बदलने के लिए टैप करें';

  @override
  String get exReceiptOptional => 'रसीद की फ़ोटो (वैकल्पिक)';

  @override
  String get exEnterValid => 'विवरण और सही राशि दर्ज करें।';

  @override
  String get exOffline => 'ऑफ़लाइन — खर्चा इस डिवाइस पर सेव हो गया, ऑनलाइन होते ही अपने आप सिंक हो जाएगा';

  @override
  String get exSave => 'खर्चा सेव करें';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'इस महीने $count आवर्ती खर्चे देय हैं',
      one: 'इस महीने 1 आवर्ती खर्चा देय है',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'जोड़ें';

  @override
  String get exTotal => 'कुल खर्चे';

  @override
  String exCategoryChip(String name) {
    return 'श्रेणी: $name';
  }

  @override
  String get exNoneLogged => 'अभी कोई खर्चा दर्ज नहीं';

  @override
  String exNoneInCategory(String name) {
    return 'अभी $name का कोई खर्चा नहीं';
  }

  @override
  String get exViewReceipt => 'रसीद देखें';

  @override
  String get exEditRow => 'खर्चा बदलें';

  @override
  String get exDeleteRow => 'खर्चा हटाएँ';

  @override
  String gstServerReturned(String first, String second) {
    return 'सर्वर ने $first/$second लौटाया';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST डेटा लोड नहीं हो सका: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'डाउनलोड विफल ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename सेव हो गई';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'डाउनलोड/$filename में सेव हो गई';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'डाउनलोड नहीं हो सका: $error';
  }

  @override
  String get gstTitle => 'सेल्स टैक्स रिपोर्ट';

  @override
  String get gstOutwardDetail => 'बाहरी बिक्री — इनवॉइस विवरण';

  @override
  String get gstNoBills => 'इस महीने कोई बिल नहीं।';

  @override
  String get gstHsn => 'HSN सारांश';

  @override
  String get gstInvoiceWise => 'इनवॉइस-वार विवरण';

  @override
  String get gstMonthly => 'मासिक सारांश';

  @override
  String get gstOutwardTaxable => 'कर योग्य बाहरी आपूर्ति';

  @override
  String get gstItc => 'इनपुट टैक्स क्रेडिट (खरीद से)';

  @override
  String get gstSave => 'सेव करें';

  @override
  String get rcValidAmount => 'सही राशि दर्ज करें।';

  @override
  String get rcExpected => 'अपेक्षित नकद (आज की नकद बिक्री)';

  @override
  String get rcAlsoCollected => 'आज वसूला भी गया (दराज़ में गिना नहीं गया)';

  @override
  String get rcCounted => 'दराज़ में गिना गया नकद (रु)';

  @override
  String get rcCompare => 'तुलना करें';

  @override
  String get rcMatches => 'बिल्कुल सही मिलता है!';

  @override
  String rcExtra(String amount) {
    return 'दराज़ में $amount ज़्यादा';
  }

  @override
  String rcMissing(String amount) {
    return 'दराज़ में $amount कम';
  }

  @override
  String get pbiTitle => 'आइटम के अनुसार मुनाफ़ा';

  @override
  String get pbiNoSales => 'अभी कोई बिक्री नहीं';

  @override
  String get pbiByCategory => 'श्रेणी के अनुसार';

  @override
  String get pbiItemsByProfit => 'मुनाफ़े के हिसाब से आइटम';

  @override
  String get svTitle => 'स्टॉक मूल्य';

  @override
  String get svNone => 'कोई स्टॉक नहीं';

  @override
  String get svItemsByValue => 'मूल्य के हिसाब से आइटम';

  @override
  String svSummary(String items, String units) {
    return '$items आइटम · शेल्फ़ पर $units इकाइयाँ';
  }

  @override
  String svTied(String amount) {
    return 'स्टॉक में $amount लगे हैं';
  }

  @override
  String get svEstimated => 'बिक्री मूल्य से अनुमानित';

  @override
  String get bkRestoreTitle => 'बैकअप रीस्टोर करें?';

  @override
  String bkRestoreBody(String filename) {
    return 'यह सारा मौजूदा डेटा बैकअप फ़ाइल \"$filename\" से बदल देगा। जारी रखें?';
  }

  @override
  String get bkRestore => 'रीस्टोर करें';

  @override
  String get bkRestoreDoneTitle => 'रीस्टोर पूरा हुआ';

  @override
  String get bkRestoreDoneBody => 'आपका डेटा रीस्टोर हो गया है।';

  @override
  String get bkOk => 'ठीक है';

  @override
  String bkRestoreFailed(String detail) {
    return 'रीस्टोर विफल: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'रीस्टोर नहीं हो सका: $error';
  }

  @override
  String get bkSaveToDownloads => 'डाउनलोड में सेव करें';

  @override
  String get bkIntroAdmin => 'आपका सारा डेटा एक डेटाबेस फ़ाइल में है। नियमित रूप से एक कॉपी डाउनलोड करें, और कुछ गड़बड़ हो तो उसे रीस्टोर करें।';

  @override
  String get bkIntroStaff => 'पूरा डेटाबेस बैकअप और रीस्टोर सिर्फ़ एडमिन के लिए है। एडमिन से कहें, या जो चाहिए उसे नीचे CSV में एक्सपोर्ट करें।';

  @override
  String get bkBackupDb => 'डेटाबेस बैकअप';

  @override
  String get bkBackupDbSub => 'पूरा डेटाबेस एक फ़ाइल में डाउनलोड करके शेयर करें (व्हाट्सऐप, ड्राइव, ईमेल)।';

  @override
  String get bkDownloadPhone => 'बैकअप फ़ोन में डाउनलोड करें';

  @override
  String get bkShareBackup => 'बैकअप शेयर करें';

  @override
  String get bkAutoTitle => 'ऑटोमैटिक बैकअप';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'सर्वर पर $count रोज़ के बैकअप सेव हैं, सबसे नया $time का। यह अपने आप चलता है — यहाँ कुछ करने की ज़रूरत नहीं।',
      one: 'सर्वर पर 1 रोज़ का बैकअप सेव है, सबसे नया $time का। यह अपने आप चलता है — यहाँ कुछ करने की ज़रूरत नहीं।',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'मौजूदा डेटा बदलने के लिए सेव की हुई बैकअप फ़ाइल चुनें।';

  @override
  String get bkRestoreFromFile => 'बैकअप फ़ाइल से रीस्टोर करें';

  @override
  String get bkExportCsv => 'CSV में एक्सपोर्ट करें';

  @override
  String get bkExportSub => 'इन्हें एक्सेल में खोलें या शेयर करें।';

  @override
  String get bkRangeAll => 'बिल/खर्चे: पूरा समय';

  @override
  String bkRangeSome(String end, String start) {
    return 'बिल/खर्चे: $start से $end तक';
  }

  @override
  String get bkSetRange => 'अवधि तय करें';

  @override
  String get bkClearRange => 'अवधि हटाएँ';

  @override
  String get ntNever => 'कभी नहीं चला';

  @override
  String get ntJustNow => 'अभी-अभी';

  @override
  String ntMinutesAgo(int count) {
    return '$count मिनट पहले';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count घंटे पहले';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count दिन पहले';
  }

  @override
  String get ntTitle => 'स्मार्ट नोटिफ़िकेशन';

  @override
  String get ntTapHint => 'नोटिफ़िकेशन चलाने और लाइव नतीजे देखने के लिए \"अभी जाँचें\" दबाएँ।';

  @override
  String get ntLowStockSub => 'आइटम रीऑर्डर स्तर से नीचे जाने पर सूचित करें।';

  @override
  String get ntCheckNow => 'अभी जाँचें';

  @override
  String get ntOverdue => 'बकाया भुगतान रिमाइंडर';

  @override
  String get ntOverdueSub => 'पिछले दिनों के बिना चुकाए बिलों के बारे में सूचित करें।';

  @override
  String get ntDaily => 'रोज़ का कारोबारी सारांश';

  @override
  String get ntDailySub => 'कल की बिक्री, वसूली और मुनाफ़ा एक नज़र में।';

  @override
  String get ntSendSummary => 'सारांश भेजें';

  @override
  String get ntRunning => 'चल रहा है…';

  @override
  String get ntLowStockItems => 'कम स्टॉक वाले आइटम';

  @override
  String get ntSales => 'बिक्री';

  @override
  String get ntCollected => 'वसूल हुआ';

  @override
  String get ntProfit => 'मुनाफ़ा';

  @override
  String get auChecking => 'अपडेट जाँचे जा रहे हैं…';

  @override
  String get auLatest => 'आपके पास नवीनतम वर्शन है।';

  @override
  String get auAvailable => 'अपडेट उपलब्ध है';

  @override
  String auNewer(int code) {
    return 'Book-Keep का नया वर्शन (बिल्ड $code) तैयार है।';
  }

  @override
  String get auLater => 'बाद में';

  @override
  String get auUpdate => 'अपडेट करें';

  @override
  String get auDownloading => 'अपडेट डाउनलोड हो रहा है';

  @override
  String auSaved(String name) {
    return '$name आपके डाउनलोड फ़ोल्डर में सेव हो गई।';
  }

  @override
  String get auAllowInstall => 'Book-Keep को ऐप इंस्टॉल करने की अनुमति दें, फिर दोबारा अपडेट दबाएँ।';

  @override
  String get auFailed => 'अपडेट नहीं हो सका — अपना कनेक्शन जाँचकर फिर कोशिश करें।';

  @override
  String get lgSearch => 'भाषाएँ खोजें';

  @override
  String lgNoMatch(String query) {
    return '\"$query\" से कोई भाषा नहीं मिलती';
  }

  @override
  String get alVoided => 'बिल रद्द किया';

  @override
  String get alDeletedBill => 'बिल हटाया';

  @override
  String get alReturned => 'बिल वापस किया';

  @override
  String get alDeletedCustomer => 'ग्राहक हटाया';

  @override
  String get alDeletedSupplier => 'सप्लायर हटाया';

  @override
  String get alCreatedAccount => 'खाता बनाया';

  @override
  String get alUpdatedAccount => 'खाता अपडेट किया';

  @override
  String get alDeletedAccount => 'खाता हटाया';

  @override
  String get alTitle => 'गतिविधि लॉग';

  @override
  String get alNone => 'अभी कोई गतिविधि दर्ज नहीं';

  @override
  String get blkEnterOne => 'कम से कम एक आइटम दर्ज करें';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आइटम सफलतापूर्वक जुड़ गए',
      one: '1 आइटम सफलतापूर्वक जुड़ गया',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'एक साथ आइटम जोड़ें';

  @override
  String get blkFormat => 'हर पंक्ति में एक आइटम, प्रारूप: नाम, कीमत, इकाई, श्रेणी';

  @override
  String get blkOptional => 'इकाई और श्रेणी वैकल्पिक हैं (डिफ़ॉल्ट: piece, कोई नहीं)';

  @override
  String get blkAddAll => 'सभी आइटम जोड़ें';

  @override
  String get prSend => 'भुगतान रिमाइंडर भेजें';

  @override
  String get prTone => 'लहजा चुनें:';

  @override
  String get prPolite => 'विनम्र';

  @override
  String get prStandard => 'सामान्य';

  @override
  String get prUrgent => 'ज़रूरी';

  @override
  String get prPreviewQr => 'जैज़कैश भुगतान QR का पूर्वावलोकन';

  @override
  String get prShareText => 'टेक्स्ट शेयर करें';

  @override
  String get dsRemaining => 'बाकी';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount की छूट शामिल';
  }

  @override
  String get dsItems => 'आइटम';

  @override
  String get dsDiscount => 'छूट';

  @override
  String get lkWrongPin => 'ग़लत PIN';

  @override
  String get lkEnterPin => 'PIN दर्ज करें';

  @override
  String get lkChecking => 'फ़िंगरप्रिंट जाँचा जा रहा है...';

  @override
  String get bcTitle => 'बारकोड स्कैन करें';

  @override
  String get bcTorchNa => 'इस डिवाइस पर टॉर्च उपलब्ध नहीं है';

  @override
  String get bcTorch => 'टॉर्च';

  @override
  String get bcPoint => 'कैमरे को बारकोड की ओर करें';

  @override
  String get qrNoNumber => 'कोई जैज़कैश नंबर सेट नहीं है। भुगतान QR दिखाने के लिए इसे सेटिंग्स में सेट करें।';

  @override
  String get qrPay => 'जैज़कैश से भुगतान करें';

  @override
  String get qrInvalid => 'अमान्य QR डेटा';

  @override
  String qrAmount(String amount) {
    return 'राशि: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'जैज़कैश: $number';
  }

  @override
  String get qrCopy => 'जैज़कैश नंबर कॉपी करें';

  @override
  String get qrCopied => 'जैज़कैश नंबर क्लिपबोर्ड में कॉपी हो गया';

  @override
  String get qrHint => 'भुगतान के लिए यह नंबर अपने जैज़कैश ऐप में स्कैन या कॉपी करें।';

  @override
  String clOwed(String amount) {
    return '$amount बकाया';
  }

  @override
  String get lnEnterEmailFirst => 'पहले ऊपर सही ईमेल दर्ज करें।';

  @override
  String get lnResetSent => 'पासवर्ड रीसेट ईमेल भेज दिया गया — अपना इनबॉक्स देखें।';

  @override
  String get lnNoAccount => 'इस ईमेल का कोई खाता नहीं मिला।';

  @override
  String get lnWrongPassword => 'पासवर्ड ग़लत है।';

  @override
  String get lnInvalidEmail => 'यह सही ईमेल पता नहीं लगता।';

  @override
  String get lnDisabled => 'यह खाता बंद कर दिया गया है।';

  @override
  String get lnTooMany => 'बहुत ज़्यादा कोशिशें — एक मिनट बाद फिर कोशिश करें।';

  @override
  String get lnNoInternet => 'इंटरनेट कनेक्शन नहीं है।';

  @override
  String get lnWeakPassword => 'पासवर्ड कम से कम 6 अक्षरों का होना चाहिए।';

  @override
  String get lnCouldNotSignIn => 'साइन इन नहीं हो सका। कृपया फिर कोशिश करें।';

  @override
  String get lnWrongPasswordHint => 'पासवर्ड ग़लत है। फिर कोशिश करें या \"पासवर्ड भूल गए?\" दबाएँ।';

  @override
  String get lnWrongEmail => 'ईमेल ग़लत है — इस पते का कोई खाता नहीं।';

  @override
  String get lnWrongEmailOrPassword => 'ईमेल या पासवर्ड ग़लत है।';

  @override
  String get lnWrongUsername => 'यूज़रनेम ग़लत है — इस नाम का कोई खाता नहीं।';

  @override
  String get lnWelcome => 'वापसी पर स्वागत है';

  @override
  String lnSignInTo(String app) {
    return '$app में साइन इन करें';
  }

  @override
  String get lnEmailOrUsername => 'ईमेल या यूज़रनेम';

  @override
  String get lnRemember => 'मुझे याद रखें';

  @override
  String get lnForgot => 'पासवर्ड भूल गए?';

  @override
  String get lnSignIn => 'साइन इन';

  @override
  String get lnGoogle => 'Google के साथ जारी रखें';

  @override
  String get lnNew => 'नए हैं?';

  @override
  String get lnCreate => 'खाता बनाएँ';

  @override
  String suCreated(String email) {
    return '$email के लिए खाता बन गया। पुष्टि वाला ईमेल भेज दिया गया है (वैकल्पिक)।';
  }

  @override
  String suSetup(String app) {
    return '$app सेट करें';
  }

  @override
  String get suName => 'नाम';

  @override
  String get suEmail => 'ईमेल';

  @override
  String suPhoneDigits(int digits) {
    return 'सही $digits अंकों का नंबर दर्ज करें';
  }

  @override
  String get suCreateBtn => 'खाता बनाएँ';

  @override
  String get suHaveAccount => 'पहले से खाता है?';

  @override
  String get suAlreadyExists => 'इस ईमेल का खाता पहले से मौजूद है।';

  @override
  String get suInvalidEmail => 'ईमेल पता सही नहीं है।';

  @override
  String get agShow => 'पासवर्ड दिखाएँ';

  @override
  String get agHide => 'पासवर्ड छिपाएँ';

  @override
  String get adAccounts => 'खाते';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count पंजीकृत खाते',
      one: '1 पंजीकृत खाता',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'जोड़ें';

  @override
  String get adNoAccounts => 'कोई खाता नहीं मिला।';

  @override
  String get adAccountability => 'जवाबदेही';

  @override
  String get adAccountabilitySub => 'किसने क्या रद्द, हटाया या वापस किया, और खातों में बदलाव।';

  @override
  String get adActivitySub => 'रद्द बिल, हटाना और खातों में बदलाव';

  @override
  String get adServer => 'सर्वर';

  @override
  String get adServerSub => 'यह ऐप किससे बात करता है। सेटअप के बाद शायद ही बदलने की ज़रूरत पड़ती है।';

  @override
  String get adServerHint => 'एमुलेटर 10.0.2.2 इस्तेमाल करता है; असली फ़ोन को उसी वाई-फ़ाई पर लैपटॉप का IP चाहिए। इसे बदलने का असर हर खाते पर पड़ता है।';

  @override
  String get adApiBase => 'API बेस URL';

  @override
  String get adSaveServer => 'सर्वर का पता सेव करें';

  @override
  String get adEmailSetSub => 'सेट है — स्टाफ़ ग्राहकों को इनवॉइस/स्टेटमेंट ईमेल कर सकता है।';

  @override
  String get adNotSetUp => 'अभी सेट नहीं है।';

  @override
  String get adEmailSetBody => 'ईमेल सेट है। स्टाफ़ सीधे ग्राहक को इनवॉइस या स्टेटमेंट ईमेल कर सकता है।';

  @override
  String get adEmailHelp => 'Gmail पता ऐप पासवर्ड के साथ चलता है (smtp.gmail.com, पोर्ट 587), या अपने ईमेल प्रदाता के SMTP विवरण इस्तेमाल करें।';

  @override
  String get adSmtpHost => 'SMTP होस्ट';

  @override
  String get adSmtpPort => 'SMTP पोर्ट';

  @override
  String get adEmailAddress => 'ईमेल पता';

  @override
  String get adPwKeep => 'पासवर्ड (मौजूदा रखने के लिए ख़ाली छोड़ें)';

  @override
  String get adPwApp => 'पासवर्ड (ऐप पासवर्ड, लॉगिन पासवर्ड नहीं)';

  @override
  String get adFromName => 'भेजने वाले का नाम (वैकल्पिक)';

  @override
  String get adFromHint => 'मेरी हार्डवेयर दुकान';

  @override
  String get adSaving => 'सेव हो रहा है...';

  @override
  String get adSaveEmail => 'ईमेल सेटिंग्स सेव करें';

  @override
  String get adAddAccount => 'खाता जोड़ें';

  @override
  String get adNameOpt => 'नाम (वैकल्पिक)';

  @override
  String get adAtLeast6 => 'कम से कम 6 अक्षर';

  @override
  String get adGrantAdmin => 'एडमिन बनाएँ';

  @override
  String get adCanManage => 'रद्द/हटा/वापस कर सकता है';

  @override
  String get adCanManageHint => 'बिल रद्द या हटाना, बिल वापस करना, या ग्राहक/सप्लायर हटाना। एडमिन के पास यह हमेशा रहता है।';

  @override
  String get adCreate => 'बनाएँ';

  @override
  String get adAccountCreated => 'खाता बन गया।';

  @override
  String adCreateFailed(String error) {
    return 'बनाना विफल: $error';
  }

  @override
  String get adEditAccount => 'खाता बदलें';

  @override
  String get adAdminSwitch => 'एडमिन';

  @override
  String get adAdminHint => 'एडमिन पैनल खोल सकता है';

  @override
  String get adDisabled => 'बंद';

  @override
  String get adDisabledHint => 'साइन इन से रोका गया';

  @override
  String get adAccountUpdated => 'खाता अपडेट हो गया।';

  @override
  String adUpdateFailed(String error) {
    return 'अपडेट विफल: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label हमेशा के लिए हटा दिया जाएगा और साइन इन नहीं कर पाएगा।';
  }

  @override
  String get adAccountDeleted => 'खाता हटा दिया गया।';

  @override
  String adDeleteFailed(String error) {
    return 'हटाना विफल: $error';
  }

  @override
  String get adBadgeAdmin => 'एडमिन';

  @override
  String get adBadgeDisabled => 'बंद';

  @override
  String get adOff => 'एडमिन पैनल बंद है';

  @override
  String get adCheckAgain => 'फिर जाँचें';

  @override
  String get adAccessRequired => 'एडमिन पहुँच ज़रूरी है';

  @override
  String get adAccessBody => 'सिर्फ़ दुकान के एडमिन खाते संभाल सकते हैं। दुकान के मालिक से एडमिन पहुँच माँगें।';

  @override
  String get adCouldNotLoad => 'एडमिन पैनल लोड नहीं हो सका।';

  @override
  String get adBadPort => 'सही SMTP पोर्ट नंबर दर्ज करें।';

  @override
  String get adEmailSaved => 'ईमेल सेटिंग्स सेव हो गईं।';

  @override
  String adEmailSaveFailed(String error) {
    return 'ईमेल सेटिंग्स सेव नहीं हो सकीं: $error';
  }

  @override
  String get adServerEmpty => 'सर्वर का पता ख़ाली नहीं हो सकता।';

  @override
  String get adServerSaved => 'सर्वर का पता सेव हो गया। स्क्रीन अगली लोडिंग पर इसे इस्तेमाल करेंगी।';

  @override
  String get lnOr => 'या';

  @override
  String get scNotABill => 'यह बिल नहीं लग रहा। बिल की साफ़ फ़ोटो के साथ फिर कोशिश करें।';

  @override
  String get scNotAnInvoice => 'यह इनवॉइस नहीं लग रहा। सप्लायर के इनवॉइस की साफ़ फ़ोटो के साथ फिर कोशिश करें।';

  @override
  String get jqOpenFull => 'बड़ा करें';

  @override
  String get jqCopy => 'नंबर कॉपी करें';

  @override
  String get jqSheetTitle => 'जैज़कैश QR';

  @override
  String get jqSheetHint => 'ग्राहक भुगतान के लिए इसे अपने जैज़कैश ऐप में स्कैन करते हैं।';

  @override
  String get jqCheck => 'नंबर दोबारा देखें';

  @override
  String get askVoice => 'आवाज़';

  @override
  String get askVoiceFallbackNote => 'इसे आपके फ़ोन की आवाज़ में पढ़ा जा रहा है।';

  @override
  String get askPace => 'गति';

  @override
  String get askTone => 'अंदाज़';

  @override
  String get askPaceSlower => 'धीमी';

  @override
  String get askPaceNormal => 'सामान्य';

  @override
  String get askPaceFaster => 'तेज़';

  @override
  String get askToneCalm => 'शांत';

  @override
  String get askToneWarm => 'गर्मजोशी भरा';

  @override
  String get askToneCheerful => 'खुशमिज़ाज';

  @override
  String qPaymentUpdate(String amount) {
    return 'भुगतान अपडेट: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'ग्राहक: $name';
  }

  @override
  String qSupplier(String name) {
    return 'आपूर्तिकर्ता: $name';
  }

  @override
  String qItem(String name) {
    return 'वस्तु: $name';
  }

  @override
  String qExpense(String name) {
    return 'खर्च: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'खरीद: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$name से भुगतान प्राप्त: $amount';
  }

  @override
  String gstAmount(String amount) {
    return 'कर $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'कर योग्य $taxable  ·  कर $tax  ·  कुल $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'आय: $revenue  •  माल की लागत: $cogs  •  खर्च: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'नमस्ते $customer, $shop की ओर से शुभकामनाएँ! आपका कुल बकाया $amount है। धन्यवाद!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'नमस्ते $customer, $shop की ओर से $amount के बकाया भुगतान का अनुस्मारक। कृपया जल्द से जल्द भुगतान करें।';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'अत्यावश्यक सूचना: प्रिय $customer, $shop में आपका $amount का बकाया भुगतान लंबित है। कृपया तुरंत भुगतान करें।';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCash से भुगतान करें: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop का बिल\nकुल: $total\nवस्तुएँ: $items\nस्थिति: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'नमस्ते $supplier, मैं $shop से बोल रहा हूँ। हम इन वस्तुओं का ऑर्डर देना चाहते हैं:\n$lines\n\nकृपया उपलब्धता और कीमत की पुष्टि करें। धन्यवाद।';
  }

  @override
  String ppUpdated(String date) {
    return 'अंतिम अपडेट: $date';
  }

  @override
  String get ppWhoH => 'हम कौन हैं';

  @override
  String ppWho(String owner, String email) {
    return '$owner, जो Book-keep चलाता है।\nसंपर्क: $email';
  }

  @override
  String get ppCollectH => 'हम क्या एकत्र करते हैं';

  @override
  String get ppCollectAccount => 'खाता: ईमेल, फ़ोन नंबर और उपयोगकर्ता नाम, Firebase Authentication के ज़रिए।';

  @override
  String get ppCollectShop => 'दुकान की प्रोफ़ाइल: दुकान का नाम, पता, फ़ोन नंबर, JazzCash नंबर और दुकान का लोगो — जिसे दुकान का मालिक सेटिंग्स में दर्ज करता है।';

  @override
  String get ppCollectRecords => 'आपके बनाए गए कारोबारी रिकॉर्ड: ग्राहकों और सप्लायर के नाम व फ़ोन नंबर, बिल, खरीद, आइटम कैटलॉग (आइटम की फ़ोटो और बारकोड सहित) और खर्च (रसीद की फ़ोटो सहित)। यह ऐप का मुख्य डेटा है — बहीखाता ऐसे ही काम करता है।';

  @override
  String get ppCollectDevice => 'डिवाइस और डायग्नोस्टिक डेटा: पुश-नोटिफ़िकेशन टोकन (कम स्टॉक, बकाया भुगतान और दैनिक सारांश अलर्ट के लिए) और क्रैश रिपोर्ट (डिवाइस की जानकारी और स्टैक ट्रेस) Firebase Crashlytics के ज़रिए, जो ऐप क्रैश होने पर अपने-आप भेजी जाती हैं।';

  @override
  String ppCollectAi(String askShop) {
    return 'AI सुविधाएँ: $askShop, AI सुबह का सारांश और AI बिल/खरीद स्कैनर, जवाब, सारांश या निकाली गई पंक्तियाँ बनाने के लिए संबंधित कारोबारी डेटा का एक स्नैपशॉट (रिपोर्ट के आँकड़े या बिल की फ़ोटो) Google के Gemini API को भेजते हैं। इस डेटा को Google जवाब बनाने के लिए प्रोसेस करता है; हम और Google इसे Google की मानक API शर्तों से बाहर मॉडल ट्रेन करने में इस्तेमाल नहीं करते।';
  }

  @override
  String get ppDontH => 'हम क्या नहीं करते';

  @override
  String get ppDontLocation => 'हम आपकी लोकेशन ट्रैक नहीं करते।';

  @override
  String get ppDontAds => 'हम विज्ञापन नेटवर्क या व्यवहार-विश्लेषण/सेशन-रिकॉर्डिंग टूल इस्तेमाल नहीं करते।';

  @override
  String get ppDontSell => 'हम आपका डेटा या आपके ग्राहकों का डेटा किसी को नहीं बेचते।';

  @override
  String get ppWhereH => 'डेटा कहाँ रहता है';

  @override
  String get ppWhereDb => 'डेटाबेस: Neon (Postgres), एक थर्ड-पार्टी क्लाउड डेटाबेस प्रदाता।';

  @override
  String get ppWhereFirebase => 'प्रमाणीकरण, पुश नोटिफ़िकेशन, क्रैश रिपोर्ट, फ़ोटो स्टोरेज: Firebase (Google)।';

  @override
  String get ppWhereAi => 'AI प्रोसेसिंग: Google Gemini API।';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'इनवॉइस ईमेल: उस SMTP खाते से भेजे जाते हैं जिसे आपकी दुकान का एडमिन $adminPanel में सेट करता है। हमारी कोई मेलिंग लिस्ट नहीं है; ये ईमेल आपके अपने ग्राहकों को भेजे जाने वाले अलग-अलग बिल/स्टेटमेंट हैं, थोक मार्केटिंग नहीं।';
  }

  @override
  String get ppYoursH => 'आपका डेटा, आपके ग्राहकों का डेटा';

  @override
  String get ppYours => 'आप जो कुछ भी दर्ज करते हैं — ग्राहक, सप्लायर, बिल, आइटम — वह आपकी दुकान का है। Book-keep इस्तेमाल करने वाली दूसरी दुकानें इसे नहीं देख सकतीं। आपके बनाए स्टाफ़ खाते केवल वही देखते हैं जिसकी आप उन्हें अनुमति देते हैं।';

  @override
  String get ppControlsH => 'आपके नियंत्रण';

  @override
  String ppControlExport(String path) {
    return 'अपना डेटा एक्सपोर्ट या बैकअप करें: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'अपना खाता हटाएँ: $path। इससे केवल आपका साइन-इन क्रेडेंशियल हटता है; आपकी दुकान के कारोबारी रिकॉर्ड (बिल, ग्राहक, आइटम आदि) नहीं मिटते, जैसे किसी स्टाफ़ सदस्य को हटाने से उसके बनाए रिकॉर्ड नहीं मिटते।';
  }

  @override
  String ppControlNotif(String path) {
    return 'नोटिफ़िकेशन: प्रकार के अनुसार $path में बंद किए जा सकते हैं।';
  }

  @override
  String get ppChildrenH => 'बच्चे';

  @override
  String get ppChildren => 'Book-keep दुकान मालिकों और स्टाफ़ के लिए एक कारोबारी टूल है। यह बच्चों के लिए नहीं है और बच्चे इसे जानबूझकर इस्तेमाल नहीं करते।';

  @override
  String get ppChangesH => 'इस नीति में बदलाव';

  @override
  String get ppChanges => 'अगर हम जो एकत्र करते हैं या वह कहाँ जाता है, बदलता है, तो हम इस पेज को अपडेट करेंगे और ऊपर की तारीख बदल देंगे।';

  @override
  String get ppContactH => 'संपर्क';

  @override
  String ppContact(String email) {
    return 'इस नीति या आपके डेटा के बारे में सवाल: $email';
  }

  @override
  String get waHello => 'नमस्ते!';

  @override
  String waHelloNamed(String name) {
    return 'नमस्ते $name,';
  }

  @override
  String get gstTaxable => 'कर योग्य';

  @override
  String get gstTax => 'कर';

  @override
  String get gstTaxableValue => 'कर योग्य मूल्य';

  @override
  String get gstTotalTax => 'कुल कर';

  @override
  String get gstTotalItc => 'कुल इनपुट टैक्स क्रेडिट';

  @override
  String get gstExempt => 'छूट प्राप्त बिक्री';

  @override
  String get gstNetPayable => 'देय शुद्ध कर';

  @override
  String get unknownName => 'अज्ञात';

  @override
  String get unitPiece => 'पीस';

  @override
  String get unitKg => 'किलो';

  @override
  String get unitMeter => 'मीटर';

  @override
  String get unitBox => 'डिब्बा';

  @override
  String get unitDozen => 'दर्जन';

  @override
  String get unitLiter => 'लीटर';

  @override
  String get unitBag => 'बोरी';

  @override
  String deleteSupplierMessage(String name) {
    return '$name और उनकी सभी खरीदें हटाएँ? यह वापस नहीं किया जा सकता।';
  }
}
