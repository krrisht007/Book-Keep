// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get navHome => 'Nyumbani';

  @override
  String get navCustomers => 'Wateja';

  @override
  String get navItems => 'Bidhaa';

  @override
  String get navSuppliers => 'Wasambazaji';

  @override
  String get navReports => 'Ripoti';

  @override
  String get navSettings => 'Mipangilio';

  @override
  String get settingsShopDetailsTitle => 'Maelezo ya Duka';

  @override
  String get settingsShopDetailsSubtitle => 'Yanaonyeshwa kwenye ankara zako.';

  @override
  String get settingsShopNameLabel => 'Jina la Duka';

  @override
  String get settingsShopAddressLabel => 'Anwani ya Duka';

  @override
  String get settingsPhoneLabel => 'Simu';

  @override
  String get settingsSaveShopDetails => 'Hifadhi Maelezo ya Duka';

  @override
  String get settingsAppearanceTitle => 'Muonekano';

  @override
  String get settingsAppearanceSubtitle => 'Chagua mandhari kwa programu nzima.';

  @override
  String get themeLight => 'Angavu';

  @override
  String get themeDark => 'Giza';

  @override
  String get themeSystem => 'Mfumo';

  @override
  String get settingsLanguageTitle => 'Lugha';

  @override
  String get settingsLanguageSubtitle => 'Chagua lugha ya kuonyesha ya programu.';

  @override
  String get sortNameNewest => 'Panga: Jina / Mpya zaidi';

  @override
  String get addCustomer => 'Ongeza mteja';

  @override
  String get importCsv => 'Ingiza CSV';

  @override
  String get searchShop => 'Tafuta dukani';

  @override
  String get scanToFindItem => 'Changanua kupata bidhaa';

  @override
  String get bulkAdd => 'Ongeza kwa wingi';

  @override
  String get updateStock => 'Sasisha hisa';

  @override
  String get printLabels => 'Chapisha lebo';

  @override
  String get mergeDuplicates => 'Unganisha nakala';

  @override
  String get addSupplier => 'Ongeza msambazaji';

  @override
  String get scanPurchaseInvoice => 'Changanua ankara ya ununuzi';

  @override
  String askNoAnswer(String reason) {
    return 'Imeshindwa kupata jibu: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Imeshindwa kuunganisha: $error';
  }

  @override
  String get micPermissionNeeded => 'Ruhusa ya maikrofoni inahitajika kwa kuingiza sauti.';

  @override
  String get speechUnavailable => 'Utambuzi wa sauti haupatikani kwenye kifaa hiki.';

  @override
  String get askYourShop => 'Uliza duka lako';

  @override
  String get close => 'Funga';

  @override
  String get askIntro => 'Unataka kujua duka linaendeleaje? Niulize, nitakujibu kutokana na vitabu vyako.';

  @override
  String get askListening => 'Inasikiliza…';

  @override
  String get askThinkingWords => 'Inafikiri…|Inashughulikia…|Inahesabu…|Inakagua vitabu…|Inajumlisha…|Inachambua takwimu…';

  @override
  String get askSayQuestion => 'Sema swali lako — gusa duara kughairi';

  @override
  String briefingRefreshFailed(int code) {
    return 'Imeshindwa kusasisha muhtasari ($code).';
  }

  @override
  String get refreshFailedOffline => 'Imeshindwa kusasisha — angalia muunganisho wako.';

  @override
  String get newBillFailed => 'Imeshindwa kuanza bili mpya — angalia muunganisho na ujaribu tena.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Weka kwanza msambazaji unayempendelea kwa $name (gusa kuhariri).';
  }

  @override
  String get reorderBySupplier => 'Agiza tena kwa msambazaji';

  @override
  String get supplier => 'Msambazaji';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'bidhaa $count',
      one: 'bidhaa 1',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Hakuna bidhaa yenye hisa ndogo iliyo na msambazaji anayependelewa bado.';

  @override
  String get thisSupplier => 'Msambazaji huyu';

  @override
  String supplierNoPhone(String name) {
    return '$name hana nambari ya simu.';
  }

  @override
  String get tabOverview => 'Muhtasari';

  @override
  String get tabStock => 'Hisa';

  @override
  String get tabMoney => 'Pesa';

  @override
  String get taglineOverview => 'Madeni, hisa na pesa taslimu za leo kwa haraka.';

  @override
  String get taglineStock => 'Kinachouzika, kinachoisha.';

  @override
  String get taglineMoney => 'Matumizi, ulinganisho na makusanyo.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Inapakia dashibodi… $done kati ya $total';
  }

  @override
  String get dashboardLoadFailed => 'Imeshindwa kupakia dashibodi';

  @override
  String get checkConnectionRetry => 'Angalia muunganisho wako na ujaribu tena.';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get aiBriefing => 'Muhtasari wa AI';

  @override
  String get briefingPrompt => 'Tazama biashara ya jana kwa sentensi chache.';

  @override
  String get getBriefing => 'Pata muhtasari';

  @override
  String get refreshBriefing => 'Sasisha muhtasari';

  @override
  String updatedAt(String time) {
    return 'Imesasishwa $time';
  }

  @override
  String get customersUnknown => '— wateja';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'wateja $count',
      one: 'mteja 1',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Mwezi uliopita';

  @override
  String get nextMonth => 'Mwezi ujao';

  @override
  String get salesMonth => 'Mauzo (mwezi)';

  @override
  String get outstanding => 'Deni';

  @override
  String get profitMonth => 'Faida (mwezi)';

  @override
  String get cashToday => 'Pesa taslimu leo';

  @override
  String get newBill => 'Bili mpya';

  @override
  String get scanHandwrittenBill => 'Changanua bili iliyoandikwa kwa mkono';

  @override
  String get topOutstanding => 'Madeni makubwa zaidi';

  @override
  String viewAllInDues(int count) {
    return 'Tazama zote $count katika Kituo cha Madeni';
  }

  @override
  String get lowStockAlerts => 'Arifa za hisa ndogo';

  @override
  String get noLowStock => 'Hakuna bidhaa yenye hisa ndogo — hisa iko sawa.';

  @override
  String get whatsappAll => 'WhatsApp kwa wote';

  @override
  String get reorderAll => 'Agiza zote tena';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Pendekezo: agiza tena $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Zimebaki $qty $unit';
  }

  @override
  String get reorder => 'Agiza tena';

  @override
  String get whatsappSupplier => 'WhatsApp kwa msambazaji';

  @override
  String get topItemsByRevenue => 'Bidhaa bora kwa mapato';

  @override
  String get noSalesYet => 'Hakuna mauzo yaliyorekodiwa bado.';

  @override
  String qtyLabel(String qty) {
    return 'Idadi: $qty';
  }

  @override
  String get monthExpenses => 'Matumizi ya mwezi huu';

  @override
  String get noExpensesMonth => 'Hakuna matumizi yaliyorekodiwa mwezi huu.';

  @override
  String get quickActions => 'Vitendo vya haraka';

  @override
  String get dailyCashReconciliation => 'Ulinganisho wa pesa wa kila siku';

  @override
  String get collectMoney => 'Kusanya pesa';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mabadiliko $count yamehifadhiwa nje ya mtandao',
      one: 'Badiliko 1 limehifadhiwa nje ya mtandao',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Itasawazisha yenyewe ukirudi mtandaoni';

  @override
  String get syncing => 'Inasawazisha';

  @override
  String get sync => 'Sawazisha';

  @override
  String get shopProfile => 'Wasifu wa duka';

  @override
  String get insights => 'Maarifa';

  @override
  String get notifications => 'Arifa';

  @override
  String get backupExport => 'Hifadhi nakala na hamisha';

  @override
  String get adminPanel => 'Paneli ya msimamizi';

  @override
  String get toolsSync => 'Zana na usawazishaji';

  @override
  String get account => 'Akaunti';

  @override
  String get shopDetailsSaved => 'Maelezo ya duka yamehifadhiwa.';

  @override
  String saveFailed(int code) {
    return 'Imeshindwa kuhifadhi ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Imeshindwa kuhifadhi: $error';
  }

  @override
  String get logoUpdated => 'Nembo imesasishwa.';

  @override
  String logoUploadFailed(int code) {
    return 'Imeshindwa kupakia nembo ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Imeshindwa kupakia nembo: $error';
  }

  @override
  String get healthGood => 'Kwa ujumla kila kitu kiko sawa.';

  @override
  String get healthSome => 'Mambo machache yanahitaji umakini.';

  @override
  String get healthMany => 'Mambo kadhaa yanahitaji umakini.';

  @override
  String get shopHealth => 'Afya ya duka';

  @override
  String get healthIntro => 'Kikumbusho kifupi, si ripoti nyingine.';

  @override
  String get couldNotLoadCheckConnection => 'Imeshindwa kupakia — angalia muunganisho wako.';

  @override
  String get itemPhotos => 'Picha za bidhaa';

  @override
  String get barcodes => 'Misimbo pau';

  @override
  String get lowStockItems => 'Bidhaa zenye hisa ndogo';

  @override
  String get lastBackup => 'Nakala ya mwisho';

  @override
  String get today => 'leo';

  @override
  String get yesterday => 'jana';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'siku $days zilizopita',
      one: 'siku 1 iliyopita',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Hali ya nje ya mtandao';

  @override
  String get online => 'Mtandaoni';

  @override
  String get offline => 'Nje ya mtandao';

  @override
  String get waitingToSync => 'Inasubiri kusawazisha';

  @override
  String get syncNow => 'Sawazisha sasa';

  @override
  String get searchSettings => 'Tafuta mipangilio';

  @override
  String noSettingsMatch(String query) {
    return 'Hakuna mipangilio inayolingana na \"$query\"';
  }

  @override
  String get businessInfo => 'TAARIFA ZA BIASHARA';

  @override
  String get payment => 'MALIPO';

  @override
  String get shopNameRequired => 'Jina la duka linahitajika';

  @override
  String phoneIncomplete(int digits) {
    return 'Weka nambari kamili ya simu ya tarakimu $digits';
  }

  @override
  String get jazzcashOptional => 'Nambari ya JazzCash (si lazima)';

  @override
  String get saved => 'Imehifadhiwa!';

  @override
  String get languageSubtitle => 'Badilisha lugha ya programu';

  @override
  String get notificationsSubtitle => 'Hisa ndogo, malipo yaliyochelewa na muhtasari wa kila siku';

  @override
  String get backupSubtitle => 'Pakua, rejesha na hamisha data ya duka';

  @override
  String get appUpdate => 'Sasisho la programu';

  @override
  String get appUpdateSubtitle => 'Angalia toleo jipya';

  @override
  String get adminSubtitle => 'Simamia akaunti na data ya duka';

  @override
  String get accountSubtitle => 'Kuingia, nenosiri na jina la mtumiaji';

  @override
  String get privacyPolicy => 'Sera ya faragha';

  @override
  String get privacySubtitle => 'Data tunayokusanya na kwa nini';

  @override
  String get yourShop => 'Duka lako';

  @override
  String get uploadingLogo => 'Inapakia nembo ya duka';

  @override
  String get logoTapToChange => 'Nembo ya duka, gusa kubadilisha';

  @override
  String get brandTagline => 'Duka lina shughuli, vitabu vina utulivu.';

  @override
  String serverError(int code) {
    return 'Hitilafu ya seva: $code';
  }

  @override
  String get deleteCustomer => 'Futa mteja';

  @override
  String deleteCustomerMessage(String name) {
    return 'Futa $name na bili zake zote? Hili haliwezi kutenduliwa.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Imeshindwa kufuta: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Imeshindwa kufuta — angalia muunganisho na ujaribu tena.';

  @override
  String get actions => 'Vitendo';

  @override
  String get edit => 'Hariri';

  @override
  String get delete => 'Futa';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Futa wateja $count',
      one: 'Futa mteja 1',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Futa wateja $count na bili zao zote? Hili haliwezi kutenduliwa.',
      one: 'Futa mteja 1 na bili zake zote? Hili haliwezi kutenduliwa.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Ondoa uteuzi wote';

  @override
  String get selectAll => 'Chagua zote';

  @override
  String selectedCount(int count) {
    return '$count zimechaguliwa';
  }

  @override
  String get cancel => 'Ghairi';

  @override
  String get newTag => 'MPYA';

  @override
  String get csvNeedsRows => 'CSV inahitaji safu ya vichwa na angalau mteja mmoja.';

  @override
  String get csvNeedsName => 'Vichwa vya CSV lazima viwe na safu ya \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'Mstari $line: jina halipo — rekebisha faili na ujaribu tena.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Mstari $line: credit_limit si sahihi \"$value\" — rekebisha faili na ujaribu tena.';
  }

  @override
  String get importCustomers => 'Ingiza wateja';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wateja $count wamepatikana katika \"$file\". Waingizwe wote?',
      one: 'Mteja 1 amepatikana katika \"$file\". Aingizwe?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Ingiza';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wateja $count wameingizwa.',
      one: 'Mteja 1 ameingizwa.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Kuingiza kumeshindwa: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Kuingiza kumeshindwa — hakuna muunganisho: $error';
  }

  @override
  String get noPhone => 'Hakuna simu';

  @override
  String get offlineShowingSaved => 'Nje ya mtandao — inaonyesha nakala iliyohifadhiwa';

  @override
  String get searchCustomersHint => 'Tafuta wateja au simu...';

  @override
  String get noCustomersYet => 'Bado hakuna wateja. Gusa + kuongeza.';

  @override
  String get noCustomersMatch => 'Hakuna mteja anayelingana na utafutaji wako.';

  @override
  String get owesMoney => 'Anadaiwa';

  @override
  String get settledUp => 'Hesabu imelipwa';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'Imeshindwa kupakia $what: $error';
  }

  @override
  String get takePhoto => 'Piga picha';

  @override
  String get chooseFromGallery => 'Chagua kutoka matunzio';

  @override
  String get back => 'Rudi';

  @override
  String callPhone(String phone) {
    return 'Piga simu $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp $phone';
  }

  @override
  String get clearSearch => 'Futa utafutaji';

  @override
  String get askHint => 'mf. Nimepata faida kiasi gani mwezi huu?';

  @override
  String get acctTurnOffLockTitle => 'Zima Kufunga Programu?';

  @override
  String get acctTurnOffLockBody => 'Yeyote mwenye simu hii ataweza kufungua programu bila PIN.';

  @override
  String get acctTurnOff => 'Zima';

  @override
  String get acctSetPinTitle => 'Weka PIN';

  @override
  String get acctPinLabel => 'PIN ya tarakimu 4-6';

  @override
  String get acctPinMin => 'Angalau tarakimu 4';

  @override
  String get acctConfirmPin => 'Thibitisha PIN';

  @override
  String get acctPinMismatch => 'PIN hazilingani';

  @override
  String get acctSetPin => 'Weka PIN';

  @override
  String get acctBiometricTitle => 'Tumia pia alama ya kidole/uso?';

  @override
  String get acctBiometricBody => 'Bado unaweza kutumia PIN ikiwa bayometriki itashindwa.';

  @override
  String get acctNoThanks => 'Hapana, asante';

  @override
  String get acctEnable => 'Washa';

  @override
  String get acctSetPasswordTitle => 'Weka nenosiri';

  @override
  String get acctSetPasswordIntro => 'Chagua nenosiri ili wakati ujao uweze pia kuingia kwa barua pepe + nenosiri, si Google pekee.';

  @override
  String get acctPassword => 'Nenosiri';

  @override
  String get acctPasswordMin => 'Lazima liwe na angalau herufi 6';

  @override
  String get acctConfirmPassword => 'Thibitisha nenosiri';

  @override
  String get acctPasswordsMismatch => 'Manenosiri hayalingani';

  @override
  String get acctSetPasswordButton => 'Weka Nenosiri';

  @override
  String get acctPasswordSet => 'Nenosiri limewekwa — sasa unaweza kuingia nalo pia.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Imeshindwa kuweka nenosiri: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Badilisha nenosiri';

  @override
  String get acctCurrentPassword => 'Nenosiri la sasa';

  @override
  String get acctRequired => 'Inahitajika';

  @override
  String get acctNewPassword => 'Nenosiri jipya';

  @override
  String get acctConfirmNewPassword => 'Thibitisha nenosiri jipya';

  @override
  String get acctChange => 'Badilisha';

  @override
  String get acctPasswordChanged => 'Nenosiri limebadilishwa.';

  @override
  String get acctWrongPassword => 'Nenosiri la sasa si sahihi.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Imeshindwa kubadilisha nenosiri: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Badilisha jina la mtumiaji';

  @override
  String get acctUsername => 'Jina la mtumiaji';

  @override
  String get acctUsernameEmpty => 'Jina la mtumiaji haliwezi kuwa tupu';

  @override
  String get acctUsernameChanged => 'Jina la mtumiaji limebadilishwa.';

  @override
  String get acctChangeEmailTitle => 'Badilisha barua pepe';

  @override
  String get acctNewEmail => 'Barua pepe mpya';

  @override
  String get acctValidEmail => 'Weka barua pepe halali';

  @override
  String get acctRequiredConfirm => 'Inahitajika kuthibitisha kuwa ni wewe';

  @override
  String get acctGoogleConfirmFirst => 'Utaombwa kuthibitisha kwa Google kwanza.';

  @override
  String acctCheckEmail(String email) {
    return 'Angalia $email kwa kiungo cha kuthibitisha mabadiliko.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'kuingia kwa nenosiri';

  @override
  String acctRemoveTitle(String provider) {
    return 'Ondoa $provider?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Hutaweza tena kuingia kwenye akaunti hii kwa $provider.';
  }

  @override
  String get acctRemove => 'Ondoa';

  @override
  String acctRemoved(String provider) {
    return '$provider imeondolewa.';
  }

  @override
  String get acctSignedIn => 'Umeingia';

  @override
  String get acctEmailNotVerified => 'Barua pepe bado haijathibitishwa.';

  @override
  String get acctVerificationSent => 'Barua pepe ya uthibitisho imetumwa.';

  @override
  String get acctResend => 'Tuma tena';

  @override
  String get acctSectionSignIn => 'KUINGIA NA USALAMA';

  @override
  String get acctRowChangeUsername => 'Badilisha Jina la Mtumiaji';

  @override
  String get acctRowChangeEmail => 'Badilisha Barua Pepe';

  @override
  String get acctRowSetPassword => 'Weka Nenosiri';

  @override
  String get acctRowChangePassword => 'Badilisha Nenosiri';

  @override
  String get acctRowUnlinkGoogle => 'Tenganisha Google';

  @override
  String get acctRowRemovePassword => 'Ondoa Nenosiri';

  @override
  String get acctRowAppLock => 'Kufunga Programu (PIN)';

  @override
  String get acctRowBiometric => 'Tumia alama ya kidole/uso';

  @override
  String get acctSignOutTitle => 'Toka?';

  @override
  String get acctSignOutBody => 'Utahitaji kuingia tena ili kutumia programu.';

  @override
  String get acctSignOut => 'Toka';

  @override
  String get acctDeleteAccount => 'Futa Akaunti';

  @override
  String get acctDeleting => 'Inafuta...';

  @override
  String get acctDeleteTitle => 'Futa akaunti?';

  @override
  String get acctDeleteBody => 'Hii inafuta kabisa taarifa zako za kuingia. Utahitaji kujisajili tena ili kutumia programu. Hili haliwezi kutenduliwa.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Imeshindwa kufuta akaunti: $error';
  }

  @override
  String get itmNotFoundTitle => 'Bidhaa haijapatikana';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Hakuna bidhaa yenye msimbopau $barcode. Iongeze sasa kama bidhaa mpya?';
  }

  @override
  String get itmAddItem => 'Ongeza Bidhaa';

  @override
  String get itmEditItem => 'Hariri Bidhaa';

  @override
  String get itmMergeTitle => 'Unganisha Bidhaa Zinazojirudia';

  @override
  String get itmMergeBody => 'Bidhaa zenye jina moja zitaunganishwa kwenye rekodi ya zamani zaidi na hifadhi zake kujumlishwa. Hili haliwezi kutenduliwa.';

  @override
  String get itmMerge => 'Unganisha';

  @override
  String get itmNoDuplicates => 'Hakuna bidhaa zinazojirudia.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bidhaa $count zinazojirudia zimeunganishwa.',
      one: 'Bidhaa 1 inayojirudia imeunganishwa.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Futa Bidhaa';

  @override
  String get itmCannotUndo => 'Hili haliwezi kutenduliwa.';

  @override
  String get itmDeleteOffline => 'Imeshindwa kufuta — angalia muunganisho wako na ujaribu tena.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Futa Bidhaa $count',
      one: 'Futa Bidhaa 1',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Futa bidhaa $count? Hili haliwezi kutenduliwa.',
      one: 'Futa bidhaa 1? Hili haliwezi kutenduliwa.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Imeshindwa kupakia picha ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Imeshindwa kupakia picha: $error';
  }

  @override
  String get itmNoBarcodes => 'Bado hakuna bidhaa yenye msimbopau.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chapisha Lebo $count',
      one: 'Chapisha Lebo 1',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Tafuta bidhaa au kategoria...';

  @override
  String get itmStopListening => 'Acha kusikiliza';

  @override
  String get itmVoiceSearch => 'Utafutaji kwa sauti';

  @override
  String get itmSort => 'Panga';

  @override
  String get itmSortName => 'Jina (A-Z)';

  @override
  String get itmSortStockLow => 'Hifadhi: kutoka chini hadi juu';

  @override
  String get itmSortRecent => 'Zilizoongezwa hivi karibuni';

  @override
  String get itmFilterAll => 'Zote';

  @override
  String get itmFilterLowStock => 'Hifadhi Ndogo';

  @override
  String get itmNoItemsYet => 'Bado hakuna bidhaa. Gusa + kuongeza.';

  @override
  String get itmNoItemsMatch => 'Hakuna bidhaa zinazolingana na utafutaji wako.';

  @override
  String get itmNoPriceChanges => 'Bado hakuna mabadiliko ya bei yaliyorekodiwa.';

  @override
  String get itmNoStockCorrections => 'Bado hakuna masahihisho ya hifadhi yaliyorekodiwa.';

  @override
  String get itmResetHistory => 'Weka upya historia';

  @override
  String get itmResetHistoryMsg => 'Weka upya historia ya bidhaa hii? Hii haiwezi kutenduliwa.';

  @override
  String get itmSendPdf => 'Tuma kama PDF';

  @override
  String get itmNoteOptional => 'Maelezo (si lazima)';

  @override
  String get itmNoteHint => 'Ongeza maelezo kwa mabadiliko haya';

  @override
  String get itmRemoveEntry => 'Ondoa rekodi';

  @override
  String get itmRemoveEntryMsg => 'Ondoa rekodi hii kwenye historia? Hii haiwezi kutenduliwa.';

  @override
  String get itmEditEntry => 'Hariri rekodi';

  @override
  String get itmPrevQty => 'Kabla';

  @override
  String get itmNewQty => 'Mpya';

  @override
  String itmCost(String amount) {
    return 'Gharama: $amount';
  }

  @override
  String get itmMore => 'Zaidi';

  @override
  String get itmMenuPrintLabel => 'Chapisha lebo';

  @override
  String get itmMenuDuplicate => 'Nakili';

  @override
  String get itmMenuPriceHistory => 'Historia ya bei';

  @override
  String get itmMenuStockHistory => 'Historia ya marekebisho ya hifadhi';

  @override
  String itmLowStockBadge(int count) {
    return '$count hifadhi ndogo';
  }

  @override
  String itmStockLine(String qty) {
    return 'Hifadhi: $qty';
  }

  @override
  String get itmOfflineSaved => 'Nje ya mtandao — bidhaa imehifadhiwa kwenye kifaa hiki, itasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get itmItemName => 'Jina la Bidhaa';

  @override
  String get itmNameRequired => 'Jina linahitajika';

  @override
  String get itmPricePkr => 'Bei (PKR)';

  @override
  String get itmPriceRequired => 'Bei inahitajika';

  @override
  String get itmValidNumber => 'Weka nambari halali';

  @override
  String get itmUnit => 'Kipimo';

  @override
  String get itmCategoryHint => 'Kategoria (hiari, mfano Mabomba)';

  @override
  String get itmPreferredSupplier => 'Msambazaji Anayependelewa (hiari)';

  @override
  String get itmPreferredSupplierHelper => 'Hutumika na kitendo cha kuagiza tena kwa mguso mmoja';

  @override
  String get itmClear => 'Futa';

  @override
  String get itmHsn => 'Msimbo wa HSN (hiari)';

  @override
  String get itmGstRate => 'Kiwango cha GST % (hiari)';

  @override
  String get itmBarcodeOptional => 'Msimbopau (hiari)';

  @override
  String get itmScanOrType => 'Changanua au andika';

  @override
  String get itmScanBarcode => 'Changanua msimbopau';

  @override
  String get itmPurchaseCost => 'Gharama ya Ununuzi (kwa kipimo)';

  @override
  String get itmPurchaseCostHint => 'Unacholipa unaponunua hifadhi';

  @override
  String get itmWholesale => 'Bei ya Jumla (hiari)';

  @override
  String get itmContractor => 'Bei ya Wakandarasi (hiari)';

  @override
  String get itmFallsBack => 'Ikiwa haijawekwa, bei ya kawaida hutumika';

  @override
  String get itmStockQty => 'Kiasi cha Hifadhi';

  @override
  String get itmLowStockAlert => 'Tahadhari ya Hifadhi Ndogo Chini ya';

  @override
  String get itmFrequently => 'Mara nyingi hununuliwa pamoja na';

  @override
  String get itmSaveChanges => 'Hifadhi Mabadiliko';

  @override
  String get itmSaveItem => 'Hifadhi Bidhaa';

  @override
  String get itmPhotoSemantics => 'Picha ya bidhaa, gusa kubadilisha';

  @override
  String get cdUpdateStatusTitle => 'Sasisha Hali ya Malipo';

  @override
  String get cdMarkPaidQ => 'Weka alama ya kulipwa kwenye bili hii?';

  @override
  String get cdMarkUnpaidQ => 'Weka alama ya haijalipwa kwenye bili hii?';

  @override
  String get cdConfirm => 'Thibitisha';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Imeshindwa kusasisha: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Nje ya mtandao — badiliko limehifadhiwa kwenye kifaa hiki, litasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get cdConvertTitle => 'Badilisha kuwa Bili';

  @override
  String get cdConvertBody => 'Hii itapunguza hifadhi ya bidhaa hizi na kubadilisha nukuu kuwa bili halisi. Endelea?';

  @override
  String get cdConvert => 'Badilisha';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Imeshindwa kubadilisha: $detail';
  }

  @override
  String get cdReturnItems => 'Rudisha Bidhaa';

  @override
  String get cdReturnHint => 'Weka kiasi cha kurudisha cha kila bidhaa. Acha 0 ili ibaki imeuzwa.';

  @override
  String get cdDecreaseQty => 'Punguza kiasi';

  @override
  String get cdIncreaseQty => 'Ongeza kiasi';

  @override
  String get cdCreditTotal => 'Jumla ya mkopo';

  @override
  String get cdReturnSelected => 'Rudisha Zilizochaguliwa';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Imeshindwa kurudisha: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Imeshindwa kubatilisha: $detail';
  }

  @override
  String get cdNoPreviousBill => 'Hakuna bili ya awali ya kurudia';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Imeshindwa kupakia bili ya mwisho: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Ankara imetumwa kwa barua pepe kwa mteja.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Imeshindwa kutuma ankara kwa barua pepe: $detail';
  }

  @override
  String get cdStatementEmailed => 'Taarifa imetumwa kwa barua pepe kwa mteja.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Imeshindwa kutuma taarifa kwa barua pepe: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Futa Bili';

  @override
  String get cdBillVoided => 'IMEBATILISHWA';

  @override
  String get cdBillReturn => 'KURUDISHA';

  @override
  String get cdBillQuote => 'NUKUU';

  @override
  String get cdBillPaid => 'IMELIPWA';

  @override
  String get cdBillPartial => 'SEHEMU';

  @override
  String get cdBillUnpaid => 'HAIJALIPWA';

  @override
  String get cdBill => 'Bili';

  @override
  String cdVoidedReason(String reason) {
    return 'Imebatilishwa: $reason';
  }

  @override
  String get cdViewInvoice => 'Tazama Ankara';

  @override
  String get cdEmailInvoice => 'Tuma Ankara kwa Barua Pepe';

  @override
  String get cdEditBill => 'Hariri Bili';

  @override
  String get cdReturnBill => 'Rudisha Bili';

  @override
  String get cdVoidBill => 'Batilisha Bili';

  @override
  String get cdNoItems => 'Hakuna bidhaa';

  @override
  String get cdRepeatLast => 'Rudia Bili ya Mwisho';

  @override
  String get cdLedgerPdf => 'PDF ya Leja';

  @override
  String get cdEmailStatement => 'Tuma Taarifa kwa Barua Pepe';

  @override
  String get cdCollectPayment => 'Kusanya Malipo';

  @override
  String get cdSendReminder => 'Tuma Ukumbusho wa WhatsApp';

  @override
  String get cdTotalBilled => 'Jumla Iliyotozwa';

  @override
  String get cdPaid => 'Imelipwa';

  @override
  String get cdNoBills => 'Bado hakuna bili';

  @override
  String get cdBillActions => 'Vitendo vya bili';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding kati ya kikomo cha mkopo $limit imetumika';
  }

  @override
  String get cdVoidBody => 'Itaondolewa kwenye salio na ripoti, lakini itabaki kwenye historia. Hifadhi itarejeshwa. Hili haliwezi kutenduliwa.';

  @override
  String get cdReason => 'Sababu (hiari)';

  @override
  String get frmOfflineCustomer => 'Nje ya mtandao — mteja amehifadhiwa kwenye kifaa hiki, atasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get frmOfflineSupplier => 'Nje ya mtandao — msambazaji amehifadhiwa kwenye kifaa hiki, atasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get frmEditCustomer => 'Hariri Mteja';

  @override
  String get frmCustomerName => 'Jina la Mteja';

  @override
  String get frmPhoneOptional => 'Simu (hiari)';

  @override
  String get frmCreditLimit => 'Kikomo cha Mkopo (PKR, hiari)';

  @override
  String get frmCreditHelper => 'Onya salio la mteja huyu likizidi kiasi hiki';

  @override
  String get frmPriceTier => 'Kiwango cha Bei';

  @override
  String get frmRetail => 'Rejareja';

  @override
  String get frmWholesale => 'Jumla';

  @override
  String get frmContractor => 'Mkandarasi';

  @override
  String get frmPriceTierHelper => 'Bei ipi ya bidhaa ijazwe kwenye bili kwa mteja huyu';

  @override
  String get frmStrn => 'STRN (hiari)';

  @override
  String get frmStrnCustomer => 'Nambari ya Usajili wa Kodi ya Mauzo ya tarakimu 13 kwa ankara';

  @override
  String get frmStrnSupplier => 'Nambari ya Usajili wa Kodi ya Mauzo ya tarakimu 13 kwa bili za ununuzi';

  @override
  String get frmAddress => 'Anwani (hiari)';

  @override
  String get frmEmail => 'Barua pepe (hiari)';

  @override
  String get frmEmailHelper => 'Hukuwezesha kutuma ankara au taarifa kwa barua pepe kwa mteja huyu';

  @override
  String get frmSaveCustomer => 'Hifadhi Mteja';

  @override
  String get frmEditSupplier => 'Hariri Msambazaji';

  @override
  String get frmSupplierName => 'Jina la Msambazaji';

  @override
  String get frmSaveSupplier => 'Hifadhi Msambazaji';

  @override
  String get sdDeletePurchaseTitle => 'Futa Ununuzi';

  @override
  String get sdDeletePurchaseBody => 'Hifadhi ya ununuzi huu itarejeshwa. Hili haliwezi kutenduliwa.';

  @override
  String get sdReturnToSupplier => 'Rudisha kwa Msambazaji';

  @override
  String get sdReturnHint => 'Weka kiasi cha kurudisha cha kila bidhaa. Acha 0 ili uiweke.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Imeshindwa kuweka alama ya imepokelewa: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Weka alama ya kulipwa kwenye ununuzi huu?';

  @override
  String get sdMarkUnpaidQ => 'Weka alama ya haijalipwa kwenye ununuzi huu?';

  @override
  String get sdTotalPurchased => 'Jumla ya Ununuzi';

  @override
  String get sdPayable => 'Inayolipwa';

  @override
  String sdPayableAmount(String amount) {
    return '$amount inayolipwa';
  }

  @override
  String get sdNoPurchases => 'Bado hakuna ununuzi';

  @override
  String get sdPo => 'AM';

  @override
  String get sdDraftPo => 'AM YA DRAFTI';

  @override
  String get sdPurchase => 'Ununuzi';

  @override
  String get sdDraftNote => 'Agizo la ununuzi la drafti — bado halijapokelewa, hakuna mabadiliko ya hifadhi au gharama bado.';

  @override
  String get sdReturnNote => 'Kurudisha / noti ya mkopo kwa msambazaji.';

  @override
  String get sdMarkReceived => 'Weka Alama ya Imepokelewa';

  @override
  String get sdEditPurchase => 'Hariri Ununuzi';

  @override
  String get sdPurchaseActions => 'Vitendo vya ununuzi';

  @override
  String get slDeleteSupplier => 'Futa Msambazaji';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Futa Wasambazaji $count',
      one: 'Futa Msambazaji 1',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Futa wasambazaji $count na ununuzi wao wote? Hili haliwezi kutenduliwa.',
      one: 'Futa msambazaji 1 na ununuzi wake wote? Hili haliwezi kutenduliwa.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV inahitaji safu ya kichwa pamoja na angalau msambazaji mmoja.';

  @override
  String get slImportTitle => 'Leta Wasambazaji';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wasambazaji $count wamepatikana kwenye \"$file\". Waletwe wote?',
      one: 'Msambazaji 1 amepatikana kwenye \"$file\". Waletwe wote?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Wasambazaji $count wameletwa.',
      one: 'Msambazaji 1 ameletwa.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Bado hakuna wasambazaji. Gusa + kuongeza.';

  @override
  String get slSearchHint => 'Tafuta wasambazaji au simu...';

  @override
  String get slNoMatch => 'Hakuna wasambazaji wanaolingana na utafutaji wako.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'wasambazaji $count',
      one: 'msambazaji 1',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Madeni ya Wasambazaji';

  @override
  String get sduNothingOwed => 'Hakuna deni kwa wasambazaji 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'wasambazaji $count wanadaiwa',
      one: 'msambazaji 1 anadaiwa',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'siku $days tangu ununuzi wa zamani zaidi ambao haujalipwa',
      one: 'siku 1 tangu ununuzi wa zamani zaidi ambao haujalipwa',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => 'Siku 0–30';

  @override
  String get duBucket1 => 'Siku 30–60';

  @override
  String get duBucket2 => 'Siku 60+';

  @override
  String get duTitle => 'Kituo cha Madeni';

  @override
  String get duNoDues => 'Hakuna madeni yaliyobaki 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'wateja $count wenye madeni',
      one: 'mteja 1 mwenye deni',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'siku $days tangu bili ya zamani zaidi ambayo haijalipwa',
      one: 'siku 1 tangu bili ya zamani zaidi ambayo haijalipwa',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount inayodaiwa';
  }

  @override
  String get cpNoOutstanding => 'Mteja huyu hana salio linalodaiwa';

  @override
  String get cpValidAmount => 'Weka kiasi halali';

  @override
  String cpExceeds(String amount) {
    return 'Kiasi kinazidi salio linalodaiwa la $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'Imekusanywa $amount kutoka kwa $name';
  }

  @override
  String get cpOfflineSaved => 'Nje ya mtandao — malipo yamehifadhiwa kwenye kifaa hiki, yatasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String cpOwes(String amount, String name) {
    return '$name anadaiwa $amount. Inatumika kwanza kwenye bili za zamani zaidi ambazo hazijalipwa.';
  }

  @override
  String get cpAmountLabel => 'Kiasi Kilichokusanywa (PKR)';

  @override
  String get cpCollect => 'Kusanya';

  @override
  String get usNoItems => 'Hakuna bidhaa za kusasisha.';

  @override
  String get usHelp => 'Weka hifadhi mpya ya kila bidhaa, kisha gusa Hifadhi Zote.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  sasa: $qty';
  }

  @override
  String usNew(String qty) {
    return 'mpya: $qty';
  }

  @override
  String get usSubtract => 'Ondoa 1';

  @override
  String get usAdd => 'Ongeza 1';

  @override
  String get usNoChanges => 'Hakuna mabadiliko';

  @override
  String usSaveAll(int count) {
    return 'Hifadhi Zote ($count zimebadilika)';
  }

  @override
  String get srHint => 'Tafuta wateja, bidhaa, kiasi...';

  @override
  String get srFailed => 'Utafutaji umeshindwa — angalia muunganisho wako.';

  @override
  String get srTitle => 'Tafuta kwenye duka lako';

  @override
  String get srSubtitle => 'Tafuta wateja kwa jina au simu, bili kwa kiasi.';

  @override
  String srNoMatches(String query) {
    return 'Hakuna matokeo ya \"$query\"';
  }

  @override
  String get srTryDifferent => 'Jaribu jina, nambari ya simu, au kiasi tofauti.';

  @override
  String get srBills => 'Bili';

  @override
  String get srNoItemList => 'Hakuna orodha ya bidhaa';

  @override
  String get abAddAtLeastOne => 'Ongeza angalau bidhaa moja';

  @override
  String get abQuotationUpdated => 'Nukuu imesasishwa!';

  @override
  String get abBillUpdated => 'Bili imesasishwa!';

  @override
  String get abQuotationSaved => 'Nukuu imehifadhiwa!';

  @override
  String get abBillCreated => 'Bili imeundwa kwa mafanikio!';

  @override
  String abTotalAmount(String amount) {
    return 'Jumla: $amount';
  }

  @override
  String get abShare => 'Shiriki';

  @override
  String get abDoneReturn => 'Maliza na Rudi';

  @override
  String get abOverLimitBody => 'Hii itamfanya mteja avuke kikomo chake cha mkopo.';

  @override
  String get abOverLimitTitle => 'Kikomo cha mkopo kimezidi';

  @override
  String get abBillAnyway => 'Toza bili hata hivyo';

  @override
  String get abOfflineBill => 'Nje ya mtandao — bili imehifadhiwa kwenye kifaa hiki, itasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get abEditQuotation => 'Hariri Nukuu';

  @override
  String get abEditBill => 'Hariri Bili';

  @override
  String get abNewQuotation => 'Nukuu Mpya';

  @override
  String get abAddBill => 'Ongeza Bili';

  @override
  String get abCouldNotLoadItems => 'Imeshindwa kupakia bidhaa.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Bili hii itamfikisha mteja kwenye $total, juu ya kikomo chake cha mkopo cha $limit.';
  }

  @override
  String get abTapAddItemBill => 'Gusa \"Ongeza Bidhaa\" hapa chini kuanza bili';

  @override
  String get abNoCatalog => 'Bado hakuna bidhaa kwenye katalogi';

  @override
  String get abScan => 'Changanua';

  @override
  String get abDiscountRs => 'Punguzo (Rs)';

  @override
  String get abSubtotal => 'Jumla ndogo';

  @override
  String get abTotal => 'Jumla';

  @override
  String get abSaveAsQuotation => 'Hifadhi kama Nukuu';

  @override
  String get abQuotationLocked => 'Bili iliyopo haiwezi kurudishwa kuwa nukuu';

  @override
  String get abQuotationNote => 'Hakuna hifadhi inayopunguzwa hadi ibadilishwe kuwa bili';

  @override
  String get abPaymentStatus => 'Hali ya Malipo';

  @override
  String get abUnpaid => 'Haijalipwa';

  @override
  String get abPaymentMethod => 'Njia ya Malipo';

  @override
  String get abCash => 'Pesa Taslimu';

  @override
  String get abBankTransfer => 'Uhamisho wa Benki';

  @override
  String get abCheque => 'Hundi';

  @override
  String get abSaveQuotation => 'Hifadhi Nukuu';

  @override
  String get abSaveBill => 'Hifadhi Bili';

  @override
  String abAdded(String name) {
    return '$name imeongezwa';
  }

  @override
  String get apNewItem => 'Bidhaa Mpya…';

  @override
  String get apNewItemHint => 'Ongeza bidhaa mpya kwenye katalogi kwanza';

  @override
  String get apOfflinePurchase => 'Nje ya mtandao — ununuzi umehifadhiwa kwenye kifaa hiki, utasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get apEditPo => 'Hariri Agizo la Ununuzi';

  @override
  String get apNewPo => 'Agizo Jipya la Ununuzi';

  @override
  String get apAddPurchase => 'Ongeza Ununuzi';

  @override
  String get apTapAddItem => 'Gusa \"Ongeza Bidhaa\" hapa chini kuanza ununuzi';

  @override
  String get apSaveAsPo => 'Hifadhi kama Agizo la Ununuzi';

  @override
  String get apPoLocked => 'Ununuzi uliokwisha pokelewa hauwezi kurudishwa kuwa agizo la drafti';

  @override
  String get apPoNote => 'Hakuna mabadiliko ya hifadhi au gharama hadi bidhaa ziwekwe alama ya zimepokelewa';

  @override
  String get apUnpaidCredit => 'Haijalipwa (Mkopo)';

  @override
  String get apSavePo => 'Hifadhi Agizo la Ununuzi';

  @override
  String get apSavePurchase => 'Hifadhi Ununuzi';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Gharama ya sasa: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Gharama haijawekwa  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Uchanganuzi umeshindwa: hitilafu ya seva $code';
  }

  @override
  String get scOfflineSaved => 'Nje ya mtandao — picha imehifadhiwa, itasomwa kiotomatiki mtandao ukirudi';

  @override
  String get scStillOffline => 'Bado nje ya mtandao';

  @override
  String get scCouldNotCreateCustomer => 'Imeshindwa kumuunda mteja — jaribu tena.';

  @override
  String get scCouldNotCreateSupplier => 'Imeshindwa kumuunda msambazaji — jaribu tena.';

  @override
  String scBillSavedFor(String name) {
    return 'Bili imehifadhiwa kwa $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Ununuzi kutoka $name umehifadhiwa';
  }

  @override
  String get scWhichCustomer => 'Huyu ni mteja yupi?';

  @override
  String get scWhichSupplier => 'Huyu ni msambazaji yupi?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Mlingano wa karibu zaidi: $name (inafanana kwa $score%)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Ndiyo, huyu ni $name';
  }

  @override
  String get scOtherwiseCustomer => 'Vinginevyo, unda mteja mpya:';

  @override
  String get scOtherwiseSupplier => 'Vinginevyo, unda msambazaji mpya:';

  @override
  String get scNoMatchCustomer => 'Hakuna mteja anayelingana. Unda mpya:';

  @override
  String get scNoMatchSupplier => 'Hakuna msambazaji anayelingana. Unda mpya:';

  @override
  String get scCustomerName => 'Jina la mteja';

  @override
  String get scSupplierName => 'Jina la msambazaji';

  @override
  String get scCreateNew => 'Unda Mpya';

  @override
  String get scTitleBill => 'Changanua Bili';

  @override
  String get scIntroBill => 'Piga picha ya bili. Iliyoandikwa kwa mkono ni sawa, na Kisindhi, Kiurdu au Kiingereza vyote vinafanya kazi. Utaweza kuikagua kabla haijahifadhiwa.';

  @override
  String get scIntroPurchase => 'Piga picha ya ankara ya msambazaji. Kisindhi, Kiurdu au Kiingereza vyote vinafanya kazi. Utaweza kuikagua kabla haijahifadhiwa.';

  @override
  String get scReadingBill => 'Inasoma bili…';

  @override
  String get scScanBill => 'Changanua Bili';

  @override
  String get scReadingInvoice => 'Inasoma ankara…';

  @override
  String get scScanInvoice => 'Changanua Ankara';

  @override
  String get scQueued => 'Uchanganuzi Uliopangwa';

  @override
  String get scReady => 'Tayari kukaguliwa';

  @override
  String get scFailed => 'Imeshindwa';

  @override
  String get scWaiting => 'Inasubiri muunganisho';

  @override
  String get scRetry => 'Jaribu tena';

  @override
  String rpCouldNotLoad(String error) {
    return 'Imeshindwa kupakia ripoti: $error';
  }

  @override
  String get rpHeadline => 'Nambari kuu za mwezi huu';

  @override
  String get rpProfitThisMonth => 'Faida ya Mwezi Huu';

  @override
  String get rpNoData => 'Bado hakuna data';

  @override
  String get rpSalesTax => 'Kodi ya Mauzo';

  @override
  String rpSalesTaxFor(String month) {
    return 'Ripoti ya kodi ya mauzo ya $month';
  }

  @override
  String get rpViewSalesTax => 'Tazama Ripoti ya Kodi ya Mauzo';

  @override
  String get rpQuickReports => 'Ripoti za Haraka';

  @override
  String get rpQuickSub => 'Nenda moja kwa moja kwenye ripoti maalum';

  @override
  String get expensesTitle => 'Matumizi';

  @override
  String get rpRateCard => 'Orodha ya Bei';

  @override
  String get rpDetails => 'Maelezo';

  @override
  String get rpDetailsSub => 'Uchambuzi kamili na viwango';

  @override
  String get rpOutstandingByCustomer => 'Madeni kwa Mteja';

  @override
  String get rpNoOutstanding => 'Hakuna salio linalodaiwa';

  @override
  String get rpMonthlyTotals => 'Jumla za Kila Mwezi';

  @override
  String get rpMostSold => 'Bidhaa Zilizouzwa Zaidi';

  @override
  String get rpNoItemsRecorded => 'Bado hakuna bidhaa zilizorekodiwa';

  @override
  String get rpTopCustomers => 'Wateja Bora kwa Mapato';

  @override
  String get rpNoSalesRecorded => 'Bado hakuna mauzo yaliyorekodiwa';

  @override
  String get rpTotalOutstanding => 'Jumla Inayodaiwa';

  @override
  String get rpViewCustomers => 'Tazama wateja';

  @override
  String get lblInvoice => 'ankara';

  @override
  String get lblLedger => 'leja';

  @override
  String get lblRateCard => 'orodha ya bei';

  @override
  String get exCsvNeedsRows => 'CSV inahitaji safu ya kichwa pamoja na angalau matumizi moja.';

  @override
  String get exCsvHeader => 'Kichwa cha CSV lazima kiwe na safu wima za \"description\" na \"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'Mstari $line: maelezo hayapo au kiasi si sahihi — rekebisha faili na ujaribu tena.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Mstari $line: tarehe si sahihi \"$date\" — tumia YYYY-MM-DD.';
  }

  @override
  String get exImportTitle => 'Leta Matumizi';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Matumizi $count yamepatikana kwenye \"$file\". Yaletwe yote?',
      one: 'Matumizi 1 yamepatikana kwenye \"$file\". Yaletwe yote?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Matumizi $count yameletwa.',
      one: 'Matumizi 1 yameletwa.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Kuleta kumeshindwa: hitilafu ya seva $code';
  }

  @override
  String get exDeleteTitle => 'Futa Matumizi';

  @override
  String get exAdd => 'Ongeza Matumizi';

  @override
  String get exEdit => 'Hariri Matumizi';

  @override
  String get exDescription => 'Maelezo';

  @override
  String get exAmountRs => 'Kiasi (Rs)';

  @override
  String get exCategory => 'Kategoria';

  @override
  String exDate(String date) {
    return 'Tarehe: $date';
  }

  @override
  String get exRepeats => 'Hujirudia kila mwezi';

  @override
  String get exRepeatsHint => 'Kodi ya pango, umeme, mishahara, n.k.';

  @override
  String get exReceiptTap => 'Picha ya risiti, gusa kubadilisha';

  @override
  String get exReceiptOptional => 'Picha ya risiti (hiari)';

  @override
  String get exEnterValid => 'Weka maelezo na kiasi halali.';

  @override
  String get exOffline => 'Nje ya mtandao — matumizi yamehifadhiwa kwenye kifaa hiki, yatasawazishwa kiotomatiki mtandao ukirudi';

  @override
  String get exSave => 'Hifadhi Matumizi';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Matumizi $count yanayojirudia yanastahili mwezi huu',
      one: 'Matumizi 1 yanayojirudia yanastahili mwezi huu',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Ongeza';

  @override
  String get exTotal => 'Jumla ya Matumizi';

  @override
  String exCategoryChip(String name) {
    return 'Kategoria: $name';
  }

  @override
  String get exNoneLogged => 'Bado hakuna matumizi yaliyorekodiwa';

  @override
  String exNoneInCategory(String name) {
    return 'Bado hakuna matumizi ya $name';
  }

  @override
  String get exViewReceipt => 'Tazama risiti';

  @override
  String get exEditRow => 'Hariri matumizi';

  @override
  String get exDeleteRow => 'Futa matumizi';

  @override
  String gstServerReturned(String first, String second) {
    return 'Seva ilirudisha $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'Imeshindwa kupakia data ya GST: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Kupakua kumeshindwa ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename imehifadhiwa';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Imehifadhiwa kwenye Vipakuliwa/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Imeshindwa kupakua: $error';
  }

  @override
  String get gstTitle => 'Ripoti ya Kodi ya Mauzo';

  @override
  String get gstOutwardDetail => 'Mauzo ya Nje — Maelezo ya Ankara';

  @override
  String get gstNoBills => 'Hakuna bili za mwezi huu.';

  @override
  String get gstHsn => 'Muhtasari wa HSN';

  @override
  String get gstInvoiceWise => 'Maelezo kwa kila ankara';

  @override
  String get gstMonthly => 'Muhtasari wa Mwezi';

  @override
  String get gstOutwardTaxable => 'Ugavi wa nje unaotozwa kodi';

  @override
  String get gstItc => 'Mkopo wa Kodi ya Pembejeo (kutoka ununuzi)';

  @override
  String get gstSave => 'Hifadhi';

  @override
  String get rcValidAmount => 'Weka kiasi halali.';

  @override
  String get rcExpected => 'Pesa Zinazotarajiwa (mauzo ya pesa taslimu ya leo)';

  @override
  String get rcAlsoCollected => 'Pia zimekusanywa leo (hazijahesabiwa kwenye droo)';

  @override
  String get rcCounted => 'Pesa Zilizohesabiwa Kwenye Droo (Rs)';

  @override
  String get rcCompare => 'Linganisha';

  @override
  String get rcMatches => 'Inalingana kabisa!';

  @override
  String rcExtra(String amount) {
    return '$amount ya ziada kwenye droo';
  }

  @override
  String rcMissing(String amount) {
    return '$amount zinakosekana kwenye droo';
  }

  @override
  String get pbiTitle => 'Faida kwa Bidhaa';

  @override
  String get pbiNoSales => 'Bado hakuna mauzo';

  @override
  String get pbiByCategory => 'Kwa Kategoria';

  @override
  String get pbiItemsByProfit => 'Bidhaa kwa Faida';

  @override
  String get svTitle => 'Thamani ya Hifadhi';

  @override
  String get svNone => 'Hakuna hifadhi iliyopo';

  @override
  String get svItemsByValue => 'Bidhaa kwa Thamani';

  @override
  String svSummary(String items, String units) {
    return 'Bidhaa $items · vipimo $units kwenye rafu';
  }

  @override
  String svTied(String amount) {
    return '$amount zimekwama kwenye hifadhi';
  }

  @override
  String get svEstimated => 'makadirio kutoka bei ya kuuza';

  @override
  String get bkRestoreTitle => 'Rejesha Hifadhi Nakala?';

  @override
  String bkRestoreBody(String filename) {
    return 'Hii itabadilisha DATA ZOTE za sasa na faili ya hifadhi nakala \"$filename\". Endelea?';
  }

  @override
  String get bkRestore => 'Rejesha';

  @override
  String get bkRestoreDoneTitle => 'Urejeshaji Umekamilika';

  @override
  String get bkRestoreDoneBody => 'Data yako imerejeshwa.';

  @override
  String get bkOk => 'Sawa';

  @override
  String bkRestoreFailed(String detail) {
    return 'Urejeshaji umeshindwa: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Imeshindwa kurejesha: $error';
  }

  @override
  String get bkSaveToDownloads => 'Hifadhi kwenye Vipakuliwa';

  @override
  String get bkIntroAdmin => 'Data yako yote iko kwenye faili moja ya hifadhidata. Pakua nakala mara kwa mara, na uirejeshe ikiwa kuna tatizo lolote.';

  @override
  String get bkIntroStaff => 'Hifadhi nakala na urejeshaji kamili wa hifadhidata ni kwa wasimamizi pekee. Mwombe msimamizi, au hamisha unachohitaji kama CSV hapa chini.';

  @override
  String get bkBackupDb => 'Hifadhi Nakala ya Hifadhidata';

  @override
  String get bkBackupDbSub => 'Pakua hifadhidata nzima kama faili moja na uishiriki (WhatsApp, Drive, barua pepe).';

  @override
  String get bkDownloadPhone => 'Pakua Hifadhi Nakala kwenye Simu';

  @override
  String get bkShareBackup => 'Shiriki Hifadhi Nakala';

  @override
  String get bkAutoTitle => 'Hifadhi Nakala za Kiotomatiki';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hifadhi nakala $count za kila siku zimehifadhiwa kwenye seva, ya hivi karibuni zaidi ni ya $time. Zinaendesha zenyewe — hakuna cha kufanya hapa.',
      one: 'Hifadhi nakala 1 ya kila siku imehifadhiwa kwenye seva, ya hivi karibuni zaidi ni ya $time. Inaendesha yenyewe — hakuna cha kufanya hapa.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Chagua faili ya hifadhi nakala iliyohifadhiwa kubadilisha data ya sasa.';

  @override
  String get bkRestoreFromFile => 'Rejesha kutoka Faili ya Hifadhi Nakala';

  @override
  String get bkExportCsv => 'Hamisha kwenda CSV';

  @override
  String get bkExportSub => 'Zifungue kwenye Excel au uzishiriki.';

  @override
  String get bkRangeAll => 'Bili/Matumizi: wakati wote';

  @override
  String bkRangeSome(String end, String start) {
    return 'Bili/Matumizi: $start hadi $end';
  }

  @override
  String get bkSetRange => 'Weka Kipindi';

  @override
  String get bkClearRange => 'Futa kipindi';

  @override
  String get ntNever => 'Haijawahi kuanzishwa';

  @override
  String get ntJustNow => 'Sasa hivi';

  @override
  String ntMinutesAgo(int count) {
    return 'dakika $count zilizopita';
  }

  @override
  String ntHoursAgo(int count) {
    return 'saa $count zilizopita';
  }

  @override
  String ntDaysAgo(int count) {
    return 'siku $count zilizopita';
  }

  @override
  String get ntTitle => 'Arifa Mahiri';

  @override
  String get ntTapHint => 'Gusa \"Kagua Sasa\" kuanzisha arifa na kuona matokeo papo hapo.';

  @override
  String get ntLowStockSub => 'Arifu bidhaa zinaposhuka chini ya kiwango cha kuagiza tena.';

  @override
  String get ntCheckNow => 'Kagua Sasa';

  @override
  String get ntOverdue => 'Vikumbusho vya Malipo Yaliyochelewa';

  @override
  String get ntOverdueSub => 'Arifu kuhusu bili ambazo hazijalipwa za siku zilizopita.';

  @override
  String get ntDaily => 'Muhtasari wa Biashara wa Kila Siku';

  @override
  String get ntDailySub => 'Mauzo, makusanyo na faida ya jana kwa mtazamo mmoja.';

  @override
  String get ntSendSummary => 'Tuma Muhtasari';

  @override
  String get ntRunning => 'Inaendesha…';

  @override
  String get ntLowStockItems => 'Bidhaa za Hifadhi Ndogo';

  @override
  String get ntSales => 'Mauzo';

  @override
  String get ntCollected => 'Zilizokusanywa';

  @override
  String get ntProfit => 'Faida';

  @override
  String get auChecking => 'Inakagua masasisho…';

  @override
  String get auLatest => 'Una toleo la hivi karibuni.';

  @override
  String get auAvailable => 'Sasisho linapatikana';

  @override
  String auNewer(int code) {
    return 'Toleo jipya la Book-Keep (muundo $code) liko tayari.';
  }

  @override
  String get auLater => 'Baadaye';

  @override
  String get auUpdate => 'Sasisha';

  @override
  String get auDownloading => 'Inapakua sasisho';

  @override
  String auSaved(String name) {
    return '$name imehifadhiwa kwenye folda yako ya Vipakuliwa.';
  }

  @override
  String get auAllowInstall => 'Ruhusu Book-Keep kusakinisha programu, kisha gusa Sasisha tena.';

  @override
  String get auFailed => 'Imeshindwa kusasisha — angalia muunganisho wako na ujaribu tena.';

  @override
  String get lgSearch => 'Tafuta lugha';

  @override
  String lgNoMatch(String query) {
    return 'Hakuna lugha inayolingana na \"$query\"';
  }

  @override
  String get alVoided => 'Alibatilisha bili';

  @override
  String get alDeletedBill => 'Alifuta bili';

  @override
  String get alReturned => 'Alirudisha bili';

  @override
  String get alDeletedCustomer => 'Alifuta mteja';

  @override
  String get alDeletedSupplier => 'Alifuta msambazaji';

  @override
  String get alCreatedAccount => 'Aliunda akaunti';

  @override
  String get alUpdatedAccount => 'Alisasisha akaunti';

  @override
  String get alDeletedAccount => 'Alifuta akaunti';

  @override
  String get alTitle => 'Kumbukumbu ya Shughuli';

  @override
  String get alNone => 'Bado hakuna shughuli zilizorekodiwa';

  @override
  String get blkEnterOne => 'Weka angalau bidhaa moja';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bidhaa $count zimeongezwa kwa mafanikio',
      one: 'Bidhaa 1 imeongezwa kwa mafanikio',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Ongeza Bidhaa kwa Wingi';

  @override
  String get blkFormat => 'Bidhaa moja kwa kila mstari, muundo: Jina, Bei, Kipimo, Kategoria';

  @override
  String get blkOptional => 'Kipimo na kategoria ni hiari (chaguo-msingi: piece, hakuna)';

  @override
  String get blkAddAll => 'Ongeza Bidhaa Zote';

  @override
  String get prSend => 'Tuma Kikumbusho cha Malipo';

  @override
  String get prTone => 'Chagua Sauti:';

  @override
  String get prPolite => 'Ya heshima';

  @override
  String get prStandard => 'Ya kawaida';

  @override
  String get prUrgent => 'Ya dharura';

  @override
  String get prPreviewQr => 'Hakiki QR ya Malipo ya JazzCash';

  @override
  String get prShareText => 'Shiriki Maandishi';

  @override
  String get dsRemaining => 'Iliyobaki';

  @override
  String dsIncludesDiscount(String amount) {
    return 'inajumuisha punguzo la $amount';
  }

  @override
  String get dsItems => 'Bidhaa';

  @override
  String get dsDiscount => 'Punguzo';

  @override
  String get lkWrongPin => 'PIN si sahihi';

  @override
  String get lkEnterPin => 'Weka PIN';

  @override
  String get lkChecking => 'Inakagua alama ya kidole...';

  @override
  String get bcTitle => 'Changanua Msimbopau';

  @override
  String get bcTorchNa => 'Tochi haipatikani kwenye kifaa hiki';

  @override
  String get bcTorch => 'Tochi';

  @override
  String get bcPoint => 'Elekeza kamera kwenye msimbopau';

  @override
  String get qrNoNumber => 'Hakuna nambari ya JazzCash iliyowekwa. Iweke kwenye Mipangilio ili kuonyesha msimbo wa QR wa malipo.';

  @override
  String get qrPay => 'Lipa kwa JazzCash';

  @override
  String get qrInvalid => 'Data ya QR si sahihi';

  @override
  String qrAmount(String amount) {
    return 'Kiasi: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'Nakili nambari ya JazzCash';

  @override
  String get qrCopied => 'Nambari ya JazzCash imenakiliwa kwenye ubao wa kunakili';

  @override
  String get qrHint => 'Changanua au nakili nambari hii kwenye programu yako ya JazzCash ili kulipa.';

  @override
  String clOwed(String amount) {
    return '$amount inayodaiwa';
  }

  @override
  String get lnEnterEmailFirst => 'Weka kwanza barua pepe halali hapo juu.';

  @override
  String get lnResetSent => 'Barua pepe ya kuweka upya nenosiri imetumwa — angalia kisanduku chako cha barua.';

  @override
  String get lnNoAccount => 'Hakuna akaunti iliyopatikana kwa barua pepe hiyo.';

  @override
  String get lnWrongPassword => 'Nenosiri si sahihi.';

  @override
  String get lnInvalidEmail => 'Hiyo haionekani kuwa anwani halali ya barua pepe.';

  @override
  String get lnDisabled => 'Akaunti hii imezimwa.';

  @override
  String get lnTooMany => 'Majaribio mengi mno — jaribu tena baada ya dakika moja.';

  @override
  String get lnNoInternet => 'Hakuna muunganisho wa intaneti.';

  @override
  String get lnWeakPassword => 'Nenosiri lazima liwe na angalau herufi 6.';

  @override
  String get lnCouldNotSignIn => 'Imeshindwa kuingia. Tafadhali jaribu tena.';

  @override
  String get lnWrongPasswordHint => 'Nenosiri si sahihi. Jaribu tena au gusa \"Umesahau nenosiri?\".';

  @override
  String get lnWrongEmail => 'Barua pepe si sahihi — hakuna akaunti inayotumia anwani hiyo.';

  @override
  String get lnWrongEmailOrPassword => 'Barua pepe au nenosiri si sahihi.';

  @override
  String get lnWrongUsername => 'Jina la mtumiaji si sahihi — hakuna akaunti inayotumia jina hilo.';

  @override
  String get lnWelcome => 'Karibu tena';

  @override
  String lnSignInTo(String app) {
    return 'Ingia kwenye $app';
  }

  @override
  String get lnEmailOrUsername => 'Barua pepe au Jina la mtumiaji';

  @override
  String get lnRemember => 'Nikumbuke';

  @override
  String get lnForgot => 'Umesahau nenosiri?';

  @override
  String get lnSignIn => 'Ingia';

  @override
  String get lnGoogle => 'Endelea na Google';

  @override
  String get lnNew => 'Mgeni hapa?';

  @override
  String get lnCreate => 'Fungua akaunti';

  @override
  String suCreated(String email) {
    return 'Akaunti imefunguliwa kwa $email. Barua pepe ya uthibitisho imetumwa (hiari).';
  }

  @override
  String suSetup(String app) {
    return 'Sanidi $app';
  }

  @override
  String get suName => 'Jina';

  @override
  String get suEmail => 'Barua pepe';

  @override
  String suPhoneDigits(int digits) {
    return 'Weka nambari halali ya tarakimu $digits';
  }

  @override
  String get suCreateBtn => 'Fungua Akaunti';

  @override
  String get suHaveAccount => 'Tayari una akaunti?';

  @override
  String get suAlreadyExists => 'Akaunti ya barua pepe hiyo tayari ipo.';

  @override
  String get suInvalidEmail => 'Anwani ya barua pepe si sahihi.';

  @override
  String get agShow => 'Onyesha nenosiri';

  @override
  String get agHide => 'Ficha nenosiri';

  @override
  String get adAccounts => 'Akaunti';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'akaunti $count zilizosajiliwa',
      one: 'akaunti 1 iliyosajiliwa',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Ongeza';

  @override
  String get adNoAccounts => 'Hakuna akaunti zilizopatikana.';

  @override
  String get adAccountability => 'Uwajibikaji';

  @override
  String get adAccountabilitySub => 'Nani alibatilisha, alifuta au alirudisha kitu, na mabadiliko ya akaunti.';

  @override
  String get adActivitySub => 'Bili zilizobatilishwa, ufutaji, mabadiliko ya akaunti';

  @override
  String get adServer => 'Seva';

  @override
  String get adServerSub => 'Programu hii inawasiliana na nani. Mara chache huhitaji kubadilishwa baada ya usanidi.';

  @override
  String get adServerHint => 'Emulata hutumia 10.0.2.2; simu halisi inahitaji IP ya kompyuta mpakato kwenye Wi-Fi ile ile. Kuibadilisha kunaathiri kila akaunti.';

  @override
  String get adApiBase => 'URL ya Msingi ya API';

  @override
  String get adSaveServer => 'Hifadhi Anwani ya Seva';

  @override
  String get adEmailSetSub => 'Imesanidiwa — wafanyakazi wanaweza kutuma ankara/taarifa kwa wateja kwa barua pepe.';

  @override
  String get adNotSetUp => 'Bado haijasanidiwa.';

  @override
  String get adEmailSetBody => 'Barua pepe imesanidiwa. Inawawezesha wafanyakazi kutuma ankara au taarifa moja kwa moja kwa mteja.';

  @override
  String get adEmailHelp => 'Anwani ya Gmail hufanya kazi na nenosiri la programu (smtp.gmail.com, bandari 587), au tumia maelezo ya SMTP ya mtoa huduma wako wa barua pepe.';

  @override
  String get adSmtpHost => 'Mwenyeji wa SMTP';

  @override
  String get adSmtpPort => 'Bandari ya SMTP';

  @override
  String get adEmailAddress => 'Anwani ya Barua Pepe';

  @override
  String get adPwKeep => 'Nenosiri (acha wazi kuweka la sasa)';

  @override
  String get adPwApp => 'Nenosiri (nenosiri la programu, si la kuingia)';

  @override
  String get adFromName => 'Jina la Mtumaji (hiari)';

  @override
  String get adFromHint => 'Duka Langu la Vifaa';

  @override
  String get adSaving => 'Inahifadhi...';

  @override
  String get adSaveEmail => 'Hifadhi Mipangilio ya Barua Pepe';

  @override
  String get adAddAccount => 'Ongeza akaunti';

  @override
  String get adNameOpt => 'Jina (hiari)';

  @override
  String get adAtLeast6 => 'Angalau herufi 6';

  @override
  String get adGrantAdmin => 'Mpe usimamizi';

  @override
  String get adCanManage => 'Anaweza kubatilisha/kufuta/kurudisha';

  @override
  String get adCanManageHint => 'Kubatilisha au kufuta bili, kurudisha bili, au kufuta mteja/msambazaji. Msimamizi huwa nayo daima.';

  @override
  String get adCreate => 'Unda';

  @override
  String get adAccountCreated => 'Akaunti imeundwa.';

  @override
  String adCreateFailed(String error) {
    return 'Kuunda kumeshindwa: $error';
  }

  @override
  String get adEditAccount => 'Hariri akaunti';

  @override
  String get adAdminSwitch => 'Msimamizi';

  @override
  String get adAdminHint => 'Anaweza kufungua paneli ya usimamizi';

  @override
  String get adDisabled => 'Imezimwa';

  @override
  String get adDisabledHint => 'Imezuiwa kuingia';

  @override
  String get adAccountUpdated => 'Akaunti imesasishwa.';

  @override
  String adUpdateFailed(String error) {
    return 'Kusasisha kumeshindwa: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label ataondolewa kabisa na hataweza tena kuingia.';
  }

  @override
  String get adAccountDeleted => 'Akaunti imefutwa.';

  @override
  String adDeleteFailed(String error) {
    return 'Kufuta kumeshindwa: $error';
  }

  @override
  String get adBadgeAdmin => 'MSIMAMIZI';

  @override
  String get adBadgeDisabled => 'IMEZIMWA';

  @override
  String get adOff => 'Paneli ya usimamizi imezimwa';

  @override
  String get adCheckAgain => 'Kagua tena';

  @override
  String get adAccessRequired => 'Ufikiaji wa msimamizi unahitajika';

  @override
  String get adAccessBody => 'Wasimamizi wa duka pekee wanaweza kusimamia akaunti. Mwombe mmiliki wa duka akupe ufikiaji wa msimamizi.';

  @override
  String get adCouldNotLoad => 'Imeshindwa kupakia paneli ya usimamizi.';

  @override
  String get adBadPort => 'Weka nambari halali ya bandari ya SMTP.';

  @override
  String get adEmailSaved => 'Mipangilio ya barua pepe imehifadhiwa.';

  @override
  String adEmailSaveFailed(String error) {
    return 'Imeshindwa kuhifadhi mipangilio ya barua pepe: $error';
  }

  @override
  String get adServerEmpty => 'Anwani ya seva haiwezi kuwa tupu.';

  @override
  String get adServerSaved => 'Anwani ya seva imehifadhiwa. Skrini zitaitumia wakati ujao zitakapopakiwa.';

  @override
  String get lnOr => 'au';

  @override
  String get scNotABill => 'Hii haionekani kuwa bili. Jaribu tena kwa picha safi ya bili.';

  @override
  String get scNotAnInvoice => 'Hii haionekani kuwa ankara. Jaribu tena kwa picha safi ya ankara ya msambazaji.';

  @override
  String get jqOpenFull => 'Skrini nzima';

  @override
  String get jqCopy => 'Nakili nambari';

  @override
  String get jqSheetTitle => 'QR ya JazzCash';

  @override
  String get jqSheetHint => 'Wateja huichanganua kwenye programu yao ya JazzCash ili kukulipa.';

  @override
  String get jqCheck => 'Angalia nambari';

  @override
  String get askVoice => 'Sauti';

  @override
  String get askVoiceFallbackNote => 'Inasomwa kwa sauti ya simu yako.';

  @override
  String get askPace => 'Kasi';

  @override
  String get askTone => 'Mtindo';

  @override
  String get askPaceSlower => 'Polepole zaidi';

  @override
  String get askPaceNormal => 'Kawaida';

  @override
  String get askPaceFaster => 'Haraka zaidi';

  @override
  String get askToneCalm => 'Tulivu';

  @override
  String get askToneWarm => 'Ya joto';

  @override
  String get askToneCheerful => 'Changamfu';

  @override
  String qPaymentUpdate(String amount) {
    return 'Sasisho la malipo: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Mteja: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Msambazaji: $name';
  }

  @override
  String qItem(String name) {
    return 'Bidhaa: $name';
  }

  @override
  String qExpense(String name) {
    return 'Gharama: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Ununuzi: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Malipo yamepokelewa: $amount kutoka $name';
  }

  @override
  String gstAmount(String amount) {
    return 'Kodi $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Inayotozwa kodi $taxable  ·  Kodi $tax  ·  Jumla $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Mapato: $revenue  •  Gharama ya bidhaa: $cogs  •  Matumizi: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Habari $customer, salamu kutoka $shop! Salio lako lote la deni ni $amount. Asante!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Habari $customer, ukumbusho wa malipo kutoka $shop kwa salio linalosubiri la $amount. Tafadhali lipa mapema iwezekanavyo.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'TAARIFA YA HARAKA: Mpendwa $customer, malipo yako ya $amount katika $shop bado hayajalipwa. Tafadhali lipa mara moja.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Lipa kupitia JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Ankara kutoka $shop\nJumla: $total\nBidhaa: $items\nHali: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Habari $supplier, huyu ni $shop. Tungependa kuagiza:\n$lines\n\nTafadhali thibitisha upatikanaji na bei. Asante.';
  }

  @override
  String ppUpdated(String date) {
    return 'Ilisasishwa mwisho: $date';
  }

  @override
  String get ppWhoH => 'Sisi ni nani';

  @override
  String ppWho(String owner, String email) {
    return '$owner, anayeendesha Book-keep.\nMawasiliano: $email';
  }

  @override
  String get ppCollectH => 'Tunachokusanya';

  @override
  String get ppCollectAccount => 'Akaunti: barua pepe, namba ya simu, na jina la mtumiaji, kupitia Firebase Authentication.';

  @override
  String get ppCollectShop => 'Wasifu wa duka: jina la duka, anwani, namba ya simu, namba ya JazzCash, na nembo ya duka — vinavyowekwa na mmiliki wa duka kwenye Mipangilio.';

  @override
  String get ppCollectRecords => 'Rekodi za biashara unazounda: majina na namba za simu za wateja na wasambazaji, bili, manunuzi, orodha ya bidhaa (pamoja na picha za bidhaa na msimbopau), na gharama (pamoja na picha za risiti). Hizi ndizo data kuu za programu — ndivyo uhasibu unavyofanya kazi.';

  @override
  String get ppCollectDevice => 'Data ya kifaa na uchunguzi: tokeni ya arifa (kwa tahadhari za bidhaa kupungua, malipo yaliyochelewa, na muhtasari wa kila siku) na ripoti za hitilafu (taarifa za kifaa na rekodi za hitilafu) kupitia Firebase Crashlytics, zinazotumwa kiotomatiki programu inapokwama.';

  @override
  String ppCollectAi(String askShop) {
    return 'Vipengele vya AI: $askShop, Muhtasari wa Asubuhi wa AI, na kichanganuzi cha bili/manunuzi cha AI hutuma kipande cha data husika za biashara (takwimu za ripoti, au picha ya bili) kwa Gemini API ya Google ili kutoa jibu, muhtasari, au mistari iliyotolewa. Data hii huchakatwa na Google kutoa jibu; haitumiwi na sisi wala Google kufunza miundo nje ya masharti ya kawaida ya API ya Google.';
  }

  @override
  String get ppDontH => 'Tusichofanya';

  @override
  String get ppDontLocation => 'Hatufuatilii mahali ulipo.';

  @override
  String get ppDontAds => 'Hatutumii mitandao ya matangazo wala zana za uchambuzi wa tabia/kurekodi vipindi.';

  @override
  String get ppDontSell => 'Hatuuzi data yako wala data ya wateja wako kwa mtu yeyote.';

  @override
  String get ppWhereH => 'Data inahifadhiwa wapi';

  @override
  String get ppWhereDb => 'Hifadhidata: Neon (Postgres), mtoa huduma wa hifadhidata ya wingu wa mtu wa tatu.';

  @override
  String get ppWhereFirebase => 'Uthibitishaji, arifa, ripoti za hitilafu, uhifadhi wa picha: Firebase (Google).';

  @override
  String get ppWhereAi => 'Uchakataji wa AI: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Barua pepe za ankara: hutumwa kupitia akaunti ya SMTP ambayo msimamizi wa duka lako anaiweka kwenye $adminPanel. Hatuna orodha ya barua; barua hizi ni ankara/taarifa za mtu mmoja mmoja kwa wateja wako mwenyewe, si matangazo ya jumla.';
  }

  @override
  String get ppYoursH => 'Data yako, data ya wateja wako';

  @override
  String get ppYours => 'Kila unachoingiza — wateja, wasambazaji, bili, bidhaa — ni mali ya duka lako. Maduka mengine yanayotumia Book-keep hayawezi kukiona. Akaunti za wafanyakazi unazounda huona tu kile unachowapa ruhusa.';

  @override
  String get ppControlsH => 'Udhibiti wako';

  @override
  String ppControlExport(String path) {
    return 'Hamisha au hifadhi nakala ya data yako: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Futa akaunti yako: $path. Hii inaondoa tu kitambulisho chako cha kuingia; haifuti rekodi za biashara za duka lako (bili, wateja, bidhaa, n.k.), kama vile kumwondoa mfanyakazi hakufuti rekodi alizounda.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Arifa: zinaweza kuzimwa kwa kila aina katika $path.';
  }

  @override
  String get ppChildrenH => 'Watoto';

  @override
  String get ppChildren => 'Book-keep ni zana ya biashara kwa wamiliki wa maduka na wafanyakazi. Haielekezwi kwa watoto wala haitumiwi nao kwa kujua.';

  @override
  String get ppChangesH => 'Mabadiliko ya sera hii';

  @override
  String get ppChanges => 'Tunachokusanya au data inakokwenda kikibadilika, tutasasisha ukurasa huu na kubadilisha tarehe juu.';

  @override
  String get ppContactH => 'Mawasiliano';

  @override
  String ppContact(String email) {
    return 'Maswali kuhusu sera hii au data yako: $email';
  }

  @override
  String get waHello => 'Habari!';

  @override
  String waHelloNamed(String name) {
    return 'Habari $name,';
  }

  @override
  String get gstTaxable => 'Inayotozwa kodi';

  @override
  String get gstTax => 'Kodi';

  @override
  String get gstTaxableValue => 'Thamani inayotozwa kodi';

  @override
  String get gstTotalTax => 'Jumla ya kodi';

  @override
  String get gstTotalItc => 'Jumla ya mkopo wa kodi ya pembejeo';

  @override
  String get gstExempt => 'Mauzo yaliyosamehewa';

  @override
  String get gstNetPayable => 'Kodi halisi ya kulipwa';

  @override
  String get unknownName => 'Haijulikani';

  @override
  String get unitPiece => 'kipande';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'mita';

  @override
  String get unitBox => 'boksi';

  @override
  String get unitDozen => 'dazeni';

  @override
  String get unitLiter => 'lita';

  @override
  String get unitBag => 'mfuko';

  @override
  String deleteSupplierMessage(String name) {
    return 'Futa $name na manunuzi yake yote? Hatua hii haiwezi kutenduliwa.';
  }
}
