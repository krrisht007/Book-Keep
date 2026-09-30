import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ps.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('pa'),
    Locale('ps'),
    Locale('pt'),
    Locale('ru'),
    Locale('sd'),
    Locale('sw'),
    Locale('tr'),
    Locale('ur'),
    Locale('zh')
  ];

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navCustomers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get navCustomers;

  /// No description provided for @navItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get navItems;

  /// No description provided for @navSuppliers.
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get navSuppliers;

  /// No description provided for @navReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get navReports;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @settingsShopDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Shop Details'**
  String get settingsShopDetailsTitle;

  /// No description provided for @settingsShopDetailsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Shown on your invoices.'**
  String get settingsShopDetailsSubtitle;

  /// No description provided for @settingsShopNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Shop Name'**
  String get settingsShopNameLabel;

  /// No description provided for @settingsShopAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Shop Address'**
  String get settingsShopAddressLabel;

  /// No description provided for @settingsPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get settingsPhoneLabel;

  /// No description provided for @settingsSaveShopDetails.
  ///
  /// In en, this message translates to:
  /// **'Save Shop Details'**
  String get settingsSaveShopDetails;

  /// No description provided for @settingsAppearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearanceTitle;

  /// No description provided for @settingsAppearanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a theme for the whole app.'**
  String get settingsAppearanceSubtitle;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @settingsLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the app\'s display language.'**
  String get settingsLanguageSubtitle;

  /// No description provided for @sortNameNewest.
  ///
  /// In en, this message translates to:
  /// **'Sort: Name / Newest'**
  String get sortNameNewest;

  /// No description provided for @addCustomer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get addCustomer;

  /// No description provided for @importCsv.
  ///
  /// In en, this message translates to:
  /// **'Import CSV'**
  String get importCsv;

  /// No description provided for @searchShop.
  ///
  /// In en, this message translates to:
  /// **'Search Shop'**
  String get searchShop;

  /// No description provided for @scanToFindItem.
  ///
  /// In en, this message translates to:
  /// **'Scan to Find Item'**
  String get scanToFindItem;

  /// No description provided for @bulkAdd.
  ///
  /// In en, this message translates to:
  /// **'Bulk Add'**
  String get bulkAdd;

  /// No description provided for @updateStock.
  ///
  /// In en, this message translates to:
  /// **'Update Stock'**
  String get updateStock;

  /// No description provided for @printLabels.
  ///
  /// In en, this message translates to:
  /// **'Print Labels'**
  String get printLabels;

  /// No description provided for @mergeDuplicates.
  ///
  /// In en, this message translates to:
  /// **'Merge Duplicates'**
  String get mergeDuplicates;

  /// No description provided for @addSupplier.
  ///
  /// In en, this message translates to:
  /// **'Add Supplier'**
  String get addSupplier;

  /// No description provided for @scanPurchaseInvoice.
  ///
  /// In en, this message translates to:
  /// **'Scan Purchase Invoice'**
  String get scanPurchaseInvoice;

  /// No description provided for @askNoAnswer.
  ///
  /// In en, this message translates to:
  /// **'Could not get an answer: {reason}'**
  String askNoAnswer(String reason);

  /// No description provided for @couldNotConnect.
  ///
  /// In en, this message translates to:
  /// **'Could not connect: {error}'**
  String couldNotConnect(String error);

  /// No description provided for @micPermissionNeeded.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is needed for voice input.'**
  String get micPermissionNeeded;

  /// No description provided for @speechUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition isn\'t available on this device.'**
  String get speechUnavailable;

  /// No description provided for @askYourShop.
  ///
  /// In en, this message translates to:
  /// **'Ask Your Shop'**
  String get askYourShop;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @askIntro.
  ///
  /// In en, this message translates to:
  /// **'Wondering how the shop is doing? Ask me, and I’ll answer from what’s in your books.'**
  String get askIntro;

  /// No description provided for @askListening.
  ///
  /// In en, this message translates to:
  /// **'Listening…'**
  String get askListening;

  /// No description provided for @askThinkingWords.
  ///
  /// In en, this message translates to:
  /// **'Thinking…|Working on it…|Figuring it out…|Crunching the numbers…|Checking your books…|Adding it up…|Doing the math…|Tallying things up…|Digging through the figures…|Connecting the dots…|Pondering…|Sorting it out…'**
  String get askThinkingWords;

  /// No description provided for @askSayQuestion.
  ///
  /// In en, this message translates to:
  /// **'Say your question — tap the orb to cancel'**
  String get askSayQuestion;

  /// No description provided for @briefingRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not refresh briefing ({code}).'**
  String briefingRefreshFailed(int code);

  /// No description provided for @refreshFailedOffline.
  ///
  /// In en, this message translates to:
  /// **'Could not refresh — check your connection.'**
  String get refreshFailedOffline;

  /// No description provided for @newBillFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not start a new bill — check your connection and try again.'**
  String get newBillFailed;

  /// No description provided for @setPreferredSupplierFirst.
  ///
  /// In en, this message translates to:
  /// **'Set a preferred supplier for {name} first (tap to edit).'**
  String setPreferredSupplierFirst(String name);

  /// No description provided for @reorderBySupplier.
  ///
  /// In en, this message translates to:
  /// **'Reorder by supplier'**
  String get reorderBySupplier;

  /// No description provided for @supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get supplier;

  /// No description provided for @itemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String itemCount(int count);

  /// No description provided for @noLowStockWithSupplier.
  ///
  /// In en, this message translates to:
  /// **'No low-stock items have a preferred supplier set yet.'**
  String get noLowStockWithSupplier;

  /// No description provided for @thisSupplier.
  ///
  /// In en, this message translates to:
  /// **'This supplier'**
  String get thisSupplier;

  /// No description provided for @supplierNoPhone.
  ///
  /// In en, this message translates to:
  /// **'{name} has no phone number set.'**
  String supplierNoPhone(String name);

  /// No description provided for @tabOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get tabOverview;

  /// No description provided for @tabStock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get tabStock;

  /// No description provided for @tabMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get tabMoney;

  /// No description provided for @taglineOverview.
  ///
  /// In en, this message translates to:
  /// **'Today\'s dues, stock, and cash at a glance.'**
  String get taglineOverview;

  /// No description provided for @taglineStock.
  ///
  /// In en, this message translates to:
  /// **'What\'s moving, what\'s running low.'**
  String get taglineStock;

  /// No description provided for @taglineMoney.
  ///
  /// In en, this message translates to:
  /// **'Expenses, reconciliation, and collections.'**
  String get taglineMoney;

  /// No description provided for @loadingDashboard.
  ///
  /// In en, this message translates to:
  /// **'Loading dashboard… {done} of {total}'**
  String loadingDashboard(int done, int total);

  /// No description provided for @dashboardLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load the dashboard'**
  String get dashboardLoadFailed;

  /// No description provided for @checkConnectionRetry.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.'**
  String get checkConnectionRetry;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @aiBriefing.
  ///
  /// In en, this message translates to:
  /// **'AI Briefing'**
  String get aiBriefing;

  /// No description provided for @briefingPrompt.
  ///
  /// In en, this message translates to:
  /// **'See yesterday\'s business summed up in a few sentences.'**
  String get briefingPrompt;

  /// No description provided for @getBriefing.
  ///
  /// In en, this message translates to:
  /// **'Get Briefing'**
  String get getBriefing;

  /// No description provided for @refreshBriefing.
  ///
  /// In en, this message translates to:
  /// **'Refresh briefing'**
  String get refreshBriefing;

  /// No description provided for @updatedAt.
  ///
  /// In en, this message translates to:
  /// **'Updated {time}'**
  String updatedAt(String time);

  /// No description provided for @customersUnknown.
  ///
  /// In en, this message translates to:
  /// **'— customers'**
  String get customersUnknown;

  /// No description provided for @customerCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 customer} other{{count} customers}}'**
  String customerCount(int count);

  /// No description provided for @previousMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get previousMonth;

  /// No description provided for @nextMonth.
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get nextMonth;

  /// No description provided for @salesMonth.
  ///
  /// In en, this message translates to:
  /// **'Sales (Month)'**
  String get salesMonth;

  /// No description provided for @outstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get outstanding;

  /// No description provided for @profitMonth.
  ///
  /// In en, this message translates to:
  /// **'Profit (Month)'**
  String get profitMonth;

  /// No description provided for @cashToday.
  ///
  /// In en, this message translates to:
  /// **'Cash Today'**
  String get cashToday;

  /// No description provided for @newBill.
  ///
  /// In en, this message translates to:
  /// **'New Bill'**
  String get newBill;

  /// No description provided for @scanHandwrittenBill.
  ///
  /// In en, this message translates to:
  /// **'Scan a Handwritten Bill'**
  String get scanHandwrittenBill;

  /// No description provided for @topOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Top Outstanding Balances'**
  String get topOutstanding;

  /// No description provided for @viewAllInDues.
  ///
  /// In en, this message translates to:
  /// **'View all {count} in Dues Center'**
  String viewAllInDues(int count);

  /// No description provided for @lowStockAlerts.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Alerts'**
  String get lowStockAlerts;

  /// No description provided for @noLowStock.
  ///
  /// In en, this message translates to:
  /// **'No low-stock items — stock looks good.'**
  String get noLowStock;

  /// No description provided for @whatsappAll.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp All'**
  String get whatsappAll;

  /// No description provided for @reorderAll.
  ///
  /// In en, this message translates to:
  /// **'Reorder All'**
  String get reorderAll;

  /// No description provided for @suggestReorder.
  ///
  /// In en, this message translates to:
  /// **'Suggest reordering {qty} {unit}'**
  String suggestReorder(String qty, String unit);

  /// No description provided for @stockLeft.
  ///
  /// In en, this message translates to:
  /// **'{qty} {unit} left'**
  String stockLeft(String qty, String unit);

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @whatsappSupplier.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp supplier'**
  String get whatsappSupplier;

  /// No description provided for @topItemsByRevenue.
  ///
  /// In en, this message translates to:
  /// **'Top Items by Revenue'**
  String get topItemsByRevenue;

  /// No description provided for @noSalesYet.
  ///
  /// In en, this message translates to:
  /// **'No sales recorded yet.'**
  String get noSalesYet;

  /// No description provided for @qtyLabel.
  ///
  /// In en, this message translates to:
  /// **'Qty: {qty}'**
  String qtyLabel(String qty);

  /// No description provided for @monthExpenses.
  ///
  /// In en, this message translates to:
  /// **'This Month\'s Expenses'**
  String get monthExpenses;

  /// No description provided for @noExpensesMonth.
  ///
  /// In en, this message translates to:
  /// **'No expenses recorded this month.'**
  String get noExpensesMonth;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @dailyCashReconciliation.
  ///
  /// In en, this message translates to:
  /// **'Daily Cash Reconciliation'**
  String get dailyCashReconciliation;

  /// No description provided for @collectMoney.
  ///
  /// In en, this message translates to:
  /// **'Collect Money'**
  String get collectMoney;

  /// No description provided for @changesSavedOffline.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 change saved offline} other{{count} changes saved offline}}'**
  String changesSavedOffline(int count);

  /// No description provided for @willSyncOnline.
  ///
  /// In en, this message translates to:
  /// **'Will sync automatically when back online'**
  String get willSyncOnline;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing'**
  String get syncing;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @shopProfile.
  ///
  /// In en, this message translates to:
  /// **'Shop Profile'**
  String get shopProfile;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @backupExport.
  ///
  /// In en, this message translates to:
  /// **'Backup & Export'**
  String get backupExport;

  /// No description provided for @adminPanel.
  ///
  /// In en, this message translates to:
  /// **'Admin Panel'**
  String get adminPanel;

  /// No description provided for @toolsSync.
  ///
  /// In en, this message translates to:
  /// **'Tools & Sync'**
  String get toolsSync;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @shopDetailsSaved.
  ///
  /// In en, this message translates to:
  /// **'Shop details saved.'**
  String get shopDetailsSaved;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save ({code})'**
  String saveFailed(int code);

  /// No description provided for @couldNotSave.
  ///
  /// In en, this message translates to:
  /// **'Could not save: {error}'**
  String couldNotSave(String error);

  /// No description provided for @logoUpdated.
  ///
  /// In en, this message translates to:
  /// **'Logo updated.'**
  String get logoUpdated;

  /// No description provided for @logoUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload logo ({code})'**
  String logoUploadFailed(int code);

  /// No description provided for @couldNotUploadLogo.
  ///
  /// In en, this message translates to:
  /// **'Could not upload logo: {error}'**
  String couldNotUploadLogo(String error);

  /// No description provided for @healthGood.
  ///
  /// In en, this message translates to:
  /// **'Looking good overall.'**
  String get healthGood;

  /// No description provided for @healthSome.
  ///
  /// In en, this message translates to:
  /// **'A few things could use attention.'**
  String get healthSome;

  /// No description provided for @healthMany.
  ///
  /// In en, this message translates to:
  /// **'Several things need attention.'**
  String get healthMany;

  /// No description provided for @shopHealth.
  ///
  /// In en, this message translates to:
  /// **'Shop Health'**
  String get shopHealth;

  /// No description provided for @healthIntro.
  ///
  /// In en, this message translates to:
  /// **'A quick nudge, not another report to read.'**
  String get healthIntro;

  /// No description provided for @couldNotLoadCheckConnection.
  ///
  /// In en, this message translates to:
  /// **'Could not load — check your connection.'**
  String get couldNotLoadCheckConnection;

  /// No description provided for @itemPhotos.
  ///
  /// In en, this message translates to:
  /// **'Item photos'**
  String get itemPhotos;

  /// No description provided for @barcodes.
  ///
  /// In en, this message translates to:
  /// **'Barcodes'**
  String get barcodes;

  /// No description provided for @lowStockItems.
  ///
  /// In en, this message translates to:
  /// **'Low-stock items'**
  String get lowStockItems;

  /// No description provided for @lastBackup.
  ///
  /// In en, this message translates to:
  /// **'Last backup'**
  String get lastBackup;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'yesterday'**
  String get yesterday;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day ago} other{{days} days ago}}'**
  String daysAgo(int days);

  /// No description provided for @offlineStatus.
  ///
  /// In en, this message translates to:
  /// **'Offline Status'**
  String get offlineStatus;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @waitingToSync.
  ///
  /// In en, this message translates to:
  /// **'Waiting to sync'**
  String get waitingToSync;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync now'**
  String get syncNow;

  /// No description provided for @searchSettings.
  ///
  /// In en, this message translates to:
  /// **'Search settings'**
  String get searchSettings;

  /// No description provided for @noSettingsMatch.
  ///
  /// In en, this message translates to:
  /// **'No settings match \"{query}\"'**
  String noSettingsMatch(String query);

  /// No description provided for @businessInfo.
  ///
  /// In en, this message translates to:
  /// **'BUSINESS INFO'**
  String get businessInfo;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'PAYMENT'**
  String get payment;

  /// No description provided for @shopNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Shop name is required'**
  String get shopNameRequired;

  /// No description provided for @phoneIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Enter a complete {digits}-digit phone number'**
  String phoneIncomplete(int digits);

  /// No description provided for @jazzcashOptional.
  ///
  /// In en, this message translates to:
  /// **'JazzCash Number (optional)'**
  String get jazzcashOptional;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved!'**
  String get saved;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change the app\'s display language'**
  String get languageSubtitle;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Low stock, overdue payments & daily summary'**
  String get notificationsSubtitle;

  /// No description provided for @backupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Download, restore & export shop data'**
  String get backupSubtitle;

  /// No description provided for @appUpdate.
  ///
  /// In en, this message translates to:
  /// **'App update'**
  String get appUpdate;

  /// No description provided for @appUpdateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check for a newer version'**
  String get appUpdateSubtitle;

  /// No description provided for @adminSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage accounts & shop data'**
  String get adminSubtitle;

  /// No description provided for @accountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign-in, password & username'**
  String get accountSubtitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'What data we collect and why'**
  String get privacySubtitle;

  /// No description provided for @yourShop.
  ///
  /// In en, this message translates to:
  /// **'Your Shop'**
  String get yourShop;

  /// No description provided for @uploadingLogo.
  ///
  /// In en, this message translates to:
  /// **'Uploading shop logo'**
  String get uploadingLogo;

  /// No description provided for @logoTapToChange.
  ///
  /// In en, this message translates to:
  /// **'Shop logo, tap to change'**
  String get logoTapToChange;

  /// No description provided for @brandTagline.
  ///
  /// In en, this message translates to:
  /// **'Busy shop, calm books.'**
  String get brandTagline;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error: {code}'**
  String serverError(int code);

  /// No description provided for @deleteCustomer.
  ///
  /// In en, this message translates to:
  /// **'Delete Customer'**
  String get deleteCustomer;

  /// No description provided for @deleteCustomerMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete {name} and all their bills? This cannot be undone.'**
  String deleteCustomerMessage(String name);

  /// No description provided for @couldNotDeleteDetail.
  ///
  /// In en, this message translates to:
  /// **'Could not delete: {detail}'**
  String couldNotDeleteDetail(String detail);

  /// No description provided for @couldNotDeleteOffline.
  ///
  /// In en, this message translates to:
  /// **'Could not delete — check your connection and try again.'**
  String get couldNotDeleteOffline;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteCustomersTitle.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 Customer} other{Delete {count} Customers}}'**
  String deleteCustomersTitle(int count);

  /// No description provided for @deleteCustomersMessage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 customer and all their bills? This cannot be undone.} other{Delete {count} customers and all their bills? This cannot be undone.}}'**
  String deleteCustomersMessage(int count);

  /// No description provided for @deselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get deselectAll;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// No description provided for @selectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String selectedCount(int count);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @newTag.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get newTag;

  /// No description provided for @csvNeedsRows.
  ///
  /// In en, this message translates to:
  /// **'CSV needs a header row plus at least one customer.'**
  String get csvNeedsRows;

  /// No description provided for @csvNeedsName.
  ///
  /// In en, this message translates to:
  /// **'CSV header must include a \"name\" column.'**
  String get csvNeedsName;

  /// No description provided for @csvLineMissingName.
  ///
  /// In en, this message translates to:
  /// **'Line {line}: missing name — fix the file and retry.'**
  String csvLineMissingName(int line);

  /// No description provided for @csvLineBadCredit.
  ///
  /// In en, this message translates to:
  /// **'Line {line}: invalid credit_limit \"{value}\" — fix the file and retry.'**
  String csvLineBadCredit(int line, String value);

  /// No description provided for @importCustomers.
  ///
  /// In en, this message translates to:
  /// **'Import Customers'**
  String get importCustomers;

  /// No description provided for @importCustomersConfirm.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Found 1 customer in \"{file}\". Import them all?} other{Found {count} customers in \"{file}\". Import them all?}}'**
  String importCustomersConfirm(int count, String file);

  /// No description provided for @importAction.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get importAction;

  /// No description provided for @importedCustomers.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Imported 1 customer.} other{Imported {count} customers.}}'**
  String importedCustomers(int count);

  /// No description provided for @importFailed.
  ///
  /// In en, this message translates to:
  /// **'Import failed: {detail}'**
  String importFailed(String detail);

  /// No description provided for @importFailedOffline.
  ///
  /// In en, this message translates to:
  /// **'Import failed — could not connect: {error}'**
  String importFailedOffline(String error);

  /// No description provided for @noPhone.
  ///
  /// In en, this message translates to:
  /// **'No phone'**
  String get noPhone;

  /// No description provided for @offlineShowingSaved.
  ///
  /// In en, this message translates to:
  /// **'Offline — showing saved copy'**
  String get offlineShowingSaved;

  /// No description provided for @searchCustomersHint.
  ///
  /// In en, this message translates to:
  /// **'Search customers or phone...'**
  String get searchCustomersHint;

  /// No description provided for @noCustomersYet.
  ///
  /// In en, this message translates to:
  /// **'No customers yet. Tap + to add one.'**
  String get noCustomersYet;

  /// No description provided for @noCustomersMatch.
  ///
  /// In en, this message translates to:
  /// **'No customers match your search.'**
  String get noCustomersMatch;

  /// No description provided for @owesMoney.
  ///
  /// In en, this message translates to:
  /// **'Owes Money'**
  String get owesMoney;

  /// No description provided for @settledUp.
  ///
  /// In en, this message translates to:
  /// **'Settled Up'**
  String get settledUp;

  /// No description provided for @couldNotLoadLabel.
  ///
  /// In en, this message translates to:
  /// **'Could not load {what}: {error}'**
  String couldNotLoadLabel(String error, String what);

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @callPhone.
  ///
  /// In en, this message translates to:
  /// **'Call {phone}'**
  String callPhone(String phone);

  /// No description provided for @whatsappPhone.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp {phone}'**
  String whatsappPhone(String phone);

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @askHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. How much profit did I make this month?'**
  String get askHint;

  /// No description provided for @acctTurnOffLockTitle.
  ///
  /// In en, this message translates to:
  /// **'Turn off App Lock?'**
  String get acctTurnOffLockTitle;

  /// No description provided for @acctTurnOffLockBody.
  ///
  /// In en, this message translates to:
  /// **'Anyone with this phone will be able to open the app without a PIN.'**
  String get acctTurnOffLockBody;

  /// No description provided for @acctTurnOff.
  ///
  /// In en, this message translates to:
  /// **'Turn Off'**
  String get acctTurnOff;

  /// No description provided for @acctSetPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Set a PIN'**
  String get acctSetPinTitle;

  /// No description provided for @acctPinLabel.
  ///
  /// In en, this message translates to:
  /// **'4-6 digit PIN'**
  String get acctPinLabel;

  /// No description provided for @acctPinMin.
  ///
  /// In en, this message translates to:
  /// **'At least 4 digits'**
  String get acctPinMin;

  /// No description provided for @acctConfirmPin.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get acctConfirmPin;

  /// No description provided for @acctPinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs don\'t match'**
  String get acctPinMismatch;

  /// No description provided for @acctSetPin.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get acctSetPin;

  /// No description provided for @acctBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint/face too?'**
  String get acctBiometricTitle;

  /// No description provided for @acctBiometricBody.
  ///
  /// In en, this message translates to:
  /// **'You can still use the PIN if biometrics ever fail.'**
  String get acctBiometricBody;

  /// No description provided for @acctNoThanks.
  ///
  /// In en, this message translates to:
  /// **'No thanks'**
  String get acctNoThanks;

  /// No description provided for @acctEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get acctEnable;

  /// No description provided for @acctSetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Set a password'**
  String get acctSetPasswordTitle;

  /// No description provided for @acctSetPasswordIntro.
  ///
  /// In en, this message translates to:
  /// **'Choose a password so you can also sign in with email + password next time, instead of only Google.'**
  String get acctSetPasswordIntro;

  /// No description provided for @acctPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get acctPassword;

  /// No description provided for @acctPasswordMin.
  ///
  /// In en, this message translates to:
  /// **'Must be at least 6 characters'**
  String get acctPasswordMin;

  /// No description provided for @acctConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get acctConfirmPassword;

  /// No description provided for @acctPasswordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get acctPasswordsMismatch;

  /// No description provided for @acctSetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get acctSetPasswordButton;

  /// No description provided for @acctPasswordSet.
  ///
  /// In en, this message translates to:
  /// **'Password set — you can now sign in with it too.'**
  String get acctPasswordSet;

  /// No description provided for @acctCouldNotSetPassword.
  ///
  /// In en, this message translates to:
  /// **'Could not set password: {error}'**
  String acctCouldNotSetPassword(String error);

  /// No description provided for @acctChangePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get acctChangePasswordTitle;

  /// No description provided for @acctCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get acctCurrentPassword;

  /// No description provided for @acctRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get acctRequired;

  /// No description provided for @acctNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get acctNewPassword;

  /// No description provided for @acctConfirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get acctConfirmNewPassword;

  /// No description provided for @acctChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get acctChange;

  /// No description provided for @acctPasswordChanged.
  ///
  /// In en, this message translates to:
  /// **'Password changed.'**
  String get acctPasswordChanged;

  /// No description provided for @acctWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password is incorrect.'**
  String get acctWrongPassword;

  /// No description provided for @acctCouldNotChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Could not change password: {error}'**
  String acctCouldNotChangePassword(String error);

  /// No description provided for @acctChangeUsernameTitle.
  ///
  /// In en, this message translates to:
  /// **'Change username'**
  String get acctChangeUsernameTitle;

  /// No description provided for @acctUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get acctUsername;

  /// No description provided for @acctUsernameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Username can\'t be empty'**
  String get acctUsernameEmpty;

  /// No description provided for @acctUsernameChanged.
  ///
  /// In en, this message translates to:
  /// **'Username changed.'**
  String get acctUsernameChanged;

  /// No description provided for @acctChangeEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Change email'**
  String get acctChangeEmailTitle;

  /// No description provided for @acctNewEmail.
  ///
  /// In en, this message translates to:
  /// **'New email'**
  String get acctNewEmail;

  /// No description provided for @acctValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get acctValidEmail;

  /// No description provided for @acctRequiredConfirm.
  ///
  /// In en, this message translates to:
  /// **'Required to confirm it\'s you'**
  String get acctRequiredConfirm;

  /// No description provided for @acctGoogleConfirmFirst.
  ///
  /// In en, this message translates to:
  /// **'You\'ll be asked to confirm with Google first.'**
  String get acctGoogleConfirmFirst;

  /// No description provided for @acctCheckEmail.
  ///
  /// In en, this message translates to:
  /// **'Check {email} for a link to confirm the change.'**
  String acctCheckEmail(String email);

  /// No description provided for @acctProviderGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get acctProviderGoogle;

  /// No description provided for @acctProviderPassword.
  ///
  /// In en, this message translates to:
  /// **'password sign-in'**
  String get acctProviderPassword;

  /// No description provided for @acctRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove {provider}?'**
  String acctRemoveTitle(String provider);

  /// No description provided for @acctRemoveBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ll no longer be able to sign in with {provider} on this account.'**
  String acctRemoveBody(String provider);

  /// No description provided for @acctRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get acctRemove;

  /// No description provided for @acctRemoved.
  ///
  /// In en, this message translates to:
  /// **'{provider} removed.'**
  String acctRemoved(String provider);

  /// No description provided for @acctSignedIn.
  ///
  /// In en, this message translates to:
  /// **'Signed in'**
  String get acctSignedIn;

  /// No description provided for @acctEmailNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Email not verified yet.'**
  String get acctEmailNotVerified;

  /// No description provided for @acctVerificationSent.
  ///
  /// In en, this message translates to:
  /// **'Verification email sent.'**
  String get acctVerificationSent;

  /// No description provided for @acctResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get acctResend;

  /// No description provided for @acctSectionSignIn.
  ///
  /// In en, this message translates to:
  /// **'SIGN-IN & SECURITY'**
  String get acctSectionSignIn;

  /// No description provided for @acctRowChangeUsername.
  ///
  /// In en, this message translates to:
  /// **'Change Username'**
  String get acctRowChangeUsername;

  /// No description provided for @acctRowChangeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get acctRowChangeEmail;

  /// No description provided for @acctRowSetPassword.
  ///
  /// In en, this message translates to:
  /// **'Set a Password'**
  String get acctRowSetPassword;

  /// No description provided for @acctRowChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get acctRowChangePassword;

  /// No description provided for @acctRowUnlinkGoogle.
  ///
  /// In en, this message translates to:
  /// **'Unlink Google'**
  String get acctRowUnlinkGoogle;

  /// No description provided for @acctRowRemovePassword.
  ///
  /// In en, this message translates to:
  /// **'Remove Password'**
  String get acctRowRemovePassword;

  /// No description provided for @acctRowAppLock.
  ///
  /// In en, this message translates to:
  /// **'App Lock (PIN)'**
  String get acctRowAppLock;

  /// No description provided for @acctRowBiometric.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint/face'**
  String get acctRowBiometric;

  /// No description provided for @acctSignOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out?'**
  String get acctSignOutTitle;

  /// No description provided for @acctSignOutBody.
  ///
  /// In en, this message translates to:
  /// **'You will need to sign in again to use the app.'**
  String get acctSignOutBody;

  /// No description provided for @acctSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get acctSignOut;

  /// No description provided for @acctDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get acctDeleteAccount;

  /// No description provided for @acctDeleting.
  ///
  /// In en, this message translates to:
  /// **'Deleting...'**
  String get acctDeleting;

  /// No description provided for @acctDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get acctDeleteTitle;

  /// No description provided for @acctDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your sign-in credentials. You will need to sign up again to use the app. This cannot be undone.'**
  String get acctDeleteBody;

  /// No description provided for @acctCouldNotDelete.
  ///
  /// In en, this message translates to:
  /// **'Could not delete account: {error}'**
  String acctCouldNotDelete(String error);

  /// No description provided for @itmNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Item not found'**
  String get itmNotFoundTitle;

  /// No description provided for @itmNotFoundBody.
  ///
  /// In en, this message translates to:
  /// **'No item has barcode {barcode}. Add it as a new item now?'**
  String itmNotFoundBody(String barcode);

  /// No description provided for @itmAddItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get itmAddItem;

  /// No description provided for @itmEditItem.
  ///
  /// In en, this message translates to:
  /// **'Edit Item'**
  String get itmEditItem;

  /// No description provided for @itmMergeTitle.
  ///
  /// In en, this message translates to:
  /// **'Merge Duplicate Items'**
  String get itmMergeTitle;

  /// No description provided for @itmMergeBody.
  ///
  /// In en, this message translates to:
  /// **'Items with the same name will be merged into the oldest entry, combining their stock quantities. This cannot be undone.'**
  String get itmMergeBody;

  /// No description provided for @itmMerge.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get itmMerge;

  /// No description provided for @itmNoDuplicates.
  ///
  /// In en, this message translates to:
  /// **'No duplicate items found.'**
  String get itmNoDuplicates;

  /// No description provided for @itmMerged.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Merged 1 duplicate item.} other{Merged {count} duplicate items.}}'**
  String itmMerged(int count);

  /// No description provided for @itmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get itmDeleteTitle;

  /// No description provided for @itmCannotUndo.
  ///
  /// In en, this message translates to:
  /// **'This cannot be undone.'**
  String get itmCannotUndo;

  /// No description provided for @itmDeleteOffline.
  ///
  /// In en, this message translates to:
  /// **'Could not delete — check your connection and try again.'**
  String get itmDeleteOffline;

  /// No description provided for @itmDeleteManyTitle.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 Item} other{Delete {count} Items}}'**
  String itmDeleteManyTitle(int count);

  /// No description provided for @itmDeleteManyBody.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 item? This cannot be undone.} other{Delete {count} items? This cannot be undone.}}'**
  String itmDeleteManyBody(int count);

  /// No description provided for @itmPhotoUploadFailedCode.
  ///
  /// In en, this message translates to:
  /// **'Could not upload photo ({code})'**
  String itmPhotoUploadFailedCode(int code);

  /// No description provided for @itmPhotoUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not upload photo: {error}'**
  String itmPhotoUploadFailed(String error);

  /// No description provided for @itmNoBarcodes.
  ///
  /// In en, this message translates to:
  /// **'No items have a barcode yet.'**
  String get itmNoBarcodes;

  /// No description provided for @itmPrintCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Print 1 Label} other{Print {count} Labels}}'**
  String itmPrintCount(int count);

  /// No description provided for @itmSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search items or category...'**
  String get itmSearchHint;

  /// No description provided for @itmStopListening.
  ///
  /// In en, this message translates to:
  /// **'Stop listening'**
  String get itmStopListening;

  /// No description provided for @itmVoiceSearch.
  ///
  /// In en, this message translates to:
  /// **'Voice search'**
  String get itmVoiceSearch;

  /// No description provided for @itmSort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get itmSort;

  /// No description provided for @itmSortName.
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get itmSortName;

  /// No description provided for @itmSortStockLow.
  ///
  /// In en, this message translates to:
  /// **'Stock: low to high'**
  String get itmSortStockLow;

  /// No description provided for @itmSortRecent.
  ///
  /// In en, this message translates to:
  /// **'Recently added'**
  String get itmSortRecent;

  /// No description provided for @itmFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get itmFilterAll;

  /// No description provided for @itmFilterLowStock.
  ///
  /// In en, this message translates to:
  /// **'Low Stock'**
  String get itmFilterLowStock;

  /// No description provided for @itmNoItemsYet.
  ///
  /// In en, this message translates to:
  /// **'No items yet. Tap + to add one.'**
  String get itmNoItemsYet;

  /// No description provided for @itmNoItemsMatch.
  ///
  /// In en, this message translates to:
  /// **'No items match your search.'**
  String get itmNoItemsMatch;

  /// No description provided for @itmNoPriceChanges.
  ///
  /// In en, this message translates to:
  /// **'No price changes recorded yet.'**
  String get itmNoPriceChanges;

  /// No description provided for @itmNoStockCorrections.
  ///
  /// In en, this message translates to:
  /// **'No stock corrections recorded yet.'**
  String get itmNoStockCorrections;

  /// No description provided for @itmResetHistory.
  ///
  /// In en, this message translates to:
  /// **'Reset history'**
  String get itmResetHistory;

  /// No description provided for @itmResetHistoryMsg.
  ///
  /// In en, this message translates to:
  /// **'Reset the history for this item? This can\'t be undone.'**
  String get itmResetHistoryMsg;

  /// No description provided for @itmSendPdf.
  ///
  /// In en, this message translates to:
  /// **'Send as PDF'**
  String get itmSendPdf;

  /// No description provided for @itmNoteOptional.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get itmNoteOptional;

  /// No description provided for @itmNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Add a note for this change'**
  String get itmNoteHint;

  /// No description provided for @itmRemoveEntry.
  ///
  /// In en, this message translates to:
  /// **'Remove entry'**
  String get itmRemoveEntry;

  /// No description provided for @itmRemoveEntryMsg.
  ///
  /// In en, this message translates to:
  /// **'Remove this entry from the history? This can\'t be undone.'**
  String get itmRemoveEntryMsg;

  /// No description provided for @itmEditEntry.
  ///
  /// In en, this message translates to:
  /// **'Edit entry'**
  String get itmEditEntry;

  /// No description provided for @itmPrevQty.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get itmPrevQty;

  /// No description provided for @itmNewQty.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get itmNewQty;

  /// No description provided for @itmCost.
  ///
  /// In en, this message translates to:
  /// **'Cost: {amount}'**
  String itmCost(String amount);

  /// No description provided for @itmMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get itmMore;

  /// No description provided for @itmMenuPrintLabel.
  ///
  /// In en, this message translates to:
  /// **'Print label'**
  String get itmMenuPrintLabel;

  /// No description provided for @itmMenuDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Duplicate'**
  String get itmMenuDuplicate;

  /// No description provided for @itmMenuPriceHistory.
  ///
  /// In en, this message translates to:
  /// **'Price history'**
  String get itmMenuPriceHistory;

  /// No description provided for @itmMenuStockHistory.
  ///
  /// In en, this message translates to:
  /// **'Stock adjustment history'**
  String get itmMenuStockHistory;

  /// No description provided for @itmLowStockBadge.
  ///
  /// In en, this message translates to:
  /// **'{count} low stock'**
  String itmLowStockBadge(int count);

  /// No description provided for @itmStockLine.
  ///
  /// In en, this message translates to:
  /// **'Stock: {qty}'**
  String itmStockLine(String qty);

  /// No description provided for @itmOfflineSaved.
  ///
  /// In en, this message translates to:
  /// **'Offline — item saved on this device, will sync automatically when back online'**
  String get itmOfflineSaved;

  /// No description provided for @itmItemName.
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get itmItemName;

  /// No description provided for @itmNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get itmNameRequired;

  /// No description provided for @itmPricePkr.
  ///
  /// In en, this message translates to:
  /// **'Price (PKR)'**
  String get itmPricePkr;

  /// No description provided for @itmPriceRequired.
  ///
  /// In en, this message translates to:
  /// **'Price is required'**
  String get itmPriceRequired;

  /// No description provided for @itmValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid number'**
  String get itmValidNumber;

  /// No description provided for @itmUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get itmUnit;

  /// No description provided for @itmCategoryHint.
  ///
  /// In en, this message translates to:
  /// **'Category (optional, e.g. Plumbing)'**
  String get itmCategoryHint;

  /// No description provided for @itmPreferredSupplier.
  ///
  /// In en, this message translates to:
  /// **'Preferred Supplier (optional)'**
  String get itmPreferredSupplier;

  /// No description provided for @itmPreferredSupplierHelper.
  ///
  /// In en, this message translates to:
  /// **'Used by the one-tap Reorder action'**
  String get itmPreferredSupplierHelper;

  /// No description provided for @itmClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get itmClear;

  /// No description provided for @itmHsn.
  ///
  /// In en, this message translates to:
  /// **'HSN Code (optional)'**
  String get itmHsn;

  /// No description provided for @itmGstRate.
  ///
  /// In en, this message translates to:
  /// **'GST Rate % (optional)'**
  String get itmGstRate;

  /// No description provided for @itmBarcodeOptional.
  ///
  /// In en, this message translates to:
  /// **'Barcode (optional)'**
  String get itmBarcodeOptional;

  /// No description provided for @itmScanOrType.
  ///
  /// In en, this message translates to:
  /// **'Scan or type'**
  String get itmScanOrType;

  /// No description provided for @itmScanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get itmScanBarcode;

  /// No description provided for @itmPurchaseCost.
  ///
  /// In en, this message translates to:
  /// **'Purchase Cost (per unit)'**
  String get itmPurchaseCost;

  /// No description provided for @itmPurchaseCostHint.
  ///
  /// In en, this message translates to:
  /// **'What you pay when buying stock'**
  String get itmPurchaseCostHint;

  /// No description provided for @itmWholesale.
  ///
  /// In en, this message translates to:
  /// **'Wholesale Price (optional)'**
  String get itmWholesale;

  /// No description provided for @itmContractor.
  ///
  /// In en, this message translates to:
  /// **'Contractor Price (optional)'**
  String get itmContractor;

  /// No description provided for @itmFallsBack.
  ///
  /// In en, this message translates to:
  /// **'Falls back to normal price'**
  String get itmFallsBack;

  /// No description provided for @itmStockQty.
  ///
  /// In en, this message translates to:
  /// **'Stock Quantity'**
  String get itmStockQty;

  /// No description provided for @itmLowStockAlert.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Alert Below'**
  String get itmLowStockAlert;

  /// No description provided for @itmFrequently.
  ///
  /// In en, this message translates to:
  /// **'Frequently bought with'**
  String get itmFrequently;

  /// No description provided for @itmSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get itmSaveChanges;

  /// No description provided for @itmSaveItem.
  ///
  /// In en, this message translates to:
  /// **'Save Item'**
  String get itmSaveItem;

  /// No description provided for @itmPhotoSemantics.
  ///
  /// In en, this message translates to:
  /// **'Item photo, tap to change'**
  String get itmPhotoSemantics;

  /// No description provided for @cdUpdateStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Payment Status'**
  String get cdUpdateStatusTitle;

  /// No description provided for @cdMarkPaidQ.
  ///
  /// In en, this message translates to:
  /// **'Mark this bill as paid?'**
  String get cdMarkPaidQ;

  /// No description provided for @cdMarkUnpaidQ.
  ///
  /// In en, this message translates to:
  /// **'Mark this bill as unpaid?'**
  String get cdMarkUnpaidQ;

  /// No description provided for @cdConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get cdConfirm;

  /// No description provided for @cdCouldNotUpdate.
  ///
  /// In en, this message translates to:
  /// **'Could not update: {detail}'**
  String cdCouldNotUpdate(String detail);

  /// No description provided for @cdOfflineChangeSaved.
  ///
  /// In en, this message translates to:
  /// **'Offline — change saved on this device, will sync automatically when back online'**
  String get cdOfflineChangeSaved;

  /// No description provided for @cdConvertTitle.
  ///
  /// In en, this message translates to:
  /// **'Convert to Bill'**
  String get cdConvertTitle;

  /// No description provided for @cdConvertBody.
  ///
  /// In en, this message translates to:
  /// **'This will deduct stock for these items and turn the quotation into a real bill. Continue?'**
  String get cdConvertBody;

  /// No description provided for @cdConvert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get cdConvert;

  /// No description provided for @cdCouldNotConvert.
  ///
  /// In en, this message translates to:
  /// **'Could not convert: {detail}'**
  String cdCouldNotConvert(String detail);

  /// No description provided for @cdReturnItems.
  ///
  /// In en, this message translates to:
  /// **'Return Items'**
  String get cdReturnItems;

  /// No description provided for @cdReturnHint.
  ///
  /// In en, this message translates to:
  /// **'Set how many of each item to return. Leave at 0 to keep it sold.'**
  String get cdReturnHint;

  /// No description provided for @cdDecreaseQty.
  ///
  /// In en, this message translates to:
  /// **'Decrease quantity'**
  String get cdDecreaseQty;

  /// No description provided for @cdIncreaseQty.
  ///
  /// In en, this message translates to:
  /// **'Increase quantity'**
  String get cdIncreaseQty;

  /// No description provided for @cdCreditTotal.
  ///
  /// In en, this message translates to:
  /// **'Credit total'**
  String get cdCreditTotal;

  /// No description provided for @cdReturnSelected.
  ///
  /// In en, this message translates to:
  /// **'Return Selected'**
  String get cdReturnSelected;

  /// No description provided for @cdCouldNotReturn.
  ///
  /// In en, this message translates to:
  /// **'Could not return: {detail}'**
  String cdCouldNotReturn(String detail);

  /// No description provided for @cdCouldNotVoid.
  ///
  /// In en, this message translates to:
  /// **'Could not void: {detail}'**
  String cdCouldNotVoid(String detail);

  /// No description provided for @cdNoPreviousBill.
  ///
  /// In en, this message translates to:
  /// **'No previous bill to repeat'**
  String get cdNoPreviousBill;

  /// No description provided for @cdCouldNotLoadLast.
  ///
  /// In en, this message translates to:
  /// **'Could not load last bill: {detail}'**
  String cdCouldNotLoadLast(String detail);

  /// No description provided for @cdInvoiceEmailed.
  ///
  /// In en, this message translates to:
  /// **'Invoice emailed to the customer.'**
  String get cdInvoiceEmailed;

  /// No description provided for @cdCouldNotEmailInvoice.
  ///
  /// In en, this message translates to:
  /// **'Could not email invoice: {detail}'**
  String cdCouldNotEmailInvoice(String detail);

  /// No description provided for @cdStatementEmailed.
  ///
  /// In en, this message translates to:
  /// **'Statement emailed to the customer.'**
  String get cdStatementEmailed;

  /// No description provided for @cdCouldNotEmailStatement.
  ///
  /// In en, this message translates to:
  /// **'Could not email statement: {detail}'**
  String cdCouldNotEmailStatement(String detail);

  /// No description provided for @cdDeleteBillTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Bill'**
  String get cdDeleteBillTitle;

  /// No description provided for @cdBillVoided.
  ///
  /// In en, this message translates to:
  /// **'VOIDED'**
  String get cdBillVoided;

  /// No description provided for @cdBillReturn.
  ///
  /// In en, this message translates to:
  /// **'RETURN'**
  String get cdBillReturn;

  /// No description provided for @cdBillQuote.
  ///
  /// In en, this message translates to:
  /// **'QUOTE'**
  String get cdBillQuote;

  /// No description provided for @cdBillPaid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get cdBillPaid;

  /// No description provided for @cdBillPartial.
  ///
  /// In en, this message translates to:
  /// **'PARTIAL'**
  String get cdBillPartial;

  /// No description provided for @cdBillUnpaid.
  ///
  /// In en, this message translates to:
  /// **'UNPAID'**
  String get cdBillUnpaid;

  /// No description provided for @cdBill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get cdBill;

  /// No description provided for @cdVoidedReason.
  ///
  /// In en, this message translates to:
  /// **'Voided: {reason}'**
  String cdVoidedReason(String reason);

  /// No description provided for @cdViewInvoice.
  ///
  /// In en, this message translates to:
  /// **'View Invoice'**
  String get cdViewInvoice;

  /// No description provided for @cdEmailInvoice.
  ///
  /// In en, this message translates to:
  /// **'Email Invoice'**
  String get cdEmailInvoice;

  /// No description provided for @cdEditBill.
  ///
  /// In en, this message translates to:
  /// **'Edit Bill'**
  String get cdEditBill;

  /// No description provided for @cdReturnBill.
  ///
  /// In en, this message translates to:
  /// **'Return Bill'**
  String get cdReturnBill;

  /// No description provided for @cdVoidBill.
  ///
  /// In en, this message translates to:
  /// **'Void Bill'**
  String get cdVoidBill;

  /// No description provided for @cdNoItems.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get cdNoItems;

  /// No description provided for @cdRepeatLast.
  ///
  /// In en, this message translates to:
  /// **'Repeat Last Bill'**
  String get cdRepeatLast;

  /// No description provided for @cdLedgerPdf.
  ///
  /// In en, this message translates to:
  /// **'Ledger PDF'**
  String get cdLedgerPdf;

  /// No description provided for @cdEmailStatement.
  ///
  /// In en, this message translates to:
  /// **'Email Statement'**
  String get cdEmailStatement;

  /// No description provided for @cdCollectPayment.
  ///
  /// In en, this message translates to:
  /// **'Collect Payment'**
  String get cdCollectPayment;

  /// No description provided for @cdSendReminder.
  ///
  /// In en, this message translates to:
  /// **'Send WhatsApp Reminder'**
  String get cdSendReminder;

  /// No description provided for @cdTotalBilled.
  ///
  /// In en, this message translates to:
  /// **'Total Billed'**
  String get cdTotalBilled;

  /// No description provided for @cdPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get cdPaid;

  /// No description provided for @cdNoBills.
  ///
  /// In en, this message translates to:
  /// **'No bills yet'**
  String get cdNoBills;

  /// No description provided for @cdBillActions.
  ///
  /// In en, this message translates to:
  /// **'Bill actions'**
  String get cdBillActions;

  /// No description provided for @cdCreditUsed.
  ///
  /// In en, this message translates to:
  /// **'{outstanding} of {limit} credit limit used'**
  String cdCreditUsed(String limit, String outstanding);

  /// No description provided for @cdVoidBody.
  ///
  /// In en, this message translates to:
  /// **'This removes it from balances and reports, but keeps it in the history. Stock will be restored. This cannot be undone.'**
  String get cdVoidBody;

  /// No description provided for @cdReason.
  ///
  /// In en, this message translates to:
  /// **'Reason (optional)'**
  String get cdReason;

  /// No description provided for @frmOfflineCustomer.
  ///
  /// In en, this message translates to:
  /// **'Offline — customer saved on this device, will sync automatically when back online'**
  String get frmOfflineCustomer;

  /// No description provided for @frmOfflineSupplier.
  ///
  /// In en, this message translates to:
  /// **'Offline — supplier saved on this device, will sync automatically when back online'**
  String get frmOfflineSupplier;

  /// No description provided for @frmEditCustomer.
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get frmEditCustomer;

  /// No description provided for @frmCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get frmCustomerName;

  /// No description provided for @frmPhoneOptional.
  ///
  /// In en, this message translates to:
  /// **'Phone (optional)'**
  String get frmPhoneOptional;

  /// No description provided for @frmCreditLimit.
  ///
  /// In en, this message translates to:
  /// **'Credit Limit (PKR, optional)'**
  String get frmCreditLimit;

  /// No description provided for @frmCreditHelper.
  ///
  /// In en, this message translates to:
  /// **'Warn when this customer\'s balance exceeds this'**
  String get frmCreditHelper;

  /// No description provided for @frmPriceTier.
  ///
  /// In en, this message translates to:
  /// **'Price Tier'**
  String get frmPriceTier;

  /// No description provided for @frmRetail.
  ///
  /// In en, this message translates to:
  /// **'Retail'**
  String get frmRetail;

  /// No description provided for @frmWholesale.
  ///
  /// In en, this message translates to:
  /// **'Wholesale'**
  String get frmWholesale;

  /// No description provided for @frmContractor.
  ///
  /// In en, this message translates to:
  /// **'Contractor'**
  String get frmContractor;

  /// No description provided for @frmPriceTierHelper.
  ///
  /// In en, this message translates to:
  /// **'Which item price Add Bill pre-fills for this customer'**
  String get frmPriceTierHelper;

  /// No description provided for @frmStrn.
  ///
  /// In en, this message translates to:
  /// **'STRN (optional)'**
  String get frmStrn;

  /// No description provided for @frmStrnCustomer.
  ///
  /// In en, this message translates to:
  /// **'13-digit Sales Tax Registration Number for invoices'**
  String get frmStrnCustomer;

  /// No description provided for @frmStrnSupplier.
  ///
  /// In en, this message translates to:
  /// **'13-digit Sales Tax Registration Number for purchase bills'**
  String get frmStrnSupplier;

  /// No description provided for @frmAddress.
  ///
  /// In en, this message translates to:
  /// **'Address (optional)'**
  String get frmAddress;

  /// No description provided for @frmEmail.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get frmEmail;

  /// No description provided for @frmEmailHelper.
  ///
  /// In en, this message translates to:
  /// **'Lets you email an invoice or statement to this customer'**
  String get frmEmailHelper;

  /// No description provided for @frmSaveCustomer.
  ///
  /// In en, this message translates to:
  /// **'Save Customer'**
  String get frmSaveCustomer;

  /// No description provided for @frmEditSupplier.
  ///
  /// In en, this message translates to:
  /// **'Edit Supplier'**
  String get frmEditSupplier;

  /// No description provided for @frmSupplierName.
  ///
  /// In en, this message translates to:
  /// **'Supplier Name'**
  String get frmSupplierName;

  /// No description provided for @frmSaveSupplier.
  ///
  /// In en, this message translates to:
  /// **'Save Supplier'**
  String get frmSaveSupplier;

  /// No description provided for @sdDeletePurchaseTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Purchase'**
  String get sdDeletePurchaseTitle;

  /// No description provided for @sdDeletePurchaseBody.
  ///
  /// In en, this message translates to:
  /// **'Stock for this purchase will be restored. This cannot be undone.'**
  String get sdDeletePurchaseBody;

  /// No description provided for @sdReturnToSupplier.
  ///
  /// In en, this message translates to:
  /// **'Return to Supplier'**
  String get sdReturnToSupplier;

  /// No description provided for @sdReturnHint.
  ///
  /// In en, this message translates to:
  /// **'Set how many of each item to send back. Leave at 0 to keep it.'**
  String get sdReturnHint;

  /// No description provided for @sdCouldNotMarkReceived.
  ///
  /// In en, this message translates to:
  /// **'Could not mark as received: {detail}'**
  String sdCouldNotMarkReceived(String detail);

  /// No description provided for @sdMarkPaidQ.
  ///
  /// In en, this message translates to:
  /// **'Mark this purchase as paid?'**
  String get sdMarkPaidQ;

  /// No description provided for @sdMarkUnpaidQ.
  ///
  /// In en, this message translates to:
  /// **'Mark this purchase as unpaid?'**
  String get sdMarkUnpaidQ;

  /// No description provided for @sdTotalPurchased.
  ///
  /// In en, this message translates to:
  /// **'Total Purchased'**
  String get sdTotalPurchased;

  /// No description provided for @sdPayable.
  ///
  /// In en, this message translates to:
  /// **'Payable'**
  String get sdPayable;

  /// No description provided for @sdPayableAmount.
  ///
  /// In en, this message translates to:
  /// **'{amount} payable'**
  String sdPayableAmount(String amount);

  /// No description provided for @sdNoPurchases.
  ///
  /// In en, this message translates to:
  /// **'No purchases yet'**
  String get sdNoPurchases;

  /// No description provided for @sdPo.
  ///
  /// In en, this message translates to:
  /// **'PO'**
  String get sdPo;

  /// No description provided for @sdDraftPo.
  ///
  /// In en, this message translates to:
  /// **'DRAFT PO'**
  String get sdDraftPo;

  /// No description provided for @sdPurchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get sdPurchase;

  /// No description provided for @sdDraftNote.
  ///
  /// In en, this message translates to:
  /// **'Draft purchase order — not yet received, no stock or cost update yet.'**
  String get sdDraftNote;

  /// No description provided for @sdReturnNote.
  ///
  /// In en, this message translates to:
  /// **'Return / credit note to the supplier.'**
  String get sdReturnNote;

  /// No description provided for @sdMarkReceived.
  ///
  /// In en, this message translates to:
  /// **'Mark as Received'**
  String get sdMarkReceived;

  /// No description provided for @sdEditPurchase.
  ///
  /// In en, this message translates to:
  /// **'Edit Purchase'**
  String get sdEditPurchase;

  /// No description provided for @sdPurchaseActions.
  ///
  /// In en, this message translates to:
  /// **'Purchase actions'**
  String get sdPurchaseActions;

  /// No description provided for @slDeleteSupplier.
  ///
  /// In en, this message translates to:
  /// **'Delete Supplier'**
  String get slDeleteSupplier;

  /// No description provided for @slDeleteManyTitle.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 Supplier} other{Delete {count} Suppliers}}'**
  String slDeleteManyTitle(int count);

  /// No description provided for @slDeleteManyBody.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 supplier and all their purchases? This cannot be undone.} other{Delete {count} suppliers and all their purchases? This cannot be undone.}}'**
  String slDeleteManyBody(int count);

  /// No description provided for @slCsvNeedsRows.
  ///
  /// In en, this message translates to:
  /// **'CSV needs a header row plus at least one supplier.'**
  String get slCsvNeedsRows;

  /// No description provided for @slImportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Suppliers'**
  String get slImportTitle;

  /// No description provided for @slImportConfirm.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Found 1 supplier in \"{file}\". Import them all?} other{Found {count} suppliers in \"{file}\". Import them all?}}'**
  String slImportConfirm(int count, String file);

  /// No description provided for @slImported.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Imported 1 supplier.} other{Imported {count} suppliers.}}'**
  String slImported(int count);

  /// No description provided for @slNoSuppliers.
  ///
  /// In en, this message translates to:
  /// **'No suppliers yet. Tap + to add one.'**
  String get slNoSuppliers;

  /// No description provided for @slSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search suppliers or phone...'**
  String get slSearchHint;

  /// No description provided for @slNoMatch.
  ///
  /// In en, this message translates to:
  /// **'No suppliers match your search.'**
  String get slNoMatch;

  /// No description provided for @slCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 supplier} other{{count} suppliers}}'**
  String slCount(int count);

  /// No description provided for @sduTitle.
  ///
  /// In en, this message translates to:
  /// **'Supplier Dues'**
  String get sduTitle;

  /// No description provided for @sduNothingOwed.
  ///
  /// In en, this message translates to:
  /// **'Nothing owed to suppliers 🎉'**
  String get sduNothingOwed;

  /// No description provided for @sduOwedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 supplier owed} other{{count} suppliers owed}}'**
  String sduOwedCount(int count);

  /// No description provided for @sduDaysSince.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day since oldest unpaid purchase} other{{days} days since oldest unpaid purchase}}'**
  String sduDaysSince(int days);

  /// No description provided for @duBucket0.
  ///
  /// In en, this message translates to:
  /// **'0–30 days'**
  String get duBucket0;

  /// No description provided for @duBucket1.
  ///
  /// In en, this message translates to:
  /// **'30–60 days'**
  String get duBucket1;

  /// No description provided for @duBucket2.
  ///
  /// In en, this message translates to:
  /// **'60+ days'**
  String get duBucket2;

  /// No description provided for @duTitle.
  ///
  /// In en, this message translates to:
  /// **'Dues Center'**
  String get duTitle;

  /// No description provided for @duNoDues.
  ///
  /// In en, this message translates to:
  /// **'No outstanding dues 🎉'**
  String get duNoDues;

  /// No description provided for @duOwingCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 customer with dues} other{{count} customers with dues}}'**
  String duOwingCount(int count);

  /// No description provided for @duDaysSince.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day since oldest unpaid bill} other{{days} days since oldest unpaid bill}}'**
  String duDaysSince(int days);

  /// No description provided for @duAmountOutstanding.
  ///
  /// In en, this message translates to:
  /// **'{amount} outstanding'**
  String duAmountOutstanding(String amount);

  /// No description provided for @cpNoOutstanding.
  ///
  /// In en, this message translates to:
  /// **'No outstanding balance for this customer'**
  String get cpNoOutstanding;

  /// No description provided for @cpValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid amount'**
  String get cpValidAmount;

  /// No description provided for @cpExceeds.
  ///
  /// In en, this message translates to:
  /// **'Amount exceeds the outstanding balance of {amount}'**
  String cpExceeds(String amount);

  /// No description provided for @cpCollected.
  ///
  /// In en, this message translates to:
  /// **'Collected {amount} from {name}'**
  String cpCollected(String amount, String name);

  /// No description provided for @cpOfflineSaved.
  ///
  /// In en, this message translates to:
  /// **'Offline — payment saved on this device, will sync automatically when back online'**
  String get cpOfflineSaved;

  /// No description provided for @cpOwes.
  ///
  /// In en, this message translates to:
  /// **'{name} owes {amount}. Applied to their oldest unpaid bill(s) first.'**
  String cpOwes(String amount, String name);

  /// No description provided for @cpAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount Collected (PKR)'**
  String get cpAmountLabel;

  /// No description provided for @cpCollect.
  ///
  /// In en, this message translates to:
  /// **'Collect'**
  String get cpCollect;

  /// No description provided for @usNoItems.
  ///
  /// In en, this message translates to:
  /// **'No items to update.'**
  String get usNoItems;

  /// No description provided for @usHelp.
  ///
  /// In en, this message translates to:
  /// **'Set the new stock for each item, then tap Save All.'**
  String get usHelp;

  /// No description provided for @usCurrent.
  ///
  /// In en, this message translates to:
  /// **'{unit}  •  current: {qty}'**
  String usCurrent(String qty, String unit);

  /// No description provided for @usNew.
  ///
  /// In en, this message translates to:
  /// **'new: {qty}'**
  String usNew(String qty);

  /// No description provided for @usSubtract.
  ///
  /// In en, this message translates to:
  /// **'Subtract 1'**
  String get usSubtract;

  /// No description provided for @usAdd.
  ///
  /// In en, this message translates to:
  /// **'Add 1'**
  String get usAdd;

  /// No description provided for @usNoChanges.
  ///
  /// In en, this message translates to:
  /// **'No changes'**
  String get usNoChanges;

  /// No description provided for @usSaveAll.
  ///
  /// In en, this message translates to:
  /// **'Save All ({count} changed)'**
  String usSaveAll(int count);

  /// No description provided for @srHint.
  ///
  /// In en, this message translates to:
  /// **'Search customers, items, amounts...'**
  String get srHint;

  /// No description provided for @srFailed.
  ///
  /// In en, this message translates to:
  /// **'Search failed — check your connection.'**
  String get srFailed;

  /// No description provided for @srTitle.
  ///
  /// In en, this message translates to:
  /// **'Search your shop'**
  String get srTitle;

  /// No description provided for @srSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find customers by name or phone, bills by amount.'**
  String get srSubtitle;

  /// No description provided for @srNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No matches for \"{query}\"'**
  String srNoMatches(String query);

  /// No description provided for @srTryDifferent.
  ///
  /// In en, this message translates to:
  /// **'Try a different name, phone number, or amount.'**
  String get srTryDifferent;

  /// No description provided for @srBills.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get srBills;

  /// No description provided for @srNoItemList.
  ///
  /// In en, this message translates to:
  /// **'No item list'**
  String get srNoItemList;

  /// No description provided for @abAddAtLeastOne.
  ///
  /// In en, this message translates to:
  /// **'Add at least one item'**
  String get abAddAtLeastOne;

  /// No description provided for @abQuotationUpdated.
  ///
  /// In en, this message translates to:
  /// **'Quotation Updated!'**
  String get abQuotationUpdated;

  /// No description provided for @abBillUpdated.
  ///
  /// In en, this message translates to:
  /// **'Bill Updated!'**
  String get abBillUpdated;

  /// No description provided for @abQuotationSaved.
  ///
  /// In en, this message translates to:
  /// **'Quotation Saved!'**
  String get abQuotationSaved;

  /// No description provided for @abBillCreated.
  ///
  /// In en, this message translates to:
  /// **'Bill Created Successfully!'**
  String get abBillCreated;

  /// No description provided for @abTotalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total: {amount}'**
  String abTotalAmount(String amount);

  /// No description provided for @abShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get abShare;

  /// No description provided for @abDoneReturn.
  ///
  /// In en, this message translates to:
  /// **'Done & Return'**
  String get abDoneReturn;

  /// No description provided for @abOverLimitBody.
  ///
  /// In en, this message translates to:
  /// **'This would put the customer over their credit limit.'**
  String get abOverLimitBody;

  /// No description provided for @abOverLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Over credit limit'**
  String get abOverLimitTitle;

  /// No description provided for @abBillAnyway.
  ///
  /// In en, this message translates to:
  /// **'Bill anyway'**
  String get abBillAnyway;

  /// No description provided for @abOfflineBill.
  ///
  /// In en, this message translates to:
  /// **'Offline — bill saved on this device, will sync automatically when back online'**
  String get abOfflineBill;

  /// No description provided for @abEditQuotation.
  ///
  /// In en, this message translates to:
  /// **'Edit Quotation'**
  String get abEditQuotation;

  /// No description provided for @abEditBill.
  ///
  /// In en, this message translates to:
  /// **'Edit Bill'**
  String get abEditBill;

  /// No description provided for @abNewQuotation.
  ///
  /// In en, this message translates to:
  /// **'New Quotation'**
  String get abNewQuotation;

  /// No description provided for @abAddBill.
  ///
  /// In en, this message translates to:
  /// **'Add Bill'**
  String get abAddBill;

  /// No description provided for @abCouldNotLoadItems.
  ///
  /// In en, this message translates to:
  /// **'Could not load items.'**
  String get abCouldNotLoadItems;

  /// No description provided for @abOverLimitWarn.
  ///
  /// In en, this message translates to:
  /// **'This bill would put the customer at {total}, over their {limit} credit limit.'**
  String abOverLimitWarn(String limit, String total);

  /// No description provided for @abTapAddItemBill.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Add Item\" below to start a bill'**
  String get abTapAddItemBill;

  /// No description provided for @abNoCatalog.
  ///
  /// In en, this message translates to:
  /// **'No items in catalog yet'**
  String get abNoCatalog;

  /// No description provided for @abScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get abScan;

  /// No description provided for @abDiscountRs.
  ///
  /// In en, this message translates to:
  /// **'Discount (Rs)'**
  String get abDiscountRs;

  /// No description provided for @abSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get abSubtotal;

  /// No description provided for @abTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get abTotal;

  /// No description provided for @abSaveAsQuotation.
  ///
  /// In en, this message translates to:
  /// **'Save as Quotation'**
  String get abSaveAsQuotation;

  /// No description provided for @abQuotationLocked.
  ///
  /// In en, this message translates to:
  /// **'An existing bill can\'t be turned back into a quotation'**
  String get abQuotationLocked;

  /// No description provided for @abQuotationNote.
  ///
  /// In en, this message translates to:
  /// **'No stock deducted until converted to a bill'**
  String get abQuotationNote;

  /// No description provided for @abPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get abPaymentStatus;

  /// No description provided for @abUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get abUnpaid;

  /// No description provided for @abPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get abPaymentMethod;

  /// No description provided for @abCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get abCash;

  /// No description provided for @abBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get abBankTransfer;

  /// No description provided for @abCheque.
  ///
  /// In en, this message translates to:
  /// **'Cheque'**
  String get abCheque;

  /// No description provided for @abSaveQuotation.
  ///
  /// In en, this message translates to:
  /// **'Save Quotation'**
  String get abSaveQuotation;

  /// No description provided for @abSaveBill.
  ///
  /// In en, this message translates to:
  /// **'Save Bill'**
  String get abSaveBill;

  /// No description provided for @abAdded.
  ///
  /// In en, this message translates to:
  /// **'Added {name}'**
  String abAdded(String name);

  /// No description provided for @apNewItem.
  ///
  /// In en, this message translates to:
  /// **'New Item…'**
  String get apNewItem;

  /// No description provided for @apNewItemHint.
  ///
  /// In en, this message translates to:
  /// **'Add a new item to the catalog first'**
  String get apNewItemHint;

  /// No description provided for @apOfflinePurchase.
  ///
  /// In en, this message translates to:
  /// **'Offline — purchase saved on this device, will sync automatically when back online'**
  String get apOfflinePurchase;

  /// No description provided for @apEditPo.
  ///
  /// In en, this message translates to:
  /// **'Edit Purchase Order'**
  String get apEditPo;

  /// No description provided for @apNewPo.
  ///
  /// In en, this message translates to:
  /// **'New Purchase Order'**
  String get apNewPo;

  /// No description provided for @apAddPurchase.
  ///
  /// In en, this message translates to:
  /// **'Add Purchase'**
  String get apAddPurchase;

  /// No description provided for @apTapAddItem.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Add Item\" below to start a purchase'**
  String get apTapAddItem;

  /// No description provided for @apSaveAsPo.
  ///
  /// In en, this message translates to:
  /// **'Save as Purchase Order'**
  String get apSaveAsPo;

  /// No description provided for @apPoLocked.
  ///
  /// In en, this message translates to:
  /// **'An already-received purchase can\'t be turned back into a draft order'**
  String get apPoLocked;

  /// No description provided for @apPoNote.
  ///
  /// In en, this message translates to:
  /// **'No stock or cost update until goods are marked received'**
  String get apPoNote;

  /// No description provided for @apUnpaidCredit.
  ///
  /// In en, this message translates to:
  /// **'Unpaid (Credit)'**
  String get apUnpaidCredit;

  /// No description provided for @apSavePo.
  ///
  /// In en, this message translates to:
  /// **'Save Purchase Order'**
  String get apSavePo;

  /// No description provided for @apSavePurchase.
  ///
  /// In en, this message translates to:
  /// **'Save Purchase'**
  String get apSavePurchase;

  /// No description provided for @apCurrentCost.
  ///
  /// In en, this message translates to:
  /// **'Current cost: {amount} / {unit}'**
  String apCurrentCost(String amount, String unit);

  /// No description provided for @apNoCost.
  ///
  /// In en, this message translates to:
  /// **'No cost set  •  {unit}'**
  String apNoCost(String unit);

  /// No description provided for @scServerFail.
  ///
  /// In en, this message translates to:
  /// **'Scan failed: server error {code}'**
  String scServerFail(int code);

  /// No description provided for @scOfflineSaved.
  ///
  /// In en, this message translates to:
  /// **'Offline — photo saved, will read it automatically once back online'**
  String get scOfflineSaved;

  /// No description provided for @scStillOffline.
  ///
  /// In en, this message translates to:
  /// **'Still offline'**
  String get scStillOffline;

  /// No description provided for @scCouldNotCreateCustomer.
  ///
  /// In en, this message translates to:
  /// **'Could not create the customer — try again.'**
  String get scCouldNotCreateCustomer;

  /// No description provided for @scCouldNotCreateSupplier.
  ///
  /// In en, this message translates to:
  /// **'Could not create the supplier — try again.'**
  String get scCouldNotCreateSupplier;

  /// No description provided for @scBillSavedFor.
  ///
  /// In en, this message translates to:
  /// **'Bill saved for {name}'**
  String scBillSavedFor(String name);

  /// No description provided for @scPurchaseSavedFrom.
  ///
  /// In en, this message translates to:
  /// **'Purchase saved from {name}'**
  String scPurchaseSavedFrom(String name);

  /// No description provided for @scWhichCustomer.
  ///
  /// In en, this message translates to:
  /// **'Which customer is this?'**
  String get scWhichCustomer;

  /// No description provided for @scWhichSupplier.
  ///
  /// In en, this message translates to:
  /// **'Which supplier is this?'**
  String get scWhichSupplier;

  /// No description provided for @scClosestMatch.
  ///
  /// In en, this message translates to:
  /// **'Closest match on file: {name} ({score}% similar)'**
  String scClosestMatch(String name, int score);

  /// No description provided for @scYesThisIs.
  ///
  /// In en, this message translates to:
  /// **'Yes, this is {name}'**
  String scYesThisIs(String name);

  /// No description provided for @scOtherwiseCustomer.
  ///
  /// In en, this message translates to:
  /// **'Otherwise, create a new customer:'**
  String get scOtherwiseCustomer;

  /// No description provided for @scOtherwiseSupplier.
  ///
  /// In en, this message translates to:
  /// **'Otherwise, create a new supplier:'**
  String get scOtherwiseSupplier;

  /// No description provided for @scNoMatchCustomer.
  ///
  /// In en, this message translates to:
  /// **'No matching customer found. Create a new one:'**
  String get scNoMatchCustomer;

  /// No description provided for @scNoMatchSupplier.
  ///
  /// In en, this message translates to:
  /// **'No matching supplier found. Create a new one:'**
  String get scNoMatchSupplier;

  /// No description provided for @scCustomerName.
  ///
  /// In en, this message translates to:
  /// **'Customer name'**
  String get scCustomerName;

  /// No description provided for @scSupplierName.
  ///
  /// In en, this message translates to:
  /// **'Supplier name'**
  String get scSupplierName;

  /// No description provided for @scCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get scCreateNew;

  /// No description provided for @scTitleBill.
  ///
  /// In en, this message translates to:
  /// **'Scan Bill'**
  String get scTitleBill;

  /// No description provided for @scIntroBill.
  ///
  /// In en, this message translates to:
  /// **'Snap a photo of the bill. Handwritten is fine, and Sindhi, Urdu or English all work. You\'ll get to check it before it\'s saved.'**
  String get scIntroBill;

  /// No description provided for @scIntroPurchase.
  ///
  /// In en, this message translates to:
  /// **'Snap a photo of the supplier\'s invoice. Sindhi, Urdu or English all work. You\'ll get to check it before it\'s saved.'**
  String get scIntroPurchase;

  /// No description provided for @scReadingBill.
  ///
  /// In en, this message translates to:
  /// **'Reading bill…'**
  String get scReadingBill;

  /// No description provided for @scScanBill.
  ///
  /// In en, this message translates to:
  /// **'Scan a Bill'**
  String get scScanBill;

  /// No description provided for @scReadingInvoice.
  ///
  /// In en, this message translates to:
  /// **'Reading invoice…'**
  String get scReadingInvoice;

  /// No description provided for @scScanInvoice.
  ///
  /// In en, this message translates to:
  /// **'Scan an Invoice'**
  String get scScanInvoice;

  /// No description provided for @scQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued Scans'**
  String get scQueued;

  /// No description provided for @scReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to review'**
  String get scReady;

  /// No description provided for @scFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get scFailed;

  /// No description provided for @scWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for connection'**
  String get scWaiting;

  /// No description provided for @scRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get scRetry;

  /// No description provided for @rpCouldNotLoad.
  ///
  /// In en, this message translates to:
  /// **'Could not load reports: {error}'**
  String rpCouldNotLoad(String error);

  /// No description provided for @rpHeadline.
  ///
  /// In en, this message translates to:
  /// **'This month\'s headline numbers'**
  String get rpHeadline;

  /// No description provided for @rpProfitThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Profit This Month'**
  String get rpProfitThisMonth;

  /// No description provided for @rpNoData.
  ///
  /// In en, this message translates to:
  /// **'No data yet'**
  String get rpNoData;

  /// No description provided for @rpSalesTax.
  ///
  /// In en, this message translates to:
  /// **'Sales Tax'**
  String get rpSalesTax;

  /// No description provided for @rpSalesTaxFor.
  ///
  /// In en, this message translates to:
  /// **'Sales tax report for {month}'**
  String rpSalesTaxFor(String month);

  /// No description provided for @rpViewSalesTax.
  ///
  /// In en, this message translates to:
  /// **'View Sales Tax Report'**
  String get rpViewSalesTax;

  /// No description provided for @rpQuickReports.
  ///
  /// In en, this message translates to:
  /// **'Quick Reports'**
  String get rpQuickReports;

  /// No description provided for @rpQuickSub.
  ///
  /// In en, this message translates to:
  /// **'Jump straight to a specific report'**
  String get rpQuickSub;

  /// No description provided for @expensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesTitle;

  /// No description provided for @rpRateCard.
  ///
  /// In en, this message translates to:
  /// **'Rate Card'**
  String get rpRateCard;

  /// No description provided for @rpDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get rpDetails;

  /// No description provided for @rpDetailsSub.
  ///
  /// In en, this message translates to:
  /// **'Full breakdowns and rankings'**
  String get rpDetailsSub;

  /// No description provided for @rpOutstandingByCustomer.
  ///
  /// In en, this message translates to:
  /// **'Outstanding by Customer'**
  String get rpOutstandingByCustomer;

  /// No description provided for @rpNoOutstanding.
  ///
  /// In en, this message translates to:
  /// **'No outstanding balances'**
  String get rpNoOutstanding;

  /// No description provided for @rpMonthlyTotals.
  ///
  /// In en, this message translates to:
  /// **'Monthly Totals'**
  String get rpMonthlyTotals;

  /// No description provided for @rpMostSold.
  ///
  /// In en, this message translates to:
  /// **'Most Sold Items'**
  String get rpMostSold;

  /// No description provided for @rpNoItemsRecorded.
  ///
  /// In en, this message translates to:
  /// **'No items recorded yet'**
  String get rpNoItemsRecorded;

  /// No description provided for @rpTopCustomers.
  ///
  /// In en, this message translates to:
  /// **'Top Customers by Revenue'**
  String get rpTopCustomers;

  /// No description provided for @rpNoSalesRecorded.
  ///
  /// In en, this message translates to:
  /// **'No sales recorded yet'**
  String get rpNoSalesRecorded;

  /// No description provided for @rpTotalOutstanding.
  ///
  /// In en, this message translates to:
  /// **'Total Outstanding'**
  String get rpTotalOutstanding;

  /// No description provided for @rpViewCustomers.
  ///
  /// In en, this message translates to:
  /// **'View customers'**
  String get rpViewCustomers;

  /// No description provided for @lblInvoice.
  ///
  /// In en, this message translates to:
  /// **'invoice'**
  String get lblInvoice;

  /// No description provided for @lblLedger.
  ///
  /// In en, this message translates to:
  /// **'ledger'**
  String get lblLedger;

  /// No description provided for @lblRateCard.
  ///
  /// In en, this message translates to:
  /// **'rate card'**
  String get lblRateCard;

  /// No description provided for @exCsvNeedsRows.
  ///
  /// In en, this message translates to:
  /// **'CSV needs a header row plus at least one expense.'**
  String get exCsvNeedsRows;

  /// No description provided for @exCsvHeader.
  ///
  /// In en, this message translates to:
  /// **'CSV header must include \"description\" and \"amount\" columns.'**
  String get exCsvHeader;

  /// No description provided for @exLineBadAmount.
  ///
  /// In en, this message translates to:
  /// **'Line {line}: missing description or invalid amount — fix the file and retry.'**
  String exLineBadAmount(int line);

  /// No description provided for @exLineBadDate.
  ///
  /// In en, this message translates to:
  /// **'Line {line}: invalid date \"{date}\" — use YYYY-MM-DD.'**
  String exLineBadDate(String date, int line);

  /// No description provided for @exImportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Expenses'**
  String get exImportTitle;

  /// No description provided for @exImportConfirm.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Found 1 expense in \"{file}\". Import them all?} other{Found {count} expenses in \"{file}\". Import them all?}}'**
  String exImportConfirm(int count, String file);

  /// No description provided for @exImported.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Imported 1 expense.} other{Imported {count} expenses.}}'**
  String exImported(int count);

  /// No description provided for @exImportFailedServer.
  ///
  /// In en, this message translates to:
  /// **'Import failed: server error {code}'**
  String exImportFailedServer(int code);

  /// No description provided for @exDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Expense'**
  String get exDeleteTitle;

  /// No description provided for @exAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get exAdd;

  /// No description provided for @exEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get exEdit;

  /// No description provided for @exDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get exDescription;

  /// No description provided for @exAmountRs.
  ///
  /// In en, this message translates to:
  /// **'Amount (Rs)'**
  String get exAmountRs;

  /// No description provided for @exCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get exCategory;

  /// No description provided for @exDate.
  ///
  /// In en, this message translates to:
  /// **'Date: {date}'**
  String exDate(String date);

  /// No description provided for @exRepeats.
  ///
  /// In en, this message translates to:
  /// **'Repeats monthly'**
  String get exRepeats;

  /// No description provided for @exRepeatsHint.
  ///
  /// In en, this message translates to:
  /// **'Rent, electricity, wages, etc.'**
  String get exRepeatsHint;

  /// No description provided for @exReceiptTap.
  ///
  /// In en, this message translates to:
  /// **'Receipt photo, tap to change'**
  String get exReceiptTap;

  /// No description provided for @exReceiptOptional.
  ///
  /// In en, this message translates to:
  /// **'Receipt photo (optional)'**
  String get exReceiptOptional;

  /// No description provided for @exEnterValid.
  ///
  /// In en, this message translates to:
  /// **'Enter a description and a valid amount.'**
  String get exEnterValid;

  /// No description provided for @exOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline — expense saved on this device, will sync automatically when back online'**
  String get exOffline;

  /// No description provided for @exSave.
  ///
  /// In en, this message translates to:
  /// **'Save Expense'**
  String get exSave;

  /// No description provided for @exRecurringDue.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 recurring expense due this month} other{{count} recurring expenses due this month}}'**
  String exRecurringDue(int count);

  /// No description provided for @exAddShort.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get exAddShort;

  /// No description provided for @exTotal.
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get exTotal;

  /// No description provided for @exCategoryChip.
  ///
  /// In en, this message translates to:
  /// **'Category: {name}'**
  String exCategoryChip(String name);

  /// No description provided for @exNoneLogged.
  ///
  /// In en, this message translates to:
  /// **'No expenses logged yet'**
  String get exNoneLogged;

  /// No description provided for @exNoneInCategory.
  ///
  /// In en, this message translates to:
  /// **'No {name} expenses yet'**
  String exNoneInCategory(String name);

  /// No description provided for @exViewReceipt.
  ///
  /// In en, this message translates to:
  /// **'View receipt'**
  String get exViewReceipt;

  /// No description provided for @exEditRow.
  ///
  /// In en, this message translates to:
  /// **'Edit expense'**
  String get exEditRow;

  /// No description provided for @exDeleteRow.
  ///
  /// In en, this message translates to:
  /// **'Delete expense'**
  String get exDeleteRow;

  /// No description provided for @gstServerReturned.
  ///
  /// In en, this message translates to:
  /// **'Server returned {first}/{second}'**
  String gstServerReturned(String first, String second);

  /// No description provided for @gstCouldNotLoad.
  ///
  /// In en, this message translates to:
  /// **'Could not load GST data: {error}'**
  String gstCouldNotLoad(String error);

  /// No description provided for @gstFailedDownload.
  ///
  /// In en, this message translates to:
  /// **'Failed to download ({code})'**
  String gstFailedDownload(int code);

  /// No description provided for @gstSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved {filename}'**
  String gstSaved(String filename);

  /// No description provided for @gstSavedDownloads.
  ///
  /// In en, this message translates to:
  /// **'Saved to Downloads/{filename}'**
  String gstSavedDownloads(String filename);

  /// No description provided for @gstCouldNotDownload.
  ///
  /// In en, this message translates to:
  /// **'Could not download: {error}'**
  String gstCouldNotDownload(String error);

  /// No description provided for @gstTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales Tax Report'**
  String get gstTitle;

  /// No description provided for @gstOutwardDetail.
  ///
  /// In en, this message translates to:
  /// **'Outward Sales — Invoice Detail'**
  String get gstOutwardDetail;

  /// No description provided for @gstNoBills.
  ///
  /// In en, this message translates to:
  /// **'No bills for this month.'**
  String get gstNoBills;

  /// No description provided for @gstHsn.
  ///
  /// In en, this message translates to:
  /// **'HSN Summary'**
  String get gstHsn;

  /// No description provided for @gstInvoiceWise.
  ///
  /// In en, this message translates to:
  /// **'Invoice-wise details'**
  String get gstInvoiceWise;

  /// No description provided for @gstMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly Summary'**
  String get gstMonthly;

  /// No description provided for @gstOutwardTaxable.
  ///
  /// In en, this message translates to:
  /// **'Outward taxable supplies'**
  String get gstOutwardTaxable;

  /// No description provided for @gstItc.
  ///
  /// In en, this message translates to:
  /// **'Input Tax Credit (from purchases)'**
  String get gstItc;

  /// No description provided for @gstSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get gstSave;

  /// No description provided for @rcValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid amount.'**
  String get rcValidAmount;

  /// No description provided for @rcExpected.
  ///
  /// In en, this message translates to:
  /// **'Expected Cash (today\'s cash sales)'**
  String get rcExpected;

  /// No description provided for @rcAlsoCollected.
  ///
  /// In en, this message translates to:
  /// **'Also collected today (not counted in the drawer)'**
  String get rcAlsoCollected;

  /// No description provided for @rcCounted.
  ///
  /// In en, this message translates to:
  /// **'Cash Counted in Drawer (Rs)'**
  String get rcCounted;

  /// No description provided for @rcCompare.
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get rcCompare;

  /// No description provided for @rcMatches.
  ///
  /// In en, this message translates to:
  /// **'Matches exactly!'**
  String get rcMatches;

  /// No description provided for @rcExtra.
  ///
  /// In en, this message translates to:
  /// **'{amount} extra in drawer'**
  String rcExtra(String amount);

  /// No description provided for @rcMissing.
  ///
  /// In en, this message translates to:
  /// **'{amount} missing from drawer'**
  String rcMissing(String amount);

  /// No description provided for @pbiTitle.
  ///
  /// In en, this message translates to:
  /// **'Profit by Item'**
  String get pbiTitle;

  /// No description provided for @pbiNoSales.
  ///
  /// In en, this message translates to:
  /// **'No sales yet'**
  String get pbiNoSales;

  /// No description provided for @pbiByCategory.
  ///
  /// In en, this message translates to:
  /// **'By Category'**
  String get pbiByCategory;

  /// No description provided for @pbiItemsByProfit.
  ///
  /// In en, this message translates to:
  /// **'Items by Profit'**
  String get pbiItemsByProfit;

  /// No description provided for @svTitle.
  ///
  /// In en, this message translates to:
  /// **'Stock Valuation'**
  String get svTitle;

  /// No description provided for @svNone.
  ///
  /// In en, this message translates to:
  /// **'No stock on hand'**
  String get svNone;

  /// No description provided for @svItemsByValue.
  ///
  /// In en, this message translates to:
  /// **'Items by Value'**
  String get svItemsByValue;

  /// No description provided for @svSummary.
  ///
  /// In en, this message translates to:
  /// **'{items} items · {units} units on the shelf'**
  String svSummary(String items, String units);

  /// No description provided for @svTied.
  ///
  /// In en, this message translates to:
  /// **'{amount} tied up in stock'**
  String svTied(String amount);

  /// No description provided for @svEstimated.
  ///
  /// In en, this message translates to:
  /// **'est. from sale price'**
  String get svEstimated;

  /// No description provided for @bkRestoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Backup?'**
  String get bkRestoreTitle;

  /// No description provided for @bkRestoreBody.
  ///
  /// In en, this message translates to:
  /// **'This will replace ALL current data with the backup file \"{filename}\". Continue?'**
  String bkRestoreBody(String filename);

  /// No description provided for @bkRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get bkRestore;

  /// No description provided for @bkRestoreDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore Complete'**
  String get bkRestoreDoneTitle;

  /// No description provided for @bkRestoreDoneBody.
  ///
  /// In en, this message translates to:
  /// **'Your data has been restored.'**
  String get bkRestoreDoneBody;

  /// No description provided for @bkOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get bkOk;

  /// No description provided for @bkRestoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {detail}'**
  String bkRestoreFailed(String detail);

  /// No description provided for @bkCouldNotRestore.
  ///
  /// In en, this message translates to:
  /// **'Could not restore: {error}'**
  String bkCouldNotRestore(String error);

  /// No description provided for @bkSaveToDownloads.
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads'**
  String get bkSaveToDownloads;

  /// No description provided for @bkIntroAdmin.
  ///
  /// In en, this message translates to:
  /// **'All your data lives in one database file. Download a copy regularly, and restore it if anything ever goes wrong.'**
  String get bkIntroAdmin;

  /// No description provided for @bkIntroStaff.
  ///
  /// In en, this message translates to:
  /// **'Full database backup and restore are admin-only. Ask an admin, or export what you need as CSV below.'**
  String get bkIntroStaff;

  /// No description provided for @bkBackupDb.
  ///
  /// In en, this message translates to:
  /// **'Backup Database'**
  String get bkBackupDb;

  /// No description provided for @bkBackupDbSub.
  ///
  /// In en, this message translates to:
  /// **'Download the whole database as one file and share it (WhatsApp, Drive, email).'**
  String get bkBackupDbSub;

  /// No description provided for @bkDownloadPhone.
  ///
  /// In en, this message translates to:
  /// **'Download Backup to Phone'**
  String get bkDownloadPhone;

  /// No description provided for @bkShareBackup.
  ///
  /// In en, this message translates to:
  /// **'Share Backup'**
  String get bkShareBackup;

  /// No description provided for @bkAutoTitle.
  ///
  /// In en, this message translates to:
  /// **'Automatic Backups'**
  String get bkAutoTitle;

  /// No description provided for @bkAutoBody.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 daily backup stored on the server, most recent from {time}. Runs on its own — nothing to do here.} other{{count} daily backups stored on the server, most recent from {time}. Runs on its own — nothing to do here.}}'**
  String bkAutoBody(int count, String time);

  /// No description provided for @bkRestoreSub.
  ///
  /// In en, this message translates to:
  /// **'Pick a saved backup file to replace the current data.'**
  String get bkRestoreSub;

  /// No description provided for @bkRestoreFromFile.
  ///
  /// In en, this message translates to:
  /// **'Restore from Backup File'**
  String get bkRestoreFromFile;

  /// No description provided for @bkExportCsv.
  ///
  /// In en, this message translates to:
  /// **'Export to CSV'**
  String get bkExportCsv;

  /// No description provided for @bkExportSub.
  ///
  /// In en, this message translates to:
  /// **'Open these in Excel or share them.'**
  String get bkExportSub;

  /// No description provided for @bkRangeAll.
  ///
  /// In en, this message translates to:
  /// **'Bills/Expenses: all time'**
  String get bkRangeAll;

  /// No description provided for @bkRangeSome.
  ///
  /// In en, this message translates to:
  /// **'Bills/Expenses: {start} to {end}'**
  String bkRangeSome(String end, String start);

  /// No description provided for @bkSetRange.
  ///
  /// In en, this message translates to:
  /// **'Set Range'**
  String get bkSetRange;

  /// No description provided for @bkClearRange.
  ///
  /// In en, this message translates to:
  /// **'Clear range'**
  String get bkClearRange;

  /// No description provided for @ntNever.
  ///
  /// In en, this message translates to:
  /// **'Never triggered'**
  String get ntNever;

  /// No description provided for @ntJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get ntJustNow;

  /// No description provided for @ntMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String ntMinutesAgo(int count);

  /// No description provided for @ntHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String ntHoursAgo(int count);

  /// No description provided for @ntDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String ntDaysAgo(int count);

  /// No description provided for @ntTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Notifications'**
  String get ntTitle;

  /// No description provided for @ntTapHint.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Check Now\" to trigger a notification and see live results.'**
  String get ntTapHint;

  /// No description provided for @ntLowStockSub.
  ///
  /// In en, this message translates to:
  /// **'Notify when items fall below their reorder level.'**
  String get ntLowStockSub;

  /// No description provided for @ntCheckNow.
  ///
  /// In en, this message translates to:
  /// **'Check Now'**
  String get ntCheckNow;

  /// No description provided for @ntOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue Payment Reminders'**
  String get ntOverdue;

  /// No description provided for @ntOverdueSub.
  ///
  /// In en, this message translates to:
  /// **'Notify about unpaid bills from previous days.'**
  String get ntOverdueSub;

  /// No description provided for @ntDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily Business Summary'**
  String get ntDaily;

  /// No description provided for @ntDailySub.
  ///
  /// In en, this message translates to:
  /// **'Yesterday\'s sales, collections, and profit at a glance.'**
  String get ntDailySub;

  /// No description provided for @ntSendSummary.
  ///
  /// In en, this message translates to:
  /// **'Send Summary'**
  String get ntSendSummary;

  /// No description provided for @ntRunning.
  ///
  /// In en, this message translates to:
  /// **'Running…'**
  String get ntRunning;

  /// No description provided for @ntLowStockItems.
  ///
  /// In en, this message translates to:
  /// **'Low Stock Items'**
  String get ntLowStockItems;

  /// No description provided for @ntSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get ntSales;

  /// No description provided for @ntCollected.
  ///
  /// In en, this message translates to:
  /// **'Collected'**
  String get ntCollected;

  /// No description provided for @ntProfit.
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get ntProfit;

  /// No description provided for @auChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking for updates…'**
  String get auChecking;

  /// No description provided for @auLatest.
  ///
  /// In en, this message translates to:
  /// **'You have the latest version.'**
  String get auLatest;

  /// No description provided for @auAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get auAvailable;

  /// No description provided for @auNewer.
  ///
  /// In en, this message translates to:
  /// **'A newer version of Book-Keep (build {code}) is ready.'**
  String auNewer(int code);

  /// No description provided for @auLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get auLater;

  /// No description provided for @auUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get auUpdate;

  /// No description provided for @auDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading update'**
  String get auDownloading;

  /// No description provided for @auSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved {name} to your Downloads folder.'**
  String auSaved(String name);

  /// No description provided for @auAllowInstall.
  ///
  /// In en, this message translates to:
  /// **'Allow Book-Keep to install apps, then tap Update again.'**
  String get auAllowInstall;

  /// No description provided for @auFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not update — check your connection and try again.'**
  String get auFailed;

  /// No description provided for @lgSearch.
  ///
  /// In en, this message translates to:
  /// **'Search languages'**
  String get lgSearch;

  /// No description provided for @lgNoMatch.
  ///
  /// In en, this message translates to:
  /// **'No languages match \"{query}\"'**
  String lgNoMatch(String query);

  /// No description provided for @alVoided.
  ///
  /// In en, this message translates to:
  /// **'Voided a bill'**
  String get alVoided;

  /// No description provided for @alDeletedBill.
  ///
  /// In en, this message translates to:
  /// **'Deleted a bill'**
  String get alDeletedBill;

  /// No description provided for @alReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned a bill'**
  String get alReturned;

  /// No description provided for @alDeletedCustomer.
  ///
  /// In en, this message translates to:
  /// **'Deleted a customer'**
  String get alDeletedCustomer;

  /// No description provided for @alDeletedSupplier.
  ///
  /// In en, this message translates to:
  /// **'Deleted a supplier'**
  String get alDeletedSupplier;

  /// No description provided for @alCreatedAccount.
  ///
  /// In en, this message translates to:
  /// **'Created an account'**
  String get alCreatedAccount;

  /// No description provided for @alUpdatedAccount.
  ///
  /// In en, this message translates to:
  /// **'Updated an account'**
  String get alUpdatedAccount;

  /// No description provided for @alDeletedAccount.
  ///
  /// In en, this message translates to:
  /// **'Deleted an account'**
  String get alDeletedAccount;

  /// No description provided for @alTitle.
  ///
  /// In en, this message translates to:
  /// **'Activity Log'**
  String get alTitle;

  /// No description provided for @alNone.
  ///
  /// In en, this message translates to:
  /// **'No activity recorded yet'**
  String get alNone;

  /// No description provided for @blkEnterOne.
  ///
  /// In en, this message translates to:
  /// **'Enter at least one item'**
  String get blkEnterOne;

  /// No description provided for @blkAdded.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item added successfully} other{{count} items added successfully}}'**
  String blkAdded(int count);

  /// No description provided for @blkTitle.
  ///
  /// In en, this message translates to:
  /// **'Bulk Add Items'**
  String get blkTitle;

  /// No description provided for @blkFormat.
  ///
  /// In en, this message translates to:
  /// **'One item per line, format: Name, Price, Unit, Category'**
  String get blkFormat;

  /// No description provided for @blkOptional.
  ///
  /// In en, this message translates to:
  /// **'Unit and category are optional (defaults: piece, none)'**
  String get blkOptional;

  /// No description provided for @blkAddAll.
  ///
  /// In en, this message translates to:
  /// **'Add All Items'**
  String get blkAddAll;

  /// No description provided for @prSend.
  ///
  /// In en, this message translates to:
  /// **'Send Payment Reminder'**
  String get prSend;

  /// No description provided for @prTone.
  ///
  /// In en, this message translates to:
  /// **'Select Tone:'**
  String get prTone;

  /// No description provided for @prPolite.
  ///
  /// In en, this message translates to:
  /// **'Polite'**
  String get prPolite;

  /// No description provided for @prStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get prStandard;

  /// No description provided for @prUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get prUrgent;

  /// No description provided for @prPreviewQr.
  ///
  /// In en, this message translates to:
  /// **'Preview JazzCash Payment QR'**
  String get prPreviewQr;

  /// No description provided for @prShareText.
  ///
  /// In en, this message translates to:
  /// **'Share Text'**
  String get prShareText;

  /// No description provided for @dsRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get dsRemaining;

  /// No description provided for @dsIncludesDiscount.
  ///
  /// In en, this message translates to:
  /// **'includes {amount} discount'**
  String dsIncludesDiscount(String amount);

  /// No description provided for @dsItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get dsItems;

  /// No description provided for @dsDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get dsDiscount;

  /// No description provided for @lkWrongPin.
  ///
  /// In en, this message translates to:
  /// **'Wrong PIN'**
  String get lkWrongPin;

  /// No description provided for @lkEnterPin.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get lkEnterPin;

  /// No description provided for @lkChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking fingerprint...'**
  String get lkChecking;

  /// No description provided for @bcTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan Barcode'**
  String get bcTitle;

  /// No description provided for @bcTorchNa.
  ///
  /// In en, this message translates to:
  /// **'Torch is not available on this device'**
  String get bcTorchNa;

  /// No description provided for @bcTorch.
  ///
  /// In en, this message translates to:
  /// **'Torch'**
  String get bcTorch;

  /// No description provided for @bcPoint.
  ///
  /// In en, this message translates to:
  /// **'Point the camera at a barcode'**
  String get bcPoint;

  /// No description provided for @qrNoNumber.
  ///
  /// In en, this message translates to:
  /// **'No JazzCash number configured. Set it in Settings to show a payment QR code.'**
  String get qrNoNumber;

  /// No description provided for @qrPay.
  ///
  /// In en, this message translates to:
  /// **'Pay via JazzCash'**
  String get qrPay;

  /// No description provided for @qrInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR Data'**
  String get qrInvalid;

  /// No description provided for @qrAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount: {amount}'**
  String qrAmount(String amount);

  /// No description provided for @qrNumber.
  ///
  /// In en, this message translates to:
  /// **'JazzCash: {number}'**
  String qrNumber(String number);

  /// No description provided for @qrCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy JazzCash number'**
  String get qrCopy;

  /// No description provided for @qrCopied.
  ///
  /// In en, this message translates to:
  /// **'JazzCash number copied to clipboard'**
  String get qrCopied;

  /// No description provided for @qrHint.
  ///
  /// In en, this message translates to:
  /// **'Scan or copy this number in your JazzCash app to pay.'**
  String get qrHint;

  /// No description provided for @clOwed.
  ///
  /// In en, this message translates to:
  /// **'{amount} owed'**
  String clOwed(String amount);

  /// No description provided for @lnEnterEmailFirst.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email above first.'**
  String get lnEnterEmailFirst;

  /// No description provided for @lnResetSent.
  ///
  /// In en, this message translates to:
  /// **'Password-reset email sent — check your inbox.'**
  String get lnResetSent;

  /// No description provided for @lnNoAccount.
  ///
  /// In en, this message translates to:
  /// **'No account found for that email.'**
  String get lnNoAccount;

  /// No description provided for @lnWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password.'**
  String get lnWrongPassword;

  /// No description provided for @lnInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t look like a valid email address.'**
  String get lnInvalidEmail;

  /// No description provided for @lnDisabled.
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled.'**
  String get lnDisabled;

  /// No description provided for @lnTooMany.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts — try again in a minute.'**
  String get lnTooMany;

  /// No description provided for @lnNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get lnNoInternet;

  /// No description provided for @lnWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters.'**
  String get lnWeakPassword;

  /// No description provided for @lnCouldNotSignIn.
  ///
  /// In en, this message translates to:
  /// **'Could not sign in. Please try again.'**
  String get lnCouldNotSignIn;

  /// No description provided for @lnWrongPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password. Try again or tap \"Forgot password?\".'**
  String get lnWrongPasswordHint;

  /// No description provided for @lnWrongEmail.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email — no account uses that address.'**
  String get lnWrongEmail;

  /// No description provided for @lnWrongEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password.'**
  String get lnWrongEmailOrPassword;

  /// No description provided for @lnWrongUsername.
  ///
  /// In en, this message translates to:
  /// **'Incorrect username — no account uses that name.'**
  String get lnWrongUsername;

  /// No description provided for @lnWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get lnWelcome;

  /// No description provided for @lnSignInTo.
  ///
  /// In en, this message translates to:
  /// **'Sign in to {app}'**
  String lnSignInTo(String app);

  /// No description provided for @lnEmailOrUsername.
  ///
  /// In en, this message translates to:
  /// **'Email or Username'**
  String get lnEmailOrUsername;

  /// No description provided for @lnRemember.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get lnRemember;

  /// No description provided for @lnForgot.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get lnForgot;

  /// No description provided for @lnSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get lnSignIn;

  /// No description provided for @lnGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get lnGoogle;

  /// No description provided for @lnNew.
  ///
  /// In en, this message translates to:
  /// **'New here?'**
  String get lnNew;

  /// No description provided for @lnCreate.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get lnCreate;

  /// No description provided for @suCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created for {email}. A verification email was sent (optional).'**
  String suCreated(String email);

  /// No description provided for @suSetup.
  ///
  /// In en, this message translates to:
  /// **'Set up {app}'**
  String suSetup(String app);

  /// No description provided for @suName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get suName;

  /// No description provided for @suEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get suEmail;

  /// No description provided for @suPhoneDigits.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid {digits}-digit number'**
  String suPhoneDigits(int digits);

  /// No description provided for @suCreateBtn.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get suCreateBtn;

  /// No description provided for @suHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get suHaveAccount;

  /// No description provided for @suAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'An account already exists for that email.'**
  String get suAlreadyExists;

  /// No description provided for @suInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get suInvalidEmail;

  /// No description provided for @agShow.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get agShow;

  /// No description provided for @agHide.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get agHide;

  /// No description provided for @adAccounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get adAccounts;

  /// No description provided for @adAccountsSub.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 registered account} other{{count} registered accounts}}'**
  String adAccountsSub(int count);

  /// No description provided for @adAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get adAdd;

  /// No description provided for @adNoAccounts.
  ///
  /// In en, this message translates to:
  /// **'No accounts found.'**
  String get adNoAccounts;

  /// No description provided for @adAccountability.
  ///
  /// In en, this message translates to:
  /// **'Accountability'**
  String get adAccountability;

  /// No description provided for @adAccountabilitySub.
  ///
  /// In en, this message translates to:
  /// **'Who voided, deleted, or returned something, and account changes.'**
  String get adAccountabilitySub;

  /// No description provided for @adActivitySub.
  ///
  /// In en, this message translates to:
  /// **'Voided bills, deletions, account changes'**
  String get adActivitySub;

  /// No description provided for @adServer.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get adServer;

  /// No description provided for @adServerSub.
  ///
  /// In en, this message translates to:
  /// **'Where this app talks to. Rarely needs changing after setup.'**
  String get adServerSub;

  /// No description provided for @adServerHint.
  ///
  /// In en, this message translates to:
  /// **'Emulator uses 10.0.2.2; a real phone needs the laptop’s IP on the same Wi-Fi. Changing it affects every account.'**
  String get adServerHint;

  /// No description provided for @adApiBase.
  ///
  /// In en, this message translates to:
  /// **'API Base URL'**
  String get adApiBase;

  /// No description provided for @adSaveServer.
  ///
  /// In en, this message translates to:
  /// **'Save Server Address'**
  String get adSaveServer;

  /// No description provided for @adEmailSetSub.
  ///
  /// In en, this message translates to:
  /// **'Set up — staff can email invoices/statements to customers.'**
  String get adEmailSetSub;

  /// No description provided for @adNotSetUp.
  ///
  /// In en, this message translates to:
  /// **'Not set up yet.'**
  String get adNotSetUp;

  /// No description provided for @adEmailSetBody.
  ///
  /// In en, this message translates to:
  /// **'Email is set up. Lets staff email an invoice or statement straight to a customer.'**
  String get adEmailSetBody;

  /// No description provided for @adEmailHelp.
  ///
  /// In en, this message translates to:
  /// **'A Gmail address works with an app password (smtp.gmail.com, port 587), or use your email provider\'s SMTP details.'**
  String get adEmailHelp;

  /// No description provided for @adSmtpHost.
  ///
  /// In en, this message translates to:
  /// **'SMTP Host'**
  String get adSmtpHost;

  /// No description provided for @adSmtpPort.
  ///
  /// In en, this message translates to:
  /// **'SMTP Port'**
  String get adSmtpPort;

  /// No description provided for @adEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get adEmailAddress;

  /// No description provided for @adPwKeep.
  ///
  /// In en, this message translates to:
  /// **'Password (leave blank to keep current)'**
  String get adPwKeep;

  /// No description provided for @adPwApp.
  ///
  /// In en, this message translates to:
  /// **'Password (app password, not your login password)'**
  String get adPwApp;

  /// No description provided for @adFromName.
  ///
  /// In en, this message translates to:
  /// **'From Name (optional)'**
  String get adFromName;

  /// No description provided for @adFromHint.
  ///
  /// In en, this message translates to:
  /// **'My Hardware Shop'**
  String get adFromHint;

  /// No description provided for @adSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get adSaving;

  /// No description provided for @adSaveEmail.
  ///
  /// In en, this message translates to:
  /// **'Save Email Settings'**
  String get adSaveEmail;

  /// No description provided for @adAddAccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get adAddAccount;

  /// No description provided for @adNameOpt.
  ///
  /// In en, this message translates to:
  /// **'Name (optional)'**
  String get adNameOpt;

  /// No description provided for @adAtLeast6.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get adAtLeast6;

  /// No description provided for @adGrantAdmin.
  ///
  /// In en, this message translates to:
  /// **'Grant admin'**
  String get adGrantAdmin;

  /// No description provided for @adCanManage.
  ///
  /// In en, this message translates to:
  /// **'Can void/delete/return'**
  String get adCanManage;

  /// No description provided for @adCanManageHint.
  ///
  /// In en, this message translates to:
  /// **'Void or delete a bill, return a bill, or delete a customer/supplier. An admin always has this.'**
  String get adCanManageHint;

  /// No description provided for @adCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get adCreate;

  /// No description provided for @adAccountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created.'**
  String get adAccountCreated;

  /// No description provided for @adCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Create failed: {error}'**
  String adCreateFailed(String error);

  /// No description provided for @adEditAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit account'**
  String get adEditAccount;

  /// No description provided for @adAdminSwitch.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adAdminSwitch;

  /// No description provided for @adAdminHint.
  ///
  /// In en, this message translates to:
  /// **'Can open the admin panel'**
  String get adAdminHint;

  /// No description provided for @adDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get adDisabled;

  /// No description provided for @adDisabledHint.
  ///
  /// In en, this message translates to:
  /// **'Blocked from signing in'**
  String get adDisabledHint;

  /// No description provided for @adAccountUpdated.
  ///
  /// In en, this message translates to:
  /// **'Account updated.'**
  String get adAccountUpdated;

  /// No description provided for @adUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed: {error}'**
  String adUpdateFailed(String error);

  /// No description provided for @adDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'{label} will be permanently removed and can no longer sign in.'**
  String adDeleteBody(String label);

  /// No description provided for @adAccountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted.'**
  String get adAccountDeleted;

  /// No description provided for @adDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete failed: {error}'**
  String adDeleteFailed(String error);

  /// No description provided for @adBadgeAdmin.
  ///
  /// In en, this message translates to:
  /// **'ADMIN'**
  String get adBadgeAdmin;

  /// No description provided for @adBadgeDisabled.
  ///
  /// In en, this message translates to:
  /// **'DISABLED'**
  String get adBadgeDisabled;

  /// No description provided for @adOff.
  ///
  /// In en, this message translates to:
  /// **'Admin panel is off'**
  String get adOff;

  /// No description provided for @adCheckAgain.
  ///
  /// In en, this message translates to:
  /// **'Check again'**
  String get adCheckAgain;

  /// No description provided for @adAccessRequired.
  ///
  /// In en, this message translates to:
  /// **'Admin access required'**
  String get adAccessRequired;

  /// No description provided for @adAccessBody.
  ///
  /// In en, this message translates to:
  /// **'Only shop admins can manage accounts. Ask the shop owner to grant you admin access.'**
  String get adAccessBody;

  /// No description provided for @adCouldNotLoad.
  ///
  /// In en, this message translates to:
  /// **'Could not load the admin panel.'**
  String get adCouldNotLoad;

  /// No description provided for @adBadPort.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid SMTP port number.'**
  String get adBadPort;

  /// No description provided for @adEmailSaved.
  ///
  /// In en, this message translates to:
  /// **'Email settings saved.'**
  String get adEmailSaved;

  /// No description provided for @adEmailSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save email settings: {error}'**
  String adEmailSaveFailed(String error);

  /// No description provided for @adServerEmpty.
  ///
  /// In en, this message translates to:
  /// **'Server address cannot be empty.'**
  String get adServerEmpty;

  /// No description provided for @adServerSaved.
  ///
  /// In en, this message translates to:
  /// **'Server address saved. Screens will use it on next load.'**
  String get adServerSaved;

  /// No description provided for @lnOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get lnOr;

  /// No description provided for @scNotABill.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t look like a bill. Try again with a clear photo of the bill.'**
  String get scNotABill;

  /// No description provided for @scNotAnInvoice.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t look like an invoice. Try again with a clear photo of the supplier\'s invoice.'**
  String get scNotAnInvoice;

  /// No description provided for @jqOpenFull.
  ///
  /// In en, this message translates to:
  /// **'Full size'**
  String get jqOpenFull;

  /// No description provided for @jqCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy number'**
  String get jqCopy;

  /// No description provided for @jqSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'JazzCash QR'**
  String get jqSheetTitle;

  /// No description provided for @jqSheetHint.
  ///
  /// In en, this message translates to:
  /// **'Customers scan this in their JazzCash app to pay you.'**
  String get jqSheetHint;

  /// No description provided for @jqCheck.
  ///
  /// In en, this message translates to:
  /// **'Check the number'**
  String get jqCheck;

  /// No description provided for @askVoice.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get askVoice;

  /// No description provided for @askVoiceFallbackNote.
  ///
  /// In en, this message translates to:
  /// **'Reading this with your phone\'s voice.'**
  String get askVoiceFallbackNote;

  /// No description provided for @askPace.
  ///
  /// In en, this message translates to:
  /// **'Pace'**
  String get askPace;

  /// No description provided for @askTone.
  ///
  /// In en, this message translates to:
  /// **'Tone'**
  String get askTone;

  /// No description provided for @askPaceSlower.
  ///
  /// In en, this message translates to:
  /// **'Slower'**
  String get askPaceSlower;

  /// No description provided for @askPaceNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get askPaceNormal;

  /// No description provided for @askPaceFaster.
  ///
  /// In en, this message translates to:
  /// **'Faster'**
  String get askPaceFaster;

  /// No description provided for @askToneCalm.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get askToneCalm;

  /// No description provided for @askToneWarm.
  ///
  /// In en, this message translates to:
  /// **'Warm'**
  String get askToneWarm;

  /// No description provided for @askToneCheerful.
  ///
  /// In en, this message translates to:
  /// **'Cheerful'**
  String get askToneCheerful;

  /// No description provided for @qPaymentUpdate.
  ///
  /// In en, this message translates to:
  /// **'Payment update: {amount}'**
  String qPaymentUpdate(String amount);

  /// No description provided for @qCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer: {name}'**
  String qCustomer(String name);

  /// No description provided for @qSupplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier: {name}'**
  String qSupplier(String name);

  /// No description provided for @qItem.
  ///
  /// In en, this message translates to:
  /// **'Item: {name}'**
  String qItem(String name);

  /// No description provided for @qExpense.
  ///
  /// In en, this message translates to:
  /// **'Expense: {name}'**
  String qExpense(String name);

  /// No description provided for @qPurchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase: {amount}'**
  String qPurchase(String amount);

  /// No description provided for @qPaymentCollected.
  ///
  /// In en, this message translates to:
  /// **'Payment collected: {amount} from {name}'**
  String qPaymentCollected(String amount, String name);

  /// No description provided for @gstAmount.
  ///
  /// In en, this message translates to:
  /// **'GST {amount}'**
  String gstAmount(String amount);

  /// No description provided for @gstItemLine.
  ///
  /// In en, this message translates to:
  /// **'Taxable {taxable}  ·  GST {tax}  ·  Total {total}'**
  String gstItemLine(String tax, String taxable, String total);

  /// No description provided for @rpBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Revenue: {revenue}  •  COGS: {cogs}  •  Expenses: {expenses}'**
  String rpBreakdown(String cogs, String expenses, String revenue);

  /// No description provided for @msgReminderGentle.
  ///
  /// In en, this message translates to:
  /// **'Hello {customer}, gentle greeting from {shop}! Your total balance due is {amount}. Thank you!'**
  String msgReminderGentle(String amount, String customer, String shop);

  /// No description provided for @msgReminderStandard.
  ///
  /// In en, this message translates to:
  /// **'Hello {customer}, payment reminder from {shop} for pending balance of {amount}. Kindly pay at your earliest convenience.'**
  String msgReminderStandard(String amount, String customer, String shop);

  /// No description provided for @msgReminderUrgent.
  ///
  /// In en, this message translates to:
  /// **'URGENT NOTICE: Dear {customer}, your outstanding payment of {amount} at {shop} is pending. Please settle immediately.'**
  String msgReminderUrgent(String amount, String customer, String shop);

  /// No description provided for @msgPayViaJazzCash.
  ///
  /// In en, this message translates to:
  /// **'Pay via JazzCash: {number}'**
  String msgPayViaJazzCash(String number);

  /// No description provided for @msgInvoiceShare.
  ///
  /// In en, this message translates to:
  /// **'Invoice from {shop}\nTotal: {total}\nItems: {items}\nStatus: {status}'**
  String msgInvoiceShare(String items, String shop, String status, String total);

  /// No description provided for @msgReorder.
  ///
  /// In en, this message translates to:
  /// **'Hello {supplier}, this is {shop}. We would like to place an order for:\n{lines}\n\nPlease confirm availability and price. Thank you.'**
  String msgReorder(String lines, String shop, String supplier);

  /// No description provided for @ppUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: {date}'**
  String ppUpdated(String date);

  /// No description provided for @ppWhoH.
  ///
  /// In en, this message translates to:
  /// **'Who this is'**
  String get ppWhoH;

  /// No description provided for @ppWho.
  ///
  /// In en, this message translates to:
  /// **'{owner}, operating Book-keep.\nContact: {email}'**
  String ppWho(String owner, String email);

  /// No description provided for @ppCollectH.
  ///
  /// In en, this message translates to:
  /// **'What we collect'**
  String get ppCollectH;

  /// No description provided for @ppCollectAccount.
  ///
  /// In en, this message translates to:
  /// **'Account: email, phone number, and username, via Firebase Authentication.'**
  String get ppCollectAccount;

  /// No description provided for @ppCollectShop.
  ///
  /// In en, this message translates to:
  /// **'Shop profile: shop name, address, phone number, JazzCash number, and shop logo image — entered by the shop owner in Settings.'**
  String get ppCollectShop;

  /// No description provided for @ppCollectRecords.
  ///
  /// In en, this message translates to:
  /// **'Business records you create: customer and supplier names and phone numbers, bills, purchases, item catalog entries (including item photos and barcodes), and expenses (including receipt photos). This is the app’s core data — it’s how bookkeeping works.'**
  String get ppCollectRecords;

  /// No description provided for @ppCollectDevice.
  ///
  /// In en, this message translates to:
  /// **'Device and diagnostic data: a push-notification token (for low-stock, overdue-payment, and daily-summary alerts) and crash reports (device info and stack traces) via Firebase Crashlytics, sent automatically when the app crashes.'**
  String get ppCollectDevice;

  /// No description provided for @ppCollectAi.
  ///
  /// In en, this message translates to:
  /// **'AI features: {askShop}, the AI Morning Briefing, and the AI bill/purchase scanner send a snapshot of the relevant business data (report figures, or a photo of a bill) to Google’s Gemini API to generate an answer, summary, or extracted line items. This data is processed by Google to generate the response; it is not used by us or Google to train models outside of Google’s standard API terms.'**
  String ppCollectAi(String askShop);

  /// No description provided for @ppDontH.
  ///
  /// In en, this message translates to:
  /// **'What we don’t do'**
  String get ppDontH;

  /// No description provided for @ppDontLocation.
  ///
  /// In en, this message translates to:
  /// **'We don’t track your location.'**
  String get ppDontLocation;

  /// No description provided for @ppDontAds.
  ///
  /// In en, this message translates to:
  /// **'We don’t use ad networks or behavioral analytics/session-replay tools.'**
  String get ppDontAds;

  /// No description provided for @ppDontSell.
  ///
  /// In en, this message translates to:
  /// **'We don’t sell your data or your customers’ data to anyone.'**
  String get ppDontSell;

  /// No description provided for @ppWhereH.
  ///
  /// In en, this message translates to:
  /// **'Where data lives'**
  String get ppWhereH;

  /// No description provided for @ppWhereDb.
  ///
  /// In en, this message translates to:
  /// **'Database: Neon (Postgres), a third-party cloud database provider.'**
  String get ppWhereDb;

  /// No description provided for @ppWhereFirebase.
  ///
  /// In en, this message translates to:
  /// **'Authentication, push notifications, crash reports, photo storage: Firebase (Google).'**
  String get ppWhereFirebase;

  /// No description provided for @ppWhereAi.
  ///
  /// In en, this message translates to:
  /// **'AI processing: Google Gemini API.'**
  String get ppWhereAi;

  /// No description provided for @ppWhereEmail.
  ///
  /// In en, this message translates to:
  /// **'Invoice emails: sent through the SMTP account the shop’s own admin configures in the {adminPanel} — we don’t operate a mailing list, and these emails are one-to-one invoices/statements to your own existing customers, not bulk marketing.'**
  String ppWhereEmail(String adminPanel);

  /// No description provided for @ppYoursH.
  ///
  /// In en, this message translates to:
  /// **'Your data, your customers’ data'**
  String get ppYoursH;

  /// No description provided for @ppYours.
  ///
  /// In en, this message translates to:
  /// **'Everything you enter — customers, suppliers, bills, items — belongs to your shop. Other shops using Book-keep cannot see it. Staff accounts you create for your shop can see what you grant them access to, nothing more.'**
  String get ppYours;

  /// No description provided for @ppControlsH.
  ///
  /// In en, this message translates to:
  /// **'Your controls'**
  String get ppControlsH;

  /// No description provided for @ppControlExport.
  ///
  /// In en, this message translates to:
  /// **'Export or back up your data: {path}'**
  String ppControlExport(String path);

  /// No description provided for @ppControlDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete your account: {path}. This removes your sign-in credential only — it does not erase your shop’s business records (bills, customers, items, etc.), the same way removing a staff member doesn’t delete records they created.'**
  String ppControlDelete(String path);

  /// No description provided for @ppControlNotif.
  ///
  /// In en, this message translates to:
  /// **'Notifications: can be turned off per type in {path}.'**
  String ppControlNotif(String path);

  /// No description provided for @ppChildrenH.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get ppChildrenH;

  /// No description provided for @ppChildren.
  ///
  /// In en, this message translates to:
  /// **'Book-keep is a business tool for shop owners and staff. It is not directed at, or knowingly used by, children.'**
  String get ppChildren;

  /// No description provided for @ppChangesH.
  ///
  /// In en, this message translates to:
  /// **'Changes to this policy'**
  String get ppChangesH;

  /// No description provided for @ppChanges.
  ///
  /// In en, this message translates to:
  /// **'If what we collect or where it goes changes, we’ll update this page and change the date at the top.'**
  String get ppChanges;

  /// No description provided for @ppContactH.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get ppContactH;

  /// No description provided for @ppContact.
  ///
  /// In en, this message translates to:
  /// **'Questions about this policy or your data: {email}'**
  String ppContact(String email);

  /// No description provided for @waHello.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get waHello;

  /// No description provided for @waHelloNamed.
  ///
  /// In en, this message translates to:
  /// **'Hi {name},'**
  String waHelloNamed(String name);

  /// No description provided for @gstTaxable.
  ///
  /// In en, this message translates to:
  /// **'Taxable'**
  String get gstTaxable;

  /// No description provided for @gstTax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get gstTax;

  /// No description provided for @gstTaxableValue.
  ///
  /// In en, this message translates to:
  /// **'Taxable value'**
  String get gstTaxableValue;

  /// No description provided for @gstTotalTax.
  ///
  /// In en, this message translates to:
  /// **'Total tax'**
  String get gstTotalTax;

  /// No description provided for @gstTotalItc.
  ///
  /// In en, this message translates to:
  /// **'Total input tax credit'**
  String get gstTotalItc;

  /// No description provided for @gstExempt.
  ///
  /// In en, this message translates to:
  /// **'Exempt supplies'**
  String get gstExempt;

  /// No description provided for @gstNetPayable.
  ///
  /// In en, this message translates to:
  /// **'Net tax payable'**
  String get gstNetPayable;

  /// No description provided for @unknownName.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownName;

  /// No description provided for @unitPiece.
  ///
  /// In en, this message translates to:
  /// **'piece'**
  String get unitPiece;

  /// No description provided for @unitKg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @unitMeter.
  ///
  /// In en, this message translates to:
  /// **'meter'**
  String get unitMeter;

  /// No description provided for @unitBox.
  ///
  /// In en, this message translates to:
  /// **'box'**
  String get unitBox;

  /// No description provided for @unitDozen.
  ///
  /// In en, this message translates to:
  /// **'dozen'**
  String get unitDozen;

  /// No description provided for @unitLiter.
  ///
  /// In en, this message translates to:
  /// **'liter'**
  String get unitLiter;

  /// No description provided for @unitBag.
  ///
  /// In en, this message translates to:
  /// **'bag'**
  String get unitBag;

  /// No description provided for @deleteSupplierMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete {name} and all their purchases? This cannot be undone.'**
  String deleteSupplierMessage(String name);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'bn', 'de', 'en', 'es', 'fa', 'fr', 'hi', 'id', 'ja', 'ko', 'pa', 'ps', 'pt', 'ru', 'sd', 'sw', 'tr', 'ur', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'bn': return AppLocalizationsBn();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fa': return AppLocalizationsFa();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'id': return AppLocalizationsId();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'pa': return AppLocalizationsPa();
    case 'ps': return AppLocalizationsPs();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'sd': return AppLocalizationsSd();
    case 'sw': return AppLocalizationsSw();
    case 'tr': return AppLocalizationsTr();
    case 'ur': return AppLocalizationsUr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
