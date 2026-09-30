// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navCustomers => 'Customers';

  @override
  String get navItems => 'Items';

  @override
  String get navSuppliers => 'Suppliers';

  @override
  String get navReports => 'Reports';

  @override
  String get navSettings => 'Settings';

  @override
  String get settingsShopDetailsTitle => 'Shop Details';

  @override
  String get settingsShopDetailsSubtitle => 'Shown on your invoices.';

  @override
  String get settingsShopNameLabel => 'Shop Name';

  @override
  String get settingsShopAddressLabel => 'Shop Address';

  @override
  String get settingsPhoneLabel => 'Phone';

  @override
  String get settingsSaveShopDetails => 'Save Shop Details';

  @override
  String get settingsAppearanceTitle => 'Appearance';

  @override
  String get settingsAppearanceSubtitle => 'Pick a theme for the whole app.';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get settingsLanguageSubtitle => 'Choose the app\'s display language.';

  @override
  String get sortNameNewest => 'Sort: Name / Newest';

  @override
  String get addCustomer => 'Add Customer';

  @override
  String get importCsv => 'Import CSV';

  @override
  String get searchShop => 'Search Shop';

  @override
  String get scanToFindItem => 'Scan to Find Item';

  @override
  String get bulkAdd => 'Bulk Add';

  @override
  String get updateStock => 'Update Stock';

  @override
  String get printLabels => 'Print Labels';

  @override
  String get mergeDuplicates => 'Merge Duplicates';

  @override
  String get addSupplier => 'Add Supplier';

  @override
  String get scanPurchaseInvoice => 'Scan Purchase Invoice';

  @override
  String askNoAnswer(String reason) {
    return 'Could not get an answer: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Could not connect: $error';
  }

  @override
  String get micPermissionNeeded => 'Microphone permission is needed for voice input.';

  @override
  String get speechUnavailable => 'Speech recognition isn\'t available on this device.';

  @override
  String get askYourShop => 'Ask Your Shop';

  @override
  String get close => 'Close';

  @override
  String get askIntro => 'Wondering how the shop is doing? Ask me, and I’ll answer from what’s in your books.';

  @override
  String get askListening => 'Listening…';

  @override
  String get askThinkingWords => 'Thinking…|Working on it…|Figuring it out…|Crunching the numbers…|Checking your books…|Adding it up…|Doing the math…|Tallying things up…|Digging through the figures…|Connecting the dots…|Pondering…|Sorting it out…';

  @override
  String get askSayQuestion => 'Say your question — tap the orb to cancel';

  @override
  String briefingRefreshFailed(int code) {
    return 'Could not refresh briefing ($code).';
  }

  @override
  String get refreshFailedOffline => 'Could not refresh — check your connection.';

  @override
  String get newBillFailed => 'Could not start a new bill — check your connection and try again.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Set a preferred supplier for $name first (tap to edit).';
  }

  @override
  String get reorderBySupplier => 'Reorder by supplier';

  @override
  String get supplier => 'Supplier';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'No low-stock items have a preferred supplier set yet.';

  @override
  String get thisSupplier => 'This supplier';

  @override
  String supplierNoPhone(String name) {
    return '$name has no phone number set.';
  }

  @override
  String get tabOverview => 'Overview';

  @override
  String get tabStock => 'Stock';

  @override
  String get tabMoney => 'Money';

  @override
  String get taglineOverview => 'Today\'s dues, stock, and cash at a glance.';

  @override
  String get taglineStock => 'What\'s moving, what\'s running low.';

  @override
  String get taglineMoney => 'Expenses, reconciliation, and collections.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Loading dashboard… $done of $total';
  }

  @override
  String get dashboardLoadFailed => 'Couldn\'t load the dashboard';

  @override
  String get checkConnectionRetry => 'Check your connection and try again.';

  @override
  String get retry => 'Retry';

  @override
  String get aiBriefing => 'AI Briefing';

  @override
  String get briefingPrompt => 'See yesterday\'s business summed up in a few sentences.';

  @override
  String get getBriefing => 'Get Briefing';

  @override
  String get refreshBriefing => 'Refresh briefing';

  @override
  String updatedAt(String time) {
    return 'Updated $time';
  }

  @override
  String get customersUnknown => '— customers';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count customers',
      one: '1 customer',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Previous month';

  @override
  String get nextMonth => 'Next month';

  @override
  String get salesMonth => 'Sales (Month)';

  @override
  String get outstanding => 'Outstanding';

  @override
  String get profitMonth => 'Profit (Month)';

  @override
  String get cashToday => 'Cash Today';

  @override
  String get newBill => 'New Bill';

  @override
  String get scanHandwrittenBill => 'Scan a Handwritten Bill';

  @override
  String get topOutstanding => 'Top Outstanding Balances';

  @override
  String viewAllInDues(int count) {
    return 'View all $count in Dues Center';
  }

  @override
  String get lowStockAlerts => 'Low Stock Alerts';

  @override
  String get noLowStock => 'No low-stock items — stock looks good.';

  @override
  String get whatsappAll => 'WhatsApp All';

  @override
  String get reorderAll => 'Reorder All';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Suggest reordering $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit left';
  }

  @override
  String get reorder => 'Reorder';

  @override
  String get whatsappSupplier => 'WhatsApp supplier';

  @override
  String get topItemsByRevenue => 'Top Items by Revenue';

  @override
  String get noSalesYet => 'No sales recorded yet.';

  @override
  String qtyLabel(String qty) {
    return 'Qty: $qty';
  }

  @override
  String get monthExpenses => 'This Month\'s Expenses';

  @override
  String get noExpensesMonth => 'No expenses recorded this month.';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get dailyCashReconciliation => 'Daily Cash Reconciliation';

  @override
  String get collectMoney => 'Collect Money';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count changes saved offline',
      one: '1 change saved offline',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Will sync automatically when back online';

  @override
  String get syncing => 'Syncing';

  @override
  String get sync => 'Sync';

  @override
  String get shopProfile => 'Shop Profile';

  @override
  String get insights => 'Insights';

  @override
  String get notifications => 'Notifications';

  @override
  String get backupExport => 'Backup & Export';

  @override
  String get adminPanel => 'Admin Panel';

  @override
  String get toolsSync => 'Tools & Sync';

  @override
  String get account => 'Account';

  @override
  String get shopDetailsSaved => 'Shop details saved.';

  @override
  String saveFailed(int code) {
    return 'Failed to save ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Could not save: $error';
  }

  @override
  String get logoUpdated => 'Logo updated.';

  @override
  String logoUploadFailed(int code) {
    return 'Failed to upload logo ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Could not upload logo: $error';
  }

  @override
  String get healthGood => 'Looking good overall.';

  @override
  String get healthSome => 'A few things could use attention.';

  @override
  String get healthMany => 'Several things need attention.';

  @override
  String get shopHealth => 'Shop Health';

  @override
  String get healthIntro => 'A quick nudge, not another report to read.';

  @override
  String get couldNotLoadCheckConnection => 'Could not load — check your connection.';

  @override
  String get itemPhotos => 'Item photos';

  @override
  String get barcodes => 'Barcodes';

  @override
  String get lowStockItems => 'Low-stock items';

  @override
  String get lastBackup => 'Last backup';

  @override
  String get today => 'today';

  @override
  String get yesterday => 'yesterday';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Offline Status';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get waitingToSync => 'Waiting to sync';

  @override
  String get syncNow => 'Sync now';

  @override
  String get searchSettings => 'Search settings';

  @override
  String noSettingsMatch(String query) {
    return 'No settings match \"$query\"';
  }

  @override
  String get businessInfo => 'BUSINESS INFO';

  @override
  String get payment => 'PAYMENT';

  @override
  String get shopNameRequired => 'Shop name is required';

  @override
  String phoneIncomplete(int digits) {
    return 'Enter a complete $digits-digit phone number';
  }

  @override
  String get jazzcashOptional => 'JazzCash Number (optional)';

  @override
  String get saved => 'Saved!';

  @override
  String get languageSubtitle => 'Change the app\'s display language';

  @override
  String get notificationsSubtitle => 'Low stock, overdue payments & daily summary';

  @override
  String get backupSubtitle => 'Download, restore & export shop data';

  @override
  String get appUpdate => 'App update';

  @override
  String get appUpdateSubtitle => 'Check for a newer version';

  @override
  String get adminSubtitle => 'Manage accounts & shop data';

  @override
  String get accountSubtitle => 'Sign-in, password & username';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacySubtitle => 'What data we collect and why';

  @override
  String get yourShop => 'Your Shop';

  @override
  String get uploadingLogo => 'Uploading shop logo';

  @override
  String get logoTapToChange => 'Shop logo, tap to change';

  @override
  String get brandTagline => 'Busy shop, calm books.';

  @override
  String serverError(int code) {
    return 'Server error: $code';
  }

  @override
  String get deleteCustomer => 'Delete Customer';

  @override
  String deleteCustomerMessage(String name) {
    return 'Delete $name and all their bills? This cannot be undone.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Could not delete: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Could not delete — check your connection and try again.';

  @override
  String get actions => 'Actions';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count Customers',
      one: 'Delete 1 Customer',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count customers and all their bills? This cannot be undone.',
      one: 'Delete 1 customer and all their bills? This cannot be undone.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Deselect All';

  @override
  String get selectAll => 'Select All';

  @override
  String selectedCount(int count) {
    return '$count selected';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get newTag => 'NEW';

  @override
  String get csvNeedsRows => 'CSV needs a header row plus at least one customer.';

  @override
  String get csvNeedsName => 'CSV header must include a \"name\" column.';

  @override
  String csvLineMissingName(int line) {
    return 'Line $line: missing name — fix the file and retry.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Line $line: invalid credit_limit \"$value\" — fix the file and retry.';
  }

  @override
  String get importCustomers => 'Import Customers';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Found $count customers in \"$file\". Import them all?',
      one: 'Found 1 customer in \"$file\". Import them all?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Import';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imported $count customers.',
      one: 'Imported 1 customer.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Import failed: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Import failed — could not connect: $error';
  }

  @override
  String get noPhone => 'No phone';

  @override
  String get offlineShowingSaved => 'Offline — showing saved copy';

  @override
  String get searchCustomersHint => 'Search customers or phone...';

  @override
  String get noCustomersYet => 'No customers yet. Tap + to add one.';

  @override
  String get noCustomersMatch => 'No customers match your search.';

  @override
  String get owesMoney => 'Owes Money';

  @override
  String get settledUp => 'Settled Up';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'Could not load $what: $error';
  }

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get back => 'Back';

  @override
  String callPhone(String phone) {
    return 'Call $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp $phone';
  }

  @override
  String get clearSearch => 'Clear search';

  @override
  String get askHint => 'e.g. How much profit did I make this month?';

  @override
  String get acctTurnOffLockTitle => 'Turn off App Lock?';

  @override
  String get acctTurnOffLockBody => 'Anyone with this phone will be able to open the app without a PIN.';

  @override
  String get acctTurnOff => 'Turn Off';

  @override
  String get acctSetPinTitle => 'Set a PIN';

  @override
  String get acctPinLabel => '4-6 digit PIN';

  @override
  String get acctPinMin => 'At least 4 digits';

  @override
  String get acctConfirmPin => 'Confirm PIN';

  @override
  String get acctPinMismatch => 'PINs don\'t match';

  @override
  String get acctSetPin => 'Set PIN';

  @override
  String get acctBiometricTitle => 'Use fingerprint/face too?';

  @override
  String get acctBiometricBody => 'You can still use the PIN if biometrics ever fail.';

  @override
  String get acctNoThanks => 'No thanks';

  @override
  String get acctEnable => 'Enable';

  @override
  String get acctSetPasswordTitle => 'Set a password';

  @override
  String get acctSetPasswordIntro => 'Choose a password so you can also sign in with email + password next time, instead of only Google.';

  @override
  String get acctPassword => 'Password';

  @override
  String get acctPasswordMin => 'Must be at least 6 characters';

  @override
  String get acctConfirmPassword => 'Confirm password';

  @override
  String get acctPasswordsMismatch => 'Passwords do not match';

  @override
  String get acctSetPasswordButton => 'Set Password';

  @override
  String get acctPasswordSet => 'Password set — you can now sign in with it too.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Could not set password: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Change password';

  @override
  String get acctCurrentPassword => 'Current password';

  @override
  String get acctRequired => 'Required';

  @override
  String get acctNewPassword => 'New password';

  @override
  String get acctConfirmNewPassword => 'Confirm new password';

  @override
  String get acctChange => 'Change';

  @override
  String get acctPasswordChanged => 'Password changed.';

  @override
  String get acctWrongPassword => 'Current password is incorrect.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Could not change password: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Change username';

  @override
  String get acctUsername => 'Username';

  @override
  String get acctUsernameEmpty => 'Username can\'t be empty';

  @override
  String get acctUsernameChanged => 'Username changed.';

  @override
  String get acctChangeEmailTitle => 'Change email';

  @override
  String get acctNewEmail => 'New email';

  @override
  String get acctValidEmail => 'Enter a valid email';

  @override
  String get acctRequiredConfirm => 'Required to confirm it\'s you';

  @override
  String get acctGoogleConfirmFirst => 'You\'ll be asked to confirm with Google first.';

  @override
  String acctCheckEmail(String email) {
    return 'Check $email for a link to confirm the change.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'password sign-in';

  @override
  String acctRemoveTitle(String provider) {
    return 'Remove $provider?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'You\'ll no longer be able to sign in with $provider on this account.';
  }

  @override
  String get acctRemove => 'Remove';

  @override
  String acctRemoved(String provider) {
    return '$provider removed.';
  }

  @override
  String get acctSignedIn => 'Signed in';

  @override
  String get acctEmailNotVerified => 'Email not verified yet.';

  @override
  String get acctVerificationSent => 'Verification email sent.';

  @override
  String get acctResend => 'Resend';

  @override
  String get acctSectionSignIn => 'SIGN-IN & SECURITY';

  @override
  String get acctRowChangeUsername => 'Change Username';

  @override
  String get acctRowChangeEmail => 'Change Email';

  @override
  String get acctRowSetPassword => 'Set a Password';

  @override
  String get acctRowChangePassword => 'Change Password';

  @override
  String get acctRowUnlinkGoogle => 'Unlink Google';

  @override
  String get acctRowRemovePassword => 'Remove Password';

  @override
  String get acctRowAppLock => 'App Lock (PIN)';

  @override
  String get acctRowBiometric => 'Use fingerprint/face';

  @override
  String get acctSignOutTitle => 'Sign out?';

  @override
  String get acctSignOutBody => 'You will need to sign in again to use the app.';

  @override
  String get acctSignOut => 'Sign Out';

  @override
  String get acctDeleteAccount => 'Delete Account';

  @override
  String get acctDeleting => 'Deleting...';

  @override
  String get acctDeleteTitle => 'Delete account?';

  @override
  String get acctDeleteBody => 'This permanently deletes your sign-in credentials. You will need to sign up again to use the app. This cannot be undone.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Could not delete account: $error';
  }

  @override
  String get itmNotFoundTitle => 'Item not found';

  @override
  String itmNotFoundBody(String barcode) {
    return 'No item has barcode $barcode. Add it as a new item now?';
  }

  @override
  String get itmAddItem => 'Add Item';

  @override
  String get itmEditItem => 'Edit Item';

  @override
  String get itmMergeTitle => 'Merge Duplicate Items';

  @override
  String get itmMergeBody => 'Items with the same name will be merged into the oldest entry, combining their stock quantities. This cannot be undone.';

  @override
  String get itmMerge => 'Merge';

  @override
  String get itmNoDuplicates => 'No duplicate items found.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Merged $count duplicate items.',
      one: 'Merged 1 duplicate item.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Delete Item';

  @override
  String get itmCannotUndo => 'This cannot be undone.';

  @override
  String get itmDeleteOffline => 'Could not delete — check your connection and try again.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count Items',
      one: 'Delete 1 Item',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count items? This cannot be undone.',
      one: 'Delete 1 item? This cannot be undone.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Could not upload photo ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Could not upload photo: $error';
  }

  @override
  String get itmNoBarcodes => 'No items have a barcode yet.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Print $count Labels',
      one: 'Print 1 Label',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Search items or category...';

  @override
  String get itmStopListening => 'Stop listening';

  @override
  String get itmVoiceSearch => 'Voice search';

  @override
  String get itmSort => 'Sort';

  @override
  String get itmSortName => 'Name (A-Z)';

  @override
  String get itmSortStockLow => 'Stock: low to high';

  @override
  String get itmSortRecent => 'Recently added';

  @override
  String get itmFilterAll => 'All';

  @override
  String get itmFilterLowStock => 'Low Stock';

  @override
  String get itmNoItemsYet => 'No items yet. Tap + to add one.';

  @override
  String get itmNoItemsMatch => 'No items match your search.';

  @override
  String get itmNoPriceChanges => 'No price changes recorded yet.';

  @override
  String get itmNoStockCorrections => 'No stock corrections recorded yet.';

  @override
  String get itmResetHistory => 'Reset history';

  @override
  String get itmResetHistoryMsg => 'Reset the history for this item? This can\'t be undone.';

  @override
  String get itmSendPdf => 'Send as PDF';

  @override
  String get itmNoteOptional => 'Note (optional)';

  @override
  String get itmNoteHint => 'Add a note for this change';

  @override
  String get itmRemoveEntry => 'Remove entry';

  @override
  String get itmRemoveEntryMsg => 'Remove this entry from the history? This can\'t be undone.';

  @override
  String get itmEditEntry => 'Edit entry';

  @override
  String get itmPrevQty => 'Previous';

  @override
  String get itmNewQty => 'New';

  @override
  String itmCost(String amount) {
    return 'Cost: $amount';
  }

  @override
  String get itmMore => 'More';

  @override
  String get itmMenuPrintLabel => 'Print label';

  @override
  String get itmMenuDuplicate => 'Duplicate';

  @override
  String get itmMenuPriceHistory => 'Price history';

  @override
  String get itmMenuStockHistory => 'Stock adjustment history';

  @override
  String itmLowStockBadge(int count) {
    return '$count low stock';
  }

  @override
  String itmStockLine(String qty) {
    return 'Stock: $qty';
  }

  @override
  String get itmOfflineSaved => 'Offline — item saved on this device, will sync automatically when back online';

  @override
  String get itmItemName => 'Item Name';

  @override
  String get itmNameRequired => 'Name is required';

  @override
  String get itmPricePkr => 'Price (PKR)';

  @override
  String get itmPriceRequired => 'Price is required';

  @override
  String get itmValidNumber => 'Enter a valid number';

  @override
  String get itmUnit => 'Unit';

  @override
  String get itmCategoryHint => 'Category (optional, e.g. Plumbing)';

  @override
  String get itmPreferredSupplier => 'Preferred Supplier (optional)';

  @override
  String get itmPreferredSupplierHelper => 'Used by the one-tap Reorder action';

  @override
  String get itmClear => 'Clear';

  @override
  String get itmHsn => 'HSN Code (optional)';

  @override
  String get itmGstRate => 'GST Rate % (optional)';

  @override
  String get itmBarcodeOptional => 'Barcode (optional)';

  @override
  String get itmScanOrType => 'Scan or type';

  @override
  String get itmScanBarcode => 'Scan barcode';

  @override
  String get itmPurchaseCost => 'Purchase Cost (per unit)';

  @override
  String get itmPurchaseCostHint => 'What you pay when buying stock';

  @override
  String get itmWholesale => 'Wholesale Price (optional)';

  @override
  String get itmContractor => 'Contractor Price (optional)';

  @override
  String get itmFallsBack => 'Falls back to normal price';

  @override
  String get itmStockQty => 'Stock Quantity';

  @override
  String get itmLowStockAlert => 'Low Stock Alert Below';

  @override
  String get itmFrequently => 'Frequently bought with';

  @override
  String get itmSaveChanges => 'Save Changes';

  @override
  String get itmSaveItem => 'Save Item';

  @override
  String get itmPhotoSemantics => 'Item photo, tap to change';

  @override
  String get cdUpdateStatusTitle => 'Update Payment Status';

  @override
  String get cdMarkPaidQ => 'Mark this bill as paid?';

  @override
  String get cdMarkUnpaidQ => 'Mark this bill as unpaid?';

  @override
  String get cdConfirm => 'Confirm';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Could not update: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Offline — change saved on this device, will sync automatically when back online';

  @override
  String get cdConvertTitle => 'Convert to Bill';

  @override
  String get cdConvertBody => 'This will deduct stock for these items and turn the quotation into a real bill. Continue?';

  @override
  String get cdConvert => 'Convert';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Could not convert: $detail';
  }

  @override
  String get cdReturnItems => 'Return Items';

  @override
  String get cdReturnHint => 'Set how many of each item to return. Leave at 0 to keep it sold.';

  @override
  String get cdDecreaseQty => 'Decrease quantity';

  @override
  String get cdIncreaseQty => 'Increase quantity';

  @override
  String get cdCreditTotal => 'Credit total';

  @override
  String get cdReturnSelected => 'Return Selected';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Could not return: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Could not void: $detail';
  }

  @override
  String get cdNoPreviousBill => 'No previous bill to repeat';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Could not load last bill: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Invoice emailed to the customer.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Could not email invoice: $detail';
  }

  @override
  String get cdStatementEmailed => 'Statement emailed to the customer.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Could not email statement: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Delete Bill';

  @override
  String get cdBillVoided => 'VOIDED';

  @override
  String get cdBillReturn => 'RETURN';

  @override
  String get cdBillQuote => 'QUOTE';

  @override
  String get cdBillPaid => 'PAID';

  @override
  String get cdBillPartial => 'PARTIAL';

  @override
  String get cdBillUnpaid => 'UNPAID';

  @override
  String get cdBill => 'Bill';

  @override
  String cdVoidedReason(String reason) {
    return 'Voided: $reason';
  }

  @override
  String get cdViewInvoice => 'View Invoice';

  @override
  String get cdEmailInvoice => 'Email Invoice';

  @override
  String get cdEditBill => 'Edit Bill';

  @override
  String get cdReturnBill => 'Return Bill';

  @override
  String get cdVoidBill => 'Void Bill';

  @override
  String get cdNoItems => 'No items';

  @override
  String get cdRepeatLast => 'Repeat Last Bill';

  @override
  String get cdLedgerPdf => 'Ledger PDF';

  @override
  String get cdEmailStatement => 'Email Statement';

  @override
  String get cdCollectPayment => 'Collect Payment';

  @override
  String get cdSendReminder => 'Send WhatsApp Reminder';

  @override
  String get cdTotalBilled => 'Total Billed';

  @override
  String get cdPaid => 'Paid';

  @override
  String get cdNoBills => 'No bills yet';

  @override
  String get cdBillActions => 'Bill actions';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding of $limit credit limit used';
  }

  @override
  String get cdVoidBody => 'This removes it from balances and reports, but keeps it in the history. Stock will be restored. This cannot be undone.';

  @override
  String get cdReason => 'Reason (optional)';

  @override
  String get frmOfflineCustomer => 'Offline — customer saved on this device, will sync automatically when back online';

  @override
  String get frmOfflineSupplier => 'Offline — supplier saved on this device, will sync automatically when back online';

  @override
  String get frmEditCustomer => 'Edit Customer';

  @override
  String get frmCustomerName => 'Customer Name';

  @override
  String get frmPhoneOptional => 'Phone (optional)';

  @override
  String get frmCreditLimit => 'Credit Limit (PKR, optional)';

  @override
  String get frmCreditHelper => 'Warn when this customer\'s balance exceeds this';

  @override
  String get frmPriceTier => 'Price Tier';

  @override
  String get frmRetail => 'Retail';

  @override
  String get frmWholesale => 'Wholesale';

  @override
  String get frmContractor => 'Contractor';

  @override
  String get frmPriceTierHelper => 'Which item price Add Bill pre-fills for this customer';

  @override
  String get frmStrn => 'STRN (optional)';

  @override
  String get frmStrnCustomer => '13-digit Sales Tax Registration Number for invoices';

  @override
  String get frmStrnSupplier => '13-digit Sales Tax Registration Number for purchase bills';

  @override
  String get frmAddress => 'Address (optional)';

  @override
  String get frmEmail => 'Email (optional)';

  @override
  String get frmEmailHelper => 'Lets you email an invoice or statement to this customer';

  @override
  String get frmSaveCustomer => 'Save Customer';

  @override
  String get frmEditSupplier => 'Edit Supplier';

  @override
  String get frmSupplierName => 'Supplier Name';

  @override
  String get frmSaveSupplier => 'Save Supplier';

  @override
  String get sdDeletePurchaseTitle => 'Delete Purchase';

  @override
  String get sdDeletePurchaseBody => 'Stock for this purchase will be restored. This cannot be undone.';

  @override
  String get sdReturnToSupplier => 'Return to Supplier';

  @override
  String get sdReturnHint => 'Set how many of each item to send back. Leave at 0 to keep it.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Could not mark as received: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Mark this purchase as paid?';

  @override
  String get sdMarkUnpaidQ => 'Mark this purchase as unpaid?';

  @override
  String get sdTotalPurchased => 'Total Purchased';

  @override
  String get sdPayable => 'Payable';

  @override
  String sdPayableAmount(String amount) {
    return '$amount payable';
  }

  @override
  String get sdNoPurchases => 'No purchases yet';

  @override
  String get sdPo => 'PO';

  @override
  String get sdDraftPo => 'DRAFT PO';

  @override
  String get sdPurchase => 'Purchase';

  @override
  String get sdDraftNote => 'Draft purchase order — not yet received, no stock or cost update yet.';

  @override
  String get sdReturnNote => 'Return / credit note to the supplier.';

  @override
  String get sdMarkReceived => 'Mark as Received';

  @override
  String get sdEditPurchase => 'Edit Purchase';

  @override
  String get sdPurchaseActions => 'Purchase actions';

  @override
  String get slDeleteSupplier => 'Delete Supplier';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count Suppliers',
      one: 'Delete 1 Supplier',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count suppliers and all their purchases? This cannot be undone.',
      one: 'Delete 1 supplier and all their purchases? This cannot be undone.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV needs a header row plus at least one supplier.';

  @override
  String get slImportTitle => 'Import Suppliers';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Found $count suppliers in \"$file\". Import them all?',
      one: 'Found 1 supplier in \"$file\". Import them all?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imported $count suppliers.',
      one: 'Imported 1 supplier.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'No suppliers yet. Tap + to add one.';

  @override
  String get slSearchHint => 'Search suppliers or phone...';

  @override
  String get slNoMatch => 'No suppliers match your search.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count suppliers',
      one: '1 supplier',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Supplier Dues';

  @override
  String get sduNothingOwed => 'Nothing owed to suppliers 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count suppliers owed',
      one: '1 supplier owed',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days since oldest unpaid purchase',
      one: '1 day since oldest unpaid purchase',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 days';

  @override
  String get duBucket1 => '30–60 days';

  @override
  String get duBucket2 => '60+ days';

  @override
  String get duTitle => 'Dues Center';

  @override
  String get duNoDues => 'No outstanding dues 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count customers with dues',
      one: '1 customer with dues',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days since oldest unpaid bill',
      one: '1 day since oldest unpaid bill',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount outstanding';
  }

  @override
  String get cpNoOutstanding => 'No outstanding balance for this customer';

  @override
  String get cpValidAmount => 'Enter a valid amount';

  @override
  String cpExceeds(String amount) {
    return 'Amount exceeds the outstanding balance of $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'Collected $amount from $name';
  }

  @override
  String get cpOfflineSaved => 'Offline — payment saved on this device, will sync automatically when back online';

  @override
  String cpOwes(String amount, String name) {
    return '$name owes $amount. Applied to their oldest unpaid bill(s) first.';
  }

  @override
  String get cpAmountLabel => 'Amount Collected (PKR)';

  @override
  String get cpCollect => 'Collect';

  @override
  String get usNoItems => 'No items to update.';

  @override
  String get usHelp => 'Set the new stock for each item, then tap Save All.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  current: $qty';
  }

  @override
  String usNew(String qty) {
    return 'new: $qty';
  }

  @override
  String get usSubtract => 'Subtract 1';

  @override
  String get usAdd => 'Add 1';

  @override
  String get usNoChanges => 'No changes';

  @override
  String usSaveAll(int count) {
    return 'Save All ($count changed)';
  }

  @override
  String get srHint => 'Search customers, items, amounts...';

  @override
  String get srFailed => 'Search failed — check your connection.';

  @override
  String get srTitle => 'Search your shop';

  @override
  String get srSubtitle => 'Find customers by name or phone, bills by amount.';

  @override
  String srNoMatches(String query) {
    return 'No matches for \"$query\"';
  }

  @override
  String get srTryDifferent => 'Try a different name, phone number, or amount.';

  @override
  String get srBills => 'Bills';

  @override
  String get srNoItemList => 'No item list';

  @override
  String get abAddAtLeastOne => 'Add at least one item';

  @override
  String get abQuotationUpdated => 'Quotation Updated!';

  @override
  String get abBillUpdated => 'Bill Updated!';

  @override
  String get abQuotationSaved => 'Quotation Saved!';

  @override
  String get abBillCreated => 'Bill Created Successfully!';

  @override
  String abTotalAmount(String amount) {
    return 'Total: $amount';
  }

  @override
  String get abShare => 'Share';

  @override
  String get abDoneReturn => 'Done & Return';

  @override
  String get abOverLimitBody => 'This would put the customer over their credit limit.';

  @override
  String get abOverLimitTitle => 'Over credit limit';

  @override
  String get abBillAnyway => 'Bill anyway';

  @override
  String get abOfflineBill => 'Offline — bill saved on this device, will sync automatically when back online';

  @override
  String get abEditQuotation => 'Edit Quotation';

  @override
  String get abEditBill => 'Edit Bill';

  @override
  String get abNewQuotation => 'New Quotation';

  @override
  String get abAddBill => 'Add Bill';

  @override
  String get abCouldNotLoadItems => 'Could not load items.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'This bill would put the customer at $total, over their $limit credit limit.';
  }

  @override
  String get abTapAddItemBill => 'Tap \"Add Item\" below to start a bill';

  @override
  String get abNoCatalog => 'No items in catalog yet';

  @override
  String get abScan => 'Scan';

  @override
  String get abDiscountRs => 'Discount (Rs)';

  @override
  String get abSubtotal => 'Subtotal';

  @override
  String get abTotal => 'Total';

  @override
  String get abSaveAsQuotation => 'Save as Quotation';

  @override
  String get abQuotationLocked => 'An existing bill can\'t be turned back into a quotation';

  @override
  String get abQuotationNote => 'No stock deducted until converted to a bill';

  @override
  String get abPaymentStatus => 'Payment Status';

  @override
  String get abUnpaid => 'Unpaid';

  @override
  String get abPaymentMethod => 'Payment Method';

  @override
  String get abCash => 'Cash';

  @override
  String get abBankTransfer => 'Bank Transfer';

  @override
  String get abCheque => 'Cheque';

  @override
  String get abSaveQuotation => 'Save Quotation';

  @override
  String get abSaveBill => 'Save Bill';

  @override
  String abAdded(String name) {
    return 'Added $name';
  }

  @override
  String get apNewItem => 'New Item…';

  @override
  String get apNewItemHint => 'Add a new item to the catalog first';

  @override
  String get apOfflinePurchase => 'Offline — purchase saved on this device, will sync automatically when back online';

  @override
  String get apEditPo => 'Edit Purchase Order';

  @override
  String get apNewPo => 'New Purchase Order';

  @override
  String get apAddPurchase => 'Add Purchase';

  @override
  String get apTapAddItem => 'Tap \"Add Item\" below to start a purchase';

  @override
  String get apSaveAsPo => 'Save as Purchase Order';

  @override
  String get apPoLocked => 'An already-received purchase can\'t be turned back into a draft order';

  @override
  String get apPoNote => 'No stock or cost update until goods are marked received';

  @override
  String get apUnpaidCredit => 'Unpaid (Credit)';

  @override
  String get apSavePo => 'Save Purchase Order';

  @override
  String get apSavePurchase => 'Save Purchase';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Current cost: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'No cost set  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Scan failed: server error $code';
  }

  @override
  String get scOfflineSaved => 'Offline — photo saved, will read it automatically once back online';

  @override
  String get scStillOffline => 'Still offline';

  @override
  String get scCouldNotCreateCustomer => 'Could not create the customer — try again.';

  @override
  String get scCouldNotCreateSupplier => 'Could not create the supplier — try again.';

  @override
  String scBillSavedFor(String name) {
    return 'Bill saved for $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Purchase saved from $name';
  }

  @override
  String get scWhichCustomer => 'Which customer is this?';

  @override
  String get scWhichSupplier => 'Which supplier is this?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Closest match on file: $name ($score% similar)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Yes, this is $name';
  }

  @override
  String get scOtherwiseCustomer => 'Otherwise, create a new customer:';

  @override
  String get scOtherwiseSupplier => 'Otherwise, create a new supplier:';

  @override
  String get scNoMatchCustomer => 'No matching customer found. Create a new one:';

  @override
  String get scNoMatchSupplier => 'No matching supplier found. Create a new one:';

  @override
  String get scCustomerName => 'Customer name';

  @override
  String get scSupplierName => 'Supplier name';

  @override
  String get scCreateNew => 'Create New';

  @override
  String get scTitleBill => 'Scan Bill';

  @override
  String get scIntroBill => 'Snap a photo of the bill. Handwritten is fine, and Sindhi, Urdu or English all work. You\'ll get to check it before it\'s saved.';

  @override
  String get scIntroPurchase => 'Snap a photo of the supplier\'s invoice. Sindhi, Urdu or English all work. You\'ll get to check it before it\'s saved.';

  @override
  String get scReadingBill => 'Reading bill…';

  @override
  String get scScanBill => 'Scan a Bill';

  @override
  String get scReadingInvoice => 'Reading invoice…';

  @override
  String get scScanInvoice => 'Scan an Invoice';

  @override
  String get scQueued => 'Queued Scans';

  @override
  String get scReady => 'Ready to review';

  @override
  String get scFailed => 'Failed';

  @override
  String get scWaiting => 'Waiting for connection';

  @override
  String get scRetry => 'Retry';

  @override
  String rpCouldNotLoad(String error) {
    return 'Could not load reports: $error';
  }

  @override
  String get rpHeadline => 'This month\'s headline numbers';

  @override
  String get rpProfitThisMonth => 'Profit This Month';

  @override
  String get rpNoData => 'No data yet';

  @override
  String get rpSalesTax => 'Sales Tax';

  @override
  String rpSalesTaxFor(String month) {
    return 'Sales tax report for $month';
  }

  @override
  String get rpViewSalesTax => 'View Sales Tax Report';

  @override
  String get rpQuickReports => 'Quick Reports';

  @override
  String get rpQuickSub => 'Jump straight to a specific report';

  @override
  String get expensesTitle => 'Expenses';

  @override
  String get rpRateCard => 'Rate Card';

  @override
  String get rpDetails => 'Details';

  @override
  String get rpDetailsSub => 'Full breakdowns and rankings';

  @override
  String get rpOutstandingByCustomer => 'Outstanding by Customer';

  @override
  String get rpNoOutstanding => 'No outstanding balances';

  @override
  String get rpMonthlyTotals => 'Monthly Totals';

  @override
  String get rpMostSold => 'Most Sold Items';

  @override
  String get rpNoItemsRecorded => 'No items recorded yet';

  @override
  String get rpTopCustomers => 'Top Customers by Revenue';

  @override
  String get rpNoSalesRecorded => 'No sales recorded yet';

  @override
  String get rpTotalOutstanding => 'Total Outstanding';

  @override
  String get rpViewCustomers => 'View customers';

  @override
  String get lblInvoice => 'invoice';

  @override
  String get lblLedger => 'ledger';

  @override
  String get lblRateCard => 'rate card';

  @override
  String get exCsvNeedsRows => 'CSV needs a header row plus at least one expense.';

  @override
  String get exCsvHeader => 'CSV header must include \"description\" and \"amount\" columns.';

  @override
  String exLineBadAmount(int line) {
    return 'Line $line: missing description or invalid amount — fix the file and retry.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Line $line: invalid date \"$date\" — use YYYY-MM-DD.';
  }

  @override
  String get exImportTitle => 'Import Expenses';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Found $count expenses in \"$file\". Import them all?',
      one: 'Found 1 expense in \"$file\". Import them all?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imported $count expenses.',
      one: 'Imported 1 expense.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Import failed: server error $code';
  }

  @override
  String get exDeleteTitle => 'Delete Expense';

  @override
  String get exAdd => 'Add Expense';

  @override
  String get exEdit => 'Edit Expense';

  @override
  String get exDescription => 'Description';

  @override
  String get exAmountRs => 'Amount (Rs)';

  @override
  String get exCategory => 'Category';

  @override
  String exDate(String date) {
    return 'Date: $date';
  }

  @override
  String get exRepeats => 'Repeats monthly';

  @override
  String get exRepeatsHint => 'Rent, electricity, wages, etc.';

  @override
  String get exReceiptTap => 'Receipt photo, tap to change';

  @override
  String get exReceiptOptional => 'Receipt photo (optional)';

  @override
  String get exEnterValid => 'Enter a description and a valid amount.';

  @override
  String get exOffline => 'Offline — expense saved on this device, will sync automatically when back online';

  @override
  String get exSave => 'Save Expense';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count recurring expenses due this month',
      one: '1 recurring expense due this month',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Add';

  @override
  String get exTotal => 'Total Expenses';

  @override
  String exCategoryChip(String name) {
    return 'Category: $name';
  }

  @override
  String get exNoneLogged => 'No expenses logged yet';

  @override
  String exNoneInCategory(String name) {
    return 'No $name expenses yet';
  }

  @override
  String get exViewReceipt => 'View receipt';

  @override
  String get exEditRow => 'Edit expense';

  @override
  String get exDeleteRow => 'Delete expense';

  @override
  String gstServerReturned(String first, String second) {
    return 'Server returned $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'Could not load GST data: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Failed to download ($code)';
  }

  @override
  String gstSaved(String filename) {
    return 'Saved $filename';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Saved to Downloads/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Could not download: $error';
  }

  @override
  String get gstTitle => 'Sales Tax Report';

  @override
  String get gstOutwardDetail => 'Outward Sales — Invoice Detail';

  @override
  String get gstNoBills => 'No bills for this month.';

  @override
  String get gstHsn => 'HSN Summary';

  @override
  String get gstInvoiceWise => 'Invoice-wise details';

  @override
  String get gstMonthly => 'Monthly Summary';

  @override
  String get gstOutwardTaxable => 'Outward taxable supplies';

  @override
  String get gstItc => 'Input Tax Credit (from purchases)';

  @override
  String get gstSave => 'Save';

  @override
  String get rcValidAmount => 'Enter a valid amount.';

  @override
  String get rcExpected => 'Expected Cash (today\'s cash sales)';

  @override
  String get rcAlsoCollected => 'Also collected today (not counted in the drawer)';

  @override
  String get rcCounted => 'Cash Counted in Drawer (Rs)';

  @override
  String get rcCompare => 'Compare';

  @override
  String get rcMatches => 'Matches exactly!';

  @override
  String rcExtra(String amount) {
    return '$amount extra in drawer';
  }

  @override
  String rcMissing(String amount) {
    return '$amount missing from drawer';
  }

  @override
  String get pbiTitle => 'Profit by Item';

  @override
  String get pbiNoSales => 'No sales yet';

  @override
  String get pbiByCategory => 'By Category';

  @override
  String get pbiItemsByProfit => 'Items by Profit';

  @override
  String get svTitle => 'Stock Valuation';

  @override
  String get svNone => 'No stock on hand';

  @override
  String get svItemsByValue => 'Items by Value';

  @override
  String svSummary(String items, String units) {
    return '$items items · $units units on the shelf';
  }

  @override
  String svTied(String amount) {
    return '$amount tied up in stock';
  }

  @override
  String get svEstimated => 'est. from sale price';

  @override
  String get bkRestoreTitle => 'Restore Backup?';

  @override
  String bkRestoreBody(String filename) {
    return 'This will replace ALL current data with the backup file \"$filename\". Continue?';
  }

  @override
  String get bkRestore => 'Restore';

  @override
  String get bkRestoreDoneTitle => 'Restore Complete';

  @override
  String get bkRestoreDoneBody => 'Your data has been restored.';

  @override
  String get bkOk => 'OK';

  @override
  String bkRestoreFailed(String detail) {
    return 'Restore failed: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Could not restore: $error';
  }

  @override
  String get bkSaveToDownloads => 'Save to Downloads';

  @override
  String get bkIntroAdmin => 'All your data lives in one database file. Download a copy regularly, and restore it if anything ever goes wrong.';

  @override
  String get bkIntroStaff => 'Full database backup and restore are admin-only. Ask an admin, or export what you need as CSV below.';

  @override
  String get bkBackupDb => 'Backup Database';

  @override
  String get bkBackupDbSub => 'Download the whole database as one file and share it (WhatsApp, Drive, email).';

  @override
  String get bkDownloadPhone => 'Download Backup to Phone';

  @override
  String get bkShareBackup => 'Share Backup';

  @override
  String get bkAutoTitle => 'Automatic Backups';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count daily backups stored on the server, most recent from $time. Runs on its own — nothing to do here.',
      one: '1 daily backup stored on the server, most recent from $time. Runs on its own — nothing to do here.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Pick a saved backup file to replace the current data.';

  @override
  String get bkRestoreFromFile => 'Restore from Backup File';

  @override
  String get bkExportCsv => 'Export to CSV';

  @override
  String get bkExportSub => 'Open these in Excel or share them.';

  @override
  String get bkRangeAll => 'Bills/Expenses: all time';

  @override
  String bkRangeSome(String end, String start) {
    return 'Bills/Expenses: $start to $end';
  }

  @override
  String get bkSetRange => 'Set Range';

  @override
  String get bkClearRange => 'Clear range';

  @override
  String get ntNever => 'Never triggered';

  @override
  String get ntJustNow => 'Just now';

  @override
  String ntMinutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String ntHoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String ntDaysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get ntTitle => 'Smart Notifications';

  @override
  String get ntTapHint => 'Tap \"Check Now\" to trigger a notification and see live results.';

  @override
  String get ntLowStockSub => 'Notify when items fall below their reorder level.';

  @override
  String get ntCheckNow => 'Check Now';

  @override
  String get ntOverdue => 'Overdue Payment Reminders';

  @override
  String get ntOverdueSub => 'Notify about unpaid bills from previous days.';

  @override
  String get ntDaily => 'Daily Business Summary';

  @override
  String get ntDailySub => 'Yesterday\'s sales, collections, and profit at a glance.';

  @override
  String get ntSendSummary => 'Send Summary';

  @override
  String get ntRunning => 'Running…';

  @override
  String get ntLowStockItems => 'Low Stock Items';

  @override
  String get ntSales => 'Sales';

  @override
  String get ntCollected => 'Collected';

  @override
  String get ntProfit => 'Profit';

  @override
  String get auChecking => 'Checking for updates…';

  @override
  String get auLatest => 'You have the latest version.';

  @override
  String get auAvailable => 'Update available';

  @override
  String auNewer(int code) {
    return 'A newer version of Book-Keep (build $code) is ready.';
  }

  @override
  String get auLater => 'Later';

  @override
  String get auUpdate => 'Update';

  @override
  String get auDownloading => 'Downloading update';

  @override
  String auSaved(String name) {
    return 'Saved $name to your Downloads folder.';
  }

  @override
  String get auAllowInstall => 'Allow Book-Keep to install apps, then tap Update again.';

  @override
  String get auFailed => 'Could not update — check your connection and try again.';

  @override
  String get lgSearch => 'Search languages';

  @override
  String lgNoMatch(String query) {
    return 'No languages match \"$query\"';
  }

  @override
  String get alVoided => 'Voided a bill';

  @override
  String get alDeletedBill => 'Deleted a bill';

  @override
  String get alReturned => 'Returned a bill';

  @override
  String get alDeletedCustomer => 'Deleted a customer';

  @override
  String get alDeletedSupplier => 'Deleted a supplier';

  @override
  String get alCreatedAccount => 'Created an account';

  @override
  String get alUpdatedAccount => 'Updated an account';

  @override
  String get alDeletedAccount => 'Deleted an account';

  @override
  String get alTitle => 'Activity Log';

  @override
  String get alNone => 'No activity recorded yet';

  @override
  String get blkEnterOne => 'Enter at least one item';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items added successfully',
      one: '1 item added successfully',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Bulk Add Items';

  @override
  String get blkFormat => 'One item per line, format: Name, Price, Unit, Category';

  @override
  String get blkOptional => 'Unit and category are optional (defaults: piece, none)';

  @override
  String get blkAddAll => 'Add All Items';

  @override
  String get prSend => 'Send Payment Reminder';

  @override
  String get prTone => 'Select Tone:';

  @override
  String get prPolite => 'Polite';

  @override
  String get prStandard => 'Standard';

  @override
  String get prUrgent => 'Urgent';

  @override
  String get prPreviewQr => 'Preview JazzCash Payment QR';

  @override
  String get prShareText => 'Share Text';

  @override
  String get dsRemaining => 'Remaining';

  @override
  String dsIncludesDiscount(String amount) {
    return 'includes $amount discount';
  }

  @override
  String get dsItems => 'Items';

  @override
  String get dsDiscount => 'Discount';

  @override
  String get lkWrongPin => 'Wrong PIN';

  @override
  String get lkEnterPin => 'Enter PIN';

  @override
  String get lkChecking => 'Checking fingerprint...';

  @override
  String get bcTitle => 'Scan Barcode';

  @override
  String get bcTorchNa => 'Torch is not available on this device';

  @override
  String get bcTorch => 'Torch';

  @override
  String get bcPoint => 'Point the camera at a barcode';

  @override
  String get qrNoNumber => 'No JazzCash number configured. Set it in Settings to show a payment QR code.';

  @override
  String get qrPay => 'Pay via JazzCash';

  @override
  String get qrInvalid => 'Invalid QR Data';

  @override
  String qrAmount(String amount) {
    return 'Amount: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'Copy JazzCash number';

  @override
  String get qrCopied => 'JazzCash number copied to clipboard';

  @override
  String get qrHint => 'Scan or copy this number in your JazzCash app to pay.';

  @override
  String clOwed(String amount) {
    return '$amount owed';
  }

  @override
  String get lnEnterEmailFirst => 'Enter a valid email above first.';

  @override
  String get lnResetSent => 'Password-reset email sent — check your inbox.';

  @override
  String get lnNoAccount => 'No account found for that email.';

  @override
  String get lnWrongPassword => 'Incorrect password.';

  @override
  String get lnInvalidEmail => 'That doesn\'t look like a valid email address.';

  @override
  String get lnDisabled => 'This account has been disabled.';

  @override
  String get lnTooMany => 'Too many attempts — try again in a minute.';

  @override
  String get lnNoInternet => 'No internet connection.';

  @override
  String get lnWeakPassword => 'Password must be at least 6 characters.';

  @override
  String get lnCouldNotSignIn => 'Could not sign in. Please try again.';

  @override
  String get lnWrongPasswordHint => 'Incorrect password. Try again or tap \"Forgot password?\".';

  @override
  String get lnWrongEmail => 'Incorrect email — no account uses that address.';

  @override
  String get lnWrongEmailOrPassword => 'Incorrect email or password.';

  @override
  String get lnWrongUsername => 'Incorrect username — no account uses that name.';

  @override
  String get lnWelcome => 'Welcome back';

  @override
  String lnSignInTo(String app) {
    return 'Sign in to $app';
  }

  @override
  String get lnEmailOrUsername => 'Email or Username';

  @override
  String get lnRemember => 'Remember me';

  @override
  String get lnForgot => 'Forgot password?';

  @override
  String get lnSignIn => 'Sign In';

  @override
  String get lnGoogle => 'Continue with Google';

  @override
  String get lnNew => 'New here?';

  @override
  String get lnCreate => 'Create account';

  @override
  String suCreated(String email) {
    return 'Account created for $email. A verification email was sent (optional).';
  }

  @override
  String suSetup(String app) {
    return 'Set up $app';
  }

  @override
  String get suName => 'Name';

  @override
  String get suEmail => 'Email';

  @override
  String suPhoneDigits(int digits) {
    return 'Enter a valid $digits-digit number';
  }

  @override
  String get suCreateBtn => 'Create Account';

  @override
  String get suHaveAccount => 'Already have an account?';

  @override
  String get suAlreadyExists => 'An account already exists for that email.';

  @override
  String get suInvalidEmail => 'Invalid email address.';

  @override
  String get agShow => 'Show password';

  @override
  String get agHide => 'Hide password';

  @override
  String get adAccounts => 'Accounts';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registered accounts',
      one: '1 registered account',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Add';

  @override
  String get adNoAccounts => 'No accounts found.';

  @override
  String get adAccountability => 'Accountability';

  @override
  String get adAccountabilitySub => 'Who voided, deleted, or returned something, and account changes.';

  @override
  String get adActivitySub => 'Voided bills, deletions, account changes';

  @override
  String get adServer => 'Server';

  @override
  String get adServerSub => 'Where this app talks to. Rarely needs changing after setup.';

  @override
  String get adServerHint => 'Emulator uses 10.0.2.2; a real phone needs the laptop’s IP on the same Wi-Fi. Changing it affects every account.';

  @override
  String get adApiBase => 'API Base URL';

  @override
  String get adSaveServer => 'Save Server Address';

  @override
  String get adEmailSetSub => 'Set up — staff can email invoices/statements to customers.';

  @override
  String get adNotSetUp => 'Not set up yet.';

  @override
  String get adEmailSetBody => 'Email is set up. Lets staff email an invoice or statement straight to a customer.';

  @override
  String get adEmailHelp => 'A Gmail address works with an app password (smtp.gmail.com, port 587), or use your email provider\'s SMTP details.';

  @override
  String get adSmtpHost => 'SMTP Host';

  @override
  String get adSmtpPort => 'SMTP Port';

  @override
  String get adEmailAddress => 'Email Address';

  @override
  String get adPwKeep => 'Password (leave blank to keep current)';

  @override
  String get adPwApp => 'Password (app password, not your login password)';

  @override
  String get adFromName => 'From Name (optional)';

  @override
  String get adFromHint => 'My Hardware Shop';

  @override
  String get adSaving => 'Saving...';

  @override
  String get adSaveEmail => 'Save Email Settings';

  @override
  String get adAddAccount => 'Add account';

  @override
  String get adNameOpt => 'Name (optional)';

  @override
  String get adAtLeast6 => 'At least 6 characters';

  @override
  String get adGrantAdmin => 'Grant admin';

  @override
  String get adCanManage => 'Can void/delete/return';

  @override
  String get adCanManageHint => 'Void or delete a bill, return a bill, or delete a customer/supplier. An admin always has this.';

  @override
  String get adCreate => 'Create';

  @override
  String get adAccountCreated => 'Account created.';

  @override
  String adCreateFailed(String error) {
    return 'Create failed: $error';
  }

  @override
  String get adEditAccount => 'Edit account';

  @override
  String get adAdminSwitch => 'Admin';

  @override
  String get adAdminHint => 'Can open the admin panel';

  @override
  String get adDisabled => 'Disabled';

  @override
  String get adDisabledHint => 'Blocked from signing in';

  @override
  String get adAccountUpdated => 'Account updated.';

  @override
  String adUpdateFailed(String error) {
    return 'Update failed: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label will be permanently removed and can no longer sign in.';
  }

  @override
  String get adAccountDeleted => 'Account deleted.';

  @override
  String adDeleteFailed(String error) {
    return 'Delete failed: $error';
  }

  @override
  String get adBadgeAdmin => 'ADMIN';

  @override
  String get adBadgeDisabled => 'DISABLED';

  @override
  String get adOff => 'Admin panel is off';

  @override
  String get adCheckAgain => 'Check again';

  @override
  String get adAccessRequired => 'Admin access required';

  @override
  String get adAccessBody => 'Only shop admins can manage accounts. Ask the shop owner to grant you admin access.';

  @override
  String get adCouldNotLoad => 'Could not load the admin panel.';

  @override
  String get adBadPort => 'Enter a valid SMTP port number.';

  @override
  String get adEmailSaved => 'Email settings saved.';

  @override
  String adEmailSaveFailed(String error) {
    return 'Could not save email settings: $error';
  }

  @override
  String get adServerEmpty => 'Server address cannot be empty.';

  @override
  String get adServerSaved => 'Server address saved. Screens will use it on next load.';

  @override
  String get lnOr => 'or';

  @override
  String get scNotABill => 'That doesn\'t look like a bill. Try again with a clear photo of the bill.';

  @override
  String get scNotAnInvoice => 'That doesn\'t look like an invoice. Try again with a clear photo of the supplier\'s invoice.';

  @override
  String get jqOpenFull => 'Full size';

  @override
  String get jqCopy => 'Copy number';

  @override
  String get jqSheetTitle => 'JazzCash QR';

  @override
  String get jqSheetHint => 'Customers scan this in their JazzCash app to pay you.';

  @override
  String get jqCheck => 'Check the number';

  @override
  String get askVoice => 'Voice';

  @override
  String get askVoiceFallbackNote => 'Reading this with your phone\'s voice.';

  @override
  String get askPace => 'Pace';

  @override
  String get askTone => 'Tone';

  @override
  String get askPaceSlower => 'Slower';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Faster';

  @override
  String get askToneCalm => 'Calm';

  @override
  String get askToneWarm => 'Warm';

  @override
  String get askToneCheerful => 'Cheerful';

  @override
  String qPaymentUpdate(String amount) {
    return 'Payment update: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Customer: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Supplier: $name';
  }

  @override
  String qItem(String name) {
    return 'Item: $name';
  }

  @override
  String qExpense(String name) {
    return 'Expense: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Purchase: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Payment collected: $amount from $name';
  }

  @override
  String gstAmount(String amount) {
    return 'GST $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Taxable $taxable  ·  GST $tax  ·  Total $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Revenue: $revenue  •  COGS: $cogs  •  Expenses: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Hello $customer, gentle greeting from $shop! Your total balance due is $amount. Thank you!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Hello $customer, payment reminder from $shop for pending balance of $amount. Kindly pay at your earliest convenience.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'URGENT NOTICE: Dear $customer, your outstanding payment of $amount at $shop is pending. Please settle immediately.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Pay via JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Invoice from $shop\nTotal: $total\nItems: $items\nStatus: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Hello $supplier, this is $shop. We would like to place an order for:\n$lines\n\nPlease confirm availability and price. Thank you.';
  }

  @override
  String ppUpdated(String date) {
    return 'Last updated: $date';
  }

  @override
  String get ppWhoH => 'Who this is';

  @override
  String ppWho(String owner, String email) {
    return '$owner, operating Book-keep.\nContact: $email';
  }

  @override
  String get ppCollectH => 'What we collect';

  @override
  String get ppCollectAccount => 'Account: email, phone number, and username, via Firebase Authentication.';

  @override
  String get ppCollectShop => 'Shop profile: shop name, address, phone number, JazzCash number, and shop logo image — entered by the shop owner in Settings.';

  @override
  String get ppCollectRecords => 'Business records you create: customer and supplier names and phone numbers, bills, purchases, item catalog entries (including item photos and barcodes), and expenses (including receipt photos). This is the app’s core data — it’s how bookkeeping works.';

  @override
  String get ppCollectDevice => 'Device and diagnostic data: a push-notification token (for low-stock, overdue-payment, and daily-summary alerts) and crash reports (device info and stack traces) via Firebase Crashlytics, sent automatically when the app crashes.';

  @override
  String ppCollectAi(String askShop) {
    return 'AI features: $askShop, the AI Morning Briefing, and the AI bill/purchase scanner send a snapshot of the relevant business data (report figures, or a photo of a bill) to Google’s Gemini API to generate an answer, summary, or extracted line items. This data is processed by Google to generate the response; it is not used by us or Google to train models outside of Google’s standard API terms.';
  }

  @override
  String get ppDontH => 'What we don’t do';

  @override
  String get ppDontLocation => 'We don’t track your location.';

  @override
  String get ppDontAds => 'We don’t use ad networks or behavioral analytics/session-replay tools.';

  @override
  String get ppDontSell => 'We don’t sell your data or your customers’ data to anyone.';

  @override
  String get ppWhereH => 'Where data lives';

  @override
  String get ppWhereDb => 'Database: Neon (Postgres), a third-party cloud database provider.';

  @override
  String get ppWhereFirebase => 'Authentication, push notifications, crash reports, photo storage: Firebase (Google).';

  @override
  String get ppWhereAi => 'AI processing: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Invoice emails: sent through the SMTP account the shop’s own admin configures in the $adminPanel — we don’t operate a mailing list, and these emails are one-to-one invoices/statements to your own existing customers, not bulk marketing.';
  }

  @override
  String get ppYoursH => 'Your data, your customers’ data';

  @override
  String get ppYours => 'Everything you enter — customers, suppliers, bills, items — belongs to your shop. Other shops using Book-keep cannot see it. Staff accounts you create for your shop can see what you grant them access to, nothing more.';

  @override
  String get ppControlsH => 'Your controls';

  @override
  String ppControlExport(String path) {
    return 'Export or back up your data: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Delete your account: $path. This removes your sign-in credential only — it does not erase your shop’s business records (bills, customers, items, etc.), the same way removing a staff member doesn’t delete records they created.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Notifications: can be turned off per type in $path.';
  }

  @override
  String get ppChildrenH => 'Children';

  @override
  String get ppChildren => 'Book-keep is a business tool for shop owners and staff. It is not directed at, or knowingly used by, children.';

  @override
  String get ppChangesH => 'Changes to this policy';

  @override
  String get ppChanges => 'If what we collect or where it goes changes, we’ll update this page and change the date at the top.';

  @override
  String get ppContactH => 'Contact';

  @override
  String ppContact(String email) {
    return 'Questions about this policy or your data: $email';
  }

  @override
  String get waHello => 'Hello!';

  @override
  String waHelloNamed(String name) {
    return 'Hi $name,';
  }

  @override
  String get gstTaxable => 'Taxable';

  @override
  String get gstTax => 'Tax';

  @override
  String get gstTaxableValue => 'Taxable value';

  @override
  String get gstTotalTax => 'Total tax';

  @override
  String get gstTotalItc => 'Total input tax credit';

  @override
  String get gstExempt => 'Exempt supplies';

  @override
  String get gstNetPayable => 'Net tax payable';

  @override
  String get unknownName => 'Unknown';

  @override
  String get unitPiece => 'piece';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'meter';

  @override
  String get unitBox => 'box';

  @override
  String get unitDozen => 'dozen';

  @override
  String get unitLiter => 'liter';

  @override
  String get unitBag => 'bag';

  @override
  String deleteSupplierMessage(String name) {
    return 'Delete $name and all their purchases? This cannot be undone.';
  }
}
