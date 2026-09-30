// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get navHome => 'Beranda';

  @override
  String get navCustomers => 'Pelanggan';

  @override
  String get navItems => 'Barang';

  @override
  String get navSuppliers => 'Pemasok';

  @override
  String get navReports => 'Laporan';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get settingsShopDetailsTitle => 'Detail Toko';

  @override
  String get settingsShopDetailsSubtitle => 'Ditampilkan pada faktur Anda.';

  @override
  String get settingsShopNameLabel => 'Nama Toko';

  @override
  String get settingsShopAddressLabel => 'Alamat Toko';

  @override
  String get settingsPhoneLabel => 'Telepon';

  @override
  String get settingsSaveShopDetails => 'Simpan Detail Toko';

  @override
  String get settingsAppearanceTitle => 'Tampilan';

  @override
  String get settingsAppearanceSubtitle => 'Pilih tema untuk seluruh aplikasi.';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get settingsLanguageTitle => 'Bahasa';

  @override
  String get settingsLanguageSubtitle => 'Pilih bahasa tampilan aplikasi.';

  @override
  String get sortNameNewest => 'Urutkan: Nama / Terbaru';

  @override
  String get addCustomer => 'Tambah pelanggan';

  @override
  String get importCsv => 'Impor CSV';

  @override
  String get searchShop => 'Cari di toko';

  @override
  String get scanToFindItem => 'Pindai untuk mencari barang';

  @override
  String get bulkAdd => 'Tambah massal';

  @override
  String get updateStock => 'Perbarui stok';

  @override
  String get printLabels => 'Cetak label';

  @override
  String get mergeDuplicates => 'Gabungkan duplikat';

  @override
  String get addSupplier => 'Tambah pemasok';

  @override
  String get scanPurchaseInvoice => 'Pindai faktur pembelian';

  @override
  String askNoAnswer(String reason) {
    return 'Tidak bisa mendapatkan jawaban: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Tidak bisa terhubung: $error';
  }

  @override
  String get micPermissionNeeded => 'Izin mikrofon diperlukan untuk input suara.';

  @override
  String get speechUnavailable => 'Pengenalan suara tidak tersedia di perangkat ini.';

  @override
  String get askYourShop => 'Tanya toko Anda';

  @override
  String get close => 'Tutup';

  @override
  String get askIntro => 'Penasaran bagaimana kabar toko Anda? Tanya saja, saya jawab dari catatan pembukuan Anda.';

  @override
  String get askListening => 'Mendengarkan…';

  @override
  String get askThinkingWords => 'Berpikir…|Sedang dikerjakan…|Menghitung…|Memeriksa pembukuan…|Menjumlahkan…|Menganalisis angka…';

  @override
  String get askSayQuestion => 'Ucapkan pertanyaan Anda — ketuk bola untuk membatalkan';

  @override
  String briefingRefreshFailed(int code) {
    return 'Tidak bisa memperbarui ringkasan ($code).';
  }

  @override
  String get refreshFailedOffline => 'Tidak bisa memperbarui — periksa koneksi Anda.';

  @override
  String get newBillFailed => 'Tidak bisa membuat tagihan baru — periksa koneksi dan coba lagi.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Tetapkan dulu pemasok utama untuk $name (ketuk untuk mengedit).';
  }

  @override
  String get reorderBySupplier => 'Pesan ulang per pemasok';

  @override
  String get supplier => 'Pemasok';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count barang',
      one: '1 barang',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Belum ada barang stok rendah yang punya pemasok utama.';

  @override
  String get thisSupplier => 'Pemasok ini';

  @override
  String supplierNoPhone(String name) {
    return '$name tidak punya nomor telepon.';
  }

  @override
  String get tabOverview => 'Ringkasan';

  @override
  String get tabStock => 'Stok';

  @override
  String get tabMoney => 'Uang';

  @override
  String get taglineOverview => 'Piutang, stok, dan kas hari ini sekilas.';

  @override
  String get taglineStock => 'Apa yang laku, apa yang hampir habis.';

  @override
  String get taglineMoney => 'Pengeluaran, rekonsiliasi, dan penagihan.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Memuat dasbor… $done dari $total';
  }

  @override
  String get dashboardLoadFailed => 'Tidak bisa memuat dasbor';

  @override
  String get checkConnectionRetry => 'Periksa koneksi Anda dan coba lagi.';

  @override
  String get retry => 'Coba lagi';

  @override
  String get aiBriefing => 'Ringkasan AI';

  @override
  String get briefingPrompt => 'Lihat usaha kemarin dalam beberapa kalimat.';

  @override
  String get getBriefing => 'Dapatkan ringkasan';

  @override
  String get refreshBriefing => 'Perbarui ringkasan';

  @override
  String updatedAt(String time) {
    return 'Diperbarui $time';
  }

  @override
  String get customersUnknown => '— pelanggan';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pelanggan',
      one: '1 pelanggan',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Bulan sebelumnya';

  @override
  String get nextMonth => 'Bulan berikutnya';

  @override
  String get salesMonth => 'Penjualan (bulan)';

  @override
  String get outstanding => 'Piutang';

  @override
  String get profitMonth => 'Laba (bulan)';

  @override
  String get cashToday => 'Kas hari ini';

  @override
  String get newBill => 'Tagihan baru';

  @override
  String get scanHandwrittenBill => 'Pindai tagihan tulisan tangan';

  @override
  String get topOutstanding => 'Piutang terbesar';

  @override
  String viewAllInDues(int count) {
    return 'Lihat semua $count di Pusat Piutang';
  }

  @override
  String get lowStockAlerts => 'Peringatan stok rendah';

  @override
  String get noLowStock => 'Tidak ada barang stok rendah — stok aman.';

  @override
  String get whatsappAll => 'WhatsApp semua';

  @override
  String get reorderAll => 'Pesan ulang semua';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Saran: pesan ulang $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Sisa $qty $unit';
  }

  @override
  String get reorder => 'Pesan ulang';

  @override
  String get whatsappSupplier => 'WhatsApp pemasok';

  @override
  String get topItemsByRevenue => 'Barang teratas menurut pendapatan';

  @override
  String get noSalesYet => 'Belum ada penjualan tercatat.';

  @override
  String qtyLabel(String qty) {
    return 'Jml: $qty';
  }

  @override
  String get monthExpenses => 'Pengeluaran bulan ini';

  @override
  String get noExpensesMonth => 'Belum ada pengeluaran bulan ini.';

  @override
  String get quickActions => 'Aksi cepat';

  @override
  String get dailyCashReconciliation => 'Rekonsiliasi kas harian';

  @override
  String get collectMoney => 'Tagih uang';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perubahan disimpan offline',
      one: '1 perubahan disimpan offline',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Akan disinkronkan otomatis saat kembali online';

  @override
  String get syncing => 'Menyinkronkan';

  @override
  String get sync => 'Sinkronkan';

  @override
  String get shopProfile => 'Profil toko';

  @override
  String get insights => 'Wawasan';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get backupExport => 'Cadangan & ekspor';

  @override
  String get adminPanel => 'Panel admin';

  @override
  String get toolsSync => 'Alat & sinkronisasi';

  @override
  String get account => 'Akun';

  @override
  String get shopDetailsSaved => 'Detail toko disimpan.';

  @override
  String saveFailed(int code) {
    return 'Gagal menyimpan ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Tidak bisa menyimpan: $error';
  }

  @override
  String get logoUpdated => 'Logo diperbarui.';

  @override
  String logoUploadFailed(int code) {
    return 'Gagal mengunggah logo ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Tidak bisa mengunggah logo: $error';
  }

  @override
  String get healthGood => 'Secara keseluruhan semuanya baik.';

  @override
  String get healthSome => 'Beberapa hal perlu perhatian.';

  @override
  String get healthMany => 'Banyak hal perlu perhatian.';

  @override
  String get shopHealth => 'Kesehatan toko';

  @override
  String get healthIntro => 'Pengingat singkat, bukan laporan lagi.';

  @override
  String get couldNotLoadCheckConnection => 'Tidak bisa memuat — periksa koneksi Anda.';

  @override
  String get itemPhotos => 'Foto barang';

  @override
  String get barcodes => 'Barcode';

  @override
  String get lowStockItems => 'Barang stok rendah';

  @override
  String get lastBackup => 'Cadangan terakhir';

  @override
  String get today => 'hari ini';

  @override
  String get yesterday => 'kemarin';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari lalu',
      one: '1 hari lalu',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Status offline';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get waitingToSync => 'Menunggu sinkronisasi';

  @override
  String get syncNow => 'Sinkronkan sekarang';

  @override
  String get searchSettings => 'Cari pengaturan';

  @override
  String noSettingsMatch(String query) {
    return 'Tidak ada pengaturan yang cocok dengan \"$query\"';
  }

  @override
  String get businessInfo => 'INFO USAHA';

  @override
  String get payment => 'PEMBAYARAN';

  @override
  String get shopNameRequired => 'Nama toko wajib diisi';

  @override
  String phoneIncomplete(int digits) {
    return 'Masukkan nomor telepon lengkap $digits digit';
  }

  @override
  String get jazzcashOptional => 'Nomor JazzCash (opsional)';

  @override
  String get saved => 'Tersimpan!';

  @override
  String get languageSubtitle => 'Ubah bahasa aplikasi';

  @override
  String get notificationsSubtitle => 'Stok rendah, pembayaran jatuh tempo & ringkasan harian';

  @override
  String get backupSubtitle => 'Unduh, pulihkan & ekspor data toko';

  @override
  String get appUpdate => 'Pembaruan aplikasi';

  @override
  String get appUpdateSubtitle => 'Periksa versi terbaru';

  @override
  String get adminSubtitle => 'Kelola akun & data toko';

  @override
  String get accountSubtitle => 'Masuk, kata sandi & nama pengguna';

  @override
  String get privacyPolicy => 'Kebijakan privasi';

  @override
  String get privacySubtitle => 'Data apa yang kami kumpulkan dan mengapa';

  @override
  String get yourShop => 'Toko Anda';

  @override
  String get uploadingLogo => 'Mengunggah logo toko';

  @override
  String get logoTapToChange => 'Logo toko, ketuk untuk mengganti';

  @override
  String get brandTagline => 'Toko ramai, pembukuan tenang.';

  @override
  String serverError(int code) {
    return 'Kesalahan server: $code';
  }

  @override
  String get deleteCustomer => 'Hapus pelanggan';

  @override
  String deleteCustomerMessage(String name) {
    return 'Hapus $name dan semua tagihannya? Tindakan ini tidak bisa dibatalkan.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Tidak bisa menghapus: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Tidak bisa menghapus — periksa koneksi dan coba lagi.';

  @override
  String get actions => 'Aksi';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Hapus';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count pelanggan',
      one: 'Hapus 1 pelanggan',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count pelanggan dan semua tagihannya? Tindakan ini tidak bisa dibatalkan.',
      one: 'Hapus 1 pelanggan dan semua tagihannya? Tindakan ini tidak bisa dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Batalkan semua pilihan';

  @override
  String get selectAll => 'Pilih semua';

  @override
  String selectedCount(int count) {
    return '$count dipilih';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get newTag => 'BARU';

  @override
  String get csvNeedsRows => 'CSV perlu baris judul dan minimal satu pelanggan.';

  @override
  String get csvNeedsName => 'Judul CSV harus memiliki kolom \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'Baris $line: nama kosong — perbaiki file lalu coba lagi.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Baris $line: credit_limit tidak valid \"$value\" — perbaiki file lalu coba lagi.';
  }

  @override
  String get importCustomers => 'Impor pelanggan';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ditemukan $count pelanggan di \"$file\". Impor semua?',
      one: 'Ditemukan 1 pelanggan di \"$file\". Impor?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Impor';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pelanggan diimpor.',
      one: '1 pelanggan diimpor.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Impor gagal: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Impor gagal — tidak bisa terhubung: $error';
  }

  @override
  String get noPhone => 'Tanpa telepon';

  @override
  String get offlineShowingSaved => 'Offline — menampilkan salinan tersimpan';

  @override
  String get searchCustomersHint => 'Cari pelanggan atau telepon...';

  @override
  String get noCustomersYet => 'Belum ada pelanggan. Ketuk + untuk menambah.';

  @override
  String get noCustomersMatch => 'Tidak ada pelanggan yang cocok dengan pencarian.';

  @override
  String get owesMoney => 'Punya utang';

  @override
  String get settledUp => 'Lunas';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'Tidak bisa memuat $what: $error';
  }

  @override
  String get takePhoto => 'Ambil foto';

  @override
  String get chooseFromGallery => 'Pilih dari galeri';

  @override
  String get back => 'Kembali';

  @override
  String callPhone(String phone) {
    return 'Telepon $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp $phone';
  }

  @override
  String get clearSearch => 'Hapus pencarian';

  @override
  String get askHint => 'mis. Berapa laba saya bulan ini?';

  @override
  String get acctTurnOffLockTitle => 'Matikan Kunci Aplikasi?';

  @override
  String get acctTurnOffLockBody => 'Siapa pun yang memegang ponsel ini bisa membuka aplikasi tanpa PIN.';

  @override
  String get acctTurnOff => 'Matikan';

  @override
  String get acctSetPinTitle => 'Atur PIN';

  @override
  String get acctPinLabel => 'PIN 4-6 digit';

  @override
  String get acctPinMin => 'Minimal 4 digit';

  @override
  String get acctConfirmPin => 'Konfirmasi PIN';

  @override
  String get acctPinMismatch => 'PIN tidak cocok';

  @override
  String get acctSetPin => 'Atur PIN';

  @override
  String get acctBiometricTitle => 'Gunakan sidik jari/wajah juga?';

  @override
  String get acctBiometricBody => 'Anda tetap bisa memakai PIN jika biometrik gagal.';

  @override
  String get acctNoThanks => 'Tidak, terima kasih';

  @override
  String get acctEnable => 'Aktifkan';

  @override
  String get acctSetPasswordTitle => 'Atur kata sandi';

  @override
  String get acctSetPasswordIntro => 'Pilih kata sandi agar lain kali Anda juga bisa masuk dengan email + kata sandi, tidak hanya dengan Google.';

  @override
  String get acctPassword => 'Kata sandi';

  @override
  String get acctPasswordMin => 'Minimal 6 karakter';

  @override
  String get acctConfirmPassword => 'Konfirmasi kata sandi';

  @override
  String get acctPasswordsMismatch => 'Kata sandi tidak cocok';

  @override
  String get acctSetPasswordButton => 'Atur Kata Sandi';

  @override
  String get acctPasswordSet => 'Kata sandi diatur — sekarang Anda juga bisa masuk dengannya.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Tidak bisa mengatur kata sandi: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Ubah kata sandi';

  @override
  String get acctCurrentPassword => 'Kata sandi saat ini';

  @override
  String get acctRequired => 'Wajib diisi';

  @override
  String get acctNewPassword => 'Kata sandi baru';

  @override
  String get acctConfirmNewPassword => 'Konfirmasi kata sandi baru';

  @override
  String get acctChange => 'Ubah';

  @override
  String get acctPasswordChanged => 'Kata sandi diubah.';

  @override
  String get acctWrongPassword => 'Kata sandi saat ini salah.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Tidak bisa mengubah kata sandi: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Ubah nama pengguna';

  @override
  String get acctUsername => 'Nama pengguna';

  @override
  String get acctUsernameEmpty => 'Nama pengguna tidak boleh kosong';

  @override
  String get acctUsernameChanged => 'Nama pengguna diubah.';

  @override
  String get acctChangeEmailTitle => 'Ubah email';

  @override
  String get acctNewEmail => 'Email baru';

  @override
  String get acctValidEmail => 'Masukkan email yang valid';

  @override
  String get acctRequiredConfirm => 'Diperlukan untuk memastikan ini Anda';

  @override
  String get acctGoogleConfirmFirst => 'Anda akan diminta konfirmasi dengan Google terlebih dahulu.';

  @override
  String acctCheckEmail(String email) {
    return 'Periksa $email untuk tautan konfirmasi perubahan.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'masuk dengan kata sandi';

  @override
  String acctRemoveTitle(String provider) {
    return 'Hapus $provider?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Anda tidak akan bisa lagi masuk ke akun ini dengan $provider.';
  }

  @override
  String get acctRemove => 'Hapus';

  @override
  String acctRemoved(String provider) {
    return '$provider dihapus.';
  }

  @override
  String get acctSignedIn => 'Sudah masuk';

  @override
  String get acctEmailNotVerified => 'Email belum diverifikasi.';

  @override
  String get acctVerificationSent => 'Email verifikasi terkirim.';

  @override
  String get acctResend => 'Kirim ulang';

  @override
  String get acctSectionSignIn => 'MASUK & KEAMANAN';

  @override
  String get acctRowChangeUsername => 'Ubah Nama Pengguna';

  @override
  String get acctRowChangeEmail => 'Ubah Email';

  @override
  String get acctRowSetPassword => 'Atur Kata Sandi';

  @override
  String get acctRowChangePassword => 'Ubah Kata Sandi';

  @override
  String get acctRowUnlinkGoogle => 'Putuskan Google';

  @override
  String get acctRowRemovePassword => 'Hapus Kata Sandi';

  @override
  String get acctRowAppLock => 'Kunci Aplikasi (PIN)';

  @override
  String get acctRowBiometric => 'Gunakan sidik jari/wajah';

  @override
  String get acctSignOutTitle => 'Keluar?';

  @override
  String get acctSignOutBody => 'Anda harus masuk lagi untuk menggunakan aplikasi.';

  @override
  String get acctSignOut => 'Keluar';

  @override
  String get acctDeleteAccount => 'Hapus Akun';

  @override
  String get acctDeleting => 'Menghapus...';

  @override
  String get acctDeleteTitle => 'Hapus akun?';

  @override
  String get acctDeleteBody => 'Ini menghapus kredensial masuk Anda secara permanen. Anda harus mendaftar lagi untuk menggunakan aplikasi. Tindakan ini tidak dapat dibatalkan.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Tidak bisa menghapus akun: $error';
  }

  @override
  String get itmNotFoundTitle => 'Barang tidak ditemukan';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Tidak ada barang dengan barcode $barcode. Tambahkan sebagai barang baru sekarang?';
  }

  @override
  String get itmAddItem => 'Tambah Barang';

  @override
  String get itmEditItem => 'Ubah Barang';

  @override
  String get itmMergeTitle => 'Gabungkan Barang Ganda';

  @override
  String get itmMergeBody => 'Barang dengan nama yang sama akan digabung ke entri tertua dan stoknya dijumlahkan. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get itmMerge => 'Gabungkan';

  @override
  String get itmNoDuplicates => 'Tidak ada barang ganda.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count barang ganda digabung.',
      one: '1 barang ganda digabung.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Hapus Barang';

  @override
  String get itmCannotUndo => 'Tindakan ini tidak dapat dibatalkan.';

  @override
  String get itmDeleteOffline => 'Tidak bisa menghapus — periksa koneksi Anda dan coba lagi.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count Barang',
      one: 'Hapus 1 Barang',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count barang? Tindakan ini tidak dapat dibatalkan.',
      one: 'Hapus 1 barang? Tindakan ini tidak dapat dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Tidak bisa mengunggah foto ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Tidak bisa mengunggah foto: $error';
  }

  @override
  String get itmNoBarcodes => 'Belum ada barang yang punya barcode.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cetak $count Label',
      one: 'Cetak 1 Label',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Cari barang atau kategori...';

  @override
  String get itmStopListening => 'Berhenti mendengarkan';

  @override
  String get itmVoiceSearch => 'Pencarian suara';

  @override
  String get itmSort => 'Urutkan';

  @override
  String get itmSortName => 'Nama (A-Z)';

  @override
  String get itmSortStockLow => 'Stok: terendah ke tertinggi';

  @override
  String get itmSortRecent => 'Baru ditambahkan';

  @override
  String get itmFilterAll => 'Semua';

  @override
  String get itmFilterLowStock => 'Stok Rendah';

  @override
  String get itmNoItemsYet => 'Belum ada barang. Ketuk + untuk menambah.';

  @override
  String get itmNoItemsMatch => 'Tidak ada barang yang cocok dengan pencarian Anda.';

  @override
  String get itmNoPriceChanges => 'Belum ada perubahan harga yang tercatat.';

  @override
  String get itmNoStockCorrections => 'Belum ada koreksi stok yang tercatat.';

  @override
  String get itmResetHistory => 'Reset riwayat';

  @override
  String get itmResetHistoryMsg => 'Reset riwayat barang ini? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get itmSendPdf => 'Kirim sebagai PDF';

  @override
  String get itmNoteOptional => 'Catatan (opsional)';

  @override
  String get itmNoteHint => 'Tambahkan catatan untuk perubahan ini';

  @override
  String get itmRemoveEntry => 'Hapus entri';

  @override
  String get itmRemoveEntryMsg => 'Hapus entri ini dari riwayat? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get itmEditEntry => 'Ubah entri';

  @override
  String get itmPrevQty => 'Sebelumnya';

  @override
  String get itmNewQty => 'Baru';

  @override
  String itmCost(String amount) {
    return 'Modal: $amount';
  }

  @override
  String get itmMore => 'Lainnya';

  @override
  String get itmMenuPrintLabel => 'Cetak label';

  @override
  String get itmMenuDuplicate => 'Duplikat';

  @override
  String get itmMenuPriceHistory => 'Riwayat harga';

  @override
  String get itmMenuStockHistory => 'Riwayat penyesuaian stok';

  @override
  String itmLowStockBadge(int count) {
    return '$count stok rendah';
  }

  @override
  String itmStockLine(String qty) {
    return 'Stok: $qty';
  }

  @override
  String get itmOfflineSaved => 'Offline — barang disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get itmItemName => 'Nama Barang';

  @override
  String get itmNameRequired => 'Nama wajib diisi';

  @override
  String get itmPricePkr => 'Harga (PKR)';

  @override
  String get itmPriceRequired => 'Harga wajib diisi';

  @override
  String get itmValidNumber => 'Masukkan angka yang valid';

  @override
  String get itmUnit => 'Satuan';

  @override
  String get itmCategoryHint => 'Kategori (opsional, mis. Pipa)';

  @override
  String get itmPreferredSupplier => 'Pemasok Pilihan (opsional)';

  @override
  String get itmPreferredSupplierHelper => 'Dipakai oleh aksi pesan ulang satu ketukan';

  @override
  String get itmClear => 'Hapus';

  @override
  String get itmHsn => 'Kode HSN (opsional)';

  @override
  String get itmGstRate => 'Tarif GST % (opsional)';

  @override
  String get itmBarcodeOptional => 'Barcode (opsional)';

  @override
  String get itmScanOrType => 'Pindai atau ketik';

  @override
  String get itmScanBarcode => 'Pindai barcode';

  @override
  String get itmPurchaseCost => 'Harga Beli (per satuan)';

  @override
  String get itmPurchaseCostHint => 'Yang Anda bayar saat membeli stok';

  @override
  String get itmWholesale => 'Harga Grosir (opsional)';

  @override
  String get itmContractor => 'Harga Kontraktor (opsional)';

  @override
  String get itmFallsBack => 'Jika kosong, memakai harga normal';

  @override
  String get itmStockQty => 'Jumlah Stok';

  @override
  String get itmLowStockAlert => 'Peringatan Stok Rendah di Bawah';

  @override
  String get itmFrequently => 'Sering dibeli bersama';

  @override
  String get itmSaveChanges => 'Simpan Perubahan';

  @override
  String get itmSaveItem => 'Simpan Barang';

  @override
  String get itmPhotoSemantics => 'Foto barang, ketuk untuk mengganti';

  @override
  String get cdUpdateStatusTitle => 'Perbarui Status Pembayaran';

  @override
  String get cdMarkPaidQ => 'Tandai tagihan ini sebagai lunas?';

  @override
  String get cdMarkUnpaidQ => 'Tandai tagihan ini sebagai belum lunas?';

  @override
  String get cdConfirm => 'Konfirmasi';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Tidak bisa memperbarui: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Offline — perubahan disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get cdConvertTitle => 'Ubah Menjadi Tagihan';

  @override
  String get cdConvertBody => 'Ini akan mengurangi stok barang-barang ini dan mengubah penawaran menjadi tagihan sungguhan. Lanjutkan?';

  @override
  String get cdConvert => 'Ubah';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Tidak bisa mengubah: $detail';
  }

  @override
  String get cdReturnItems => 'Retur Barang';

  @override
  String get cdReturnHint => 'Tentukan jumlah retur tiap barang. Biarkan 0 agar tetap terjual.';

  @override
  String get cdDecreaseQty => 'Kurangi jumlah';

  @override
  String get cdIncreaseQty => 'Tambah jumlah';

  @override
  String get cdCreditTotal => 'Total kredit';

  @override
  String get cdReturnSelected => 'Retur yang Dipilih';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Tidak bisa meretur: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Tidak bisa membatalkan: $detail';
  }

  @override
  String get cdNoPreviousBill => 'Tidak ada tagihan sebelumnya untuk diulang';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Tidak bisa memuat tagihan terakhir: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Faktur dikirim ke email pelanggan.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Tidak bisa mengirim faktur lewat email: $detail';
  }

  @override
  String get cdStatementEmailed => 'Laporan dikirim ke email pelanggan.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Tidak bisa mengirim laporan lewat email: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Hapus Tagihan';

  @override
  String get cdBillVoided => 'DIBATALKAN';

  @override
  String get cdBillReturn => 'RETUR';

  @override
  String get cdBillQuote => 'PENAWARAN';

  @override
  String get cdBillPaid => 'LUNAS';

  @override
  String get cdBillPartial => 'SEBAGIAN';

  @override
  String get cdBillUnpaid => 'BELUM LUNAS';

  @override
  String get cdBill => 'Tagihan';

  @override
  String cdVoidedReason(String reason) {
    return 'Dibatalkan: $reason';
  }

  @override
  String get cdViewInvoice => 'Lihat Faktur';

  @override
  String get cdEmailInvoice => 'Kirim Faktur via Email';

  @override
  String get cdEditBill => 'Ubah Tagihan';

  @override
  String get cdReturnBill => 'Retur Tagihan';

  @override
  String get cdVoidBill => 'Batalkan Tagihan';

  @override
  String get cdNoItems => 'Tidak ada barang';

  @override
  String get cdRepeatLast => 'Ulangi Tagihan Terakhir';

  @override
  String get cdLedgerPdf => 'PDF Buku Besar';

  @override
  String get cdEmailStatement => 'Kirim Laporan via Email';

  @override
  String get cdCollectPayment => 'Tagih Pembayaran';

  @override
  String get cdSendReminder => 'Kirim Pengingat WhatsApp';

  @override
  String get cdTotalBilled => 'Total Ditagih';

  @override
  String get cdPaid => 'Dibayar';

  @override
  String get cdNoBills => 'Belum ada tagihan';

  @override
  String get cdBillActions => 'Aksi tagihan';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding dari batas kredit $limit terpakai';
  }

  @override
  String get cdVoidBody => 'Tagihan dihapus dari saldo dan laporan, tetapi tetap ada di riwayat. Stok akan dikembalikan. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get cdReason => 'Alasan (opsional)';

  @override
  String get frmOfflineCustomer => 'Offline — pelanggan disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get frmOfflineSupplier => 'Offline — pemasok disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get frmEditCustomer => 'Ubah Pelanggan';

  @override
  String get frmCustomerName => 'Nama Pelanggan';

  @override
  String get frmPhoneOptional => 'Telepon (opsional)';

  @override
  String get frmCreditLimit => 'Batas Kredit (PKR, opsional)';

  @override
  String get frmCreditHelper => 'Beri peringatan saat saldo pelanggan ini melebihi nilai ini';

  @override
  String get frmPriceTier => 'Tingkat Harga';

  @override
  String get frmRetail => 'Eceran';

  @override
  String get frmWholesale => 'Grosir';

  @override
  String get frmContractor => 'Kontraktor';

  @override
  String get frmPriceTierHelper => 'Harga barang mana yang diisi otomatis di tagihan untuk pelanggan ini';

  @override
  String get frmStrn => 'STRN (opsional)';

  @override
  String get frmStrnCustomer => 'Nomor Registrasi Pajak Penjualan 13 digit untuk faktur';

  @override
  String get frmStrnSupplier => 'Nomor Registrasi Pajak Penjualan 13 digit untuk tagihan pembelian';

  @override
  String get frmAddress => 'Alamat (opsional)';

  @override
  String get frmEmail => 'Email (opsional)';

  @override
  String get frmEmailHelper => 'Memungkinkan Anda mengirim faktur atau laporan ke email pelanggan ini';

  @override
  String get frmSaveCustomer => 'Simpan Pelanggan';

  @override
  String get frmEditSupplier => 'Ubah Pemasok';

  @override
  String get frmSupplierName => 'Nama Pemasok';

  @override
  String get frmSaveSupplier => 'Simpan Pemasok';

  @override
  String get sdDeletePurchaseTitle => 'Hapus Pembelian';

  @override
  String get sdDeletePurchaseBody => 'Stok pembelian ini akan dikembalikan. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get sdReturnToSupplier => 'Retur ke Pemasok';

  @override
  String get sdReturnHint => 'Tentukan jumlah tiap barang yang dikembalikan. Biarkan 0 untuk tetap menyimpannya.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Tidak bisa menandai diterima: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Tandai pembelian ini sebagai lunas?';

  @override
  String get sdMarkUnpaidQ => 'Tandai pembelian ini sebagai belum lunas?';

  @override
  String get sdTotalPurchased => 'Total Pembelian';

  @override
  String get sdPayable => 'Utang';

  @override
  String sdPayableAmount(String amount) {
    return '$amount utang';
  }

  @override
  String get sdNoPurchases => 'Belum ada pembelian';

  @override
  String get sdPo => 'PO';

  @override
  String get sdDraftPo => 'PO DRAF';

  @override
  String get sdPurchase => 'Pembelian';

  @override
  String get sdDraftNote => 'Pesanan pembelian draf — belum diterima, belum ada perubahan stok atau biaya.';

  @override
  String get sdReturnNote => 'Retur / nota kredit ke pemasok.';

  @override
  String get sdMarkReceived => 'Tandai Diterima';

  @override
  String get sdEditPurchase => 'Ubah Pembelian';

  @override
  String get sdPurchaseActions => 'Aksi pembelian';

  @override
  String get slDeleteSupplier => 'Hapus Pemasok';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count Pemasok',
      one: 'Hapus 1 Pemasok',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus $count pemasok beserta semua pembeliannya? Tindakan ini tidak dapat dibatalkan.',
      one: 'Hapus 1 pemasok beserta semua pembeliannya? Tindakan ini tidak dapat dibatalkan.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV membutuhkan baris header dan minimal satu pemasok.';

  @override
  String get slImportTitle => 'Impor Pemasok';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ditemukan $count pemasok di \"$file\". Impor semuanya?',
      one: 'Ditemukan 1 pemasok di \"$file\". Impor semuanya?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pemasok diimpor.',
      one: '1 pemasok diimpor.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Belum ada pemasok. Ketuk + untuk menambah.';

  @override
  String get slSearchHint => 'Cari pemasok atau telepon...';

  @override
  String get slNoMatch => 'Tidak ada pemasok yang cocok dengan pencarian Anda.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pemasok',
      one: '1 pemasok',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Utang ke Pemasok';

  @override
  String get sduNothingOwed => 'Tidak ada utang ke pemasok 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pemasok belum dibayar',
      one: '1 pemasok belum dibayar',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari sejak pembelian belum lunas tertua',
      one: '1 hari sejak pembelian belum lunas tertua',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 hari';

  @override
  String get duBucket1 => '30–60 hari';

  @override
  String get duBucket2 => '60+ hari';

  @override
  String get duTitle => 'Pusat Piutang';

  @override
  String get duNoDues => 'Tidak ada piutang 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pelanggan berpiutang',
      one: '1 pelanggan berpiutang',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari sejak tagihan belum lunas tertua',
      one: '1 hari sejak tagihan belum lunas tertua',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount belum dibayar';
  }

  @override
  String get cpNoOutstanding => 'Pelanggan ini tidak punya saldo tertunggak';

  @override
  String get cpValidAmount => 'Masukkan jumlah yang valid';

  @override
  String cpExceeds(String amount) {
    return 'Jumlah melebihi saldo tertunggak sebesar $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'Menerima $amount dari $name';
  }

  @override
  String get cpOfflineSaved => 'Offline — pembayaran disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String cpOwes(String amount, String name) {
    return '$name berutang $amount. Diterapkan lebih dulu ke tagihan belum lunas tertua.';
  }

  @override
  String get cpAmountLabel => 'Jumlah Diterima (PKR)';

  @override
  String get cpCollect => 'Terima';

  @override
  String get usNoItems => 'Tidak ada barang untuk diperbarui.';

  @override
  String get usHelp => 'Tentukan stok baru untuk tiap barang, lalu ketuk Simpan Semua.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  saat ini: $qty';
  }

  @override
  String usNew(String qty) {
    return 'baru: $qty';
  }

  @override
  String get usSubtract => 'Kurangi 1';

  @override
  String get usAdd => 'Tambah 1';

  @override
  String get usNoChanges => 'Tidak ada perubahan';

  @override
  String usSaveAll(int count) {
    return 'Simpan Semua ($count berubah)';
  }

  @override
  String get srHint => 'Cari pelanggan, barang, jumlah...';

  @override
  String get srFailed => 'Pencarian gagal — periksa koneksi Anda.';

  @override
  String get srTitle => 'Cari di toko Anda';

  @override
  String get srSubtitle => 'Temukan pelanggan lewat nama atau telepon, tagihan lewat jumlah.';

  @override
  String srNoMatches(String query) {
    return 'Tidak ada hasil untuk \"$query\"';
  }

  @override
  String get srTryDifferent => 'Coba nama, nomor telepon, atau jumlah lain.';

  @override
  String get srBills => 'Tagihan';

  @override
  String get srNoItemList => 'Tidak ada daftar barang';

  @override
  String get abAddAtLeastOne => 'Tambahkan minimal satu barang';

  @override
  String get abQuotationUpdated => 'Penawaran diperbarui!';

  @override
  String get abBillUpdated => 'Tagihan diperbarui!';

  @override
  String get abQuotationSaved => 'Penawaran disimpan!';

  @override
  String get abBillCreated => 'Tagihan berhasil dibuat!';

  @override
  String abTotalAmount(String amount) {
    return 'Total: $amount';
  }

  @override
  String get abShare => 'Bagikan';

  @override
  String get abDoneReturn => 'Selesai & Kembali';

  @override
  String get abOverLimitBody => 'Ini akan membuat pelanggan melebihi batas kreditnya.';

  @override
  String get abOverLimitTitle => 'Melebihi batas kredit';

  @override
  String get abBillAnyway => 'Tetap buat tagihan';

  @override
  String get abOfflineBill => 'Offline — tagihan disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get abEditQuotation => 'Ubah Penawaran';

  @override
  String get abEditBill => 'Ubah Tagihan';

  @override
  String get abNewQuotation => 'Penawaran Baru';

  @override
  String get abAddBill => 'Tambah Tagihan';

  @override
  String get abCouldNotLoadItems => 'Tidak bisa memuat barang.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Tagihan ini akan membuat saldo pelanggan menjadi $total, melebihi batas kredit $limit.';
  }

  @override
  String get abTapAddItemBill => 'Ketuk \"Tambah Barang\" di bawah untuk memulai tagihan';

  @override
  String get abNoCatalog => 'Belum ada barang di katalog';

  @override
  String get abScan => 'Pindai';

  @override
  String get abDiscountRs => 'Diskon (Rs)';

  @override
  String get abSubtotal => 'Subtotal';

  @override
  String get abTotal => 'Total';

  @override
  String get abSaveAsQuotation => 'Simpan sebagai Penawaran';

  @override
  String get abQuotationLocked => 'Tagihan yang sudah ada tidak bisa diubah kembali menjadi penawaran';

  @override
  String get abQuotationNote => 'Stok tidak dikurangi sampai diubah menjadi tagihan';

  @override
  String get abPaymentStatus => 'Status Pembayaran';

  @override
  String get abUnpaid => 'Belum Lunas';

  @override
  String get abPaymentMethod => 'Metode Pembayaran';

  @override
  String get abCash => 'Tunai';

  @override
  String get abBankTransfer => 'Transfer Bank';

  @override
  String get abCheque => 'Cek';

  @override
  String get abSaveQuotation => 'Simpan Penawaran';

  @override
  String get abSaveBill => 'Simpan Tagihan';

  @override
  String abAdded(String name) {
    return '$name ditambahkan';
  }

  @override
  String get apNewItem => 'Barang Baru…';

  @override
  String get apNewItemHint => 'Tambahkan barang baru ke katalog terlebih dahulu';

  @override
  String get apOfflinePurchase => 'Offline — pembelian disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get apEditPo => 'Ubah Pesanan Pembelian';

  @override
  String get apNewPo => 'Pesanan Pembelian Baru';

  @override
  String get apAddPurchase => 'Tambah Pembelian';

  @override
  String get apTapAddItem => 'Ketuk \"Tambah Barang\" di bawah untuk memulai pembelian';

  @override
  String get apSaveAsPo => 'Simpan sebagai Pesanan Pembelian';

  @override
  String get apPoLocked => 'Pembelian yang sudah diterima tidak bisa diubah kembali menjadi pesanan draf';

  @override
  String get apPoNote => 'Stok dan biaya tidak diperbarui sampai barang ditandai diterima';

  @override
  String get apUnpaidCredit => 'Belum Lunas (Kredit)';

  @override
  String get apSavePo => 'Simpan Pesanan Pembelian';

  @override
  String get apSavePurchase => 'Simpan Pembelian';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Modal saat ini: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Modal belum diatur  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Pemindaian gagal: kesalahan server $code';
  }

  @override
  String get scOfflineSaved => 'Offline — foto disimpan, akan dibaca otomatis saat kembali online';

  @override
  String get scStillOffline => 'Masih offline';

  @override
  String get scCouldNotCreateCustomer => 'Tidak bisa membuat pelanggan — coba lagi.';

  @override
  String get scCouldNotCreateSupplier => 'Tidak bisa membuat pemasok — coba lagi.';

  @override
  String scBillSavedFor(String name) {
    return 'Tagihan disimpan untuk $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Pembelian dari $name disimpan';
  }

  @override
  String get scWhichCustomer => 'Pelanggan yang mana?';

  @override
  String get scWhichSupplier => 'Pemasok yang mana?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Kecocokan terdekat: $name ($score% mirip)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Ya, ini $name';
  }

  @override
  String get scOtherwiseCustomer => 'Jika tidak, buat pelanggan baru:';

  @override
  String get scOtherwiseSupplier => 'Jika tidak, buat pemasok baru:';

  @override
  String get scNoMatchCustomer => 'Pelanggan yang cocok tidak ditemukan. Buat yang baru:';

  @override
  String get scNoMatchSupplier => 'Pemasok yang cocok tidak ditemukan. Buat yang baru:';

  @override
  String get scCustomerName => 'Nama pelanggan';

  @override
  String get scSupplierName => 'Nama pemasok';

  @override
  String get scCreateNew => 'Buat Baru';

  @override
  String get scTitleBill => 'Pindai Tagihan';

  @override
  String get scIntroBill => 'Foto saja tagihannya. Tulisan tangan tidak masalah, dan bahasa Sindhi, Urdu, atau Inggris semuanya bisa. Anda bisa memeriksanya dulu sebelum disimpan.';

  @override
  String get scIntroPurchase => 'Foto saja faktur dari pemasok. Bahasa Sindhi, Urdu, atau Inggris semuanya bisa. Anda bisa memeriksanya dulu sebelum disimpan.';

  @override
  String get scReadingBill => 'Membaca tagihan…';

  @override
  String get scScanBill => 'Pindai Tagihan';

  @override
  String get scReadingInvoice => 'Membaca faktur…';

  @override
  String get scScanInvoice => 'Pindai Faktur';

  @override
  String get scQueued => 'Pindaian Antrean';

  @override
  String get scReady => 'Siap ditinjau';

  @override
  String get scFailed => 'Gagal';

  @override
  String get scWaiting => 'Menunggu koneksi';

  @override
  String get scRetry => 'Coba lagi';

  @override
  String rpCouldNotLoad(String error) {
    return 'Tidak bisa memuat laporan: $error';
  }

  @override
  String get rpHeadline => 'Angka utama bulan ini';

  @override
  String get rpProfitThisMonth => 'Laba Bulan Ini';

  @override
  String get rpNoData => 'Belum ada data';

  @override
  String get rpSalesTax => 'Pajak Penjualan';

  @override
  String rpSalesTaxFor(String month) {
    return 'Laporan pajak penjualan untuk $month';
  }

  @override
  String get rpViewSalesTax => 'Lihat Laporan Pajak Penjualan';

  @override
  String get rpQuickReports => 'Laporan Cepat';

  @override
  String get rpQuickSub => 'Langsung ke laporan tertentu';

  @override
  String get expensesTitle => 'Pengeluaran';

  @override
  String get rpRateCard => 'Daftar Harga';

  @override
  String get rpDetails => 'Rincian';

  @override
  String get rpDetailsSub => 'Rincian lengkap dan peringkat';

  @override
  String get rpOutstandingByCustomer => 'Piutang per Pelanggan';

  @override
  String get rpNoOutstanding => 'Tidak ada saldo tertunggak';

  @override
  String get rpMonthlyTotals => 'Total Bulanan';

  @override
  String get rpMostSold => 'Barang Terlaris';

  @override
  String get rpNoItemsRecorded => 'Belum ada barang tercatat';

  @override
  String get rpTopCustomers => 'Pelanggan Teratas berdasarkan Pendapatan';

  @override
  String get rpNoSalesRecorded => 'Belum ada penjualan tercatat';

  @override
  String get rpTotalOutstanding => 'Total Tertunggak';

  @override
  String get rpViewCustomers => 'Lihat pelanggan';

  @override
  String get lblInvoice => 'faktur';

  @override
  String get lblLedger => 'buku besar';

  @override
  String get lblRateCard => 'daftar harga';

  @override
  String get exCsvNeedsRows => 'CSV membutuhkan baris header dan minimal satu pengeluaran.';

  @override
  String get exCsvHeader => 'Header CSV harus memuat kolom \"description\" dan \"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'Baris $line: deskripsi kosong atau jumlah tidak valid — perbaiki file lalu coba lagi.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Baris $line: tanggal tidak valid \"$date\" — gunakan YYYY-MM-DD.';
  }

  @override
  String get exImportTitle => 'Impor Pengeluaran';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ditemukan $count pengeluaran di \"$file\". Impor semuanya?',
      one: 'Ditemukan 1 pengeluaran di \"$file\". Impor semuanya?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pengeluaran diimpor.',
      one: '1 pengeluaran diimpor.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Impor gagal: kesalahan server $code';
  }

  @override
  String get exDeleteTitle => 'Hapus Pengeluaran';

  @override
  String get exAdd => 'Tambah Pengeluaran';

  @override
  String get exEdit => 'Ubah Pengeluaran';

  @override
  String get exDescription => 'Deskripsi';

  @override
  String get exAmountRs => 'Jumlah (Rs)';

  @override
  String get exCategory => 'Kategori';

  @override
  String exDate(String date) {
    return 'Tanggal: $date';
  }

  @override
  String get exRepeats => 'Berulang setiap bulan';

  @override
  String get exRepeatsHint => 'Sewa, listrik, upah, dll.';

  @override
  String get exReceiptTap => 'Foto struk, ketuk untuk mengganti';

  @override
  String get exReceiptOptional => 'Foto struk (opsional)';

  @override
  String get exEnterValid => 'Masukkan deskripsi dan jumlah yang valid.';

  @override
  String get exOffline => 'Offline — pengeluaran disimpan di perangkat ini, akan disinkronkan otomatis saat kembali online';

  @override
  String get exSave => 'Simpan Pengeluaran';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pengeluaran berulang jatuh tempo bulan ini',
      one: '1 pengeluaran berulang jatuh tempo bulan ini',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Tambah';

  @override
  String get exTotal => 'Total Pengeluaran';

  @override
  String exCategoryChip(String name) {
    return 'Kategori: $name';
  }

  @override
  String get exNoneLogged => 'Belum ada pengeluaran tercatat';

  @override
  String exNoneInCategory(String name) {
    return 'Belum ada pengeluaran $name';
  }

  @override
  String get exViewReceipt => 'Lihat struk';

  @override
  String get exEditRow => 'Ubah pengeluaran';

  @override
  String get exDeleteRow => 'Hapus pengeluaran';

  @override
  String gstServerReturned(String first, String second) {
    return 'Server mengembalikan $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'Tidak bisa memuat data GST: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Gagal mengunduh ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename disimpan';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Disimpan di Unduhan/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Tidak bisa mengunduh: $error';
  }

  @override
  String get gstTitle => 'Laporan Pajak Penjualan';

  @override
  String get gstOutwardDetail => 'Penjualan Keluar — Rincian Faktur';

  @override
  String get gstNoBills => 'Tidak ada tagihan bulan ini.';

  @override
  String get gstHsn => 'Ringkasan HSN';

  @override
  String get gstInvoiceWise => 'Rincian per faktur';

  @override
  String get gstMonthly => 'Ringkasan Bulanan';

  @override
  String get gstOutwardTaxable => 'Penyerahan keluar kena pajak';

  @override
  String get gstItc => 'Kredit Pajak Masukan (dari pembelian)';

  @override
  String get gstSave => 'Simpan';

  @override
  String get rcValidAmount => 'Masukkan jumlah yang valid.';

  @override
  String get rcExpected => 'Kas yang Diharapkan (penjualan tunai hari ini)';

  @override
  String get rcAlsoCollected => 'Juga diterima hari ini (tidak dihitung di laci)';

  @override
  String get rcCounted => 'Kas Dihitung di Laci (Rs)';

  @override
  String get rcCompare => 'Bandingkan';

  @override
  String get rcMatches => 'Cocok persis!';

  @override
  String rcExtra(String amount) {
    return 'Lebih $amount di laci';
  }

  @override
  String rcMissing(String amount) {
    return 'Kurang $amount di laci';
  }

  @override
  String get pbiTitle => 'Laba per Barang';

  @override
  String get pbiNoSales => 'Belum ada penjualan';

  @override
  String get pbiByCategory => 'Per Kategori';

  @override
  String get pbiItemsByProfit => 'Barang berdasarkan Laba';

  @override
  String get svTitle => 'Nilai Stok';

  @override
  String get svNone => 'Tidak ada stok';

  @override
  String get svItemsByValue => 'Barang berdasarkan Nilai';

  @override
  String svSummary(String items, String units) {
    return '$items barang · $units unit di rak';
  }

  @override
  String svTied(String amount) {
    return '$amount tertahan di stok';
  }

  @override
  String get svEstimated => 'perkiraan dari harga jual';

  @override
  String get bkRestoreTitle => 'Pulihkan Cadangan?';

  @override
  String bkRestoreBody(String filename) {
    return 'Ini akan mengganti SEMUA data saat ini dengan file cadangan \"$filename\". Lanjutkan?';
  }

  @override
  String get bkRestore => 'Pulihkan';

  @override
  String get bkRestoreDoneTitle => 'Pemulihan Selesai';

  @override
  String get bkRestoreDoneBody => 'Data Anda telah dipulihkan.';

  @override
  String get bkOk => 'OK';

  @override
  String bkRestoreFailed(String detail) {
    return 'Pemulihan gagal: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Tidak bisa memulihkan: $error';
  }

  @override
  String get bkSaveToDownloads => 'Simpan ke Unduhan';

  @override
  String get bkIntroAdmin => 'Semua data Anda ada dalam satu file basis data. Unduh salinannya secara berkala, dan pulihkan jika terjadi masalah.';

  @override
  String get bkIntroStaff => 'Cadangan dan pemulihan basis data penuh hanya untuk admin. Minta admin, atau ekspor yang Anda perlukan sebagai CSV di bawah.';

  @override
  String get bkBackupDb => 'Cadangkan Basis Data';

  @override
  String get bkBackupDbSub => 'Unduh seluruh basis data sebagai satu file dan bagikan (WhatsApp, Drive, email).';

  @override
  String get bkDownloadPhone => 'Unduh Cadangan ke Ponsel';

  @override
  String get bkShareBackup => 'Bagikan Cadangan';

  @override
  String get bkAutoTitle => 'Cadangan Otomatis';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cadangan harian tersimpan di server, yang terbaru dari $time. Berjalan sendiri — tidak ada yang perlu dilakukan di sini.',
      one: '1 cadangan harian tersimpan di server, yang terbaru dari $time. Berjalan sendiri — tidak ada yang perlu dilakukan di sini.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Pilih file cadangan tersimpan untuk menggantikan data saat ini.';

  @override
  String get bkRestoreFromFile => 'Pulihkan dari File Cadangan';

  @override
  String get bkExportCsv => 'Ekspor ke CSV';

  @override
  String get bkExportSub => 'Buka di Excel atau bagikan.';

  @override
  String get bkRangeAll => 'Tagihan/Pengeluaran: semua waktu';

  @override
  String bkRangeSome(String end, String start) {
    return 'Tagihan/Pengeluaran: $start sampai $end';
  }

  @override
  String get bkSetRange => 'Atur Rentang';

  @override
  String get bkClearRange => 'Hapus rentang';

  @override
  String get ntNever => 'Belum pernah dijalankan';

  @override
  String get ntJustNow => 'Baru saja';

  @override
  String ntMinutesAgo(int count) {
    return '$count mnt lalu';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count jam lalu';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count hr lalu';
  }

  @override
  String get ntTitle => 'Notifikasi Pintar';

  @override
  String get ntTapHint => 'Ketuk \"Periksa Sekarang\" untuk memicu notifikasi dan melihat hasil langsung.';

  @override
  String get ntLowStockSub => 'Beri tahu saat barang turun di bawah batas pemesanan ulang.';

  @override
  String get ntCheckNow => 'Periksa Sekarang';

  @override
  String get ntOverdue => 'Pengingat Pembayaran Tertunggak';

  @override
  String get ntOverdueSub => 'Beri tahu tentang tagihan belum lunas dari hari-hari sebelumnya.';

  @override
  String get ntDaily => 'Ringkasan Bisnis Harian';

  @override
  String get ntDailySub => 'Penjualan, penerimaan, dan laba kemarin sekilas.';

  @override
  String get ntSendSummary => 'Kirim Ringkasan';

  @override
  String get ntRunning => 'Berjalan…';

  @override
  String get ntLowStockItems => 'Barang Stok Rendah';

  @override
  String get ntSales => 'Penjualan';

  @override
  String get ntCollected => 'Diterima';

  @override
  String get ntProfit => 'Laba';

  @override
  String get auChecking => 'Memeriksa pembaruan…';

  @override
  String get auLatest => 'Anda memakai versi terbaru.';

  @override
  String get auAvailable => 'Pembaruan tersedia';

  @override
  String auNewer(int code) {
    return 'Versi Book-Keep yang lebih baru (build $code) sudah siap.';
  }

  @override
  String get auLater => 'Nanti';

  @override
  String get auUpdate => 'Perbarui';

  @override
  String get auDownloading => 'Mengunduh pembaruan';

  @override
  String auSaved(String name) {
    return '$name disimpan di folder Unduhan Anda.';
  }

  @override
  String get auAllowInstall => 'Izinkan Book-Keep memasang aplikasi, lalu ketuk Perbarui lagi.';

  @override
  String get auFailed => 'Tidak bisa memperbarui — periksa koneksi Anda dan coba lagi.';

  @override
  String get lgSearch => 'Cari bahasa';

  @override
  String lgNoMatch(String query) {
    return 'Tidak ada bahasa yang cocok dengan \"$query\"';
  }

  @override
  String get alVoided => 'Membatalkan tagihan';

  @override
  String get alDeletedBill => 'Menghapus tagihan';

  @override
  String get alReturned => 'Meretur tagihan';

  @override
  String get alDeletedCustomer => 'Menghapus pelanggan';

  @override
  String get alDeletedSupplier => 'Menghapus pemasok';

  @override
  String get alCreatedAccount => 'Membuat akun';

  @override
  String get alUpdatedAccount => 'Memperbarui akun';

  @override
  String get alDeletedAccount => 'Menghapus akun';

  @override
  String get alTitle => 'Log Aktivitas';

  @override
  String get alNone => 'Belum ada aktivitas tercatat';

  @override
  String get blkEnterOne => 'Masukkan minimal satu barang';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count barang berhasil ditambahkan',
      one: '1 barang berhasil ditambahkan',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Tambah Barang Sekaligus';

  @override
  String get blkFormat => 'Satu barang per baris, format: Nama, Harga, Satuan, Kategori';

  @override
  String get blkOptional => 'Satuan dan kategori bersifat opsional (default: piece, tanpa kategori)';

  @override
  String get blkAddAll => 'Tambahkan Semua Barang';

  @override
  String get prSend => 'Kirim Pengingat Pembayaran';

  @override
  String get prTone => 'Pilih Nada:';

  @override
  String get prPolite => 'Sopan';

  @override
  String get prStandard => 'Standar';

  @override
  String get prUrgent => 'Mendesak';

  @override
  String get prPreviewQr => 'Pratinjau QR Pembayaran JazzCash';

  @override
  String get prShareText => 'Bagikan Teks';

  @override
  String get dsRemaining => 'Sisa';

  @override
  String dsIncludesDiscount(String amount) {
    return 'termasuk diskon $amount';
  }

  @override
  String get dsItems => 'Barang';

  @override
  String get dsDiscount => 'Diskon';

  @override
  String get lkWrongPin => 'PIN salah';

  @override
  String get lkEnterPin => 'Masukkan PIN';

  @override
  String get lkChecking => 'Memeriksa sidik jari...';

  @override
  String get bcTitle => 'Pindai Barcode';

  @override
  String get bcTorchNa => 'Senter tidak tersedia di perangkat ini';

  @override
  String get bcTorch => 'Senter';

  @override
  String get bcPoint => 'Arahkan kamera ke barcode';

  @override
  String get qrNoNumber => 'Belum ada nomor JazzCash. Atur di Pengaturan untuk menampilkan kode QR pembayaran.';

  @override
  String get qrPay => 'Bayar via JazzCash';

  @override
  String get qrInvalid => 'Data QR tidak valid';

  @override
  String qrAmount(String amount) {
    return 'Jumlah: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'Salin nomor JazzCash';

  @override
  String get qrCopied => 'Nomor JazzCash disalin ke papan klip';

  @override
  String get qrHint => 'Pindai atau salin nomor ini di aplikasi JazzCash Anda untuk membayar.';

  @override
  String clOwed(String amount) {
    return '$amount belum dibayar';
  }

  @override
  String get lnEnterEmailFirst => 'Masukkan email yang valid di atas terlebih dahulu.';

  @override
  String get lnResetSent => 'Email atur ulang kata sandi terkirim — periksa kotak masuk Anda.';

  @override
  String get lnNoAccount => 'Tidak ada akun untuk email tersebut.';

  @override
  String get lnWrongPassword => 'Kata sandi salah.';

  @override
  String get lnInvalidEmail => 'Itu sepertinya bukan alamat email yang valid.';

  @override
  String get lnDisabled => 'Akun ini telah dinonaktifkan.';

  @override
  String get lnTooMany => 'Terlalu banyak percobaan — coba lagi dalam semenit.';

  @override
  String get lnNoInternet => 'Tidak ada koneksi internet.';

  @override
  String get lnWeakPassword => 'Kata sandi minimal 6 karakter.';

  @override
  String get lnCouldNotSignIn => 'Tidak bisa masuk. Silakan coba lagi.';

  @override
  String get lnWrongPasswordHint => 'Kata sandi salah. Coba lagi atau ketuk \"Lupa kata sandi?\".';

  @override
  String get lnWrongEmail => 'Email salah — tidak ada akun dengan alamat itu.';

  @override
  String get lnWrongEmailOrPassword => 'Email atau kata sandi salah.';

  @override
  String get lnWrongUsername => 'Nama pengguna salah — tidak ada akun dengan nama itu.';

  @override
  String get lnWelcome => 'Selamat datang kembali';

  @override
  String lnSignInTo(String app) {
    return 'Masuk ke $app';
  }

  @override
  String get lnEmailOrUsername => 'Email atau Nama Pengguna';

  @override
  String get lnRemember => 'Ingat saya';

  @override
  String get lnForgot => 'Lupa kata sandi?';

  @override
  String get lnSignIn => 'Masuk';

  @override
  String get lnGoogle => 'Lanjutkan dengan Google';

  @override
  String get lnNew => 'Baru di sini?';

  @override
  String get lnCreate => 'Buat akun';

  @override
  String suCreated(String email) {
    return 'Akun dibuat untuk $email. Email verifikasi telah dikirim (opsional).';
  }

  @override
  String suSetup(String app) {
    return 'Siapkan $app';
  }

  @override
  String get suName => 'Nama';

  @override
  String get suEmail => 'Email';

  @override
  String suPhoneDigits(int digits) {
    return 'Masukkan nomor $digits digit yang valid';
  }

  @override
  String get suCreateBtn => 'Buat Akun';

  @override
  String get suHaveAccount => 'Sudah punya akun?';

  @override
  String get suAlreadyExists => 'Akun dengan email itu sudah ada.';

  @override
  String get suInvalidEmail => 'Alamat email tidak valid.';

  @override
  String get agShow => 'Tampilkan kata sandi';

  @override
  String get agHide => 'Sembunyikan kata sandi';

  @override
  String get adAccounts => 'Akun';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count akun terdaftar',
      one: '1 akun terdaftar',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Tambah';

  @override
  String get adNoAccounts => 'Tidak ada akun.';

  @override
  String get adAccountability => 'Akuntabilitas';

  @override
  String get adAccountabilitySub => 'Siapa yang membatalkan, menghapus, atau meretur sesuatu, dan perubahan akun.';

  @override
  String get adActivitySub => 'Tagihan dibatalkan, penghapusan, perubahan akun';

  @override
  String get adServer => 'Server';

  @override
  String get adServerSub => 'Ke mana aplikasi ini terhubung. Jarang perlu diubah setelah pengaturan awal.';

  @override
  String get adServerHint => 'Emulator memakai 10.0.2.2; ponsel sungguhan membutuhkan IP laptop di Wi-Fi yang sama. Mengubahnya memengaruhi semua akun.';

  @override
  String get adApiBase => 'URL Dasar API';

  @override
  String get adSaveServer => 'Simpan Alamat Server';

  @override
  String get adEmailSetSub => 'Sudah diatur — staf bisa mengirim faktur/laporan ke email pelanggan.';

  @override
  String get adNotSetUp => 'Belum diatur.';

  @override
  String get adEmailSetBody => 'Email sudah diatur. Memungkinkan staf mengirim faktur atau laporan langsung ke pelanggan.';

  @override
  String get adEmailHelp => 'Alamat Gmail bisa dipakai dengan sandi aplikasi (smtp.gmail.com, port 587), atau gunakan detail SMTP penyedia email Anda.';

  @override
  String get adSmtpHost => 'Host SMTP';

  @override
  String get adSmtpPort => 'Port SMTP';

  @override
  String get adEmailAddress => 'Alamat Email';

  @override
  String get adPwKeep => 'Kata sandi (kosongkan untuk mempertahankan yang sekarang)';

  @override
  String get adPwApp => 'Kata sandi (sandi aplikasi, bukan kata sandi login Anda)';

  @override
  String get adFromName => 'Nama Pengirim (opsional)';

  @override
  String get adFromHint => 'Toko Bangunan Saya';

  @override
  String get adSaving => 'Menyimpan...';

  @override
  String get adSaveEmail => 'Simpan Pengaturan Email';

  @override
  String get adAddAccount => 'Tambah akun';

  @override
  String get adNameOpt => 'Nama (opsional)';

  @override
  String get adAtLeast6 => 'Minimal 6 karakter';

  @override
  String get adGrantAdmin => 'Jadikan admin';

  @override
  String get adCanManage => 'Boleh membatalkan/menghapus/meretur';

  @override
  String get adCanManageHint => 'Membatalkan atau menghapus tagihan, meretur tagihan, atau menghapus pelanggan/pemasok. Admin selalu memiliki hak ini.';

  @override
  String get adCreate => 'Buat';

  @override
  String get adAccountCreated => 'Akun dibuat.';

  @override
  String adCreateFailed(String error) {
    return 'Gagal membuat: $error';
  }

  @override
  String get adEditAccount => 'Ubah akun';

  @override
  String get adAdminSwitch => 'Admin';

  @override
  String get adAdminHint => 'Boleh membuka panel admin';

  @override
  String get adDisabled => 'Dinonaktifkan';

  @override
  String get adDisabledHint => 'Dilarang masuk';

  @override
  String get adAccountUpdated => 'Akun diperbarui.';

  @override
  String adUpdateFailed(String error) {
    return 'Gagal memperbarui: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label akan dihapus permanen dan tidak bisa masuk lagi.';
  }

  @override
  String get adAccountDeleted => 'Akun dihapus.';

  @override
  String adDeleteFailed(String error) {
    return 'Gagal menghapus: $error';
  }

  @override
  String get adBadgeAdmin => 'ADMIN';

  @override
  String get adBadgeDisabled => 'NONAKTIF';

  @override
  String get adOff => 'Panel admin nonaktif';

  @override
  String get adCheckAgain => 'Periksa lagi';

  @override
  String get adAccessRequired => 'Perlu akses admin';

  @override
  String get adAccessBody => 'Hanya admin toko yang bisa mengelola akun. Minta pemilik toko memberi Anda akses admin.';

  @override
  String get adCouldNotLoad => 'Tidak bisa memuat panel admin.';

  @override
  String get adBadPort => 'Masukkan nomor port SMTP yang valid.';

  @override
  String get adEmailSaved => 'Pengaturan email disimpan.';

  @override
  String adEmailSaveFailed(String error) {
    return 'Tidak bisa menyimpan pengaturan email: $error';
  }

  @override
  String get adServerEmpty => 'Alamat server tidak boleh kosong.';

  @override
  String get adServerSaved => 'Alamat server disimpan. Layar akan memakainya pada pemuatan berikutnya.';

  @override
  String get lnOr => 'atau';

  @override
  String get scNotABill => 'Ini sepertinya bukan tagihan. Coba lagi dengan foto tagihan yang jelas.';

  @override
  String get scNotAnInvoice => 'Ini sepertinya bukan faktur. Coba lagi dengan foto faktur pemasok yang jelas.';

  @override
  String get jqOpenFull => 'Layar penuh';

  @override
  String get jqCopy => 'Salin nomor';

  @override
  String get jqSheetTitle => 'QR JazzCash';

  @override
  String get jqSheetHint => 'Pelanggan memindai ini di aplikasi JazzCash mereka untuk membayar Anda.';

  @override
  String get jqCheck => 'Periksa nomornya';

  @override
  String get askVoice => 'Suara';

  @override
  String get askVoiceFallbackNote => 'Dibacakan dengan suara ponsel Anda.';

  @override
  String get askPace => 'Kecepatan';

  @override
  String get askTone => 'Nada';

  @override
  String get askPaceSlower => 'Lebih lambat';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Lebih cepat';

  @override
  String get askToneCalm => 'Tenang';

  @override
  String get askToneWarm => 'Hangat';

  @override
  String get askToneCheerful => 'Ceria';

  @override
  String qPaymentUpdate(String amount) {
    return 'Pembaruan pembayaran: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Pelanggan: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Pemasok: $name';
  }

  @override
  String qItem(String name) {
    return 'Barang: $name';
  }

  @override
  String qExpense(String name) {
    return 'Pengeluaran: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Pembelian: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Pembayaran diterima: $amount dari $name';
  }

  @override
  String gstAmount(String amount) {
    return 'PPN $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Kena pajak $taxable  ·  PPN $tax  ·  Total $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Pendapatan: $revenue  •  HPP: $cogs  •  Pengeluaran: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Halo $customer, salam hangat dari $shop! Total tagihan Anda adalah $amount. Terima kasih!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Halo $customer, pengingat pembayaran dari $shop untuk sisa tagihan $amount. Mohon segera dilunasi.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'PEMBERITAHUAN PENTING: Yth. $customer, pembayaran Anda sebesar $amount di $shop belum lunas. Mohon segera diselesaikan.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Bayar lewat JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Faktur dari $shop\nTotal: $total\nBarang: $items\nStatus: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Halo $supplier, ini $shop. Kami ingin memesan:\n$lines\n\nMohon konfirmasi ketersediaan dan harga. Terima kasih.';
  }

  @override
  String ppUpdated(String date) {
    return 'Terakhir diperbarui: $date';
  }

  @override
  String get ppWhoH => 'Siapa kami';

  @override
  String ppWho(String owner, String email) {
    return '$owner, pengelola Book-keep.\nKontak: $email';
  }

  @override
  String get ppCollectH => 'Data yang kami kumpulkan';

  @override
  String get ppCollectAccount => 'Akun: email, nomor telepon, dan nama pengguna, melalui Firebase Authentication.';

  @override
  String get ppCollectShop => 'Profil toko: nama toko, alamat, nomor telepon, nomor JazzCash, dan logo toko, yang dimasukkan pemilik toko di Pengaturan.';

  @override
  String get ppCollectRecords => 'Catatan bisnis yang Anda buat: nama dan nomor telepon pelanggan dan pemasok, tagihan, pembelian, katalog barang (termasuk foto barang dan barcode), dan pengeluaran (termasuk foto struk). Ini adalah data inti aplikasi — begitulah pembukuan bekerja.';

  @override
  String get ppCollectDevice => 'Data perangkat dan diagnostik: token notifikasi push (untuk peringatan stok menipis, pembayaran terlambat, dan ringkasan harian) dan laporan error (info perangkat dan stack trace) melalui Firebase Crashlytics, dikirim otomatis saat aplikasi error.';

  @override
  String ppCollectAi(String askShop) {
    return 'Fitur AI: $askShop, Ringkasan Pagi AI, dan pemindai tagihan/pembelian AI mengirim cuplikan data bisnis terkait (angka laporan atau foto tagihan) ke Gemini API milik Google untuk menghasilkan jawaban, ringkasan, atau item baris yang diekstrak. Data ini diproses oleh Google untuk menghasilkan respons; data ini tidak digunakan oleh kami maupun Google untuk melatih model di luar ketentuan standar API Google.';
  }

  @override
  String get ppDontH => 'Yang tidak kami lakukan';

  @override
  String get ppDontLocation => 'Kami tidak melacak lokasi Anda.';

  @override
  String get ppDontAds => 'Kami tidak menggunakan jaringan iklan atau alat analitik perilaku/rekaman sesi.';

  @override
  String get ppDontSell => 'Kami tidak menjual data Anda atau data pelanggan Anda kepada siapa pun.';

  @override
  String get ppWhereH => 'Tempat data disimpan';

  @override
  String get ppWhereDb => 'Database: Neon (Postgres), penyedia database cloud pihak ketiga.';

  @override
  String get ppWhereFirebase => 'Autentikasi, notifikasi push, laporan error, penyimpanan foto: Firebase (Google).';

  @override
  String get ppWhereAi => 'Pemrosesan AI: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Email tagihan: dikirim melalui akun SMTP yang diatur admin toko Anda di $adminPanel. Kami tidak mengelola milis; email ini adalah tagihan/laporan satu per satu untuk pelanggan Anda sendiri, bukan pemasaran massal.';
  }

  @override
  String get ppYoursH => 'Data Anda, data pelanggan Anda';

  @override
  String get ppYours => 'Semua yang Anda masukkan — pelanggan, pemasok, tagihan, barang — adalah milik toko Anda. Toko lain yang memakai Book-keep tidak dapat melihatnya. Akun staf yang Anda buat hanya dapat melihat apa yang Anda izinkan.';

  @override
  String get ppControlsH => 'Kendali Anda';

  @override
  String ppControlExport(String path) {
    return 'Ekspor atau cadangkan data Anda: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Hapus akun Anda: $path. Ini hanya menghapus kredensial masuk Anda; catatan bisnis toko Anda (tagihan, pelanggan, barang, dll.) tidak dihapus, sama seperti menghapus staf tidak menghapus catatan yang mereka buat.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Notifikasi: dapat dimatikan per jenis di $path.';
  }

  @override
  String get ppChildrenH => 'Anak-anak';

  @override
  String get ppChildren => 'Book-keep adalah alat bisnis untuk pemilik toko dan staf. Aplikasi ini tidak ditujukan untuk anak-anak dan tidak digunakan oleh mereka dengan sepengetahuan kami.';

  @override
  String get ppChangesH => 'Perubahan kebijakan ini';

  @override
  String get ppChanges => 'Jika data yang kami kumpulkan atau tujuannya berubah, kami akan memperbarui halaman ini dan mengubah tanggal di bagian atas.';

  @override
  String get ppContactH => 'Kontak';

  @override
  String ppContact(String email) {
    return 'Pertanyaan tentang kebijakan ini atau data Anda: $email';
  }

  @override
  String get waHello => 'Halo!';

  @override
  String waHelloNamed(String name) {
    return 'Halo $name,';
  }

  @override
  String get gstTaxable => 'Kena pajak';

  @override
  String get gstTax => 'Pajak';

  @override
  String get gstTaxableValue => 'Nilai kena pajak';

  @override
  String get gstTotalTax => 'Total pajak';

  @override
  String get gstTotalItc => 'Total kredit pajak masukan';

  @override
  String get gstExempt => 'Penjualan dibebaskan';

  @override
  String get gstNetPayable => 'Pajak bersih terutang';

  @override
  String get unknownName => 'Tidak diketahui';

  @override
  String get unitPiece => 'buah';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'meter';

  @override
  String get unitBox => 'kotak';

  @override
  String get unitDozen => 'lusin';

  @override
  String get unitLiter => 'liter';

  @override
  String get unitBag => 'karung';

  @override
  String deleteSupplierMessage(String name) {
    return 'Hapus $name dan semua pembeliannya? Tindakan ini tidak dapat dibatalkan.';
  }
}
