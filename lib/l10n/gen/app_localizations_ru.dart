// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get navHome => 'Главная';

  @override
  String get navCustomers => 'Клиенты';

  @override
  String get navItems => 'Товары';

  @override
  String get navSuppliers => 'Поставщики';

  @override
  String get navReports => 'Отчёты';

  @override
  String get navSettings => 'Настройки';

  @override
  String get settingsShopDetailsTitle => 'Данные Магазина';

  @override
  String get settingsShopDetailsSubtitle => 'Отображается на ваших счетах.';

  @override
  String get settingsShopNameLabel => 'Название Магазина';

  @override
  String get settingsShopAddressLabel => 'Адрес Магазина';

  @override
  String get settingsPhoneLabel => 'Телефон';

  @override
  String get settingsSaveShopDetails => 'Сохранить Данные Магазина';

  @override
  String get settingsAppearanceTitle => 'Внешний вид';

  @override
  String get settingsAppearanceSubtitle => 'Выберите тему для всего приложения.';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get themeSystem => 'Системная';

  @override
  String get settingsLanguageTitle => 'Язык';

  @override
  String get settingsLanguageSubtitle => 'Выберите язык интерфейса приложения.';

  @override
  String get sortNameNewest => 'Сортировка: имя / новые';

  @override
  String get addCustomer => 'Добавить клиента';

  @override
  String get importCsv => 'Импорт CSV';

  @override
  String get searchShop => 'Поиск по магазину';

  @override
  String get scanToFindItem => 'Сканировать, чтобы найти товар';

  @override
  String get bulkAdd => 'Массовое добавление';

  @override
  String get updateStock => 'Обновить остатки';

  @override
  String get printLabels => 'Печать этикеток';

  @override
  String get mergeDuplicates => 'Объединить дубликаты';

  @override
  String get addSupplier => 'Добавить поставщика';

  @override
  String get scanPurchaseInvoice => 'Сканировать накладную';

  @override
  String askNoAnswer(String reason) {
    return 'Не удалось получить ответ: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Не удалось подключиться: $error';
  }

  @override
  String get micPermissionNeeded => 'Для голосового ввода нужно разрешение на микрофон.';

  @override
  String get speechUnavailable => 'Распознавание речи недоступно на этом устройстве.';

  @override
  String get askYourShop => 'Спросите свой магазин';

  @override
  String get close => 'Закрыть';

  @override
  String get askIntro => 'Хотите узнать, как идут дела в магазине? Спросите меня — отвечу по вашим книгам.';

  @override
  String get askListening => 'Слушаю…';

  @override
  String get askThinkingWords => 'Думаю…|Работаю над этим…|Считаю…|Проверяю записи…|Складываю…|Разбираю цифры…';

  @override
  String get askSayQuestion => 'Произнесите вопрос — нажмите на шар, чтобы отменить';

  @override
  String briefingRefreshFailed(int code) {
    return 'Не удалось обновить сводку ($code).';
  }

  @override
  String get refreshFailedOffline => 'Не удалось обновить — проверьте подключение.';

  @override
  String get newBillFailed => 'Не удалось начать новый счёт — проверьте подключение и повторите.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Сначала укажите основного поставщика для $name (нажмите, чтобы изменить).';
  }

  @override
  String get reorderBySupplier => 'Дозаказ по поставщику';

  @override
  String get supplier => 'Поставщик';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count товара',
      many: '$count товаров',
      few: '$count товара',
      one: '1 товар',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Ни у одного товара с низким остатком пока нет основного поставщика.';

  @override
  String get thisSupplier => 'Этот поставщик';

  @override
  String supplierNoPhone(String name) {
    return 'У $name не указан номер телефона.';
  }

  @override
  String get tabOverview => 'Обзор';

  @override
  String get tabStock => 'Склад';

  @override
  String get tabMoney => 'Деньги';

  @override
  String get taglineOverview => 'Долги, остатки и касса за сегодня одним взглядом.';

  @override
  String get taglineStock => 'Что продаётся, что заканчивается.';

  @override
  String get taglineMoney => 'Расходы, сверка и взыскания.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Загрузка панели… $done из $total';
  }

  @override
  String get dashboardLoadFailed => 'Не удалось загрузить панель';

  @override
  String get checkConnectionRetry => 'Проверьте подключение и повторите попытку.';

  @override
  String get retry => 'Повторить';

  @override
  String get aiBriefing => 'Сводка ИИ';

  @override
  String get briefingPrompt => 'Вчерашний день бизнеса в нескольких предложениях.';

  @override
  String get getBriefing => 'Получить сводку';

  @override
  String get refreshBriefing => 'Обновить сводку';

  @override
  String updatedAt(String time) {
    return 'Обновлено $time';
  }

  @override
  String get customersUnknown => '— клиентов';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клиента',
      many: '$count клиентов',
      few: '$count клиента',
      one: '1 клиент',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Предыдущий месяц';

  @override
  String get nextMonth => 'Следующий месяц';

  @override
  String get salesMonth => 'Продажи (месяц)';

  @override
  String get outstanding => 'Задолженность';

  @override
  String get profitMonth => 'Прибыль (месяц)';

  @override
  String get cashToday => 'Касса сегодня';

  @override
  String get newBill => 'Новый счёт';

  @override
  String get scanHandwrittenBill => 'Сканировать рукописный счёт';

  @override
  String get topOutstanding => 'Крупнейшие долги';

  @override
  String viewAllInDues(int count) {
    return 'Все $count в центре долгов';
  }

  @override
  String get lowStockAlerts => 'Низкий остаток';

  @override
  String get noLowStock => 'Нет товаров с низким остатком — всё в порядке.';

  @override
  String get whatsappAll => 'WhatsApp всем';

  @override
  String get reorderAll => 'Дозаказать всё';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Рекомендуется дозаказать $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Осталось $qty $unit';
  }

  @override
  String get reorder => 'Дозаказать';

  @override
  String get whatsappSupplier => 'WhatsApp поставщику';

  @override
  String get topItemsByRevenue => 'Лучшие товары по выручке';

  @override
  String get noSalesYet => 'Продаж пока нет.';

  @override
  String qtyLabel(String qty) {
    return 'Кол-во: $qty';
  }

  @override
  String get monthExpenses => 'Расходы за этот месяц';

  @override
  String get noExpensesMonth => 'В этом месяце расходов нет.';

  @override
  String get quickActions => 'Быстрые действия';

  @override
  String get dailyCashReconciliation => 'Ежедневная сверка кассы';

  @override
  String get collectMoney => 'Получить деньги';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изменения сохранено офлайн',
      many: '$count изменений сохранено офлайн',
      few: '$count изменения сохранены офлайн',
      one: '1 изменение сохранено офлайн',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Синхронизируется автоматически при подключении';

  @override
  String get syncing => 'Синхронизация';

  @override
  String get sync => 'Синхронизировать';

  @override
  String get shopProfile => 'Профиль магазина';

  @override
  String get insights => 'Аналитика';

  @override
  String get notifications => 'Уведомления';

  @override
  String get backupExport => 'Резервная копия и экспорт';

  @override
  String get adminPanel => 'Панель администратора';

  @override
  String get toolsSync => 'Инструменты и синхронизация';

  @override
  String get account => 'Аккаунт';

  @override
  String get shopDetailsSaved => 'Данные магазина сохранены.';

  @override
  String saveFailed(int code) {
    return 'Не удалось сохранить ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String get logoUpdated => 'Логотип обновлён.';

  @override
  String logoUploadFailed(int code) {
    return 'Не удалось загрузить логотип ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Не удалось загрузить логотип: $error';
  }

  @override
  String get healthGood => 'В целом всё хорошо.';

  @override
  String get healthSome => 'Кое-что требует внимания.';

  @override
  String get healthMany => 'Многое требует внимания.';

  @override
  String get shopHealth => 'Состояние магазина';

  @override
  String get healthIntro => 'Короткая подсказка, а не ещё один отчёт.';

  @override
  String get couldNotLoadCheckConnection => 'Не удалось загрузить — проверьте подключение.';

  @override
  String get itemPhotos => 'Фото товаров';

  @override
  String get barcodes => 'Штрихкоды';

  @override
  String get lowStockItems => 'Товары с низким остатком';

  @override
  String get lastBackup => 'Последняя копия';

  @override
  String get today => 'сегодня';

  @override
  String get yesterday => 'вчера';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня назад',
      many: '$days дней назад',
      few: '$days дня назад',
      one: '1 день назад',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Офлайн-статус';

  @override
  String get online => 'Онлайн';

  @override
  String get offline => 'Офлайн';

  @override
  String get waitingToSync => 'Ожидает синхронизации';

  @override
  String get syncNow => 'Синхронизировать сейчас';

  @override
  String get searchSettings => 'Поиск настроек';

  @override
  String noSettingsMatch(String query) {
    return 'Нет настроек по запросу \"$query\"';
  }

  @override
  String get businessInfo => 'О БИЗНЕСЕ';

  @override
  String get payment => 'ОПЛАТА';

  @override
  String get shopNameRequired => 'Укажите название магазина';

  @override
  String phoneIncomplete(int digits) {
    return 'Введите полный номер телефона из $digits цифр';
  }

  @override
  String get jazzcashOptional => 'Номер JazzCash (необязательно)';

  @override
  String get saved => 'Сохранено!';

  @override
  String get languageSubtitle => 'Изменить язык приложения';

  @override
  String get notificationsSubtitle => 'Низкий остаток, просроченные платежи и ежедневная сводка';

  @override
  String get backupSubtitle => 'Скачать, восстановить и экспортировать данные';

  @override
  String get appUpdate => 'Обновление приложения';

  @override
  String get appUpdateSubtitle => 'Проверить новую версию';

  @override
  String get adminSubtitle => 'Управление аккаунтами и данными магазина';

  @override
  String get accountSubtitle => 'Вход, пароль и имя пользователя';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get privacySubtitle => 'Какие данные мы собираем и зачем';

  @override
  String get yourShop => 'Ваш магазин';

  @override
  String get uploadingLogo => 'Загрузка логотипа магазина';

  @override
  String get logoTapToChange => 'Логотип магазина, нажмите, чтобы изменить';

  @override
  String get brandTagline => 'В магазине аврал, а в книгах порядок.';

  @override
  String serverError(int code) {
    return 'Ошибка сервера: $code';
  }

  @override
  String get deleteCustomer => 'Удалить клиента';

  @override
  String deleteCustomerMessage(String name) {
    return 'Удалить $name и все его счета? Это нельзя отменить.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Не удалось удалить: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Не удалось удалить — проверьте подключение и повторите.';

  @override
  String get actions => 'Действия';

  @override
  String get edit => 'Изменить';

  @override
  String get delete => 'Удалить';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить клиентов: $count',
      one: 'Удалить 1 клиента',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить клиентов ($count) и все их счета? Это нельзя отменить.',
      one: 'Удалить 1 клиента и все его счета? Это нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Снять выделение';

  @override
  String get selectAll => 'Выбрать все';

  @override
  String selectedCount(int count) {
    return 'Выбрано: $count';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get newTag => 'НОВЫЙ';

  @override
  String get csvNeedsRows => 'В CSV нужна строка заголовков и хотя бы один клиент.';

  @override
  String get csvNeedsName => 'Заголовок CSV должен содержать столбец \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'Строка $line: нет имени — исправьте файл и повторите.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Строка $line: неверный credit_limit \"$value\" — исправьте файл и повторите.';
  }

  @override
  String get importCustomers => 'Импорт клиентов';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В \"$file\" найдено клиентов: $count. Импортировать всех?',
      one: 'В \"$file\" найден 1 клиент. Импортировать?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Импортировать';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Импортировано клиентов: $count.',
      one: 'Импортирован 1 клиент.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Ошибка импорта: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Ошибка импорта — нет подключения: $error';
  }

  @override
  String get noPhone => 'Нет телефона';

  @override
  String get offlineShowingSaved => 'Офлайн — показана сохранённая копия';

  @override
  String get searchCustomersHint => 'Поиск клиентов или телефона...';

  @override
  String get noCustomersYet => 'Клиентов пока нет. Нажмите +, чтобы добавить.';

  @override
  String get noCustomersMatch => 'Нет клиентов по вашему запросу.';

  @override
  String get owesMoney => 'Должники';

  @override
  String get settledUp => 'Без долгов';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'Не удалось загрузить $what: $error';
  }

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get back => 'Назад';

  @override
  String callPhone(String phone) {
    return 'Позвонить $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp $phone';
  }

  @override
  String get clearSearch => 'Очистить поиск';

  @override
  String get askHint => 'напр. Какую прибыль я получил в этом месяце?';

  @override
  String get acctTurnOffLockTitle => 'Отключить блокировку приложения?';

  @override
  String get acctTurnOffLockBody => 'Любой, у кого окажется этот телефон, сможет открыть приложение без PIN-кода.';

  @override
  String get acctTurnOff => 'Отключить';

  @override
  String get acctSetPinTitle => 'Задать PIN-код';

  @override
  String get acctPinLabel => 'PIN-код из 4–6 цифр';

  @override
  String get acctPinMin => 'Не менее 4 цифр';

  @override
  String get acctConfirmPin => 'Подтвердите PIN-код';

  @override
  String get acctPinMismatch => 'PIN-коды не совпадают';

  @override
  String get acctSetPin => 'Задать PIN';

  @override
  String get acctBiometricTitle => 'Использовать также отпечаток/лицо?';

  @override
  String get acctBiometricBody => 'Если биометрия не сработает, вы всё равно сможете ввести PIN-код.';

  @override
  String get acctNoThanks => 'Нет, спасибо';

  @override
  String get acctEnable => 'Включить';

  @override
  String get acctSetPasswordTitle => 'Задать пароль';

  @override
  String get acctSetPasswordIntro => 'Задайте пароль, чтобы в следующий раз входить не только через Google, но и по e-mail и паролю.';

  @override
  String get acctPassword => 'Пароль';

  @override
  String get acctPasswordMin => 'Не менее 6 символов';

  @override
  String get acctConfirmPassword => 'Подтвердите пароль';

  @override
  String get acctPasswordsMismatch => 'Пароли не совпадают';

  @override
  String get acctSetPasswordButton => 'Задать пароль';

  @override
  String get acctPasswordSet => 'Пароль задан — теперь вы можете входить и с его помощью.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Не удалось задать пароль: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Сменить пароль';

  @override
  String get acctCurrentPassword => 'Текущий пароль';

  @override
  String get acctRequired => 'Обязательное поле';

  @override
  String get acctNewPassword => 'Новый пароль';

  @override
  String get acctConfirmNewPassword => 'Подтвердите новый пароль';

  @override
  String get acctChange => 'Изменить';

  @override
  String get acctPasswordChanged => 'Пароль изменён.';

  @override
  String get acctWrongPassword => 'Текущий пароль неверен.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Не удалось сменить пароль: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Изменить имя пользователя';

  @override
  String get acctUsername => 'Имя пользователя';

  @override
  String get acctUsernameEmpty => 'Имя пользователя не может быть пустым';

  @override
  String get acctUsernameChanged => 'Имя пользователя изменено.';

  @override
  String get acctChangeEmailTitle => 'Изменить e-mail';

  @override
  String get acctNewEmail => 'Новый e-mail';

  @override
  String get acctValidEmail => 'Введите корректный e-mail';

  @override
  String get acctRequiredConfirm => 'Нужно, чтобы подтвердить, что это вы';

  @override
  String get acctGoogleConfirmFirst => 'Сначала вас попросят подтвердить вход через Google.';

  @override
  String acctCheckEmail(String email) {
    return 'Проверьте $email: там ссылка для подтверждения изменения.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'вход по паролю';

  @override
  String acctRemoveTitle(String provider) {
    return 'Отключить $provider?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Вы больше не сможете входить в этот аккаунт через $provider.';
  }

  @override
  String get acctRemove => 'Отключить';

  @override
  String acctRemoved(String provider) {
    return '$provider отключён.';
  }

  @override
  String get acctSignedIn => 'Вы вошли';

  @override
  String get acctEmailNotVerified => 'E-mail ещё не подтверждён.';

  @override
  String get acctVerificationSent => 'Письмо для подтверждения отправлено.';

  @override
  String get acctResend => 'Отправить снова';

  @override
  String get acctSectionSignIn => 'ВХОД И БЕЗОПАСНОСТЬ';

  @override
  String get acctRowChangeUsername => 'Изменить имя пользователя';

  @override
  String get acctRowChangeEmail => 'Изменить e-mail';

  @override
  String get acctRowSetPassword => 'Задать пароль';

  @override
  String get acctRowChangePassword => 'Сменить пароль';

  @override
  String get acctRowUnlinkGoogle => 'Отвязать Google';

  @override
  String get acctRowRemovePassword => 'Удалить пароль';

  @override
  String get acctRowAppLock => 'Блокировка приложения (PIN)';

  @override
  String get acctRowBiometric => 'Использовать отпечаток/лицо';

  @override
  String get acctSignOutTitle => 'Выйти?';

  @override
  String get acctSignOutBody => 'Чтобы пользоваться приложением, нужно будет войти снова.';

  @override
  String get acctSignOut => 'Выйти';

  @override
  String get acctDeleteAccount => 'Удалить аккаунт';

  @override
  String get acctDeleting => 'Удаление...';

  @override
  String get acctDeleteTitle => 'Удалить аккаунт?';

  @override
  String get acctDeleteBody => 'Ваши данные для входа будут удалены навсегда. Чтобы пользоваться приложением, придётся зарегистрироваться заново. Это действие нельзя отменить.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Не удалось удалить аккаунт: $error';
  }

  @override
  String get itmNotFoundTitle => 'Товар не найден';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Товара со штрихкодом $barcode нет. Добавить его как новый товар?';
  }

  @override
  String get itmAddItem => 'Добавить товар';

  @override
  String get itmEditItem => 'Изменить товар';

  @override
  String get itmMergeTitle => 'Объединить дубликаты товаров';

  @override
  String get itmMergeBody => 'Товары с одинаковым названием будут объединены в самую старую запись, а их остатки сложатся. Это действие нельзя отменить.';

  @override
  String get itmMerge => 'Объединить';

  @override
  String get itmNoDuplicates => 'Дубликатов товаров не найдено.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Объединено $count дубликата товара.',
      many: 'Объединено $count дубликатов товара.',
      few: 'Объединено $count дубликата товара.',
      one: 'Объединён 1 дубликат товара.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Удалить товар';

  @override
  String get itmCannotUndo => 'Это действие нельзя отменить.';

  @override
  String get itmDeleteOffline => 'Не удалось удалить — проверьте соединение и повторите попытку.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count товара',
      many: 'Удалить $count товаров',
      few: 'Удалить $count товара',
      one: 'Удалить 1 товар',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count товара? Это действие нельзя отменить.',
      many: 'Удалить $count товаров? Это действие нельзя отменить.',
      few: 'Удалить $count товара? Это действие нельзя отменить.',
      one: 'Удалить 1 товар? Это действие нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Не удалось загрузить фото ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Не удалось загрузить фото: $error';
  }

  @override
  String get itmNoBarcodes => 'Ни у одного товара пока нет штрихкода.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Печать $count этикетки',
      many: 'Печать $count этикеток',
      few: 'Печать $count этикеток',
      one: 'Печать 1 этикетки',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Поиск товара или категории...';

  @override
  String get itmStopListening => 'Остановить прослушивание';

  @override
  String get itmVoiceSearch => 'Голосовой поиск';

  @override
  String get itmSort => 'Сортировка';

  @override
  String get itmSortName => 'Название (А–Я)';

  @override
  String get itmSortStockLow => 'Остаток: по возрастанию';

  @override
  String get itmSortRecent => 'Недавно добавленные';

  @override
  String get itmFilterAll => 'Все';

  @override
  String get itmFilterLowStock => 'Мало на складе';

  @override
  String get itmNoItemsYet => 'Товаров пока нет. Нажмите +, чтобы добавить.';

  @override
  String get itmNoItemsMatch => 'По вашему запросу товаров нет.';

  @override
  String get itmNoPriceChanges => 'Изменений цены пока не зафиксировано.';

  @override
  String get itmNoStockCorrections => 'Корректировок остатков пока не зафиксировано.';

  @override
  String get itmResetHistory => 'Сбросить историю';

  @override
  String get itmResetHistoryMsg => 'Сбросить историю этого товара? Это нельзя отменить.';

  @override
  String get itmSendPdf => 'Отправить как PDF';

  @override
  String get itmNoteOptional => 'Заметка (необязательно)';

  @override
  String get itmNoteHint => 'Добавьте заметку к этому изменению';

  @override
  String get itmRemoveEntry => 'Удалить запись';

  @override
  String get itmRemoveEntryMsg => 'Удалить эту запись из истории? Это нельзя отменить.';

  @override
  String get itmEditEntry => 'Изменить запись';

  @override
  String get itmPrevQty => 'Было';

  @override
  String get itmNewQty => 'Стало';

  @override
  String itmCost(String amount) {
    return 'Себестоимость: $amount';
  }

  @override
  String get itmMore => 'Ещё';

  @override
  String get itmMenuPrintLabel => 'Печать этикетки';

  @override
  String get itmMenuDuplicate => 'Дублировать';

  @override
  String get itmMenuPriceHistory => 'История цен';

  @override
  String get itmMenuStockHistory => 'История корректировок остатков';

  @override
  String itmLowStockBadge(int count) {
    return 'Мало на складе: $count';
  }

  @override
  String itmStockLine(String qty) {
    return 'Остаток: $qty';
  }

  @override
  String get itmOfflineSaved => 'Офлайн — товар сохранён на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get itmItemName => 'Название товара';

  @override
  String get itmNameRequired => 'Укажите название';

  @override
  String get itmPricePkr => 'Цена (PKR)';

  @override
  String get itmPriceRequired => 'Укажите цену';

  @override
  String get itmValidNumber => 'Введите корректное число';

  @override
  String get itmUnit => 'Единица';

  @override
  String get itmCategoryHint => 'Категория (необязательно, например Сантехника)';

  @override
  String get itmPreferredSupplier => 'Предпочтительный поставщик (необязательно)';

  @override
  String get itmPreferredSupplierHelper => 'Используется при заказе в одно касание';

  @override
  String get itmClear => 'Очистить';

  @override
  String get itmHsn => 'Код HSN (необязательно)';

  @override
  String get itmGstRate => 'Ставка GST % (необязательно)';

  @override
  String get itmBarcodeOptional => 'Штрихкод (необязательно)';

  @override
  String get itmScanOrType => 'Сканируйте или введите';

  @override
  String get itmScanBarcode => 'Сканировать штрихкод';

  @override
  String get itmPurchaseCost => 'Закупочная цена (за единицу)';

  @override
  String get itmPurchaseCostHint => 'Сколько вы платите при закупке товара';

  @override
  String get itmWholesale => 'Оптовая цена (необязательно)';

  @override
  String get itmContractor => 'Цена для подрядчиков (необязательно)';

  @override
  String get itmFallsBack => 'Если не указана, действует обычная цена';

  @override
  String get itmStockQty => 'Количество на складе';

  @override
  String get itmLowStockAlert => 'Предупреждать, если остаток ниже';

  @override
  String get itmFrequently => 'Часто покупают вместе';

  @override
  String get itmSaveChanges => 'Сохранить изменения';

  @override
  String get itmSaveItem => 'Сохранить товар';

  @override
  String get itmPhotoSemantics => 'Фото товара, нажмите, чтобы изменить';

  @override
  String get cdUpdateStatusTitle => 'Обновить статус оплаты';

  @override
  String get cdMarkPaidQ => 'Отметить этот счёт как оплаченный?';

  @override
  String get cdMarkUnpaidQ => 'Отметить этот счёт как неоплаченный?';

  @override
  String get cdConfirm => 'Подтвердить';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Не удалось обновить: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Офлайн — изменение сохранено на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get cdConvertTitle => 'Преобразовать в счёт';

  @override
  String get cdConvertBody => 'Остатки этих товаров будут списаны, а предложение станет настоящим счётом. Продолжить?';

  @override
  String get cdConvert => 'Преобразовать';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Не удалось преобразовать: $detail';
  }

  @override
  String get cdReturnItems => 'Возврат товаров';

  @override
  String get cdReturnHint => 'Укажите, сколько каждого товара вернуть. Оставьте 0, чтобы товар остался проданным.';

  @override
  String get cdDecreaseQty => 'Уменьшить количество';

  @override
  String get cdIncreaseQty => 'Увеличить количество';

  @override
  String get cdCreditTotal => 'Итого к зачёту';

  @override
  String get cdReturnSelected => 'Вернуть выбранное';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Не удалось оформить возврат: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Не удалось аннулировать: $detail';
  }

  @override
  String get cdNoPreviousBill => 'Нет предыдущего счёта для повтора';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Не удалось загрузить последний счёт: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Счёт отправлен клиенту по e-mail.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Не удалось отправить счёт по e-mail: $detail';
  }

  @override
  String get cdStatementEmailed => 'Выписка отправлена клиенту по e-mail.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Не удалось отправить выписку по e-mail: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Удалить счёт';

  @override
  String get cdBillVoided => 'АННУЛИРОВАН';

  @override
  String get cdBillReturn => 'ВОЗВРАТ';

  @override
  String get cdBillQuote => 'ПРЕДЛОЖЕНИЕ';

  @override
  String get cdBillPaid => 'ОПЛАЧЕН';

  @override
  String get cdBillPartial => 'ЧАСТИЧНО';

  @override
  String get cdBillUnpaid => 'НЕ ОПЛАЧЕН';

  @override
  String get cdBill => 'Счёт';

  @override
  String cdVoidedReason(String reason) {
    return 'Аннулирован: $reason';
  }

  @override
  String get cdViewInvoice => 'Посмотреть счёт';

  @override
  String get cdEmailInvoice => 'Отправить счёт по e-mail';

  @override
  String get cdEditBill => 'Изменить счёт';

  @override
  String get cdReturnBill => 'Вернуть счёт';

  @override
  String get cdVoidBill => 'Аннулировать счёт';

  @override
  String get cdNoItems => 'Нет товаров';

  @override
  String get cdRepeatLast => 'Повторить последний счёт';

  @override
  String get cdLedgerPdf => 'PDF книги учёта';

  @override
  String get cdEmailStatement => 'Отправить выписку по e-mail';

  @override
  String get cdCollectPayment => 'Принять платёж';

  @override
  String get cdSendReminder => 'Отправить напоминание в WhatsApp';

  @override
  String get cdTotalBilled => 'Всего выставлено';

  @override
  String get cdPaid => 'Оплачено';

  @override
  String get cdNoBills => 'Счетов пока нет';

  @override
  String get cdBillActions => 'Действия со счётом';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return 'Использовано $outstanding из кредитного лимита $limit';
  }

  @override
  String get cdVoidBody => 'Счёт исчезнет из балансов и отчётов, но останется в истории. Остатки будут восстановлены. Это действие нельзя отменить.';

  @override
  String get cdReason => 'Причина (необязательно)';

  @override
  String get frmOfflineCustomer => 'Офлайн — клиент сохранён на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get frmOfflineSupplier => 'Офлайн — поставщик сохранён на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get frmEditCustomer => 'Изменить клиента';

  @override
  String get frmCustomerName => 'Имя клиента';

  @override
  String get frmPhoneOptional => 'Телефон (необязательно)';

  @override
  String get frmCreditLimit => 'Кредитный лимит (PKR, необязательно)';

  @override
  String get frmCreditHelper => 'Предупреждать, когда баланс клиента превысит это значение';

  @override
  String get frmPriceTier => 'Ценовой уровень';

  @override
  String get frmRetail => 'Розница';

  @override
  String get frmWholesale => 'Опт';

  @override
  String get frmContractor => 'Подрядчик';

  @override
  String get frmPriceTierHelper => 'Какая цена товара подставляется в счёт для этого клиента';

  @override
  String get frmStrn => 'STRN (необязательно)';

  @override
  String get frmStrnCustomer => '13-значный регистрационный номер налога с продаж для счетов';

  @override
  String get frmStrnSupplier => '13-значный регистрационный номер налога с продаж для закупочных счетов';

  @override
  String get frmAddress => 'Адрес (необязательно)';

  @override
  String get frmEmail => 'E-mail (необязательно)';

  @override
  String get frmEmailHelper => 'Позволяет отправлять этому клиенту счёт или выписку по e-mail';

  @override
  String get frmSaveCustomer => 'Сохранить клиента';

  @override
  String get frmEditSupplier => 'Изменить поставщика';

  @override
  String get frmSupplierName => 'Название поставщика';

  @override
  String get frmSaveSupplier => 'Сохранить поставщика';

  @override
  String get sdDeletePurchaseTitle => 'Удалить закупку';

  @override
  String get sdDeletePurchaseBody => 'Остатки по этой закупке будут восстановлены. Это действие нельзя отменить.';

  @override
  String get sdReturnToSupplier => 'Вернуть поставщику';

  @override
  String get sdReturnHint => 'Укажите, сколько каждого товара отправить обратно. Оставьте 0, чтобы оставить себе.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Не удалось отметить как полученную: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Отметить эту закупку как оплаченную?';

  @override
  String get sdMarkUnpaidQ => 'Отметить эту закупку как неоплаченную?';

  @override
  String get sdTotalPurchased => 'Всего закуплено';

  @override
  String get sdPayable => 'К оплате';

  @override
  String sdPayableAmount(String amount) {
    return 'К оплате: $amount';
  }

  @override
  String get sdNoPurchases => 'Закупок пока нет';

  @override
  String get sdPo => 'ЗП';

  @override
  String get sdDraftPo => 'ЧЕРНОВИК ЗП';

  @override
  String get sdPurchase => 'Закупка';

  @override
  String get sdDraftNote => 'Черновик заказа поставщику — ещё не получен, остатки и себестоимость пока не обновлены.';

  @override
  String get sdReturnNote => 'Возврат / кредит-нота поставщику.';

  @override
  String get sdMarkReceived => 'Отметить как полученную';

  @override
  String get sdEditPurchase => 'Изменить закупку';

  @override
  String get sdPurchaseActions => 'Действия с закупкой';

  @override
  String get slDeleteSupplier => 'Удалить поставщика';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count поставщика',
      many: 'Удалить $count поставщиков',
      few: 'Удалить $count поставщиков',
      one: 'Удалить 1 поставщика',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count поставщика и все их закупки? Это действие нельзя отменить.',
      many: 'Удалить $count поставщиков и все их закупки? Это действие нельзя отменить.',
      few: 'Удалить $count поставщиков и все их закупки? Это действие нельзя отменить.',
      one: 'Удалить 1 поставщика и все его закупки? Это действие нельзя отменить.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'В CSV нужна строка заголовков и хотя бы один поставщик.';

  @override
  String get slImportTitle => 'Импорт поставщиков';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В файле \"$file\" найдено $count поставщика. Импортировать всех?',
      many: 'В файле \"$file\" найдено $count поставщиков. Импортировать всех?',
      few: 'В файле \"$file\" найдено $count поставщика. Импортировать всех?',
      one: 'В файле \"$file\" найден 1 поставщик. Импортировать всех?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Импортировано $count поставщика.',
      many: 'Импортировано $count поставщиков.',
      few: 'Импортировано $count поставщика.',
      one: 'Импортирован 1 поставщик.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Поставщиков пока нет. Нажмите +, чтобы добавить.';

  @override
  String get slSearchHint => 'Поиск поставщика или телефона...';

  @override
  String get slNoMatch => 'По вашему запросу поставщиков нет.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count поставщика',
      many: '$count поставщиков',
      few: '$count поставщика',
      one: '1 поставщик',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Долги поставщикам';

  @override
  String get sduNothingOwed => 'Поставщикам мы ничего не должны 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Долг $count поставщикам',
      many: 'Долг $count поставщикам',
      few: 'Долг $count поставщикам',
      one: 'Долг 1 поставщику',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня с самой старой неоплаченной закупки',
      many: '$days дней с самой старой неоплаченной закупки',
      few: '$days дня с самой старой неоплаченной закупки',
      one: '1 день с самой старой неоплаченной закупки',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 дней';

  @override
  String get duBucket1 => '30–60 дней';

  @override
  String get duBucket2 => '60+ дней';

  @override
  String get duTitle => 'Центр задолженностей';

  @override
  String get duNoDues => 'Задолженностей нет 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count клиента с долгом',
      many: '$count клиентов с долгом',
      few: '$count клиента с долгом',
      one: '1 клиент с долгом',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня с самого старого неоплаченного счёта',
      many: '$days дней с самого старого неоплаченного счёта',
      few: '$days дня с самого старого неоплаченного счёта',
      one: '1 день с самого старого неоплаченного счёта',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return 'Долг: $amount';
  }

  @override
  String get cpNoOutstanding => 'У этого клиента нет задолженности';

  @override
  String get cpValidAmount => 'Введите корректную сумму';

  @override
  String cpExceeds(String amount) {
    return 'Сумма превышает задолженность $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'Получено $amount от $name';
  }

  @override
  String get cpOfflineSaved => 'Офлайн — платёж сохранён на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String cpOwes(String amount, String name) {
    return '$name должен $amount. Сначала засчитывается в самые старые неоплаченные счета.';
  }

  @override
  String get cpAmountLabel => 'Полученная сумма (PKR)';

  @override
  String get cpCollect => 'Принять';

  @override
  String get usNoItems => 'Нет товаров для обновления.';

  @override
  String get usHelp => 'Задайте новый остаток для каждого товара и нажмите «Сохранить всё».';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  сейчас: $qty';
  }

  @override
  String usNew(String qty) {
    return 'новый: $qty';
  }

  @override
  String get usSubtract => 'Вычесть 1';

  @override
  String get usAdd => 'Добавить 1';

  @override
  String get usNoChanges => 'Нет изменений';

  @override
  String usSaveAll(int count) {
    return 'Сохранить всё (изменено: $count)';
  }

  @override
  String get srHint => 'Поиск клиентов, товаров, сумм...';

  @override
  String get srFailed => 'Поиск не удался — проверьте соединение.';

  @override
  String get srTitle => 'Поиск по вашему магазину';

  @override
  String get srSubtitle => 'Находите клиентов по имени или телефону, а счета — по сумме.';

  @override
  String srNoMatches(String query) {
    return 'Ничего не найдено по запросу \"$query\"';
  }

  @override
  String get srTryDifferent => 'Попробуйте другое имя, номер телефона или сумму.';

  @override
  String get srBills => 'Счета';

  @override
  String get srNoItemList => 'Нет списка товаров';

  @override
  String get abAddAtLeastOne => 'Добавьте хотя бы один товар';

  @override
  String get abQuotationUpdated => 'Предложение обновлено!';

  @override
  String get abBillUpdated => 'Счёт обновлён!';

  @override
  String get abQuotationSaved => 'Предложение сохранено!';

  @override
  String get abBillCreated => 'Счёт успешно создан!';

  @override
  String abTotalAmount(String amount) {
    return 'Итого: $amount';
  }

  @override
  String get abShare => 'Поделиться';

  @override
  String get abDoneReturn => 'Готово и назад';

  @override
  String get abOverLimitBody => 'Из-за этого клиент превысит свой кредитный лимит.';

  @override
  String get abOverLimitTitle => 'Превышен кредитный лимит';

  @override
  String get abBillAnyway => 'Всё равно выставить счёт';

  @override
  String get abOfflineBill => 'Офлайн — счёт сохранён на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get abEditQuotation => 'Изменить предложение';

  @override
  String get abEditBill => 'Изменить счёт';

  @override
  String get abNewQuotation => 'Новое предложение';

  @override
  String get abAddBill => 'Добавить счёт';

  @override
  String get abCouldNotLoadItems => 'Не удалось загрузить товары.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'С этим счётом баланс клиента составит $total, что превышает его кредитный лимит $limit.';
  }

  @override
  String get abTapAddItemBill => 'Нажмите «Добавить товар» ниже, чтобы начать счёт';

  @override
  String get abNoCatalog => 'В каталоге пока нет товаров';

  @override
  String get abScan => 'Сканировать';

  @override
  String get abDiscountRs => 'Скидка (руп.)';

  @override
  String get abSubtotal => 'Промежуточный итог';

  @override
  String get abTotal => 'Итого';

  @override
  String get abSaveAsQuotation => 'Сохранить как предложение';

  @override
  String get abQuotationLocked => 'Существующий счёт нельзя превратить обратно в предложение';

  @override
  String get abQuotationNote => 'Остатки не списываются, пока предложение не станет счётом';

  @override
  String get abPaymentStatus => 'Статус оплаты';

  @override
  String get abUnpaid => 'Не оплачен';

  @override
  String get abPaymentMethod => 'Способ оплаты';

  @override
  String get abCash => 'Наличные';

  @override
  String get abBankTransfer => 'Банковский перевод';

  @override
  String get abCheque => 'Чек';

  @override
  String get abSaveQuotation => 'Сохранить предложение';

  @override
  String get abSaveBill => 'Сохранить счёт';

  @override
  String abAdded(String name) {
    return 'Добавлено: $name';
  }

  @override
  String get apNewItem => 'Новый товар…';

  @override
  String get apNewItemHint => 'Сначала добавьте новый товар в каталог';

  @override
  String get apOfflinePurchase => 'Офлайн — закупка сохранена на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get apEditPo => 'Изменить заказ поставщику';

  @override
  String get apNewPo => 'Новый заказ поставщику';

  @override
  String get apAddPurchase => 'Добавить закупку';

  @override
  String get apTapAddItem => 'Нажмите «Добавить товар» ниже, чтобы начать закупку';

  @override
  String get apSaveAsPo => 'Сохранить как заказ поставщику';

  @override
  String get apPoLocked => 'Уже полученную закупку нельзя превратить обратно в черновик заказа';

  @override
  String get apPoNote => 'Остатки и себестоимость не обновляются, пока товар не отмечен как полученный';

  @override
  String get apUnpaidCredit => 'Не оплачена (в кредит)';

  @override
  String get apSavePo => 'Сохранить заказ поставщику';

  @override
  String get apSavePurchase => 'Сохранить закупку';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Текущая себестоимость: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Себестоимость не задана  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Сканирование не удалось: ошибка сервера $code';
  }

  @override
  String get scOfflineSaved => 'Офлайн — фото сохранено и будет прочитано автоматически при появлении сети';

  @override
  String get scStillOffline => 'Всё ещё офлайн';

  @override
  String get scCouldNotCreateCustomer => 'Не удалось создать клиента — повторите попытку.';

  @override
  String get scCouldNotCreateSupplier => 'Не удалось создать поставщика — повторите попытку.';

  @override
  String scBillSavedFor(String name) {
    return 'Счёт сохранён для $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Закупка у $name сохранена';
  }

  @override
  String get scWhichCustomer => 'Какой это клиент?';

  @override
  String get scWhichSupplier => 'Какой это поставщик?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Ближайшее совпадение: $name (сходство $score%)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Да, это $name';
  }

  @override
  String get scOtherwiseCustomer => 'Иначе создайте нового клиента:';

  @override
  String get scOtherwiseSupplier => 'Иначе создайте нового поставщика:';

  @override
  String get scNoMatchCustomer => 'Подходящий клиент не найден. Создайте нового:';

  @override
  String get scNoMatchSupplier => 'Подходящий поставщик не найден. Создайте нового:';

  @override
  String get scCustomerName => 'Имя клиента';

  @override
  String get scSupplierName => 'Название поставщика';

  @override
  String get scCreateNew => 'Создать';

  @override
  String get scTitleBill => 'Сканирование счёта';

  @override
  String get scIntroBill => 'Сфотографируйте счёт. Рукописный тоже подойдёт, а синдхи, урду и английский читаются одинаково хорошо. Перед сохранением вы всё проверите.';

  @override
  String get scIntroPurchase => 'Сфотографируйте счёт поставщика. Синдхи, урду и английский читаются одинаково хорошо. Перед сохранением вы всё проверите.';

  @override
  String get scReadingBill => 'Чтение счёта…';

  @override
  String get scScanBill => 'Сканировать счёт';

  @override
  String get scReadingInvoice => 'Чтение счёта…';

  @override
  String get scScanInvoice => 'Сканировать счёт';

  @override
  String get scQueued => 'Сканы в очереди';

  @override
  String get scReady => 'Готово к проверке';

  @override
  String get scFailed => 'Ошибка';

  @override
  String get scWaiting => 'Ожидание соединения';

  @override
  String get scRetry => 'Повторить';

  @override
  String rpCouldNotLoad(String error) {
    return 'Не удалось загрузить отчёты: $error';
  }

  @override
  String get rpHeadline => 'Главные цифры этого месяца';

  @override
  String get rpProfitThisMonth => 'Прибыль за этот месяц';

  @override
  String get rpNoData => 'Данных пока нет';

  @override
  String get rpSalesTax => 'Налог с продаж';

  @override
  String rpSalesTaxFor(String month) {
    return 'Отчёт по налогу с продаж за $month';
  }

  @override
  String get rpViewSalesTax => 'Открыть отчёт по налогу с продаж';

  @override
  String get rpQuickReports => 'Быстрые отчёты';

  @override
  String get rpQuickSub => 'Перейти сразу к нужному отчёту';

  @override
  String get expensesTitle => 'Расходы';

  @override
  String get rpRateCard => 'Прайс-лист';

  @override
  String get rpDetails => 'Подробности';

  @override
  String get rpDetailsSub => 'Полные разбивки и рейтинги';

  @override
  String get rpOutstandingByCustomer => 'Задолженность по клиентам';

  @override
  String get rpNoOutstanding => 'Задолженностей нет';

  @override
  String get rpMonthlyTotals => 'Итоги по месяцам';

  @override
  String get rpMostSold => 'Самые продаваемые товары';

  @override
  String get rpNoItemsRecorded => 'Товаров пока не записано';

  @override
  String get rpTopCustomers => 'Лучшие клиенты по выручке';

  @override
  String get rpNoSalesRecorded => 'Продаж пока не записано';

  @override
  String get rpTotalOutstanding => 'Общая задолженность';

  @override
  String get rpViewCustomers => 'Показать клиентов';

  @override
  String get lblInvoice => 'счёт';

  @override
  String get lblLedger => 'книга учёта';

  @override
  String get lblRateCard => 'прайс-лист';

  @override
  String get exCsvNeedsRows => 'В CSV нужна строка заголовков и хотя бы один расход.';

  @override
  String get exCsvHeader => 'В заголовке CSV должны быть столбцы \"description\" и \"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'Строка $line: нет описания или неверная сумма — исправьте файл и повторите.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Строка $line: неверная дата \"$date\" — используйте ГГГГ-ММ-ДД.';
  }

  @override
  String get exImportTitle => 'Импорт расходов';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В файле \"$file\" найдено $count расхода. Импортировать все?',
      many: 'В файле \"$file\" найдено $count расходов. Импортировать все?',
      few: 'В файле \"$file\" найдено $count расхода. Импортировать все?',
      one: 'В файле \"$file\" найден 1 расход. Импортировать все?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Импортировано $count расхода.',
      many: 'Импортировано $count расходов.',
      few: 'Импортировано $count расхода.',
      one: 'Импортирован 1 расход.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Импорт не удался: ошибка сервера $code';
  }

  @override
  String get exDeleteTitle => 'Удалить расход';

  @override
  String get exAdd => 'Добавить расход';

  @override
  String get exEdit => 'Изменить расход';

  @override
  String get exDescription => 'Описание';

  @override
  String get exAmountRs => 'Сумма (руп.)';

  @override
  String get exCategory => 'Категория';

  @override
  String exDate(String date) {
    return 'Дата: $date';
  }

  @override
  String get exRepeats => 'Повторять ежемесячно';

  @override
  String get exRepeatsHint => 'Аренда, электричество, зарплата и т. д.';

  @override
  String get exReceiptTap => 'Фото чека, нажмите, чтобы изменить';

  @override
  String get exReceiptOptional => 'Фото чека (необязательно)';

  @override
  String get exEnterValid => 'Введите описание и корректную сумму.';

  @override
  String get exOffline => 'Офлайн — расход сохранён на этом устройстве и автоматически синхронизируется при появлении сети';

  @override
  String get exSave => 'Сохранить расход';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В этом месяце нужно оплатить $count регулярного расхода',
      many: 'В этом месяце нужно оплатить $count регулярных расходов',
      few: 'В этом месяце нужно оплатить $count регулярных расхода',
      one: 'В этом месяце нужно оплатить 1 регулярный расход',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Добавить';

  @override
  String get exTotal => 'Всего расходов';

  @override
  String exCategoryChip(String name) {
    return 'Категория: $name';
  }

  @override
  String get exNoneLogged => 'Расходов пока не записано';

  @override
  String exNoneInCategory(String name) {
    return 'Расходов в категории «$name» пока нет';
  }

  @override
  String get exViewReceipt => 'Посмотреть чек';

  @override
  String get exEditRow => 'Изменить расход';

  @override
  String get exDeleteRow => 'Удалить расход';

  @override
  String gstServerReturned(String first, String second) {
    return 'Сервер вернул $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'Не удалось загрузить данные GST: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Не удалось скачать ($code)';
  }

  @override
  String gstSaved(String filename) {
    return 'Сохранено: $filename';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Сохранено в Загрузки/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Не удалось скачать: $error';
  }

  @override
  String get gstTitle => 'Отчёт по налогу с продаж';

  @override
  String get gstOutwardDetail => 'Исходящие продажи — детали счетов';

  @override
  String get gstNoBills => 'В этом месяце счетов нет.';

  @override
  String get gstHsn => 'Сводка HSN';

  @override
  String get gstInvoiceWise => 'Детали по счетам';

  @override
  String get gstMonthly => 'Сводка за месяц';

  @override
  String get gstOutwardTaxable => 'Облагаемые исходящие поставки';

  @override
  String get gstItc => 'Входной налоговый кредит (по закупкам)';

  @override
  String get gstSave => 'Сохранить';

  @override
  String get rcValidAmount => 'Введите корректную сумму.';

  @override
  String get rcExpected => 'Ожидаемая наличность (сегодняшние продажи за наличные)';

  @override
  String get rcAlsoCollected => 'Также получено сегодня (в кассе не учтено)';

  @override
  String get rcCounted => 'Наличность, пересчитанная в кассе (руп.)';

  @override
  String get rcCompare => 'Сравнить';

  @override
  String get rcMatches => 'Точное совпадение!';

  @override
  String rcExtra(String amount) {
    return 'Излишек в кассе: $amount';
  }

  @override
  String rcMissing(String amount) {
    return 'Недостача в кассе: $amount';
  }

  @override
  String get pbiTitle => 'Прибыль по товарам';

  @override
  String get pbiNoSales => 'Продаж пока нет';

  @override
  String get pbiByCategory => 'По категориям';

  @override
  String get pbiItemsByProfit => 'Товары по прибыли';

  @override
  String get svTitle => 'Стоимость запасов';

  @override
  String get svNone => 'Запасов нет';

  @override
  String get svItemsByValue => 'Товары по стоимости';

  @override
  String svSummary(String items, String units) {
    return 'Товаров: $items · $units ед. на полке';
  }

  @override
  String svTied(String amount) {
    return 'В запасах заморожено $amount';
  }

  @override
  String get svEstimated => 'оценка по цене продажи';

  @override
  String get bkRestoreTitle => 'Восстановить резервную копию?';

  @override
  String bkRestoreBody(String filename) {
    return 'Все текущие данные будут заменены данными из файла \"$filename\". Продолжить?';
  }

  @override
  String get bkRestore => 'Восстановить';

  @override
  String get bkRestoreDoneTitle => 'Восстановление завершено';

  @override
  String get bkRestoreDoneBody => 'Ваши данные восстановлены.';

  @override
  String get bkOk => 'ОК';

  @override
  String bkRestoreFailed(String detail) {
    return 'Не удалось восстановить: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Не удалось восстановить: $error';
  }

  @override
  String get bkSaveToDownloads => 'Сохранить в Загрузки';

  @override
  String get bkIntroAdmin => 'Все ваши данные хранятся в одном файле базы данных. Регулярно скачивайте копию и восстанавливайте её, если что-то пойдёт не так.';

  @override
  String get bkIntroStaff => 'Полное резервное копирование и восстановление базы доступны только администраторам. Обратитесь к администратору или экспортируйте нужное в CSV ниже.';

  @override
  String get bkBackupDb => 'Резервная копия базы данных';

  @override
  String get bkBackupDbSub => 'Скачайте всю базу данных одним файлом и отправьте (WhatsApp, Диск, e-mail).';

  @override
  String get bkDownloadPhone => 'Скачать копию на телефон';

  @override
  String get bkShareBackup => 'Отправить копию';

  @override
  String get bkAutoTitle => 'Автоматические копии';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'На сервере хранится $count ежедневной копии, последняя — от $time. Создаются автоматически — здесь ничего делать не нужно.',
      many: 'На сервере хранится $count ежедневных копий, последняя — от $time. Создаются автоматически — здесь ничего делать не нужно.',
      few: 'На сервере хранится $count ежедневные копии, последняя — от $time. Создаются автоматически — здесь ничего делать не нужно.',
      one: 'На сервере хранится 1 ежедневная копия, последняя — от $time. Создаётся автоматически — здесь ничего делать не нужно.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Выберите сохранённый файл копии, чтобы заменить текущие данные.';

  @override
  String get bkRestoreFromFile => 'Восстановить из файла копии';

  @override
  String get bkExportCsv => 'Экспорт в CSV';

  @override
  String get bkExportSub => 'Откройте в Excel или отправьте.';

  @override
  String get bkRangeAll => 'Счета/Расходы: за всё время';

  @override
  String bkRangeSome(String end, String start) {
    return 'Счета/Расходы: с $start по $end';
  }

  @override
  String get bkSetRange => 'Задать период';

  @override
  String get bkClearRange => 'Сбросить период';

  @override
  String get ntNever => 'Ни разу не запускалось';

  @override
  String get ntJustNow => 'Только что';

  @override
  String ntMinutesAgo(int count) {
    return '$count мин назад';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count ч назад';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count дн. назад';
  }

  @override
  String get ntTitle => 'Умные уведомления';

  @override
  String get ntTapHint => 'Нажмите «Проверить сейчас», чтобы запустить уведомление и увидеть результат.';

  @override
  String get ntLowStockSub => 'Уведомлять, когда остаток товара падает ниже уровня повторного заказа.';

  @override
  String get ntCheckNow => 'Проверить сейчас';

  @override
  String get ntOverdue => 'Напоминания о просроченных платежах';

  @override
  String get ntOverdueSub => 'Уведомлять о неоплаченных счетах за прошлые дни.';

  @override
  String get ntDaily => 'Ежедневная сводка по бизнесу';

  @override
  String get ntDailySub => 'Вчерашние продажи, поступления и прибыль с первого взгляда.';

  @override
  String get ntSendSummary => 'Отправить сводку';

  @override
  String get ntRunning => 'Выполняется…';

  @override
  String get ntLowStockItems => 'Товары с малым остатком';

  @override
  String get ntSales => 'Продажи';

  @override
  String get ntCollected => 'Получено';

  @override
  String get ntProfit => 'Прибыль';

  @override
  String get auChecking => 'Поиск обновлений…';

  @override
  String get auLatest => 'У вас последняя версия.';

  @override
  String get auAvailable => 'Доступно обновление';

  @override
  String auNewer(int code) {
    return 'Доступна новая версия Book-Keep (сборка $code).';
  }

  @override
  String get auLater => 'Позже';

  @override
  String get auUpdate => 'Обновить';

  @override
  String get auDownloading => 'Загрузка обновления';

  @override
  String auSaved(String name) {
    return '$name сохранён в папке «Загрузки».';
  }

  @override
  String get auAllowInstall => 'Разрешите Book-Keep устанавливать приложения и снова нажмите «Обновить».';

  @override
  String get auFailed => 'Не удалось обновить — проверьте соединение и повторите попытку.';

  @override
  String get lgSearch => 'Поиск языков';

  @override
  String lgNoMatch(String query) {
    return 'Нет языков, подходящих под \"$query\"';
  }

  @override
  String get alVoided => 'Аннулировал(а) счёт';

  @override
  String get alDeletedBill => 'Удалил(а) счёт';

  @override
  String get alReturned => 'Оформил(а) возврат счёта';

  @override
  String get alDeletedCustomer => 'Удалил(а) клиента';

  @override
  String get alDeletedSupplier => 'Удалил(а) поставщика';

  @override
  String get alCreatedAccount => 'Создал(а) аккаунт';

  @override
  String get alUpdatedAccount => 'Обновил(а) аккаунт';

  @override
  String get alDeletedAccount => 'Удалил(а) аккаунт';

  @override
  String get alTitle => 'Журнал действий';

  @override
  String get alNone => 'Действий пока не записано';

  @override
  String get blkEnterOne => 'Введите хотя бы один товар';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Добавлено $count товара',
      many: 'Добавлено $count товаров',
      few: 'Добавлено $count товара',
      one: 'Добавлен 1 товар',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Массовое добавление товаров';

  @override
  String get blkFormat => 'Один товар в строке, формат: Название, Цена, Единица, Категория';

  @override
  String get blkOptional => 'Единица и категория необязательны (по умолчанию: piece, без категории)';

  @override
  String get blkAddAll => 'Добавить все товары';

  @override
  String get prSend => 'Отправить напоминание об оплате';

  @override
  String get prTone => 'Выберите тон:';

  @override
  String get prPolite => 'Вежливый';

  @override
  String get prStandard => 'Обычный';

  @override
  String get prUrgent => 'Срочный';

  @override
  String get prPreviewQr => 'Предпросмотр QR для оплаты через JazzCash';

  @override
  String get prShareText => 'Поделиться текстом';

  @override
  String get dsRemaining => 'Остаток';

  @override
  String dsIncludesDiscount(String amount) {
    return 'включая скидку $amount';
  }

  @override
  String get dsItems => 'Товары';

  @override
  String get dsDiscount => 'Скидка';

  @override
  String get lkWrongPin => 'Неверный PIN-код';

  @override
  String get lkEnterPin => 'Введите PIN-код';

  @override
  String get lkChecking => 'Проверка отпечатка...';

  @override
  String get bcTitle => 'Сканирование штрихкода';

  @override
  String get bcTorchNa => 'Фонарик недоступен на этом устройстве';

  @override
  String get bcTorch => 'Фонарик';

  @override
  String get bcPoint => 'Наведите камеру на штрихкод';

  @override
  String get qrNoNumber => 'Номер JazzCash не указан. Задайте его в настройках, чтобы показывать QR-код для оплаты.';

  @override
  String get qrPay => 'Оплатить через JazzCash';

  @override
  String get qrInvalid => 'Неверные данные QR';

  @override
  String qrAmount(String amount) {
    return 'Сумма: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'Скопировать номер JazzCash';

  @override
  String get qrCopied => 'Номер JazzCash скопирован в буфер обмена';

  @override
  String get qrHint => 'Отсканируйте или скопируйте этот номер в приложении JazzCash для оплаты.';

  @override
  String clOwed(String amount) {
    return 'Долг: $amount';
  }

  @override
  String get lnEnterEmailFirst => 'Сначала введите выше корректный e-mail.';

  @override
  String get lnResetSent => 'Письмо для сброса пароля отправлено — проверьте почту.';

  @override
  String get lnNoAccount => 'Аккаунт с таким e-mail не найден.';

  @override
  String get lnWrongPassword => 'Неверный пароль.';

  @override
  String get lnInvalidEmail => 'Это не похоже на корректный адрес e-mail.';

  @override
  String get lnDisabled => 'Этот аккаунт отключён.';

  @override
  String get lnTooMany => 'Слишком много попыток — повторите через минуту.';

  @override
  String get lnNoInternet => 'Нет подключения к интернету.';

  @override
  String get lnWeakPassword => 'Пароль должен содержать не менее 6 символов.';

  @override
  String get lnCouldNotSignIn => 'Не удалось войти. Повторите попытку.';

  @override
  String get lnWrongPasswordHint => 'Неверный пароль. Повторите попытку или нажмите «Забыли пароль?».';

  @override
  String get lnWrongEmail => 'Неверный e-mail — аккаунта с таким адресом нет.';

  @override
  String get lnWrongEmailOrPassword => 'Неверный e-mail или пароль.';

  @override
  String get lnWrongUsername => 'Неверное имя пользователя — аккаунта с таким именем нет.';

  @override
  String get lnWelcome => 'С возвращением';

  @override
  String lnSignInTo(String app) {
    return 'Вход в $app';
  }

  @override
  String get lnEmailOrUsername => 'E-mail или имя пользователя';

  @override
  String get lnRemember => 'Запомнить меня';

  @override
  String get lnForgot => 'Забыли пароль?';

  @override
  String get lnSignIn => 'Войти';

  @override
  String get lnGoogle => 'Продолжить через Google';

  @override
  String get lnNew => 'Впервые здесь?';

  @override
  String get lnCreate => 'Создать аккаунт';

  @override
  String suCreated(String email) {
    return 'Аккаунт для $email создан. Письмо для подтверждения отправлено (необязательно).';
  }

  @override
  String suSetup(String app) {
    return 'Настройка $app';
  }

  @override
  String get suName => 'Имя';

  @override
  String get suEmail => 'E-mail';

  @override
  String suPhoneDigits(int digits) {
    return 'Введите корректный $digits-значный номер';
  }

  @override
  String get suCreateBtn => 'Создать аккаунт';

  @override
  String get suHaveAccount => 'Уже есть аккаунт?';

  @override
  String get suAlreadyExists => 'Аккаунт с таким e-mail уже существует.';

  @override
  String get suInvalidEmail => 'Некорректный адрес e-mail.';

  @override
  String get agShow => 'Показать пароль';

  @override
  String get agHide => 'Скрыть пароль';

  @override
  String get adAccounts => 'Аккаунты';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count зарегистрированного аккаунта',
      many: '$count зарегистрированных аккаунтов',
      few: '$count зарегистрированных аккаунта',
      one: '1 зарегистрированный аккаунт',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Добавить';

  @override
  String get adNoAccounts => 'Аккаунты не найдены.';

  @override
  String get adAccountability => 'Подотчётность';

  @override
  String get adAccountabilitySub => 'Кто что аннулировал, удалил или вернул, и изменения аккаунтов.';

  @override
  String get adActivitySub => 'Аннулированные счета, удаления, изменения аккаунтов';

  @override
  String get adServer => 'Сервер';

  @override
  String get adServerSub => 'С кем общается это приложение. После настройки менять почти не нужно.';

  @override
  String get adServerHint => 'Эмулятор использует 10.0.2.2; реальному телефону нужен IP ноутбука в той же сети Wi-Fi. Изменение влияет на все аккаунты.';

  @override
  String get adApiBase => 'Базовый URL API';

  @override
  String get adSaveServer => 'Сохранить адрес сервера';

  @override
  String get adEmailSetSub => 'Настроено — сотрудники могут отправлять клиентам счета и выписки по e-mail.';

  @override
  String get adNotSetUp => 'Ещё не настроено.';

  @override
  String get adEmailSetBody => 'E-mail настроен. Сотрудники могут отправлять счёт или выписку прямо клиенту.';

  @override
  String get adEmailHelp => 'Адрес Gmail работает с паролем приложения (smtp.gmail.com, порт 587), либо используйте SMTP-данные вашего почтового провайдера.';

  @override
  String get adSmtpHost => 'SMTP-хост';

  @override
  String get adSmtpPort => 'SMTP-порт';

  @override
  String get adEmailAddress => 'Адрес e-mail';

  @override
  String get adPwKeep => 'Пароль (оставьте пустым, чтобы сохранить текущий)';

  @override
  String get adPwApp => 'Пароль (пароль приложения, а не пароль для входа)';

  @override
  String get adFromName => 'Имя отправителя (необязательно)';

  @override
  String get adFromHint => 'Мой хозяйственный магазин';

  @override
  String get adSaving => 'Сохранение...';

  @override
  String get adSaveEmail => 'Сохранить настройки e-mail';

  @override
  String get adAddAccount => 'Добавить аккаунт';

  @override
  String get adNameOpt => 'Имя (необязательно)';

  @override
  String get adAtLeast6 => 'Не менее 6 символов';

  @override
  String get adGrantAdmin => 'Дать права администратора';

  @override
  String get adCanManage => 'Может аннулировать/удалять/оформлять возвраты';

  @override
  String get adCanManageHint => 'Аннулировать или удалить счёт, оформить возврат счёта или удалить клиента/поставщика. У администратора это право есть всегда.';

  @override
  String get adCreate => 'Создать';

  @override
  String get adAccountCreated => 'Аккаунт создан.';

  @override
  String adCreateFailed(String error) {
    return 'Не удалось создать: $error';
  }

  @override
  String get adEditAccount => 'Изменить аккаунт';

  @override
  String get adAdminSwitch => 'Администратор';

  @override
  String get adAdminHint => 'Может открывать панель администратора';

  @override
  String get adDisabled => 'Отключён';

  @override
  String get adDisabledHint => 'Вход заблокирован';

  @override
  String get adAccountUpdated => 'Аккаунт обновлён.';

  @override
  String adUpdateFailed(String error) {
    return 'Не удалось обновить: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label будет удалён навсегда и больше не сможет войти.';
  }

  @override
  String get adAccountDeleted => 'Аккаунт удалён.';

  @override
  String adDeleteFailed(String error) {
    return 'Не удалось удалить: $error';
  }

  @override
  String get adBadgeAdmin => 'АДМИН';

  @override
  String get adBadgeDisabled => 'ОТКЛЮЧЁН';

  @override
  String get adOff => 'Панель администратора отключена';

  @override
  String get adCheckAgain => 'Проверить снова';

  @override
  String get adAccessRequired => 'Нужен доступ администратора';

  @override
  String get adAccessBody => 'Управлять аккаунтами могут только администраторы магазина. Попросите владельца магазина выдать вам доступ администратора.';

  @override
  String get adCouldNotLoad => 'Не удалось загрузить панель администратора.';

  @override
  String get adBadPort => 'Введите корректный номер SMTP-порта.';

  @override
  String get adEmailSaved => 'Настройки e-mail сохранены.';

  @override
  String adEmailSaveFailed(String error) {
    return 'Не удалось сохранить настройки e-mail: $error';
  }

  @override
  String get adServerEmpty => 'Адрес сервера не может быть пустым.';

  @override
  String get adServerSaved => 'Адрес сервера сохранён. Экраны будут использовать его при следующей загрузке.';

  @override
  String get lnOr => 'или';

  @override
  String get scNotABill => 'Это не похоже на счёт. Попробуйте ещё раз, сделав чёткое фото счёта.';

  @override
  String get scNotAnInvoice => 'Это не похоже на счёт. Попробуйте ещё раз, сделав чёткое фото счёта поставщика.';

  @override
  String get jqOpenFull => 'Во весь экран';

  @override
  String get jqCopy => 'Скопировать номер';

  @override
  String get jqSheetTitle => 'QR JazzCash';

  @override
  String get jqSheetHint => 'Клиенты сканируют его в приложении JazzCash, чтобы заплатить вам.';

  @override
  String get jqCheck => 'Проверьте номер';

  @override
  String get askVoice => 'Голос';

  @override
  String get askVoiceFallbackNote => 'Читается голосом вашего телефона.';

  @override
  String get askPace => 'Темп';

  @override
  String get askTone => 'Тон';

  @override
  String get askPaceSlower => 'Медленнее';

  @override
  String get askPaceNormal => 'Обычный';

  @override
  String get askPaceFaster => 'Быстрее';

  @override
  String get askToneCalm => 'Спокойный';

  @override
  String get askToneWarm => 'Тёплый';

  @override
  String get askToneCheerful => 'Бодрый';

  @override
  String qPaymentUpdate(String amount) {
    return 'Обновление платежа: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Клиент: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Поставщик: $name';
  }

  @override
  String qItem(String name) {
    return 'Товар: $name';
  }

  @override
  String qExpense(String name) {
    return 'Расход: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Закупка: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Получен платёж: $amount от $name';
  }

  @override
  String gstAmount(String amount) {
    return 'Налог $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Облагаемая сумма $taxable  ·  Налог $tax  ·  Итого $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Выручка: $revenue  •  Себестоимость: $cogs  •  Расходы: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Здравствуйте, $customer! Сердечный привет от $shop. Ваша общая задолженность — $amount. Спасибо!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Здравствуйте, $customer! Напоминание об оплате от $shop: непогашенный остаток — $amount. Пожалуйста, оплатите при первой возможности.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'СРОЧНОЕ УВЕДОМЛЕНИЕ: уважаемый(ая) $customer, ваша задолженность $amount в $shop не погашена. Пожалуйста, оплатите немедленно.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Оплата через JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Счёт от $shop\nИтого: $total\nТовары: $items\nСтатус: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Здравствуйте, $supplier! Это $shop. Мы хотели бы сделать заказ:\n$lines\n\nПожалуйста, подтвердите наличие и цену. Спасибо.';
  }

  @override
  String ppUpdated(String date) {
    return 'Последнее обновление: $date';
  }

  @override
  String get ppWhoH => 'Кто мы';

  @override
  String ppWho(String owner, String email) {
    return '$owner, оператор Book-keep.\nКонтакты: $email';
  }

  @override
  String get ppCollectH => 'Что мы собираем';

  @override
  String get ppCollectAccount => 'Аккаунт: адрес электронной почты, номер телефона и имя пользователя через Firebase Authentication.';

  @override
  String get ppCollectShop => 'Профиль магазина: название, адрес, номер телефона, номер JazzCash и логотип магазина — вводятся владельцем в Настройках.';

  @override
  String get ppCollectRecords => 'Деловые записи, которые вы создаёте: имена и телефоны клиентов и поставщиков, счета, закупки, каталог товаров (включая фото товаров и штрихкоды) и расходы (включая фото чеков). Это основные данные приложения — так работает учёт.';

  @override
  String get ppCollectDevice => 'Данные устройства и диагностики: токен push-уведомлений (для оповещений о низком остатке, просроченных платежах и ежедневной сводке) и отчёты о сбоях (сведения об устройстве и трассировки) через Firebase Crashlytics; отправляются автоматически при сбое приложения.';

  @override
  String ppCollectAi(String askShop) {
    return 'Функции ИИ: $askShop, утренняя сводка с ИИ и ИИ-сканер счетов/закупок отправляют срез соответствующих деловых данных (цифры отчётов или фото счёта) в Gemini API компании Google для получения ответа, сводки или извлечённых позиций. Google обрабатывает эти данные для формирования ответа; ни мы, ни Google не используем их для обучения моделей вне стандартных условий API Google.';
  }

  @override
  String get ppDontH => 'Чего мы не делаем';

  @override
  String get ppDontLocation => 'Мы не отслеживаем ваше местоположение.';

  @override
  String get ppDontAds => 'Мы не используем рекламные сети, а также инструменты поведенческой аналитики и записи сеансов.';

  @override
  String get ppDontSell => 'Мы никому не продаём ваши данные и данные ваших клиентов.';

  @override
  String get ppWhereH => 'Где хранятся данные';

  @override
  String get ppWhereDb => 'База данных: Neon (Postgres), сторонний поставщик облачных баз данных.';

  @override
  String get ppWhereFirebase => 'Аутентификация, push-уведомления, отчёты о сбоях, хранение фото: Firebase (Google).';

  @override
  String get ppWhereAi => 'Обработка ИИ: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Письма со счетами: отправляются через SMTP-аккаунт, который администратор вашего магазина настраивает в разделе «$adminPanel». У нас нет рассылок; это индивидуальные счета и выписки для ваших собственных клиентов, а не массовый маркетинг.';
  }

  @override
  String get ppYoursH => 'Ваши данные, данные ваших клиентов';

  @override
  String get ppYours => 'Всё, что вы вводите — клиенты, поставщики, счета, товары — принадлежит вашему магазину. Другие магазины, использующие Book-keep, не могут это видеть. Аккаунты сотрудников, которые вы создаёте, видят только то, к чему вы дали доступ.';

  @override
  String get ppControlsH => 'Ваш контроль';

  @override
  String ppControlExport(String path) {
    return 'Экспорт или резервное копирование данных: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Удаление аккаунта: $path. Удаляются только ваши данные для входа; деловые записи магазина (счета, клиенты, товары и т. д.) не стираются — так же, как удаление сотрудника не удаляет созданные им записи.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Уведомления: можно отключить по типам в разделе $path.';
  }

  @override
  String get ppChildrenH => 'Дети';

  @override
  String get ppChildren => 'Book-keep — это рабочий инструмент для владельцев магазинов и персонала. Он не предназначен для детей и не используется ими сознательно.';

  @override
  String get ppChangesH => 'Изменения в этой политике';

  @override
  String get ppChanges => 'Если изменится то, что мы собираем, или куда это передаётся, мы обновим эту страницу и изменим дату вверху.';

  @override
  String get ppContactH => 'Контакты';

  @override
  String ppContact(String email) {
    return 'Вопросы об этой политике или ваших данных: $email';
  }

  @override
  String get waHello => 'Здравствуйте!';

  @override
  String waHelloNamed(String name) {
    return 'Здравствуйте, $name,';
  }

  @override
  String get gstTaxable => 'Облагаемая сумма';

  @override
  String get gstTax => 'Налог';

  @override
  String get gstTaxableValue => 'Облагаемая стоимость';

  @override
  String get gstTotalTax => 'Всего налога';

  @override
  String get gstTotalItc => 'Всего входного налога к вычету';

  @override
  String get gstExempt => 'Необлагаемые продажи';

  @override
  String get gstNetPayable => 'Чистый налог к уплате';

  @override
  String get unknownName => 'Неизвестно';

  @override
  String get unitPiece => 'шт.';

  @override
  String get unitKg => 'кг';

  @override
  String get unitMeter => 'м';

  @override
  String get unitBox => 'коробка';

  @override
  String get unitDozen => 'дюжина';

  @override
  String get unitLiter => 'л';

  @override
  String get unitBag => 'мешок';

  @override
  String deleteSupplierMessage(String name) {
    return 'Удалить $name и все его закупки? Это действие нельзя отменить.';
  }
}
