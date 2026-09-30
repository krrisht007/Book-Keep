// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navCustomers => 'العملاء';

  @override
  String get navItems => 'الأصناف';

  @override
  String get navSuppliers => 'الموردون';

  @override
  String get navReports => 'التقارير';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get settingsShopDetailsTitle => 'بيانات المتجر';

  @override
  String get settingsShopDetailsSubtitle => 'تظهر في فواتيرك.';

  @override
  String get settingsShopNameLabel => 'اسم المتجر';

  @override
  String get settingsShopAddressLabel => 'عنوان المتجر';

  @override
  String get settingsPhoneLabel => 'الهاتف';

  @override
  String get settingsSaveShopDetails => 'حفظ بيانات المتجر';

  @override
  String get settingsAppearanceTitle => 'المظهر';

  @override
  String get settingsAppearanceSubtitle => 'اختر مظهر التطبيق بالكامل.';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeSystem => 'النظام';

  @override
  String get settingsLanguageTitle => 'اللغة';

  @override
  String get settingsLanguageSubtitle => 'اختر لغة عرض التطبيق.';

  @override
  String get sortNameNewest => 'ترتيب: الاسم / الأحدث';

  @override
  String get addCustomer => 'إضافة عميل';

  @override
  String get importCsv => 'استيراد CSV';

  @override
  String get searchShop => 'البحث في المتجر';

  @override
  String get scanToFindItem => 'امسح للعثور على صنف';

  @override
  String get bulkAdd => 'إضافة جماعية';

  @override
  String get updateStock => 'تحديث المخزون';

  @override
  String get printLabels => 'طباعة الملصقات';

  @override
  String get mergeDuplicates => 'دمج المكررات';

  @override
  String get addSupplier => 'إضافة مورد';

  @override
  String get scanPurchaseInvoice => 'مسح فاتورة شراء';

  @override
  String askNoAnswer(String reason) {
    return 'تعذر الحصول على إجابة: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'تعذر الاتصال: $error';
  }

  @override
  String get micPermissionNeeded => 'يلزم إذن الميكروفون للإدخال الصوتي.';

  @override
  String get speechUnavailable => 'التعرف على الكلام غير متاح على هذا الجهاز.';

  @override
  String get askYourShop => 'اسأل متجرك';

  @override
  String get close => 'إغلاق';

  @override
  String get askIntro => 'تتساءل كيف حال المتجر؟ اسألني وسأجيبك من واقع دفاترك.';

  @override
  String get askListening => 'يستمع…';

  @override
  String get askThinkingWords => 'يفكر…|جارٍ العمل…|يحسب الأرقام…|يراجع الدفاتر…|يجمع…|يفحص الأرقام…';

  @override
  String get askSayQuestion => 'قل سؤالك — اضغط على الكرة للإلغاء';

  @override
  String briefingRefreshFailed(int code) {
    return 'تعذر تحديث الملخص ($code).';
  }

  @override
  String get refreshFailedOffline => 'تعذر التحديث — تحقق من الاتصال.';

  @override
  String get newBillFailed => 'تعذر بدء فاتورة جديدة — تحقق من الاتصال وحاول مرة أخرى.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'حدد مورداً مفضلاً لـ $name أولاً (اضغط للتعديل).';
  }

  @override
  String get reorderBySupplier => 'إعادة الطلب حسب المورد';

  @override
  String get supplier => 'المورد';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أصناف',
      one: 'صنف واحد',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'لا توجد أصناف منخفضة المخزون لها مورد مفضل بعد.';

  @override
  String get thisSupplier => 'هذا المورد';

  @override
  String supplierNoPhone(String name) {
    return 'لا يوجد رقم هاتف لـ $name.';
  }

  @override
  String get tabOverview => 'نظرة عامة';

  @override
  String get tabStock => 'المخزون';

  @override
  String get tabMoney => 'المال';

  @override
  String get taglineOverview => 'مستحقات اليوم والمخزون والنقد في لمحة.';

  @override
  String get taglineStock => 'ما يُباع وما ينفد.';

  @override
  String get taglineMoney => 'المصروفات والتسوية والتحصيل.';

  @override
  String loadingDashboard(int done, int total) {
    return 'جارٍ تحميل اللوحة… $done من $total';
  }

  @override
  String get dashboardLoadFailed => 'تعذر تحميل اللوحة';

  @override
  String get checkConnectionRetry => 'تحقق من الاتصال وحاول مرة أخرى.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get aiBriefing => 'ملخص الذكاء الاصطناعي';

  @override
  String get briefingPrompt => 'اطّلع على أعمال الأمس في بضع جمل.';

  @override
  String get getBriefing => 'احصل على الملخص';

  @override
  String get refreshBriefing => 'تحديث الملخص';

  @override
  String updatedAt(String time) {
    return 'حُدّث $time';
  }

  @override
  String get customersUnknown => '— عملاء';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عملاء',
      one: 'عميل واحد',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'الشهر السابق';

  @override
  String get nextMonth => 'الشهر التالي';

  @override
  String get salesMonth => 'المبيعات (الشهر)';

  @override
  String get outstanding => 'المستحق';

  @override
  String get profitMonth => 'الربح (الشهر)';

  @override
  String get cashToday => 'نقد اليوم';

  @override
  String get newBill => 'فاتورة جديدة';

  @override
  String get scanHandwrittenBill => 'مسح فاتورة مكتوبة بخط اليد';

  @override
  String get topOutstanding => 'أعلى الأرصدة المستحقة';

  @override
  String viewAllInDues(int count) {
    return 'عرض الكل ($count) في مركز المستحقات';
  }

  @override
  String get lowStockAlerts => 'تنبيهات انخفاض المخزون';

  @override
  String get noLowStock => 'لا توجد أصناف منخفضة — المخزون جيد.';

  @override
  String get whatsappAll => 'واتساب للجميع';

  @override
  String get reorderAll => 'إعادة طلب الكل';

  @override
  String suggestReorder(String qty, String unit) {
    return 'يُقترح إعادة طلب $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'متبقٍ $qty $unit';
  }

  @override
  String get reorder => 'إعادة الطلب';

  @override
  String get whatsappSupplier => 'واتساب المورد';

  @override
  String get topItemsByRevenue => 'أعلى الأصناف إيراداً';

  @override
  String get noSalesYet => 'لا توجد مبيعات مسجلة بعد.';

  @override
  String qtyLabel(String qty) {
    return 'الكمية: $qty';
  }

  @override
  String get monthExpenses => 'مصروفات هذا الشهر';

  @override
  String get noExpensesMonth => 'لا توجد مصروفات مسجلة هذا الشهر.';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get dailyCashReconciliation => 'تسوية النقد اليومية';

  @override
  String get collectMoney => 'تحصيل المال';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تغييرات محفوظة دون اتصال',
      one: 'تغيير واحد محفوظ دون اتصال',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'ستتم المزامنة تلقائياً عند عودة الاتصال';

  @override
  String get syncing => 'جارٍ المزامنة';

  @override
  String get sync => 'مزامنة';

  @override
  String get shopProfile => 'ملف المتجر';

  @override
  String get insights => 'رؤى';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get backupExport => 'النسخ الاحتياطي والتصدير';

  @override
  String get adminPanel => 'لوحة المشرف';

  @override
  String get toolsSync => 'الأدوات والمزامنة';

  @override
  String get account => 'الحساب';

  @override
  String get shopDetailsSaved => 'تم حفظ بيانات المتجر.';

  @override
  String saveFailed(int code) {
    return 'فشل الحفظ ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'تعذر الحفظ: $error';
  }

  @override
  String get logoUpdated => 'تم تحديث الشعار.';

  @override
  String logoUploadFailed(int code) {
    return 'فشل رفع الشعار ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'تعذر رفع الشعار: $error';
  }

  @override
  String get healthGood => 'كل شيء جيد بشكل عام.';

  @override
  String get healthSome => 'بعض الأمور تحتاج إلى انتباه.';

  @override
  String get healthMany => 'عدة أمور تحتاج إلى انتباه.';

  @override
  String get shopHealth => 'صحة المتجر';

  @override
  String get healthIntro => 'تذكير سريع، لا تقرير آخر.';

  @override
  String get couldNotLoadCheckConnection => 'تعذر التحميل — تحقق من الاتصال.';

  @override
  String get itemPhotos => 'صور الأصناف';

  @override
  String get barcodes => 'الباركود';

  @override
  String get lowStockItems => 'أصناف منخفضة المخزون';

  @override
  String get lastBackup => 'آخر نسخة احتياطية';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'منذ $days أيام',
      one: 'منذ يوم',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'حالة عدم الاتصال';

  @override
  String get online => 'متصل';

  @override
  String get offline => 'غير متصل';

  @override
  String get waitingToSync => 'بانتظار المزامنة';

  @override
  String get syncNow => 'زامن الآن';

  @override
  String get searchSettings => 'البحث في الإعدادات';

  @override
  String noSettingsMatch(String query) {
    return 'لا توجد إعدادات تطابق \"$query\"';
  }

  @override
  String get businessInfo => 'معلومات النشاط';

  @override
  String get payment => 'الدفع';

  @override
  String get shopNameRequired => 'اسم المتجر مطلوب';

  @override
  String phoneIncomplete(int digits) {
    return 'أدخل رقم هاتف كاملاً من $digits أرقام';
  }

  @override
  String get jazzcashOptional => 'رقم JazzCash (اختياري)';

  @override
  String get saved => 'تم الحفظ!';

  @override
  String get languageSubtitle => 'تغيير لغة عرض التطبيق';

  @override
  String get notificationsSubtitle => 'انخفاض المخزون والمدفوعات المتأخرة والملخص اليومي';

  @override
  String get backupSubtitle => 'تنزيل بيانات المتجر واستعادتها وتصديرها';

  @override
  String get appUpdate => 'تحديث التطبيق';

  @override
  String get appUpdateSubtitle => 'التحقق من وجود إصدار أحدث';

  @override
  String get adminSubtitle => 'إدارة الحسابات وبيانات المتجر';

  @override
  String get accountSubtitle => 'تسجيل الدخول وكلمة المرور واسم المستخدم';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacySubtitle => 'ما البيانات التي نجمعها ولماذا';

  @override
  String get yourShop => 'متجرك';

  @override
  String get uploadingLogo => 'جارٍ رفع شعار المتجر';

  @override
  String get logoTapToChange => 'شعار المتجر، اضغط للتغيير';

  @override
  String get brandTagline => 'متجر مزدحم، ودفاتر هادئة.';

  @override
  String serverError(int code) {
    return 'خطأ في الخادم: $code';
  }

  @override
  String get deleteCustomer => 'حذف العميل';

  @override
  String deleteCustomerMessage(String name) {
    return 'حذف $name وجميع فواتيره؟ لا يمكن التراجع عن ذلك.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'تعذر الحذف: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'تعذر الحذف — تحقق من الاتصال وحاول مرة أخرى.';

  @override
  String get actions => 'إجراءات';

  @override
  String get edit => 'تعديل';

  @override
  String get delete => 'حذف';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count عملاء',
      one: 'حذف عميل واحد',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count عملاء وجميع فواتيرهم؟ لا يمكن التراجع عن ذلك.',
      one: 'حذف عميل واحد وجميع فواتيره؟ لا يمكن التراجع عن ذلك.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'إلغاء تحديد الكل';

  @override
  String get selectAll => 'تحديد الكل';

  @override
  String selectedCount(int count) {
    return 'تم تحديد $count';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get newTag => 'جديد';

  @override
  String get csvNeedsRows => 'يحتاج ملف CSV إلى صف عناوين وعميل واحد على الأقل.';

  @override
  String get csvNeedsName => 'يجب أن يتضمن صف عناوين CSV عمود \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'السطر $line: الاسم مفقود — أصلح الملف وحاول مرة أخرى.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'السطر $line: قيمة credit_limit غير صالحة \"$value\" — أصلح الملف وحاول مرة أخرى.';
  }

  @override
  String get importCustomers => 'استيراد العملاء';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم العثور على $count عملاء في \"$file\". استيرادهم جميعاً؟',
      one: 'تم العثور على عميل واحد في \"$file\". استيراده؟',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'استيراد';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم استيراد $count عملاء.',
      one: 'تم استيراد عميل واحد.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'فشل الاستيراد: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'فشل الاستيراد — تعذر الاتصال: $error';
  }

  @override
  String get noPhone => 'لا يوجد هاتف';

  @override
  String get offlineShowingSaved => 'غير متصل — يتم عرض النسخة المحفوظة';

  @override
  String get searchCustomersHint => 'ابحث عن العملاء أو الهاتف...';

  @override
  String get noCustomersYet => 'لا يوجد عملاء بعد. اضغط + للإضافة.';

  @override
  String get noCustomersMatch => 'لا يوجد عملاء يطابقون بحثك.';

  @override
  String get owesMoney => 'عليه مستحقات';

  @override
  String get settledUp => 'تمت التسوية';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'تعذر تحميل $what: $error';
  }

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get chooseFromGallery => 'اختيار من المعرض';

  @override
  String get back => 'رجوع';

  @override
  String callPhone(String phone) {
    return 'اتصال بـ $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'واتساب $phone';
  }

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get askHint => 'مثل: كم ربحت هذا الشهر؟';

  @override
  String get acctTurnOffLockTitle => 'إيقاف قفل التطبيق؟';

  @override
  String get acctTurnOffLockBody => 'سيتمكن أي شخص يحمل هذا الهاتف من فتح التطبيق دون رمز PIN.';

  @override
  String get acctTurnOff => 'إيقاف';

  @override
  String get acctSetPinTitle => 'تعيين رمز PIN';

  @override
  String get acctPinLabel => 'رمز PIN من 4 إلى 6 أرقام';

  @override
  String get acctPinMin => '4 أرقام على الأقل';

  @override
  String get acctConfirmPin => 'تأكيد رمز PIN';

  @override
  String get acctPinMismatch => 'رمزا PIN غير متطابقين';

  @override
  String get acctSetPin => 'تعيين PIN';

  @override
  String get acctBiometricTitle => 'استخدام بصمة الإصبع/الوجه أيضًا؟';

  @override
  String get acctBiometricBody => 'يمكنك دائمًا استخدام رمز PIN إذا تعذّر التحقق البيومتري.';

  @override
  String get acctNoThanks => 'لا، شكرًا';

  @override
  String get acctEnable => 'تفعيل';

  @override
  String get acctSetPasswordTitle => 'تعيين كلمة مرور';

  @override
  String get acctSetPasswordIntro => 'اختر كلمة مرور لتتمكن من تسجيل الدخول لاحقًا بالبريد الإلكتروني + كلمة المرور بدلًا من Google فقط.';

  @override
  String get acctPassword => 'كلمة المرور';

  @override
  String get acctPasswordMin => 'يجب ألا تقل عن 6 أحرف';

  @override
  String get acctConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get acctPasswordsMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get acctSetPasswordButton => 'تعيين كلمة المرور';

  @override
  String get acctPasswordSet => 'تم تعيين كلمة المرور — يمكنك الآن تسجيل الدخول بها أيضًا.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'تعذّر تعيين كلمة المرور: $error';
  }

  @override
  String get acctChangePasswordTitle => 'تغيير كلمة المرور';

  @override
  String get acctCurrentPassword => 'كلمة المرور الحالية';

  @override
  String get acctRequired => 'مطلوب';

  @override
  String get acctNewPassword => 'كلمة المرور الجديدة';

  @override
  String get acctConfirmNewPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get acctChange => 'تغيير';

  @override
  String get acctPasswordChanged => 'تم تغيير كلمة المرور.';

  @override
  String get acctWrongPassword => 'كلمة المرور الحالية غير صحيحة.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'تعذّر تغيير كلمة المرور: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'تغيير اسم المستخدم';

  @override
  String get acctUsername => 'اسم المستخدم';

  @override
  String get acctUsernameEmpty => 'لا يمكن أن يكون اسم المستخدم فارغًا';

  @override
  String get acctUsernameChanged => 'تم تغيير اسم المستخدم.';

  @override
  String get acctChangeEmailTitle => 'تغيير البريد الإلكتروني';

  @override
  String get acctNewEmail => 'البريد الإلكتروني الجديد';

  @override
  String get acctValidEmail => 'أدخل بريدًا إلكترونيًا صالحًا';

  @override
  String get acctRequiredConfirm => 'مطلوب للتأكد من هويتك';

  @override
  String get acctGoogleConfirmFirst => 'سيُطلب منك التأكيد عبر Google أولًا.';

  @override
  String acctCheckEmail(String email) {
    return 'تحقق من $email للعثور على رابط تأكيد التغيير.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'تسجيل الدخول بكلمة المرور';

  @override
  String acctRemoveTitle(String provider) {
    return 'إزالة $provider؟';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'لن تتمكن من تسجيل الدخول إلى هذا الحساب باستخدام $provider.';
  }

  @override
  String get acctRemove => 'إزالة';

  @override
  String acctRemoved(String provider) {
    return 'تمت إزالة $provider.';
  }

  @override
  String get acctSignedIn => 'تم تسجيل الدخول';

  @override
  String get acctEmailNotVerified => 'لم يتم التحقق من البريد الإلكتروني بعد.';

  @override
  String get acctVerificationSent => 'تم إرسال رسالة التحقق.';

  @override
  String get acctResend => 'إعادة الإرسال';

  @override
  String get acctSectionSignIn => 'تسجيل الدخول والأمان';

  @override
  String get acctRowChangeUsername => 'تغيير اسم المستخدم';

  @override
  String get acctRowChangeEmail => 'تغيير البريد الإلكتروني';

  @override
  String get acctRowSetPassword => 'تعيين كلمة مرور';

  @override
  String get acctRowChangePassword => 'تغيير كلمة المرور';

  @override
  String get acctRowUnlinkGoogle => 'فصل Google';

  @override
  String get acctRowRemovePassword => 'إزالة كلمة المرور';

  @override
  String get acctRowAppLock => 'قفل التطبيق (PIN)';

  @override
  String get acctRowBiometric => 'استخدام بصمة الإصبع/الوجه';

  @override
  String get acctSignOutTitle => 'تسجيل الخروج؟';

  @override
  String get acctSignOutBody => 'ستحتاج إلى تسجيل الدخول مجددًا لاستخدام التطبيق.';

  @override
  String get acctSignOut => 'تسجيل الخروج';

  @override
  String get acctDeleteAccount => 'حذف الحساب';

  @override
  String get acctDeleting => 'جارٍ الحذف...';

  @override
  String get acctDeleteTitle => 'حذف الحساب؟';

  @override
  String get acctDeleteBody => 'سيؤدي هذا إلى حذف بيانات تسجيل الدخول نهائيًا. ستحتاج إلى إنشاء حساب جديد لاستخدام التطبيق. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String acctCouldNotDelete(String error) {
    return 'تعذّر حذف الحساب: $error';
  }

  @override
  String get itmNotFoundTitle => 'لم يتم العثور على الصنف';

  @override
  String itmNotFoundBody(String barcode) {
    return 'لا يوجد صنف بالباركود $barcode. هل تريد إضافته كصنف جديد الآن؟';
  }

  @override
  String get itmAddItem => 'إضافة صنف';

  @override
  String get itmEditItem => 'تعديل الصنف';

  @override
  String get itmMergeTitle => 'دمج الأصناف المكررة';

  @override
  String get itmMergeBody => 'سيتم دمج الأصناف التي لها الاسم نفسه في أقدم إدخال مع جمع كميات مخزونها. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get itmMerge => 'دمج';

  @override
  String get itmNoDuplicates => 'لم يتم العثور على أصناف مكررة.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم دمج $count صنف مكرر.',
      many: 'تم دمج $count صنفًا مكررًا.',
      few: 'تم دمج $count أصناف مكررة.',
      two: 'تم دمج صنفين مكررين.',
      one: 'تم دمج صنف مكرر واحد.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'حذف الصنف';

  @override
  String get itmCannotUndo => 'لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get itmDeleteOffline => 'تعذّر الحذف — تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count صنف',
      many: 'حذف $count صنفًا',
      few: 'حذف $count أصناف',
      two: 'حذف صنفين',
      one: 'حذف صنف واحد',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count صنف؟ لا يمكن التراجع عن هذا الإجراء.',
      many: 'حذف $count صنفًا؟ لا يمكن التراجع عن هذا الإجراء.',
      few: 'حذف $count أصناف؟ لا يمكن التراجع عن هذا الإجراء.',
      two: 'حذف صنفين؟ لا يمكن التراجع عن هذا الإجراء.',
      one: 'حذف صنف واحد؟ لا يمكن التراجع عن هذا الإجراء.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'تعذّر رفع الصورة ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'تعذّر رفع الصورة: $error';
  }

  @override
  String get itmNoBarcodes => 'لا يوجد باركود لأي صنف بعد.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'طباعة $count ملصق',
      many: 'طباعة $count ملصقًا',
      few: 'طباعة $count ملصقات',
      two: 'طباعة ملصقين',
      one: 'طباعة ملصق واحد',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'ابحث عن صنف أو فئة...';

  @override
  String get itmStopListening => 'إيقاف الاستماع';

  @override
  String get itmVoiceSearch => 'البحث الصوتي';

  @override
  String get itmSort => 'ترتيب';

  @override
  String get itmSortName => 'الاسم (أ-ي)';

  @override
  String get itmSortStockLow => 'المخزون: من الأقل إلى الأكثر';

  @override
  String get itmSortRecent => 'أضيفت مؤخرًا';

  @override
  String get itmFilterAll => 'الكل';

  @override
  String get itmFilterLowStock => 'مخزون منخفض';

  @override
  String get itmNoItemsYet => 'لا توجد أصناف بعد. اضغط + للإضافة.';

  @override
  String get itmNoItemsMatch => 'لا توجد أصناف مطابقة لبحثك.';

  @override
  String get itmNoPriceChanges => 'لم تُسجَّل أي تغييرات في السعر بعد.';

  @override
  String get itmNoStockCorrections => 'لم تُسجَّل أي تصحيحات للمخزون بعد.';

  @override
  String get itmResetHistory => 'إعادة تعيين السجل';

  @override
  String get itmResetHistoryMsg => 'هل تريد إعادة تعيين سجل هذا الصنف؟ لا يمكن التراجع عن ذلك.';

  @override
  String get itmSendPdf => 'إرسال كملف PDF';

  @override
  String get itmNoteOptional => 'ملاحظة (اختياري)';

  @override
  String get itmNoteHint => 'أضف ملاحظة لهذا التغيير';

  @override
  String get itmRemoveEntry => 'إزالة السجل';

  @override
  String get itmRemoveEntryMsg => 'هل تريد إزالة هذا السجل من التاريخ؟ لا يمكن التراجع عن ذلك.';

  @override
  String get itmEditEntry => 'تعديل السجل';

  @override
  String get itmPrevQty => 'السابق';

  @override
  String get itmNewQty => 'الجديد';

  @override
  String itmCost(String amount) {
    return 'التكلفة: $amount';
  }

  @override
  String get itmMore => 'المزيد';

  @override
  String get itmMenuPrintLabel => 'طباعة ملصق';

  @override
  String get itmMenuDuplicate => 'تكرار';

  @override
  String get itmMenuPriceHistory => 'سجل الأسعار';

  @override
  String get itmMenuStockHistory => 'سجل تعديلات المخزون';

  @override
  String itmLowStockBadge(int count) {
    return '$count مخزون منخفض';
  }

  @override
  String itmStockLine(String qty) {
    return 'المخزون: $qty';
  }

  @override
  String get itmOfflineSaved => 'غير متصل — تم حفظ الصنف على هذا الجهاز وسيُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get itmItemName => 'اسم الصنف';

  @override
  String get itmNameRequired => 'الاسم مطلوب';

  @override
  String get itmPricePkr => 'السعر (PKR)';

  @override
  String get itmPriceRequired => 'السعر مطلوب';

  @override
  String get itmValidNumber => 'أدخل رقمًا صالحًا';

  @override
  String get itmUnit => 'الوحدة';

  @override
  String get itmCategoryHint => 'الفئة (اختياري، مثل السباكة)';

  @override
  String get itmPreferredSupplier => 'المورّد المفضل (اختياري)';

  @override
  String get itmPreferredSupplierHelper => 'يُستخدم في إعادة الطلب بنقرة واحدة';

  @override
  String get itmClear => 'مسح';

  @override
  String get itmHsn => 'رمز HSN (اختياري)';

  @override
  String get itmGstRate => 'نسبة GST % (اختياري)';

  @override
  String get itmBarcodeOptional => 'الباركود (اختياري)';

  @override
  String get itmScanOrType => 'امسح أو اكتب';

  @override
  String get itmScanBarcode => 'مسح الباركود';

  @override
  String get itmPurchaseCost => 'تكلفة الشراء (للوحدة)';

  @override
  String get itmPurchaseCostHint => 'ما تدفعه عند شراء المخزون';

  @override
  String get itmWholesale => 'سعر الجملة (اختياري)';

  @override
  String get itmContractor => 'سعر المقاول (اختياري)';

  @override
  String get itmFallsBack => 'يُستخدم السعر العادي إن لم يُحدد';

  @override
  String get itmStockQty => 'كمية المخزون';

  @override
  String get itmLowStockAlert => 'تنبيه المخزون المنخفض عند أقل من';

  @override
  String get itmFrequently => 'يُشترى غالبًا مع';

  @override
  String get itmSaveChanges => 'حفظ التغييرات';

  @override
  String get itmSaveItem => 'حفظ الصنف';

  @override
  String get itmPhotoSemantics => 'صورة الصنف، انقر للتغيير';

  @override
  String get cdUpdateStatusTitle => 'تحديث حالة الدفع';

  @override
  String get cdMarkPaidQ => 'تعليم هذه الفاتورة كمدفوعة؟';

  @override
  String get cdMarkUnpaidQ => 'تعليم هذه الفاتورة كغير مدفوعة؟';

  @override
  String get cdConfirm => 'تأكيد';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'تعذّر التحديث: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'غير متصل — تم حفظ التغيير على هذا الجهاز وسيُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get cdConvertTitle => 'تحويل إلى فاتورة';

  @override
  String get cdConvertBody => 'سيؤدي هذا إلى خصم مخزون هذه الأصناف وتحويل عرض السعر إلى فاتورة فعلية. هل تريد المتابعة؟';

  @override
  String get cdConvert => 'تحويل';

  @override
  String cdCouldNotConvert(String detail) {
    return 'تعذّر التحويل: $detail';
  }

  @override
  String get cdReturnItems => 'إرجاع الأصناف';

  @override
  String get cdReturnHint => 'حدد كمية إرجاع كل صنف. اترك 0 للإبقاء عليه مباعًا.';

  @override
  String get cdDecreaseQty => 'تقليل الكمية';

  @override
  String get cdIncreaseQty => 'زيادة الكمية';

  @override
  String get cdCreditTotal => 'إجمالي الرصيد الدائن';

  @override
  String get cdReturnSelected => 'إرجاع المحدد';

  @override
  String cdCouldNotReturn(String detail) {
    return 'تعذّر الإرجاع: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'تعذّر الإلغاء: $detail';
  }

  @override
  String get cdNoPreviousBill => 'لا توجد فاتورة سابقة لتكرارها';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'تعذّر تحميل آخر فاتورة: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'تم إرسال الفاتورة بالبريد الإلكتروني إلى العميل.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'تعذّر إرسال الفاتورة بالبريد: $detail';
  }

  @override
  String get cdStatementEmailed => 'تم إرسال كشف الحساب بالبريد الإلكتروني إلى العميل.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'تعذّر إرسال كشف الحساب بالبريد: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'حذف الفاتورة';

  @override
  String get cdBillVoided => 'ملغاة';

  @override
  String get cdBillReturn => 'مرتجع';

  @override
  String get cdBillQuote => 'عرض سعر';

  @override
  String get cdBillPaid => 'مدفوعة';

  @override
  String get cdBillPartial => 'جزئي';

  @override
  String get cdBillUnpaid => 'غير مدفوعة';

  @override
  String get cdBill => 'فاتورة';

  @override
  String cdVoidedReason(String reason) {
    return 'ملغاة: $reason';
  }

  @override
  String get cdViewInvoice => 'عرض الفاتورة';

  @override
  String get cdEmailInvoice => 'إرسال الفاتورة بالبريد';

  @override
  String get cdEditBill => 'تعديل الفاتورة';

  @override
  String get cdReturnBill => 'إرجاع الفاتورة';

  @override
  String get cdVoidBill => 'إلغاء الفاتورة';

  @override
  String get cdNoItems => 'لا توجد أصناف';

  @override
  String get cdRepeatLast => 'تكرار آخر فاتورة';

  @override
  String get cdLedgerPdf => 'كشف الحساب PDF';

  @override
  String get cdEmailStatement => 'إرسال كشف الحساب بالبريد';

  @override
  String get cdCollectPayment => 'تحصيل دفعة';

  @override
  String get cdSendReminder => 'إرسال تذكير عبر واتساب';

  @override
  String get cdTotalBilled => 'إجمالي الفواتير';

  @override
  String get cdPaid => 'المدفوع';

  @override
  String get cdNoBills => 'لا توجد فواتير بعد';

  @override
  String get cdBillActions => 'إجراءات الفاتورة';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'تم استخدام $outstanding من حد ائتمان $limit';
  }

  @override
  String get cdVoidBody => 'سيُزال من الأرصدة والتقارير مع الإبقاء عليه في السجل. ستُستعاد كميات المخزون. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get cdReason => 'السبب (اختياري)';

  @override
  String get frmOfflineCustomer => 'غير متصل — تم حفظ العميل على هذا الجهاز وسيُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get frmOfflineSupplier => 'غير متصل — تم حفظ المورّد على هذا الجهاز وسيُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get frmEditCustomer => 'تعديل العميل';

  @override
  String get frmCustomerName => 'اسم العميل';

  @override
  String get frmPhoneOptional => 'الهاتف (اختياري)';

  @override
  String get frmCreditLimit => 'حد الائتمان (PKR، اختياري)';

  @override
  String get frmCreditHelper => 'تنبيه عندما يتجاوز رصيد هذا العميل هذا الحد';

  @override
  String get frmPriceTier => 'فئة السعر';

  @override
  String get frmRetail => 'تجزئة';

  @override
  String get frmWholesale => 'جملة';

  @override
  String get frmContractor => 'مقاول';

  @override
  String get frmPriceTierHelper => 'أي سعر صنف يُعبَّأ تلقائيًا في الفاتورة لهذا العميل';

  @override
  String get frmStrn => 'STRN (اختياري)';

  @override
  String get frmStrnCustomer => 'رقم تسجيل ضريبة المبيعات المكوّن من 13 رقمًا للفواتير';

  @override
  String get frmStrnSupplier => 'رقم تسجيل ضريبة المبيعات المكوّن من 13 رقمًا لفواتير الشراء';

  @override
  String get frmAddress => 'العنوان (اختياري)';

  @override
  String get frmEmail => 'البريد الإلكتروني (اختياري)';

  @override
  String get frmEmailHelper => 'يتيح لك إرسال فاتورة أو كشف حساب بالبريد إلى هذا العميل';

  @override
  String get frmSaveCustomer => 'حفظ العميل';

  @override
  String get frmEditSupplier => 'تعديل المورّد';

  @override
  String get frmSupplierName => 'اسم المورّد';

  @override
  String get frmSaveSupplier => 'حفظ المورّد';

  @override
  String get sdDeletePurchaseTitle => 'حذف المشتريات';

  @override
  String get sdDeletePurchaseBody => 'سيُستعاد مخزون هذه المشتريات. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get sdReturnToSupplier => 'إرجاع إلى المورّد';

  @override
  String get sdReturnHint => 'حدد كمية إرجاع كل صنف. اترك 0 للاحتفاظ به.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'تعذّر وضع علامة الاستلام: $detail';
  }

  @override
  String get sdMarkPaidQ => 'تعليم هذه المشتريات كمدفوعة؟';

  @override
  String get sdMarkUnpaidQ => 'تعليم هذه المشتريات كغير مدفوعة؟';

  @override
  String get sdTotalPurchased => 'إجمالي المشتريات';

  @override
  String get sdPayable => 'المستحق';

  @override
  String sdPayableAmount(String amount) {
    return '$amount مستحق';
  }

  @override
  String get sdNoPurchases => 'لا توجد مشتريات بعد';

  @override
  String get sdPo => 'أمر شراء';

  @override
  String get sdDraftPo => 'أمر شراء مسودة';

  @override
  String get sdPurchase => 'مشتريات';

  @override
  String get sdDraftNote => 'أمر شراء مسودة — لم يُستلم بعد، ولا تحديث للمخزون أو التكلفة حتى الآن.';

  @override
  String get sdReturnNote => 'إرجاع / إشعار دائن إلى المورّد.';

  @override
  String get sdMarkReceived => 'تعليم كمستلم';

  @override
  String get sdEditPurchase => 'تعديل المشتريات';

  @override
  String get sdPurchaseActions => 'إجراءات المشتريات';

  @override
  String get slDeleteSupplier => 'حذف المورّد';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count مورّد',
      many: 'حذف $count مورّدًا',
      few: 'حذف $count موردين',
      two: 'حذف مورّدين',
      one: 'حذف مورّد واحد',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count مورّد وكل مشترياتهم؟ لا يمكن التراجع عن هذا الإجراء.',
      many: 'حذف $count مورّدًا وكل مشترياتهم؟ لا يمكن التراجع عن هذا الإجراء.',
      few: 'حذف $count موردين وكل مشترياتهم؟ لا يمكن التراجع عن هذا الإجراء.',
      two: 'حذف مورّدين وكل مشترياتهما؟ لا يمكن التراجع عن هذا الإجراء.',
      one: 'حذف مورّد واحد وكل مشترياته؟ لا يمكن التراجع عن هذا الإجراء.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'يحتاج ملف CSV إلى صف عناوين وإلى مورّد واحد على الأقل.';

  @override
  String get slImportTitle => 'استيراد الموردين';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم العثور على $count مورّد في \"$file\". استيرادهم جميعًا؟',
      many: 'تم العثور على $count مورّدًا في \"$file\". استيرادهم جميعًا؟',
      few: 'تم العثور على $count موردين في \"$file\". استيرادهم جميعًا؟',
      two: 'تم العثور على مورّدين في \"$file\". استيرادهم جميعًا؟',
      one: 'تم العثور على مورّد واحد في \"$file\". استيرادهم جميعًا؟',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم استيراد $count مورّد.',
      many: 'تم استيراد $count مورّدًا.',
      few: 'تم استيراد $count موردين.',
      two: 'تم استيراد مورّدين.',
      one: 'تم استيراد مورّد واحد.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'لا يوجد موردون بعد. اضغط + للإضافة.';

  @override
  String get slSearchHint => 'ابحث عن مورّد أو هاتف...';

  @override
  String get slNoMatch => 'لا يوجد موردون مطابقون لبحثك.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مورّد',
      many: '$count مورّدًا',
      few: '$count موردين',
      two: 'مورّدان',
      one: 'مورّد واحد',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'مستحقات الموردين';

  @override
  String get sduNothingOwed => 'لا مستحقات للموردين 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مورّد مستحق لهم',
      many: '$count مورّدًا مستحق لهم',
      few: '$count موردين مستحق لهم',
      two: 'مورّدان مستحق لهما',
      one: 'مورّد واحد مستحق له',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'مضى $days يوم على أقدم مشتريات غير مدفوعة',
      many: 'مضى $days يومًا على أقدم مشتريات غير مدفوعة',
      few: 'مضت $days أيام على أقدم مشتريات غير مدفوعة',
      two: 'مضى يومان على أقدم مشتريات غير مدفوعة',
      one: 'مضى يوم واحد على أقدم مشتريات غير مدفوعة',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 يومًا';

  @override
  String get duBucket1 => '30–60 يومًا';

  @override
  String get duBucket2 => '60+ يومًا';

  @override
  String get duTitle => 'مركز المستحقات';

  @override
  String get duNoDues => 'لا مستحقات غير مسددة 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عميل عليهم مستحقات',
      many: '$count عميلًا عليهم مستحقات',
      few: '$count عملاء عليهم مستحقات',
      two: 'عميلان عليهما مستحقات',
      one: 'عميل واحد عليه مستحقات',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'مضى $days يوم على أقدم فاتورة غير مدفوعة',
      many: 'مضى $days يومًا على أقدم فاتورة غير مدفوعة',
      few: 'مضت $days أيام على أقدم فاتورة غير مدفوعة',
      two: 'مضى يومان على أقدم فاتورة غير مدفوعة',
      one: 'مضى يوم واحد على أقدم فاتورة غير مدفوعة',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount مستحق';
  }

  @override
  String get cpNoOutstanding => 'لا يوجد رصيد مستحق لهذا العميل';

  @override
  String get cpValidAmount => 'أدخل مبلغًا صالحًا';

  @override
  String cpExceeds(String amount) {
    return 'المبلغ يتجاوز الرصيد المستحق $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'تم تحصيل $amount من $name';
  }

  @override
  String get cpOfflineSaved => 'غير متصل — تم حفظ الدفعة على هذا الجهاز وستُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String cpOwes(String amount, String name) {
    return 'على $name مبلغ $amount. يُطبَّق أولًا على أقدم فاتورة غير مدفوعة.';
  }

  @override
  String get cpAmountLabel => 'المبلغ المحصَّل (PKR)';

  @override
  String get cpCollect => 'تحصيل';

  @override
  String get usNoItems => 'لا توجد أصناف لتحديثها.';

  @override
  String get usHelp => 'حدّد المخزون الجديد لكل صنف، ثم اضغط حفظ الكل.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  الحالي: $qty';
  }

  @override
  String usNew(String qty) {
    return 'الجديد: $qty';
  }

  @override
  String get usSubtract => 'طرح 1';

  @override
  String get usAdd => 'إضافة 1';

  @override
  String get usNoChanges => 'لا تغييرات';

  @override
  String usSaveAll(int count) {
    return 'حفظ الكل (تغيّر $count)';
  }

  @override
  String get srHint => 'ابحث عن عملاء وأصناف ومبالغ...';

  @override
  String get srFailed => 'فشل البحث — تحقق من اتصالك.';

  @override
  String get srTitle => 'ابحث في متجرك';

  @override
  String get srSubtitle => 'ابحث عن العملاء بالاسم أو الهاتف، وعن الفواتير بالمبلغ.';

  @override
  String srNoMatches(String query) {
    return 'لا نتائج لـ \"$query\"';
  }

  @override
  String get srTryDifferent => 'جرّب اسمًا أو رقم هاتف أو مبلغًا مختلفًا.';

  @override
  String get srBills => 'الفواتير';

  @override
  String get srNoItemList => 'لا توجد قائمة أصناف';

  @override
  String get abAddAtLeastOne => 'أضف صنفًا واحدًا على الأقل';

  @override
  String get abQuotationUpdated => 'تم تحديث عرض السعر!';

  @override
  String get abBillUpdated => 'تم تحديث الفاتورة!';

  @override
  String get abQuotationSaved => 'تم حفظ عرض السعر!';

  @override
  String get abBillCreated => 'تم إنشاء الفاتورة بنجاح!';

  @override
  String abTotalAmount(String amount) {
    return 'الإجمالي: $amount';
  }

  @override
  String get abShare => 'مشاركة';

  @override
  String get abDoneReturn => 'تم والرجوع';

  @override
  String get abOverLimitBody => 'سيؤدي هذا إلى تجاوز العميل حد ائتمانه.';

  @override
  String get abOverLimitTitle => 'تجاوز حد الائتمان';

  @override
  String get abBillAnyway => 'إصدار الفاتورة رغم ذلك';

  @override
  String get abOfflineBill => 'غير متصل — تم حفظ الفاتورة على هذا الجهاز وستُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get abEditQuotation => 'تعديل عرض السعر';

  @override
  String get abEditBill => 'تعديل الفاتورة';

  @override
  String get abNewQuotation => 'عرض سعر جديد';

  @override
  String get abAddBill => 'إضافة فاتورة';

  @override
  String get abCouldNotLoadItems => 'تعذّر تحميل الأصناف.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'ستجعل هذه الفاتورة رصيد العميل $total، متجاوزًا حد ائتمانه $limit.';
  }

  @override
  String get abTapAddItemBill => 'اضغط \"إضافة صنف\" أدناه لبدء فاتورة';

  @override
  String get abNoCatalog => 'لا توجد أصناف في الكتالوج بعد';

  @override
  String get abScan => 'مسح';

  @override
  String get abDiscountRs => 'الخصم (روبية)';

  @override
  String get abSubtotal => 'المجموع الفرعي';

  @override
  String get abTotal => 'الإجمالي';

  @override
  String get abSaveAsQuotation => 'حفظ كعرض سعر';

  @override
  String get abQuotationLocked => 'لا يمكن تحويل فاتورة موجودة إلى عرض سعر';

  @override
  String get abQuotationNote => 'لا يُخصم المخزون حتى التحويل إلى فاتورة';

  @override
  String get abPaymentStatus => 'حالة الدفع';

  @override
  String get abUnpaid => 'غير مدفوعة';

  @override
  String get abPaymentMethod => 'طريقة الدفع';

  @override
  String get abCash => 'نقدًا';

  @override
  String get abBankTransfer => 'تحويل بنكي';

  @override
  String get abCheque => 'شيك';

  @override
  String get abSaveQuotation => 'حفظ عرض السعر';

  @override
  String get abSaveBill => 'حفظ الفاتورة';

  @override
  String abAdded(String name) {
    return 'تمت إضافة $name';
  }

  @override
  String get apNewItem => 'صنف جديد…';

  @override
  String get apNewItemHint => 'أضف صنفًا جديدًا إلى الكتالوج أولًا';

  @override
  String get apOfflinePurchase => 'غير متصل — تم حفظ المشتريات على هذا الجهاز وستُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get apEditPo => 'تعديل أمر الشراء';

  @override
  String get apNewPo => 'أمر شراء جديد';

  @override
  String get apAddPurchase => 'إضافة مشتريات';

  @override
  String get apTapAddItem => 'اضغط \"إضافة صنف\" أدناه لبدء عملية شراء';

  @override
  String get apSaveAsPo => 'حفظ كأمر شراء';

  @override
  String get apPoLocked => 'لا يمكن تحويل مشتريات تم استلامها إلى أمر مسودة';

  @override
  String get apPoNote => 'لا تحديث للمخزون أو التكلفة حتى تُعلَّم البضاعة كمستلمة';

  @override
  String get apUnpaidCredit => 'غير مدفوعة (آجل)';

  @override
  String get apSavePo => 'حفظ أمر الشراء';

  @override
  String get apSavePurchase => 'حفظ المشتريات';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'التكلفة الحالية: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'لا توجد تكلفة محددة  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'فشل المسح: خطأ في الخادم $code';
  }

  @override
  String get scOfflineSaved => 'غير متصل — تم حفظ الصورة وستُقرأ تلقائيًا عند عودة الاتصال';

  @override
  String get scStillOffline => 'ما زلت غير متصل';

  @override
  String get scCouldNotCreateCustomer => 'تعذّر إنشاء العميل — حاول مرة أخرى.';

  @override
  String get scCouldNotCreateSupplier => 'تعذّر إنشاء المورّد — حاول مرة أخرى.';

  @override
  String scBillSavedFor(String name) {
    return 'تم حفظ الفاتورة لـ $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'تم حفظ المشتريات من $name';
  }

  @override
  String get scWhichCustomer => 'أي عميل هذا؟';

  @override
  String get scWhichSupplier => 'أي مورّد هذا؟';

  @override
  String scClosestMatch(String name, int score) {
    return 'أقرب تطابق في السجل: $name (تشابه $score%)';
  }

  @override
  String scYesThisIs(String name) {
    return 'نعم، هذا هو $name';
  }

  @override
  String get scOtherwiseCustomer => 'وإلا فأنشئ عميلًا جديدًا:';

  @override
  String get scOtherwiseSupplier => 'وإلا فأنشئ مورّدًا جديدًا:';

  @override
  String get scNoMatchCustomer => 'لم يُعثر على عميل مطابق. أنشئ عميلًا جديدًا:';

  @override
  String get scNoMatchSupplier => 'لم يُعثر على مورّد مطابق. أنشئ مورّدًا جديدًا:';

  @override
  String get scCustomerName => 'اسم العميل';

  @override
  String get scSupplierName => 'اسم المورّد';

  @override
  String get scCreateNew => 'إنشاء جديد';

  @override
  String get scTitleBill => 'مسح فاتورة';

  @override
  String get scIntroBill => 'صوّر الفاتورة. لا بأس إن كانت مكتوبة بخط اليد، والسندية أو الأردية أو الإنجليزية كلها مقبولة. ستراجعها قبل الحفظ.';

  @override
  String get scIntroPurchase => 'صوّر فاتورة المورّد. السندية أو الأردية أو الإنجليزية كلها مقبولة. ستراجعها قبل الحفظ.';

  @override
  String get scReadingBill => 'جارٍ قراءة الفاتورة…';

  @override
  String get scScanBill => 'مسح فاتورة';

  @override
  String get scReadingInvoice => 'جارٍ قراءة الفاتورة…';

  @override
  String get scScanInvoice => 'مسح فاتورة';

  @override
  String get scQueued => 'عمليات المسح في الانتظار';

  @override
  String get scReady => 'جاهز للمراجعة';

  @override
  String get scFailed => 'فشل';

  @override
  String get scWaiting => 'في انتظار الاتصال';

  @override
  String get scRetry => 'إعادة المحاولة';

  @override
  String rpCouldNotLoad(String error) {
    return 'تعذّر تحميل التقارير: $error';
  }

  @override
  String get rpHeadline => 'أبرز أرقام هذا الشهر';

  @override
  String get rpProfitThisMonth => 'ربح هذا الشهر';

  @override
  String get rpNoData => 'لا توجد بيانات بعد';

  @override
  String get rpSalesTax => 'ضريبة المبيعات';

  @override
  String rpSalesTaxFor(String month) {
    return 'تقرير ضريبة المبيعات لشهر $month';
  }

  @override
  String get rpViewSalesTax => 'عرض تقرير ضريبة المبيعات';

  @override
  String get rpQuickReports => 'تقارير سريعة';

  @override
  String get rpQuickSub => 'انتقل مباشرة إلى تقرير محدد';

  @override
  String get expensesTitle => 'المصروفات';

  @override
  String get rpRateCard => 'قائمة الأسعار';

  @override
  String get rpDetails => 'التفاصيل';

  @override
  String get rpDetailsSub => 'تفصيلات كاملة وترتيبات';

  @override
  String get rpOutstandingByCustomer => 'المستحقات حسب العميل';

  @override
  String get rpNoOutstanding => 'لا توجد أرصدة مستحقة';

  @override
  String get rpMonthlyTotals => 'الإجماليات الشهرية';

  @override
  String get rpMostSold => 'الأصناف الأكثر مبيعًا';

  @override
  String get rpNoItemsRecorded => 'لا توجد أصناف مسجلة بعد';

  @override
  String get rpTopCustomers => 'أفضل العملاء حسب الإيرادات';

  @override
  String get rpNoSalesRecorded => 'لا توجد مبيعات مسجلة بعد';

  @override
  String get rpTotalOutstanding => 'إجمالي المستحق';

  @override
  String get rpViewCustomers => 'عرض العملاء';

  @override
  String get lblInvoice => 'الفاتورة';

  @override
  String get lblLedger => 'كشف الحساب';

  @override
  String get lblRateCard => 'قائمة الأسعار';

  @override
  String get exCsvNeedsRows => 'يحتاج ملف CSV إلى صف عناوين ومصروف واحد على الأقل.';

  @override
  String get exCsvHeader => 'يجب أن يتضمن رأس CSV العمودين \"description\" و\"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'السطر $line: الوصف مفقود أو المبلغ غير صالح — صحّح الملف وأعد المحاولة.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'السطر $line: تاريخ غير صالح \"$date\" — استخدم YYYY-MM-DD.';
  }

  @override
  String get exImportTitle => 'استيراد المصروفات';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم العثور على $count مصروف في \"$file\". استيرادها جميعًا؟',
      many: 'تم العثور على $count مصروفًا في \"$file\". استيرادها جميعًا؟',
      few: 'تم العثور على $count مصروفات في \"$file\". استيرادها جميعًا؟',
      two: 'تم العثور على مصروفين في \"$file\". استيرادها جميعًا؟',
      one: 'تم العثور على مصروف واحد في \"$file\". استيرادها جميعًا؟',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم استيراد $count مصروف.',
      many: 'تم استيراد $count مصروفًا.',
      few: 'تم استيراد $count مصروفات.',
      two: 'تم استيراد مصروفين.',
      one: 'تم استيراد مصروف واحد.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'فشل الاستيراد: خطأ في الخادم $code';
  }

  @override
  String get exDeleteTitle => 'حذف المصروف';

  @override
  String get exAdd => 'إضافة مصروف';

  @override
  String get exEdit => 'تعديل المصروف';

  @override
  String get exDescription => 'الوصف';

  @override
  String get exAmountRs => 'المبلغ (روبية)';

  @override
  String get exCategory => 'الفئة';

  @override
  String exDate(String date) {
    return 'التاريخ: $date';
  }

  @override
  String get exRepeats => 'يتكرر شهريًا';

  @override
  String get exRepeatsHint => 'الإيجار، الكهرباء، الأجور، إلخ.';

  @override
  String get exReceiptTap => 'صورة الإيصال، انقر للتغيير';

  @override
  String get exReceiptOptional => 'صورة الإيصال (اختياري)';

  @override
  String get exEnterValid => 'أدخل وصفًا ومبلغًا صالحًا.';

  @override
  String get exOffline => 'غير متصل — تم حفظ المصروف على هذا الجهاز وسيُزامَن تلقائيًا عند عودة الاتصال';

  @override
  String get exSave => 'حفظ المصروف';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مصروف متكرر مستحق هذا الشهر',
      many: '$count مصروفًا متكررًا مستحقًا هذا الشهر',
      few: '$count مصروفات متكررة مستحقة هذا الشهر',
      two: 'مصروفان متكرران مستحقان هذا الشهر',
      one: 'مصروف متكرر واحد مستحق هذا الشهر',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'إضافة';

  @override
  String get exTotal => 'إجمالي المصروفات';

  @override
  String exCategoryChip(String name) {
    return 'الفئة: $name';
  }

  @override
  String get exNoneLogged => 'لا توجد مصروفات مسجلة بعد';

  @override
  String exNoneInCategory(String name) {
    return 'لا توجد مصروفات $name بعد';
  }

  @override
  String get exViewReceipt => 'عرض الإيصال';

  @override
  String get exEditRow => 'تعديل المصروف';

  @override
  String get exDeleteRow => 'حذف المصروف';

  @override
  String gstServerReturned(String first, String second) {
    return 'أعاد الخادم $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'تعذّر تحميل بيانات GST: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'فشل التنزيل ($code)';
  }

  @override
  String gstSaved(String filename) {
    return 'تم حفظ $filename';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'تم الحفظ في التنزيلات/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'تعذّر التنزيل: $error';
  }

  @override
  String get gstTitle => 'تقرير ضريبة المبيعات';

  @override
  String get gstOutwardDetail => 'المبيعات الخارجة — تفاصيل الفواتير';

  @override
  String get gstNoBills => 'لا توجد فواتير لهذا الشهر.';

  @override
  String get gstHsn => 'ملخص HSN';

  @override
  String get gstInvoiceWise => 'تفاصيل حسب الفاتورة';

  @override
  String get gstMonthly => 'الملخص الشهري';

  @override
  String get gstOutwardTaxable => 'التوريدات الخاضعة للضريبة';

  @override
  String get gstItc => 'رصيد ضريبة المدخلات (من المشتريات)';

  @override
  String get gstSave => 'حفظ';

  @override
  String get rcValidAmount => 'أدخل مبلغًا صالحًا.';

  @override
  String get rcExpected => 'النقد المتوقع (مبيعات اليوم النقدية)';

  @override
  String get rcAlsoCollected => 'حُصِّل اليوم أيضًا (غير محتسب في الدرج)';

  @override
  String get rcCounted => 'النقد المعدود في الدرج (روبية)';

  @override
  String get rcCompare => 'مقارنة';

  @override
  String get rcMatches => 'مطابق تمامًا!';

  @override
  String rcExtra(String amount) {
    return 'زيادة $amount في الدرج';
  }

  @override
  String rcMissing(String amount) {
    return 'نقص $amount في الدرج';
  }

  @override
  String get pbiTitle => 'الربح حسب الصنف';

  @override
  String get pbiNoSales => 'لا توجد مبيعات بعد';

  @override
  String get pbiByCategory => 'حسب الفئة';

  @override
  String get pbiItemsByProfit => 'الأصناف حسب الربح';

  @override
  String get svTitle => 'قيمة المخزون';

  @override
  String get svNone => 'لا يوجد مخزون متاح';

  @override
  String get svItemsByValue => 'الأصناف حسب القيمة';

  @override
  String svSummary(String items, String units) {
    return '$items صنف · $units وحدة على الرف';
  }

  @override
  String svTied(String amount) {
    return '$amount مجمَّدة في المخزون';
  }

  @override
  String get svEstimated => 'تقدير من سعر البيع';

  @override
  String get bkRestoreTitle => 'استعادة النسخة الاحتياطية؟';

  @override
  String bkRestoreBody(String filename) {
    return 'سيؤدي هذا إلى استبدال جميع البيانات الحالية بملف النسخة الاحتياطية \"$filename\". هل تريد المتابعة؟';
  }

  @override
  String get bkRestore => 'استعادة';

  @override
  String get bkRestoreDoneTitle => 'اكتملت الاستعادة';

  @override
  String get bkRestoreDoneBody => 'تمت استعادة بياناتك.';

  @override
  String get bkOk => 'حسنًا';

  @override
  String bkRestoreFailed(String detail) {
    return 'فشلت الاستعادة: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'تعذّرت الاستعادة: $error';
  }

  @override
  String get bkSaveToDownloads => 'حفظ في التنزيلات';

  @override
  String get bkIntroAdmin => 'جميع بياناتك في ملف قاعدة بيانات واحد. نزّل نسخة بانتظام، واستعدها إذا حدث أي خطأ.';

  @override
  String get bkIntroStaff => 'النسخ الاحتياطي الكامل للقاعدة واستعادته للمسؤولين فقط. اطلب من المسؤول، أو صدّر ما تحتاجه بصيغة CSV أدناه.';

  @override
  String get bkBackupDb => 'نسخ احتياطي لقاعدة البيانات';

  @override
  String get bkBackupDbSub => 'نزّل قاعدة البيانات كاملة في ملف واحد وشاركها (واتساب، درايف، بريد إلكتروني).';

  @override
  String get bkDownloadPhone => 'تنزيل النسخة الاحتياطية إلى الهاتف';

  @override
  String get bkShareBackup => 'مشاركة النسخة الاحتياطية';

  @override
  String get bkAutoTitle => 'النسخ الاحتياطي التلقائي';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نسخة احتياطية يومية مخزّنة على الخادم، أحدثها من $time. تعمل تلقائيًا — لا شيء يلزم فعله هنا.',
      many: '$count نسخة احتياطية يومية مخزّنة على الخادم، أحدثها من $time. تعمل تلقائيًا — لا شيء يلزم فعله هنا.',
      few: '$count نسخ احتياطية يومية مخزّنة على الخادم، أحدثها من $time. تعمل تلقائيًا — لا شيء يلزم فعله هنا.',
      two: 'نسختان احتياطيتان يوميتان مخزّنتان على الخادم، أحدثهما من $time. تعمل تلقائيًا — لا شيء يلزم فعله هنا.',
      one: 'نسخة احتياطية يومية واحدة مخزّنة على الخادم، أحدثها من $time. تعمل تلقائيًا — لا شيء يلزم فعله هنا.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'اختر ملف نسخة احتياطية محفوظًا لاستبدال البيانات الحالية.';

  @override
  String get bkRestoreFromFile => 'الاستعادة من ملف نسخة احتياطية';

  @override
  String get bkExportCsv => 'التصدير إلى CSV';

  @override
  String get bkExportSub => 'افتحها في إكسل أو شاركها.';

  @override
  String get bkRangeAll => 'الفواتير/المصروفات: كل الأوقات';

  @override
  String bkRangeSome(String end, String start) {
    return 'الفواتير/المصروفات: من $start إلى $end';
  }

  @override
  String get bkSetRange => 'تحديد النطاق';

  @override
  String get bkClearRange => 'مسح النطاق';

  @override
  String get ntNever => 'لم يُشغَّل أبدًا';

  @override
  String get ntJustNow => 'الآن';

  @override
  String ntMinutesAgo(int count) {
    return 'قبل $count د';
  }

  @override
  String ntHoursAgo(int count) {
    return 'قبل $count س';
  }

  @override
  String ntDaysAgo(int count) {
    return 'قبل $count ي';
  }

  @override
  String get ntTitle => 'الإشعارات الذكية';

  @override
  String get ntTapHint => 'اضغط \"تحقق الآن\" لتشغيل إشعار ومشاهدة النتائج مباشرة.';

  @override
  String get ntLowStockSub => 'إشعار عندما تنخفض الأصناف عن حد إعادة الطلب.';

  @override
  String get ntCheckNow => 'تحقق الآن';

  @override
  String get ntOverdue => 'تذكيرات الدفعات المتأخرة';

  @override
  String get ntOverdueSub => 'إشعار بالفواتير غير المدفوعة من الأيام السابقة.';

  @override
  String get ntDaily => 'ملخص العمل اليومي';

  @override
  String get ntDailySub => 'مبيعات الأمس وتحصيلاته وأرباحه في لمحة.';

  @override
  String get ntSendSummary => 'إرسال الملخص';

  @override
  String get ntRunning => 'قيد التشغيل…';

  @override
  String get ntLowStockItems => 'أصناف المخزون المنخفض';

  @override
  String get ntSales => 'المبيعات';

  @override
  String get ntCollected => 'المحصَّل';

  @override
  String get ntProfit => 'الربح';

  @override
  String get auChecking => 'جارٍ البحث عن تحديثات…';

  @override
  String get auLatest => 'لديك أحدث إصدار.';

  @override
  String get auAvailable => 'يتوفر تحديث';

  @override
  String auNewer(int code) {
    return 'إصدار أحدث من Book-Keep (الإصدار $code) جاهز.';
  }

  @override
  String get auLater => 'لاحقًا';

  @override
  String get auUpdate => 'تحديث';

  @override
  String get auDownloading => 'جارٍ تنزيل التحديث';

  @override
  String auSaved(String name) {
    return 'تم حفظ $name في مجلد التنزيلات.';
  }

  @override
  String get auAllowInstall => 'اسمح لـ Book-Keep بتثبيت التطبيقات، ثم اضغط تحديث مرة أخرى.';

  @override
  String get auFailed => 'تعذّر التحديث — تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get lgSearch => 'البحث عن لغات';

  @override
  String lgNoMatch(String query) {
    return 'لا توجد لغات مطابقة لـ \"$query\"';
  }

  @override
  String get alVoided => 'ألغى فاتورة';

  @override
  String get alDeletedBill => 'حذف فاتورة';

  @override
  String get alReturned => 'أرجع فاتورة';

  @override
  String get alDeletedCustomer => 'حذف عميلًا';

  @override
  String get alDeletedSupplier => 'حذف مورّدًا';

  @override
  String get alCreatedAccount => 'أنشأ حسابًا';

  @override
  String get alUpdatedAccount => 'حدّث حسابًا';

  @override
  String get alDeletedAccount => 'حذف حسابًا';

  @override
  String get alTitle => 'سجل النشاط';

  @override
  String get alNone => 'لا يوجد نشاط مسجل بعد';

  @override
  String get blkEnterOne => 'أدخل صنفًا واحدًا على الأقل';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت إضافة $count صنف بنجاح',
      many: 'تمت إضافة $count صنفًا بنجاح',
      few: 'تمت إضافة $count أصناف بنجاح',
      two: 'تمت إضافة صنفين بنجاح',
      one: 'تمت إضافة صنف واحد بنجاح',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'إضافة أصناف دفعة واحدة';

  @override
  String get blkFormat => 'صنف واحد في كل سطر، بالتنسيق: الاسم، السعر، الوحدة، الفئة';

  @override
  String get blkOptional => 'الوحدة والفئة اختياريتان (الافتراضي: piece، بلا فئة)';

  @override
  String get blkAddAll => 'إضافة كل الأصناف';

  @override
  String get prSend => 'إرسال تذكير بالدفع';

  @override
  String get prTone => 'اختر النبرة:';

  @override
  String get prPolite => 'مهذبة';

  @override
  String get prStandard => 'عادية';

  @override
  String get prUrgent => 'عاجلة';

  @override
  String get prPreviewQr => 'معاينة رمز QR للدفع عبر جاز كاش';

  @override
  String get prShareText => 'مشاركة النص';

  @override
  String get dsRemaining => 'المتبقي';

  @override
  String dsIncludesDiscount(String amount) {
    return 'يشمل خصمًا قدره $amount';
  }

  @override
  String get dsItems => 'الأصناف';

  @override
  String get dsDiscount => 'الخصم';

  @override
  String get lkWrongPin => 'رمز PIN خاطئ';

  @override
  String get lkEnterPin => 'أدخل رمز PIN';

  @override
  String get lkChecking => 'جارٍ التحقق من بصمة الإصبع...';

  @override
  String get bcTitle => 'مسح باركود';

  @override
  String get bcTorchNa => 'الكشاف غير متوفر على هذا الجهاز';

  @override
  String get bcTorch => 'الكشاف';

  @override
  String get bcPoint => 'وجّه الكاميرا نحو الباركود';

  @override
  String get qrNoNumber => 'لم يتم إعداد رقم جاز كاش. اضبطه في الإعدادات لإظهار رمز QR للدفع.';

  @override
  String get qrPay => 'الدفع عبر جاز كاش';

  @override
  String get qrInvalid => 'بيانات QR غير صالحة';

  @override
  String qrAmount(String amount) {
    return 'المبلغ: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'جاز كاش: $number';
  }

  @override
  String get qrCopy => 'نسخ رقم جاز كاش';

  @override
  String get qrCopied => 'تم نسخ رقم جاز كاش إلى الحافظة';

  @override
  String get qrHint => 'امسح هذا الرقم أو انسخه في تطبيق جاز كاش للدفع.';

  @override
  String clOwed(String amount) {
    return '$amount مستحق';
  }

  @override
  String get lnEnterEmailFirst => 'أدخل بريدًا إلكترونيًا صالحًا أعلاه أولًا.';

  @override
  String get lnResetSent => 'تم إرسال رسالة إعادة تعيين كلمة المرور — تحقق من بريدك الوارد.';

  @override
  String get lnNoAccount => 'لم يُعثر على حساب لهذا البريد الإلكتروني.';

  @override
  String get lnWrongPassword => 'كلمة المرور غير صحيحة.';

  @override
  String get lnInvalidEmail => 'لا يبدو هذا عنوان بريد إلكتروني صالحًا.';

  @override
  String get lnDisabled => 'تم تعطيل هذا الحساب.';

  @override
  String get lnTooMany => 'محاولات كثيرة جدًا — حاول مرة أخرى بعد دقيقة.';

  @override
  String get lnNoInternet => 'لا يوجد اتصال بالإنترنت.';

  @override
  String get lnWeakPassword => 'يجب ألا تقل كلمة المرور عن 6 أحرف.';

  @override
  String get lnCouldNotSignIn => 'تعذّر تسجيل الدخول. يرجى المحاولة مرة أخرى.';

  @override
  String get lnWrongPasswordHint => 'كلمة المرور غير صحيحة. حاول مجددًا أو اضغط \"هل نسيت كلمة المرور؟\".';

  @override
  String get lnWrongEmail => 'البريد الإلكتروني غير صحيح — لا يوجد حساب بهذا العنوان.';

  @override
  String get lnWrongEmailOrPassword => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

  @override
  String get lnWrongUsername => 'اسم المستخدم غير صحيح — لا يوجد حساب بهذا الاسم.';

  @override
  String get lnWelcome => 'مرحبًا بعودتك';

  @override
  String lnSignInTo(String app) {
    return 'سجّل الدخول إلى $app';
  }

  @override
  String get lnEmailOrUsername => 'البريد الإلكتروني أو اسم المستخدم';

  @override
  String get lnRemember => 'تذكّرني';

  @override
  String get lnForgot => 'هل نسيت كلمة المرور؟';

  @override
  String get lnSignIn => 'تسجيل الدخول';

  @override
  String get lnGoogle => 'المتابعة عبر Google';

  @override
  String get lnNew => 'جديد هنا؟';

  @override
  String get lnCreate => 'إنشاء حساب';

  @override
  String suCreated(String email) {
    return 'تم إنشاء حساب لـ $email. أُرسلت رسالة تحقق (اختياري).';
  }

  @override
  String suSetup(String app) {
    return 'إعداد $app';
  }

  @override
  String get suName => 'الاسم';

  @override
  String get suEmail => 'البريد الإلكتروني';

  @override
  String suPhoneDigits(int digits) {
    return 'أدخل رقمًا صالحًا من $digits أرقام';
  }

  @override
  String get suCreateBtn => 'إنشاء حساب';

  @override
  String get suHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get suAlreadyExists => 'يوجد حساب لهذا البريد الإلكتروني بالفعل.';

  @override
  String get suInvalidEmail => 'عنوان البريد الإلكتروني غير صالح.';

  @override
  String get agShow => 'إظهار كلمة المرور';

  @override
  String get agHide => 'إخفاء كلمة المرور';

  @override
  String get adAccounts => 'الحسابات';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حساب مسجَّل',
      many: '$count حسابًا مسجَّلًا',
      few: '$count حسابات مسجَّلة',
      two: 'حسابان مسجَّلان',
      one: 'حساب مسجَّل واحد',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'إضافة';

  @override
  String get adNoAccounts => 'لم يُعثر على حسابات.';

  @override
  String get adAccountability => 'المساءلة';

  @override
  String get adAccountabilitySub => 'من ألغى أو حذف أو أرجع شيئًا، وتغييرات الحسابات.';

  @override
  String get adActivitySub => 'الفواتير الملغاة وعمليات الحذف وتغييرات الحسابات';

  @override
  String get adServer => 'الخادم';

  @override
  String get adServerSub => 'الجهة التي يتصل بها هذا التطبيق. نادرًا ما يحتاج إلى تغيير بعد الإعداد.';

  @override
  String get adServerHint => 'المحاكي يستخدم 10.0.2.2؛ أما الهاتف الحقيقي فيحتاج إلى عنوان IP للحاسوب المحمول على شبكة الواي فاي نفسها. تغييره يؤثر على كل الحسابات.';

  @override
  String get adApiBase => 'عنوان API الأساسي';

  @override
  String get adSaveServer => 'حفظ عنوان الخادم';

  @override
  String get adEmailSetSub => 'تم الإعداد — يمكن للموظفين إرسال الفواتير/كشوف الحساب بالبريد إلى العملاء.';

  @override
  String get adNotSetUp => 'لم يتم الإعداد بعد.';

  @override
  String get adEmailSetBody => 'تم إعداد البريد الإلكتروني. يتيح للموظفين إرسال فاتورة أو كشف حساب مباشرة إلى العميل.';

  @override
  String get adEmailHelp => 'يعمل عنوان Gmail مع كلمة مرور التطبيق (smtp.gmail.com، المنفذ 587)، أو استخدم تفاصيل SMTP لدى مزوّد بريدك.';

  @override
  String get adSmtpHost => 'مضيف SMTP';

  @override
  String get adSmtpPort => 'منفذ SMTP';

  @override
  String get adEmailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get adPwKeep => 'كلمة المرور (اتركها فارغة للإبقاء على الحالية)';

  @override
  String get adPwApp => 'كلمة المرور (كلمة مرور التطبيق، وليست كلمة مرور الدخول)';

  @override
  String get adFromName => 'اسم المرسِل (اختياري)';

  @override
  String get adFromHint => 'متجر الأجهزة الخاص بي';

  @override
  String get adSaving => 'جارٍ الحفظ...';

  @override
  String get adSaveEmail => 'حفظ إعدادات البريد';

  @override
  String get adAddAccount => 'إضافة حساب';

  @override
  String get adNameOpt => 'الاسم (اختياري)';

  @override
  String get adAtLeast6 => '6 أحرف على الأقل';

  @override
  String get adGrantAdmin => 'منح صلاحية المسؤول';

  @override
  String get adCanManage => 'يمكنه الإلغاء/الحذف/الإرجاع';

  @override
  String get adCanManageHint => 'إلغاء فاتورة أو حذفها، أو إرجاع فاتورة، أو حذف عميل/مورّد. المسؤول يملك هذه الصلاحية دائمًا.';

  @override
  String get adCreate => 'إنشاء';

  @override
  String get adAccountCreated => 'تم إنشاء الحساب.';

  @override
  String adCreateFailed(String error) {
    return 'فشل الإنشاء: $error';
  }

  @override
  String get adEditAccount => 'تعديل الحساب';

  @override
  String get adAdminSwitch => 'مسؤول';

  @override
  String get adAdminHint => 'يمكنه فتح لوحة المسؤول';

  @override
  String get adDisabled => 'معطَّل';

  @override
  String get adDisabledHint => 'ممنوع من تسجيل الدخول';

  @override
  String get adAccountUpdated => 'تم تحديث الحساب.';

  @override
  String adUpdateFailed(String error) {
    return 'فشل التحديث: $error';
  }

  @override
  String adDeleteBody(String label) {
    return 'سيُزال $label نهائيًا ولن يتمكن من تسجيل الدخول بعد الآن.';
  }

  @override
  String get adAccountDeleted => 'تم حذف الحساب.';

  @override
  String adDeleteFailed(String error) {
    return 'فشل الحذف: $error';
  }

  @override
  String get adBadgeAdmin => 'مسؤول';

  @override
  String get adBadgeDisabled => 'معطَّل';

  @override
  String get adOff => 'لوحة المسؤول متوقفة';

  @override
  String get adCheckAgain => 'تحقق مجددًا';

  @override
  String get adAccessRequired => 'مطلوب صلاحية المسؤول';

  @override
  String get adAccessBody => 'يستطيع مسؤولو المتجر فقط إدارة الحسابات. اطلب من مالك المتجر منحك صلاحية المسؤول.';

  @override
  String get adCouldNotLoad => 'تعذّر تحميل لوحة المسؤول.';

  @override
  String get adBadPort => 'أدخل رقم منفذ SMTP صالحًا.';

  @override
  String get adEmailSaved => 'تم حفظ إعدادات البريد.';

  @override
  String adEmailSaveFailed(String error) {
    return 'تعذّر حفظ إعدادات البريد: $error';
  }

  @override
  String get adServerEmpty => 'لا يمكن أن يكون عنوان الخادم فارغًا.';

  @override
  String get adServerSaved => 'تم حفظ عنوان الخادم. ستستخدمه الشاشات عند التحميل التالي.';

  @override
  String get lnOr => 'أو';

  @override
  String get scNotABill => 'لا يبدو هذا فاتورة. حاول مرة أخرى بصورة واضحة للفاتورة.';

  @override
  String get scNotAnInvoice => 'لا تبدو هذه فاتورة. حاول مرة أخرى بصورة واضحة لفاتورة المورّد.';

  @override
  String get jqOpenFull => 'حجم كامل';

  @override
  String get jqCopy => 'نسخ الرقم';

  @override
  String get jqSheetTitle => 'رمز جاز كاش QR';

  @override
  String get jqSheetHint => 'يمسح العملاء هذا الرمز في تطبيق جاز كاش للدفع لك.';

  @override
  String get jqCheck => 'تحقق من الرقم';

  @override
  String get askVoice => 'الصوت';

  @override
  String get askVoiceFallbackNote => 'تتم القراءة بصوت هاتفك.';

  @override
  String get askPace => 'السرعة';

  @override
  String get askTone => 'النبرة';

  @override
  String get askPaceSlower => 'أبطأ';

  @override
  String get askPaceNormal => 'عادية';

  @override
  String get askPaceFaster => 'أسرع';

  @override
  String get askToneCalm => 'هادئة';

  @override
  String get askToneWarm => 'دافئة';

  @override
  String get askToneCheerful => 'مرحة';

  @override
  String qPaymentUpdate(String amount) {
    return 'تحديث الدفعة: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'العميل: $name';
  }

  @override
  String qSupplier(String name) {
    return 'المورّد: $name';
  }

  @override
  String qItem(String name) {
    return 'الصنف: $name';
  }

  @override
  String qExpense(String name) {
    return 'المصروف: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'عملية شراء: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'تم تحصيل دفعة: $amount من $name';
  }

  @override
  String gstAmount(String amount) {
    return 'ضريبة $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'الخاضع للضريبة $taxable  ·  الضريبة $tax  ·  الإجمالي $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'الإيرادات: $revenue  •  تكلفة البضاعة: $cogs  •  المصروفات: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'مرحباً $customer، تحية طيبة من $shop! إجمالي رصيدك المستحق هو $amount. شكراً لك!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'مرحباً $customer، تذكير بالدفع من $shop بخصوص الرصيد المعلّق البالغ $amount. نرجو السداد في أقرب فرصة.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'إشعار عاجل: عزيزي $customer، دفعتك المستحقة البالغة $amount لدى $shop معلّقة. يرجى السداد فوراً.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'ادفع عبر جاز كاش: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'فاتورة من $shop\nالإجمالي: $total\nالأصناف: $items\nالحالة: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'مرحباً $supplier، معكم $shop. نود تقديم طلب بالأصناف التالية:\n$lines\n\nيرجى تأكيد التوفر والسعر. شكراً لكم.';
  }

  @override
  String ppUpdated(String date) {
    return 'آخر تحديث: $date';
  }

  @override
  String get ppWhoH => 'من نحن';

  @override
  String ppWho(String owner, String email) {
    return '$owner، المشغّل لتطبيق Book-keep.\nللتواصل: $email';
  }

  @override
  String get ppCollectH => 'ما الذي نجمعه';

  @override
  String get ppCollectAccount => 'الحساب: البريد الإلكتروني ورقم الهاتف واسم المستخدم، عبر Firebase Authentication.';

  @override
  String get ppCollectShop => 'ملف المتجر: اسم المتجر والعنوان ورقم الهاتف ورقم JazzCash وشعار المتجر، يُدخلها صاحب المتجر في الإعدادات.';

  @override
  String get ppCollectRecords => 'سجلات العمل التي تنشئها: أسماء وأرقام هواتف العملاء والموردين، والفواتير، والمشتريات، وكتالوج الأصناف (بما في ذلك صور الأصناف والباركود)، والمصروفات (بما في ذلك صور الإيصالات). هذه هي البيانات الأساسية للتطبيق، وهكذا تعمل المحاسبة.';

  @override
  String get ppCollectDevice => 'بيانات الجهاز والتشخيص: رمز الإشعارات الفورية (لتنبيهات انخفاض المخزون والمدفوعات المتأخرة والملخص اليومي) وتقارير الأعطال (معلومات الجهاز وسجلات الخطأ) عبر Firebase Crashlytics، وتُرسل تلقائيًا عند تعطل التطبيق.';

  @override
  String ppCollectAi(String askShop) {
    return 'ميزات الذكاء الاصطناعي: $askShop والموجز الصباحي بالذكاء الاصطناعي وماسح الفواتير/المشتريات بالذكاء الاصطناعي ترسل لقطة من بيانات العمل ذات الصلة (أرقام التقارير أو صورة فاتورة) إلى واجهة Gemini من Google لإنشاء إجابة أو ملخص أو بنود مستخرجة. تعالج Google هذه البيانات لإنشاء الرد؛ ولا نستخدمها نحن ولا Google لتدريب النماذج خارج شروط واجهة Google القياسية.';
  }

  @override
  String get ppDontH => 'ما لا نفعله';

  @override
  String get ppDontLocation => 'لا نتتبع موقعك.';

  @override
  String get ppDontAds => 'لا نستخدم شبكات إعلانات ولا أدوات تحليل السلوك أو تسجيل الجلسات.';

  @override
  String get ppDontSell => 'لا نبيع بياناتك ولا بيانات عملائك لأي جهة.';

  @override
  String get ppWhereH => 'أين تُحفظ البيانات';

  @override
  String get ppWhereDb => 'قاعدة البيانات: Neon (Postgres)، مزوّد خارجي لقواعد البيانات السحابية.';

  @override
  String get ppWhereFirebase => 'المصادقة والإشعارات الفورية وتقارير الأعطال وتخزين الصور: Firebase (Google).';

  @override
  String get ppWhereAi => 'معالجة الذكاء الاصطناعي: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'رسائل الفواتير الإلكترونية: تُرسل عبر حساب SMTP الذي يضبطه مسؤول متجرك في $adminPanel. لا نملك قائمة بريدية؛ هذه الرسائل فواتير/كشوف فردية لعملائك أنفسهم، وليست تسويقًا جماعيًا.';
  }

  @override
  String get ppYoursH => 'بياناتك وبيانات عملائك';

  @override
  String get ppYours => 'كل ما تدخله من عملاء وموردين وفواتير وأصناف ملك لمتجرك. لا تستطيع المتاجر الأخرى التي تستخدم Book-keep رؤيته. حسابات الموظفين التي تنشئها ترى فقط ما تمنحها حق الوصول إليه.';

  @override
  String get ppControlsH => 'خياراتك';

  @override
  String ppControlExport(String path) {
    return 'تصدير بياناتك أو نسخها احتياطيًا: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'حذف حسابك: $path. يؤدي هذا إلى إزالة بيانات تسجيل دخولك فقط، ولا يمحو سجلات عمل متجرك (الفواتير والعملاء والأصناف وغيرها)، تمامًا كما أن إزالة موظف لا تحذف السجلات التي أنشأها.';
  }

  @override
  String ppControlNotif(String path) {
    return 'الإشعارات: يمكن إيقافها حسب النوع في $path.';
  }

  @override
  String get ppChildrenH => 'الأطفال';

  @override
  String get ppChildren => 'Book-keep أداة عمل لأصحاب المتاجر وموظفيهم. وهو غير موجّه للأطفال ولا يستخدمه الأطفال عن علم.';

  @override
  String get ppChangesH => 'التغييرات على هذه السياسة';

  @override
  String get ppChanges => 'إذا تغيّر ما نجمعه أو وجهته، فسنحدّث هذه الصفحة ونغيّر التاريخ في الأعلى.';

  @override
  String get ppContactH => 'التواصل';

  @override
  String ppContact(String email) {
    return 'أسئلة حول هذه السياسة أو بياناتك: $email';
  }

  @override
  String get waHello => 'مرحبًا!';

  @override
  String waHelloNamed(String name) {
    return 'مرحبًا $name،';
  }

  @override
  String get gstTaxable => 'الخاضع للضريبة';

  @override
  String get gstTax => 'الضريبة';

  @override
  String get gstTaxableValue => 'القيمة الخاضعة للضريبة';

  @override
  String get gstTotalTax => 'إجمالي الضريبة';

  @override
  String get gstTotalItc => 'إجمالي ضريبة المدخلات المستردة';

  @override
  String get gstExempt => 'المبيعات المعفاة';

  @override
  String get gstNetPayable => 'صافي الضريبة المستحقة';

  @override
  String get unknownName => 'غير معروف';

  @override
  String get unitPiece => 'قطعة';

  @override
  String get unitKg => 'كجم';

  @override
  String get unitMeter => 'متر';

  @override
  String get unitBox => 'صندوق';

  @override
  String get unitDozen => 'دزينة';

  @override
  String get unitLiter => 'لتر';

  @override
  String get unitBag => 'كيس';

  @override
  String deleteSupplierMessage(String name) {
    return 'هل تريد حذف $name وجميع مشترياته؟ لا يمكن التراجع عن هذا الإجراء.';
  }
}
