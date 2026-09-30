// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navCustomers => 'Müşteriler';

  @override
  String get navItems => 'Ürünler';

  @override
  String get navSuppliers => 'Tedarikçiler';

  @override
  String get navReports => 'Raporlar';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get settingsShopDetailsTitle => 'Mağaza Bilgileri';

  @override
  String get settingsShopDetailsSubtitle => 'Faturalarınızda gösterilir.';

  @override
  String get settingsShopNameLabel => 'Mağaza Adı';

  @override
  String get settingsShopAddressLabel => 'Mağaza Adresi';

  @override
  String get settingsPhoneLabel => 'Telefon';

  @override
  String get settingsSaveShopDetails => 'Mağaza Bilgilerini Kaydet';

  @override
  String get settingsAppearanceTitle => 'Görünüm';

  @override
  String get settingsAppearanceSubtitle => 'Tüm uygulama için bir tema seçin.';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get settingsLanguageTitle => 'Dil';

  @override
  String get settingsLanguageSubtitle => 'Uygulamanın görüntüleme dilini seçin.';

  @override
  String get sortNameNewest => 'Sırala: Ad / En yeni';

  @override
  String get addCustomer => 'Müşteri ekle';

  @override
  String get importCsv => 'CSV içe aktar';

  @override
  String get searchShop => 'Dükkanda ara';

  @override
  String get scanToFindItem => 'Ürün bulmak için tara';

  @override
  String get bulkAdd => 'Toplu ekle';

  @override
  String get updateStock => 'Stoğu güncelle';

  @override
  String get printLabels => 'Etiket yazdır';

  @override
  String get mergeDuplicates => 'Kopyaları birleştir';

  @override
  String get addSupplier => 'Tedarikçi ekle';

  @override
  String get scanPurchaseInvoice => 'Alış faturası tara';

  @override
  String askNoAnswer(String reason) {
    return 'Yanıt alınamadı: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Bağlanılamadı: $error';
  }

  @override
  String get micPermissionNeeded => 'Sesli giriş için mikrofon izni gerekiyor.';

  @override
  String get speechUnavailable => 'Bu cihazda konuşma tanıma kullanılamıyor.';

  @override
  String get askYourShop => 'Dükkanına sor';

  @override
  String get close => 'Kapat';

  @override
  String get askIntro => 'Dükkânın nasıl gittiğini mi merak ediyorsunuz? Bana sorun, defterlerinizdeki bilgilere göre yanıtlayayım.';

  @override
  String get askListening => 'Dinliyor…';

  @override
  String get askThinkingWords => 'Düşünüyor…|Üzerinde çalışıyor…|Hesaplıyor…|Defterleri kontrol ediyor…|Topluyor…|Rakamları inceliyor…';

  @override
  String get askSayQuestion => 'Sorunuzu söyleyin — iptal için küreye dokunun';

  @override
  String briefingRefreshFailed(int code) {
    return 'Özet yenilenemedi ($code).';
  }

  @override
  String get refreshFailedOffline => 'Yenilenemedi — bağlantınızı kontrol edin.';

  @override
  String get newBillFailed => 'Yeni fatura başlatılamadı — bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Önce $name için tercih edilen tedarikçiyi belirleyin (düzenlemek için dokunun).';
  }

  @override
  String get reorderBySupplier => 'Tedarikçiye göre yeniden sipariş';

  @override
  String get supplier => 'Tedarikçi';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ürün',
      one: '1 ürün',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Stoğu azalan hiçbir ürünün henüz tercih edilen tedarikçisi yok.';

  @override
  String get thisSupplier => 'Bu tedarikçi';

  @override
  String supplierNoPhone(String name) {
    return '$name için telefon numarası yok.';
  }

  @override
  String get tabOverview => 'Genel bakış';

  @override
  String get tabStock => 'Stok';

  @override
  String get tabMoney => 'Para';

  @override
  String get taglineOverview => 'Bugünün alacakları, stok ve nakit tek bakışta.';

  @override
  String get taglineStock => 'Ne satılıyor, ne azalıyor.';

  @override
  String get taglineMoney => 'Giderler, mutabakat ve tahsilatlar.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Pano yükleniyor… $done/$total';
  }

  @override
  String get dashboardLoadFailed => 'Pano yüklenemedi';

  @override
  String get checkConnectionRetry => 'Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get aiBriefing => 'Yapay zekâ özeti';

  @override
  String get briefingPrompt => 'Dünkü işlerinizi birkaç cümlede görün.';

  @override
  String get getBriefing => 'Özeti al';

  @override
  String get refreshBriefing => 'Özeti yenile';

  @override
  String updatedAt(String time) {
    return 'Güncellendi $time';
  }

  @override
  String get customersUnknown => '— müşteri';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count müşteri',
      one: '1 müşteri',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Önceki ay';

  @override
  String get nextMonth => 'Sonraki ay';

  @override
  String get salesMonth => 'Satış (ay)';

  @override
  String get outstanding => 'Alacak';

  @override
  String get profitMonth => 'Kâr (ay)';

  @override
  String get cashToday => 'Bugünkü nakit';

  @override
  String get newBill => 'Yeni fatura';

  @override
  String get scanHandwrittenBill => 'El yazısı fatura tara';

  @override
  String get topOutstanding => 'En yüksek alacaklar';

  @override
  String viewAllInDues(int count) {
    return 'Alacak Merkezi\'nde $count kaydın hepsini gör';
  }

  @override
  String get lowStockAlerts => 'Düşük stok uyarıları';

  @override
  String get noLowStock => 'Stoğu azalan ürün yok — her şey yolunda.';

  @override
  String get whatsappAll => 'Herkese WhatsApp';

  @override
  String get reorderAll => 'Hepsini yeniden sipariş et';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Öneri: $qty $unit yeniden sipariş et';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit kaldı';
  }

  @override
  String get reorder => 'Yeniden sipariş';

  @override
  String get whatsappSupplier => 'Tedarikçiye WhatsApp';

  @override
  String get topItemsByRevenue => 'Gelire göre en iyi ürünler';

  @override
  String get noSalesYet => 'Henüz satış kaydı yok.';

  @override
  String qtyLabel(String qty) {
    return 'Adet: $qty';
  }

  @override
  String get monthExpenses => 'Bu ayın giderleri';

  @override
  String get noExpensesMonth => 'Bu ay gider kaydı yok.';

  @override
  String get quickActions => 'Hızlı işlemler';

  @override
  String get dailyCashReconciliation => 'Günlük kasa mutabakatı';

  @override
  String get collectMoney => 'Tahsilat yap';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count değişiklik çevrimdışı kaydedildi',
      one: '1 değişiklik çevrimdışı kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Tekrar çevrimiçi olunca otomatik eşitlenecek';

  @override
  String get syncing => 'Eşitleniyor';

  @override
  String get sync => 'Eşitle';

  @override
  String get shopProfile => 'Dükkan profili';

  @override
  String get insights => 'İçgörüler';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get backupExport => 'Yedekleme ve dışa aktarma';

  @override
  String get adminPanel => 'Yönetici paneli';

  @override
  String get toolsSync => 'Araçlar ve eşitleme';

  @override
  String get account => 'Hesap';

  @override
  String get shopDetailsSaved => 'Dükkan bilgileri kaydedildi.';

  @override
  String saveFailed(int code) {
    return 'Kaydedilemedi ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get logoUpdated => 'Logo güncellendi.';

  @override
  String logoUploadFailed(int code) {
    return 'Logo yüklenemedi ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Logo yüklenemedi: $error';
  }

  @override
  String get healthGood => 'Genel olarak her şey iyi görünüyor.';

  @override
  String get healthSome => 'Birkaç şey ilgi bekliyor.';

  @override
  String get healthMany => 'Birçok şey ilgi bekliyor.';

  @override
  String get shopHealth => 'Dükkan sağlığı';

  @override
  String get healthIntro => 'Kısa bir hatırlatma, yeni bir rapor değil.';

  @override
  String get couldNotLoadCheckConnection => 'Yüklenemedi — bağlantınızı kontrol edin.';

  @override
  String get itemPhotos => 'Ürün fotoğrafları';

  @override
  String get barcodes => 'Barkodlar';

  @override
  String get lowStockItems => 'Stoğu azalan ürünler';

  @override
  String get lastBackup => 'Son yedek';

  @override
  String get today => 'bugün';

  @override
  String get yesterday => 'dün';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün önce',
      one: '1 gün önce',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Çevrimdışı durum';

  @override
  String get online => 'Çevrimiçi';

  @override
  String get offline => 'Çevrimdışı';

  @override
  String get waitingToSync => 'Eşitleme bekliyor';

  @override
  String get syncNow => 'Şimdi eşitle';

  @override
  String get searchSettings => 'Ayarlarda ara';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\" ile eşleşen ayar yok';
  }

  @override
  String get businessInfo => 'İŞLETME BİLGİLERİ';

  @override
  String get payment => 'ÖDEME';

  @override
  String get shopNameRequired => 'Dükkan adı gerekli';

  @override
  String phoneIncomplete(int digits) {
    return '$digits haneli telefon numarasının tamamını girin';
  }

  @override
  String get jazzcashOptional => 'JazzCash numarası (isteğe bağlı)';

  @override
  String get saved => 'Kaydedildi!';

  @override
  String get languageSubtitle => 'Uygulamanın dilini değiştir';

  @override
  String get notificationsSubtitle => 'Düşük stok, geciken ödemeler ve günlük özet';

  @override
  String get backupSubtitle => 'Dükkan verilerini indir, geri yükle ve dışa aktar';

  @override
  String get appUpdate => 'Uygulama güncellemesi';

  @override
  String get appUpdateSubtitle => 'Yeni sürümü kontrol et';

  @override
  String get adminSubtitle => 'Hesapları ve dükkan verilerini yönet';

  @override
  String get accountSubtitle => 'Giriş, şifre ve kullanıcı adı';

  @override
  String get privacyPolicy => 'Gizlilik politikası';

  @override
  String get privacySubtitle => 'Hangi verileri topluyoruz ve neden';

  @override
  String get yourShop => 'Dükkanınız';

  @override
  String get uploadingLogo => 'Dükkan logosu yükleniyor';

  @override
  String get logoTapToChange => 'Dükkan logosu, değiştirmek için dokunun';

  @override
  String get brandTagline => 'Dükkân kalabalık, defterler sakin.';

  @override
  String serverError(int code) {
    return 'Sunucu hatası: $code';
  }

  @override
  String get deleteCustomer => 'Müşteriyi sil';

  @override
  String deleteCustomerMessage(String name) {
    return '$name ve tüm faturaları silinsin mi? Bu geri alınamaz.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Silinemedi: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Silinemedi — bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get actions => 'İşlemler';

  @override
  String get edit => 'Düzenle';

  @override
  String get delete => 'Sil';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count müşteriyi sil',
      one: '1 müşteriyi sil',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count müşteri ve tüm faturaları silinsin mi? Bu geri alınamaz.',
      one: '1 müşteri ve tüm faturaları silinsin mi? Bu geri alınamaz.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Seçimi kaldır';

  @override
  String get selectAll => 'Tümünü seç';

  @override
  String selectedCount(int count) {
    return '$count seçildi';
  }

  @override
  String get cancel => 'İptal';

  @override
  String get newTag => 'YENİ';

  @override
  String get csvNeedsRows => 'CSV\'de bir başlık satırı ve en az bir müşteri olmalı.';

  @override
  String get csvNeedsName => 'CSV başlığında \"name\" sütunu olmalı.';

  @override
  String csvLineMissingName(int line) {
    return 'Satır $line: ad eksik — dosyayı düzeltip tekrar deneyin.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Satır $line: geçersiz credit_limit \"$value\" — dosyayı düzeltip tekrar deneyin.';
  }

  @override
  String get importCustomers => 'Müşterileri içe aktar';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" içinde $count müşteri bulundu. Hepsi içe aktarılsın mı?',
      one: '\"$file\" içinde 1 müşteri bulundu. İçe aktarılsın mı?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'İçe aktar';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count müşteri içe aktarıldı.',
      one: '1 müşteri içe aktarıldı.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'İçe aktarma başarısız: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'İçe aktarma başarısız — bağlanılamadı: $error';
  }

  @override
  String get noPhone => 'Telefon yok';

  @override
  String get offlineShowingSaved => 'Çevrimdışı — kayıtlı kopya gösteriliyor';

  @override
  String get searchCustomersHint => 'Müşteri veya telefon ara...';

  @override
  String get noCustomersYet => 'Henüz müşteri yok. Eklemek için + simgesine dokunun.';

  @override
  String get noCustomersMatch => 'Aramanızla eşleşen müşteri yok.';

  @override
  String get owesMoney => 'Borçlu';

  @override
  String get settledUp => 'Hesap kapalı';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what yüklenemedi: $error';
  }

  @override
  String get takePhoto => 'Fotoğraf çek';

  @override
  String get chooseFromGallery => 'Galeriden seç';

  @override
  String get back => 'Geri';

  @override
  String callPhone(String phone) {
    return '$phone ara';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone WhatsApp';
  }

  @override
  String get clearSearch => 'Aramayı temizle';

  @override
  String get askHint => 'ör. Bu ay ne kadar kâr ettim?';

  @override
  String get acctTurnOffLockTitle => 'Uygulama Kilidi kapatılsın mı?';

  @override
  String get acctTurnOffLockBody => 'Bu telefona sahip olan herkes uygulamayı PIN olmadan açabilir.';

  @override
  String get acctTurnOff => 'Kapat';

  @override
  String get acctSetPinTitle => 'PIN belirle';

  @override
  String get acctPinLabel => '4-6 haneli PIN';

  @override
  String get acctPinMin => 'En az 4 hane';

  @override
  String get acctConfirmPin => 'PIN\'i onayla';

  @override
  String get acctPinMismatch => 'PIN\'ler eşleşmiyor';

  @override
  String get acctSetPin => 'PIN Belirle';

  @override
  String get acctBiometricTitle => 'Parmak izi/yüz de kullanılsın mı?';

  @override
  String get acctBiometricBody => 'Biyometrik doğrulama başarısız olursa yine PIN kullanabilirsiniz.';

  @override
  String get acctNoThanks => 'Hayır, teşekkürler';

  @override
  String get acctEnable => 'Etkinleştir';

  @override
  String get acctSetPasswordTitle => 'Parola belirle';

  @override
  String get acctSetPasswordIntro => 'Bir parola seçin; böylece bir sonraki sefer yalnızca Google ile değil, e-posta + parola ile de giriş yapabilirsiniz.';

  @override
  String get acctPassword => 'Parola';

  @override
  String get acctPasswordMin => 'En az 6 karakter olmalı';

  @override
  String get acctConfirmPassword => 'Parolayı onayla';

  @override
  String get acctPasswordsMismatch => 'Parolalar eşleşmiyor';

  @override
  String get acctSetPasswordButton => 'Parola Belirle';

  @override
  String get acctPasswordSet => 'Parola belirlendi — artık onunla da giriş yapabilirsiniz.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Parola belirlenemedi: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Parolayı değiştir';

  @override
  String get acctCurrentPassword => 'Mevcut parola';

  @override
  String get acctRequired => 'Zorunlu';

  @override
  String get acctNewPassword => 'Yeni parola';

  @override
  String get acctConfirmNewPassword => 'Yeni parolayı onayla';

  @override
  String get acctChange => 'Değiştir';

  @override
  String get acctPasswordChanged => 'Parola değiştirildi.';

  @override
  String get acctWrongPassword => 'Mevcut parola yanlış.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Parola değiştirilemedi: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Kullanıcı adını değiştir';

  @override
  String get acctUsername => 'Kullanıcı adı';

  @override
  String get acctUsernameEmpty => 'Kullanıcı adı boş olamaz';

  @override
  String get acctUsernameChanged => 'Kullanıcı adı değiştirildi.';

  @override
  String get acctChangeEmailTitle => 'E-postayı değiştir';

  @override
  String get acctNewEmail => 'Yeni e-posta';

  @override
  String get acctValidEmail => 'Geçerli bir e-posta girin';

  @override
  String get acctRequiredConfirm => 'Kimliğinizi doğrulamak için gerekli';

  @override
  String get acctGoogleConfirmFirst => 'Önce Google ile doğrulamanız istenecek.';

  @override
  String acctCheckEmail(String email) {
    return 'Değişikliği onaylamak için $email adresindeki bağlantıya bakın.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'parola ile girişi';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider kaldırılsın mı?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Bu hesapta artık $provider ile giriş yapamayacaksınız.';
  }

  @override
  String get acctRemove => 'Kaldır';

  @override
  String acctRemoved(String provider) {
    return '$provider kaldırıldı.';
  }

  @override
  String get acctSignedIn => 'Giriş yapıldı';

  @override
  String get acctEmailNotVerified => 'E-posta henüz doğrulanmadı.';

  @override
  String get acctVerificationSent => 'Doğrulama e-postası gönderildi.';

  @override
  String get acctResend => 'Tekrar gönder';

  @override
  String get acctSectionSignIn => 'GİRİŞ VE GÜVENLİK';

  @override
  String get acctRowChangeUsername => 'Kullanıcı Adını Değiştir';

  @override
  String get acctRowChangeEmail => 'E-postayı Değiştir';

  @override
  String get acctRowSetPassword => 'Parola Belirle';

  @override
  String get acctRowChangePassword => 'Parolayı Değiştir';

  @override
  String get acctRowUnlinkGoogle => 'Google Bağlantısını Kaldır';

  @override
  String get acctRowRemovePassword => 'Parolayı Kaldır';

  @override
  String get acctRowAppLock => 'Uygulama Kilidi (PIN)';

  @override
  String get acctRowBiometric => 'Parmak izi/yüz kullan';

  @override
  String get acctSignOutTitle => 'Çıkış yapılsın mı?';

  @override
  String get acctSignOutBody => 'Uygulamayı kullanmak için yeniden giriş yapmanız gerekecek.';

  @override
  String get acctSignOut => 'Çıkış Yap';

  @override
  String get acctDeleteAccount => 'Hesabı Sil';

  @override
  String get acctDeleting => 'Siliniyor...';

  @override
  String get acctDeleteTitle => 'Hesap silinsin mi?';

  @override
  String get acctDeleteBody => 'Bu işlem giriş bilgilerinizi kalıcı olarak siler. Uygulamayı kullanmak için yeniden kayıt olmanız gerekir. Bu işlem geri alınamaz.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Hesap silinemedi: $error';
  }

  @override
  String get itmNotFoundTitle => 'Ürün bulunamadı';

  @override
  String itmNotFoundBody(String barcode) {
    return '$barcode barkoduna sahip ürün yok. Şimdi yeni ürün olarak eklensin mi?';
  }

  @override
  String get itmAddItem => 'Ürün Ekle';

  @override
  String get itmEditItem => 'Ürünü Düzenle';

  @override
  String get itmMergeTitle => 'Yinelenen Ürünleri Birleştir';

  @override
  String get itmMergeBody => 'Aynı ada sahip ürünler en eski kayıtta birleştirilir ve stok miktarları toplanır. Bu işlem geri alınamaz.';

  @override
  String get itmMerge => 'Birleştir';

  @override
  String get itmNoDuplicates => 'Yinelenen ürün bulunamadı.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yinelenen ürün birleştirildi.',
      one: '1 yinelenen ürün birleştirildi.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Ürünü Sil';

  @override
  String get itmCannotUndo => 'Bu işlem geri alınamaz.';

  @override
  String get itmDeleteOffline => 'Silinemedi — bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ürünü Sil',
      one: '1 Ürünü Sil',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ürün silinsin mi? Bu işlem geri alınamaz.',
      one: '1 ürün silinsin mi? Bu işlem geri alınamaz.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Fotoğraf yüklenemedi ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Fotoğraf yüklenemedi: $error';
  }

  @override
  String get itmNoBarcodes => 'Henüz barkodu olan ürün yok.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Etiket Yazdır',
      one: '1 Etiket Yazdır',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Ürün veya kategori ara...';

  @override
  String get itmStopListening => 'Dinlemeyi durdur';

  @override
  String get itmVoiceSearch => 'Sesli arama';

  @override
  String get itmSort => 'Sırala';

  @override
  String get itmSortName => 'Ad (A-Z)';

  @override
  String get itmSortStockLow => 'Stok: azdan çoğa';

  @override
  String get itmSortRecent => 'Son eklenenler';

  @override
  String get itmFilterAll => 'Tümü';

  @override
  String get itmFilterLowStock => 'Düşük Stok';

  @override
  String get itmNoItemsYet => 'Henüz ürün yok. Eklemek için + simgesine dokunun.';

  @override
  String get itmNoItemsMatch => 'Aramanızla eşleşen ürün yok.';

  @override
  String get itmNoPriceChanges => 'Henüz kaydedilmiş fiyat değişikliği yok.';

  @override
  String get itmNoStockCorrections => 'Henüz kaydedilmiş stok düzeltmesi yok.';

  @override
  String get itmResetHistory => 'Geçmişi sıfırla';

  @override
  String get itmResetHistoryMsg => 'Bu ürünün geçmişi sıfırlansın mı? Bu işlem geri alınamaz.';

  @override
  String get itmSendPdf => 'PDF olarak gönder';

  @override
  String get itmNoteOptional => 'Not (isteğe bağlı)';

  @override
  String get itmNoteHint => 'Bu değişiklik için not ekleyin';

  @override
  String get itmRemoveEntry => 'Kaydı kaldır';

  @override
  String get itmRemoveEntryMsg => 'Bu kayıt geçmişten kaldırılsın mı? Bu işlem geri alınamaz.';

  @override
  String get itmEditEntry => 'Kaydı düzenle';

  @override
  String get itmPrevQty => 'Önceki';

  @override
  String get itmNewQty => 'Yeni';

  @override
  String itmCost(String amount) {
    return 'Maliyet: $amount';
  }

  @override
  String get itmMore => 'Daha fazla';

  @override
  String get itmMenuPrintLabel => 'Etiket yazdır';

  @override
  String get itmMenuDuplicate => 'Çoğalt';

  @override
  String get itmMenuPriceHistory => 'Fiyat geçmişi';

  @override
  String get itmMenuStockHistory => 'Stok düzeltme geçmişi';

  @override
  String itmLowStockBadge(int count) {
    return '$count düşük stok';
  }

  @override
  String itmStockLine(String qty) {
    return 'Stok: $qty';
  }

  @override
  String get itmOfflineSaved => 'Çevrimdışı — ürün bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get itmItemName => 'Ürün Adı';

  @override
  String get itmNameRequired => 'Ad zorunludur';

  @override
  String get itmPricePkr => 'Fiyat (PKR)';

  @override
  String get itmPriceRequired => 'Fiyat zorunludur';

  @override
  String get itmValidNumber => 'Geçerli bir sayı girin';

  @override
  String get itmUnit => 'Birim';

  @override
  String get itmCategoryHint => 'Kategori (isteğe bağlı, ör. Tesisat)';

  @override
  String get itmPreferredSupplier => 'Tercih Edilen Tedarikçi (isteğe bağlı)';

  @override
  String get itmPreferredSupplierHelper => 'Tek dokunuşla yeniden sipariş işleminde kullanılır';

  @override
  String get itmClear => 'Temizle';

  @override
  String get itmHsn => 'HSN Kodu (isteğe bağlı)';

  @override
  String get itmGstRate => 'GST Oranı % (isteğe bağlı)';

  @override
  String get itmBarcodeOptional => 'Barkod (isteğe bağlı)';

  @override
  String get itmScanOrType => 'Tarayın veya yazın';

  @override
  String get itmScanBarcode => 'Barkod tara';

  @override
  String get itmPurchaseCost => 'Alış Maliyeti (birim başına)';

  @override
  String get itmPurchaseCostHint => 'Stok alırken ödediğiniz tutar';

  @override
  String get itmWholesale => 'Toptan Fiyat (isteğe bağlı)';

  @override
  String get itmContractor => 'Müteahhit Fiyatı (isteğe bağlı)';

  @override
  String get itmFallsBack => 'Boşsa normal fiyat kullanılır';

  @override
  String get itmStockQty => 'Stok Miktarı';

  @override
  String get itmLowStockAlert => 'Şunun Altında Düşük Stok Uyarısı';

  @override
  String get itmFrequently => 'Sıklıkla birlikte alınanlar';

  @override
  String get itmSaveChanges => 'Değişiklikleri Kaydet';

  @override
  String get itmSaveItem => 'Ürünü Kaydet';

  @override
  String get itmPhotoSemantics => 'Ürün fotoğrafı, değiştirmek için dokunun';

  @override
  String get cdUpdateStatusTitle => 'Ödeme Durumunu Güncelle';

  @override
  String get cdMarkPaidQ => 'Bu fatura ödendi olarak işaretlensin mi?';

  @override
  String get cdMarkUnpaidQ => 'Bu fatura ödenmedi olarak işaretlensin mi?';

  @override
  String get cdConfirm => 'Onayla';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Güncellenemedi: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Çevrimdışı — değişiklik bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get cdConvertTitle => 'Faturaya Dönüştür';

  @override
  String get cdConvertBody => 'Bu işlem bu ürünlerin stokunu düşer ve teklifi gerçek bir faturaya çevirir. Devam edilsin mi?';

  @override
  String get cdConvert => 'Dönüştür';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Dönüştürülemedi: $detail';
  }

  @override
  String get cdReturnItems => 'Ürünleri İade Et';

  @override
  String get cdReturnHint => 'Her üründen kaç adet iade edileceğini belirleyin. Satılmış kalması için 0 bırakın.';

  @override
  String get cdDecreaseQty => 'Miktarı azalt';

  @override
  String get cdIncreaseQty => 'Miktarı artır';

  @override
  String get cdCreditTotal => 'Alacak toplamı';

  @override
  String get cdReturnSelected => 'Seçilenleri İade Et';

  @override
  String cdCouldNotReturn(String detail) {
    return 'İade edilemedi: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'İptal edilemedi: $detail';
  }

  @override
  String get cdNoPreviousBill => 'Tekrarlanacak önceki fatura yok';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Son fatura yüklenemedi: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Fatura müşteriye e-postayla gönderildi.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Fatura e-postayla gönderilemedi: $detail';
  }

  @override
  String get cdStatementEmailed => 'Ekstre müşteriye e-postayla gönderildi.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Ekstre e-postayla gönderilemedi: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Faturayı Sil';

  @override
  String get cdBillVoided => 'İPTAL';

  @override
  String get cdBillReturn => 'İADE';

  @override
  String get cdBillQuote => 'TEKLİF';

  @override
  String get cdBillPaid => 'ÖDENDİ';

  @override
  String get cdBillPartial => 'KISMİ';

  @override
  String get cdBillUnpaid => 'ÖDENMEDİ';

  @override
  String get cdBill => 'Fatura';

  @override
  String cdVoidedReason(String reason) {
    return 'İptal edildi: $reason';
  }

  @override
  String get cdViewInvoice => 'Faturayı Görüntüle';

  @override
  String get cdEmailInvoice => 'Faturayı E-postayla Gönder';

  @override
  String get cdEditBill => 'Faturayı Düzenle';

  @override
  String get cdReturnBill => 'Faturayı İade Et';

  @override
  String get cdVoidBill => 'Faturayı İptal Et';

  @override
  String get cdNoItems => 'Ürün yok';

  @override
  String get cdRepeatLast => 'Son Faturayı Tekrarla';

  @override
  String get cdLedgerPdf => 'Defter PDF\'i';

  @override
  String get cdEmailStatement => 'Ekstreyi E-postayla Gönder';

  @override
  String get cdCollectPayment => 'Ödeme Al';

  @override
  String get cdSendReminder => 'WhatsApp Hatırlatması Gönder';

  @override
  String get cdTotalBilled => 'Toplam Faturalanan';

  @override
  String get cdPaid => 'Ödenen';

  @override
  String get cdNoBills => 'Henüz fatura yok';

  @override
  String get cdBillActions => 'Fatura işlemleri';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$limit kredi limitinin $outstanding kadarı kullanıldı';
  }

  @override
  String get cdVoidBody => 'Bakiyelerden ve raporlardan çıkarılır, ancak geçmişte kalır. Stok geri yüklenir. Bu işlem geri alınamaz.';

  @override
  String get cdReason => 'Neden (isteğe bağlı)';

  @override
  String get frmOfflineCustomer => 'Çevrimdışı — müşteri bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get frmOfflineSupplier => 'Çevrimdışı — tedarikçi bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get frmEditCustomer => 'Müşteriyi Düzenle';

  @override
  String get frmCustomerName => 'Müşteri Adı';

  @override
  String get frmPhoneOptional => 'Telefon (isteğe bağlı)';

  @override
  String get frmCreditLimit => 'Kredi Limiti (PKR, isteğe bağlı)';

  @override
  String get frmCreditHelper => 'Bu müşterinin bakiyesi bu tutarı aşınca uyar';

  @override
  String get frmPriceTier => 'Fiyat Seviyesi';

  @override
  String get frmRetail => 'Perakende';

  @override
  String get frmWholesale => 'Toptan';

  @override
  String get frmContractor => 'Müteahhit';

  @override
  String get frmPriceTierHelper => 'Bu müşteri için faturada hangi ürün fiyatı otomatik doldurulsun';

  @override
  String get frmStrn => 'STRN (isteğe bağlı)';

  @override
  String get frmStrnCustomer => 'Faturalar için 13 haneli Satış Vergisi Kayıt Numarası';

  @override
  String get frmStrnSupplier => 'Alış faturaları için 13 haneli Satış Vergisi Kayıt Numarası';

  @override
  String get frmAddress => 'Adres (isteğe bağlı)';

  @override
  String get frmEmail => 'E-posta (isteğe bağlı)';

  @override
  String get frmEmailHelper => 'Bu müşteriye e-postayla fatura veya ekstre göndermenizi sağlar';

  @override
  String get frmSaveCustomer => 'Müşteriyi Kaydet';

  @override
  String get frmEditSupplier => 'Tedarikçiyi Düzenle';

  @override
  String get frmSupplierName => 'Tedarikçi Adı';

  @override
  String get frmSaveSupplier => 'Tedarikçiyi Kaydet';

  @override
  String get sdDeletePurchaseTitle => 'Alımı Sil';

  @override
  String get sdDeletePurchaseBody => 'Bu alımın stoku geri yüklenecek. Bu işlem geri alınamaz.';

  @override
  String get sdReturnToSupplier => 'Tedarikçiye İade Et';

  @override
  String get sdReturnHint => 'Her üründen kaç adet geri gönderileceğini belirleyin. Tutmak için 0 bırakın.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Teslim alındı olarak işaretlenemedi: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Bu alım ödendi olarak işaretlensin mi?';

  @override
  String get sdMarkUnpaidQ => 'Bu alım ödenmedi olarak işaretlensin mi?';

  @override
  String get sdTotalPurchased => 'Toplam Alım';

  @override
  String get sdPayable => 'Ödenecek';

  @override
  String sdPayableAmount(String amount) {
    return '$amount ödenecek';
  }

  @override
  String get sdNoPurchases => 'Henüz alım yok';

  @override
  String get sdPo => 'SS';

  @override
  String get sdDraftPo => 'TASLAK SS';

  @override
  String get sdPurchase => 'Alım';

  @override
  String get sdDraftNote => 'Taslak satın alma siparişi — henüz teslim alınmadı, stok veya maliyet henüz güncellenmedi.';

  @override
  String get sdReturnNote => 'Tedarikçiye iade / alacak dekontu.';

  @override
  String get sdMarkReceived => 'Teslim Alındı Olarak İşaretle';

  @override
  String get sdEditPurchase => 'Alımı Düzenle';

  @override
  String get sdPurchaseActions => 'Alım işlemleri';

  @override
  String get slDeleteSupplier => 'Tedarikçiyi Sil';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tedarikçiyi Sil',
      one: '1 Tedarikçiyi Sil',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tedarikçi ve tüm alımları silinsin mi? Bu işlem geri alınamaz.',
      one: '1 tedarikçi ve tüm alımları silinsin mi? Bu işlem geri alınamaz.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV\'de bir başlık satırı ve en az bir tedarikçi olmalı.';

  @override
  String get slImportTitle => 'Tedarikçileri İçe Aktar';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" dosyasında $count tedarikçi bulundu. Hepsi içe aktarılsın mı?',
      one: '\"$file\" dosyasında 1 tedarikçi bulundu. Hepsi içe aktarılsın mı?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tedarikçi içe aktarıldı.',
      one: '1 tedarikçi içe aktarıldı.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Henüz tedarikçi yok. Eklemek için + simgesine dokunun.';

  @override
  String get slSearchHint => 'Tedarikçi veya telefon ara...';

  @override
  String get slNoMatch => 'Aramanızla eşleşen tedarikçi yok.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tedarikçi',
      one: '1 tedarikçi',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Tedarikçi Borçları';

  @override
  String get sduNothingOwed => 'Tedarikçilere borç yok 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tedarikçiye borç var',
      one: '1 tedarikçiye borç var',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'en eski ödenmemiş alımdan bu yana $days gün',
      one: 'en eski ödenmemiş alımdan bu yana 1 gün',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 gün';

  @override
  String get duBucket1 => '30–60 gün';

  @override
  String get duBucket2 => '60+ gün';

  @override
  String get duTitle => 'Alacak Merkezi';

  @override
  String get duNoDues => 'Bekleyen alacak yok 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count müşterinin borcu var',
      one: '1 müşterinin borcu var',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'en eski ödenmemiş faturadan bu yana $days gün',
      one: 'en eski ödenmemiş faturadan bu yana 1 gün',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount bekliyor';
  }

  @override
  String get cpNoOutstanding => 'Bu müşterinin bekleyen bakiyesi yok';

  @override
  String get cpValidAmount => 'Geçerli bir tutar girin';

  @override
  String cpExceeds(String amount) {
    return 'Tutar, bekleyen $amount bakiyeyi aşıyor';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name müşterisinden $amount tahsil edildi';
  }

  @override
  String get cpOfflineSaved => 'Çevrimdışı — ödeme bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String cpOwes(String amount, String name) {
    return '$name müşterisinin $amount borcu var. Önce en eski ödenmemiş faturalara uygulanır.';
  }

  @override
  String get cpAmountLabel => 'Tahsil Edilen Tutar (PKR)';

  @override
  String get cpCollect => 'Tahsil Et';

  @override
  String get usNoItems => 'Güncellenecek ürün yok.';

  @override
  String get usHelp => 'Her ürün için yeni stoku belirleyin, ardından Tümünü Kaydet\'e dokunun.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  mevcut: $qty';
  }

  @override
  String usNew(String qty) {
    return 'yeni: $qty';
  }

  @override
  String get usSubtract => '1 çıkar';

  @override
  String get usAdd => '1 ekle';

  @override
  String get usNoChanges => 'Değişiklik yok';

  @override
  String usSaveAll(int count) {
    return 'Tümünü Kaydet ($count değişti)';
  }

  @override
  String get srHint => 'Müşteri, ürün, tutar ara...';

  @override
  String get srFailed => 'Arama başarısız — bağlantınızı kontrol edin.';

  @override
  String get srTitle => 'Mağazanızda arayın';

  @override
  String get srSubtitle => 'Müşterileri ada veya telefona, faturaları tutara göre bulun.';

  @override
  String srNoMatches(String query) {
    return '\"$query\" için eşleşme yok';
  }

  @override
  String get srTryDifferent => 'Farklı bir ad, telefon numarası veya tutar deneyin.';

  @override
  String get srBills => 'Faturalar';

  @override
  String get srNoItemList => 'Ürün listesi yok';

  @override
  String get abAddAtLeastOne => 'En az bir ürün ekleyin';

  @override
  String get abQuotationUpdated => 'Teklif güncellendi!';

  @override
  String get abBillUpdated => 'Fatura güncellendi!';

  @override
  String get abQuotationSaved => 'Teklif kaydedildi!';

  @override
  String get abBillCreated => 'Fatura başarıyla oluşturuldu!';

  @override
  String abTotalAmount(String amount) {
    return 'Toplam: $amount';
  }

  @override
  String get abShare => 'Paylaş';

  @override
  String get abDoneReturn => 'Bitti ve Geri Dön';

  @override
  String get abOverLimitBody => 'Bu işlem müşteriyi kredi limitinin üzerine çıkarır.';

  @override
  String get abOverLimitTitle => 'Kredi limiti aşıldı';

  @override
  String get abBillAnyway => 'Yine de faturala';

  @override
  String get abOfflineBill => 'Çevrimdışı — fatura bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get abEditQuotation => 'Teklifi Düzenle';

  @override
  String get abEditBill => 'Faturayı Düzenle';

  @override
  String get abNewQuotation => 'Yeni Teklif';

  @override
  String get abAddBill => 'Fatura Ekle';

  @override
  String get abCouldNotLoadItems => 'Ürünler yüklenemedi.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Bu fatura müşteriyi $total seviyesine çıkarır ve $limit kredi limitini aşar.';
  }

  @override
  String get abTapAddItemBill => 'Fatura başlatmak için aşağıdaki \"Ürün Ekle\"ye dokunun';

  @override
  String get abNoCatalog => 'Katalogda henüz ürün yok';

  @override
  String get abScan => 'Tara';

  @override
  String get abDiscountRs => 'İndirim (Rs)';

  @override
  String get abSubtotal => 'Ara toplam';

  @override
  String get abTotal => 'Toplam';

  @override
  String get abSaveAsQuotation => 'Teklif Olarak Kaydet';

  @override
  String get abQuotationLocked => 'Mevcut bir fatura tekrar teklife çevrilemez';

  @override
  String get abQuotationNote => 'Faturaya dönüştürülene kadar stok düşülmez';

  @override
  String get abPaymentStatus => 'Ödeme Durumu';

  @override
  String get abUnpaid => 'Ödenmedi';

  @override
  String get abPaymentMethod => 'Ödeme Yöntemi';

  @override
  String get abCash => 'Nakit';

  @override
  String get abBankTransfer => 'Banka Havalesi';

  @override
  String get abCheque => 'Çek';

  @override
  String get abSaveQuotation => 'Teklifi Kaydet';

  @override
  String get abSaveBill => 'Faturayı Kaydet';

  @override
  String abAdded(String name) {
    return '$name eklendi';
  }

  @override
  String get apNewItem => 'Yeni Ürün…';

  @override
  String get apNewItemHint => 'Önce kataloğa yeni bir ürün ekleyin';

  @override
  String get apOfflinePurchase => 'Çevrimdışı — alım bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get apEditPo => 'Satın Alma Siparişini Düzenle';

  @override
  String get apNewPo => 'Yeni Satın Alma Siparişi';

  @override
  String get apAddPurchase => 'Alım Ekle';

  @override
  String get apTapAddItem => 'Alım başlatmak için aşağıdaki \"Ürün Ekle\"ye dokunun';

  @override
  String get apSaveAsPo => 'Satın Alma Siparişi Olarak Kaydet';

  @override
  String get apPoLocked => 'Teslim alınmış bir alım tekrar taslak siparişe çevrilemez';

  @override
  String get apPoNote => 'Mal teslim alındı olarak işaretlenene kadar stok veya maliyet güncellenmez';

  @override
  String get apUnpaidCredit => 'Ödenmedi (Vadeli)';

  @override
  String get apSavePo => 'Satın Alma Siparişini Kaydet';

  @override
  String get apSavePurchase => 'Alımı Kaydet';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Mevcut maliyet: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Maliyet belirlenmedi  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Tarama başarısız: sunucu hatası $code';
  }

  @override
  String get scOfflineSaved => 'Çevrimdışı — fotoğraf kaydedildi, tekrar çevrimiçi olunca otomatik okunacak';

  @override
  String get scStillOffline => 'Hâlâ çevrimdışı';

  @override
  String get scCouldNotCreateCustomer => 'Müşteri oluşturulamadı — tekrar deneyin.';

  @override
  String get scCouldNotCreateSupplier => 'Tedarikçi oluşturulamadı — tekrar deneyin.';

  @override
  String scBillSavedFor(String name) {
    return '$name için fatura kaydedildi';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name firmasından alım kaydedildi';
  }

  @override
  String get scWhichCustomer => 'Bu hangi müşteri?';

  @override
  String get scWhichSupplier => 'Bu hangi tedarikçi?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Kayıttaki en yakın eşleşme: $name (%$score benzer)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Evet, bu $name';
  }

  @override
  String get scOtherwiseCustomer => 'Aksi halde yeni bir müşteri oluşturun:';

  @override
  String get scOtherwiseSupplier => 'Aksi halde yeni bir tedarikçi oluşturun:';

  @override
  String get scNoMatchCustomer => 'Eşleşen müşteri bulunamadı. Yeni bir tane oluşturun:';

  @override
  String get scNoMatchSupplier => 'Eşleşen tedarikçi bulunamadı. Yeni bir tane oluşturun:';

  @override
  String get scCustomerName => 'Müşteri adı';

  @override
  String get scSupplierName => 'Tedarikçi adı';

  @override
  String get scCreateNew => 'Yeni Oluştur';

  @override
  String get scTitleBill => 'Fatura Tara';

  @override
  String get scIntroBill => 'Faturanın fotoğrafını çekin. El yazısı olması sorun değil, Sindhi, Urduca ya da İngilizce hepsi olur. Kaydetmeden önce her şeyi kontrol edebilirsiniz.';

  @override
  String get scIntroPurchase => 'Tedarikçinin faturasının fotoğrafını çekin. Sindhi, Urduca ya da İngilizce hepsi olur. Kaydetmeden önce her şeyi kontrol edebilirsiniz.';

  @override
  String get scReadingBill => 'Fatura okunuyor…';

  @override
  String get scScanBill => 'Fatura Tara';

  @override
  String get scReadingInvoice => 'Fatura okunuyor…';

  @override
  String get scScanInvoice => 'Fatura Tara';

  @override
  String get scQueued => 'Sıradaki Taramalar';

  @override
  String get scReady => 'İncelemeye hazır';

  @override
  String get scFailed => 'Başarısız';

  @override
  String get scWaiting => 'Bağlantı bekleniyor';

  @override
  String get scRetry => 'Tekrar dene';

  @override
  String rpCouldNotLoad(String error) {
    return 'Raporlar yüklenemedi: $error';
  }

  @override
  String get rpHeadline => 'Bu ayın öne çıkan rakamları';

  @override
  String get rpProfitThisMonth => 'Bu Ayın Kârı';

  @override
  String get rpNoData => 'Henüz veri yok';

  @override
  String get rpSalesTax => 'Satış Vergisi';

  @override
  String rpSalesTaxFor(String month) {
    return '$month satış vergisi raporu';
  }

  @override
  String get rpViewSalesTax => 'Satış Vergisi Raporunu Görüntüle';

  @override
  String get rpQuickReports => 'Hızlı Raporlar';

  @override
  String get rpQuickSub => 'Doğrudan belirli bir rapora git';

  @override
  String get expensesTitle => 'Giderler';

  @override
  String get rpRateCard => 'Fiyat Listesi';

  @override
  String get rpDetails => 'Ayrıntılar';

  @override
  String get rpDetailsSub => 'Tam dökümler ve sıralamalar';

  @override
  String get rpOutstandingByCustomer => 'Müşteriye Göre Bekleyen Bakiyeler';

  @override
  String get rpNoOutstanding => 'Bekleyen bakiye yok';

  @override
  String get rpMonthlyTotals => 'Aylık Toplamlar';

  @override
  String get rpMostSold => 'En Çok Satılan Ürünler';

  @override
  String get rpNoItemsRecorded => 'Henüz kayıtlı ürün yok';

  @override
  String get rpTopCustomers => 'Gelire Göre En İyi Müşteriler';

  @override
  String get rpNoSalesRecorded => 'Henüz kayıtlı satış yok';

  @override
  String get rpTotalOutstanding => 'Toplam Bekleyen';

  @override
  String get rpViewCustomers => 'Müşterileri görüntüle';

  @override
  String get lblInvoice => 'fatura';

  @override
  String get lblLedger => 'defter';

  @override
  String get lblRateCard => 'fiyat listesi';

  @override
  String get exCsvNeedsRows => 'CSV\'de bir başlık satırı ve en az bir gider olmalı.';

  @override
  String get exCsvHeader => 'CSV başlığı \"description\" ve \"amount\" sütunlarını içermeli.';

  @override
  String exLineBadAmount(int line) {
    return 'Satır $line: açıklama eksik veya tutar geçersiz — dosyayı düzeltip tekrar deneyin.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Satır $line: geçersiz tarih \"$date\" — YYYY-AA-GG biçimini kullanın.';
  }

  @override
  String get exImportTitle => 'Giderleri İçe Aktar';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" dosyasında $count gider bulundu. Hepsi içe aktarılsın mı?',
      one: '\"$file\" dosyasında 1 gider bulundu. Hepsi içe aktarılsın mı?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gider içe aktarıldı.',
      one: '1 gider içe aktarıldı.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'İçe aktarma başarısız: sunucu hatası $code';
  }

  @override
  String get exDeleteTitle => 'Gideri Sil';

  @override
  String get exAdd => 'Gider Ekle';

  @override
  String get exEdit => 'Gideri Düzenle';

  @override
  String get exDescription => 'Açıklama';

  @override
  String get exAmountRs => 'Tutar (Rs)';

  @override
  String get exCategory => 'Kategori';

  @override
  String exDate(String date) {
    return 'Tarih: $date';
  }

  @override
  String get exRepeats => 'Her ay tekrarlanır';

  @override
  String get exRepeatsHint => 'Kira, elektrik, maaş vb.';

  @override
  String get exReceiptTap => 'Makbuz fotoğrafı, değiştirmek için dokunun';

  @override
  String get exReceiptOptional => 'Makbuz fotoğrafı (isteğe bağlı)';

  @override
  String get exEnterValid => 'Bir açıklama ve geçerli bir tutar girin.';

  @override
  String get exOffline => 'Çevrimdışı — gider bu cihaza kaydedildi, tekrar çevrimiçi olunca otomatik senkronize edilecek';

  @override
  String get exSave => 'Gideri Kaydet';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bu ay $count tekrarlayan gider ödenecek',
      one: 'Bu ay 1 tekrarlayan gider ödenecek',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Ekle';

  @override
  String get exTotal => 'Toplam Gider';

  @override
  String exCategoryChip(String name) {
    return 'Kategori: $name';
  }

  @override
  String get exNoneLogged => 'Henüz kayıtlı gider yok';

  @override
  String exNoneInCategory(String name) {
    return 'Henüz $name gideri yok';
  }

  @override
  String get exViewReceipt => 'Makbuzu görüntüle';

  @override
  String get exEditRow => 'Gideri düzenle';

  @override
  String get exDeleteRow => 'Gideri sil';

  @override
  String gstServerReturned(String first, String second) {
    return 'Sunucu $first/$second döndürdü';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST verileri yüklenemedi: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'İndirme başarısız ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename kaydedildi';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'İndirilenler/$filename konumuna kaydedildi';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'İndirilemedi: $error';
  }

  @override
  String get gstTitle => 'Satış Vergisi Raporu';

  @override
  String get gstOutwardDetail => 'Giden Satışlar — Fatura Ayrıntısı';

  @override
  String get gstNoBills => 'Bu ay için fatura yok.';

  @override
  String get gstHsn => 'HSN Özeti';

  @override
  String get gstInvoiceWise => 'Fatura bazında ayrıntılar';

  @override
  String get gstMonthly => 'Aylık Özet';

  @override
  String get gstOutwardTaxable => 'Vergiye tabi giden teslimatlar';

  @override
  String get gstItc => 'Girdi Vergisi Kredisi (alımlardan)';

  @override
  String get gstSave => 'Kaydet';

  @override
  String get rcValidAmount => 'Geçerli bir tutar girin.';

  @override
  String get rcExpected => 'Beklenen Nakit (bugünkü nakit satışlar)';

  @override
  String get rcAlsoCollected => 'Bugün ayrıca tahsil edildi (çekmecede sayılmadı)';

  @override
  String get rcCounted => 'Çekmecede Sayılan Nakit (Rs)';

  @override
  String get rcCompare => 'Karşılaştır';

  @override
  String get rcMatches => 'Tam olarak tutuyor!';

  @override
  String rcExtra(String amount) {
    return 'Çekmecede $amount fazla';
  }

  @override
  String rcMissing(String amount) {
    return 'Çekmecede $amount eksik';
  }

  @override
  String get pbiTitle => 'Ürüne Göre Kâr';

  @override
  String get pbiNoSales => 'Henüz satış yok';

  @override
  String get pbiByCategory => 'Kategoriye Göre';

  @override
  String get pbiItemsByProfit => 'Kâra Göre Ürünler';

  @override
  String get svTitle => 'Stok Değeri';

  @override
  String get svNone => 'Elde stok yok';

  @override
  String get svItemsByValue => 'Değere Göre Ürünler';

  @override
  String svSummary(String items, String units) {
    return '$items ürün · rafta $units birim';
  }

  @override
  String svTied(String amount) {
    return 'Stokta $amount bağlı';
  }

  @override
  String get svEstimated => 'satış fiyatından tahmin';

  @override
  String get bkRestoreTitle => 'Yedek Geri Yüklensin mi?';

  @override
  String bkRestoreBody(String filename) {
    return 'Bu işlem mevcut TÜM verileri \"$filename\" yedek dosyasıyla değiştirir. Devam edilsin mi?';
  }

  @override
  String get bkRestore => 'Geri Yükle';

  @override
  String get bkRestoreDoneTitle => 'Geri Yükleme Tamamlandı';

  @override
  String get bkRestoreDoneBody => 'Verileriniz geri yüklendi.';

  @override
  String get bkOk => 'Tamam';

  @override
  String bkRestoreFailed(String detail) {
    return 'Geri yükleme başarısız: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Geri yüklenemedi: $error';
  }

  @override
  String get bkSaveToDownloads => 'İndirilenlere Kaydet';

  @override
  String get bkIntroAdmin => 'Tüm verileriniz tek bir veritabanı dosyasında durur. Düzenli olarak bir kopya indirin ve bir sorun çıkarsa geri yükleyin.';

  @override
  String get bkIntroStaff => 'Tam veritabanı yedeği ve geri yükleme yalnızca yöneticiler içindir. Bir yöneticiye sorun veya ihtiyacınız olanı aşağıdan CSV olarak dışa aktarın.';

  @override
  String get bkBackupDb => 'Veritabanını Yedekle';

  @override
  String get bkBackupDbSub => 'Tüm veritabanını tek dosya olarak indirin ve paylaşın (WhatsApp, Drive, e-posta).';

  @override
  String get bkDownloadPhone => 'Yedeği Telefona İndir';

  @override
  String get bkShareBackup => 'Yedeği Paylaş';

  @override
  String get bkAutoTitle => 'Otomatik Yedekler';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sunucuda $count günlük yedek saklanıyor, en yenisi $time tarihli. Kendiliğinden çalışır — burada yapılacak bir şey yok.',
      one: 'Sunucuda 1 günlük yedek saklanıyor, en yenisi $time tarihli. Kendiliğinden çalışır — burada yapılacak bir şey yok.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Mevcut verilerin yerine geçecek kayıtlı bir yedek dosyası seçin.';

  @override
  String get bkRestoreFromFile => 'Yedek Dosyasından Geri Yükle';

  @override
  String get bkExportCsv => 'CSV\'ye Aktar';

  @override
  String get bkExportSub => 'Bunları Excel\'de açın veya paylaşın.';

  @override
  String get bkRangeAll => 'Faturalar/Giderler: tüm zamanlar';

  @override
  String bkRangeSome(String end, String start) {
    return 'Faturalar/Giderler: $start ile $end arası';
  }

  @override
  String get bkSetRange => 'Aralık Belirle';

  @override
  String get bkClearRange => 'Aralığı temizle';

  @override
  String get ntNever => 'Hiç tetiklenmedi';

  @override
  String get ntJustNow => 'Az önce';

  @override
  String ntMinutesAgo(int count) {
    return '$count dk önce';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count sa önce';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count g önce';
  }

  @override
  String get ntTitle => 'Akıllı Bildirimler';

  @override
  String get ntTapHint => 'Bir bildirimi tetikleyip canlı sonuçları görmek için \"Şimdi Kontrol Et\"e dokunun.';

  @override
  String get ntLowStockSub => 'Ürünler yeniden sipariş seviyesinin altına düşünce bildir.';

  @override
  String get ntCheckNow => 'Şimdi Kontrol Et';

  @override
  String get ntOverdue => 'Vadesi Geçmiş Ödeme Hatırlatmaları';

  @override
  String get ntOverdueSub => 'Önceki günlerin ödenmemiş faturaları hakkında bildir.';

  @override
  String get ntDaily => 'Günlük İşletme Özeti';

  @override
  String get ntDailySub => 'Dünün satışları, tahsilatları ve kârı tek bakışta.';

  @override
  String get ntSendSummary => 'Özeti Gönder';

  @override
  String get ntRunning => 'Çalışıyor…';

  @override
  String get ntLowStockItems => 'Düşük Stoklu Ürünler';

  @override
  String get ntSales => 'Satışlar';

  @override
  String get ntCollected => 'Tahsil Edilen';

  @override
  String get ntProfit => 'Kâr';

  @override
  String get auChecking => 'Güncellemeler denetleniyor…';

  @override
  String get auLatest => 'En son sürümü kullanıyorsunuz.';

  @override
  String get auAvailable => 'Güncelleme mevcut';

  @override
  String auNewer(int code) {
    return 'Book-Keep\'in daha yeni bir sürümü (yapı $code) hazır.';
  }

  @override
  String get auLater => 'Sonra';

  @override
  String get auUpdate => 'Güncelle';

  @override
  String get auDownloading => 'Güncelleme indiriliyor';

  @override
  String auSaved(String name) {
    return '$name İndirilenler klasörünüze kaydedildi.';
  }

  @override
  String get auAllowInstall => 'Book-Keep\'in uygulama yüklemesine izin verin, sonra tekrar Güncelle\'ye dokunun.';

  @override
  String get auFailed => 'Güncellenemedi — bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get lgSearch => 'Dil ara';

  @override
  String lgNoMatch(String query) {
    return '\"$query\" ile eşleşen dil yok';
  }

  @override
  String get alVoided => 'Bir faturayı iptal etti';

  @override
  String get alDeletedBill => 'Bir faturayı sildi';

  @override
  String get alReturned => 'Bir faturayı iade etti';

  @override
  String get alDeletedCustomer => 'Bir müşteriyi sildi';

  @override
  String get alDeletedSupplier => 'Bir tedarikçiyi sildi';

  @override
  String get alCreatedAccount => 'Bir hesap oluşturdu';

  @override
  String get alUpdatedAccount => 'Bir hesabı güncelledi';

  @override
  String get alDeletedAccount => 'Bir hesabı sildi';

  @override
  String get alTitle => 'Etkinlik Günlüğü';

  @override
  String get alNone => 'Henüz kayıtlı etkinlik yok';

  @override
  String get blkEnterOne => 'En az bir ürün girin';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ürün başarıyla eklendi',
      one: '1 ürün başarıyla eklendi',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Toplu Ürün Ekle';

  @override
  String get blkFormat => 'Satır başına bir ürün, biçim: Ad, Fiyat, Birim, Kategori';

  @override
  String get blkOptional => 'Birim ve kategori isteğe bağlıdır (varsayılan: piece, yok)';

  @override
  String get blkAddAll => 'Tüm Ürünleri Ekle';

  @override
  String get prSend => 'Ödeme Hatırlatması Gönder';

  @override
  String get prTone => 'Ton Seçin:';

  @override
  String get prPolite => 'Nazik';

  @override
  String get prStandard => 'Standart';

  @override
  String get prUrgent => 'Acil';

  @override
  String get prPreviewQr => 'JazzCash Ödeme QR\'ını Önizle';

  @override
  String get prShareText => 'Metni Paylaş';

  @override
  String get dsRemaining => 'Kalan';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount indirim dahil';
  }

  @override
  String get dsItems => 'Ürünler';

  @override
  String get dsDiscount => 'İndirim';

  @override
  String get lkWrongPin => 'Yanlış PIN';

  @override
  String get lkEnterPin => 'PIN girin';

  @override
  String get lkChecking => 'Parmak izi kontrol ediliyor...';

  @override
  String get bcTitle => 'Barkod Tara';

  @override
  String get bcTorchNa => 'Bu cihazda el feneri kullanılamıyor';

  @override
  String get bcTorch => 'El feneri';

  @override
  String get bcPoint => 'Kamerayı bir barkoda doğrultun';

  @override
  String get qrNoNumber => 'JazzCash numarası ayarlanmamış. Ödeme QR kodunu göstermek için Ayarlar\'da ayarlayın.';

  @override
  String get qrPay => 'JazzCash ile Öde';

  @override
  String get qrInvalid => 'Geçersiz QR verisi';

  @override
  String qrAmount(String amount) {
    return 'Tutar: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'JazzCash numarasını kopyala';

  @override
  String get qrCopied => 'JazzCash numarası panoya kopyalandı';

  @override
  String get qrHint => 'Ödemek için bu numarayı JazzCash uygulamanızda tarayın veya kopyalayın.';

  @override
  String clOwed(String amount) {
    return '$amount bekliyor';
  }

  @override
  String get lnEnterEmailFirst => 'Önce yukarıya geçerli bir e-posta girin.';

  @override
  String get lnResetSent => 'Parola sıfırlama e-postası gönderildi — gelen kutunuzu kontrol edin.';

  @override
  String get lnNoAccount => 'Bu e-posta için hesap bulunamadı.';

  @override
  String get lnWrongPassword => 'Parola yanlış.';

  @override
  String get lnInvalidEmail => 'Bu geçerli bir e-posta adresine benzemiyor.';

  @override
  String get lnDisabled => 'Bu hesap devre dışı bırakıldı.';

  @override
  String get lnTooMany => 'Çok fazla deneme — bir dakika sonra tekrar deneyin.';

  @override
  String get lnNoInternet => 'İnternet bağlantısı yok.';

  @override
  String get lnWeakPassword => 'Parola en az 6 karakter olmalı.';

  @override
  String get lnCouldNotSignIn => 'Giriş yapılamadı. Lütfen tekrar deneyin.';

  @override
  String get lnWrongPasswordHint => 'Parola yanlış. Tekrar deneyin veya \"Parolamı unuttum?\"a dokunun.';

  @override
  String get lnWrongEmail => 'E-posta yanlış — bu adresi kullanan hesap yok.';

  @override
  String get lnWrongEmailOrPassword => 'E-posta veya parola yanlış.';

  @override
  String get lnWrongUsername => 'Kullanıcı adı yanlış — bu adı kullanan hesap yok.';

  @override
  String get lnWelcome => 'Tekrar hoş geldiniz';

  @override
  String lnSignInTo(String app) {
    return '$app uygulamasına giriş yapın';
  }

  @override
  String get lnEmailOrUsername => 'E-posta veya Kullanıcı Adı';

  @override
  String get lnRemember => 'Beni hatırla';

  @override
  String get lnForgot => 'Parolanızı mı unuttunuz?';

  @override
  String get lnSignIn => 'Giriş Yap';

  @override
  String get lnGoogle => 'Google ile devam et';

  @override
  String get lnNew => 'Yeni misiniz?';

  @override
  String get lnCreate => 'Hesap oluştur';

  @override
  String suCreated(String email) {
    return '$email için hesap oluşturuldu. Bir doğrulama e-postası gönderildi (isteğe bağlı).';
  }

  @override
  String suSetup(String app) {
    return '$app kurulumu';
  }

  @override
  String get suName => 'Ad';

  @override
  String get suEmail => 'E-posta';

  @override
  String suPhoneDigits(int digits) {
    return 'Geçerli $digits haneli bir numara girin';
  }

  @override
  String get suCreateBtn => 'Hesap Oluştur';

  @override
  String get suHaveAccount => 'Zaten hesabınız var mı?';

  @override
  String get suAlreadyExists => 'Bu e-posta için zaten bir hesap var.';

  @override
  String get suInvalidEmail => 'Geçersiz e-posta adresi.';

  @override
  String get agShow => 'Parolayı göster';

  @override
  String get agHide => 'Parolayı gizle';

  @override
  String get adAccounts => 'Hesaplar';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıtlı hesap',
      one: '1 kayıtlı hesap',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Ekle';

  @override
  String get adNoAccounts => 'Hesap bulunamadı.';

  @override
  String get adAccountability => 'Hesap Verebilirlik';

  @override
  String get adAccountabilitySub => 'Kimin neyi iptal ettiği, sildiği veya iade ettiği ve hesap değişiklikleri.';

  @override
  String get adActivitySub => 'İptal edilen faturalar, silmeler, hesap değişiklikleri';

  @override
  String get adServer => 'Sunucu';

  @override
  String get adServerSub => 'Bu uygulamanın konuştuğu yer. Kurulumdan sonra nadiren değiştirilmesi gerekir.';

  @override
  String get adServerHint => 'Emülatör 10.0.2.2 kullanır; gerçek bir telefon aynı Wi-Fi\'daki dizüstü bilgisayarın IP\'sine ihtiyaç duyar. Değiştirmek tüm hesapları etkiler.';

  @override
  String get adApiBase => 'API Temel URL\'si';

  @override
  String get adSaveServer => 'Sunucu Adresini Kaydet';

  @override
  String get adEmailSetSub => 'Kurulu — personel müşterilere fatura/ekstre e-postalayabilir.';

  @override
  String get adNotSetUp => 'Henüz kurulmadı.';

  @override
  String get adEmailSetBody => 'E-posta kurulu. Personelin bir faturayı veya ekstreyi doğrudan müşteriye e-postalamasını sağlar.';

  @override
  String get adEmailHelp => 'Bir Gmail adresi uygulama parolasıyla çalışır (smtp.gmail.com, bağlantı noktası 587) ya da e-posta sağlayıcınızın SMTP bilgilerini kullanın.';

  @override
  String get adSmtpHost => 'SMTP Sunucusu';

  @override
  String get adSmtpPort => 'SMTP Bağlantı Noktası';

  @override
  String get adEmailAddress => 'E-posta Adresi';

  @override
  String get adPwKeep => 'Parola (mevcut olanı korumak için boş bırakın)';

  @override
  String get adPwApp => 'Parola (uygulama parolası, giriş parolanız değil)';

  @override
  String get adFromName => 'Gönderen Adı (isteğe bağlı)';

  @override
  String get adFromHint => 'Hırdavat Dükkânım';

  @override
  String get adSaving => 'Kaydediliyor...';

  @override
  String get adSaveEmail => 'E-posta Ayarlarını Kaydet';

  @override
  String get adAddAccount => 'Hesap ekle';

  @override
  String get adNameOpt => 'Ad (isteğe bağlı)';

  @override
  String get adAtLeast6 => 'En az 6 karakter';

  @override
  String get adGrantAdmin => 'Yönetici yetkisi ver';

  @override
  String get adCanManage => 'İptal/silme/iade yapabilir';

  @override
  String get adCanManageHint => 'Bir faturayı iptal etmek veya silmek, bir faturayı iade etmek veya bir müşteriyi/tedarikçiyi silmek. Yöneticide bu yetki her zaman vardır.';

  @override
  String get adCreate => 'Oluştur';

  @override
  String get adAccountCreated => 'Hesap oluşturuldu.';

  @override
  String adCreateFailed(String error) {
    return 'Oluşturma başarısız: $error';
  }

  @override
  String get adEditAccount => 'Hesabı düzenle';

  @override
  String get adAdminSwitch => 'Yönetici';

  @override
  String get adAdminHint => 'Yönetici panelini açabilir';

  @override
  String get adDisabled => 'Devre dışı';

  @override
  String get adDisabledHint => 'Oturum açması engellendi';

  @override
  String get adAccountUpdated => 'Hesap güncellendi.';

  @override
  String adUpdateFailed(String error) {
    return 'Güncelleme başarısız: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label kalıcı olarak kaldırılacak ve artık oturum açamayacak.';
  }

  @override
  String get adAccountDeleted => 'Hesap silindi.';

  @override
  String adDeleteFailed(String error) {
    return 'Silme başarısız: $error';
  }

  @override
  String get adBadgeAdmin => 'YÖNETİCİ';

  @override
  String get adBadgeDisabled => 'DEVRE DIŞI';

  @override
  String get adOff => 'Yönetici paneli kapalı';

  @override
  String get adCheckAgain => 'Tekrar kontrol et';

  @override
  String get adAccessRequired => 'Yönetici erişimi gerekli';

  @override
  String get adAccessBody => 'Hesapları yalnızca dükkân yöneticileri yönetebilir. Dükkân sahibinden size yönetici erişimi vermesini isteyin.';

  @override
  String get adCouldNotLoad => 'Yönetici paneli yüklenemedi.';

  @override
  String get adBadPort => 'Geçerli bir SMTP bağlantı noktası numarası girin.';

  @override
  String get adEmailSaved => 'E-posta ayarları kaydedildi.';

  @override
  String adEmailSaveFailed(String error) {
    return 'E-posta ayarları kaydedilemedi: $error';
  }

  @override
  String get adServerEmpty => 'Sunucu adresi boş olamaz.';

  @override
  String get adServerSaved => 'Sunucu adresi kaydedildi. Ekranlar bir sonraki yüklemede bunu kullanacak.';

  @override
  String get lnOr => 'veya';

  @override
  String get scNotABill => 'Bu bir faturaya benzemiyor. Faturanın net bir fotoğrafıyla tekrar deneyin.';

  @override
  String get scNotAnInvoice => 'Bu bir faturaya benzemiyor. Tedarikçi faturasının net bir fotoğrafıyla tekrar deneyin.';

  @override
  String get jqOpenFull => 'Tam boyut';

  @override
  String get jqCopy => 'Numarayı kopyala';

  @override
  String get jqSheetTitle => 'JazzCash QR';

  @override
  String get jqSheetHint => 'Müşteriler size ödeme yapmak için bunu JazzCash uygulamasında tarar.';

  @override
  String get jqCheck => 'Numarayı kontrol edin';

  @override
  String get askVoice => 'Ses';

  @override
  String get askVoiceFallbackNote => 'Bu, telefonunuzun sesiyle okunuyor.';

  @override
  String get askPace => 'Hız';

  @override
  String get askTone => 'Ton';

  @override
  String get askPaceSlower => 'Daha yavaş';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Daha hızlı';

  @override
  String get askToneCalm => 'Sakin';

  @override
  String get askToneWarm => 'Sıcak';

  @override
  String get askToneCheerful => 'Neşeli';

  @override
  String qPaymentUpdate(String amount) {
    return 'Ödeme güncellemesi: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Müşteri: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Tedarikçi: $name';
  }

  @override
  String qItem(String name) {
    return 'Ürün: $name';
  }

  @override
  String qExpense(String name) {
    return 'Gider: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Alım: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Tahsil edilen ödeme: $amount ($name)';
  }

  @override
  String gstAmount(String amount) {
    return 'KDV $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Vergilendirilen $taxable  ·  KDV $tax  ·  Toplam $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Gelir: $revenue  •  Satılan malın maliyeti: $cogs  •  Giderler: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Merhaba $customer, $shop olarak selamlar! Toplam borç bakiyeniz $amount. Teşekkürler!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Merhaba $customer, $shop olarak $amount tutarındaki bekleyen bakiyeniz için ödeme hatırlatması. Lütfen en kısa sürede ödeyiniz.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'ACİL BİLDİRİM: Sayın $customer, $shop nezdindeki $amount tutarındaki ödemeniz beklemektedir. Lütfen hemen ödeyiniz.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCash ile ödeyin: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop faturası\nToplam: $total\nÜrünler: $items\nDurum: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Merhaba $supplier, ben $shop. Şunları sipariş etmek istiyoruz:\n$lines\n\nLütfen stok ve fiyatı teyit edin. Teşekkürler.';
  }

  @override
  String ppUpdated(String date) {
    return 'Son güncelleme: $date';
  }

  @override
  String get ppWhoH => 'Biz kimiz';

  @override
  String ppWho(String owner, String email) {
    return '$owner, Book-keep’i işletmektedir.\nİletişim: $email';
  }

  @override
  String get ppCollectH => 'Neleri topluyoruz';

  @override
  String get ppCollectAccount => 'Hesap: Firebase Authentication aracılığıyla e-posta, telefon numarası ve kullanıcı adı.';

  @override
  String get ppCollectShop => 'Dükkân profili: dükkân adı, adres, telefon numarası, JazzCash numarası ve dükkân logosu; dükkân sahibi tarafından Ayarlar’da girilir.';

  @override
  String get ppCollectRecords => 'Oluşturduğunuz iş kayıtları: müşteri ve tedarikçi adları ile telefon numaraları, faturalar, alımlar, ürün kataloğu (ürün fotoğrafları ve barkodlar dahil) ve giderler (fiş fotoğrafları dahil). Bunlar uygulamanın temel verileridir — muhasebe böyle işler.';

  @override
  String get ppCollectDevice => 'Cihaz ve tanılama verileri: bir anlık bildirim jetonu (düşük stok, geciken ödeme ve günlük özet uyarıları için) ve Firebase Crashlytics aracılığıyla çökme raporları (cihaz bilgisi ve hata izleri); uygulama çöktüğünde otomatik gönderilir.';

  @override
  String ppCollectAi(String askShop) {
    return 'Yapay zekâ özellikleri: $askShop, yapay zekâlı Sabah Özeti ve yapay zekâlı fatura/alım tarayıcısı, yanıt, özet veya çıkarılan satırları üretmek için ilgili iş verilerinin bir kesitini (rapor rakamları veya bir fatura fotoğrafı) Google’ın Gemini API’sine gönderir. Bu veriler yanıtı üretmek için Google tarafından işlenir; Google’ın standart API koşulları dışında ne bizim tarafımızdan ne de Google tarafından model eğitiminde kullanılmaz.';
  }

  @override
  String get ppDontH => 'Yapmadıklarımız';

  @override
  String get ppDontLocation => 'Konumunuzu takip etmeyiz.';

  @override
  String get ppDontAds => 'Reklam ağları veya davranışsal analiz/oturum kaydı araçları kullanmayız.';

  @override
  String get ppDontSell => 'Verilerinizi veya müşterilerinizin verilerini kimseye satmayız.';

  @override
  String get ppWhereH => 'Veriler nerede tutulur';

  @override
  String get ppWhereDb => 'Veritabanı: Neon (Postgres), üçüncü taraf bir bulut veritabanı sağlayıcısı.';

  @override
  String get ppWhereFirebase => 'Kimlik doğrulama, anlık bildirimler, çökme raporları, fotoğraf depolama: Firebase (Google).';

  @override
  String get ppWhereAi => 'Yapay zekâ işleme: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Fatura e-postaları: dükkânınızın yöneticisinin $adminPanel bölümünde ayarladığı SMTP hesabı üzerinden gönderilir. Bir posta listemiz yoktur; bu e-postalar toplu pazarlama değil, kendi müşterilerinize giden birebir fatura/ekstrelerdir.';
  }

  @override
  String get ppYoursH => 'Verileriniz, müşterilerinizin verileri';

  @override
  String get ppYours => 'Girdiğiniz her şey — müşteriler, tedarikçiler, faturalar, ürünler — dükkânınıza aittir. Book-keep kullanan diğer dükkânlar bunu göremez. Dükkânınız için oluşturduğunuz personel hesapları yalnızca erişim verdiğiniz şeyleri görür.';

  @override
  String get ppControlsH => 'Kontrolleriniz';

  @override
  String ppControlExport(String path) {
    return 'Verilerinizi dışa aktarın veya yedekleyin: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Hesabınızı silin: $path. Bu yalnızca giriş bilgilerinizi kaldırır; bir personeli kaldırmanın onun oluşturduğu kayıtları silmemesi gibi, dükkânınızın iş kayıtlarını (faturalar, müşteriler, ürünler vb.) silmez.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Bildirimler: türe göre $path bölümünden kapatılabilir.';
  }

  @override
  String get ppChildrenH => 'Çocuklar';

  @override
  String get ppChildren => 'Book-keep, dükkân sahipleri ve personeli için bir iş aracıdır. Çocuklara yönelik değildir ve bilerek çocuklar tarafından kullanılmaz.';

  @override
  String get ppChangesH => 'Bu politikadaki değişiklikler';

  @override
  String get ppChanges => 'Topladıklarımız veya verilerin gittiği yer değişirse bu sayfayı güncelleyip üstteki tarihi değiştiririz.';

  @override
  String get ppContactH => 'İletişim';

  @override
  String ppContact(String email) {
    return 'Bu politika veya verilerinizle ilgili sorular: $email';
  }

  @override
  String get waHello => 'Merhaba!';

  @override
  String waHelloNamed(String name) {
    return 'Merhaba $name,';
  }

  @override
  String get gstTaxable => 'Vergilendirilebilir';

  @override
  String get gstTax => 'Vergi';

  @override
  String get gstTaxableValue => 'Vergilendirilebilir tutar';

  @override
  String get gstTotalTax => 'Toplam vergi';

  @override
  String get gstTotalItc => 'Toplam indirilecek vergi';

  @override
  String get gstExempt => 'Muaf satışlar';

  @override
  String get gstNetPayable => 'Ödenecek net vergi';

  @override
  String get unknownName => 'Bilinmiyor';

  @override
  String get unitPiece => 'adet';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'metre';

  @override
  String get unitBox => 'kutu';

  @override
  String get unitDozen => 'düzine';

  @override
  String get unitLiter => 'litre';

  @override
  String get unitBag => 'çuval';

  @override
  String deleteSupplierMessage(String name) {
    return '$name ve tüm alımları silinsin mi? Bu işlem geri alınamaz.';
  }
}
