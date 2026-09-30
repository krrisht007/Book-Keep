// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get navHome => 'Start';

  @override
  String get navCustomers => 'Kunden';

  @override
  String get navItems => 'Artikel';

  @override
  String get navSuppliers => 'Lieferanten';

  @override
  String get navReports => 'Berichte';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get settingsShopDetailsTitle => 'Geschäftsdaten';

  @override
  String get settingsShopDetailsSubtitle => 'Wird auf Ihren Rechnungen angezeigt.';

  @override
  String get settingsShopNameLabel => 'Geschäftsname';

  @override
  String get settingsShopAddressLabel => 'Geschäftsadresse';

  @override
  String get settingsPhoneLabel => 'Telefon';

  @override
  String get settingsSaveShopDetails => 'Geschäftsdaten Speichern';

  @override
  String get settingsAppearanceTitle => 'Erscheinungsbild';

  @override
  String get settingsAppearanceSubtitle => 'Wählen Sie ein Design für die gesamte App.';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeSystem => 'System';

  @override
  String get settingsLanguageTitle => 'Sprache';

  @override
  String get settingsLanguageSubtitle => 'Wählen Sie die Anzeigesprache der App.';

  @override
  String get sortNameNewest => 'Sortieren: Name / Neueste';

  @override
  String get addCustomer => 'Kunde hinzufügen';

  @override
  String get importCsv => 'CSV importieren';

  @override
  String get searchShop => 'Im Laden suchen';

  @override
  String get scanToFindItem => 'Scannen, um Artikel zu finden';

  @override
  String get bulkAdd => 'Mehrere hinzufügen';

  @override
  String get updateStock => 'Bestand aktualisieren';

  @override
  String get printLabels => 'Etiketten drucken';

  @override
  String get mergeDuplicates => 'Duplikate zusammenführen';

  @override
  String get addSupplier => 'Lieferant hinzufügen';

  @override
  String get scanPurchaseInvoice => 'Einkaufsrechnung scannen';

  @override
  String askNoAnswer(String reason) {
    return 'Keine Antwort erhalten: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Verbindung fehlgeschlagen: $error';
  }

  @override
  String get micPermissionNeeded => 'Für die Spracheingabe wird die Mikrofonberechtigung benötigt.';

  @override
  String get speechUnavailable => 'Spracherkennung ist auf diesem Gerät nicht verfügbar.';

  @override
  String get askYourShop => 'Frag deinen Laden';

  @override
  String get close => 'Schließen';

  @override
  String get askIntro => 'Neugierig, wie es im Laden läuft? Fragen Sie mich, ich antworte anhand Ihrer Bücher.';

  @override
  String get askListening => 'Hört zu…';

  @override
  String get askThinkingWords => 'Denkt nach…|Wird bearbeitet…|Rechnet…|Prüft die Bücher…|Zählt zusammen…|Wertet Zahlen aus…';

  @override
  String get askSayQuestion => 'Sprich deine Frage — tippe zum Abbrechen auf die Kugel';

  @override
  String briefingRefreshFailed(int code) {
    return 'Zusammenfassung konnte nicht aktualisiert werden ($code).';
  }

  @override
  String get refreshFailedOffline => 'Aktualisierung fehlgeschlagen — prüfe deine Verbindung.';

  @override
  String get newBillFailed => 'Neue Rechnung konnte nicht gestartet werden — prüfe die Verbindung und versuche es erneut.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Lege zuerst einen bevorzugten Lieferanten für $name fest (zum Bearbeiten tippen).';
  }

  @override
  String get reorderBySupplier => 'Nach Lieferant nachbestellen';

  @override
  String get supplier => 'Lieferant';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Artikel',
      one: '1 Artikel',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Noch kein Artikel mit niedrigem Bestand hat einen bevorzugten Lieferanten.';

  @override
  String get thisSupplier => 'Dieser Lieferant';

  @override
  String supplierNoPhone(String name) {
    return '$name hat keine Telefonnummer.';
  }

  @override
  String get tabOverview => 'Übersicht';

  @override
  String get tabStock => 'Bestand';

  @override
  String get tabMoney => 'Geld';

  @override
  String get taglineOverview => 'Offene Beträge, Bestand und Kasse von heute auf einen Blick.';

  @override
  String get taglineStock => 'Was sich verkauft, was knapp wird.';

  @override
  String get taglineMoney => 'Ausgaben, Abgleich und Einzüge.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Dashboard wird geladen… $done von $total';
  }

  @override
  String get dashboardLoadFailed => 'Dashboard konnte nicht geladen werden';

  @override
  String get checkConnectionRetry => 'Prüfe deine Verbindung und versuche es erneut.';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get aiBriefing => 'KI-Zusammenfassung';

  @override
  String get briefingPrompt => 'Das Geschäft von gestern in wenigen Sätzen.';

  @override
  String get getBriefing => 'Zusammenfassung holen';

  @override
  String get refreshBriefing => 'Zusammenfassung aktualisieren';

  @override
  String updatedAt(String time) {
    return 'Aktualisiert $time';
  }

  @override
  String get customersUnknown => '— Kunden';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kunden',
      one: '1 Kunde',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Vorheriger Monat';

  @override
  String get nextMonth => 'Nächster Monat';

  @override
  String get salesMonth => 'Umsatz (Monat)';

  @override
  String get outstanding => 'Offen';

  @override
  String get profitMonth => 'Gewinn (Monat)';

  @override
  String get cashToday => 'Kasse heute';

  @override
  String get newBill => 'Neue Rechnung';

  @override
  String get scanHandwrittenBill => 'Handschriftliche Rechnung scannen';

  @override
  String get topOutstanding => 'Höchste offene Beträge';

  @override
  String viewAllInDues(int count) {
    return 'Alle $count im Forderungszentrum ansehen';
  }

  @override
  String get lowStockAlerts => 'Warnungen zu niedrigem Bestand';

  @override
  String get noLowStock => 'Kein Artikel mit niedrigem Bestand — alles gut.';

  @override
  String get whatsappAll => 'WhatsApp an alle';

  @override
  String get reorderAll => 'Alle nachbestellen';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Vorschlag: $qty $unit nachbestellen';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Noch $qty $unit';
  }

  @override
  String get reorder => 'Nachbestellen';

  @override
  String get whatsappSupplier => 'WhatsApp an Lieferant';

  @override
  String get topItemsByRevenue => 'Top-Artikel nach Umsatz';

  @override
  String get noSalesYet => 'Noch keine Verkäufe erfasst.';

  @override
  String qtyLabel(String qty) {
    return 'Menge: $qty';
  }

  @override
  String get monthExpenses => 'Ausgaben diesen Monat';

  @override
  String get noExpensesMonth => 'Diesen Monat keine Ausgaben erfasst.';

  @override
  String get quickActions => 'Schnellaktionen';

  @override
  String get dailyCashReconciliation => 'Täglicher Kassenabgleich';

  @override
  String get collectMoney => 'Geld einziehen';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Änderungen offline gespeichert',
      one: '1 Änderung offline gespeichert',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Wird automatisch synchronisiert, sobald du online bist';

  @override
  String get syncing => 'Synchronisiert';

  @override
  String get sync => 'Synchronisieren';

  @override
  String get shopProfile => 'Ladenprofil';

  @override
  String get insights => 'Einblicke';

  @override
  String get notifications => 'Benachrichtigungen';

  @override
  String get backupExport => 'Sicherung & Export';

  @override
  String get adminPanel => 'Admin-Bereich';

  @override
  String get toolsSync => 'Tools & Synchronisierung';

  @override
  String get account => 'Konto';

  @override
  String get shopDetailsSaved => 'Ladendaten gespeichert.';

  @override
  String saveFailed(int code) {
    return 'Speichern fehlgeschlagen ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Speichern nicht möglich: $error';
  }

  @override
  String get logoUpdated => 'Logo aktualisiert.';

  @override
  String logoUploadFailed(int code) {
    return 'Logo-Upload fehlgeschlagen ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Logo konnte nicht hochgeladen werden: $error';
  }

  @override
  String get healthGood => 'Insgesamt sieht alles gut aus.';

  @override
  String get healthSome => 'Einige Dinge brauchen Aufmerksamkeit.';

  @override
  String get healthMany => 'Mehrere Dinge brauchen Aufmerksamkeit.';

  @override
  String get shopHealth => 'Ladengesundheit';

  @override
  String get healthIntro => 'Ein kurzer Hinweis, kein weiterer Bericht.';

  @override
  String get couldNotLoadCheckConnection => 'Laden fehlgeschlagen — prüfe deine Verbindung.';

  @override
  String get itemPhotos => 'Artikelfotos';

  @override
  String get barcodes => 'Barcodes';

  @override
  String get lowStockItems => 'Artikel mit niedrigem Bestand';

  @override
  String get lastBackup => 'Letzte Sicherung';

  @override
  String get today => 'heute';

  @override
  String get yesterday => 'gestern';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'vor $days Tagen',
      one: 'vor 1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Offline-Status';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get waitingToSync => 'Wartet auf Synchronisierung';

  @override
  String get syncNow => 'Jetzt synchronisieren';

  @override
  String get searchSettings => 'Einstellungen durchsuchen';

  @override
  String noSettingsMatch(String query) {
    return 'Keine Einstellung passt zu \"$query\"';
  }

  @override
  String get businessInfo => 'GESCHÄFTSDATEN';

  @override
  String get payment => 'ZAHLUNG';

  @override
  String get shopNameRequired => 'Ladenname ist erforderlich';

  @override
  String phoneIncomplete(int digits) {
    return 'Gib eine vollständige $digits-stellige Telefonnummer ein';
  }

  @override
  String get jazzcashOptional => 'JazzCash-Nummer (optional)';

  @override
  String get saved => 'Gespeichert!';

  @override
  String get languageSubtitle => 'Anzeigesprache der App ändern';

  @override
  String get notificationsSubtitle => 'Niedriger Bestand, überfällige Zahlungen & Tageszusammenfassung';

  @override
  String get backupSubtitle => 'Ladendaten herunterladen, wiederherstellen & exportieren';

  @override
  String get appUpdate => 'App-Update';

  @override
  String get appUpdateSubtitle => 'Nach neuerer Version suchen';

  @override
  String get adminSubtitle => 'Konten & Ladendaten verwalten';

  @override
  String get accountSubtitle => 'Anmeldung, Passwort & Benutzername';

  @override
  String get privacyPolicy => 'Datenschutzerklärung';

  @override
  String get privacySubtitle => 'Welche Daten wir erheben und warum';

  @override
  String get yourShop => 'Dein Laden';

  @override
  String get uploadingLogo => 'Ladenlogo wird hochgeladen';

  @override
  String get logoTapToChange => 'Ladenlogo, zum Ändern tippen';

  @override
  String get brandTagline => 'Voller Laden, ruhige Bücher.';

  @override
  String serverError(int code) {
    return 'Serverfehler: $code';
  }

  @override
  String get deleteCustomer => 'Kunde löschen';

  @override
  String deleteCustomerMessage(String name) {
    return '$name und alle Rechnungen löschen? Das kann nicht rückgängig gemacht werden.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Löschen fehlgeschlagen: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Löschen fehlgeschlagen — prüfe die Verbindung und versuche es erneut.';

  @override
  String get actions => 'Aktionen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get delete => 'Löschen';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kunden löschen',
      one: '1 Kunde löschen',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kunden und alle Rechnungen löschen? Das kann nicht rückgängig gemacht werden.',
      one: '1 Kunde und alle Rechnungen löschen? Das kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Auswahl aufheben';

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String selectedCount(int count) {
    return '$count ausgewählt';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get newTag => 'NEU';

  @override
  String get csvNeedsRows => 'Die CSV braucht eine Kopfzeile und mindestens einen Kunden.';

  @override
  String get csvNeedsName => 'Die CSV-Kopfzeile muss eine Spalte \"name\" enthalten.';

  @override
  String csvLineMissingName(int line) {
    return 'Zeile $line: Name fehlt — Datei korrigieren und erneut versuchen.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Zeile $line: ungültiges credit_limit \"$value\" — Datei korrigieren und erneut versuchen.';
  }

  @override
  String get importCustomers => 'Kunden importieren';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kunden in \"$file\" gefunden. Alle importieren?',
      one: '1 Kunde in \"$file\" gefunden. Importieren?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Importieren';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kunden importiert.',
      one: '1 Kunde importiert.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Import fehlgeschlagen: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Import fehlgeschlagen — keine Verbindung: $error';
  }

  @override
  String get noPhone => 'Kein Telefon';

  @override
  String get offlineShowingSaved => 'Offline — gespeicherte Kopie wird angezeigt';

  @override
  String get searchCustomersHint => 'Kunden oder Telefon suchen...';

  @override
  String get noCustomersYet => 'Noch keine Kunden. Tippe auf +, um einen hinzuzufügen.';

  @override
  String get noCustomersMatch => 'Keine Kunden passen zu deiner Suche.';

  @override
  String get owesMoney => 'Schuldet Geld';

  @override
  String get settledUp => 'Ausgeglichen';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what konnte nicht geladen werden: $error';
  }

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get chooseFromGallery => 'Aus Galerie wählen';

  @override
  String get back => 'Zurück';

  @override
  String callPhone(String phone) {
    return '$phone anrufen';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp an $phone';
  }

  @override
  String get clearSearch => 'Suche löschen';

  @override
  String get askHint => 'z. B. Wie viel Gewinn habe ich diesen Monat gemacht?';

  @override
  String get acctTurnOffLockTitle => 'App-Sperre ausschalten?';

  @override
  String get acctTurnOffLockBody => 'Jeder, der dieses Telefon hat, kann die App ohne PIN öffnen.';

  @override
  String get acctTurnOff => 'Ausschalten';

  @override
  String get acctSetPinTitle => 'PIN festlegen';

  @override
  String get acctPinLabel => 'PIN mit 4–6 Ziffern';

  @override
  String get acctPinMin => 'Mindestens 4 Ziffern';

  @override
  String get acctConfirmPin => 'PIN bestätigen';

  @override
  String get acctPinMismatch => 'PINs stimmen nicht überein';

  @override
  String get acctSetPin => 'PIN festlegen';

  @override
  String get acctBiometricTitle => 'Auch Fingerabdruck/Gesicht verwenden?';

  @override
  String get acctBiometricBody => 'Falls die Biometrie einmal nicht klappt, können Sie weiterhin die PIN verwenden.';

  @override
  String get acctNoThanks => 'Nein, danke';

  @override
  String get acctEnable => 'Aktivieren';

  @override
  String get acctSetPasswordTitle => 'Passwort festlegen';

  @override
  String get acctSetPasswordIntro => 'Wählen Sie ein Passwort, damit Sie sich künftig auch mit E-Mail + Passwort anmelden können, nicht nur mit Google.';

  @override
  String get acctPassword => 'Passwort';

  @override
  String get acctPasswordMin => 'Muss mindestens 6 Zeichen lang sein';

  @override
  String get acctConfirmPassword => 'Passwort bestätigen';

  @override
  String get acctPasswordsMismatch => 'Passwörter stimmen nicht überein';

  @override
  String get acctSetPasswordButton => 'Passwort festlegen';

  @override
  String get acctPasswordSet => 'Passwort festgelegt — Sie können sich jetzt auch damit anmelden.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Passwort konnte nicht festgelegt werden: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Passwort ändern';

  @override
  String get acctCurrentPassword => 'Aktuelles Passwort';

  @override
  String get acctRequired => 'Erforderlich';

  @override
  String get acctNewPassword => 'Neues Passwort';

  @override
  String get acctConfirmNewPassword => 'Neues Passwort bestätigen';

  @override
  String get acctChange => 'Ändern';

  @override
  String get acctPasswordChanged => 'Passwort geändert.';

  @override
  String get acctWrongPassword => 'Das aktuelle Passwort ist falsch.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Passwort konnte nicht geändert werden: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Benutzernamen ändern';

  @override
  String get acctUsername => 'Benutzername';

  @override
  String get acctUsernameEmpty => 'Benutzername darf nicht leer sein';

  @override
  String get acctUsernameChanged => 'Benutzername geändert.';

  @override
  String get acctChangeEmailTitle => 'E-Mail-Adresse ändern';

  @override
  String get acctNewEmail => 'Neue E-Mail-Adresse';

  @override
  String get acctValidEmail => 'Gültige E-Mail-Adresse eingeben';

  @override
  String get acctRequiredConfirm => 'Zur Bestätigung Ihrer Identität erforderlich';

  @override
  String get acctGoogleConfirmFirst => 'Sie werden zuerst gebeten, sich über Google zu bestätigen.';

  @override
  String acctCheckEmail(String email) {
    return 'Prüfen Sie $email auf einen Link zur Bestätigung der Änderung.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'die Passwort-Anmeldung';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider entfernen?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Sie können sich mit diesem Konto dann nicht mehr über $provider anmelden.';
  }

  @override
  String get acctRemove => 'Entfernen';

  @override
  String acctRemoved(String provider) {
    return '$provider entfernt.';
  }

  @override
  String get acctSignedIn => 'Angemeldet';

  @override
  String get acctEmailNotVerified => 'E-Mail noch nicht bestätigt.';

  @override
  String get acctVerificationSent => 'Bestätigungs-E-Mail gesendet.';

  @override
  String get acctResend => 'Erneut senden';

  @override
  String get acctSectionSignIn => 'ANMELDUNG & SICHERHEIT';

  @override
  String get acctRowChangeUsername => 'Benutzernamen ändern';

  @override
  String get acctRowChangeEmail => 'E-Mail ändern';

  @override
  String get acctRowSetPassword => 'Passwort festlegen';

  @override
  String get acctRowChangePassword => 'Passwort ändern';

  @override
  String get acctRowUnlinkGoogle => 'Google trennen';

  @override
  String get acctRowRemovePassword => 'Passwort entfernen';

  @override
  String get acctRowAppLock => 'App-Sperre (PIN)';

  @override
  String get acctRowBiometric => 'Fingerabdruck/Gesicht verwenden';

  @override
  String get acctSignOutTitle => 'Abmelden?';

  @override
  String get acctSignOutBody => 'Sie müssen sich erneut anmelden, um die App zu nutzen.';

  @override
  String get acctSignOut => 'Abmelden';

  @override
  String get acctDeleteAccount => 'Konto löschen';

  @override
  String get acctDeleting => 'Wird gelöscht...';

  @override
  String get acctDeleteTitle => 'Konto löschen?';

  @override
  String get acctDeleteBody => 'Dadurch werden Ihre Anmeldedaten dauerhaft gelöscht. Sie müssen sich neu registrieren, um die App zu nutzen. Das kann nicht rückgängig gemacht werden.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Konto konnte nicht gelöscht werden: $error';
  }

  @override
  String get itmNotFoundTitle => 'Artikel nicht gefunden';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Kein Artikel hat den Barcode $barcode. Jetzt als neuen Artikel hinzufügen?';
  }

  @override
  String get itmAddItem => 'Artikel hinzufügen';

  @override
  String get itmEditItem => 'Artikel bearbeiten';

  @override
  String get itmMergeTitle => 'Doppelte Artikel zusammenführen';

  @override
  String get itmMergeBody => 'Artikel mit demselben Namen werden im ältesten Eintrag zusammengeführt und ihre Bestände addiert. Das kann nicht rückgängig gemacht werden.';

  @override
  String get itmMerge => 'Zusammenführen';

  @override
  String get itmNoDuplicates => 'Keine doppelten Artikel gefunden.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count doppelte Artikel zusammengeführt.',
      one: '1 doppelter Artikel zusammengeführt.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Artikel löschen';

  @override
  String get itmCannotUndo => 'Das kann nicht rückgängig gemacht werden.';

  @override
  String get itmDeleteOffline => 'Löschen fehlgeschlagen — Verbindung prüfen und erneut versuchen.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Artikel löschen',
      one: '1 Artikel löschen',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Artikel löschen? Das kann nicht rückgängig gemacht werden.',
      one: '1 Artikel löschen? Das kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Foto konnte nicht hochgeladen werden ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Foto konnte nicht hochgeladen werden: $error';
  }

  @override
  String get itmNoBarcodes => 'Noch kein Artikel hat einen Barcode.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Etiketten drucken',
      one: '1 Etikett drucken',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Artikel oder Kategorie suchen...';

  @override
  String get itmStopListening => 'Zuhören beenden';

  @override
  String get itmVoiceSearch => 'Sprachsuche';

  @override
  String get itmSort => 'Sortieren';

  @override
  String get itmSortName => 'Name (A–Z)';

  @override
  String get itmSortStockLow => 'Bestand: niedrig bis hoch';

  @override
  String get itmSortRecent => 'Zuletzt hinzugefügt';

  @override
  String get itmFilterAll => 'Alle';

  @override
  String get itmFilterLowStock => 'Niedriger Bestand';

  @override
  String get itmNoItemsYet => 'Noch keine Artikel. Tippen Sie auf +, um einen hinzuzufügen.';

  @override
  String get itmNoItemsMatch => 'Keine Artikel entsprechen Ihrer Suche.';

  @override
  String get itmNoPriceChanges => 'Noch keine Preisänderungen erfasst.';

  @override
  String get itmNoStockCorrections => 'Noch keine Bestandskorrekturen erfasst.';

  @override
  String get itmResetHistory => 'Verlauf zurücksetzen';

  @override
  String get itmResetHistoryMsg => 'Den Verlauf dieses Artikels zurücksetzen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get itmSendPdf => 'Als PDF senden';

  @override
  String get itmNoteOptional => 'Notiz (optional)';

  @override
  String get itmNoteHint => 'Notiz zu dieser Änderung hinzufügen';

  @override
  String get itmRemoveEntry => 'Eintrag entfernen';

  @override
  String get itmRemoveEntryMsg => 'Diesen Eintrag aus dem Verlauf entfernen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get itmEditEntry => 'Eintrag bearbeiten';

  @override
  String get itmPrevQty => 'Vorher';

  @override
  String get itmNewQty => 'Neu';

  @override
  String itmCost(String amount) {
    return 'Kosten: $amount';
  }

  @override
  String get itmMore => 'Mehr';

  @override
  String get itmMenuPrintLabel => 'Etikett drucken';

  @override
  String get itmMenuDuplicate => 'Duplizieren';

  @override
  String get itmMenuPriceHistory => 'Preisverlauf';

  @override
  String get itmMenuStockHistory => 'Verlauf der Bestandskorrekturen';

  @override
  String itmLowStockBadge(int count) {
    return '$count niedriger Bestand';
  }

  @override
  String itmStockLine(String qty) {
    return 'Bestand: $qty';
  }

  @override
  String get itmOfflineSaved => 'Offline — Artikel auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get itmItemName => 'Artikelname';

  @override
  String get itmNameRequired => 'Name ist erforderlich';

  @override
  String get itmPricePkr => 'Preis (PKR)';

  @override
  String get itmPriceRequired => 'Preis ist erforderlich';

  @override
  String get itmValidNumber => 'Gültige Zahl eingeben';

  @override
  String get itmUnit => 'Einheit';

  @override
  String get itmCategoryHint => 'Kategorie (optional, z. B. Sanitär)';

  @override
  String get itmPreferredSupplier => 'Bevorzugter Lieferant (optional)';

  @override
  String get itmPreferredSupplierHelper => 'Wird für die Ein-Tipp-Nachbestellung verwendet';

  @override
  String get itmClear => 'Leeren';

  @override
  String get itmHsn => 'HSN-Code (optional)';

  @override
  String get itmGstRate => 'GST-Satz % (optional)';

  @override
  String get itmBarcodeOptional => 'Barcode (optional)';

  @override
  String get itmScanOrType => 'Scannen oder eingeben';

  @override
  String get itmScanBarcode => 'Barcode scannen';

  @override
  String get itmPurchaseCost => 'Einkaufspreis (pro Einheit)';

  @override
  String get itmPurchaseCostHint => 'Was Sie beim Einkauf des Bestands zahlen';

  @override
  String get itmWholesale => 'Großhandelspreis (optional)';

  @override
  String get itmContractor => 'Handwerkerpreis (optional)';

  @override
  String get itmFallsBack => 'Sonst gilt der normale Preis';

  @override
  String get itmStockQty => 'Bestandsmenge';

  @override
  String get itmLowStockAlert => 'Warnung bei Bestand unter';

  @override
  String get itmFrequently => 'Oft zusammen gekauft mit';

  @override
  String get itmSaveChanges => 'Änderungen speichern';

  @override
  String get itmSaveItem => 'Artikel speichern';

  @override
  String get itmPhotoSemantics => 'Artikelfoto, zum Ändern tippen';

  @override
  String get cdUpdateStatusTitle => 'Zahlungsstatus aktualisieren';

  @override
  String get cdMarkPaidQ => 'Diese Rechnung als bezahlt markieren?';

  @override
  String get cdMarkUnpaidQ => 'Diese Rechnung als unbezahlt markieren?';

  @override
  String get cdConfirm => 'Bestätigen';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Aktualisierung fehlgeschlagen: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Offline — Änderung auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get cdConvertTitle => 'In Rechnung umwandeln';

  @override
  String get cdConvertBody => 'Dadurch wird der Bestand dieser Artikel abgezogen und das Angebot in eine echte Rechnung umgewandelt. Fortfahren?';

  @override
  String get cdConvert => 'Umwandeln';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Umwandlung fehlgeschlagen: $detail';
  }

  @override
  String get cdReturnItems => 'Artikel zurückgeben';

  @override
  String get cdReturnHint => 'Legen Sie fest, wie viel von jedem Artikel zurückgegeben wird. Bei 0 bleibt er verkauft.';

  @override
  String get cdDecreaseQty => 'Menge verringern';

  @override
  String get cdIncreaseQty => 'Menge erhöhen';

  @override
  String get cdCreditTotal => 'Gutschrift gesamt';

  @override
  String get cdReturnSelected => 'Auswahl zurückgeben';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Rückgabe fehlgeschlagen: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Stornierung fehlgeschlagen: $detail';
  }

  @override
  String get cdNoPreviousBill => 'Keine vorherige Rechnung zum Wiederholen';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Letzte Rechnung konnte nicht geladen werden: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Rechnung wurde per E-Mail an den Kunden gesendet.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Rechnung konnte nicht gemailt werden: $detail';
  }

  @override
  String get cdStatementEmailed => 'Kontoauszug wurde per E-Mail an den Kunden gesendet.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Kontoauszug konnte nicht gemailt werden: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Rechnung löschen';

  @override
  String get cdBillVoided => 'STORNIERT';

  @override
  String get cdBillReturn => 'RÜCKGABE';

  @override
  String get cdBillQuote => 'ANGEBOT';

  @override
  String get cdBillPaid => 'BEZAHLT';

  @override
  String get cdBillPartial => 'TEILWEISE';

  @override
  String get cdBillUnpaid => 'OFFEN';

  @override
  String get cdBill => 'Rechnung';

  @override
  String cdVoidedReason(String reason) {
    return 'Storniert: $reason';
  }

  @override
  String get cdViewInvoice => 'Rechnung ansehen';

  @override
  String get cdEmailInvoice => 'Rechnung per E-Mail senden';

  @override
  String get cdEditBill => 'Rechnung bearbeiten';

  @override
  String get cdReturnBill => 'Rechnung zurückgeben';

  @override
  String get cdVoidBill => 'Rechnung stornieren';

  @override
  String get cdNoItems => 'Keine Artikel';

  @override
  String get cdRepeatLast => 'Letzte Rechnung wiederholen';

  @override
  String get cdLedgerPdf => 'Kontoblatt-PDF';

  @override
  String get cdEmailStatement => 'Kontoauszug per E-Mail senden';

  @override
  String get cdCollectPayment => 'Zahlung einziehen';

  @override
  String get cdSendReminder => 'WhatsApp-Erinnerung senden';

  @override
  String get cdTotalBilled => 'Gesamt berechnet';

  @override
  String get cdPaid => 'Bezahlt';

  @override
  String get cdNoBills => 'Noch keine Rechnungen';

  @override
  String get cdBillActions => 'Rechnungsaktionen';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding von $limit Kreditlimit genutzt';
  }

  @override
  String get cdVoidBody => 'Sie wird aus Salden und Berichten entfernt, bleibt aber im Verlauf erhalten. Der Bestand wird wiederhergestellt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get cdReason => 'Grund (optional)';

  @override
  String get frmOfflineCustomer => 'Offline — Kunde auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get frmOfflineSupplier => 'Offline — Lieferant auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get frmEditCustomer => 'Kunde bearbeiten';

  @override
  String get frmCustomerName => 'Kundenname';

  @override
  String get frmPhoneOptional => 'Telefon (optional)';

  @override
  String get frmCreditLimit => 'Kreditlimit (PKR, optional)';

  @override
  String get frmCreditHelper => 'Warnen, wenn der Saldo dieses Kunden diesen Wert übersteigt';

  @override
  String get frmPriceTier => 'Preisstufe';

  @override
  String get frmRetail => 'Einzelhandel';

  @override
  String get frmWholesale => 'Großhandel';

  @override
  String get frmContractor => 'Handwerker';

  @override
  String get frmPriceTierHelper => 'Welcher Artikelpreis in der Rechnung für diesen Kunden vorausgefüllt wird';

  @override
  String get frmStrn => 'STRN (optional)';

  @override
  String get frmStrnCustomer => '13-stellige Umsatzsteuer-Registrierungsnummer für Rechnungen';

  @override
  String get frmStrnSupplier => '13-stellige Umsatzsteuer-Registrierungsnummer für Einkaufsrechnungen';

  @override
  String get frmAddress => 'Adresse (optional)';

  @override
  String get frmEmail => 'E-Mail (optional)';

  @override
  String get frmEmailHelper => 'Ermöglicht es, diesem Kunden eine Rechnung oder einen Kontoauszug per E-Mail zu senden';

  @override
  String get frmSaveCustomer => 'Kunde speichern';

  @override
  String get frmEditSupplier => 'Lieferant bearbeiten';

  @override
  String get frmSupplierName => 'Lieferantenname';

  @override
  String get frmSaveSupplier => 'Lieferant speichern';

  @override
  String get sdDeletePurchaseTitle => 'Einkauf löschen';

  @override
  String get sdDeletePurchaseBody => 'Der Bestand aus diesem Einkauf wird wiederhergestellt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get sdReturnToSupplier => 'An Lieferanten zurückgeben';

  @override
  String get sdReturnHint => 'Legen Sie fest, wie viel von jedem Artikel zurückgesendet wird. Bei 0 bleibt er erhalten.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Konnte nicht als erhalten markiert werden: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Diesen Einkauf als bezahlt markieren?';

  @override
  String get sdMarkUnpaidQ => 'Diesen Einkauf als unbezahlt markieren?';

  @override
  String get sdTotalPurchased => 'Gesamteinkäufe';

  @override
  String get sdPayable => 'Zu zahlen';

  @override
  String sdPayableAmount(String amount) {
    return '$amount zu zahlen';
  }

  @override
  String get sdNoPurchases => 'Noch keine Einkäufe';

  @override
  String get sdPo => 'BE';

  @override
  String get sdDraftPo => 'BESTELLENTWURF';

  @override
  String get sdPurchase => 'Einkauf';

  @override
  String get sdDraftNote => 'Bestellentwurf — noch nicht erhalten, noch keine Bestands- oder Kostenänderung.';

  @override
  String get sdReturnNote => 'Rückgabe / Gutschrift an den Lieferanten.';

  @override
  String get sdMarkReceived => 'Als erhalten markieren';

  @override
  String get sdEditPurchase => 'Einkauf bearbeiten';

  @override
  String get sdPurchaseActions => 'Einkaufsaktionen';

  @override
  String get slDeleteSupplier => 'Lieferant löschen';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lieferanten löschen',
      one: '1 Lieferant löschen',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lieferanten und alle ihre Einkäufe löschen? Das kann nicht rückgängig gemacht werden.',
      one: '1 Lieferanten und alle seine Einkäufe löschen? Das kann nicht rückgängig gemacht werden.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'Die CSV braucht eine Kopfzeile und mindestens einen Lieferanten.';

  @override
  String get slImportTitle => 'Lieferanten importieren';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lieferanten in \"$file\" gefunden. Alle importieren?',
      one: '1 Lieferant in \"$file\" gefunden. Alle importieren?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lieferanten importiert.',
      one: '1 Lieferant importiert.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Noch keine Lieferanten. Tippen Sie auf +, um einen hinzuzufügen.';

  @override
  String get slSearchHint => 'Lieferanten oder Telefon suchen...';

  @override
  String get slNoMatch => 'Keine Lieferanten entsprechen Ihrer Suche.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lieferanten',
      one: '1 Lieferant',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Lieferantenverbindlichkeiten';

  @override
  String get sduNothingOwed => 'Keine offenen Beträge bei Lieferanten 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Lieferanten offen',
      one: '1 Lieferant offen',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage seit dem ältesten unbezahlten Einkauf',
      one: '1 Tag seit dem ältesten unbezahlten Einkauf',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 Tage';

  @override
  String get duBucket1 => '30–60 Tage';

  @override
  String get duBucket2 => '60+ Tage';

  @override
  String get duTitle => 'Forderungszentrale';

  @override
  String get duNoDues => 'Keine offenen Forderungen 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kunden mit offenen Beträgen',
      one: '1 Kunde mit offenen Beträgen',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage seit der ältesten unbezahlten Rechnung',
      one: '1 Tag seit der ältesten unbezahlten Rechnung',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount offen';
  }

  @override
  String get cpNoOutstanding => 'Für diesen Kunden besteht kein offener Saldo';

  @override
  String get cpValidAmount => 'Gültigen Betrag eingeben';

  @override
  String cpExceeds(String amount) {
    return 'Der Betrag übersteigt den offenen Saldo von $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$amount von $name eingezogen';
  }

  @override
  String get cpOfflineSaved => 'Offline — Zahlung auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String cpOwes(String amount, String name) {
    return '$name schuldet $amount. Wird zuerst auf die älteste(n) unbezahlte(n) Rechnung(en) angerechnet.';
  }

  @override
  String get cpAmountLabel => 'Eingezogener Betrag (PKR)';

  @override
  String get cpCollect => 'Einziehen';

  @override
  String get usNoItems => 'Keine Artikel zum Aktualisieren.';

  @override
  String get usHelp => 'Legen Sie für jeden Artikel den neuen Bestand fest und tippen Sie dann auf „Alle speichern“.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  aktuell: $qty';
  }

  @override
  String usNew(String qty) {
    return 'neu: $qty';
  }

  @override
  String get usSubtract => '1 abziehen';

  @override
  String get usAdd => '1 hinzufügen';

  @override
  String get usNoChanges => 'Keine Änderungen';

  @override
  String usSaveAll(int count) {
    return 'Alle speichern ($count geändert)';
  }

  @override
  String get srHint => 'Kunden, Artikel, Beträge suchen...';

  @override
  String get srFailed => 'Suche fehlgeschlagen — Verbindung prüfen.';

  @override
  String get srTitle => 'Durchsuchen Sie Ihr Geschäft';

  @override
  String get srSubtitle => 'Kunden nach Name oder Telefon, Rechnungen nach Betrag finden.';

  @override
  String srNoMatches(String query) {
    return 'Keine Treffer für \"$query\"';
  }

  @override
  String get srTryDifferent => 'Versuchen Sie einen anderen Namen, eine andere Telefonnummer oder einen anderen Betrag.';

  @override
  String get srBills => 'Rechnungen';

  @override
  String get srNoItemList => 'Keine Artikelliste';

  @override
  String get abAddAtLeastOne => 'Fügen Sie mindestens einen Artikel hinzu';

  @override
  String get abQuotationUpdated => 'Angebot aktualisiert!';

  @override
  String get abBillUpdated => 'Rechnung aktualisiert!';

  @override
  String get abQuotationSaved => 'Angebot gespeichert!';

  @override
  String get abBillCreated => 'Rechnung erfolgreich erstellt!';

  @override
  String abTotalAmount(String amount) {
    return 'Gesamt: $amount';
  }

  @override
  String get abShare => 'Teilen';

  @override
  String get abDoneReturn => 'Fertig & zurück';

  @override
  String get abOverLimitBody => 'Damit würde der Kunde sein Kreditlimit überschreiten.';

  @override
  String get abOverLimitTitle => 'Kreditlimit überschritten';

  @override
  String get abBillAnyway => 'Trotzdem berechnen';

  @override
  String get abOfflineBill => 'Offline — Rechnung auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get abEditQuotation => 'Angebot bearbeiten';

  @override
  String get abEditBill => 'Rechnung bearbeiten';

  @override
  String get abNewQuotation => 'Neues Angebot';

  @override
  String get abAddBill => 'Rechnung hinzufügen';

  @override
  String get abCouldNotLoadItems => 'Artikel konnten nicht geladen werden.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Mit dieser Rechnung läge der Kunde bei $total und damit über seinem Kreditlimit von $limit.';
  }

  @override
  String get abTapAddItemBill => 'Tippen Sie unten auf „Artikel hinzufügen“, um eine Rechnung zu beginnen';

  @override
  String get abNoCatalog => 'Noch keine Artikel im Katalog';

  @override
  String get abScan => 'Scannen';

  @override
  String get abDiscountRs => 'Rabatt (Rs)';

  @override
  String get abSubtotal => 'Zwischensumme';

  @override
  String get abTotal => 'Gesamt';

  @override
  String get abSaveAsQuotation => 'Als Angebot speichern';

  @override
  String get abQuotationLocked => 'Eine bestehende Rechnung kann nicht wieder in ein Angebot umgewandelt werden';

  @override
  String get abQuotationNote => 'Kein Bestandsabzug, bis in eine Rechnung umgewandelt wird';

  @override
  String get abPaymentStatus => 'Zahlungsstatus';

  @override
  String get abUnpaid => 'Offen';

  @override
  String get abPaymentMethod => 'Zahlungsart';

  @override
  String get abCash => 'Bar';

  @override
  String get abBankTransfer => 'Überweisung';

  @override
  String get abCheque => 'Scheck';

  @override
  String get abSaveQuotation => 'Angebot speichern';

  @override
  String get abSaveBill => 'Rechnung speichern';

  @override
  String abAdded(String name) {
    return '$name hinzugefügt';
  }

  @override
  String get apNewItem => 'Neuer Artikel…';

  @override
  String get apNewItemHint => 'Fügen Sie zuerst einen neuen Artikel zum Katalog hinzu';

  @override
  String get apOfflinePurchase => 'Offline — Einkauf auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get apEditPo => 'Bestellung bearbeiten';

  @override
  String get apNewPo => 'Neue Bestellung';

  @override
  String get apAddPurchase => 'Einkauf hinzufügen';

  @override
  String get apTapAddItem => 'Tippen Sie unten auf „Artikel hinzufügen“, um einen Einkauf zu beginnen';

  @override
  String get apSaveAsPo => 'Als Bestellung speichern';

  @override
  String get apPoLocked => 'Ein bereits erhaltener Einkauf kann nicht wieder in eine Entwurfsbestellung umgewandelt werden';

  @override
  String get apPoNote => 'Keine Bestands- oder Kostenänderung, bis die Ware als erhalten markiert wird';

  @override
  String get apUnpaidCredit => 'Offen (Kredit)';

  @override
  String get apSavePo => 'Bestellung speichern';

  @override
  String get apSavePurchase => 'Einkauf speichern';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Aktuelle Kosten: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Keine Kosten festgelegt  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Scan fehlgeschlagen: Serverfehler $code';
  }

  @override
  String get scOfflineSaved => 'Offline — Foto gespeichert, wird automatisch gelesen, sobald Sie wieder online sind';

  @override
  String get scStillOffline => 'Weiterhin offline';

  @override
  String get scCouldNotCreateCustomer => 'Kunde konnte nicht angelegt werden — bitte erneut versuchen.';

  @override
  String get scCouldNotCreateSupplier => 'Lieferant konnte nicht angelegt werden — bitte erneut versuchen.';

  @override
  String scBillSavedFor(String name) {
    return 'Rechnung für $name gespeichert';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Einkauf von $name gespeichert';
  }

  @override
  String get scWhichCustomer => 'Welcher Kunde ist das?';

  @override
  String get scWhichSupplier => 'Welcher Lieferant ist das?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Ähnlichster Eintrag: $name ($score% Übereinstimmung)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Ja, das ist $name';
  }

  @override
  String get scOtherwiseCustomer => 'Andernfalls einen neuen Kunden anlegen:';

  @override
  String get scOtherwiseSupplier => 'Andernfalls einen neuen Lieferanten anlegen:';

  @override
  String get scNoMatchCustomer => 'Kein passender Kunde gefunden. Neuen anlegen:';

  @override
  String get scNoMatchSupplier => 'Kein passender Lieferant gefunden. Neuen anlegen:';

  @override
  String get scCustomerName => 'Kundenname';

  @override
  String get scSupplierName => 'Lieferantenname';

  @override
  String get scCreateNew => 'Neu anlegen';

  @override
  String get scTitleBill => 'Rechnung scannen';

  @override
  String get scIntroBill => 'Mach ein Foto von der Rechnung. Handschrift ist kein Problem, und Sindhi, Urdu oder Englisch funktionieren alle. Du kannst alles prüfen, bevor es gespeichert wird.';

  @override
  String get scIntroPurchase => 'Mach ein Foto von der Rechnung des Lieferanten. Sindhi, Urdu oder Englisch funktionieren alle. Du kannst alles prüfen, bevor es gespeichert wird.';

  @override
  String get scReadingBill => 'Rechnung wird gelesen…';

  @override
  String get scScanBill => 'Rechnung scannen';

  @override
  String get scReadingInvoice => 'Rechnung wird gelesen…';

  @override
  String get scScanInvoice => 'Rechnung scannen';

  @override
  String get scQueued => 'Wartende Scans';

  @override
  String get scReady => 'Bereit zur Prüfung';

  @override
  String get scFailed => 'Fehlgeschlagen';

  @override
  String get scWaiting => 'Warten auf Verbindung';

  @override
  String get scRetry => 'Erneut versuchen';

  @override
  String rpCouldNotLoad(String error) {
    return 'Berichte konnten nicht geladen werden: $error';
  }

  @override
  String get rpHeadline => 'Die wichtigsten Zahlen dieses Monats';

  @override
  String get rpProfitThisMonth => 'Gewinn diesen Monat';

  @override
  String get rpNoData => 'Noch keine Daten';

  @override
  String get rpSalesTax => 'Umsatzsteuer';

  @override
  String rpSalesTaxFor(String month) {
    return 'Umsatzsteuerbericht für $month';
  }

  @override
  String get rpViewSalesTax => 'Umsatzsteuerbericht ansehen';

  @override
  String get rpQuickReports => 'Schnellberichte';

  @override
  String get rpQuickSub => 'Direkt zu einem bestimmten Bericht springen';

  @override
  String get expensesTitle => 'Ausgaben';

  @override
  String get rpRateCard => 'Preisliste';

  @override
  String get rpDetails => 'Details';

  @override
  String get rpDetailsSub => 'Vollständige Aufschlüsselungen und Rankings';

  @override
  String get rpOutstandingByCustomer => 'Offene Posten nach Kunde';

  @override
  String get rpNoOutstanding => 'Keine offenen Salden';

  @override
  String get rpMonthlyTotals => 'Monatssummen';

  @override
  String get rpMostSold => 'Meistverkaufte Artikel';

  @override
  String get rpNoItemsRecorded => 'Noch keine Artikel erfasst';

  @override
  String get rpTopCustomers => 'Top-Kunden nach Umsatz';

  @override
  String get rpNoSalesRecorded => 'Noch keine Verkäufe erfasst';

  @override
  String get rpTotalOutstanding => 'Offen gesamt';

  @override
  String get rpViewCustomers => 'Kunden ansehen';

  @override
  String get lblInvoice => 'Rechnung';

  @override
  String get lblLedger => 'Kontoblatt';

  @override
  String get lblRateCard => 'Preisliste';

  @override
  String get exCsvNeedsRows => 'Die CSV braucht eine Kopfzeile und mindestens eine Ausgabe.';

  @override
  String get exCsvHeader => 'Der CSV-Kopf muss die Spalten \"description\" und \"amount\" enthalten.';

  @override
  String exLineBadAmount(int line) {
    return 'Zeile $line: Beschreibung fehlt oder Betrag ungültig — Datei korrigieren und erneut versuchen.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Zeile $line: ungültiges Datum \"$date\" — bitte JJJJ-MM-TT verwenden.';
  }

  @override
  String get exImportTitle => 'Ausgaben importieren';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ausgaben in \"$file\" gefunden. Alle importieren?',
      one: '1 Ausgabe in \"$file\" gefunden. Alle importieren?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ausgaben importiert.',
      one: '1 Ausgabe importiert.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Import fehlgeschlagen: Serverfehler $code';
  }

  @override
  String get exDeleteTitle => 'Ausgabe löschen';

  @override
  String get exAdd => 'Ausgabe hinzufügen';

  @override
  String get exEdit => 'Ausgabe bearbeiten';

  @override
  String get exDescription => 'Beschreibung';

  @override
  String get exAmountRs => 'Betrag (Rs)';

  @override
  String get exCategory => 'Kategorie';

  @override
  String exDate(String date) {
    return 'Datum: $date';
  }

  @override
  String get exRepeats => 'Monatlich wiederholen';

  @override
  String get exRepeatsHint => 'Miete, Strom, Löhne usw.';

  @override
  String get exReceiptTap => 'Belegfoto, zum Ändern tippen';

  @override
  String get exReceiptOptional => 'Belegfoto (optional)';

  @override
  String get exEnterValid => 'Geben Sie eine Beschreibung und einen gültigen Betrag ein.';

  @override
  String get exOffline => 'Offline — Ausgabe auf diesem Gerät gespeichert, wird automatisch synchronisiert, sobald Sie wieder online sind';

  @override
  String get exSave => 'Ausgabe speichern';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wiederkehrende Ausgaben diesen Monat fällig',
      one: '1 wiederkehrende Ausgabe diesen Monat fällig',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Hinzufügen';

  @override
  String get exTotal => 'Ausgaben gesamt';

  @override
  String exCategoryChip(String name) {
    return 'Kategorie: $name';
  }

  @override
  String get exNoneLogged => 'Noch keine Ausgaben erfasst';

  @override
  String exNoneInCategory(String name) {
    return 'Noch keine Ausgaben in „$name“';
  }

  @override
  String get exViewReceipt => 'Beleg ansehen';

  @override
  String get exEditRow => 'Ausgabe bearbeiten';

  @override
  String get exDeleteRow => 'Ausgabe löschen';

  @override
  String gstServerReturned(String first, String second) {
    return 'Server lieferte $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST-Daten konnten nicht geladen werden: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Download fehlgeschlagen ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename gespeichert';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'In Downloads/$filename gespeichert';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Download fehlgeschlagen: $error';
  }

  @override
  String get gstTitle => 'Umsatzsteuerbericht';

  @override
  String get gstOutwardDetail => 'Ausgangsumsätze — Rechnungsdetails';

  @override
  String get gstNoBills => 'Keine Rechnungen für diesen Monat.';

  @override
  String get gstHsn => 'HSN-Übersicht';

  @override
  String get gstInvoiceWise => 'Details je Rechnung';

  @override
  String get gstMonthly => 'Monatsübersicht';

  @override
  String get gstOutwardTaxable => 'Steuerpflichtige Ausgangsumsätze';

  @override
  String get gstItc => 'Vorsteuerabzug (aus Einkäufen)';

  @override
  String get gstSave => 'Speichern';

  @override
  String get rcValidAmount => 'Gültigen Betrag eingeben.';

  @override
  String get rcExpected => 'Erwartetes Bargeld (Bargeldverkäufe von heute)';

  @override
  String get rcAlsoCollected => 'Heute zusätzlich eingenommen (nicht in der Kasse gezählt)';

  @override
  String get rcCounted => 'In der Kasse gezähltes Bargeld (Rs)';

  @override
  String get rcCompare => 'Vergleichen';

  @override
  String get rcMatches => 'Stimmt genau!';

  @override
  String rcExtra(String amount) {
    return '$amount zu viel in der Kasse';
  }

  @override
  String rcMissing(String amount) {
    return '$amount fehlen in der Kasse';
  }

  @override
  String get pbiTitle => 'Gewinn nach Artikel';

  @override
  String get pbiNoSales => 'Noch keine Verkäufe';

  @override
  String get pbiByCategory => 'Nach Kategorie';

  @override
  String get pbiItemsByProfit => 'Artikel nach Gewinn';

  @override
  String get svTitle => 'Lagerwert';

  @override
  String get svNone => 'Kein Lagerbestand';

  @override
  String get svItemsByValue => 'Artikel nach Wert';

  @override
  String svSummary(String items, String units) {
    return '$items Artikel · $units Einheiten im Regal';
  }

  @override
  String svTied(String amount) {
    return '$amount im Lager gebunden';
  }

  @override
  String get svEstimated => 'geschätzt aus Verkaufspreis';

  @override
  String get bkRestoreTitle => 'Sicherung wiederherstellen?';

  @override
  String bkRestoreBody(String filename) {
    return 'Dadurch werden ALLE aktuellen Daten durch die Sicherungsdatei \"$filename\" ersetzt. Fortfahren?';
  }

  @override
  String get bkRestore => 'Wiederherstellen';

  @override
  String get bkRestoreDoneTitle => 'Wiederherstellung abgeschlossen';

  @override
  String get bkRestoreDoneBody => 'Ihre Daten wurden wiederhergestellt.';

  @override
  String get bkOk => 'OK';

  @override
  String bkRestoreFailed(String detail) {
    return 'Wiederherstellung fehlgeschlagen: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Wiederherstellung nicht möglich: $error';
  }

  @override
  String get bkSaveToDownloads => 'In Downloads speichern';

  @override
  String get bkIntroAdmin => 'Alle Ihre Daten liegen in einer Datenbankdatei. Laden Sie regelmäßig eine Kopie herunter und stellen Sie sie wieder her, falls etwas schiefgeht.';

  @override
  String get bkIntroStaff => 'Vollständige Datenbanksicherung und -wiederherstellung sind nur für Admins. Fragen Sie einen Admin oder exportieren Sie unten, was Sie brauchen, als CSV.';

  @override
  String get bkBackupDb => 'Datenbank sichern';

  @override
  String get bkBackupDbSub => 'Laden Sie die gesamte Datenbank als eine Datei herunter und teilen Sie sie (WhatsApp, Drive, E-Mail).';

  @override
  String get bkDownloadPhone => 'Sicherung aufs Telefon laden';

  @override
  String get bkShareBackup => 'Sicherung teilen';

  @override
  String get bkAutoTitle => 'Automatische Sicherungen';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tägliche Sicherungen auf dem Server, die neueste von $time. Läuft von selbst — hier ist nichts zu tun.',
      one: '1 tägliche Sicherung auf dem Server, die neueste von $time. Läuft von selbst — hier ist nichts zu tun.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Wählen Sie eine gespeicherte Sicherungsdatei, um die aktuellen Daten zu ersetzen.';

  @override
  String get bkRestoreFromFile => 'Aus Sicherungsdatei wiederherstellen';

  @override
  String get bkExportCsv => 'Als CSV exportieren';

  @override
  String get bkExportSub => 'In Excel öffnen oder teilen.';

  @override
  String get bkRangeAll => 'Rechnungen/Ausgaben: gesamter Zeitraum';

  @override
  String bkRangeSome(String end, String start) {
    return 'Rechnungen/Ausgaben: $start bis $end';
  }

  @override
  String get bkSetRange => 'Zeitraum festlegen';

  @override
  String get bkClearRange => 'Zeitraum löschen';

  @override
  String get ntNever => 'Nie ausgelöst';

  @override
  String get ntJustNow => 'Gerade eben';

  @override
  String ntMinutesAgo(int count) {
    return 'vor $count Min.';
  }

  @override
  String ntHoursAgo(int count) {
    return 'vor $count Std.';
  }

  @override
  String ntDaysAgo(int count) {
    return 'vor $count T.';
  }

  @override
  String get ntTitle => 'Intelligente Benachrichtigungen';

  @override
  String get ntTapHint => 'Tippen Sie auf „Jetzt prüfen“, um eine Benachrichtigung auszulösen und Live-Ergebnisse zu sehen.';

  @override
  String get ntLowStockSub => 'Benachrichtigen, wenn Artikel unter ihren Nachbestellstand fallen.';

  @override
  String get ntCheckNow => 'Jetzt prüfen';

  @override
  String get ntOverdue => 'Erinnerungen an überfällige Zahlungen';

  @override
  String get ntOverdueSub => 'Über unbezahlte Rechnungen der Vortage benachrichtigen.';

  @override
  String get ntDaily => 'Tägliche Geschäftsübersicht';

  @override
  String get ntDailySub => 'Gestrige Verkäufe, Einnahmen und Gewinn auf einen Blick.';

  @override
  String get ntSendSummary => 'Übersicht senden';

  @override
  String get ntRunning => 'Läuft…';

  @override
  String get ntLowStockItems => 'Artikel mit niedrigem Bestand';

  @override
  String get ntSales => 'Verkäufe';

  @override
  String get ntCollected => 'Eingezogen';

  @override
  String get ntProfit => 'Gewinn';

  @override
  String get auChecking => 'Suche nach Updates…';

  @override
  String get auLatest => 'Sie haben die neueste Version.';

  @override
  String get auAvailable => 'Update verfügbar';

  @override
  String auNewer(int code) {
    return 'Eine neuere Version von Book-Keep (Build $code) ist bereit.';
  }

  @override
  String get auLater => 'Später';

  @override
  String get auUpdate => 'Aktualisieren';

  @override
  String get auDownloading => 'Update wird heruntergeladen';

  @override
  String auSaved(String name) {
    return '$name wurde in Ihrem Download-Ordner gespeichert.';
  }

  @override
  String get auAllowInstall => 'Erlauben Sie Book-Keep, Apps zu installieren, und tippen Sie dann erneut auf Aktualisieren.';

  @override
  String get auFailed => 'Update fehlgeschlagen — Verbindung prüfen und erneut versuchen.';

  @override
  String get lgSearch => 'Sprachen suchen';

  @override
  String lgNoMatch(String query) {
    return 'Keine Sprachen passend zu \"$query\"';
  }

  @override
  String get alVoided => 'Hat eine Rechnung storniert';

  @override
  String get alDeletedBill => 'Hat eine Rechnung gelöscht';

  @override
  String get alReturned => 'Hat eine Rechnung zurückgegeben';

  @override
  String get alDeletedCustomer => 'Hat einen Kunden gelöscht';

  @override
  String get alDeletedSupplier => 'Hat einen Lieferanten gelöscht';

  @override
  String get alCreatedAccount => 'Hat ein Konto erstellt';

  @override
  String get alUpdatedAccount => 'Hat ein Konto aktualisiert';

  @override
  String get alDeletedAccount => 'Hat ein Konto gelöscht';

  @override
  String get alTitle => 'Aktivitätsprotokoll';

  @override
  String get alNone => 'Noch keine Aktivität erfasst';

  @override
  String get blkEnterOne => 'Geben Sie mindestens einen Artikel ein';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Artikel erfolgreich hinzugefügt',
      one: '1 Artikel erfolgreich hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Artikel gesammelt hinzufügen';

  @override
  String get blkFormat => 'Ein Artikel pro Zeile, Format: Name, Preis, Einheit, Kategorie';

  @override
  String get blkOptional => 'Einheit und Kategorie sind optional (Standard: piece, keine)';

  @override
  String get blkAddAll => 'Alle Artikel hinzufügen';

  @override
  String get prSend => 'Zahlungserinnerung senden';

  @override
  String get prTone => 'Ton wählen:';

  @override
  String get prPolite => 'Höflich';

  @override
  String get prStandard => 'Standard';

  @override
  String get prUrgent => 'Dringend';

  @override
  String get prPreviewQr => 'JazzCash-Zahlungs-QR anzeigen';

  @override
  String get prShareText => 'Text teilen';

  @override
  String get dsRemaining => 'Offen';

  @override
  String dsIncludesDiscount(String amount) {
    return 'inkl. $amount Rabatt';
  }

  @override
  String get dsItems => 'Artikel';

  @override
  String get dsDiscount => 'Rabatt';

  @override
  String get lkWrongPin => 'Falsche PIN';

  @override
  String get lkEnterPin => 'PIN eingeben';

  @override
  String get lkChecking => 'Fingerabdruck wird geprüft...';

  @override
  String get bcTitle => 'Barcode scannen';

  @override
  String get bcTorchNa => 'Taschenlampe auf diesem Gerät nicht verfügbar';

  @override
  String get bcTorch => 'Taschenlampe';

  @override
  String get bcPoint => 'Richten Sie die Kamera auf einen Barcode';

  @override
  String get qrNoNumber => 'Keine JazzCash-Nummer hinterlegt. Legen Sie sie in den Einstellungen fest, um einen Zahlungs-QR-Code anzuzeigen.';

  @override
  String get qrPay => 'Mit JazzCash bezahlen';

  @override
  String get qrInvalid => 'Ungültige QR-Daten';

  @override
  String qrAmount(String amount) {
    return 'Betrag: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'JazzCash-Nummer kopieren';

  @override
  String get qrCopied => 'JazzCash-Nummer in die Zwischenablage kopiert';

  @override
  String get qrHint => 'Scannen oder kopieren Sie diese Nummer in Ihrer JazzCash-App, um zu bezahlen.';

  @override
  String clOwed(String amount) {
    return '$amount offen';
  }

  @override
  String get lnEnterEmailFirst => 'Geben Sie oben zuerst eine gültige E-Mail-Adresse ein.';

  @override
  String get lnResetSent => 'E-Mail zum Zurücksetzen des Passworts gesendet — prüfen Sie Ihren Posteingang.';

  @override
  String get lnNoAccount => 'Für diese E-Mail-Adresse wurde kein Konto gefunden.';

  @override
  String get lnWrongPassword => 'Falsches Passwort.';

  @override
  String get lnInvalidEmail => 'Das sieht nicht nach einer gültigen E-Mail-Adresse aus.';

  @override
  String get lnDisabled => 'Dieses Konto wurde deaktiviert.';

  @override
  String get lnTooMany => 'Zu viele Versuche — bitte in einer Minute erneut versuchen.';

  @override
  String get lnNoInternet => 'Keine Internetverbindung.';

  @override
  String get lnWeakPassword => 'Das Passwort muss mindestens 6 Zeichen lang sein.';

  @override
  String get lnCouldNotSignIn => 'Anmeldung fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get lnWrongPasswordHint => 'Falsches Passwort. Erneut versuchen oder auf „Passwort vergessen?“ tippen.';

  @override
  String get lnWrongEmail => 'Falsche E-Mail-Adresse — kein Konto verwendet diese Adresse.';

  @override
  String get lnWrongEmailOrPassword => 'Falsche E-Mail-Adresse oder falsches Passwort.';

  @override
  String get lnWrongUsername => 'Falscher Benutzername — kein Konto verwendet diesen Namen.';

  @override
  String get lnWelcome => 'Willkommen zurück';

  @override
  String lnSignInTo(String app) {
    return 'Bei $app anmelden';
  }

  @override
  String get lnEmailOrUsername => 'E-Mail oder Benutzername';

  @override
  String get lnRemember => 'Angemeldet bleiben';

  @override
  String get lnForgot => 'Passwort vergessen?';

  @override
  String get lnSignIn => 'Anmelden';

  @override
  String get lnGoogle => 'Weiter mit Google';

  @override
  String get lnNew => 'Neu hier?';

  @override
  String get lnCreate => 'Konto erstellen';

  @override
  String suCreated(String email) {
    return 'Konto für $email erstellt. Eine Bestätigungs-E-Mail wurde gesendet (optional).';
  }

  @override
  String suSetup(String app) {
    return '$app einrichten';
  }

  @override
  String get suName => 'Name';

  @override
  String get suEmail => 'E-Mail';

  @override
  String suPhoneDigits(int digits) {
    return 'Geben Sie eine gültige $digits-stellige Nummer ein';
  }

  @override
  String get suCreateBtn => 'Konto erstellen';

  @override
  String get suHaveAccount => 'Sie haben bereits ein Konto?';

  @override
  String get suAlreadyExists => 'Für diese E-Mail-Adresse existiert bereits ein Konto.';

  @override
  String get suInvalidEmail => 'Ungültige E-Mail-Adresse.';

  @override
  String get agShow => 'Passwort anzeigen';

  @override
  String get agHide => 'Passwort verbergen';

  @override
  String get adAccounts => 'Konten';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registrierte Konten',
      one: '1 registriertes Konto',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Hinzufügen';

  @override
  String get adNoAccounts => 'Keine Konten gefunden.';

  @override
  String get adAccountability => 'Nachvollziehbarkeit';

  @override
  String get adAccountabilitySub => 'Wer etwas storniert, gelöscht oder zurückgegeben hat, und Kontoänderungen.';

  @override
  String get adActivitySub => 'Stornierte Rechnungen, Löschungen, Kontoänderungen';

  @override
  String get adServer => 'Server';

  @override
  String get adServerSub => 'Mit wem diese App spricht. Muss nach der Einrichtung selten geändert werden.';

  @override
  String get adServerHint => 'Der Emulator nutzt 10.0.2.2; ein echtes Telefon braucht die IP des Laptops im selben WLAN. Eine Änderung betrifft alle Konten.';

  @override
  String get adApiBase => 'API-Basis-URL';

  @override
  String get adSaveServer => 'Serveradresse speichern';

  @override
  String get adEmailSetSub => 'Eingerichtet — Mitarbeiter können Kunden Rechnungen/Kontoauszüge per E-Mail senden.';

  @override
  String get adNotSetUp => 'Noch nicht eingerichtet.';

  @override
  String get adEmailSetBody => 'E-Mail ist eingerichtet. Mitarbeiter können Rechnungen oder Kontoauszüge direkt an Kunden mailen.';

  @override
  String get adEmailHelp => 'Eine Gmail-Adresse funktioniert mit einem App-Passwort (smtp.gmail.com, Port 587), oder verwenden Sie die SMTP-Daten Ihres E-Mail-Anbieters.';

  @override
  String get adSmtpHost => 'SMTP-Host';

  @override
  String get adSmtpPort => 'SMTP-Port';

  @override
  String get adEmailAddress => 'E-Mail-Adresse';

  @override
  String get adPwKeep => 'Passwort (leer lassen, um das aktuelle zu behalten)';

  @override
  String get adPwApp => 'Passwort (App-Passwort, nicht Ihr Anmeldepasswort)';

  @override
  String get adFromName => 'Absendername (optional)';

  @override
  String get adFromHint => 'Mein Eisenwarenladen';

  @override
  String get adSaving => 'Wird gespeichert...';

  @override
  String get adSaveEmail => 'E-Mail-Einstellungen speichern';

  @override
  String get adAddAccount => 'Konto hinzufügen';

  @override
  String get adNameOpt => 'Name (optional)';

  @override
  String get adAtLeast6 => 'Mindestens 6 Zeichen';

  @override
  String get adGrantAdmin => 'Admin-Rechte geben';

  @override
  String get adCanManage => 'Darf stornieren/löschen/zurückgeben';

  @override
  String get adCanManageHint => 'Eine Rechnung stornieren oder löschen, eine Rechnung zurückgeben oder einen Kunden/Lieferanten löschen. Ein Admin hat das immer.';

  @override
  String get adCreate => 'Erstellen';

  @override
  String get adAccountCreated => 'Konto erstellt.';

  @override
  String adCreateFailed(String error) {
    return 'Erstellen fehlgeschlagen: $error';
  }

  @override
  String get adEditAccount => 'Konto bearbeiten';

  @override
  String get adAdminSwitch => 'Admin';

  @override
  String get adAdminHint => 'Darf das Admin-Panel öffnen';

  @override
  String get adDisabled => 'Deaktiviert';

  @override
  String get adDisabledHint => 'Anmeldung gesperrt';

  @override
  String get adAccountUpdated => 'Konto aktualisiert.';

  @override
  String adUpdateFailed(String error) {
    return 'Aktualisierung fehlgeschlagen: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label wird dauerhaft entfernt und kann sich nicht mehr anmelden.';
  }

  @override
  String get adAccountDeleted => 'Konto gelöscht.';

  @override
  String adDeleteFailed(String error) {
    return 'Löschen fehlgeschlagen: $error';
  }

  @override
  String get adBadgeAdmin => 'ADMIN';

  @override
  String get adBadgeDisabled => 'DEAKTIVIERT';

  @override
  String get adOff => 'Admin-Panel ist aus';

  @override
  String get adCheckAgain => 'Erneut prüfen';

  @override
  String get adAccessRequired => 'Admin-Zugriff erforderlich';

  @override
  String get adAccessBody => 'Nur Shop-Admins können Konten verwalten. Bitten Sie den Inhaber, Ihnen Admin-Zugriff zu geben.';

  @override
  String get adCouldNotLoad => 'Das Admin-Panel konnte nicht geladen werden.';

  @override
  String get adBadPort => 'Geben Sie eine gültige SMTP-Portnummer ein.';

  @override
  String get adEmailSaved => 'E-Mail-Einstellungen gespeichert.';

  @override
  String adEmailSaveFailed(String error) {
    return 'E-Mail-Einstellungen konnten nicht gespeichert werden: $error';
  }

  @override
  String get adServerEmpty => 'Die Serveradresse darf nicht leer sein.';

  @override
  String get adServerSaved => 'Serveradresse gespeichert. Die Bildschirme verwenden sie beim nächsten Laden.';

  @override
  String get lnOr => 'oder';

  @override
  String get scNotABill => 'Das sieht nicht nach einer Rechnung aus. Versuch es noch mal mit einem scharfen Foto der Rechnung.';

  @override
  String get scNotAnInvoice => 'Das sieht nicht nach einer Rechnung aus. Versuch es noch mal mit einem scharfen Foto der Lieferantenrechnung.';

  @override
  String get jqOpenFull => 'Vollbild';

  @override
  String get jqCopy => 'Nummer kopieren';

  @override
  String get jqSheetTitle => 'JazzCash-QR';

  @override
  String get jqSheetHint => 'Kunden scannen das in ihrer JazzCash-App, um dich zu bezahlen.';

  @override
  String get jqCheck => 'Nummer prüfen';

  @override
  String get askVoice => 'Stimme';

  @override
  String get askVoiceFallbackNote => 'Wird mit der Stimme Ihres Handys vorgelesen.';

  @override
  String get askPace => 'Tempo';

  @override
  String get askTone => 'Ton';

  @override
  String get askPaceSlower => 'Langsamer';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Schneller';

  @override
  String get askToneCalm => 'Ruhig';

  @override
  String get askToneWarm => 'Herzlich';

  @override
  String get askToneCheerful => 'Fröhlich';

  @override
  String qPaymentUpdate(String amount) {
    return 'Zahlungsaktualisierung: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Kunde: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Lieferant: $name';
  }

  @override
  String qItem(String name) {
    return 'Artikel: $name';
  }

  @override
  String qExpense(String name) {
    return 'Ausgabe: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Einkauf: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Zahlung erhalten: $amount von $name';
  }

  @override
  String gstAmount(String amount) {
    return 'MwSt. $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Steuerpflichtig $taxable  ·  MwSt. $tax  ·  Gesamt $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Umsatz: $revenue  •  Warenkosten: $cogs  •  Ausgaben: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Hallo $customer, freundliche Grüße von $shop! Ihr offener Gesamtbetrag beträgt $amount. Vielen Dank!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Hallo $customer, Zahlungserinnerung von $shop für den offenen Betrag von $amount. Bitte begleichen Sie ihn baldmöglichst.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'DRINGENDER HINWEIS: Sehr geehrte/r $customer, Ihre offene Zahlung von $amount bei $shop steht aus. Bitte begleichen Sie sie umgehend.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Zahlen mit JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Rechnung von $shop\nGesamt: $total\nArtikel: $items\nStatus: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Hallo $supplier, hier ist $shop. Wir möchten Folgendes bestellen:\n$lines\n\nBitte bestätigen Sie Verfügbarkeit und Preis. Vielen Dank.';
  }

  @override
  String ppUpdated(String date) {
    return 'Zuletzt aktualisiert: $date';
  }

  @override
  String get ppWhoH => 'Wer wir sind';

  @override
  String ppWho(String owner, String email) {
    return '$owner, Betreiber von Book-keep.\nKontakt: $email';
  }

  @override
  String get ppCollectH => 'Was wir erfassen';

  @override
  String get ppCollectAccount => 'Konto: E-Mail-Adresse, Telefonnummer und Benutzername über Firebase Authentication.';

  @override
  String get ppCollectShop => 'Shop-Profil: Shopname, Adresse, Telefonnummer, JazzCash-Nummer und Shop-Logo – vom Shopinhaber in den Einstellungen eingegeben.';

  @override
  String get ppCollectRecords => 'Geschäftsdaten, die Sie erstellen: Namen und Telefonnummern von Kunden und Lieferanten, Rechnungen, Einkäufe, Artikelkatalog (einschließlich Artikelfotos und Barcodes) und Ausgaben (einschließlich Belegfotos). Das sind die Kerndaten der App – so funktioniert Buchhaltung.';

  @override
  String get ppCollectDevice => 'Geräte- und Diagnosedaten: ein Push-Benachrichtigungs-Token (für Warnungen bei niedrigem Bestand, überfälligen Zahlungen und tägliche Zusammenfassungen) sowie Absturzberichte (Geräteinfos und Stack-Traces) über Firebase Crashlytics, die bei einem Absturz automatisch gesendet werden.';

  @override
  String ppCollectAi(String askShop) {
    return 'KI-Funktionen: $askShop, das KI-Morgenbriefing und der KI-Scanner für Rechnungen/Einkäufe senden eine Momentaufnahme der relevanten Geschäftsdaten (Berichtszahlen oder ein Foto einer Rechnung) an die Gemini-API von Google, um eine Antwort, eine Zusammenfassung oder extrahierte Positionen zu erzeugen. Google verarbeitet diese Daten, um die Antwort zu erstellen; weder wir noch Google verwenden sie zum Training von Modellen, außer im Rahmen der Standard-API-Bedingungen von Google.';
  }

  @override
  String get ppDontH => 'Was wir nicht tun';

  @override
  String get ppDontLocation => 'Wir verfolgen Ihren Standort nicht.';

  @override
  String get ppDontAds => 'Wir verwenden keine Werbenetzwerke und keine Verhaltensanalyse- oder Session-Replay-Tools.';

  @override
  String get ppDontSell => 'Wir verkaufen weder Ihre Daten noch die Daten Ihrer Kunden an Dritte.';

  @override
  String get ppWhereH => 'Wo die Daten liegen';

  @override
  String get ppWhereDb => 'Datenbank: Neon (Postgres), ein Cloud-Datenbankanbieter.';

  @override
  String get ppWhereFirebase => 'Authentifizierung, Push-Benachrichtigungen, Absturzberichte, Fotospeicher: Firebase (Google).';

  @override
  String get ppWhereAi => 'KI-Verarbeitung: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Rechnungs-E-Mails: werden über das SMTP-Konto versendet, das der Admin Ihres Shops im Bereich $adminPanel einrichtet – wir betreiben keinen Verteiler, und diese E-Mails sind individuelle Rechnungen/Kontoauszüge an Ihre eigenen Kunden, keine Massenwerbung.';
  }

  @override
  String get ppYoursH => 'Ihre Daten, die Daten Ihrer Kunden';

  @override
  String get ppYours => 'Alles, was Sie eingeben – Kunden, Lieferanten, Rechnungen, Artikel – gehört Ihrem Shop. Andere Shops, die Book-keep nutzen, können es nicht sehen. Mitarbeiterkonten, die Sie für Ihren Shop anlegen, sehen nur das, wofür Sie ihnen Zugriff geben.';

  @override
  String get ppControlsH => 'Ihre Kontrollmöglichkeiten';

  @override
  String ppControlExport(String path) {
    return 'Daten exportieren oder sichern: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Konto löschen: $path. Dadurch wird nur Ihre Anmeldung entfernt – die Geschäftsdaten Ihres Shops (Rechnungen, Kunden, Artikel usw.) werden nicht gelöscht, genauso wie das Entfernen eines Mitarbeiters dessen erstellte Datensätze nicht löscht.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Benachrichtigungen: können pro Typ ausgeschaltet werden unter $path.';
  }

  @override
  String get ppChildrenH => 'Kinder';

  @override
  String get ppChildren => 'Book-keep ist ein Geschäftswerkzeug für Shopinhaber und Mitarbeiter. Es richtet sich nicht an Kinder und wird nicht wissentlich von ihnen genutzt.';

  @override
  String get ppChangesH => 'Änderungen an dieser Richtlinie';

  @override
  String get ppChanges => 'Wenn sich ändert, was wir erfassen oder wohin es geht, aktualisieren wir diese Seite und ändern das Datum oben.';

  @override
  String get ppContactH => 'Kontakt';

  @override
  String ppContact(String email) {
    return 'Fragen zu dieser Richtlinie oder Ihren Daten: $email';
  }

  @override
  String get waHello => 'Hallo!';

  @override
  String waHelloNamed(String name) {
    return 'Hallo $name,';
  }

  @override
  String get gstTaxable => 'Steuerpflichtig';

  @override
  String get gstTax => 'Steuer';

  @override
  String get gstTaxableValue => 'Steuerpflichtiger Wert';

  @override
  String get gstTotalTax => 'Steuer gesamt';

  @override
  String get gstTotalItc => 'Vorsteuer gesamt';

  @override
  String get gstExempt => 'Steuerfreie Umsätze';

  @override
  String get gstNetPayable => 'Zu zahlende Steuer (netto)';

  @override
  String get unknownName => 'Unbekannt';

  @override
  String get unitPiece => 'Stück';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'Meter';

  @override
  String get unitBox => 'Karton';

  @override
  String get unitDozen => 'Dutzend';

  @override
  String get unitLiter => 'Liter';

  @override
  String get unitBag => 'Sack';

  @override
  String deleteSupplierMessage(String name) {
    return '$name und alle zugehörigen Einkäufe löschen? Das kann nicht rückgängig gemacht werden.';
  }
}
