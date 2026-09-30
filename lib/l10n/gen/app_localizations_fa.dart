// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get navHome => 'خانه';

  @override
  String get navCustomers => 'مشتریان';

  @override
  String get navItems => 'اقلام';

  @override
  String get navSuppliers => 'تأمین‌کنندگان';

  @override
  String get navReports => 'گزارش‌ها';

  @override
  String get navSettings => 'تنظیمات';

  @override
  String get settingsShopDetailsTitle => 'جزئیات فروشگاه';

  @override
  String get settingsShopDetailsSubtitle => 'در فاکتورهای شما نمایش داده می‌شود.';

  @override
  String get settingsShopNameLabel => 'نام فروشگاه';

  @override
  String get settingsShopAddressLabel => 'آدرس فروشگاه';

  @override
  String get settingsPhoneLabel => 'تلفن';

  @override
  String get settingsSaveShopDetails => 'ذخیره جزئیات فروشگاه';

  @override
  String get settingsAppearanceTitle => 'ظاهر';

  @override
  String get settingsAppearanceSubtitle => 'یک پوسته برای کل برنامه انتخاب کنید.';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تیره';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get settingsLanguageTitle => 'زبان';

  @override
  String get settingsLanguageSubtitle => 'زبان نمایش برنامه را انتخاب کنید.';

  @override
  String get sortNameNewest => 'مرتب‌سازی: نام / جدیدترین';

  @override
  String get addCustomer => 'افزودن مشتری';

  @override
  String get importCsv => 'وارد کردن CSV';

  @override
  String get searchShop => 'جستجو در فروشگاه';

  @override
  String get scanToFindItem => 'اسکن برای یافتن کالا';

  @override
  String get bulkAdd => 'افزودن گروهی';

  @override
  String get updateStock => 'به‌روزرسانی موجودی';

  @override
  String get printLabels => 'چاپ برچسب‌ها';

  @override
  String get mergeDuplicates => 'ادغام موارد تکراری';

  @override
  String get addSupplier => 'افزودن تأمین‌کننده';

  @override
  String get scanPurchaseInvoice => 'اسکن فاکتور خرید';

  @override
  String askNoAnswer(String reason) {
    return 'پاسخی دریافت نشد: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'اتصال برقرار نشد: $error';
  }

  @override
  String get micPermissionNeeded => 'برای ورودی صوتی به مجوز میکروفون نیاز است.';

  @override
  String get speechUnavailable => 'تشخیص گفتار در این دستگاه در دسترس نیست.';

  @override
  String get askYourShop => 'از فروشگاهت بپرس';

  @override
  String get close => 'بستن';

  @override
  String get askIntro => 'می‌خواهید بدانید فروشگاه چطور پیش می‌رود؟ از من بپرسید؛ از روی دفترهایتان جواب می‌دهم.';

  @override
  String get askListening => 'در حال شنیدن…';

  @override
  String get askThinkingWords => 'در حال فکر کردن…|در حال کار…|در حال محاسبه…|در حال بررسی دفاتر…|در حال جمع زدن…|در حال بررسی ارقام…';

  @override
  String get askSayQuestion => 'سؤالتان را بگویید — برای لغو روی گوی ضربه بزنید';

  @override
  String briefingRefreshFailed(int code) {
    return 'به‌روزرسانی خلاصه ممکن نشد ($code).';
  }

  @override
  String get refreshFailedOffline => 'به‌روزرسانی ممکن نشد — اتصال را بررسی کنید.';

  @override
  String get newBillFailed => 'شروع فاکتور جدید ممکن نشد — اتصال را بررسی و دوباره تلاش کنید.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'ابتدا برای $name تأمین‌کننده ترجیحی تعیین کنید (برای ویرایش ضربه بزنید).';
  }

  @override
  String get reorderBySupplier => 'سفارش مجدد بر اساس تأمین‌کننده';

  @override
  String get supplier => 'تأمین‌کننده';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کالا',
      one: '1 کالا',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'هنوز هیچ کالای کم‌موجودی تأمین‌کننده ترجیحی ندارد.';

  @override
  String get thisSupplier => 'این تأمین‌کننده';

  @override
  String supplierNoPhone(String name) {
    return '$name شماره تلفن ندارد.';
  }

  @override
  String get tabOverview => 'نمای کلی';

  @override
  String get tabStock => 'موجودی';

  @override
  String get tabMoney => 'پول';

  @override
  String get taglineOverview => 'بدهی‌ها، موجودی و نقدینگی امروز در یک نگاه.';

  @override
  String get taglineStock => 'چه چیزی فروش می‌رود، چه چیزی رو به اتمام است.';

  @override
  String get taglineMoney => 'هزینه‌ها، تطبیق و وصول‌ها.';

  @override
  String loadingDashboard(int done, int total) {
    return 'در حال بارگذاری داشبورد… $done از $total';
  }

  @override
  String get dashboardLoadFailed => 'داشبورد بارگذاری نشد';

  @override
  String get checkConnectionRetry => 'اتصال را بررسی و دوباره تلاش کنید.';

  @override
  String get retry => 'تلاش دوباره';

  @override
  String get aiBriefing => 'خلاصه هوش مصنوعی';

  @override
  String get briefingPrompt => 'کسب‌وکار دیروز را در چند جمله ببینید.';

  @override
  String get getBriefing => 'دریافت خلاصه';

  @override
  String get refreshBriefing => 'به‌روزرسانی خلاصه';

  @override
  String updatedAt(String time) {
    return 'به‌روز شده $time';
  }

  @override
  String get customersUnknown => '— مشتری';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشتری',
      one: '1 مشتری',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'ماه قبل';

  @override
  String get nextMonth => 'ماه بعد';

  @override
  String get salesMonth => 'فروش (ماه)';

  @override
  String get outstanding => 'مانده بدهی';

  @override
  String get profitMonth => 'سود (ماه)';

  @override
  String get cashToday => 'نقد امروز';

  @override
  String get newBill => 'فاکتور جدید';

  @override
  String get scanHandwrittenBill => 'اسکن فاکتور دست‌نویس';

  @override
  String get topOutstanding => 'بیشترین مانده‌ها';

  @override
  String viewAllInDues(int count) {
    return 'مشاهده همه $count مورد در مرکز بدهی‌ها';
  }

  @override
  String get lowStockAlerts => 'هشدارهای کمبود موجودی';

  @override
  String get noLowStock => 'هیچ کالایی کم‌موجودی نیست — موجودی خوب است.';

  @override
  String get whatsappAll => 'واتس‌اپ به همه';

  @override
  String get reorderAll => 'سفارش مجدد همه';

  @override
  String suggestReorder(String qty, String unit) {
    return 'پیشنهاد سفارش مجدد $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit مانده';
  }

  @override
  String get reorder => 'سفارش مجدد';

  @override
  String get whatsappSupplier => 'واتس‌اپ به تأمین‌کننده';

  @override
  String get topItemsByRevenue => 'پردرآمدترین کالاها';

  @override
  String get noSalesYet => 'هنوز فروشی ثبت نشده است.';

  @override
  String qtyLabel(String qty) {
    return 'تعداد: $qty';
  }

  @override
  String get monthExpenses => 'هزینه‌های این ماه';

  @override
  String get noExpensesMonth => 'این ماه هزینه‌ای ثبت نشده است.';

  @override
  String get quickActions => 'اقدامات سریع';

  @override
  String get dailyCashReconciliation => 'تطبیق روزانه نقدینگی';

  @override
  String get collectMoney => 'وصول پول';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تغییر به‌صورت آفلاین ذخیره شد',
      one: '1 تغییر به‌صورت آفلاین ذخیره شد',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'پس از آنلاین شدن خودکار همگام می‌شود';

  @override
  String get syncing => 'در حال همگام‌سازی';

  @override
  String get sync => 'همگام‌سازی';

  @override
  String get shopProfile => 'نمایه فروشگاه';

  @override
  String get insights => 'بینش‌ها';

  @override
  String get notifications => 'اعلان‌ها';

  @override
  String get backupExport => 'پشتیبان‌گیری و خروجی';

  @override
  String get adminPanel => 'پنل مدیر';

  @override
  String get toolsSync => 'ابزارها و همگام‌سازی';

  @override
  String get account => 'حساب';

  @override
  String get shopDetailsSaved => 'جزئیات فروشگاه ذخیره شد.';

  @override
  String saveFailed(int code) {
    return 'ذخیره ناموفق بود ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'ذخیره نشد: $error';
  }

  @override
  String get logoUpdated => 'لوگو به‌روز شد.';

  @override
  String logoUploadFailed(int code) {
    return 'بارگذاری لوگو ناموفق بود ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'لوگو بارگذاری نشد: $error';
  }

  @override
  String get healthGood => 'در کل همه چیز خوب است.';

  @override
  String get healthSome => 'چند مورد نیاز به توجه دارد.';

  @override
  String get healthMany => 'موارد زیادی نیاز به توجه دارد.';

  @override
  String get shopHealth => 'سلامت فروشگاه';

  @override
  String get healthIntro => 'یک یادآوری کوتاه، نه یک گزارش دیگر.';

  @override
  String get couldNotLoadCheckConnection => 'بارگذاری نشد — اتصال را بررسی کنید.';

  @override
  String get itemPhotos => 'عکس کالاها';

  @override
  String get barcodes => 'بارکدها';

  @override
  String get lowStockItems => 'کالاهای کم‌موجودی';

  @override
  String get lastBackup => 'آخرین پشتیبان';

  @override
  String get today => 'امروز';

  @override
  String get yesterday => 'دیروز';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days روز پیش',
      one: '1 روز پیش',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'وضعیت آفلاین';

  @override
  String get online => 'آنلاین';

  @override
  String get offline => 'آفلاین';

  @override
  String get waitingToSync => 'در انتظار همگام‌سازی';

  @override
  String get syncNow => 'اکنون همگام کن';

  @override
  String get searchSettings => 'جستجوی تنظیمات';

  @override
  String noSettingsMatch(String query) {
    return 'هیچ تنظیمی با \"$query\" مطابقت ندارد';
  }

  @override
  String get businessInfo => 'اطلاعات کسب‌وکار';

  @override
  String get payment => 'پرداخت';

  @override
  String get shopNameRequired => 'نام فروشگاه الزامی است';

  @override
  String phoneIncomplete(int digits) {
    return 'یک شماره تلفن کامل $digits رقمی وارد کنید';
  }

  @override
  String get jazzcashOptional => 'شماره JazzCash (اختیاری)';

  @override
  String get saved => 'ذخیره شد!';

  @override
  String get languageSubtitle => 'تغییر زبان نمایش برنامه';

  @override
  String get notificationsSubtitle => 'کمبود موجودی، پرداخت‌های معوق و خلاصه روزانه';

  @override
  String get backupSubtitle => 'دانلود، بازیابی و خروجی داده‌های فروشگاه';

  @override
  String get appUpdate => 'به‌روزرسانی برنامه';

  @override
  String get appUpdateSubtitle => 'بررسی نسخه جدیدتر';

  @override
  String get adminSubtitle => 'مدیریت حساب‌ها و داده‌های فروشگاه';

  @override
  String get accountSubtitle => 'ورود، رمز عبور و نام کاربری';

  @override
  String get privacyPolicy => 'سیاست حریم خصوصی';

  @override
  String get privacySubtitle => 'چه داده‌هایی جمع می‌کنیم و چرا';

  @override
  String get yourShop => 'فروشگاه شما';

  @override
  String get uploadingLogo => 'در حال بارگذاری لوگوی فروشگاه';

  @override
  String get logoTapToChange => 'لوگوی فروشگاه، برای تغییر ضربه بزنید';

  @override
  String get brandTagline => 'مغازه شلوغ، حساب‌ها آرام.';

  @override
  String serverError(int code) {
    return 'خطای سرور: $code';
  }

  @override
  String get deleteCustomer => 'حذف مشتری';

  @override
  String deleteCustomerMessage(String name) {
    return '$name و همه فاکتورهایش حذف شود؟ این کار قابل بازگشت نیست.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'حذف نشد: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'حذف نشد — اتصال را بررسی و دوباره تلاش کنید.';

  @override
  String get actions => 'اقدامات';

  @override
  String get edit => 'ویرایش';

  @override
  String get delete => 'حذف';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count مشتری',
      one: 'حذف 1 مشتری',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشتری و همه فاکتورهایشان حذف شوند؟ این کار قابل بازگشت نیست.',
      one: '1 مشتری و همه فاکتورهایش حذف شود؟ این کار قابل بازگشت نیست.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'لغو انتخاب همه';

  @override
  String get selectAll => 'انتخاب همه';

  @override
  String selectedCount(int count) {
    return '$count انتخاب شده';
  }

  @override
  String get cancel => 'لغو';

  @override
  String get newTag => 'جدید';

  @override
  String get csvNeedsRows => 'فایل CSV به یک ردیف سرستون و حداقل یک مشتری نیاز دارد.';

  @override
  String get csvNeedsName => 'سرستون CSV باید ستون \"name\" داشته باشد.';

  @override
  String csvLineMissingName(int line) {
    return 'خط $line: نام وجود ندارد — فایل را اصلاح و دوباره تلاش کنید.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'خط $line: مقدار credit_limit نامعتبر \"$value\" — فایل را اصلاح و دوباره تلاش کنید.';
  }

  @override
  String get importCustomers => 'وارد کردن مشتریان';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشتری در \"$file\" پیدا شد. همه وارد شوند؟',
      one: '1 مشتری در \"$file\" پیدا شد. وارد شود؟',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'وارد کردن';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشتری وارد شدند.',
      one: '1 مشتری وارد شد.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'وارد کردن ناموفق بود: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'وارد کردن ناموفق بود — اتصال برقرار نشد: $error';
  }

  @override
  String get noPhone => 'بدون تلفن';

  @override
  String get offlineShowingSaved => 'آفلاین — نمایش نسخه ذخیره‌شده';

  @override
  String get searchCustomersHint => 'جستجوی مشتری یا تلفن...';

  @override
  String get noCustomersYet => 'هنوز مشتری ندارید. برای افزودن + را بزنید.';

  @override
  String get noCustomersMatch => 'هیچ مشتری با جستجوی شما مطابقت ندارد.';

  @override
  String get owesMoney => 'بدهکار';

  @override
  String get settledUp => 'تسویه شده';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what بارگذاری نشد: $error';
  }

  @override
  String get takePhoto => 'گرفتن عکس';

  @override
  String get chooseFromGallery => 'انتخاب از گالری';

  @override
  String get back => 'بازگشت';

  @override
  String callPhone(String phone) {
    return 'تماس با $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'واتس‌اپ $phone';
  }

  @override
  String get clearSearch => 'پاک کردن جستجو';

  @override
  String get askHint => 'مثلاً این ماه چقدر سود کردم؟';

  @override
  String get acctTurnOffLockTitle => 'قفل برنامه خاموش شود؟';

  @override
  String get acctTurnOffLockBody => 'هر کسی که این گوشی را داشته باشد می‌تواند بدون رمز PIN برنامه را باز کند.';

  @override
  String get acctTurnOff => 'خاموش کردن';

  @override
  String get acctSetPinTitle => 'تنظیم رمز PIN';

  @override
  String get acctPinLabel => 'رمز PIN ۴ تا ۶ رقمی';

  @override
  String get acctPinMin => 'حداقل ۴ رقم';

  @override
  String get acctConfirmPin => 'تأیید رمز PIN';

  @override
  String get acctPinMismatch => 'رمزهای PIN یکسان نیستند';

  @override
  String get acctSetPin => 'تنظیم PIN';

  @override
  String get acctBiometricTitle => 'از اثر انگشت/چهره هم استفاده شود؟';

  @override
  String get acctBiometricBody => 'اگر تشخیص زیستی کار نکرد، همچنان می‌توانید از رمز PIN استفاده کنید.';

  @override
  String get acctNoThanks => 'نه، ممنون';

  @override
  String get acctEnable => 'فعال کردن';

  @override
  String get acctSetPasswordTitle => 'تنظیم گذرواژه';

  @override
  String get acctSetPasswordIntro => 'یک گذرواژه انتخاب کنید تا دفعه بعد علاوه بر Google بتوانید با ایمیل + گذرواژه هم وارد شوید.';

  @override
  String get acctPassword => 'گذرواژه';

  @override
  String get acctPasswordMin => 'باید حداقل ۶ نویسه باشد';

  @override
  String get acctConfirmPassword => 'تأیید گذرواژه';

  @override
  String get acctPasswordsMismatch => 'گذرواژه‌ها یکسان نیستند';

  @override
  String get acctSetPasswordButton => 'تنظیم گذرواژه';

  @override
  String get acctPasswordSet => 'گذرواژه تنظیم شد — اکنون می‌توانید با آن هم وارد شوید.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'گذرواژه تنظیم نشد: $error';
  }

  @override
  String get acctChangePasswordTitle => 'تغییر گذرواژه';

  @override
  String get acctCurrentPassword => 'گذرواژه فعلی';

  @override
  String get acctRequired => 'الزامی است';

  @override
  String get acctNewPassword => 'گذرواژه جدید';

  @override
  String get acctConfirmNewPassword => 'تأیید گذرواژه جدید';

  @override
  String get acctChange => 'تغییر';

  @override
  String get acctPasswordChanged => 'گذرواژه تغییر کرد.';

  @override
  String get acctWrongPassword => 'گذرواژه فعلی نادرست است.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'گذرواژه تغییر نکرد: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'تغییر نام کاربری';

  @override
  String get acctUsername => 'نام کاربری';

  @override
  String get acctUsernameEmpty => 'نام کاربری نمی‌تواند خالی باشد';

  @override
  String get acctUsernameChanged => 'نام کاربری تغییر کرد.';

  @override
  String get acctChangeEmailTitle => 'تغییر ایمیل';

  @override
  String get acctNewEmail => 'ایمیل جدید';

  @override
  String get acctValidEmail => 'یک ایمیل معتبر وارد کنید';

  @override
  String get acctRequiredConfirm => 'برای تأیید هویت شما لازم است';

  @override
  String get acctGoogleConfirmFirst => 'ابتدا از شما خواسته می‌شود با Google تأیید کنید.';

  @override
  String acctCheckEmail(String email) {
    return 'برای پیوند تأیید تغییر، $email را بررسی کنید.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'ورود با گذرواژه';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider حذف شود؟';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'دیگر نمی‌توانید با $provider وارد این حساب شوید.';
  }

  @override
  String get acctRemove => 'حذف';

  @override
  String acctRemoved(String provider) {
    return '$provider حذف شد.';
  }

  @override
  String get acctSignedIn => 'وارد شده‌اید';

  @override
  String get acctEmailNotVerified => 'ایمیل هنوز تأیید نشده است.';

  @override
  String get acctVerificationSent => 'ایمیل تأیید ارسال شد.';

  @override
  String get acctResend => 'ارسال دوباره';

  @override
  String get acctSectionSignIn => 'ورود و امنیت';

  @override
  String get acctRowChangeUsername => 'تغییر نام کاربری';

  @override
  String get acctRowChangeEmail => 'تغییر ایمیل';

  @override
  String get acctRowSetPassword => 'تنظیم گذرواژه';

  @override
  String get acctRowChangePassword => 'تغییر گذرواژه';

  @override
  String get acctRowUnlinkGoogle => 'قطع اتصال Google';

  @override
  String get acctRowRemovePassword => 'حذف گذرواژه';

  @override
  String get acctRowAppLock => 'قفل برنامه (PIN)';

  @override
  String get acctRowBiometric => 'استفاده از اثر انگشت/چهره';

  @override
  String get acctSignOutTitle => 'خروج از حساب؟';

  @override
  String get acctSignOutBody => 'برای استفاده از برنامه باید دوباره وارد شوید.';

  @override
  String get acctSignOut => 'خروج';

  @override
  String get acctDeleteAccount => 'حذف حساب';

  @override
  String get acctDeleting => 'در حال حذف...';

  @override
  String get acctDeleteTitle => 'حساب حذف شود؟';

  @override
  String get acctDeleteBody => 'این کار اطلاعات ورود شما را برای همیشه حذف می‌کند. برای استفاده از برنامه باید دوباره ثبت‌نام کنید. این کار قابل بازگشت نیست.';

  @override
  String acctCouldNotDelete(String error) {
    return 'حساب حذف نشد: $error';
  }

  @override
  String get itmNotFoundTitle => 'کالا پیدا نشد';

  @override
  String itmNotFoundBody(String barcode) {
    return 'هیچ کالایی با بارکد $barcode وجود ندارد. اکنون به‌عنوان کالای جدید اضافه شود؟';
  }

  @override
  String get itmAddItem => 'افزودن کالا';

  @override
  String get itmEditItem => 'ویرایش کالا';

  @override
  String get itmMergeTitle => 'ادغام کالاهای تکراری';

  @override
  String get itmMergeBody => 'کالاهای هم‌نام در قدیمی‌ترین ردیف ادغام می‌شوند و موجودی آن‌ها جمع می‌شود. این کار قابل بازگشت نیست.';

  @override
  String get itmMerge => 'ادغام';

  @override
  String get itmNoDuplicates => 'کالای تکراری پیدا نشد.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کالای تکراری ادغام شد.',
      one: '۱ کالای تکراری ادغام شد.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'حذف کالا';

  @override
  String get itmCannotUndo => 'این کار قابل بازگشت نیست.';

  @override
  String get itmDeleteOffline => 'حذف نشد — اتصال خود را بررسی کنید و دوباره تلاش کنید.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count کالا',
      one: 'حذف ۱ کالا',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کالا حذف شود؟ این کار قابل بازگشت نیست.',
      one: '۱ کالا حذف شود؟ این کار قابل بازگشت نیست.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'عکس بارگذاری نشد ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'عکس بارگذاری نشد: $error';
  }

  @override
  String get itmNoBarcodes => 'هنوز هیچ کالایی بارکد ندارد.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'چاپ $count برچسب',
      one: 'چاپ ۱ برچسب',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'جستجوی کالا یا دسته...';

  @override
  String get itmStopListening => 'توقف گوش دادن';

  @override
  String get itmVoiceSearch => 'جستجوی صوتی';

  @override
  String get itmSort => 'مرتب‌سازی';

  @override
  String get itmSortName => 'نام (الف تا ی)';

  @override
  String get itmSortStockLow => 'موجودی: کم به زیاد';

  @override
  String get itmSortRecent => 'اخیراً افزوده‌شده';

  @override
  String get itmFilterAll => 'همه';

  @override
  String get itmFilterLowStock => 'موجودی کم';

  @override
  String get itmNoItemsYet => 'هنوز کالایی نیست. برای افزودن، + را بزنید.';

  @override
  String get itmNoItemsMatch => 'هیچ کالایی با جستجوی شما مطابقت ندارد.';

  @override
  String get itmNoPriceChanges => 'هنوز تغییر قیمتی ثبت نشده است.';

  @override
  String get itmNoStockCorrections => 'هنوز اصلاح موجودی ثبت نشده است.';

  @override
  String get itmResetHistory => 'بازنشانی تاریخچه';

  @override
  String get itmResetHistoryMsg => 'تاریخچه این کالا بازنشانی شود؟ این کار قابل بازگشت نیست.';

  @override
  String get itmSendPdf => 'ارسال به‌صورت PDF';

  @override
  String get itmNoteOptional => 'یادداشت (اختیاری)';

  @override
  String get itmNoteHint => 'برای این تغییر یادداشتی اضافه کنید';

  @override
  String get itmRemoveEntry => 'حذف مورد';

  @override
  String get itmRemoveEntryMsg => 'این مورد از تاریخچه حذف شود؟ این کار قابل بازگشت نیست.';

  @override
  String get itmEditEntry => 'ویرایش مورد';

  @override
  String get itmPrevQty => 'قبلی';

  @override
  String get itmNewQty => 'جدید';

  @override
  String itmCost(String amount) {
    return 'بهای تمام‌شده: $amount';
  }

  @override
  String get itmMore => 'بیشتر';

  @override
  String get itmMenuPrintLabel => 'چاپ برچسب';

  @override
  String get itmMenuDuplicate => 'تکثیر';

  @override
  String get itmMenuPriceHistory => 'تاریخچه قیمت';

  @override
  String get itmMenuStockHistory => 'تاریخچه اصلاح موجودی';

  @override
  String itmLowStockBadge(int count) {
    return '$count موجودی کم';
  }

  @override
  String itmStockLine(String qty) {
    return 'موجودی: $qty';
  }

  @override
  String get itmOfflineSaved => 'آفلاین — کالا روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get itmItemName => 'نام کالا';

  @override
  String get itmNameRequired => 'نام الزامی است';

  @override
  String get itmPricePkr => 'قیمت (PKR)';

  @override
  String get itmPriceRequired => 'قیمت الزامی است';

  @override
  String get itmValidNumber => 'یک عدد معتبر وارد کنید';

  @override
  String get itmUnit => 'واحد';

  @override
  String get itmCategoryHint => 'دسته (اختیاری، مثلاً لوله‌کشی)';

  @override
  String get itmPreferredSupplier => 'تأمین‌کننده ترجیحی (اختیاری)';

  @override
  String get itmPreferredSupplierHelper => 'در سفارش مجدد با یک ضربه استفاده می‌شود';

  @override
  String get itmClear => 'پاک کردن';

  @override
  String get itmHsn => 'کد HSN (اختیاری)';

  @override
  String get itmGstRate => 'نرخ GST % (اختیاری)';

  @override
  String get itmBarcodeOptional => 'بارکد (اختیاری)';

  @override
  String get itmScanOrType => 'اسکن کنید یا بنویسید';

  @override
  String get itmScanBarcode => 'اسکن بارکد';

  @override
  String get itmPurchaseCost => 'بهای خرید (هر واحد)';

  @override
  String get itmPurchaseCostHint => 'مبلغی که هنگام خرید موجودی می‌پردازید';

  @override
  String get itmWholesale => 'قیمت عمده (اختیاری)';

  @override
  String get itmContractor => 'قیمت پیمانکار (اختیاری)';

  @override
  String get itmFallsBack => 'در غیر این صورت قیمت عادی اعمال می‌شود';

  @override
  String get itmStockQty => 'مقدار موجودی';

  @override
  String get itmLowStockAlert => 'هشدار موجودی کم زیر';

  @override
  String get itmFrequently => 'اغلب همراه این خریداری می‌شود';

  @override
  String get itmSaveChanges => 'ذخیره تغییرات';

  @override
  String get itmSaveItem => 'ذخیره کالا';

  @override
  String get itmPhotoSemantics => 'عکس کالا، برای تغییر ضربه بزنید';

  @override
  String get cdUpdateStatusTitle => 'به‌روزرسانی وضعیت پرداخت';

  @override
  String get cdMarkPaidQ => 'این صورت‌حساب به‌عنوان پرداخت‌شده علامت بخورد؟';

  @override
  String get cdMarkUnpaidQ => 'این صورت‌حساب به‌عنوان پرداخت‌نشده علامت بخورد؟';

  @override
  String get cdConfirm => 'تأیید';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'به‌روزرسانی انجام نشد: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'آفلاین — تغییر روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get cdConvertTitle => 'تبدیل به صورت‌حساب';

  @override
  String get cdConvertBody => 'موجودی این کالاها کم می‌شود و پیش‌فاکتور به صورت‌حساب واقعی تبدیل می‌شود. ادامه می‌دهید؟';

  @override
  String get cdConvert => 'تبدیل';

  @override
  String cdCouldNotConvert(String detail) {
    return 'تبدیل انجام نشد: $detail';
  }

  @override
  String get cdReturnItems => 'برگرداندن کالاها';

  @override
  String get cdReturnHint => 'تعداد برگشتی هر کالا را مشخص کنید. برای حفظ فروش، ۰ بگذارید.';

  @override
  String get cdDecreaseQty => 'کاهش تعداد';

  @override
  String get cdIncreaseQty => 'افزایش تعداد';

  @override
  String get cdCreditTotal => 'جمع اعتبار';

  @override
  String get cdReturnSelected => 'برگرداندن موارد انتخاب‌شده';

  @override
  String cdCouldNotReturn(String detail) {
    return 'برگشت انجام نشد: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'ابطال انجام نشد: $detail';
  }

  @override
  String get cdNoPreviousBill => 'صورت‌حساب قبلی برای تکرار وجود ندارد';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'آخرین صورت‌حساب بارگذاری نشد: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'فاکتور برای مشتری ایمیل شد.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'فاکتور ایمیل نشد: $detail';
  }

  @override
  String get cdStatementEmailed => 'صورت‌حساب برای مشتری ایمیل شد.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'صورت‌حساب ایمیل نشد: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'حذف صورت‌حساب';

  @override
  String get cdBillVoided => 'باطل‌شده';

  @override
  String get cdBillReturn => 'برگشتی';

  @override
  String get cdBillQuote => 'پیش‌فاکتور';

  @override
  String get cdBillPaid => 'پرداخت‌شده';

  @override
  String get cdBillPartial => 'جزئی';

  @override
  String get cdBillUnpaid => 'پرداخت‌نشده';

  @override
  String get cdBill => 'صورت‌حساب';

  @override
  String cdVoidedReason(String reason) {
    return 'باطل‌شده: $reason';
  }

  @override
  String get cdViewInvoice => 'مشاهده فاکتور';

  @override
  String get cdEmailInvoice => 'ایمیل فاکتور';

  @override
  String get cdEditBill => 'ویرایش صورت‌حساب';

  @override
  String get cdReturnBill => 'برگشت صورت‌حساب';

  @override
  String get cdVoidBill => 'ابطال صورت‌حساب';

  @override
  String get cdNoItems => 'کالایی نیست';

  @override
  String get cdRepeatLast => 'تکرار آخرین صورت‌حساب';

  @override
  String get cdLedgerPdf => 'PDF دفتر حساب';

  @override
  String get cdEmailStatement => 'ایمیل صورت‌حساب';

  @override
  String get cdCollectPayment => 'دریافت پرداخت';

  @override
  String get cdSendReminder => 'ارسال یادآوری واتس‌اپ';

  @override
  String get cdTotalBilled => 'جمع صورت‌حساب‌ها';

  @override
  String get cdPaid => 'پرداخت‌شده';

  @override
  String get cdNoBills => 'هنوز صورت‌حسابی نیست';

  @override
  String get cdBillActions => 'اقدامات صورت‌حساب';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding از $limit سقف اعتبار استفاده شده';
  }

  @override
  String get cdVoidBody => 'از مانده‌ها و گزارش‌ها حذف می‌شود اما در تاریخچه می‌ماند. موجودی برگردانده می‌شود. این کار قابل بازگشت نیست.';

  @override
  String get cdReason => 'دلیل (اختیاری)';

  @override
  String get frmOfflineCustomer => 'آفلاین — مشتری روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get frmOfflineSupplier => 'آفلاین — تأمین‌کننده روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get frmEditCustomer => 'ویرایش مشتری';

  @override
  String get frmCustomerName => 'نام مشتری';

  @override
  String get frmPhoneOptional => 'تلفن (اختیاری)';

  @override
  String get frmCreditLimit => 'سقف اعتبار (PKR، اختیاری)';

  @override
  String get frmCreditHelper => 'وقتی مانده این مشتری از این مقدار بیشتر شد هشدار بده';

  @override
  String get frmPriceTier => 'سطح قیمت';

  @override
  String get frmRetail => 'خرده‌فروشی';

  @override
  String get frmWholesale => 'عمده';

  @override
  String get frmContractor => 'پیمانکار';

  @override
  String get frmPriceTierHelper => 'کدام قیمت کالا هنگام ثبت صورت‌حساب برای این مشتری پیش‌فرض شود';

  @override
  String get frmStrn => 'STRN (اختیاری)';

  @override
  String get frmStrnCustomer => 'شماره ثبت مالیات فروش ۱۳ رقمی برای فاکتورها';

  @override
  String get frmStrnSupplier => 'شماره ثبت مالیات فروش ۱۳ رقمی برای فاکتورهای خرید';

  @override
  String get frmAddress => 'نشانی (اختیاری)';

  @override
  String get frmEmail => 'ایمیل (اختیاری)';

  @override
  String get frmEmailHelper => 'امکان ایمیل کردن فاکتور یا صورت‌حساب به این مشتری را می‌دهد';

  @override
  String get frmSaveCustomer => 'ذخیره مشتری';

  @override
  String get frmEditSupplier => 'ویرایش تأمین‌کننده';

  @override
  String get frmSupplierName => 'نام تأمین‌کننده';

  @override
  String get frmSaveSupplier => 'ذخیره تأمین‌کننده';

  @override
  String get sdDeletePurchaseTitle => 'حذف خرید';

  @override
  String get sdDeletePurchaseBody => 'موجودی این خرید بازگردانده می‌شود. این کار قابل بازگشت نیست.';

  @override
  String get sdReturnToSupplier => 'برگشت به تأمین‌کننده';

  @override
  String get sdReturnHint => 'تعداد برگشتی هر کالا را مشخص کنید. برای نگه داشتن، ۰ بگذارید.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'علامت‌گذاری به‌عنوان دریافت‌شده انجام نشد: $detail';
  }

  @override
  String get sdMarkPaidQ => 'این خرید به‌عنوان پرداخت‌شده علامت بخورد؟';

  @override
  String get sdMarkUnpaidQ => 'این خرید به‌عنوان پرداخت‌نشده علامت بخورد؟';

  @override
  String get sdTotalPurchased => 'جمع خریدها';

  @override
  String get sdPayable => 'پرداختنی';

  @override
  String sdPayableAmount(String amount) {
    return '$amount پرداختنی';
  }

  @override
  String get sdNoPurchases => 'هنوز خریدی نیست';

  @override
  String get sdPo => 'سفارش';

  @override
  String get sdDraftPo => 'پیش‌نویس سفارش';

  @override
  String get sdPurchase => 'خرید';

  @override
  String get sdDraftNote => 'پیش‌نویس سفارش خرید — هنوز دریافت نشده، هنوز تغییری در موجودی یا هزینه نیست.';

  @override
  String get sdReturnNote => 'برگشت / بستانکاری به تأمین‌کننده.';

  @override
  String get sdMarkReceived => 'علامت‌گذاری به‌عنوان دریافت‌شده';

  @override
  String get sdEditPurchase => 'ویرایش خرید';

  @override
  String get sdPurchaseActions => 'اقدامات خرید';

  @override
  String get slDeleteSupplier => 'حذف تأمین‌کننده';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'حذف $count تأمین‌کننده',
      one: 'حذف ۱ تأمین‌کننده',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تأمین‌کننده و همه خریدهایشان حذف شود؟ این کار قابل بازگشت نیست.',
      one: '۱ تأمین‌کننده و همه خریدهایش حذف شود؟ این کار قابل بازگشت نیست.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV باید یک ردیف عنوان و دست‌کم یک تأمین‌کننده داشته باشد.';

  @override
  String get slImportTitle => 'درون‌ریزی تأمین‌کنندگان';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تأمین‌کننده در \"$file\" پیدا شد. همه درون‌ریزی شوند؟',
      one: '۱ تأمین‌کننده در \"$file\" پیدا شد. همه درون‌ریزی شوند؟',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تأمین‌کننده درون‌ریزی شد.',
      one: '۱ تأمین‌کننده درون‌ریزی شد.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'هنوز تأمین‌کننده‌ای نیست. برای افزودن، + را بزنید.';

  @override
  String get slSearchHint => 'جستجوی تأمین‌کننده یا تلفن...';

  @override
  String get slNoMatch => 'هیچ تأمین‌کننده‌ای با جستجوی شما مطابقت ندارد.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تأمین‌کننده',
      one: '۱ تأمین‌کننده',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'بدهی به تأمین‌کنندگان';

  @override
  String get sduNothingOwed => 'به تأمین‌کنندگان بدهی نداریم 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تأمین‌کننده طلبکار',
      one: '۱ تأمین‌کننده طلبکار',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days روز از قدیمی‌ترین خرید پرداخت‌نشده',
      one: '۱ روز از قدیمی‌ترین خرید پرداخت‌نشده',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '۰–۳۰ روز';

  @override
  String get duBucket1 => '۳۰–۶۰ روز';

  @override
  String get duBucket2 => '۶۰+ روز';

  @override
  String get duTitle => 'مرکز مطالبات';

  @override
  String get duNoDues => 'مطالبات معوقی نیست 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مشتری بدهکار',
      one: '۱ مشتری بدهکار',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days روز از قدیمی‌ترین صورت‌حساب پرداخت‌نشده',
      one: '۱ روز از قدیمی‌ترین صورت‌حساب پرداخت‌نشده',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount معوق';
  }

  @override
  String get cpNoOutstanding => 'این مشتری مانده معوقی ندارد';

  @override
  String get cpValidAmount => 'مبلغ معتبر وارد کنید';

  @override
  String cpExceeds(String amount) {
    return 'مبلغ از مانده معوق $amount بیشتر است';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$amount از $name دریافت شد';
  }

  @override
  String get cpOfflineSaved => 'آفلاین — پرداخت روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String cpOwes(String amount, String name) {
    return '$name مبلغ $amount بدهکار است. ابتدا روی قدیمی‌ترین صورت‌حساب(های) پرداخت‌نشده اعمال می‌شود.';
  }

  @override
  String get cpAmountLabel => 'مبلغ دریافتی (PKR)';

  @override
  String get cpCollect => 'دریافت';

  @override
  String get usNoItems => 'کالایی برای به‌روزرسانی نیست.';

  @override
  String get usHelp => 'موجودی جدید هر کالا را مشخص کنید، سپس «ذخیره همه» را بزنید.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  فعلی: $qty';
  }

  @override
  String usNew(String qty) {
    return 'جدید: $qty';
  }

  @override
  String get usSubtract => 'کم کردن ۱';

  @override
  String get usAdd => 'افزودن ۱';

  @override
  String get usNoChanges => 'بدون تغییر';

  @override
  String usSaveAll(int count) {
    return 'ذخیره همه ($count تغییر)';
  }

  @override
  String get srHint => 'جستجوی مشتری، کالا، مبلغ...';

  @override
  String get srFailed => 'جستجو ناموفق بود — اتصال خود را بررسی کنید.';

  @override
  String get srTitle => 'در فروشگاه خود جستجو کنید';

  @override
  String get srSubtitle => 'مشتریان را با نام یا تلفن و صورت‌حساب‌ها را با مبلغ پیدا کنید.';

  @override
  String srNoMatches(String query) {
    return 'نتیجه‌ای برای \"$query\" نیست';
  }

  @override
  String get srTryDifferent => 'نام، شماره تلفن یا مبلغ دیگری را امتحان کنید.';

  @override
  String get srBills => 'صورت‌حساب‌ها';

  @override
  String get srNoItemList => 'فهرست کالا نیست';

  @override
  String get abAddAtLeastOne => 'دست‌کم یک کالا اضافه کنید';

  @override
  String get abQuotationUpdated => 'پیش‌فاکتور به‌روزرسانی شد!';

  @override
  String get abBillUpdated => 'صورت‌حساب به‌روزرسانی شد!';

  @override
  String get abQuotationSaved => 'پیش‌فاکتور ذخیره شد!';

  @override
  String get abBillCreated => 'صورت‌حساب با موفقیت ثبت شد!';

  @override
  String abTotalAmount(String amount) {
    return 'جمع: $amount';
  }

  @override
  String get abShare => 'اشتراک‌گذاری';

  @override
  String get abDoneReturn => 'انجام شد و بازگشت';

  @override
  String get abOverLimitBody => 'این کار مشتری را از سقف اعتبارش فراتر می‌برد.';

  @override
  String get abOverLimitTitle => 'فراتر از سقف اعتبار';

  @override
  String get abBillAnyway => 'به‌هر حال صورت‌حساب شود';

  @override
  String get abOfflineBill => 'آفلاین — صورت‌حساب روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get abEditQuotation => 'ویرایش پیش‌فاکتور';

  @override
  String get abEditBill => 'ویرایش صورت‌حساب';

  @override
  String get abNewQuotation => 'پیش‌فاکتور جدید';

  @override
  String get abAddBill => 'افزودن صورت‌حساب';

  @override
  String get abCouldNotLoadItems => 'بارگذاری کالاها انجام نشد.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'این صورت‌حساب مانده مشتری را به $total می‌رساند که از سقف اعتبار $limit او بیشتر است.';
  }

  @override
  String get abTapAddItemBill => 'برای شروع صورت‌حساب، «افزودن کالا» را در پایین بزنید';

  @override
  String get abNoCatalog => 'هنوز کالایی در فهرست نیست';

  @override
  String get abScan => 'اسکن';

  @override
  String get abDiscountRs => 'تخفیف (روپیه)';

  @override
  String get abSubtotal => 'جمع جزء';

  @override
  String get abTotal => 'جمع کل';

  @override
  String get abSaveAsQuotation => 'ذخیره به‌عنوان پیش‌فاکتور';

  @override
  String get abQuotationLocked => 'صورت‌حساب موجود را نمی‌توان دوباره به پیش‌فاکتور تبدیل کرد';

  @override
  String get abQuotationNote => 'تا تبدیل به صورت‌حساب، موجودی کم نمی‌شود';

  @override
  String get abPaymentStatus => 'وضعیت پرداخت';

  @override
  String get abUnpaid => 'پرداخت‌نشده';

  @override
  String get abPaymentMethod => 'روش پرداخت';

  @override
  String get abCash => 'نقد';

  @override
  String get abBankTransfer => 'انتقال بانکی';

  @override
  String get abCheque => 'چک';

  @override
  String get abSaveQuotation => 'ذخیره پیش‌فاکتور';

  @override
  String get abSaveBill => 'ذخیره صورت‌حساب';

  @override
  String abAdded(String name) {
    return '$name اضافه شد';
  }

  @override
  String get apNewItem => 'کالای جدید…';

  @override
  String get apNewItemHint => 'ابتدا یک کالای جدید به فهرست اضافه کنید';

  @override
  String get apOfflinePurchase => 'آفلاین — خرید روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get apEditPo => 'ویرایش سفارش خرید';

  @override
  String get apNewPo => 'سفارش خرید جدید';

  @override
  String get apAddPurchase => 'افزودن خرید';

  @override
  String get apTapAddItem => 'برای شروع خرید، «افزودن کالا» را در پایین بزنید';

  @override
  String get apSaveAsPo => 'ذخیره به‌عنوان سفارش خرید';

  @override
  String get apPoLocked => 'خریدِ دریافت‌شده را نمی‌توان دوباره به سفارش پیش‌نویس تبدیل کرد';

  @override
  String get apPoNote => 'تا علامت‌گذاری کالا به‌عنوان دریافت‌شده، موجودی یا هزینه تغییر نمی‌کند';

  @override
  String get apUnpaidCredit => 'پرداخت‌نشده (اعتباری)';

  @override
  String get apSavePo => 'ذخیره سفارش خرید';

  @override
  String get apSavePurchase => 'ذخیره خرید';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'هزینه فعلی: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'هزینه‌ای تعیین نشده  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'اسکن ناموفق: خطای سرور $code';
  }

  @override
  String get scOfflineSaved => 'آفلاین — عکس ذخیره شد و با اتصال دوباره خودکار خوانده می‌شود';

  @override
  String get scStillOffline => 'هنوز آفلاین';

  @override
  String get scCouldNotCreateCustomer => 'مشتری ایجاد نشد — دوباره تلاش کنید.';

  @override
  String get scCouldNotCreateSupplier => 'تأمین‌کننده ایجاد نشد — دوباره تلاش کنید.';

  @override
  String scBillSavedFor(String name) {
    return 'صورت‌حساب برای $name ذخیره شد';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'خرید از $name ذخیره شد';
  }

  @override
  String get scWhichCustomer => 'این کدام مشتری است؟';

  @override
  String get scWhichSupplier => 'این کدام تأمین‌کننده است؟';

  @override
  String scClosestMatch(String name, int score) {
    return 'نزدیک‌ترین مورد موجود: $name ($score٪ شباهت)';
  }

  @override
  String scYesThisIs(String name) {
    return 'بله، این $name است';
  }

  @override
  String get scOtherwiseCustomer => 'در غیر این صورت مشتری جدید بسازید:';

  @override
  String get scOtherwiseSupplier => 'در غیر این صورت تأمین‌کننده جدید بسازید:';

  @override
  String get scNoMatchCustomer => 'مشتری مطابقی پیدا نشد. یک مورد جدید بسازید:';

  @override
  String get scNoMatchSupplier => 'تأمین‌کننده مطابقی پیدا نشد. یک مورد جدید بسازید:';

  @override
  String get scCustomerName => 'نام مشتری';

  @override
  String get scSupplierName => 'نام تأمین‌کننده';

  @override
  String get scCreateNew => 'ساختن مورد جدید';

  @override
  String get scTitleBill => 'اسکن صورت‌حساب';

  @override
  String get scIntroBill => 'از بل عکس بگیرید. دست‌نویس هم اشکالی ندارد، و سندی، اردو یا انگلیسی همه قابل‌خواندن‌اند. پیش از ذخیره می‌توانید آن را بررسی کنید.';

  @override
  String get scIntroPurchase => 'از فاکتور تأمین‌کننده عکس بگیرید. سندی، اردو یا انگلیسی همه قابل‌خواندن‌اند. پیش از ذخیره می‌توانید آن را بررسی کنید.';

  @override
  String get scReadingBill => 'در حال خواندن صورت‌حساب…';

  @override
  String get scScanBill => 'اسکن صورت‌حساب';

  @override
  String get scReadingInvoice => 'در حال خواندن فاکتور…';

  @override
  String get scScanInvoice => 'اسکن فاکتور';

  @override
  String get scQueued => 'اسکن‌های در صف';

  @override
  String get scReady => 'آماده بررسی';

  @override
  String get scFailed => 'ناموفق';

  @override
  String get scWaiting => 'در انتظار اتصال';

  @override
  String get scRetry => 'تلاش دوباره';

  @override
  String rpCouldNotLoad(String error) {
    return 'بارگذاری گزارش‌ها انجام نشد: $error';
  }

  @override
  String get rpHeadline => 'ارقام اصلی این ماه';

  @override
  String get rpProfitThisMonth => 'سود این ماه';

  @override
  String get rpNoData => 'هنوز داده‌ای نیست';

  @override
  String get rpSalesTax => 'مالیات فروش';

  @override
  String rpSalesTaxFor(String month) {
    return 'گزارش مالیات فروش $month';
  }

  @override
  String get rpViewSalesTax => 'مشاهده گزارش مالیات فروش';

  @override
  String get rpQuickReports => 'گزارش‌های سریع';

  @override
  String get rpQuickSub => 'مستقیم به یک گزارش مشخص بروید';

  @override
  String get expensesTitle => 'هزینه‌ها';

  @override
  String get rpRateCard => 'فهرست قیمت';

  @override
  String get rpDetails => 'جزئیات';

  @override
  String get rpDetailsSub => 'تفکیک کامل و رتبه‌بندی‌ها';

  @override
  String get rpOutstandingByCustomer => 'مطالبات به تفکیک مشتری';

  @override
  String get rpNoOutstanding => 'مانده معوقی نیست';

  @override
  String get rpMonthlyTotals => 'جمع ماهانه';

  @override
  String get rpMostSold => 'پرفروش‌ترین کالاها';

  @override
  String get rpNoItemsRecorded => 'هنوز کالایی ثبت نشده';

  @override
  String get rpTopCustomers => 'برترین مشتریان بر اساس درآمد';

  @override
  String get rpNoSalesRecorded => 'هنوز فروشی ثبت نشده';

  @override
  String get rpTotalOutstanding => 'جمع معوق';

  @override
  String get rpViewCustomers => 'مشاهده مشتریان';

  @override
  String get lblInvoice => 'فاکتور';

  @override
  String get lblLedger => 'دفتر حساب';

  @override
  String get lblRateCard => 'فهرست قیمت';

  @override
  String get exCsvNeedsRows => 'CSV باید یک ردیف عنوان و دست‌کم یک هزینه داشته باشد.';

  @override
  String get exCsvHeader => 'سرستون CSV باید ستون‌های \"description\" و \"amount\" را داشته باشد.';

  @override
  String exLineBadAmount(int line) {
    return 'خط $line: توضیح وجود ندارد یا مبلغ نامعتبر است — فایل را اصلاح کنید و دوباره تلاش کنید.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'خط $line: تاریخ نامعتبر \"$date\" — از YYYY-MM-DD استفاده کنید.';
  }

  @override
  String get exImportTitle => 'درون‌ریزی هزینه‌ها';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count هزینه در \"$file\" پیدا شد. همه درون‌ریزی شوند؟',
      one: '۱ هزینه در \"$file\" پیدا شد. همه درون‌ریزی شوند؟',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count هزینه درون‌ریزی شد.',
      one: '۱ هزینه درون‌ریزی شد.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'درون‌ریزی ناموفق: خطای سرور $code';
  }

  @override
  String get exDeleteTitle => 'حذف هزینه';

  @override
  String get exAdd => 'افزودن هزینه';

  @override
  String get exEdit => 'ویرایش هزینه';

  @override
  String get exDescription => 'توضیح';

  @override
  String get exAmountRs => 'مبلغ (روپیه)';

  @override
  String get exCategory => 'دسته';

  @override
  String exDate(String date) {
    return 'تاریخ: $date';
  }

  @override
  String get exRepeats => 'تکرار ماهانه';

  @override
  String get exRepeatsHint => 'اجاره، برق، دستمزد و غیره';

  @override
  String get exReceiptTap => 'عکس رسید، برای تغییر ضربه بزنید';

  @override
  String get exReceiptOptional => 'عکس رسید (اختیاری)';

  @override
  String get exEnterValid => 'یک توضیح و مبلغ معتبر وارد کنید.';

  @override
  String get exOffline => 'آفلاین — هزینه روی این دستگاه ذخیره شد و با اتصال دوباره به‌صورت خودکار همگام می‌شود';

  @override
  String get exSave => 'ذخیره هزینه';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count هزینه تکرارشونده در این ماه سررسید است',
      one: '۱ هزینه تکرارشونده در این ماه سررسید است',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'افزودن';

  @override
  String get exTotal => 'جمع هزینه‌ها';

  @override
  String exCategoryChip(String name) {
    return 'دسته: $name';
  }

  @override
  String get exNoneLogged => 'هنوز هزینه‌ای ثبت نشده';

  @override
  String exNoneInCategory(String name) {
    return 'هنوز هزینه‌ای برای $name نیست';
  }

  @override
  String get exViewReceipt => 'مشاهده رسید';

  @override
  String get exEditRow => 'ویرایش هزینه';

  @override
  String get exDeleteRow => 'حذف هزینه';

  @override
  String gstServerReturned(String first, String second) {
    return 'سرور $first/$second برگرداند';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'بارگذاری داده‌های GST انجام نشد: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'دانلود ناموفق ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename ذخیره شد';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'در دانلودها/$filename ذخیره شد';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'دانلود انجام نشد: $error';
  }

  @override
  String get gstTitle => 'گزارش مالیات فروش';

  @override
  String get gstOutwardDetail => 'فروش خروجی — جزئیات فاکتورها';

  @override
  String get gstNoBills => 'برای این ماه صورت‌حسابی نیست.';

  @override
  String get gstHsn => 'خلاصه HSN';

  @override
  String get gstInvoiceWise => 'جزئیات به تفکیک فاکتور';

  @override
  String get gstMonthly => 'خلاصه ماهانه';

  @override
  String get gstOutwardTaxable => 'تأمین‌های خروجی مشمول مالیات';

  @override
  String get gstItc => 'اعتبار مالیات ورودی (از خریدها)';

  @override
  String get gstSave => 'ذخیره';

  @override
  String get rcValidAmount => 'مبلغ معتبر وارد کنید.';

  @override
  String get rcExpected => 'نقد مورد انتظار (فروش نقدی امروز)';

  @override
  String get rcAlsoCollected => 'امروز نیز دریافت شد (در کشو شمرده نشده)';

  @override
  String get rcCounted => 'نقد شمرده‌شده در کشو (روپیه)';

  @override
  String get rcCompare => 'مقایسه';

  @override
  String get rcMatches => 'دقیقاً مطابق است!';

  @override
  String rcExtra(String amount) {
    return '$amount اضافه در کشو';
  }

  @override
  String rcMissing(String amount) {
    return '$amount کسری در کشو';
  }

  @override
  String get pbiTitle => 'سود به تفکیک کالا';

  @override
  String get pbiNoSales => 'هنوز فروشی نیست';

  @override
  String get pbiByCategory => 'به تفکیک دسته';

  @override
  String get pbiItemsByProfit => 'کالاها بر اساس سود';

  @override
  String get svTitle => 'ارزش موجودی';

  @override
  String get svNone => 'موجودی‌ای نیست';

  @override
  String get svItemsByValue => 'کالاها بر اساس ارزش';

  @override
  String svSummary(String items, String units) {
    return '$items کالا · $units واحد روی قفسه';
  }

  @override
  String svTied(String amount) {
    return '$amount در موجودی بلوکه شده';
  }

  @override
  String get svEstimated => 'برآورد از قیمت فروش';

  @override
  String get bkRestoreTitle => 'بازیابی نسخه پشتیبان؟';

  @override
  String bkRestoreBody(String filename) {
    return 'این کار همه داده‌های فعلی را با فایل پشتیبان \"$filename\" جایگزین می‌کند. ادامه می‌دهید؟';
  }

  @override
  String get bkRestore => 'بازیابی';

  @override
  String get bkRestoreDoneTitle => 'بازیابی کامل شد';

  @override
  String get bkRestoreDoneBody => 'داده‌های شما بازیابی شد.';

  @override
  String get bkOk => 'تأیید';

  @override
  String bkRestoreFailed(String detail) {
    return 'بازیابی ناموفق: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'بازیابی انجام نشد: $error';
  }

  @override
  String get bkSaveToDownloads => 'ذخیره در دانلودها';

  @override
  String get bkIntroAdmin => 'همه داده‌های شما در یک فایل پایگاه داده است. مرتب یک نسخه دانلود کنید و اگر مشکلی پیش آمد بازیابی کنید.';

  @override
  String get bkIntroStaff => 'پشتیبان‌گیری و بازیابی کامل پایگاه داده فقط برای مدیر است. از مدیر بخواهید، یا آنچه لازم دارید را در پایین با CSV صادر کنید.';

  @override
  String get bkBackupDb => 'پشتیبان پایگاه داده';

  @override
  String get bkBackupDbSub => 'کل پایگاه داده را در یک فایل دانلود و به اشتراک بگذارید (واتس‌اپ، درایو، ایمیل).';

  @override
  String get bkDownloadPhone => 'دانلود پشتیبان در گوشی';

  @override
  String get bkShareBackup => 'اشتراک‌گذاری پشتیبان';

  @override
  String get bkAutoTitle => 'پشتیبان‌گیری خودکار';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count پشتیبان روزانه روی سرور ذخیره است، جدیدترین مربوط به $time. خودکار اجرا می‌شود — اینجا کاری لازم نیست.',
      one: '۱ پشتیبان روزانه روی سرور ذخیره است، جدیدترین مربوط به $time. خودکار اجرا می‌شود — اینجا کاری لازم نیست.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'برای جایگزینی داده‌های فعلی، یک فایل پشتیبان ذخیره‌شده را انتخاب کنید.';

  @override
  String get bkRestoreFromFile => 'بازیابی از فایل پشتیبان';

  @override
  String get bkExportCsv => 'صدور به CSV';

  @override
  String get bkExportSub => 'این‌ها را در اکسل باز کنید یا به اشتراک بگذارید.';

  @override
  String get bkRangeAll => 'صورت‌حساب‌ها/هزینه‌ها: کل زمان';

  @override
  String bkRangeSome(String end, String start) {
    return 'صورت‌حساب‌ها/هزینه‌ها: از $start تا $end';
  }

  @override
  String get bkSetRange => 'تعیین بازه';

  @override
  String get bkClearRange => 'پاک کردن بازه';

  @override
  String get ntNever => 'هرگز اجرا نشده';

  @override
  String get ntJustNow => 'همین الآن';

  @override
  String ntMinutesAgo(int count) {
    return '$count دقیقه پیش';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count ساعت پیش';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count روز پیش';
  }

  @override
  String get ntTitle => 'اعلان‌های هوشمند';

  @override
  String get ntTapHint => 'برای اجرای یک اعلان و دیدن نتایج زنده، «بررسی اکنون» را بزنید.';

  @override
  String get ntLowStockSub => 'وقتی کالاها زیر سطح سفارش مجدد رفتند اطلاع بده.';

  @override
  String get ntCheckNow => 'بررسی اکنون';

  @override
  String get ntOverdue => 'یادآوری پرداخت‌های معوق';

  @override
  String get ntOverdueSub => 'درباره صورت‌حساب‌های پرداخت‌نشده روزهای قبل اطلاع بده.';

  @override
  String get ntDaily => 'خلاصه روزانه کسب‌وکار';

  @override
  String get ntDailySub => 'فروش، دریافتی و سود دیروز در یک نگاه.';

  @override
  String get ntSendSummary => 'ارسال خلاصه';

  @override
  String get ntRunning => 'در حال اجرا…';

  @override
  String get ntLowStockItems => 'کالاهای با موجودی کم';

  @override
  String get ntSales => 'فروش';

  @override
  String get ntCollected => 'دریافتی';

  @override
  String get ntProfit => 'سود';

  @override
  String get auChecking => 'در حال بررسی به‌روزرسانی‌ها…';

  @override
  String get auLatest => 'آخرین نسخه را دارید.';

  @override
  String get auAvailable => 'به‌روزرسانی موجود است';

  @override
  String auNewer(int code) {
    return 'نسخه جدیدتر Book-Keep (بیلد $code) آماده است.';
  }

  @override
  String get auLater => 'بعداً';

  @override
  String get auUpdate => 'به‌روزرسانی';

  @override
  String get auDownloading => 'در حال دانلود به‌روزرسانی';

  @override
  String auSaved(String name) {
    return '$name در پوشه دانلودهای شما ذخیره شد.';
  }

  @override
  String get auAllowInstall => 'به Book-Keep اجازه نصب برنامه بدهید، سپس دوباره «به‌روزرسانی» را بزنید.';

  @override
  String get auFailed => 'به‌روزرسانی انجام نشد — اتصال خود را بررسی کنید و دوباره تلاش کنید.';

  @override
  String get lgSearch => 'جستجوی زبان‌ها';

  @override
  String lgNoMatch(String query) {
    return 'هیچ زبانی با \"$query\" مطابقت ندارد';
  }

  @override
  String get alVoided => 'صورت‌حسابی را باطل کرد';

  @override
  String get alDeletedBill => 'صورت‌حسابی را حذف کرد';

  @override
  String get alReturned => 'صورت‌حسابی را برگرداند';

  @override
  String get alDeletedCustomer => 'مشتری‌ای را حذف کرد';

  @override
  String get alDeletedSupplier => 'تأمین‌کننده‌ای را حذف کرد';

  @override
  String get alCreatedAccount => 'حسابی ایجاد کرد';

  @override
  String get alUpdatedAccount => 'حسابی را به‌روزرسانی کرد';

  @override
  String get alDeletedAccount => 'حسابی را حذف کرد';

  @override
  String get alTitle => 'گزارش فعالیت';

  @override
  String get alNone => 'هنوز فعالیتی ثبت نشده';

  @override
  String get blkEnterOne => 'دست‌کم یک کالا وارد کنید';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count کالا با موفقیت اضافه شد',
      one: '۱ کالا با موفقیت اضافه شد',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'افزودن گروهی کالاها';

  @override
  String get blkFormat => 'هر خط یک کالا، قالب: نام، قیمت، واحد، دسته';

  @override
  String get blkOptional => 'واحد و دسته اختیاری هستند (پیش‌فرض: piece، بدون دسته)';

  @override
  String get blkAddAll => 'افزودن همه کالاها';

  @override
  String get prSend => 'ارسال یادآوری پرداخت';

  @override
  String get prTone => 'لحن را انتخاب کنید:';

  @override
  String get prPolite => 'مؤدبانه';

  @override
  String get prStandard => 'معمولی';

  @override
  String get prUrgent => 'فوری';

  @override
  String get prPreviewQr => 'پیش‌نمایش QR پرداخت جاز‌کش';

  @override
  String get prShareText => 'اشتراک‌گذاری متن';

  @override
  String get dsRemaining => 'باقی‌مانده';

  @override
  String dsIncludesDiscount(String amount) {
    return 'شامل $amount تخفیف';
  }

  @override
  String get dsItems => 'کالاها';

  @override
  String get dsDiscount => 'تخفیف';

  @override
  String get lkWrongPin => 'رمز PIN نادرست';

  @override
  String get lkEnterPin => 'رمز PIN را وارد کنید';

  @override
  String get lkChecking => 'در حال بررسی اثر انگشت...';

  @override
  String get bcTitle => 'اسکن بارکد';

  @override
  String get bcTorchNa => 'چراغ‌قوه در این دستگاه موجود نیست';

  @override
  String get bcTorch => 'چراغ‌قوه';

  @override
  String get bcPoint => 'دوربین را به سمت بارکد بگیرید';

  @override
  String get qrNoNumber => 'شماره جاز‌کش تنظیم نشده است. برای نمایش QR پرداخت آن را در تنظیمات وارد کنید.';

  @override
  String get qrPay => 'پرداخت با جاز‌کش';

  @override
  String get qrInvalid => 'داده QR نامعتبر';

  @override
  String qrAmount(String amount) {
    return 'مبلغ: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'جاز‌کش: $number';
  }

  @override
  String get qrCopy => 'کپی شماره جاز‌کش';

  @override
  String get qrCopied => 'شماره جاز‌کش در کلیپ‌بورد کپی شد';

  @override
  String get qrHint => 'برای پرداخت، این شماره را در برنامه جاز‌کش خود اسکن یا کپی کنید.';

  @override
  String clOwed(String amount) {
    return '$amount معوق';
  }

  @override
  String get lnEnterEmailFirst => 'ابتدا در بالا یک ایمیل معتبر وارد کنید.';

  @override
  String get lnResetSent => 'ایمیل بازنشانی گذرواژه ارسال شد — صندوق ورودی خود را بررسی کنید.';

  @override
  String get lnNoAccount => 'حسابی برای این ایمیل پیدا نشد.';

  @override
  String get lnWrongPassword => 'گذرواژه نادرست است.';

  @override
  String get lnInvalidEmail => 'این نشانی ایمیل معتبر به نظر نمی‌رسد.';

  @override
  String get lnDisabled => 'این حساب غیرفعال شده است.';

  @override
  String get lnTooMany => 'تلاش‌های زیاد — یک دقیقه دیگر دوباره تلاش کنید.';

  @override
  String get lnNoInternet => 'اتصال اینترنت وجود ندارد.';

  @override
  String get lnWeakPassword => 'گذرواژه باید حداقل ۶ نویسه باشد.';

  @override
  String get lnCouldNotSignIn => 'ورود انجام نشد. لطفاً دوباره تلاش کنید.';

  @override
  String get lnWrongPasswordHint => 'گذرواژه نادرست است. دوباره تلاش کنید یا «گذرواژه را فراموش کرده‌اید؟» را بزنید.';

  @override
  String get lnWrongEmail => 'ایمیل نادرست است — هیچ حسابی با این نشانی نیست.';

  @override
  String get lnWrongEmailOrPassword => 'ایمیل یا گذرواژه نادرست است.';

  @override
  String get lnWrongUsername => 'نام کاربری نادرست است — هیچ حسابی با این نام نیست.';

  @override
  String get lnWelcome => 'خوش برگشتید';

  @override
  String lnSignInTo(String app) {
    return 'ورود به $app';
  }

  @override
  String get lnEmailOrUsername => 'ایمیل یا نام کاربری';

  @override
  String get lnRemember => 'مرا به خاطر بسپار';

  @override
  String get lnForgot => 'گذرواژه را فراموش کرده‌اید؟';

  @override
  String get lnSignIn => 'ورود';

  @override
  String get lnGoogle => 'ادامه با Google';

  @override
  String get lnNew => 'تازه‌وارد هستید؟';

  @override
  String get lnCreate => 'ایجاد حساب';

  @override
  String suCreated(String email) {
    return 'حساب برای $email ایجاد شد. ایمیل تأیید ارسال شد (اختیاری).';
  }

  @override
  String suSetup(String app) {
    return 'راه‌اندازی $app';
  }

  @override
  String get suName => 'نام';

  @override
  String get suEmail => 'ایمیل';

  @override
  String suPhoneDigits(int digits) {
    return 'یک شماره معتبر $digits رقمی وارد کنید';
  }

  @override
  String get suCreateBtn => 'ایجاد حساب';

  @override
  String get suHaveAccount => 'قبلاً حساب دارید؟';

  @override
  String get suAlreadyExists => 'حسابی با این ایمیل از قبل وجود دارد.';

  @override
  String get suInvalidEmail => 'نشانی ایمیل نامعتبر است.';

  @override
  String get agShow => 'نمایش گذرواژه';

  @override
  String get agHide => 'پنهان کردن گذرواژه';

  @override
  String get adAccounts => 'حساب‌ها';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count حساب ثبت‌شده',
      one: '۱ حساب ثبت‌شده',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'افزودن';

  @override
  String get adNoAccounts => 'حسابی پیدا نشد.';

  @override
  String get adAccountability => 'پاسخ‌گویی';

  @override
  String get adAccountabilitySub => 'چه کسی چیزی را باطل، حذف یا برگشت کرده، و تغییرات حساب‌ها.';

  @override
  String get adActivitySub => 'صورت‌حساب‌های باطل‌شده، حذف‌ها، تغییرات حساب';

  @override
  String get adServer => 'سرور';

  @override
  String get adServerSub => 'این برنامه با چه کسی ارتباط دارد. بعد از راه‌اندازی به‌ندرت نیاز به تغییر دارد.';

  @override
  String get adServerHint => 'شبیه‌ساز از 10.0.2.2 استفاده می‌کند؛ گوشی واقعی به IP لپ‌تاپ روی همان وای‌فای نیاز دارد. تغییر آن روی همه حساب‌ها اثر می‌گذارد.';

  @override
  String get adApiBase => 'نشانی پایه API';

  @override
  String get adSaveServer => 'ذخیره نشانی سرور';

  @override
  String get adEmailSetSub => 'راه‌اندازی شده — کارکنان می‌توانند فاکتور/صورت‌حساب را برای مشتریان ایمیل کنند.';

  @override
  String get adNotSetUp => 'هنوز راه‌اندازی نشده است.';

  @override
  String get adEmailSetBody => 'ایمیل راه‌اندازی شده است. کارکنان می‌توانند مستقیماً فاکتور یا صورت‌حساب را برای مشتری ایمیل کنند.';

  @override
  String get adEmailHelp => 'نشانی Gmail با گذرواژه برنامه کار می‌کند (smtp.gmail.com، پورت 587)، یا از مشخصات SMTP ارائه‌دهنده ایمیل خود استفاده کنید.';

  @override
  String get adSmtpHost => 'میزبان SMTP';

  @override
  String get adSmtpPort => 'پورت SMTP';

  @override
  String get adEmailAddress => 'نشانی ایمیل';

  @override
  String get adPwKeep => 'گذرواژه (برای حفظ گذرواژه فعلی خالی بگذارید)';

  @override
  String get adPwApp => 'گذرواژه (گذرواژه برنامه، نه گذرواژه ورود)';

  @override
  String get adFromName => 'نام فرستنده (اختیاری)';

  @override
  String get adFromHint => 'فروشگاه ابزار من';

  @override
  String get adSaving => 'در حال ذخیره...';

  @override
  String get adSaveEmail => 'ذخیره تنظیمات ایمیل';

  @override
  String get adAddAccount => 'افزودن حساب';

  @override
  String get adNameOpt => 'نام (اختیاری)';

  @override
  String get adAtLeast6 => 'حداقل ۶ نویسه';

  @override
  String get adGrantAdmin => 'دادن دسترسی مدیر';

  @override
  String get adCanManage => 'می‌تواند باطل/حذف/برگشت کند';

  @override
  String get adCanManageHint => 'باطل یا حذف صورت‌حساب، برگشت صورت‌حساب، یا حذف مشتری/تأمین‌کننده. مدیر همیشه این اختیار را دارد.';

  @override
  String get adCreate => 'ایجاد';

  @override
  String get adAccountCreated => 'حساب ایجاد شد.';

  @override
  String adCreateFailed(String error) {
    return 'ایجاد ناموفق: $error';
  }

  @override
  String get adEditAccount => 'ویرایش حساب';

  @override
  String get adAdminSwitch => 'مدیر';

  @override
  String get adAdminHint => 'می‌تواند پنل مدیریت را باز کند';

  @override
  String get adDisabled => 'غیرفعال';

  @override
  String get adDisabledHint => 'از ورود منع شده';

  @override
  String get adAccountUpdated => 'حساب به‌روزرسانی شد.';

  @override
  String adUpdateFailed(String error) {
    return 'به‌روزرسانی ناموفق: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label برای همیشه حذف می‌شود و دیگر نمی‌تواند وارد شود.';
  }

  @override
  String get adAccountDeleted => 'حساب حذف شد.';

  @override
  String adDeleteFailed(String error) {
    return 'حذف ناموفق: $error';
  }

  @override
  String get adBadgeAdmin => 'مدیر';

  @override
  String get adBadgeDisabled => 'غیرفعال';

  @override
  String get adOff => 'پنل مدیریت خاموش است';

  @override
  String get adCheckAgain => 'بررسی دوباره';

  @override
  String get adAccessRequired => 'دسترسی مدیر لازم است';

  @override
  String get adAccessBody => 'فقط مدیران فروشگاه می‌توانند حساب‌ها را مدیریت کنند. از صاحب فروشگاه بخواهید دسترسی مدیر به شما بدهد.';

  @override
  String get adCouldNotLoad => 'بارگذاری پنل مدیریت انجام نشد.';

  @override
  String get adBadPort => 'یک شماره پورت SMTP معتبر وارد کنید.';

  @override
  String get adEmailSaved => 'تنظیمات ایمیل ذخیره شد.';

  @override
  String adEmailSaveFailed(String error) {
    return 'تنظیمات ایمیل ذخیره نشد: $error';
  }

  @override
  String get adServerEmpty => 'نشانی سرور نمی‌تواند خالی باشد.';

  @override
  String get adServerSaved => 'نشانی سرور ذخیره شد. صفحه‌ها در بارگذاری بعدی از آن استفاده می‌کنند.';

  @override
  String get lnOr => 'یا';

  @override
  String get scNotABill => 'این شبیه بل نیست. دوباره با یک عکس واضح از بل تلاش کنید.';

  @override
  String get scNotAnInvoice => 'این شبیه فاکتور نیست. دوباره با یک عکس واضح از فاکتور تأمین‌کننده تلاش کنید.';

  @override
  String get jqOpenFull => 'اندازه کامل';

  @override
  String get jqCopy => 'کپی شماره';

  @override
  String get jqSheetTitle => 'QR جاز‌کش';

  @override
  String get jqSheetHint => 'مشتری‌ها برای پرداخت به شما، این را در برنامه جاز‌کش خود اسکن می‌کنند.';

  @override
  String get jqCheck => 'شماره را بررسی کنید';

  @override
  String get askVoice => 'صدا';

  @override
  String get askVoiceFallbackNote => 'این متن با صدای گوشی شما خوانده می‌شود.';

  @override
  String get askPace => 'سرعت';

  @override
  String get askTone => 'لحن';

  @override
  String get askPaceSlower => 'آهسته‌تر';

  @override
  String get askPaceNormal => 'معمولی';

  @override
  String get askPaceFaster => 'سریع‌تر';

  @override
  String get askToneCalm => 'آرام';

  @override
  String get askToneWarm => 'گرم';

  @override
  String get askToneCheerful => 'شاد';

  @override
  String qPaymentUpdate(String amount) {
    return 'به‌روزرسانی پرداخت: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'مشتری: $name';
  }

  @override
  String qSupplier(String name) {
    return 'تأمین‌کننده: $name';
  }

  @override
  String qItem(String name) {
    return 'کالا: $name';
  }

  @override
  String qExpense(String name) {
    return 'هزینه: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'خرید: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'پرداخت دریافت شد: $amount از $name';
  }

  @override
  String gstAmount(String amount) {
    return 'مالیات $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'مشمول مالیات $taxable  ·  مالیات $tax  ·  جمع $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'درآمد: $revenue  •  بهای تمام‌شده: $cogs  •  هزینه‌ها: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'سلام $customer، درود از طرف $shop! مانده بدهی شما $amount است. سپاسگزاریم!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'سلام $customer، یادآوری پرداخت از $shop برای مانده معوق $amount. لطفاً در اولین فرصت پرداخت کنید.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'اطلاعیه فوری: $customer گرامی، پرداخت معوق شما به مبلغ $amount نزد $shop هنوز انجام نشده است. لطفاً فوراً تسویه کنید.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'پرداخت از طریق JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'فاکتور از $shop\nجمع: $total\nاقلام: $items\nوضعیت: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'سلام $supplier، $shop هستم. می‌خواهیم این اقلام را سفارش دهیم:\n$lines\n\nلطفاً موجودی و قیمت را تأیید کنید. سپاس.';
  }

  @override
  String ppUpdated(String date) {
    return 'آخرین به‌روزرسانی: $date';
  }

  @override
  String get ppWhoH => 'ما کی هستیم';

  @override
  String ppWho(String owner, String email) {
    return '$owner، اداره‌کنندهٔ Book-keep.\nتماس: $email';
  }

  @override
  String get ppCollectH => 'چه چیزهایی را جمع‌آوری می‌کنیم';

  @override
  String get ppCollectAccount => 'حساب: ایمیل، شمارهٔ تلفن و نام کاربری، از طریق Firebase Authentication.';

  @override
  String get ppCollectShop => 'مشخصات فروشگاه: نام فروشگاه، نشانی، شمارهٔ تلفن، شمارهٔ JazzCash و لوگوی فروشگاه که صاحب فروشگاه در تنظیمات وارد می‌کند.';

  @override
  String get ppCollectRecords => 'سوابق کسب‌وکار که شما ایجاد می‌کنید: نام و شمارهٔ تلفن مشتریان و تأمین‌کنندگان، صورتحساب‌ها، خریدها، فهرست کالاها (شامل عکس کالا و بارکد) و هزینه‌ها (شامل عکس رسید). این داده‌های اصلی برنامه است — حسابداری همین‌طور کار می‌کند.';

  @override
  String get ppCollectDevice => 'داده‌های دستگاه و عیب‌یابی: توکن اعلان فوری (برای هشدار کمبود موجودی، پرداخت‌های معوق و خلاصهٔ روزانه) و گزارش خرابی (اطلاعات دستگاه و ردیابی خطا) از طریق Firebase Crashlytics که هنگام خرابی برنامه خودکار ارسال می‌شود.';

  @override
  String ppCollectAi(String askShop) {
    return 'قابلیت‌های هوش مصنوعی: $askShop، گزارش صبحگاهی هوش مصنوعی و اسکنر صورتحساب/خرید هوش مصنوعی، تصویری از داده‌های مرتبط کسب‌وکار (ارقام گزارش یا عکس یک صورتحساب) را برای تولید پاسخ، خلاصه یا اقلام استخراج‌شده به Gemini API گوگل می‌فرستند. گوگل این داده‌ها را برای تولید پاسخ پردازش می‌کند؛ ما و گوگل از آن‌ها برای آموزش مدل‌ها فراتر از شرایط استاندارد API گوگل استفاده نمی‌کنیم.';
  }

  @override
  String get ppDontH => 'کارهایی که نمی‌کنیم';

  @override
  String get ppDontLocation => 'موقعیت مکانی شما را ردیابی نمی‌کنیم.';

  @override
  String get ppDontAds => 'از شبکه‌های تبلیغاتی یا ابزارهای تحلیل رفتار و ضبط نشست استفاده نمی‌کنیم.';

  @override
  String get ppDontSell => 'داده‌های شما یا مشتریانتان را به هیچ‌کس نمی‌فروشیم.';

  @override
  String get ppWhereH => 'داده‌ها کجا نگهداری می‌شوند';

  @override
  String get ppWhereDb => 'پایگاه داده: Neon (Postgres)، ارائه‌دهندهٔ خارجی پایگاه دادهٔ ابری.';

  @override
  String get ppWhereFirebase => 'احراز هویت، اعلان فوری، گزارش خرابی، ذخیرهٔ عکس: Firebase (Google).';

  @override
  String get ppWhereAi => 'پردازش هوش مصنوعی: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'ایمیل صورتحساب: از طریق حساب SMTP ای ارسال می‌شود که مدیر فروشگاه شما در $adminPanel تنظیم می‌کند. ما فهرست پستی نداریم؛ این ایمیل‌ها صورتحساب/گزارش تک‌به‌تک برای مشتریان خود شما هستند، نه بازاریابی انبوه.';
  }

  @override
  String get ppYoursH => 'داده‌های شما، داده‌های مشتریانتان';

  @override
  String get ppYours => 'هرچه وارد می‌کنید — مشتریان، تأمین‌کنندگان، صورتحساب‌ها، کالاها — متعلق به فروشگاه شماست. فروشگاه‌های دیگری که از Book-keep استفاده می‌کنند آن را نمی‌بینند. حساب‌های کارکنانی که می‌سازید فقط آنچه را که اجازه می‌دهید می‌بینند.';

  @override
  String get ppControlsH => 'کنترل‌های شما';

  @override
  String ppControlExport(String path) {
    return 'برون‌بری یا پشتیبان‌گیری از داده‌ها: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'حذف حساب: $path. این کار فقط اطلاعات ورود شما را حذف می‌کند و سوابق کسب‌وکار فروشگاه (صورتحساب‌ها، مشتریان، کالاها و غیره) را پاک نمی‌کند، همان‌طور که حذف یک کارمند سوابقی را که ساخته پاک نمی‌کند.';
  }

  @override
  String ppControlNotif(String path) {
    return 'اعلان‌ها: را می‌توان بر اساس نوع در $path خاموش کرد.';
  }

  @override
  String get ppChildrenH => 'کودکان';

  @override
  String get ppChildren => 'Book-keep ابزاری کاری برای صاحبان فروشگاه و کارکنان است. این برنامه برای کودکان نیست و آگاهانه توسط آن‌ها استفاده نمی‌شود.';

  @override
  String get ppChangesH => 'تغییرات این سیاست';

  @override
  String get ppChanges => 'اگر آنچه جمع‌آوری می‌کنیم یا مقصد آن تغییر کند، این صفحه را به‌روز و تاریخ بالا را عوض می‌کنیم.';

  @override
  String get ppContactH => 'تماس';

  @override
  String ppContact(String email) {
    return 'پرسش دربارهٔ این سیاست یا داده‌های شما: $email';
  }

  @override
  String get waHello => 'سلام!';

  @override
  String waHelloNamed(String name) {
    return 'سلام $name،';
  }

  @override
  String get gstTaxable => 'مشمول مالیات';

  @override
  String get gstTax => 'مالیات';

  @override
  String get gstTaxableValue => 'ارزش مشمول مالیات';

  @override
  String get gstTotalTax => 'مجموع مالیات';

  @override
  String get gstTotalItc => 'مجموع اعتبار مالیات ورودی';

  @override
  String get gstExempt => 'فروش معاف';

  @override
  String get gstNetPayable => 'خالص مالیات قابل پرداخت';

  @override
  String get unknownName => 'ناشناس';

  @override
  String get unitPiece => 'عدد';

  @override
  String get unitKg => 'کیلوگرم';

  @override
  String get unitMeter => 'متر';

  @override
  String get unitBox => 'جعبه';

  @override
  String get unitDozen => 'دوجین';

  @override
  String get unitLiter => 'لیتر';

  @override
  String get unitBag => 'کیسه';

  @override
  String deleteSupplierMessage(String name) {
    return '$name و همهٔ خریدهای او حذف شود؟ این کار قابل بازگشت نیست.';
  }
}
