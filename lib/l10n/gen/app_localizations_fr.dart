// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get navHome => 'Accueil';

  @override
  String get navCustomers => 'Clients';

  @override
  String get navItems => 'Articles';

  @override
  String get navSuppliers => 'Fournisseurs';

  @override
  String get navReports => 'Rapports';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get settingsShopDetailsTitle => 'Détails de la Boutique';

  @override
  String get settingsShopDetailsSubtitle => 'Affiché sur vos factures.';

  @override
  String get settingsShopNameLabel => 'Nom de la Boutique';

  @override
  String get settingsShopAddressLabel => 'Adresse de la Boutique';

  @override
  String get settingsPhoneLabel => 'Téléphone';

  @override
  String get settingsSaveShopDetails => 'Enregistrer les Détails de la Boutique';

  @override
  String get settingsAppearanceTitle => 'Apparence';

  @override
  String get settingsAppearanceSubtitle => 'Choisissez un thème pour toute l\'application.';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get settingsLanguageTitle => 'Langue';

  @override
  String get settingsLanguageSubtitle => 'Choisissez la langue d\'affichage de l\'application.';

  @override
  String get sortNameNewest => 'Trier : Nom / Plus récent';

  @override
  String get addCustomer => 'Ajouter un client';

  @override
  String get importCsv => 'Importer un CSV';

  @override
  String get searchShop => 'Rechercher dans la boutique';

  @override
  String get scanToFindItem => 'Scanner pour trouver un article';

  @override
  String get bulkAdd => 'Ajout groupé';

  @override
  String get updateStock => 'Mettre à jour le stock';

  @override
  String get printLabels => 'Imprimer les étiquettes';

  @override
  String get mergeDuplicates => 'Fusionner les doublons';

  @override
  String get addSupplier => 'Ajouter un fournisseur';

  @override
  String get scanPurchaseInvoice => 'Scanner une facture d\'achat';

  @override
  String askNoAnswer(String reason) {
    return 'Impossible d\'obtenir une réponse : $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Connexion impossible : $error';
  }

  @override
  String get micPermissionNeeded => 'L\'autorisation du micro est nécessaire pour la saisie vocale.';

  @override
  String get speechUnavailable => 'La reconnaissance vocale n\'est pas disponible sur cet appareil.';

  @override
  String get askYourShop => 'Demandez à votre boutique';

  @override
  String get close => 'Fermer';

  @override
  String get askIntro => 'Envie de savoir comment va la boutique ? Demandez-moi, je réponds d’après vos livres.';

  @override
  String get askListening => 'Écoute…';

  @override
  String get askThinkingWords => 'Réflexion…|Au travail…|Calcul en cours…|Vérification des comptes…|Addition…|Analyse des chiffres…';

  @override
  String get askSayQuestion => 'Dites votre question — touchez l\'orbe pour annuler';

  @override
  String briefingRefreshFailed(int code) {
    return 'Impossible d\'actualiser le résumé ($code).';
  }

  @override
  String get refreshFailedOffline => 'Actualisation impossible — vérifiez votre connexion.';

  @override
  String get newBillFailed => 'Impossible de créer une facture — vérifiez votre connexion et réessayez.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Définissez d\'abord un fournisseur préféré pour $name (touchez pour modifier).';
  }

  @override
  String get reorderBySupplier => 'Recommander par fournisseur';

  @override
  String get supplier => 'Fournisseur';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articles',
      one: '1 article',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Aucun article en stock faible n\'a encore de fournisseur préféré.';

  @override
  String get thisSupplier => 'Ce fournisseur';

  @override
  String supplierNoPhone(String name) {
    return '$name n\'a pas de numéro de téléphone.';
  }

  @override
  String get tabOverview => 'Aperçu';

  @override
  String get tabStock => 'Stock';

  @override
  String get tabMoney => 'Argent';

  @override
  String get taglineOverview => 'Créances, stock et caisse du jour en un coup d\'œil.';

  @override
  String get taglineStock => 'Ce qui se vend, ce qui s\'épuise.';

  @override
  String get taglineMoney => 'Dépenses, rapprochement et encaissements.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Chargement du tableau de bord… $done sur $total';
  }

  @override
  String get dashboardLoadFailed => 'Impossible de charger le tableau de bord';

  @override
  String get checkConnectionRetry => 'Vérifiez votre connexion et réessayez.';

  @override
  String get retry => 'Réessayer';

  @override
  String get aiBriefing => 'Résumé IA';

  @override
  String get briefingPrompt => 'Voyez l\'activité d\'hier résumée en quelques phrases.';

  @override
  String get getBriefing => 'Obtenir le résumé';

  @override
  String get refreshBriefing => 'Actualiser le résumé';

  @override
  String updatedAt(String time) {
    return 'Mis à jour $time';
  }

  @override
  String get customersUnknown => '— clients';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clients',
      one: '1 client',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Mois précédent';

  @override
  String get nextMonth => 'Mois suivant';

  @override
  String get salesMonth => 'Ventes (mois)';

  @override
  String get outstanding => 'Impayés';

  @override
  String get profitMonth => 'Bénéfice (mois)';

  @override
  String get cashToday => 'Caisse du jour';

  @override
  String get newBill => 'Nouvelle facture';

  @override
  String get scanHandwrittenBill => 'Scanner une facture manuscrite';

  @override
  String get topOutstanding => 'Plus gros impayés';

  @override
  String viewAllInDues(int count) {
    return 'Voir les $count dans le Centre des créances';
  }

  @override
  String get lowStockAlerts => 'Alertes de stock faible';

  @override
  String get noLowStock => 'Aucun article en stock faible — tout va bien.';

  @override
  String get whatsappAll => 'WhatsApp à tous';

  @override
  String get reorderAll => 'Tout recommander';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Suggestion : recommander $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Reste $qty $unit';
  }

  @override
  String get reorder => 'Recommander';

  @override
  String get whatsappSupplier => 'WhatsApp au fournisseur';

  @override
  String get topItemsByRevenue => 'Meilleurs articles par chiffre d\'affaires';

  @override
  String get noSalesYet => 'Aucune vente enregistrée pour l\'instant.';

  @override
  String qtyLabel(String qty) {
    return 'Qté : $qty';
  }

  @override
  String get monthExpenses => 'Dépenses de ce mois';

  @override
  String get noExpensesMonth => 'Aucune dépense enregistrée ce mois-ci.';

  @override
  String get quickActions => 'Actions rapides';

  @override
  String get dailyCashReconciliation => 'Rapprochement de caisse quotidien';

  @override
  String get collectMoney => 'Encaisser';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count modifications enregistrées hors ligne',
      one: '1 modification enregistrée hors ligne',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Se synchronisera automatiquement une fois en ligne';

  @override
  String get syncing => 'Synchronisation';

  @override
  String get sync => 'Synchroniser';

  @override
  String get shopProfile => 'Profil de la boutique';

  @override
  String get insights => 'Aperçus';

  @override
  String get notifications => 'Notifications';

  @override
  String get backupExport => 'Sauvegarde et export';

  @override
  String get adminPanel => 'Panneau d\'administration';

  @override
  String get toolsSync => 'Outils et synchronisation';

  @override
  String get account => 'Compte';

  @override
  String get shopDetailsSaved => 'Informations de la boutique enregistrées.';

  @override
  String saveFailed(int code) {
    return 'Échec de l\'enregistrement ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Enregistrement impossible : $error';
  }

  @override
  String get logoUpdated => 'Logo mis à jour.';

  @override
  String logoUploadFailed(int code) {
    return 'Échec de l\'envoi du logo ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Impossible d\'envoyer le logo : $error';
  }

  @override
  String get healthGood => 'Tout va bien dans l\'ensemble.';

  @override
  String get healthSome => 'Quelques points méritent votre attention.';

  @override
  String get healthMany => 'Plusieurs points demandent votre attention.';

  @override
  String get shopHealth => 'Santé de la boutique';

  @override
  String get healthIntro => 'Un petit rappel, pas un rapport de plus.';

  @override
  String get couldNotLoadCheckConnection => 'Chargement impossible — vérifiez votre connexion.';

  @override
  String get itemPhotos => 'Photos d\'articles';

  @override
  String get barcodes => 'Codes-barres';

  @override
  String get lowStockItems => 'Articles en stock faible';

  @override
  String get lastBackup => 'Dernière sauvegarde';

  @override
  String get today => 'aujourd\'hui';

  @override
  String get yesterday => 'hier';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'il y a $days jours',
      one: 'il y a 1 jour',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'État hors ligne';

  @override
  String get online => 'En ligne';

  @override
  String get offline => 'Hors ligne';

  @override
  String get waitingToSync => 'En attente de synchronisation';

  @override
  String get syncNow => 'Synchroniser maintenant';

  @override
  String get searchSettings => 'Rechercher dans les paramètres';

  @override
  String noSettingsMatch(String query) {
    return 'Aucun paramètre ne correspond à \"$query\"';
  }

  @override
  String get businessInfo => 'INFOS DE L\'ENTREPRISE';

  @override
  String get payment => 'PAIEMENT';

  @override
  String get shopNameRequired => 'Le nom de la boutique est obligatoire';

  @override
  String phoneIncomplete(int digits) {
    return 'Saisissez un numéro de téléphone complet à $digits chiffres';
  }

  @override
  String get jazzcashOptional => 'Numéro JazzCash (facultatif)';

  @override
  String get saved => 'Enregistré !';

  @override
  String get languageSubtitle => 'Changer la langue de l\'application';

  @override
  String get notificationsSubtitle => 'Stock faible, paiements en retard et résumé quotidien';

  @override
  String get backupSubtitle => 'Télécharger, restaurer et exporter les données';

  @override
  String get appUpdate => 'Mise à jour de l\'app';

  @override
  String get appUpdateSubtitle => 'Rechercher une version plus récente';

  @override
  String get adminSubtitle => 'Gérer les comptes et les données de la boutique';

  @override
  String get accountSubtitle => 'Connexion, mot de passe et nom d\'utilisateur';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get privacySubtitle => 'Quelles données nous collectons et pourquoi';

  @override
  String get yourShop => 'Votre boutique';

  @override
  String get uploadingLogo => 'Envoi du logo de la boutique';

  @override
  String get logoTapToChange => 'Logo de la boutique, touchez pour changer';

  @override
  String get brandTagline => 'Boutique animée, comptes sereins.';

  @override
  String serverError(int code) {
    return 'Erreur du serveur : $code';
  }

  @override
  String get deleteCustomer => 'Supprimer le client';

  @override
  String deleteCustomerMessage(String name) {
    return 'Supprimer $name et toutes ses factures ? Action irréversible.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Suppression impossible : $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Suppression impossible — vérifiez votre connexion et réessayez.';

  @override
  String get actions => 'Actions';

  @override
  String get edit => 'Modifier';

  @override
  String get delete => 'Supprimer';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count clients',
      one: 'Supprimer 1 client',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count clients et toutes leurs factures ? Action irréversible.',
      one: 'Supprimer 1 client et toutes ses factures ? Action irréversible.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Tout désélectionner';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String selectedCount(int count) {
    return '$count sélectionné(s)';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get newTag => 'NOUVEAU';

  @override
  String get csvNeedsRows => 'Le CSV doit contenir une ligne d\'en-tête et au moins un client.';

  @override
  String get csvNeedsName => 'L\'en-tête du CSV doit inclure une colonne \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'Ligne $line : nom manquant — corrigez le fichier et réessayez.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Ligne $line : credit_limit invalide \"$value\" — corrigez le fichier et réessayez.';
  }

  @override
  String get importCustomers => 'Importer des clients';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clients trouvés dans \"$file\". Tous les importer ?',
      one: '1 client trouvé dans \"$file\". L\'importer ?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Importer';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clients importés.',
      one: '1 client importé.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Échec de l\'import : $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Échec de l\'import — connexion impossible : $error';
  }

  @override
  String get noPhone => 'Pas de téléphone';

  @override
  String get offlineShowingSaved => 'Hors ligne — affichage de la copie enregistrée';

  @override
  String get searchCustomersHint => 'Rechercher un client ou un téléphone...';

  @override
  String get noCustomersYet => 'Aucun client pour l\'instant. Touchez + pour en ajouter.';

  @override
  String get noCustomersMatch => 'Aucun client ne correspond à votre recherche.';

  @override
  String get owesMoney => 'Doit de l\'argent';

  @override
  String get settledUp => 'À jour';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'Impossible de charger $what : $error';
  }

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromGallery => 'Choisir dans la galerie';

  @override
  String get back => 'Retour';

  @override
  String callPhone(String phone) {
    return 'Appeler $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp $phone';
  }

  @override
  String get clearSearch => 'Effacer la recherche';

  @override
  String get askHint => 'ex. Quel bénéfice ai-je fait ce mois-ci ?';

  @override
  String get acctTurnOffLockTitle => 'Désactiver le verrouillage de l\'appli ?';

  @override
  String get acctTurnOffLockBody => 'Toute personne ayant ce téléphone pourra ouvrir l\'appli sans code PIN.';

  @override
  String get acctTurnOff => 'Désactiver';

  @override
  String get acctSetPinTitle => 'Définir un code PIN';

  @override
  String get acctPinLabel => 'Code PIN de 4 à 6 chiffres';

  @override
  String get acctPinMin => 'Au moins 4 chiffres';

  @override
  String get acctConfirmPin => 'Confirmer le code PIN';

  @override
  String get acctPinMismatch => 'Les codes PIN ne correspondent pas';

  @override
  String get acctSetPin => 'Définir le PIN';

  @override
  String get acctBiometricTitle => 'Utiliser aussi l\'empreinte/le visage ?';

  @override
  String get acctBiometricBody => 'Vous pourrez toujours utiliser le code PIN si la biométrie échoue.';

  @override
  String get acctNoThanks => 'Non merci';

  @override
  String get acctEnable => 'Activer';

  @override
  String get acctSetPasswordTitle => 'Définir un mot de passe';

  @override
  String get acctSetPasswordIntro => 'Choisissez un mot de passe pour pouvoir aussi vous connecter avec e-mail + mot de passe la prochaine fois, et pas seulement avec Google.';

  @override
  String get acctPassword => 'Mot de passe';

  @override
  String get acctPasswordMin => 'Doit contenir au moins 6 caractères';

  @override
  String get acctConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get acctPasswordsMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get acctSetPasswordButton => 'Définir le mot de passe';

  @override
  String get acctPasswordSet => 'Mot de passe défini — vous pouvez maintenant aussi vous connecter avec.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Impossible de définir le mot de passe : $error';
  }

  @override
  String get acctChangePasswordTitle => 'Changer le mot de passe';

  @override
  String get acctCurrentPassword => 'Mot de passe actuel';

  @override
  String get acctRequired => 'Obligatoire';

  @override
  String get acctNewPassword => 'Nouveau mot de passe';

  @override
  String get acctConfirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get acctChange => 'Changer';

  @override
  String get acctPasswordChanged => 'Mot de passe modifié.';

  @override
  String get acctWrongPassword => 'Le mot de passe actuel est incorrect.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Impossible de changer le mot de passe : $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Changer le nom d\'utilisateur';

  @override
  String get acctUsername => 'Nom d\'utilisateur';

  @override
  String get acctUsernameEmpty => 'Le nom d\'utilisateur ne peut pas être vide';

  @override
  String get acctUsernameChanged => 'Nom d\'utilisateur modifié.';

  @override
  String get acctChangeEmailTitle => 'Changer l\'e-mail';

  @override
  String get acctNewEmail => 'Nouvel e-mail';

  @override
  String get acctValidEmail => 'Saisissez un e-mail valide';

  @override
  String get acctRequiredConfirm => 'Requis pour confirmer votre identité';

  @override
  String get acctGoogleConfirmFirst => 'Vous devrez d\'abord confirmer avec Google.';

  @override
  String acctCheckEmail(String email) {
    return 'Consultez $email pour trouver le lien de confirmation du changement.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'la connexion par mot de passe';

  @override
  String acctRemoveTitle(String provider) {
    return 'Retirer $provider ?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Vous ne pourrez plus vous connecter à ce compte avec $provider.';
  }

  @override
  String get acctRemove => 'Retirer';

  @override
  String acctRemoved(String provider) {
    return '$provider retiré.';
  }

  @override
  String get acctSignedIn => 'Connecté';

  @override
  String get acctEmailNotVerified => 'E-mail pas encore vérifié.';

  @override
  String get acctVerificationSent => 'E-mail de vérification envoyé.';

  @override
  String get acctResend => 'Renvoyer';

  @override
  String get acctSectionSignIn => 'CONNEXION ET SÉCURITÉ';

  @override
  String get acctRowChangeUsername => 'Changer le nom d\'utilisateur';

  @override
  String get acctRowChangeEmail => 'Changer l\'e-mail';

  @override
  String get acctRowSetPassword => 'Définir un mot de passe';

  @override
  String get acctRowChangePassword => 'Changer le mot de passe';

  @override
  String get acctRowUnlinkGoogle => 'Dissocier Google';

  @override
  String get acctRowRemovePassword => 'Supprimer le mot de passe';

  @override
  String get acctRowAppLock => 'Verrouillage de l\'appli (PIN)';

  @override
  String get acctRowBiometric => 'Utiliser l\'empreinte/le visage';

  @override
  String get acctSignOutTitle => 'Se déconnecter ?';

  @override
  String get acctSignOutBody => 'Vous devrez vous reconnecter pour utiliser l\'appli.';

  @override
  String get acctSignOut => 'Se déconnecter';

  @override
  String get acctDeleteAccount => 'Supprimer le compte';

  @override
  String get acctDeleting => 'Suppression...';

  @override
  String get acctDeleteTitle => 'Supprimer le compte ?';

  @override
  String get acctDeleteBody => 'Cela supprime définitivement vos identifiants de connexion. Vous devrez vous réinscrire pour utiliser l\'appli. Cette action est irréversible.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Impossible de supprimer le compte : $error';
  }

  @override
  String get itmNotFoundTitle => 'Article introuvable';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Aucun article n\'a le code-barres $barcode. L\'ajouter maintenant comme nouvel article ?';
  }

  @override
  String get itmAddItem => 'Ajouter un article';

  @override
  String get itmEditItem => 'Modifier l\'article';

  @override
  String get itmMergeTitle => 'Fusionner les articles en double';

  @override
  String get itmMergeBody => 'Les articles portant le même nom seront fusionnés dans l\'entrée la plus ancienne et leurs stocks seront additionnés. Cette action est irréversible.';

  @override
  String get itmMerge => 'Fusionner';

  @override
  String get itmNoDuplicates => 'Aucun article en double trouvé.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articles en double fusionnés.',
      one: '1 article en double fusionné.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Supprimer l\'article';

  @override
  String get itmCannotUndo => 'Cette action est irréversible.';

  @override
  String get itmDeleteOffline => 'Suppression impossible — vérifiez votre connexion et réessayez.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count articles',
      one: 'Supprimer 1 article',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count articles ? Cette action est irréversible.',
      one: 'Supprimer 1 article ? Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Impossible d\'envoyer la photo ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Impossible d\'envoyer la photo : $error';
  }

  @override
  String get itmNoBarcodes => 'Aucun article n\'a encore de code-barres.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imprimer $count étiquettes',
      one: 'Imprimer 1 étiquette',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Rechercher un article ou une catégorie...';

  @override
  String get itmStopListening => 'Arrêter l\'écoute';

  @override
  String get itmVoiceSearch => 'Recherche vocale';

  @override
  String get itmSort => 'Trier';

  @override
  String get itmSortName => 'Nom (A-Z)';

  @override
  String get itmSortStockLow => 'Stock : du plus faible au plus élevé';

  @override
  String get itmSortRecent => 'Ajoutés récemment';

  @override
  String get itmFilterAll => 'Tous';

  @override
  String get itmFilterLowStock => 'Stock faible';

  @override
  String get itmNoItemsYet => 'Aucun article pour l\'instant. Appuyez sur + pour en ajouter.';

  @override
  String get itmNoItemsMatch => 'Aucun article ne correspond à votre recherche.';

  @override
  String get itmNoPriceChanges => 'Aucun changement de prix enregistré pour l\'instant.';

  @override
  String get itmNoStockCorrections => 'Aucune correction de stock enregistrée pour l\'instant.';

  @override
  String get itmResetHistory => 'Réinitialiser l\'historique';

  @override
  String get itmResetHistoryMsg => 'Réinitialiser l\'historique de cet article ? Cette action est irréversible.';

  @override
  String get itmSendPdf => 'Envoyer en PDF';

  @override
  String get itmNoteOptional => 'Note (facultatif)';

  @override
  String get itmNoteHint => 'Ajoutez une note pour ce changement';

  @override
  String get itmRemoveEntry => 'Retirer l\'entrée';

  @override
  String get itmRemoveEntryMsg => 'Retirer cette entrée de l\'historique ? Cette action est irréversible.';

  @override
  String get itmEditEntry => 'Modifier l\'entrée';

  @override
  String get itmPrevQty => 'Avant';

  @override
  String get itmNewQty => 'Après';

  @override
  String itmCost(String amount) {
    return 'Coût : $amount';
  }

  @override
  String get itmMore => 'Plus';

  @override
  String get itmMenuPrintLabel => 'Imprimer l\'étiquette';

  @override
  String get itmMenuDuplicate => 'Dupliquer';

  @override
  String get itmMenuPriceHistory => 'Historique des prix';

  @override
  String get itmMenuStockHistory => 'Historique des ajustements de stock';

  @override
  String itmLowStockBadge(int count) {
    return '$count en stock faible';
  }

  @override
  String itmStockLine(String qty) {
    return 'Stock : $qty';
  }

  @override
  String get itmOfflineSaved => 'Hors ligne — article enregistré sur cet appareil, il sera synchronisé automatiquement au retour de la connexion';

  @override
  String get itmItemName => 'Nom de l\'article';

  @override
  String get itmNameRequired => 'Le nom est obligatoire';

  @override
  String get itmPricePkr => 'Prix (PKR)';

  @override
  String get itmPriceRequired => 'Le prix est obligatoire';

  @override
  String get itmValidNumber => 'Saisissez un nombre valide';

  @override
  String get itmUnit => 'Unité';

  @override
  String get itmCategoryHint => 'Catégorie (facultatif, p. ex. Plomberie)';

  @override
  String get itmPreferredSupplier => 'Fournisseur préféré (facultatif)';

  @override
  String get itmPreferredSupplierHelper => 'Utilisé par le réapprovisionnement en un geste';

  @override
  String get itmClear => 'Effacer';

  @override
  String get itmHsn => 'Code HSN (facultatif)';

  @override
  String get itmGstRate => 'Taux de GST % (facultatif)';

  @override
  String get itmBarcodeOptional => 'Code-barres (facultatif)';

  @override
  String get itmScanOrType => 'Scanner ou saisir';

  @override
  String get itmScanBarcode => 'Scanner le code-barres';

  @override
  String get itmPurchaseCost => 'Coût d\'achat (par unité)';

  @override
  String get itmPurchaseCostHint => 'Ce que vous payez à l\'achat du stock';

  @override
  String get itmWholesale => 'Prix de gros (facultatif)';

  @override
  String get itmContractor => 'Prix artisan (facultatif)';

  @override
  String get itmFallsBack => 'À défaut, le prix normal s\'applique';

  @override
  String get itmStockQty => 'Quantité en stock';

  @override
  String get itmLowStockAlert => 'Alerte de stock faible en dessous de';

  @override
  String get itmFrequently => 'Souvent acheté avec';

  @override
  String get itmSaveChanges => 'Enregistrer les modifications';

  @override
  String get itmSaveItem => 'Enregistrer l\'article';

  @override
  String get itmPhotoSemantics => 'Photo de l\'article, appuyez pour la changer';

  @override
  String get cdUpdateStatusTitle => 'Mettre à jour le statut de paiement';

  @override
  String get cdMarkPaidQ => 'Marquer cette facture comme payée ?';

  @override
  String get cdMarkUnpaidQ => 'Marquer cette facture comme impayée ?';

  @override
  String get cdConfirm => 'Confirmer';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Mise à jour impossible : $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Hors ligne — modification enregistrée sur cet appareil, elle sera synchronisée automatiquement au retour de la connexion';

  @override
  String get cdConvertTitle => 'Convertir en facture';

  @override
  String get cdConvertBody => 'Cela déduira le stock de ces articles et transformera le devis en vraie facture. Continuer ?';

  @override
  String get cdConvert => 'Convertir';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Conversion impossible : $detail';
  }

  @override
  String get cdReturnItems => 'Retourner des articles';

  @override
  String get cdReturnHint => 'Indiquez la quantité à retourner pour chaque article. Laissez 0 pour le garder vendu.';

  @override
  String get cdDecreaseQty => 'Diminuer la quantité';

  @override
  String get cdIncreaseQty => 'Augmenter la quantité';

  @override
  String get cdCreditTotal => 'Total de l\'avoir';

  @override
  String get cdReturnSelected => 'Retourner la sélection';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Retour impossible : $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Annulation impossible : $detail';
  }

  @override
  String get cdNoPreviousBill => 'Aucune facture précédente à répéter';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Impossible de charger la dernière facture : $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Facture envoyée par e-mail au client.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Impossible d\'envoyer la facture par e-mail : $detail';
  }

  @override
  String get cdStatementEmailed => 'Relevé envoyé par e-mail au client.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Impossible d\'envoyer le relevé par e-mail : $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Supprimer la facture';

  @override
  String get cdBillVoided => 'ANNULÉE';

  @override
  String get cdBillReturn => 'RETOUR';

  @override
  String get cdBillQuote => 'DEVIS';

  @override
  String get cdBillPaid => 'PAYÉE';

  @override
  String get cdBillPartial => 'PARTIELLE';

  @override
  String get cdBillUnpaid => 'IMPAYÉE';

  @override
  String get cdBill => 'Facture';

  @override
  String cdVoidedReason(String reason) {
    return 'Annulée : $reason';
  }

  @override
  String get cdViewInvoice => 'Voir la facture';

  @override
  String get cdEmailInvoice => 'Envoyer la facture par e-mail';

  @override
  String get cdEditBill => 'Modifier la facture';

  @override
  String get cdReturnBill => 'Retourner la facture';

  @override
  String get cdVoidBill => 'Annuler la facture';

  @override
  String get cdNoItems => 'Aucun article';

  @override
  String get cdRepeatLast => 'Répéter la dernière facture';

  @override
  String get cdLedgerPdf => 'PDF du grand livre';

  @override
  String get cdEmailStatement => 'Envoyer le relevé par e-mail';

  @override
  String get cdCollectPayment => 'Encaisser un paiement';

  @override
  String get cdSendReminder => 'Envoyer un rappel WhatsApp';

  @override
  String get cdTotalBilled => 'Total facturé';

  @override
  String get cdPaid => 'Payé';

  @override
  String get cdNoBills => 'Aucune facture pour l\'instant';

  @override
  String get cdBillActions => 'Actions de la facture';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding sur $limit de limite de crédit utilisés';
  }

  @override
  String get cdVoidBody => 'Elle sera retirée des soldes et des rapports, mais conservée dans l\'historique. Le stock sera rétabli. Cette action est irréversible.';

  @override
  String get cdReason => 'Motif (facultatif)';

  @override
  String get frmOfflineCustomer => 'Hors ligne — client enregistré sur cet appareil, il sera synchronisé automatiquement au retour de la connexion';

  @override
  String get frmOfflineSupplier => 'Hors ligne — fournisseur enregistré sur cet appareil, il sera synchronisé automatiquement au retour de la connexion';

  @override
  String get frmEditCustomer => 'Modifier le client';

  @override
  String get frmCustomerName => 'Nom du client';

  @override
  String get frmPhoneOptional => 'Téléphone (facultatif)';

  @override
  String get frmCreditLimit => 'Limite de crédit (PKR, facultatif)';

  @override
  String get frmCreditHelper => 'Avertir quand le solde de ce client dépasse cette valeur';

  @override
  String get frmPriceTier => 'Niveau de prix';

  @override
  String get frmRetail => 'Détail';

  @override
  String get frmWholesale => 'Gros';

  @override
  String get frmContractor => 'Artisan';

  @override
  String get frmPriceTierHelper => 'Quel prix d\'article est prérempli dans la facture pour ce client';

  @override
  String get frmStrn => 'STRN (facultatif)';

  @override
  String get frmStrnCustomer => 'Numéro d\'immatriculation à la taxe de vente à 13 chiffres pour les factures';

  @override
  String get frmStrnSupplier => 'Numéro d\'immatriculation à la taxe de vente à 13 chiffres pour les factures d\'achat';

  @override
  String get frmAddress => 'Adresse (facultatif)';

  @override
  String get frmEmail => 'E-mail (facultatif)';

  @override
  String get frmEmailHelper => 'Permet d\'envoyer une facture ou un relevé par e-mail à ce client';

  @override
  String get frmSaveCustomer => 'Enregistrer le client';

  @override
  String get frmEditSupplier => 'Modifier le fournisseur';

  @override
  String get frmSupplierName => 'Nom du fournisseur';

  @override
  String get frmSaveSupplier => 'Enregistrer le fournisseur';

  @override
  String get sdDeletePurchaseTitle => 'Supprimer l\'achat';

  @override
  String get sdDeletePurchaseBody => 'Le stock de cet achat sera rétabli. Cette action est irréversible.';

  @override
  String get sdReturnToSupplier => 'Retourner au fournisseur';

  @override
  String get sdReturnHint => 'Indiquez la quantité à renvoyer pour chaque article. Laissez 0 pour le garder.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Impossible de marquer comme reçu : $detail';
  }

  @override
  String get sdMarkPaidQ => 'Marquer cet achat comme payé ?';

  @override
  String get sdMarkUnpaidQ => 'Marquer cet achat comme impayé ?';

  @override
  String get sdTotalPurchased => 'Total acheté';

  @override
  String get sdPayable => 'À payer';

  @override
  String sdPayableAmount(String amount) {
    return '$amount à payer';
  }

  @override
  String get sdNoPurchases => 'Aucun achat pour l\'instant';

  @override
  String get sdPo => 'BC';

  @override
  String get sdDraftPo => 'BC BROUILLON';

  @override
  String get sdPurchase => 'Achat';

  @override
  String get sdDraftNote => 'Bon de commande brouillon — pas encore reçu, aucune mise à jour du stock ni du coût pour l\'instant.';

  @override
  String get sdReturnNote => 'Retour / avoir au fournisseur.';

  @override
  String get sdMarkReceived => 'Marquer comme reçu';

  @override
  String get sdEditPurchase => 'Modifier l\'achat';

  @override
  String get sdPurchaseActions => 'Actions de l\'achat';

  @override
  String get slDeleteSupplier => 'Supprimer le fournisseur';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count fournisseurs',
      one: 'Supprimer 1 fournisseur',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count fournisseurs et tous leurs achats ? Cette action est irréversible.',
      one: 'Supprimer 1 fournisseur et tous ses achats ? Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'Le CSV doit contenir une ligne d\'en-tête et au moins un fournisseur.';

  @override
  String get slImportTitle => 'Importer des fournisseurs';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fournisseurs trouvés dans \"$file\". Tous les importer ?',
      one: '1 fournisseur trouvé dans \"$file\". Tous les importer ?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fournisseurs importés.',
      one: '1 fournisseur importé.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Aucun fournisseur pour l\'instant. Appuyez sur + pour en ajouter.';

  @override
  String get slSearchHint => 'Rechercher un fournisseur ou un téléphone...';

  @override
  String get slNoMatch => 'Aucun fournisseur ne correspond à votre recherche.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fournisseurs',
      one: '1 fournisseur',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Dettes fournisseurs';

  @override
  String get sduNothingOwed => 'Rien à payer aux fournisseurs 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fournisseurs à payer',
      one: '1 fournisseur à payer',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours depuis l\'achat impayé le plus ancien',
      one: '1 jour depuis l\'achat impayé le plus ancien',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 jours';

  @override
  String get duBucket1 => '30–60 jours';

  @override
  String get duBucket2 => '60+ jours';

  @override
  String get duTitle => 'Centre des créances';

  @override
  String get duNoDues => 'Aucune créance en cours 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clients avec des créances',
      one: '1 client avec des créances',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours depuis la facture impayée la plus ancienne',
      one: '1 jour depuis la facture impayée la plus ancienne',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount dû';
  }

  @override
  String get cpNoOutstanding => 'Ce client n\'a aucun solde dû';

  @override
  String get cpValidAmount => 'Saisissez un montant valide';

  @override
  String cpExceeds(String amount) {
    return 'Le montant dépasse le solde dû de $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$amount encaissés auprès de $name';
  }

  @override
  String get cpOfflineSaved => 'Hors ligne — paiement enregistré sur cet appareil, il sera synchronisé automatiquement au retour de la connexion';

  @override
  String cpOwes(String amount, String name) {
    return '$name doit $amount. Imputé d\'abord sur sa ou ses plus anciennes factures impayées.';
  }

  @override
  String get cpAmountLabel => 'Montant encaissé (PKR)';

  @override
  String get cpCollect => 'Encaisser';

  @override
  String get usNoItems => 'Aucun article à mettre à jour.';

  @override
  String get usHelp => 'Définissez le nouveau stock de chaque article, puis appuyez sur Tout enregistrer.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  actuel : $qty';
  }

  @override
  String usNew(String qty) {
    return 'nouveau : $qty';
  }

  @override
  String get usSubtract => 'Retirer 1';

  @override
  String get usAdd => 'Ajouter 1';

  @override
  String get usNoChanges => 'Aucun changement';

  @override
  String usSaveAll(int count) {
    return 'Tout enregistrer ($count modifiés)';
  }

  @override
  String get srHint => 'Rechercher clients, articles, montants...';

  @override
  String get srFailed => 'Échec de la recherche — vérifiez votre connexion.';

  @override
  String get srTitle => 'Recherchez dans votre boutique';

  @override
  String get srSubtitle => 'Trouvez des clients par nom ou téléphone, des factures par montant.';

  @override
  String srNoMatches(String query) {
    return 'Aucun résultat pour \"$query\"';
  }

  @override
  String get srTryDifferent => 'Essayez un autre nom, numéro de téléphone ou montant.';

  @override
  String get srBills => 'Factures';

  @override
  String get srNoItemList => 'Aucune liste d\'articles';

  @override
  String get abAddAtLeastOne => 'Ajoutez au moins un article';

  @override
  String get abQuotationUpdated => 'Devis mis à jour !';

  @override
  String get abBillUpdated => 'Facture mise à jour !';

  @override
  String get abQuotationSaved => 'Devis enregistré !';

  @override
  String get abBillCreated => 'Facture créée avec succès !';

  @override
  String abTotalAmount(String amount) {
    return 'Total : $amount';
  }

  @override
  String get abShare => 'Partager';

  @override
  String get abDoneReturn => 'Terminé et retour';

  @override
  String get abOverLimitBody => 'Cela ferait dépasser sa limite de crédit au client.';

  @override
  String get abOverLimitTitle => 'Limite de crédit dépassée';

  @override
  String get abBillAnyway => 'Facturer quand même';

  @override
  String get abOfflineBill => 'Hors ligne — facture enregistrée sur cet appareil, elle sera synchronisée automatiquement au retour de la connexion';

  @override
  String get abEditQuotation => 'Modifier le devis';

  @override
  String get abEditBill => 'Modifier la facture';

  @override
  String get abNewQuotation => 'Nouveau devis';

  @override
  String get abAddBill => 'Ajouter une facture';

  @override
  String get abCouldNotLoadItems => 'Impossible de charger les articles.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Cette facture porterait le client à $total, au-dessus de sa limite de crédit de $limit.';
  }

  @override
  String get abTapAddItemBill => 'Appuyez sur « Ajouter un article » ci-dessous pour commencer une facture';

  @override
  String get abNoCatalog => 'Aucun article dans le catalogue pour l\'instant';

  @override
  String get abScan => 'Scanner';

  @override
  String get abDiscountRs => 'Remise (Rs)';

  @override
  String get abSubtotal => 'Sous-total';

  @override
  String get abTotal => 'Total';

  @override
  String get abSaveAsQuotation => 'Enregistrer comme devis';

  @override
  String get abQuotationLocked => 'Une facture existante ne peut pas redevenir un devis';

  @override
  String get abQuotationNote => 'Aucun stock déduit tant que ce n\'est pas converti en facture';

  @override
  String get abPaymentStatus => 'Statut de paiement';

  @override
  String get abUnpaid => 'Impayée';

  @override
  String get abPaymentMethod => 'Mode de paiement';

  @override
  String get abCash => 'Espèces';

  @override
  String get abBankTransfer => 'Virement bancaire';

  @override
  String get abCheque => 'Chèque';

  @override
  String get abSaveQuotation => 'Enregistrer le devis';

  @override
  String get abSaveBill => 'Enregistrer la facture';

  @override
  String abAdded(String name) {
    return '$name ajouté';
  }

  @override
  String get apNewItem => 'Nouvel article…';

  @override
  String get apNewItemHint => 'Ajoutez d\'abord un nouvel article au catalogue';

  @override
  String get apOfflinePurchase => 'Hors ligne — achat enregistré sur cet appareil, il sera synchronisé automatiquement au retour de la connexion';

  @override
  String get apEditPo => 'Modifier le bon de commande';

  @override
  String get apNewPo => 'Nouveau bon de commande';

  @override
  String get apAddPurchase => 'Ajouter un achat';

  @override
  String get apTapAddItem => 'Appuyez sur « Ajouter un article » ci-dessous pour commencer un achat';

  @override
  String get apSaveAsPo => 'Enregistrer comme bon de commande';

  @override
  String get apPoLocked => 'Un achat déjà reçu ne peut pas redevenir un brouillon de commande';

  @override
  String get apPoNote => 'Aucune mise à jour du stock ni du coût tant que la marchandise n\'est pas marquée comme reçue';

  @override
  String get apUnpaidCredit => 'Impayé (crédit)';

  @override
  String get apSavePo => 'Enregistrer le bon de commande';

  @override
  String get apSavePurchase => 'Enregistrer l\'achat';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Coût actuel : $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Aucun coût défini  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Échec du scan : erreur serveur $code';
  }

  @override
  String get scOfflineSaved => 'Hors ligne — photo enregistrée, elle sera lue automatiquement au retour de la connexion';

  @override
  String get scStillOffline => 'Toujours hors ligne';

  @override
  String get scCouldNotCreateCustomer => 'Impossible de créer le client — réessayez.';

  @override
  String get scCouldNotCreateSupplier => 'Impossible de créer le fournisseur — réessayez.';

  @override
  String scBillSavedFor(String name) {
    return 'Facture enregistrée pour $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Achat enregistré auprès de $name';
  }

  @override
  String get scWhichCustomer => 'De quel client s\'agit-il ?';

  @override
  String get scWhichSupplier => 'De quel fournisseur s\'agit-il ?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Correspondance la plus proche : $name ($score % de similarité)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Oui, c\'est $name';
  }

  @override
  String get scOtherwiseCustomer => 'Sinon, créez un nouveau client :';

  @override
  String get scOtherwiseSupplier => 'Sinon, créez un nouveau fournisseur :';

  @override
  String get scNoMatchCustomer => 'Aucun client correspondant trouvé. Créez-en un nouveau :';

  @override
  String get scNoMatchSupplier => 'Aucun fournisseur correspondant trouvé. Créez-en un nouveau :';

  @override
  String get scCustomerName => 'Nom du client';

  @override
  String get scSupplierName => 'Nom du fournisseur';

  @override
  String get scCreateNew => 'Créer';

  @override
  String get scTitleBill => 'Scanner une facture';

  @override
  String get scIntroBill => 'Prenez la facture en photo. Écrite à la main, ça passe, et le sindhi, l\'ourdou ou l\'anglais fonctionnent tous. Vous pourrez tout vérifier avant l\'enregistrement.';

  @override
  String get scIntroPurchase => 'Prenez en photo la facture du fournisseur. Le sindhi, l\'ourdou ou l\'anglais fonctionnent tous. Vous pourrez tout vérifier avant l\'enregistrement.';

  @override
  String get scReadingBill => 'Lecture de la facture…';

  @override
  String get scScanBill => 'Scanner une facture';

  @override
  String get scReadingInvoice => 'Lecture de la facture…';

  @override
  String get scScanInvoice => 'Scanner une facture';

  @override
  String get scQueued => 'Scans en attente';

  @override
  String get scReady => 'Prêt à vérifier';

  @override
  String get scFailed => 'Échec';

  @override
  String get scWaiting => 'En attente de connexion';

  @override
  String get scRetry => 'Réessayer';

  @override
  String rpCouldNotLoad(String error) {
    return 'Impossible de charger les rapports : $error';
  }

  @override
  String get rpHeadline => 'Les chiffres clés de ce mois';

  @override
  String get rpProfitThisMonth => 'Bénéfice de ce mois';

  @override
  String get rpNoData => 'Aucune donnée pour l\'instant';

  @override
  String get rpSalesTax => 'Taxe de vente';

  @override
  String rpSalesTaxFor(String month) {
    return 'Rapport de taxe de vente pour $month';
  }

  @override
  String get rpViewSalesTax => 'Voir le rapport de taxe de vente';

  @override
  String get rpQuickReports => 'Rapports rapides';

  @override
  String get rpQuickSub => 'Accédez directement à un rapport précis';

  @override
  String get expensesTitle => 'Dépenses';

  @override
  String get rpRateCard => 'Grille tarifaire';

  @override
  String get rpDetails => 'Détails';

  @override
  String get rpDetailsSub => 'Ventilations complètes et classements';

  @override
  String get rpOutstandingByCustomer => 'Soldes dus par client';

  @override
  String get rpNoOutstanding => 'Aucun solde dû';

  @override
  String get rpMonthlyTotals => 'Totaux mensuels';

  @override
  String get rpMostSold => 'Articles les plus vendus';

  @override
  String get rpNoItemsRecorded => 'Aucun article enregistré pour l\'instant';

  @override
  String get rpTopCustomers => 'Meilleurs clients par chiffre d\'affaires';

  @override
  String get rpNoSalesRecorded => 'Aucune vente enregistrée pour l\'instant';

  @override
  String get rpTotalOutstanding => 'Total dû';

  @override
  String get rpViewCustomers => 'Voir les clients';

  @override
  String get lblInvoice => 'facture';

  @override
  String get lblLedger => 'grand livre';

  @override
  String get lblRateCard => 'grille tarifaire';

  @override
  String get exCsvNeedsRows => 'Le CSV doit contenir une ligne d\'en-tête et au moins une dépense.';

  @override
  String get exCsvHeader => 'L\'en-tête du CSV doit inclure les colonnes \"description\" et \"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'Ligne $line : description manquante ou montant invalide — corrigez le fichier et réessayez.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Ligne $line : date invalide \"$date\" — utilisez AAAA-MM-JJ.';
  }

  @override
  String get exImportTitle => 'Importer des dépenses';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dépenses trouvées dans \"$file\". Toutes les importer ?',
      one: '1 dépense trouvée dans \"$file\". Toutes les importer ?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dépenses importées.',
      one: '1 dépense importée.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Échec de l\'import : erreur serveur $code';
  }

  @override
  String get exDeleteTitle => 'Supprimer la dépense';

  @override
  String get exAdd => 'Ajouter une dépense';

  @override
  String get exEdit => 'Modifier la dépense';

  @override
  String get exDescription => 'Description';

  @override
  String get exAmountRs => 'Montant (Rs)';

  @override
  String get exCategory => 'Catégorie';

  @override
  String exDate(String date) {
    return 'Date : $date';
  }

  @override
  String get exRepeats => 'Se répète chaque mois';

  @override
  String get exRepeatsHint => 'Loyer, électricité, salaires, etc.';

  @override
  String get exReceiptTap => 'Photo du reçu, appuyez pour la changer';

  @override
  String get exReceiptOptional => 'Photo du reçu (facultatif)';

  @override
  String get exEnterValid => 'Saisissez une description et un montant valide.';

  @override
  String get exOffline => 'Hors ligne — dépense enregistrée sur cet appareil, elle sera synchronisée automatiquement au retour de la connexion';

  @override
  String get exSave => 'Enregistrer la dépense';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dépenses récurrentes à régler ce mois-ci',
      one: '1 dépense récurrente à régler ce mois-ci',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Ajouter';

  @override
  String get exTotal => 'Total des dépenses';

  @override
  String exCategoryChip(String name) {
    return 'Catégorie : $name';
  }

  @override
  String get exNoneLogged => 'Aucune dépense enregistrée pour l\'instant';

  @override
  String exNoneInCategory(String name) {
    return 'Aucune dépense « $name » pour l\'instant';
  }

  @override
  String get exViewReceipt => 'Voir le reçu';

  @override
  String get exEditRow => 'Modifier la dépense';

  @override
  String get exDeleteRow => 'Supprimer la dépense';

  @override
  String gstServerReturned(String first, String second) {
    return 'Le serveur a renvoyé $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'Impossible de charger les données de GST : $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Échec du téléchargement ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename enregistré';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Enregistré dans Téléchargements/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Impossible de télécharger : $error';
  }

  @override
  String get gstTitle => 'Rapport de taxe de vente';

  @override
  String get gstOutwardDetail => 'Ventes sortantes — détail des factures';

  @override
  String get gstNoBills => 'Aucune facture pour ce mois.';

  @override
  String get gstHsn => 'Récapitulatif HSN';

  @override
  String get gstInvoiceWise => 'Détail par facture';

  @override
  String get gstMonthly => 'Récapitulatif mensuel';

  @override
  String get gstOutwardTaxable => 'Livraisons sortantes imposables';

  @override
  String get gstItc => 'Crédit de taxe en amont (achats)';

  @override
  String get gstSave => 'Enregistrer';

  @override
  String get rcValidAmount => 'Saisissez un montant valide.';

  @override
  String get rcExpected => 'Espèces attendues (ventes en espèces du jour)';

  @override
  String get rcAlsoCollected => 'Également encaissé aujourd\'hui (non compté dans le tiroir)';

  @override
  String get rcCounted => 'Espèces comptées dans le tiroir (Rs)';

  @override
  String get rcCompare => 'Comparer';

  @override
  String get rcMatches => 'Correspond exactement !';

  @override
  String rcExtra(String amount) {
    return '$amount en trop dans le tiroir';
  }

  @override
  String rcMissing(String amount) {
    return '$amount manquants dans le tiroir';
  }

  @override
  String get pbiTitle => 'Bénéfice par article';

  @override
  String get pbiNoSales => 'Aucune vente pour l\'instant';

  @override
  String get pbiByCategory => 'Par catégorie';

  @override
  String get pbiItemsByProfit => 'Articles par bénéfice';

  @override
  String get svTitle => 'Valeur du stock';

  @override
  String get svNone => 'Aucun stock disponible';

  @override
  String get svItemsByValue => 'Articles par valeur';

  @override
  String svSummary(String items, String units) {
    return '$items articles · $units unités en rayon';
  }

  @override
  String svTied(String amount) {
    return '$amount immobilisés en stock';
  }

  @override
  String get svEstimated => 'estimé d\'après le prix de vente';

  @override
  String get bkRestoreTitle => 'Restaurer la sauvegarde ?';

  @override
  String bkRestoreBody(String filename) {
    return 'Cela remplacera TOUTES les données actuelles par le fichier de sauvegarde \"$filename\". Continuer ?';
  }

  @override
  String get bkRestore => 'Restaurer';

  @override
  String get bkRestoreDoneTitle => 'Restauration terminée';

  @override
  String get bkRestoreDoneBody => 'Vos données ont été restaurées.';

  @override
  String get bkOk => 'OK';

  @override
  String bkRestoreFailed(String detail) {
    return 'Échec de la restauration : $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Impossible de restaurer : $error';
  }

  @override
  String get bkSaveToDownloads => 'Enregistrer dans Téléchargements';

  @override
  String get bkIntroAdmin => 'Toutes vos données sont dans un seul fichier de base de données. Téléchargez-en une copie régulièrement et restaurez-la en cas de problème.';

  @override
  String get bkIntroStaff => 'La sauvegarde et la restauration complètes de la base sont réservées aux administrateurs. Demandez à un administrateur, ou exportez ci-dessous ce dont vous avez besoin en CSV.';

  @override
  String get bkBackupDb => 'Sauvegarder la base de données';

  @override
  String get bkBackupDbSub => 'Téléchargez toute la base en un seul fichier et partagez-le (WhatsApp, Drive, e-mail).';

  @override
  String get bkDownloadPhone => 'Télécharger la sauvegarde sur le téléphone';

  @override
  String get bkShareBackup => 'Partager la sauvegarde';

  @override
  String get bkAutoTitle => 'Sauvegardes automatiques';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sauvegardes quotidiennes stockées sur le serveur, la plus récente du $time. S\'exécutent toutes seules — rien à faire ici.',
      one: '1 sauvegarde quotidienne stockée sur le serveur, la plus récente du $time. S\'exécute toute seule — rien à faire ici.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Choisissez un fichier de sauvegarde enregistré pour remplacer les données actuelles.';

  @override
  String get bkRestoreFromFile => 'Restaurer depuis un fichier de sauvegarde';

  @override
  String get bkExportCsv => 'Exporter en CSV';

  @override
  String get bkExportSub => 'Ouvrez-les dans Excel ou partagez-les.';

  @override
  String get bkRangeAll => 'Factures/Dépenses : toute la période';

  @override
  String bkRangeSome(String end, String start) {
    return 'Factures/Dépenses : du $start au $end';
  }

  @override
  String get bkSetRange => 'Définir la période';

  @override
  String get bkClearRange => 'Effacer la période';

  @override
  String get ntNever => 'Jamais déclenché';

  @override
  String get ntJustNow => 'À l\'instant';

  @override
  String ntMinutesAgo(int count) {
    return 'il y a $count min';
  }

  @override
  String ntHoursAgo(int count) {
    return 'il y a $count h';
  }

  @override
  String ntDaysAgo(int count) {
    return 'il y a $count j';
  }

  @override
  String get ntTitle => 'Notifications intelligentes';

  @override
  String get ntTapHint => 'Appuyez sur « Vérifier maintenant » pour déclencher une notification et voir les résultats en direct.';

  @override
  String get ntLowStockSub => 'Notifier quand des articles passent sous leur seuil de réapprovisionnement.';

  @override
  String get ntCheckNow => 'Vérifier maintenant';

  @override
  String get ntOverdue => 'Rappels de paiements en retard';

  @override
  String get ntOverdueSub => 'Notifier des factures impayées des jours précédents.';

  @override
  String get ntDaily => 'Résumé quotidien de l\'activité';

  @override
  String get ntDailySub => 'Les ventes, encaissements et bénéfices d\'hier en un coup d\'œil.';

  @override
  String get ntSendSummary => 'Envoyer le résumé';

  @override
  String get ntRunning => 'En cours…';

  @override
  String get ntLowStockItems => 'Articles en stock faible';

  @override
  String get ntSales => 'Ventes';

  @override
  String get ntCollected => 'Encaissé';

  @override
  String get ntProfit => 'Bénéfice';

  @override
  String get auChecking => 'Recherche de mises à jour…';

  @override
  String get auLatest => 'Vous avez la dernière version.';

  @override
  String get auAvailable => 'Mise à jour disponible';

  @override
  String auNewer(int code) {
    return 'Une version plus récente de Book-Keep (build $code) est prête.';
  }

  @override
  String get auLater => 'Plus tard';

  @override
  String get auUpdate => 'Mettre à jour';

  @override
  String get auDownloading => 'Téléchargement de la mise à jour';

  @override
  String auSaved(String name) {
    return '$name enregistré dans votre dossier Téléchargements.';
  }

  @override
  String get auAllowInstall => 'Autorisez Book-Keep à installer des applis, puis appuyez de nouveau sur Mettre à jour.';

  @override
  String get auFailed => 'Mise à jour impossible — vérifiez votre connexion et réessayez.';

  @override
  String get lgSearch => 'Rechercher des langues';

  @override
  String lgNoMatch(String query) {
    return 'Aucune langue ne correspond à \"$query\"';
  }

  @override
  String get alVoided => 'A annulé une facture';

  @override
  String get alDeletedBill => 'A supprimé une facture';

  @override
  String get alReturned => 'A retourné une facture';

  @override
  String get alDeletedCustomer => 'A supprimé un client';

  @override
  String get alDeletedSupplier => 'A supprimé un fournisseur';

  @override
  String get alCreatedAccount => 'A créé un compte';

  @override
  String get alUpdatedAccount => 'A mis à jour un compte';

  @override
  String get alDeletedAccount => 'A supprimé un compte';

  @override
  String get alTitle => 'Journal d\'activité';

  @override
  String get alNone => 'Aucune activité enregistrée pour l\'instant';

  @override
  String get blkEnterOne => 'Saisissez au moins un article';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articles ajoutés avec succès',
      one: '1 article ajouté avec succès',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Ajout d\'articles en masse';

  @override
  String get blkFormat => 'Un article par ligne, format : Nom, Prix, Unité, Catégorie';

  @override
  String get blkOptional => 'L\'unité et la catégorie sont facultatives (par défaut : piece, aucune)';

  @override
  String get blkAddAll => 'Ajouter tous les articles';

  @override
  String get prSend => 'Envoyer un rappel de paiement';

  @override
  String get prTone => 'Choisir le ton :';

  @override
  String get prPolite => 'Poli';

  @override
  String get prStandard => 'Standard';

  @override
  String get prUrgent => 'Urgent';

  @override
  String get prPreviewQr => 'Aperçu du QR de paiement JazzCash';

  @override
  String get prShareText => 'Partager le texte';

  @override
  String get dsRemaining => 'Restant';

  @override
  String dsIncludesDiscount(String amount) {
    return 'dont $amount de remise';
  }

  @override
  String get dsItems => 'Articles';

  @override
  String get dsDiscount => 'Remise';

  @override
  String get lkWrongPin => 'Code PIN incorrect';

  @override
  String get lkEnterPin => 'Saisissez le code PIN';

  @override
  String get lkChecking => 'Vérification de l\'empreinte...';

  @override
  String get bcTitle => 'Scanner un code-barres';

  @override
  String get bcTorchNa => 'La lampe torche n\'est pas disponible sur cet appareil';

  @override
  String get bcTorch => 'Lampe torche';

  @override
  String get bcPoint => 'Pointez la caméra vers un code-barres';

  @override
  String get qrNoNumber => 'Aucun numéro JazzCash configuré. Définissez-le dans les Paramètres pour afficher un QR code de paiement.';

  @override
  String get qrPay => 'Payer avec JazzCash';

  @override
  String get qrInvalid => 'Données QR invalides';

  @override
  String qrAmount(String amount) {
    return 'Montant : $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash : $number';
  }

  @override
  String get qrCopy => 'Copier le numéro JazzCash';

  @override
  String get qrCopied => 'Numéro JazzCash copié dans le presse-papiers';

  @override
  String get qrHint => 'Scannez ou copiez ce numéro dans votre appli JazzCash pour payer.';

  @override
  String clOwed(String amount) {
    return '$amount dû';
  }

  @override
  String get lnEnterEmailFirst => 'Saisissez d\'abord un e-mail valide ci-dessus.';

  @override
  String get lnResetSent => 'E-mail de réinitialisation envoyé — vérifiez votre boîte de réception.';

  @override
  String get lnNoAccount => 'Aucun compte trouvé pour cet e-mail.';

  @override
  String get lnWrongPassword => 'Mot de passe incorrect.';

  @override
  String get lnInvalidEmail => 'Cela ne ressemble pas à une adresse e-mail valide.';

  @override
  String get lnDisabled => 'Ce compte a été désactivé.';

  @override
  String get lnTooMany => 'Trop de tentatives — réessayez dans une minute.';

  @override
  String get lnNoInternet => 'Pas de connexion Internet.';

  @override
  String get lnWeakPassword => 'Le mot de passe doit contenir au moins 6 caractères.';

  @override
  String get lnCouldNotSignIn => 'Connexion impossible. Veuillez réessayer.';

  @override
  String get lnWrongPasswordHint => 'Mot de passe incorrect. Réessayez ou appuyez sur « Mot de passe oublié ? ».';

  @override
  String get lnWrongEmail => 'E-mail incorrect — aucun compte n\'utilise cette adresse.';

  @override
  String get lnWrongEmailOrPassword => 'E-mail ou mot de passe incorrect.';

  @override
  String get lnWrongUsername => 'Nom d\'utilisateur incorrect — aucun compte n\'utilise ce nom.';

  @override
  String get lnWelcome => 'Bon retour';

  @override
  String lnSignInTo(String app) {
    return 'Connectez-vous à $app';
  }

  @override
  String get lnEmailOrUsername => 'E-mail ou nom d\'utilisateur';

  @override
  String get lnRemember => 'Se souvenir de moi';

  @override
  String get lnForgot => 'Mot de passe oublié ?';

  @override
  String get lnSignIn => 'Se connecter';

  @override
  String get lnGoogle => 'Continuer avec Google';

  @override
  String get lnNew => 'Nouveau ici ?';

  @override
  String get lnCreate => 'Créer un compte';

  @override
  String suCreated(String email) {
    return 'Compte créé pour $email. Un e-mail de vérification a été envoyé (facultatif).';
  }

  @override
  String suSetup(String app) {
    return 'Configurer $app';
  }

  @override
  String get suName => 'Nom';

  @override
  String get suEmail => 'E-mail';

  @override
  String suPhoneDigits(int digits) {
    return 'Saisissez un numéro valide de $digits chiffres';
  }

  @override
  String get suCreateBtn => 'Créer le compte';

  @override
  String get suHaveAccount => 'Vous avez déjà un compte ?';

  @override
  String get suAlreadyExists => 'Un compte existe déjà pour cet e-mail.';

  @override
  String get suInvalidEmail => 'Adresse e-mail invalide.';

  @override
  String get agShow => 'Afficher le mot de passe';

  @override
  String get agHide => 'Masquer le mot de passe';

  @override
  String get adAccounts => 'Comptes';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count comptes enregistrés',
      one: '1 compte enregistré',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Ajouter';

  @override
  String get adNoAccounts => 'Aucun compte trouvé.';

  @override
  String get adAccountability => 'Traçabilité';

  @override
  String get adAccountabilitySub => 'Qui a annulé, supprimé ou retourné quelque chose, et les modifications de comptes.';

  @override
  String get adActivitySub => 'Factures annulées, suppressions, modifications de comptes';

  @override
  String get adServer => 'Serveur';

  @override
  String get adServerSub => 'Avec qui cette appli communique. Rarement à modifier après la configuration.';

  @override
  String get adServerHint => 'L\'émulateur utilise 10.0.2.2 ; un vrai téléphone a besoin de l\'IP de l\'ordinateur sur le même Wi-Fi. La modifier affecte tous les comptes.';

  @override
  String get adApiBase => 'URL de base de l\'API';

  @override
  String get adSaveServer => 'Enregistrer l\'adresse du serveur';

  @override
  String get adEmailSetSub => 'Configuré — le personnel peut envoyer des factures/relevés par e-mail aux clients.';

  @override
  String get adNotSetUp => 'Pas encore configuré.';

  @override
  String get adEmailSetBody => 'L\'e-mail est configuré. Le personnel peut envoyer une facture ou un relevé directement à un client.';

  @override
  String get adEmailHelp => 'Une adresse Gmail fonctionne avec un mot de passe d\'application (smtp.gmail.com, port 587), ou utilisez les paramètres SMTP de votre fournisseur de messagerie.';

  @override
  String get adSmtpHost => 'Hôte SMTP';

  @override
  String get adSmtpPort => 'Port SMTP';

  @override
  String get adEmailAddress => 'Adresse e-mail';

  @override
  String get adPwKeep => 'Mot de passe (laisser vide pour conserver l\'actuel)';

  @override
  String get adPwApp => 'Mot de passe (mot de passe d\'application, pas votre mot de passe de connexion)';

  @override
  String get adFromName => 'Nom de l\'expéditeur (facultatif)';

  @override
  String get adFromHint => 'Ma quincaillerie';

  @override
  String get adSaving => 'Enregistrement...';

  @override
  String get adSaveEmail => 'Enregistrer les paramètres e-mail';

  @override
  String get adAddAccount => 'Ajouter un compte';

  @override
  String get adNameOpt => 'Nom (facultatif)';

  @override
  String get adAtLeast6 => 'Au moins 6 caractères';

  @override
  String get adGrantAdmin => 'Accorder les droits d\'admin';

  @override
  String get adCanManage => 'Peut annuler/supprimer/retourner';

  @override
  String get adCanManageHint => 'Annuler ou supprimer une facture, retourner une facture ou supprimer un client/fournisseur. Un admin a toujours ce droit.';

  @override
  String get adCreate => 'Créer';

  @override
  String get adAccountCreated => 'Compte créé.';

  @override
  String adCreateFailed(String error) {
    return 'Échec de la création : $error';
  }

  @override
  String get adEditAccount => 'Modifier le compte';

  @override
  String get adAdminSwitch => 'Admin';

  @override
  String get adAdminHint => 'Peut ouvrir le panneau d\'administration';

  @override
  String get adDisabled => 'Désactivé';

  @override
  String get adDisabledHint => 'Connexion bloquée';

  @override
  String get adAccountUpdated => 'Compte mis à jour.';

  @override
  String adUpdateFailed(String error) {
    return 'Échec de la mise à jour : $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label sera définitivement supprimé et ne pourra plus se connecter.';
  }

  @override
  String get adAccountDeleted => 'Compte supprimé.';

  @override
  String adDeleteFailed(String error) {
    return 'Échec de la suppression : $error';
  }

  @override
  String get adBadgeAdmin => 'ADMIN';

  @override
  String get adBadgeDisabled => 'DÉSACTIVÉ';

  @override
  String get adOff => 'Le panneau d\'administration est désactivé';

  @override
  String get adCheckAgain => 'Vérifier à nouveau';

  @override
  String get adAccessRequired => 'Accès administrateur requis';

  @override
  String get adAccessBody => 'Seuls les administrateurs de la boutique peuvent gérer les comptes. Demandez au propriétaire de vous accorder l\'accès administrateur.';

  @override
  String get adCouldNotLoad => 'Impossible de charger le panneau d\'administration.';

  @override
  String get adBadPort => 'Saisissez un numéro de port SMTP valide.';

  @override
  String get adEmailSaved => 'Paramètres e-mail enregistrés.';

  @override
  String adEmailSaveFailed(String error) {
    return 'Impossible d\'enregistrer les paramètres e-mail : $error';
  }

  @override
  String get adServerEmpty => 'L\'adresse du serveur ne peut pas être vide.';

  @override
  String get adServerSaved => 'Adresse du serveur enregistrée. Les écrans l\'utiliseront au prochain chargement.';

  @override
  String get lnOr => 'ou';

  @override
  String get scNotABill => 'Ça ne ressemble pas à une facture. Réessayez avec une photo nette de la facture.';

  @override
  String get scNotAnInvoice => 'Ça ne ressemble pas à une facture. Réessayez avec une photo nette de la facture du fournisseur.';

  @override
  String get jqOpenFull => 'Plein écran';

  @override
  String get jqCopy => 'Copier le numéro';

  @override
  String get jqSheetTitle => 'QR JazzCash';

  @override
  String get jqSheetHint => 'Vos clients le scannent dans leur appli JazzCash pour vous payer.';

  @override
  String get jqCheck => 'Vérifiez le numéro';

  @override
  String get askVoice => 'Voix';

  @override
  String get askVoiceFallbackNote => 'Lecture avec la voix de votre téléphone.';

  @override
  String get askPace => 'Rythme';

  @override
  String get askTone => 'Ton';

  @override
  String get askPaceSlower => 'Plus lent';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Plus rapide';

  @override
  String get askToneCalm => 'Calme';

  @override
  String get askToneWarm => 'Chaleureux';

  @override
  String get askToneCheerful => 'Enjoué';

  @override
  String qPaymentUpdate(String amount) {
    return 'Mise à jour du paiement : $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Client : $name';
  }

  @override
  String qSupplier(String name) {
    return 'Fournisseur : $name';
  }

  @override
  String qItem(String name) {
    return 'Article : $name';
  }

  @override
  String qExpense(String name) {
    return 'Dépense : $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Achat : $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Paiement encaissé : $amount de $name';
  }

  @override
  String gstAmount(String amount) {
    return 'TVA $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Base imposable $taxable  ·  TVA $tax  ·  Total $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Revenus : $revenue  •  Coût des ventes : $cogs  •  Dépenses : $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Bonjour $customer, cordiales salutations de $shop ! Votre solde total dû est de $amount. Merci !';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Bonjour $customer, rappel de paiement de $shop pour le solde en attente de $amount. Merci de régler dès que possible.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'AVIS URGENT : Cher/Chère $customer, votre paiement en attente de $amount chez $shop n\'est pas réglé. Veuillez payer immédiatement.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Payer via JazzCash : $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Facture de $shop\nTotal : $total\nArticles : $items\nStatut : $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Bonjour $supplier, ici $shop. Nous souhaitons passer commande de :\n$lines\n\nMerci de confirmer la disponibilité et le prix.';
  }

  @override
  String ppUpdated(String date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String get ppWhoH => 'Qui sommes-nous';

  @override
  String ppWho(String owner, String email) {
    return '$owner, exploitant de Book-keep.\nContact : $email';
  }

  @override
  String get ppCollectH => 'Ce que nous collectons';

  @override
  String get ppCollectAccount => 'Compte : adresse e-mail, numéro de téléphone et nom d’utilisateur, via Firebase Authentication.';

  @override
  String get ppCollectShop => 'Profil de la boutique : nom, adresse, numéro de téléphone, numéro JazzCash et logo de la boutique, saisis par le propriétaire dans les Paramètres.';

  @override
  String get ppCollectRecords => 'Données commerciales que vous créez : noms et numéros de téléphone des clients et fournisseurs, factures, achats, catalogue d’articles (y compris photos et codes-barres) et dépenses (y compris photos de reçus). Ce sont les données essentielles de l’application : c’est ainsi que fonctionne la comptabilité.';

  @override
  String get ppCollectDevice => 'Données de l’appareil et de diagnostic : un jeton de notifications push (pour les alertes de stock bas, de paiements en retard et de résumé quotidien) et des rapports de plantage (infos sur l’appareil et traces d’erreur) via Firebase Crashlytics, envoyés automatiquement lorsque l’application plante.';

  @override
  String ppCollectAi(String askShop) {
    return 'Fonctions d’IA : $askShop, le point du matin par IA et le scanner de factures/achats par IA envoient un aperçu des données commerciales concernées (chiffres de rapports ou photo d’une facture) à l’API Gemini de Google afin de générer une réponse, un résumé ou les lignes extraites. Google traite ces données pour produire la réponse ; ni nous ni Google ne les utilisons pour entraîner des modèles en dehors des conditions standard de l’API de Google.';
  }

  @override
  String get ppDontH => 'Ce que nous ne faisons pas';

  @override
  String get ppDontLocation => 'Nous ne suivons pas votre position.';

  @override
  String get ppDontAds => 'Nous n’utilisons ni réseaux publicitaires ni outils d’analyse comportementale ou de relecture de sessions.';

  @override
  String get ppDontSell => 'Nous ne vendons ni vos données ni celles de vos clients à qui que ce soit.';

  @override
  String get ppWhereH => 'Où sont stockées les données';

  @override
  String get ppWhereDb => 'Base de données : Neon (Postgres), un fournisseur tiers de bases de données dans le cloud.';

  @override
  String get ppWhereFirebase => 'Authentification, notifications push, rapports de plantage, stockage des photos : Firebase (Google).';

  @override
  String get ppWhereAi => 'Traitement par IA : API Gemini de Google.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'E-mails de factures : envoyés via le compte SMTP que l’administrateur de votre boutique configure dans $adminPanel. Nous n’avons pas de liste de diffusion ; ce sont des factures ou relevés individuels destinés à vos propres clients, pas du marketing de masse.';
  }

  @override
  String get ppYoursH => 'Vos données, les données de vos clients';

  @override
  String get ppYours => 'Tout ce que vous saisissez (clients, fournisseurs, factures, articles) appartient à votre boutique. Les autres boutiques utilisant Book-keep ne peuvent pas le voir. Les comptes employés que vous créez ne voient que ce que vous leur autorisez.';

  @override
  String get ppControlsH => 'Vos contrôles';

  @override
  String ppControlExport(String path) {
    return 'Exporter ou sauvegarder vos données : $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Supprimer votre compte : $path. Cela supprime uniquement vos identifiants de connexion ; cela n’efface pas les données commerciales de votre boutique (factures, clients, articles, etc.), de même que retirer un employé n’efface pas les enregistrements qu’il a créés.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Notifications : peuvent être désactivées par type dans $path.';
  }

  @override
  String get ppChildrenH => 'Enfants';

  @override
  String get ppChildren => 'Book-keep est un outil professionnel destiné aux propriétaires de boutiques et à leur personnel. Il ne s’adresse pas aux enfants et n’est pas utilisé sciemment par eux.';

  @override
  String get ppChangesH => 'Modifications de cette politique';

  @override
  String get ppChanges => 'Si ce que nous collectons ou la destination des données change, nous mettrons à jour cette page et la date en haut.';

  @override
  String get ppContactH => 'Contact';

  @override
  String ppContact(String email) {
    return 'Questions sur cette politique ou vos données : $email';
  }

  @override
  String get waHello => 'Bonjour !';

  @override
  String waHelloNamed(String name) {
    return 'Bonjour $name,';
  }

  @override
  String get gstTaxable => 'Imposable';

  @override
  String get gstTax => 'Taxe';

  @override
  String get gstTaxableValue => 'Valeur imposable';

  @override
  String get gstTotalTax => 'Taxe totale';

  @override
  String get gstTotalItc => 'Total crédit de taxe en amont';

  @override
  String get gstExempt => 'Ventes exonérées';

  @override
  String get gstNetPayable => 'Taxe nette à payer';

  @override
  String get unknownName => 'Inconnu';

  @override
  String get unitPiece => 'pièce';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'mètre';

  @override
  String get unitBox => 'boîte';

  @override
  String get unitDozen => 'douzaine';

  @override
  String get unitLiter => 'litre';

  @override
  String get unitBag => 'sac';

  @override
  String deleteSupplierMessage(String name) {
    return 'Supprimer $name et tous ses achats ? Cette action est irréversible.';
  }
}
