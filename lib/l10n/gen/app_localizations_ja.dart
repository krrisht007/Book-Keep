// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get navHome => 'ホーム';

  @override
  String get navCustomers => '顧客';

  @override
  String get navItems => '商品';

  @override
  String get navSuppliers => '仕入先';

  @override
  String get navReports => 'レポート';

  @override
  String get navSettings => '設定';

  @override
  String get settingsShopDetailsTitle => '店舗情報';

  @override
  String get settingsShopDetailsSubtitle => '請求書に表示されます。';

  @override
  String get settingsShopNameLabel => '店舗名';

  @override
  String get settingsShopAddressLabel => '店舗住所';

  @override
  String get settingsPhoneLabel => '電話番号';

  @override
  String get settingsSaveShopDetails => '店舗情報を保存';

  @override
  String get settingsAppearanceTitle => '外観';

  @override
  String get settingsAppearanceSubtitle => 'アプリ全体のテーマを選択してください。';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeSystem => 'システム';

  @override
  String get settingsLanguageTitle => '言語';

  @override
  String get settingsLanguageSubtitle => 'アプリの表示言語を選択してください。';

  @override
  String get sortNameNewest => '並べ替え：名前 / 新しい順';

  @override
  String get addCustomer => '顧客を追加';

  @override
  String get importCsv => 'CSVをインポート';

  @override
  String get searchShop => '店内を検索';

  @override
  String get scanToFindItem => 'スキャンして商品を探す';

  @override
  String get bulkAdd => '一括追加';

  @override
  String get updateStock => '在庫を更新';

  @override
  String get printLabels => 'ラベルを印刷';

  @override
  String get mergeDuplicates => '重複を統合';

  @override
  String get addSupplier => '仕入先を追加';

  @override
  String get scanPurchaseInvoice => '仕入請求書をスキャン';

  @override
  String askNoAnswer(String reason) {
    return '回答を取得できませんでした：$reason';
  }

  @override
  String couldNotConnect(String error) {
    return '接続できませんでした：$error';
  }

  @override
  String get micPermissionNeeded => '音声入力にはマイクの許可が必要です。';

  @override
  String get speechUnavailable => 'この端末では音声認識を利用できません。';

  @override
  String get askYourShop => 'お店に聞く';

  @override
  String get close => '閉じる';

  @override
  String get askIntro => 'お店の調子が気になりますか？聞いてください。帳簿に載っている内容からお答えします。';

  @override
  String get askListening => '聞いています…';

  @override
  String get askThinkingWords => '考え中…|処理中…|計算中…|帳簿を確認中…|集計中…|数字を分析中…';

  @override
  String get askSayQuestion => '質問を話してください — 取り消すには球をタップ';

  @override
  String briefingRefreshFailed(int code) {
    return 'サマリーを更新できませんでした（$code）。';
  }

  @override
  String get refreshFailedOffline => '更新できませんでした — 接続を確認してください。';

  @override
  String get newBillFailed => '新しい伝票を作成できませんでした — 接続を確認してもう一度お試しください。';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'まず$nameの優先仕入先を設定してください（タップして編集）。';
  }

  @override
  String get reorderBySupplier => '仕入先ごとに再注文';

  @override
  String get supplier => '仕入先';

  @override
  String itemCount(int count) {
    return '$count品目';
  }

  @override
  String get noLowStockWithSupplier => '在庫の少ない商品に優先仕入先がまだ設定されていません。';

  @override
  String get thisSupplier => 'この仕入先';

  @override
  String supplierNoPhone(String name) {
    return '$nameの電話番号が登録されていません。';
  }

  @override
  String get tabOverview => '概要';

  @override
  String get tabStock => '在庫';

  @override
  String get tabMoney => 'お金';

  @override
  String get taglineOverview => '今日の未収金・在庫・現金をひと目で。';

  @override
  String get taglineStock => '売れている物、少なくなっている物。';

  @override
  String get taglineMoney => '経費・照合・回収。';

  @override
  String loadingDashboard(int done, int total) {
    return 'ダッシュボードを読み込み中… $done/$total';
  }

  @override
  String get dashboardLoadFailed => 'ダッシュボードを読み込めませんでした';

  @override
  String get checkConnectionRetry => '接続を確認してもう一度お試しください。';

  @override
  String get retry => '再試行';

  @override
  String get aiBriefing => 'AIサマリー';

  @override
  String get briefingPrompt => '昨日の商売を数文で確認できます。';

  @override
  String get getBriefing => 'サマリーを取得';

  @override
  String get refreshBriefing => 'サマリーを更新';

  @override
  String updatedAt(String time) {
    return '$timeに更新';
  }

  @override
  String get customersUnknown => '— 顧客';

  @override
  String customerCount(int count) {
    return '顧客$count人';
  }

  @override
  String get previousMonth => '前月';

  @override
  String get nextMonth => '翌月';

  @override
  String get salesMonth => '売上（月）';

  @override
  String get outstanding => '未収金';

  @override
  String get profitMonth => '利益（月）';

  @override
  String get cashToday => '本日の現金';

  @override
  String get newBill => '新しい伝票';

  @override
  String get scanHandwrittenBill => '手書き伝票をスキャン';

  @override
  String get topOutstanding => '未収金の多い顧客';

  @override
  String viewAllInDues(int count) {
    return '未収金センターで全$count件を表示';
  }

  @override
  String get lowStockAlerts => '在庫不足の通知';

  @override
  String get noLowStock => '在庫の少ない商品はありません — 問題なし。';

  @override
  String get whatsappAll => '全員にWhatsApp';

  @override
  String get reorderAll => 'すべて再注文';

  @override
  String suggestReorder(String qty, String unit) {
    return 'おすすめ：$qty $unitを再注文';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '残り$qty $unit';
  }

  @override
  String get reorder => '再注文';

  @override
  String get whatsappSupplier => '仕入先にWhatsApp';

  @override
  String get topItemsByRevenue => '売上上位の商品';

  @override
  String get noSalesYet => 'まだ売上の記録がありません。';

  @override
  String qtyLabel(String qty) {
    return '数量：$qty';
  }

  @override
  String get monthExpenses => '今月の経費';

  @override
  String get noExpensesMonth => '今月の経費はまだありません。';

  @override
  String get quickActions => 'クイック操作';

  @override
  String get dailyCashReconciliation => '日次の現金照合';

  @override
  String get collectMoney => '集金する';

  @override
  String changesSavedOffline(int count) {
    return '$count件の変更をオフラインで保存済み';
  }

  @override
  String get willSyncOnline => 'オンラインに戻ると自動で同期されます';

  @override
  String get syncing => '同期中';

  @override
  String get sync => '同期';

  @override
  String get shopProfile => '店舗プロフィール';

  @override
  String get insights => 'インサイト';

  @override
  String get notifications => '通知';

  @override
  String get backupExport => 'バックアップとエクスポート';

  @override
  String get adminPanel => '管理パネル';

  @override
  String get toolsSync => 'ツールと同期';

  @override
  String get account => 'アカウント';

  @override
  String get shopDetailsSaved => '店舗情報を保存しました。';

  @override
  String saveFailed(int code) {
    return '保存に失敗しました（$code）';
  }

  @override
  String couldNotSave(String error) {
    return '保存できませんでした：$error';
  }

  @override
  String get logoUpdated => 'ロゴを更新しました。';

  @override
  String logoUploadFailed(int code) {
    return 'ロゴのアップロードに失敗しました（$code）';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'ロゴをアップロードできませんでした：$error';
  }

  @override
  String get healthGood => '全体的に良好です。';

  @override
  String get healthSome => 'いくつか注意が必要な点があります。';

  @override
  String get healthMany => '注意が必要な点が多くあります。';

  @override
  String get shopHealth => '店舗の健康状態';

  @override
  String get healthIntro => 'ちょっとしたお知らせです。レポートではありません。';

  @override
  String get couldNotLoadCheckConnection => '読み込めませんでした — 接続を確認してください。';

  @override
  String get itemPhotos => '商品写真';

  @override
  String get barcodes => 'バーコード';

  @override
  String get lowStockItems => '在庫の少ない商品';

  @override
  String get lastBackup => '最終バックアップ';

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String daysAgo(int days) {
    return '$days日前';
  }

  @override
  String get offlineStatus => 'オフライン状態';

  @override
  String get online => 'オンライン';

  @override
  String get offline => 'オフライン';

  @override
  String get waitingToSync => '同期待ち';

  @override
  String get syncNow => '今すぐ同期';

  @override
  String get searchSettings => '設定を検索';

  @override
  String noSettingsMatch(String query) {
    return '「$query」に一致する設定はありません';
  }

  @override
  String get businessInfo => '事業情報';

  @override
  String get payment => '支払い';

  @override
  String get shopNameRequired => '店舗名は必須です';

  @override
  String phoneIncomplete(int digits) {
    return '$digits桁の電話番号をすべて入力してください';
  }

  @override
  String get jazzcashOptional => 'JazzCash番号（任意）';

  @override
  String get saved => '保存しました！';

  @override
  String get languageSubtitle => 'アプリの表示言語を変更';

  @override
  String get notificationsSubtitle => '在庫不足・支払い遅延・毎日のまとめ';

  @override
  String get backupSubtitle => '店舗データのダウンロード・復元・エクスポート';

  @override
  String get appUpdate => 'アプリの更新';

  @override
  String get appUpdateSubtitle => '新しいバージョンを確認';

  @override
  String get adminSubtitle => 'アカウントと店舗データの管理';

  @override
  String get accountSubtitle => 'ログイン・パスワード・ユーザー名';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacySubtitle => '収集するデータとその理由';

  @override
  String get yourShop => 'あなたのお店';

  @override
  String get uploadingLogo => '店舗ロゴをアップロード中';

  @override
  String get logoTapToChange => '店舗ロゴ、タップして変更';

  @override
  String get brandTagline => 'お店は忙しくても、帳簿は穏やかに。';

  @override
  String serverError(int code) {
    return 'サーバーエラー：$code';
  }

  @override
  String get deleteCustomer => '顧客を削除';

  @override
  String deleteCustomerMessage(String name) {
    return '$nameとすべての伝票を削除しますか？元に戻せません。';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return '削除できませんでした：$detail';
  }

  @override
  String get couldNotDeleteOffline => '削除できませんでした — 接続を確認してもう一度お試しください。';

  @override
  String get actions => '操作';

  @override
  String get edit => '編集';

  @override
  String get delete => '削除';

  @override
  String deleteCustomersTitle(int count) {
    return '顧客$count人を削除';
  }

  @override
  String deleteCustomersMessage(int count) {
    return '顧客$count人とすべての伝票を削除しますか？元に戻せません。';
  }

  @override
  String get deselectAll => 'すべて選択解除';

  @override
  String get selectAll => 'すべて選択';

  @override
  String selectedCount(int count) {
    return '$count件選択中';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get newTag => '新規';

  @override
  String get csvNeedsRows => 'CSVには見出し行と少なくとも1人の顧客が必要です。';

  @override
  String get csvNeedsName => 'CSVの見出しに\"name\"列が必要です。';

  @override
  String csvLineMissingName(int line) {
    return '$line行目：名前がありません — ファイルを修正して再試行してください。';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return '$line行目：credit_limitが無効です\"$value\" — ファイルを修正して再試行してください。';
  }

  @override
  String get importCustomers => '顧客をインポート';

  @override
  String importCustomersConfirm(int count, String file) {
    return '\"$file\"に顧客が$count人見つかりました。すべてインポートしますか？';
  }

  @override
  String get importAction => 'インポート';

  @override
  String importedCustomers(int count) {
    return '顧客$count人をインポートしました。';
  }

  @override
  String importFailed(String detail) {
    return 'インポートに失敗しました：$detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'インポートに失敗しました — 接続できません：$error';
  }

  @override
  String get noPhone => '電話なし';

  @override
  String get offlineShowingSaved => 'オフライン — 保存済みのデータを表示中';

  @override
  String get searchCustomersHint => '顧客名または電話番号で検索...';

  @override
  String get noCustomersYet => 'まだ顧客がいません。+をタップして追加してください。';

  @override
  String get noCustomersMatch => '検索に一致する顧客はいません。';

  @override
  String get owesMoney => '未払いあり';

  @override
  String get settledUp => '精算済み';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$whatを読み込めませんでした：$error';
  }

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get chooseFromGallery => 'ギャラリーから選ぶ';

  @override
  String get back => '戻る';

  @override
  String callPhone(String phone) {
    return '$phoneに電話';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phoneにWhatsApp';
  }

  @override
  String get clearSearch => '検索をクリア';

  @override
  String get askHint => '例：今月の利益はいくら？';

  @override
  String get acctTurnOffLockTitle => 'アプリロックをオフにしますか？';

  @override
  String get acctTurnOffLockBody => 'このスマートフォンを持っている人は、PINなしでアプリを開けるようになります。';

  @override
  String get acctTurnOff => 'オフにする';

  @override
  String get acctSetPinTitle => 'PINを設定';

  @override
  String get acctPinLabel => '4〜6桁のPIN';

  @override
  String get acctPinMin => '4桁以上で入力してください';

  @override
  String get acctConfirmPin => 'PINの確認';

  @override
  String get acctPinMismatch => 'PINが一致しません';

  @override
  String get acctSetPin => 'PINを設定';

  @override
  String get acctBiometricTitle => '指紋/顔認証も使いますか？';

  @override
  String get acctBiometricBody => '生体認証が使えない場合でも、PINを使えます。';

  @override
  String get acctNoThanks => 'いいえ';

  @override
  String get acctEnable => '有効にする';

  @override
  String get acctSetPasswordTitle => 'パスワードを設定';

  @override
  String get acctSetPasswordIntro => 'パスワードを設定すると、次回からGoogleだけでなく、メールアドレス＋パスワードでもログインできます。';

  @override
  String get acctPassword => 'パスワード';

  @override
  String get acctPasswordMin => '6文字以上で入力してください';

  @override
  String get acctConfirmPassword => 'パスワードの確認';

  @override
  String get acctPasswordsMismatch => 'パスワードが一致しません';

  @override
  String get acctSetPasswordButton => 'パスワードを設定';

  @override
  String get acctPasswordSet => 'パスワードを設定しました。このパスワードでもログインできます。';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'パスワードを設定できませんでした: $error';
  }

  @override
  String get acctChangePasswordTitle => 'パスワードを変更';

  @override
  String get acctCurrentPassword => '現在のパスワード';

  @override
  String get acctRequired => '必須項目です';

  @override
  String get acctNewPassword => '新しいパスワード';

  @override
  String get acctConfirmNewPassword => '新しいパスワードの確認';

  @override
  String get acctChange => '変更';

  @override
  String get acctPasswordChanged => 'パスワードを変更しました。';

  @override
  String get acctWrongPassword => '現在のパスワードが正しくありません。';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'パスワードを変更できませんでした: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'ユーザー名を変更';

  @override
  String get acctUsername => 'ユーザー名';

  @override
  String get acctUsernameEmpty => 'ユーザー名を入力してください';

  @override
  String get acctUsernameChanged => 'ユーザー名を変更しました。';

  @override
  String get acctChangeEmailTitle => 'メールアドレスを変更';

  @override
  String get acctNewEmail => '新しいメールアドレス';

  @override
  String get acctValidEmail => '正しいメールアドレスを入力してください';

  @override
  String get acctRequiredConfirm => '本人確認のため必須です';

  @override
  String get acctGoogleConfirmFirst => '最初にGoogleでの確認が求められます。';

  @override
  String acctCheckEmail(String email) {
    return '変更を確認するリンクが$emailに届きます。ご確認ください。';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'パスワードでのログイン';

  @override
  String acctRemoveTitle(String provider) {
    return '$providerを解除しますか？';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'このアカウントでは、今後$providerでログインできなくなります。';
  }

  @override
  String get acctRemove => '解除';

  @override
  String acctRemoved(String provider) {
    return '$providerを解除しました。';
  }

  @override
  String get acctSignedIn => 'ログイン中';

  @override
  String get acctEmailNotVerified => 'メールアドレスはまだ確認されていません。';

  @override
  String get acctVerificationSent => '確認メールを送信しました。';

  @override
  String get acctResend => '再送信';

  @override
  String get acctSectionSignIn => 'ログインとセキュリティ';

  @override
  String get acctRowChangeUsername => 'ユーザー名を変更';

  @override
  String get acctRowChangeEmail => 'メールアドレスを変更';

  @override
  String get acctRowSetPassword => 'パスワードを設定';

  @override
  String get acctRowChangePassword => 'パスワードを変更';

  @override
  String get acctRowUnlinkGoogle => 'Googleの連携を解除';

  @override
  String get acctRowRemovePassword => 'パスワードを削除';

  @override
  String get acctRowAppLock => 'アプリロック（PIN）';

  @override
  String get acctRowBiometric => '指紋/顔認証を使う';

  @override
  String get acctSignOutTitle => 'ログアウトしますか？';

  @override
  String get acctSignOutBody => 'アプリを使うには、もう一度ログインが必要です。';

  @override
  String get acctSignOut => 'ログアウト';

  @override
  String get acctDeleteAccount => 'アカウントを削除';

  @override
  String get acctDeleting => '削除中...';

  @override
  String get acctDeleteTitle => 'アカウントを削除しますか？';

  @override
  String get acctDeleteBody => 'ログイン情報が完全に削除されます。アプリを使うには、あらためて新規登録が必要です。この操作は元に戻せません。';

  @override
  String acctCouldNotDelete(String error) {
    return 'アカウントを削除できませんでした: $error';
  }

  @override
  String get itmNotFoundTitle => '商品が見つかりません';

  @override
  String itmNotFoundBody(String barcode) {
    return 'バーコード $barcode の商品はありません。今すぐ新しい商品として追加しますか？';
  }

  @override
  String get itmAddItem => '商品を追加';

  @override
  String get itmEditItem => '商品を編集';

  @override
  String get itmMergeTitle => '重複した商品を統合';

  @override
  String get itmMergeBody => '同じ名前の商品は最も古い項目に統合され、在庫数が合算されます。この操作は元に戻せません。';

  @override
  String get itmMerge => '統合';

  @override
  String get itmNoDuplicates => '重複した商品はありません。';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '重複した商品を$count件統合しました。',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => '商品を削除';

  @override
  String get itmCannotUndo => 'この操作は元に戻せません。';

  @override
  String get itmDeleteOffline => '削除できませんでした。接続を確認してもう一度お試しください。';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の商品を削除',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の商品を削除しますか？この操作は元に戻せません。',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return '写真をアップロードできませんでした ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return '写真をアップロードできませんでした: $error';
  }

  @override
  String get itmNoBarcodes => 'バーコードが登録された商品はまだありません。';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ラベルを$count枚印刷',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => '商品またはカテゴリを検索...';

  @override
  String get itmStopListening => '聞き取りを停止';

  @override
  String get itmVoiceSearch => '音声検索';

  @override
  String get itmSort => '並べ替え';

  @override
  String get itmSortName => '名前（あいうえお順）';

  @override
  String get itmSortStockLow => '在庫：少ない順';

  @override
  String get itmSortRecent => '追加が新しい順';

  @override
  String get itmFilterAll => 'すべて';

  @override
  String get itmFilterLowStock => '在庫少';

  @override
  String get itmNoItemsYet => '商品はまだありません。+ をタップして追加しましょう。';

  @override
  String get itmNoItemsMatch => '検索に一致する商品はありません。';

  @override
  String get itmNoPriceChanges => '価格の変更はまだ記録されていません。';

  @override
  String get itmNoStockCorrections => '在庫の修正はまだ記録されていません。';

  @override
  String get itmResetHistory => '履歴をリセット';

  @override
  String get itmResetHistoryMsg => 'この商品の履歴をリセットしますか？この操作は元に戻せません。';

  @override
  String get itmSendPdf => 'PDFで送信';

  @override
  String get itmNoteOptional => 'メモ（任意）';

  @override
  String get itmNoteHint => 'この変更のメモを追加';

  @override
  String get itmRemoveEntry => '項目を削除';

  @override
  String get itmRemoveEntryMsg => 'この項目を履歴から削除しますか？この操作は元に戻せません。';

  @override
  String get itmEditEntry => '項目を編集';

  @override
  String get itmPrevQty => '変更前';

  @override
  String get itmNewQty => '変更後';

  @override
  String itmCost(String amount) {
    return '原価: $amount';
  }

  @override
  String get itmMore => 'その他';

  @override
  String get itmMenuPrintLabel => 'ラベルを印刷';

  @override
  String get itmMenuDuplicate => '複製';

  @override
  String get itmMenuPriceHistory => '価格履歴';

  @override
  String get itmMenuStockHistory => '在庫調整履歴';

  @override
  String itmLowStockBadge(int count) {
    return '在庫少 $count件';
  }

  @override
  String itmStockLine(String qty) {
    return '在庫: $qty';
  }

  @override
  String get itmOfflineSaved => 'オフライン — 商品をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get itmItemName => '商品名';

  @override
  String get itmNameRequired => '名前は必須です';

  @override
  String get itmPricePkr => '価格 (PKR)';

  @override
  String get itmPriceRequired => '価格は必須です';

  @override
  String get itmValidNumber => '正しい数値を入力してください';

  @override
  String get itmUnit => '単位';

  @override
  String get itmCategoryHint => 'カテゴリ（任意、例: 配管）';

  @override
  String get itmPreferredSupplier => '優先仕入先（任意）';

  @override
  String get itmPreferredSupplierHelper => 'ワンタップ再発注で使われます';

  @override
  String get itmClear => 'クリア';

  @override
  String get itmHsn => 'HSNコード（任意）';

  @override
  String get itmGstRate => 'GST税率 %（任意）';

  @override
  String get itmBarcodeOptional => 'バーコード（任意）';

  @override
  String get itmScanOrType => 'スキャンまたは入力';

  @override
  String get itmScanBarcode => 'バーコードをスキャン';

  @override
  String get itmPurchaseCost => '仕入原価（単位あたり）';

  @override
  String get itmPurchaseCostHint => '在庫を仕入れるときの支払額';

  @override
  String get itmWholesale => '卸売価格（任意）';

  @override
  String get itmContractor => '業者価格（任意）';

  @override
  String get itmFallsBack => '未設定の場合は通常価格を使用';

  @override
  String get itmStockQty => '在庫数';

  @override
  String get itmLowStockAlert => '在庫少アラートのしきい値';

  @override
  String get itmFrequently => 'よく一緒に購入される商品';

  @override
  String get itmSaveChanges => '変更を保存';

  @override
  String get itmSaveItem => '商品を保存';

  @override
  String get itmPhotoSemantics => '商品写真、タップして変更';

  @override
  String get cdUpdateStatusTitle => '支払い状況を更新';

  @override
  String get cdMarkPaidQ => 'この請求書を支払い済みにしますか？';

  @override
  String get cdMarkUnpaidQ => 'この請求書を未払いにしますか？';

  @override
  String get cdConfirm => '確認';

  @override
  String cdCouldNotUpdate(String detail) {
    return '更新できませんでした: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'オフライン — 変更をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get cdConvertTitle => '請求書に変換';

  @override
  String get cdConvertBody => 'これらの商品の在庫が差し引かれ、見積書が正式な請求書になります。続行しますか？';

  @override
  String get cdConvert => '変換';

  @override
  String cdCouldNotConvert(String detail) {
    return '変換できませんでした: $detail';
  }

  @override
  String get cdReturnItems => '商品を返品';

  @override
  String get cdReturnHint => '各商品の返品数を設定してください。0のままなら販売済みのままです。';

  @override
  String get cdDecreaseQty => '数量を減らす';

  @override
  String get cdIncreaseQty => '数量を増やす';

  @override
  String get cdCreditTotal => '返金合計';

  @override
  String get cdReturnSelected => '選択した商品を返品';

  @override
  String cdCouldNotReturn(String detail) {
    return '返品できませんでした: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return '無効にできませんでした: $detail';
  }

  @override
  String get cdNoPreviousBill => '繰り返せる前回の請求書がありません';

  @override
  String cdCouldNotLoadLast(String detail) {
    return '前回の請求書を読み込めませんでした: $detail';
  }

  @override
  String get cdInvoiceEmailed => '請求書を顧客にメールしました。';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return '請求書をメールできませんでした: $detail';
  }

  @override
  String get cdStatementEmailed => '取引明細を顧客にメールしました。';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return '取引明細をメールできませんでした: $detail';
  }

  @override
  String get cdDeleteBillTitle => '請求書を削除';

  @override
  String get cdBillVoided => '無効';

  @override
  String get cdBillReturn => '返品';

  @override
  String get cdBillQuote => '見積';

  @override
  String get cdBillPaid => '支払済';

  @override
  String get cdBillPartial => '一部支払';

  @override
  String get cdBillUnpaid => '未払い';

  @override
  String get cdBill => '請求書';

  @override
  String cdVoidedReason(String reason) {
    return '無効: $reason';
  }

  @override
  String get cdViewInvoice => '請求書を表示';

  @override
  String get cdEmailInvoice => '請求書をメール';

  @override
  String get cdEditBill => '請求書を編集';

  @override
  String get cdReturnBill => '請求書を返品';

  @override
  String get cdVoidBill => '請求書を無効にする';

  @override
  String get cdNoItems => '商品なし';

  @override
  String get cdRepeatLast => '前回の請求書を繰り返す';

  @override
  String get cdLedgerPdf => '元帳PDF';

  @override
  String get cdEmailStatement => '取引明細をメール';

  @override
  String get cdCollectPayment => '入金を受け取る';

  @override
  String get cdSendReminder => 'WhatsAppで催促を送る';

  @override
  String get cdTotalBilled => '請求合計';

  @override
  String get cdPaid => '支払済';

  @override
  String get cdNoBills => '請求書はまだありません';

  @override
  String get cdBillActions => '請求書の操作';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '与信限度額 $limit のうち $outstanding を使用中';
  }

  @override
  String get cdVoidBody => '残高とレポートから除外されますが、履歴には残ります。在庫は元に戻ります。この操作は元に戻せません。';

  @override
  String get cdReason => '理由（任意）';

  @override
  String get frmOfflineCustomer => 'オフライン — 顧客をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get frmOfflineSupplier => 'オフライン — 仕入先をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get frmEditCustomer => '顧客を編集';

  @override
  String get frmCustomerName => '顧客名';

  @override
  String get frmPhoneOptional => '電話番号（任意）';

  @override
  String get frmCreditLimit => '与信限度額 (PKR、任意)';

  @override
  String get frmCreditHelper => 'この顧客の残高がこの額を超えたら警告します';

  @override
  String get frmPriceTier => '価格区分';

  @override
  String get frmRetail => '小売';

  @override
  String get frmWholesale => '卸売';

  @override
  String get frmContractor => '業者';

  @override
  String get frmPriceTierHelper => 'この顧客の請求書作成時に自動入力される商品価格';

  @override
  String get frmStrn => 'STRN（任意）';

  @override
  String get frmStrnCustomer => '請求書用の13桁の売上税登録番号';

  @override
  String get frmStrnSupplier => '仕入請求書用の13桁の売上税登録番号';

  @override
  String get frmAddress => '住所（任意）';

  @override
  String get frmEmail => 'メールアドレス（任意）';

  @override
  String get frmEmailHelper => 'この顧客に請求書や取引明細をメールで送れるようになります';

  @override
  String get frmSaveCustomer => '顧客を保存';

  @override
  String get frmEditSupplier => '仕入先を編集';

  @override
  String get frmSupplierName => '仕入先名';

  @override
  String get frmSaveSupplier => '仕入先を保存';

  @override
  String get sdDeletePurchaseTitle => '仕入を削除';

  @override
  String get sdDeletePurchaseBody => 'この仕入の在庫が元に戻ります。この操作は元に戻せません。';

  @override
  String get sdReturnToSupplier => '仕入先へ返品';

  @override
  String get sdReturnHint => '各商品の返送数を設定してください。0のままなら手元に残します。';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return '受領済みにできませんでした: $detail';
  }

  @override
  String get sdMarkPaidQ => 'この仕入を支払い済みにしますか？';

  @override
  String get sdMarkUnpaidQ => 'この仕入を未払いにしますか？';

  @override
  String get sdTotalPurchased => '仕入合計';

  @override
  String get sdPayable => '買掛金';

  @override
  String sdPayableAmount(String amount) {
    return '買掛金 $amount';
  }

  @override
  String get sdNoPurchases => '仕入はまだありません';

  @override
  String get sdPo => '発注';

  @override
  String get sdDraftPo => '発注書（下書き）';

  @override
  String get sdPurchase => '仕入';

  @override
  String get sdDraftNote => '発注書の下書き — まだ受領されておらず、在庫や原価はまだ更新されません。';

  @override
  String get sdReturnNote => '仕入先への返品／クレジットノート。';

  @override
  String get sdMarkReceived => '受領済みにする';

  @override
  String get sdEditPurchase => '仕入を編集';

  @override
  String get sdPurchaseActions => '仕入の操作';

  @override
  String get slDeleteSupplier => '仕入先を削除';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の仕入先を削除',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の仕入先とそのすべての仕入を削除しますか？この操作は元に戻せません。',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSVにはヘッダー行と、少なくとも1件の仕入先が必要です。';

  @override
  String get slImportTitle => '仕入先をインポート';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" に仕入先が$count件見つかりました。すべてインポートしますか？',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '仕入先を$count件インポートしました。',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => '仕入先はまだありません。+ をタップして追加しましょう。';

  @override
  String get slSearchHint => '仕入先または電話番号を検索...';

  @override
  String get slNoMatch => '検索に一致する仕入先はありません。';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '仕入先 $count件',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => '仕入先への未払い';

  @override
  String get sduNothingOwed => '仕入先への未払いはありません 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '未払いの仕入先 $count件',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '最も古い未払い仕入から$days日',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0〜30日';

  @override
  String get duBucket1 => '30〜60日';

  @override
  String get duBucket2 => '60日以上';

  @override
  String get duTitle => '未収金センター';

  @override
  String get duNoDues => '未収金はありません 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '未収金のある顧客 $count件',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '最も古い未払い請求書から$days日',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '未収 $amount';
  }

  @override
  String get cpNoOutstanding => 'この顧客に未収残高はありません';

  @override
  String get cpValidAmount => '正しい金額を入力してください';

  @override
  String cpExceeds(String amount) {
    return '金額が未収残高 $amount を超えています';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$nameから$amountを回収しました';
  }

  @override
  String get cpOfflineSaved => 'オフライン — 入金をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String cpOwes(String amount, String name) {
    return '$nameの未払いは$amountです。最も古い未払い請求書から順に充当されます。';
  }

  @override
  String get cpAmountLabel => '回収額 (PKR)';

  @override
  String get cpCollect => '回収';

  @override
  String get usNoItems => '更新する商品がありません。';

  @override
  String get usHelp => '各商品の新しい在庫数を設定し、「すべて保存」をタップしてください。';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  現在: $qty';
  }

  @override
  String usNew(String qty) {
    return '新: $qty';
  }

  @override
  String get usSubtract => '1減らす';

  @override
  String get usAdd => '1増やす';

  @override
  String get usNoChanges => '変更なし';

  @override
  String usSaveAll(int count) {
    return 'すべて保存（$count件変更）';
  }

  @override
  String get srHint => '顧客、商品、金額を検索...';

  @override
  String get srFailed => '検索に失敗しました。接続を確認してください。';

  @override
  String get srTitle => 'お店の中を検索';

  @override
  String get srSubtitle => '顧客は名前か電話番号で、請求書は金額で探せます。';

  @override
  String srNoMatches(String query) {
    return '「$query」に一致するものはありません';
  }

  @override
  String get srTryDifferent => '別の名前、電話番号、または金額をお試しください。';

  @override
  String get srBills => '請求書';

  @override
  String get srNoItemList => '商品リストなし';

  @override
  String get abAddAtLeastOne => '商品を1つ以上追加してください';

  @override
  String get abQuotationUpdated => '見積書を更新しました！';

  @override
  String get abBillUpdated => '請求書を更新しました！';

  @override
  String get abQuotationSaved => '見積書を保存しました！';

  @override
  String get abBillCreated => '請求書を作成しました！';

  @override
  String abTotalAmount(String amount) {
    return '合計: $amount';
  }

  @override
  String get abShare => '共有';

  @override
  String get abDoneReturn => '完了して戻る';

  @override
  String get abOverLimitBody => 'この請求で顧客が与信限度額を超えます。';

  @override
  String get abOverLimitTitle => '与信限度額超過';

  @override
  String get abBillAnyway => 'それでも請求する';

  @override
  String get abOfflineBill => 'オフライン — 請求書をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get abEditQuotation => '見積書を編集';

  @override
  String get abEditBill => '請求書を編集';

  @override
  String get abNewQuotation => '新しい見積書';

  @override
  String get abAddBill => '請求書を追加';

  @override
  String get abCouldNotLoadItems => '商品を読み込めませんでした。';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'この請求書により顧客の残高は $total となり、与信限度額 $limit を超えます。';
  }

  @override
  String get abTapAddItemBill => '下の「商品を追加」をタップして請求書を始めましょう';

  @override
  String get abNoCatalog => 'カタログに商品がまだありません';

  @override
  String get abScan => 'スキャン';

  @override
  String get abDiscountRs => '値引き (ルピー)';

  @override
  String get abSubtotal => '小計';

  @override
  String get abTotal => '合計';

  @override
  String get abSaveAsQuotation => '見積書として保存';

  @override
  String get abQuotationLocked => '既存の請求書は見積書に戻せません';

  @override
  String get abQuotationNote => '請求書に変換するまで在庫は引かれません';

  @override
  String get abPaymentStatus => '支払い状況';

  @override
  String get abUnpaid => '未払い';

  @override
  String get abPaymentMethod => '支払い方法';

  @override
  String get abCash => '現金';

  @override
  String get abBankTransfer => '銀行振込';

  @override
  String get abCheque => '小切手';

  @override
  String get abSaveQuotation => '見積書を保存';

  @override
  String get abSaveBill => '請求書を保存';

  @override
  String abAdded(String name) {
    return '$nameを追加しました';
  }

  @override
  String get apNewItem => '新しい商品…';

  @override
  String get apNewItemHint => '先にカタログへ新しい商品を追加してください';

  @override
  String get apOfflinePurchase => 'オフライン — 仕入をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get apEditPo => '発注書を編集';

  @override
  String get apNewPo => '新しい発注書';

  @override
  String get apAddPurchase => '仕入を追加';

  @override
  String get apTapAddItem => '下の「商品を追加」をタップして仕入を始めましょう';

  @override
  String get apSaveAsPo => '発注書として保存';

  @override
  String get apPoLocked => '受領済みの仕入は下書き発注に戻せません';

  @override
  String get apPoNote => '商品を受領済みにするまで、在庫や原価は更新されません';

  @override
  String get apUnpaidCredit => '未払い（掛け）';

  @override
  String get apSavePo => '発注書を保存';

  @override
  String get apSavePurchase => '仕入を保存';

  @override
  String apCurrentCost(String amount, String unit) {
    return '現在の原価: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return '原価未設定  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'スキャンに失敗しました: サーバーエラー $code';
  }

  @override
  String get scOfflineSaved => 'オフライン — 写真を保存しました。オンラインに戻ると自動的に読み取ります';

  @override
  String get scStillOffline => 'まだオフラインです';

  @override
  String get scCouldNotCreateCustomer => '顧客を作成できませんでした。もう一度お試しください。';

  @override
  String get scCouldNotCreateSupplier => '仕入先を作成できませんでした。もう一度お試しください。';

  @override
  String scBillSavedFor(String name) {
    return '$nameの請求書を保存しました';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$nameからの仕入を保存しました';
  }

  @override
  String get scWhichCustomer => 'どの顧客ですか？';

  @override
  String get scWhichSupplier => 'どの仕入先ですか？';

  @override
  String scClosestMatch(String name, int score) {
    return '登録内で最も近い一致: $name（類似度 $score%）';
  }

  @override
  String scYesThisIs(String name) {
    return 'はい、$nameです';
  }

  @override
  String get scOtherwiseCustomer => 'そうでなければ、新しい顧客を作成してください:';

  @override
  String get scOtherwiseSupplier => 'そうでなければ、新しい仕入先を作成してください:';

  @override
  String get scNoMatchCustomer => '一致する顧客が見つかりません。新規作成してください:';

  @override
  String get scNoMatchSupplier => '一致する仕入先が見つかりません。新規作成してください:';

  @override
  String get scCustomerName => '顧客名';

  @override
  String get scSupplierName => '仕入先名';

  @override
  String get scCreateNew => '新規作成';

  @override
  String get scTitleBill => '請求書をスキャン';

  @override
  String get scIntroBill => '請求書の写真を撮ってください。手書きでも大丈夫で、シンド語・ウルドゥー語・英語のどれでも読み取れます。保存する前に内容を確認できます。';

  @override
  String get scIntroPurchase => '仕入先の請求書の写真を撮ってください。シンド語・ウルドゥー語・英語のどれでも読み取れます。保存する前に内容を確認できます。';

  @override
  String get scReadingBill => '請求書を読み取り中…';

  @override
  String get scScanBill => '請求書をスキャン';

  @override
  String get scReadingInvoice => '請求書を読み取り中…';

  @override
  String get scScanInvoice => '請求書をスキャン';

  @override
  String get scQueued => '待機中のスキャン';

  @override
  String get scReady => '確認待ち';

  @override
  String get scFailed => '失敗';

  @override
  String get scWaiting => '接続待ち';

  @override
  String get scRetry => '再試行';

  @override
  String rpCouldNotLoad(String error) {
    return 'レポートを読み込めませんでした: $error';
  }

  @override
  String get rpHeadline => '今月の主要な数字';

  @override
  String get rpProfitThisMonth => '今月の利益';

  @override
  String get rpNoData => 'データはまだありません';

  @override
  String get rpSalesTax => '売上税';

  @override
  String rpSalesTaxFor(String month) {
    return '$monthの売上税レポート';
  }

  @override
  String get rpViewSalesTax => '売上税レポートを表示';

  @override
  String get rpQuickReports => 'クイックレポート';

  @override
  String get rpQuickSub => '特定のレポートに直接移動';

  @override
  String get expensesTitle => '経費';

  @override
  String get rpRateCard => '料金表';

  @override
  String get rpDetails => '詳細';

  @override
  String get rpDetailsSub => '詳しい内訳とランキング';

  @override
  String get rpOutstandingByCustomer => '顧客別の未収金';

  @override
  String get rpNoOutstanding => '未収残高はありません';

  @override
  String get rpMonthlyTotals => '月別合計';

  @override
  String get rpMostSold => '売れ筋商品';

  @override
  String get rpNoItemsRecorded => '商品はまだ記録されていません';

  @override
  String get rpTopCustomers => '売上上位の顧客';

  @override
  String get rpNoSalesRecorded => '売上はまだ記録されていません';

  @override
  String get rpTotalOutstanding => '未収合計';

  @override
  String get rpViewCustomers => '顧客を表示';

  @override
  String get lblInvoice => '請求書';

  @override
  String get lblLedger => '元帳';

  @override
  String get lblRateCard => '料金表';

  @override
  String get exCsvNeedsRows => 'CSVにはヘッダー行と、少なくとも1件の経費が必要です。';

  @override
  String get exCsvHeader => 'CSVのヘッダーには \"description\" と \"amount\" の列が必要です。';

  @override
  String exLineBadAmount(int line) {
    return '$line行目: 説明がないか金額が正しくありません。ファイルを修正して再試行してください。';
  }

  @override
  String exLineBadDate(String date, int line) {
    return '$line行目: 日付 \"$date\" が正しくありません。YYYY-MM-DD の形式で入力してください。';
  }

  @override
  String get exImportTitle => '経費をインポート';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\" に経費が$count件見つかりました。すべてインポートしますか？',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '経費を$count件インポートしました。',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'インポートに失敗しました: サーバーエラー $code';
  }

  @override
  String get exDeleteTitle => '経費を削除';

  @override
  String get exAdd => '経費を追加';

  @override
  String get exEdit => '経費を編集';

  @override
  String get exDescription => '説明';

  @override
  String get exAmountRs => '金額 (ルピー)';

  @override
  String get exCategory => 'カテゴリ';

  @override
  String exDate(String date) {
    return '日付: $date';
  }

  @override
  String get exRepeats => '毎月繰り返す';

  @override
  String get exRepeatsHint => '家賃、電気代、賃金など';

  @override
  String get exReceiptTap => '領収書の写真、タップして変更';

  @override
  String get exReceiptOptional => '領収書の写真（任意）';

  @override
  String get exEnterValid => '説明と正しい金額を入力してください。';

  @override
  String get exOffline => 'オフライン — 経費をこの端末に保存しました。オンラインに戻ると自動的に同期されます';

  @override
  String get exSave => '経費を保存';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '今月支払期限の定期経費が$count件あります',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => '追加';

  @override
  String get exTotal => '経費合計';

  @override
  String exCategoryChip(String name) {
    return 'カテゴリ: $name';
  }

  @override
  String get exNoneLogged => '経費はまだ記録されていません';

  @override
  String exNoneInCategory(String name) {
    return '$nameの経費はまだありません';
  }

  @override
  String get exViewReceipt => '領収書を表示';

  @override
  String get exEditRow => '経費を編集';

  @override
  String get exDeleteRow => '経費を削除';

  @override
  String gstServerReturned(String first, String second) {
    return 'サーバーの応答: $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GSTデータを読み込めませんでした: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'ダウンロードに失敗しました ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filenameを保存しました';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'ダウンロード/$filename に保存しました';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'ダウンロードできませんでした: $error';
  }

  @override
  String get gstTitle => '売上税レポート';

  @override
  String get gstOutwardDetail => '外向き売上 — 請求書の詳細';

  @override
  String get gstNoBills => '今月の請求書はありません。';

  @override
  String get gstHsn => 'HSNサマリー';

  @override
  String get gstInvoiceWise => '請求書別の詳細';

  @override
  String get gstMonthly => '月次サマリー';

  @override
  String get gstOutwardTaxable => '課税対象の外向き供給';

  @override
  String get gstItc => '仕入税額控除（仕入分）';

  @override
  String get gstSave => '保存';

  @override
  String get rcValidAmount => '正しい金額を入力してください。';

  @override
  String get rcExpected => '想定現金（本日の現金売上）';

  @override
  String get rcAlsoCollected => '本日ほかに回収した分（レジには含まず）';

  @override
  String get rcCounted => 'レジで数えた現金 (ルピー)';

  @override
  String get rcCompare => '比較';

  @override
  String get rcMatches => 'ぴったり一致しました！';

  @override
  String rcExtra(String amount) {
    return 'レジに$amountの過剰';
  }

  @override
  String rcMissing(String amount) {
    return 'レジから$amount不足';
  }

  @override
  String get pbiTitle => '商品別利益';

  @override
  String get pbiNoSales => '売上はまだありません';

  @override
  String get pbiByCategory => 'カテゴリ別';

  @override
  String get pbiItemsByProfit => '利益順の商品';

  @override
  String get svTitle => '在庫評価額';

  @override
  String get svNone => '在庫はありません';

  @override
  String get svItemsByValue => '金額順の商品';

  @override
  String svSummary(String items, String units) {
    return '$items商品 · 棚に$units個';
  }

  @override
  String svTied(String amount) {
    return '在庫に$amountが滞留';
  }

  @override
  String get svEstimated => '販売価格からの概算';

  @override
  String get bkRestoreTitle => 'バックアップを復元しますか？';

  @override
  String bkRestoreBody(String filename) {
    return '現在のすべてのデータがバックアップファイル \"$filename\" に置き換わります。続行しますか？';
  }

  @override
  String get bkRestore => '復元';

  @override
  String get bkRestoreDoneTitle => '復元が完了しました';

  @override
  String get bkRestoreDoneBody => 'データを復元しました。';

  @override
  String get bkOk => 'OK';

  @override
  String bkRestoreFailed(String detail) {
    return '復元に失敗しました: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return '復元できませんでした: $error';
  }

  @override
  String get bkSaveToDownloads => 'ダウンロードに保存';

  @override
  String get bkIntroAdmin => 'すべてのデータは1つのデータベースファイルに入っています。定期的にコピーをダウンロードし、問題が起きたら復元してください。';

  @override
  String get bkIntroStaff => 'データベース全体のバックアップと復元は管理者専用です。管理者に依頼するか、必要なものを下でCSVにエクスポートしてください。';

  @override
  String get bkBackupDb => 'データベースをバックアップ';

  @override
  String get bkBackupDbSub => 'データベース全体を1つのファイルとしてダウンロードし、共有できます（WhatsApp、ドライブ、メール）。';

  @override
  String get bkDownloadPhone => 'バックアップをスマートフォンにダウンロード';

  @override
  String get bkShareBackup => 'バックアップを共有';

  @override
  String get bkAutoTitle => '自動バックアップ';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'サーバーに毎日のバックアップが$count件保存されています。最新は$timeのものです。自動で実行されるため、ここでの操作は不要です。',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => '現在のデータを置き換える保存済みバックアップファイルを選んでください。';

  @override
  String get bkRestoreFromFile => 'バックアップファイルから復元';

  @override
  String get bkExportCsv => 'CSVにエクスポート';

  @override
  String get bkExportSub => 'Excelで開くか、共有できます。';

  @override
  String get bkRangeAll => '請求書/経費：全期間';

  @override
  String bkRangeSome(String end, String start) {
    return '請求書/経費：$start〜$end';
  }

  @override
  String get bkSetRange => '期間を設定';

  @override
  String get bkClearRange => '期間をクリア';

  @override
  String get ntNever => '一度も実行されていません';

  @override
  String get ntJustNow => 'たった今';

  @override
  String ntMinutesAgo(int count) {
    return '$count分前';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count時間前';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count日前';
  }

  @override
  String get ntTitle => 'スマート通知';

  @override
  String get ntTapHint => '「今すぐ確認」をタップすると、通知を実行してリアルタイムの結果を確認できます。';

  @override
  String get ntLowStockSub => '商品が発注点を下回ったときに通知します。';

  @override
  String get ntCheckNow => '今すぐ確認';

  @override
  String get ntOverdue => '支払い期限超過のリマインダー';

  @override
  String get ntOverdueSub => '前日までの未払い請求書について通知します。';

  @override
  String get ntDaily => '日次ビジネスサマリー';

  @override
  String get ntDailySub => '昨日の売上、回収、利益をひと目で確認できます。';

  @override
  String get ntSendSummary => 'サマリーを送信';

  @override
  String get ntRunning => '実行中…';

  @override
  String get ntLowStockItems => '在庫が少ない商品';

  @override
  String get ntSales => '売上';

  @override
  String get ntCollected => '回収';

  @override
  String get ntProfit => '利益';

  @override
  String get auChecking => 'アップデートを確認中…';

  @override
  String get auLatest => '最新バージョンです。';

  @override
  String get auAvailable => 'アップデートがあります';

  @override
  String auNewer(int code) {
    return 'Book-Keep の新しいバージョン（ビルド $code）が利用できます。';
  }

  @override
  String get auLater => '後で';

  @override
  String get auUpdate => '更新';

  @override
  String get auDownloading => 'アップデートをダウンロード中';

  @override
  String auSaved(String name) {
    return '$nameをダウンロードフォルダに保存しました。';
  }

  @override
  String get auAllowInstall => 'Book-Keep にアプリのインストールを許可してから、もう一度「更新」をタップしてください。';

  @override
  String get auFailed => '更新できませんでした。接続を確認してもう一度お試しください。';

  @override
  String get lgSearch => '言語を検索';

  @override
  String lgNoMatch(String query) {
    return '\"$query\" に一致する言語はありません';
  }

  @override
  String get alVoided => '請求書を無効にしました';

  @override
  String get alDeletedBill => '請求書を削除しました';

  @override
  String get alReturned => '請求書を返品しました';

  @override
  String get alDeletedCustomer => '顧客を削除しました';

  @override
  String get alDeletedSupplier => '仕入先を削除しました';

  @override
  String get alCreatedAccount => 'アカウントを作成しました';

  @override
  String get alUpdatedAccount => 'アカウントを更新しました';

  @override
  String get alDeletedAccount => 'アカウントを削除しました';

  @override
  String get alTitle => 'アクティビティログ';

  @override
  String get alNone => '記録されたアクティビティはまだありません';

  @override
  String get blkEnterOne => '商品を1つ以上入力してください';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の商品を追加しました',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => '商品を一括追加';

  @override
  String get blkFormat => '1行に1商品、形式: 名前, 価格, 単位, カテゴリ';

  @override
  String get blkOptional => '単位とカテゴリは任意です（既定: piece、なし）';

  @override
  String get blkAddAll => 'すべての商品を追加';

  @override
  String get prSend => '支払いリマインダーを送信';

  @override
  String get prTone => 'トーンを選択:';

  @override
  String get prPolite => '丁寧';

  @override
  String get prStandard => '標準';

  @override
  String get prUrgent => '緊急';

  @override
  String get prPreviewQr => 'JazzCash支払いQRをプレビュー';

  @override
  String get prShareText => 'テキストを共有';

  @override
  String get dsRemaining => '残額';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amountの値引きを含む';
  }

  @override
  String get dsItems => '商品';

  @override
  String get dsDiscount => '値引き';

  @override
  String get lkWrongPin => 'PINが違います';

  @override
  String get lkEnterPin => 'PINを入力';

  @override
  String get lkChecking => '指紋を確認中...';

  @override
  String get bcTitle => 'バーコードをスキャン';

  @override
  String get bcTorchNa => 'この端末ではライトを使用できません';

  @override
  String get bcTorch => 'ライト';

  @override
  String get bcPoint => 'カメラをバーコードに向けてください';

  @override
  String get qrNoNumber => 'JazzCash番号が設定されていません。支払いQRコードを表示するには設定で登録してください。';

  @override
  String get qrPay => 'JazzCashで支払う';

  @override
  String get qrInvalid => 'QRデータが無効です';

  @override
  String qrAmount(String amount) {
    return '金額: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'JazzCash番号をコピー';

  @override
  String get qrCopied => 'JazzCash番号をクリップボードにコピーしました';

  @override
  String get qrHint => 'この番号をJazzCashアプリでスキャンまたはコピーして支払ってください。';

  @override
  String clOwed(String amount) {
    return '未収 $amount';
  }

  @override
  String get lnEnterEmailFirst => '先に上の欄に正しいメールアドレスを入力してください。';

  @override
  String get lnResetSent => 'パスワード再設定メールを送信しました。受信トレイをご確認ください。';

  @override
  String get lnNoAccount => 'そのメールアドレスのアカウントが見つかりません。';

  @override
  String get lnWrongPassword => 'パスワードが正しくありません。';

  @override
  String get lnInvalidEmail => '有効なメールアドレスではないようです。';

  @override
  String get lnDisabled => 'このアカウントは無効化されています。';

  @override
  String get lnTooMany => '試行回数が多すぎます。1分後にもう一度お試しください。';

  @override
  String get lnNoInternet => 'インターネットに接続されていません。';

  @override
  String get lnWeakPassword => 'パスワードは6文字以上にしてください。';

  @override
  String get lnCouldNotSignIn => 'ログインできませんでした。もう一度お試しください。';

  @override
  String get lnWrongPasswordHint => 'パスワードが正しくありません。もう一度試すか、「パスワードをお忘れですか？」をタップしてください。';

  @override
  String get lnWrongEmail => 'メールアドレスが正しくありません。そのアドレスを使うアカウントはありません。';

  @override
  String get lnWrongEmailOrPassword => 'メールアドレスまたはパスワードが正しくありません。';

  @override
  String get lnWrongUsername => 'ユーザー名が正しくありません。その名前を使うアカウントはありません。';

  @override
  String get lnWelcome => 'おかえりなさい';

  @override
  String lnSignInTo(String app) {
    return '$appにログイン';
  }

  @override
  String get lnEmailOrUsername => 'メールアドレスまたはユーザー名';

  @override
  String get lnRemember => 'ログイン状態を保持';

  @override
  String get lnForgot => 'パスワードをお忘れですか？';

  @override
  String get lnSignIn => 'ログイン';

  @override
  String get lnGoogle => 'Googleで続行';

  @override
  String get lnNew => 'はじめてですか？';

  @override
  String get lnCreate => 'アカウントを作成';

  @override
  String suCreated(String email) {
    return '$emailのアカウントを作成しました。確認メールを送信しました（任意）。';
  }

  @override
  String suSetup(String app) {
    return '$appをセットアップ';
  }

  @override
  String get suName => '名前';

  @override
  String get suEmail => 'メールアドレス';

  @override
  String suPhoneDigits(int digits) {
    return '$digits桁の正しい番号を入力してください';
  }

  @override
  String get suCreateBtn => 'アカウントを作成';

  @override
  String get suHaveAccount => 'すでにアカウントをお持ちですか？';

  @override
  String get suAlreadyExists => 'そのメールアドレスのアカウントはすでに存在します。';

  @override
  String get suInvalidEmail => 'メールアドレスが正しくありません。';

  @override
  String get agShow => 'パスワードを表示';

  @override
  String get agHide => 'パスワードを隠す';

  @override
  String get adAccounts => 'アカウント';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '登録済みアカウント $count件',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => '追加';

  @override
  String get adNoAccounts => 'アカウントが見つかりません。';

  @override
  String get adAccountability => '操作の記録';

  @override
  String get adAccountabilitySub => '誰が何を無効化・削除・返品したか、そしてアカウントの変更。';

  @override
  String get adActivitySub => '無効化した請求書、削除、アカウントの変更';

  @override
  String get adServer => 'サーバー';

  @override
  String get adServerSub => 'このアプリの接続先です。初期設定後に変更する必要はほとんどありません。';

  @override
  String get adServerHint => 'エミュレーターは 10.0.2.2 を使います。実機では同じWi-Fi上のパソコンのIPが必要です。変更はすべてのアカウントに影響します。';

  @override
  String get adApiBase => 'APIベースURL';

  @override
  String get adSaveServer => 'サーバーアドレスを保存';

  @override
  String get adEmailSetSub => '設定済み — スタッフが顧客に請求書/取引明細をメールできます。';

  @override
  String get adNotSetUp => 'まだ設定されていません。';

  @override
  String get adEmailSetBody => 'メールが設定されています。スタッフが請求書や取引明細を直接顧客にメールできます。';

  @override
  String get adEmailHelp => 'Gmailアドレスはアプリパスワードで使えます（smtp.gmail.com、ポート587）。または、お使いのメールプロバイダーのSMTP情報を使ってください。';

  @override
  String get adSmtpHost => 'SMTPホスト';

  @override
  String get adSmtpPort => 'SMTPポート';

  @override
  String get adEmailAddress => 'メールアドレス';

  @override
  String get adPwKeep => 'パスワード（現在のものを保持するには空欄）';

  @override
  String get adPwApp => 'パスワード（アプリパスワード。ログイン用パスワードではありません）';

  @override
  String get adFromName => '差出人名（任意）';

  @override
  String get adFromHint => '私の金物店';

  @override
  String get adSaving => '保存中...';

  @override
  String get adSaveEmail => 'メール設定を保存';

  @override
  String get adAddAccount => 'アカウントを追加';

  @override
  String get adNameOpt => '名前（任意）';

  @override
  String get adAtLeast6 => '6文字以上';

  @override
  String get adGrantAdmin => '管理者にする';

  @override
  String get adCanManage => '無効化/削除/返品ができる';

  @override
  String get adCanManageHint => '請求書の無効化・削除、請求書の返品、顧客/仕入先の削除。管理者は常にこの権限を持ちます。';

  @override
  String get adCreate => '作成';

  @override
  String get adAccountCreated => 'アカウントを作成しました。';

  @override
  String adCreateFailed(String error) {
    return '作成に失敗しました: $error';
  }

  @override
  String get adEditAccount => 'アカウントを編集';

  @override
  String get adAdminSwitch => '管理者';

  @override
  String get adAdminHint => '管理パネルを開けます';

  @override
  String get adDisabled => '無効';

  @override
  String get adDisabledHint => 'ログインをブロック';

  @override
  String get adAccountUpdated => 'アカウントを更新しました。';

  @override
  String adUpdateFailed(String error) {
    return '更新に失敗しました: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$labelは完全に削除され、ログインできなくなります。';
  }

  @override
  String get adAccountDeleted => 'アカウントを削除しました。';

  @override
  String adDeleteFailed(String error) {
    return '削除に失敗しました: $error';
  }

  @override
  String get adBadgeAdmin => '管理者';

  @override
  String get adBadgeDisabled => '無効';

  @override
  String get adOff => '管理パネルはオフです';

  @override
  String get adCheckAgain => '再確認';

  @override
  String get adAccessRequired => '管理者権限が必要です';

  @override
  String get adAccessBody => 'アカウントを管理できるのは店舗の管理者だけです。店舗のオーナーに管理者権限を依頼してください。';

  @override
  String get adCouldNotLoad => '管理パネルを読み込めませんでした。';

  @override
  String get adBadPort => '正しいSMTPポート番号を入力してください。';

  @override
  String get adEmailSaved => 'メール設定を保存しました。';

  @override
  String adEmailSaveFailed(String error) {
    return 'メール設定を保存できませんでした: $error';
  }

  @override
  String get adServerEmpty => 'サーバーアドレスは空にできません。';

  @override
  String get adServerSaved => 'サーバーアドレスを保存しました。次回の読み込みから各画面で使われます。';

  @override
  String get lnOr => 'または';

  @override
  String get scNotABill => '請求書には見えません。請求書をはっきり写した写真でもう一度お試しください。';

  @override
  String get scNotAnInvoice => '請求書には見えません。仕入先の請求書をはっきり写した写真でもう一度お試しください。';

  @override
  String get jqOpenFull => '全画面';

  @override
  String get jqCopy => '番号をコピー';

  @override
  String get jqSheetTitle => 'JazzCash QR';

  @override
  String get jqSheetHint => 'お客様はこれをJazzCashアプリでスキャンして支払います。';

  @override
  String get jqCheck => '番号を確認してください';

  @override
  String get askVoice => '音声';

  @override
  String get askVoiceFallbackNote => 'スマートフォンの音声で読み上げています。';

  @override
  String get askPace => '速さ';

  @override
  String get askTone => 'トーン';

  @override
  String get askPaceSlower => 'ゆっくり';

  @override
  String get askPaceNormal => 'ふつう';

  @override
  String get askPaceFaster => '速め';

  @override
  String get askToneCalm => '落ち着いた';

  @override
  String get askToneWarm => 'あたたかい';

  @override
  String get askToneCheerful => '明るい';

  @override
  String qPaymentUpdate(String amount) {
    return '支払い更新：$amount';
  }

  @override
  String qCustomer(String name) {
    return '顧客：$name';
  }

  @override
  String qSupplier(String name) {
    return '仕入先：$name';
  }

  @override
  String qItem(String name) {
    return '商品：$name';
  }

  @override
  String qExpense(String name) {
    return '経費：$name';
  }

  @override
  String qPurchase(String amount) {
    return '仕入：$amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$nameからの入金：$amount';
  }

  @override
  String gstAmount(String amount) {
    return '税 $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return '課税額 $taxable  ·  税 $tax  ·  合計 $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return '売上：$revenue  •  売上原価：$cogs  •  経費：$expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return '$customer様、$shopよりご挨拶申し上げます。お支払い残高は$amountです。よろしくお願いいたします。';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return '$customer様、$shopより未払い残高$amountのお支払いのお願いです。お早めにお支払いください。';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return '【至急】$customer様、$shopへの未払い金$amountが残っております。至急お支払いください。';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCashでお支払い：$number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shopからの請求書\n合計：$total\n商品：$items\n状態：$status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return '$supplier様、$shopです。以下の商品を注文したいです：\n$lines\n\n在庫と価格をご確認ください。よろしくお願いいたします。';
  }

  @override
  String ppUpdated(String date) {
    return '最終更新日：$date';
  }

  @override
  String get ppWhoH => '運営者について';

  @override
  String ppWho(String owner, String email) {
    return '$owner（Book-keep の運営者）。\nお問い合わせ：$email';
  }

  @override
  String get ppCollectH => '収集する情報';

  @override
  String get ppCollectAccount => 'アカウント：メールアドレス、電話番号、ユーザー名（Firebase Authentication 経由）。';

  @override
  String get ppCollectShop => '店舗プロフィール：店名、住所、電話番号、JazzCash 番号、店舗ロゴ画像。店舗オーナーが設定で入力します。';

  @override
  String get ppCollectRecords => 'お客様が作成する業務記録：顧客・仕入先の名前と電話番号、請求書、仕入、商品カタログ（商品写真とバーコードを含む）、経費（領収書の写真を含む）。これはアプリの中核データであり、帳簿管理に必要なものです。';

  @override
  String get ppCollectDevice => '端末・診断データ：プッシュ通知トークン（在庫不足、支払い遅延、日次サマリーの通知用）と、Firebase Crashlytics によるクラッシュレポート（端末情報とスタックトレース）。アプリがクラッシュしたときに自動送信されます。';

  @override
  String ppCollectAi(String askShop) {
    return 'AI 機能：$askShop、AI 朝のブリーフィング、AI 請求書/仕入スキャナーは、回答・要約・抽出した明細を生成するため、関連する業務データのスナップショット（レポートの数値や請求書の写真）を Google の Gemini API に送信します。このデータは回答の生成のために Google が処理します。当社も Google も、Google の標準 API 規約の範囲外でモデルの学習には使用しません。';
  }

  @override
  String get ppDontH => '行わないこと';

  @override
  String get ppDontLocation => '位置情報を追跡しません。';

  @override
  String get ppDontAds => '広告ネットワークや、行動分析・セッション記録ツールは使用しません。';

  @override
  String get ppDontSell => 'お客様のデータや顧客のデータを第三者に販売しません。';

  @override
  String get ppWhereH => 'データの保存場所';

  @override
  String get ppWhereDb => 'データベース：Neon（Postgres）。第三者のクラウドデータベースプロバイダーです。';

  @override
  String get ppWhereFirebase => '認証、プッシュ通知、クラッシュレポート、写真の保存：Firebase（Google）。';

  @override
  String get ppWhereAi => 'AI 処理：Google Gemini API。';

  @override
  String ppWhereEmail(String adminPanel) {
    return '請求書メール：店舗の管理者が$adminPanelで設定した SMTP アカウント経由で送信されます。メーリングリストは運営しておらず、これらのメールはお客様自身の既存顧客への個別の請求書・明細であり、一斉マーケティングではありません。';
  }

  @override
  String get ppYoursH => 'お客様のデータ、顧客のデータ';

  @override
  String get ppYours => '入力したすべての情報（顧客、仕入先、請求書、商品）は店舗に帰属します。Book-keep を使う他の店舗は閲覧できません。作成したスタッフアカウントは、付与した権限の範囲だけを閲覧できます。';

  @override
  String get ppControlsH => 'お客様のコントロール';

  @override
  String ppControlExport(String path) {
    return 'データのエクスポート・バックアップ：$path';
  }

  @override
  String ppControlDelete(String path) {
    return 'アカウントの削除：$path。削除されるのはサインイン情報のみで、店舗の業務記録（請求書、顧客、商品など）は消去されません。スタッフを削除しても、そのスタッフが作成した記録が消えないのと同じです。';
  }

  @override
  String ppControlNotif(String path) {
    return '通知：種類ごとに$pathでオフにできます。';
  }

  @override
  String get ppChildrenH => 'お子様について';

  @override
  String get ppChildren => 'Book-keep は店舗オーナーとスタッフ向けの業務ツールです。子供を対象としておらず、子供が意図的に使用することも想定していません。';

  @override
  String get ppChangesH => '本ポリシーの変更';

  @override
  String get ppChanges => '収集する情報やその送信先が変わる場合は、このページを更新し、上部の日付を変更します。';

  @override
  String get ppContactH => 'お問い合わせ';

  @override
  String ppContact(String email) {
    return '本ポリシーやお客様のデータに関するご質問：$email';
  }

  @override
  String get waHello => 'こんにちは！';

  @override
  String waHelloNamed(String name) {
    return '$nameさん、こんにちは。';
  }

  @override
  String get gstTaxable => '課税対象';

  @override
  String get gstTax => '税額';

  @override
  String get gstTaxableValue => '課税対象額';

  @override
  String get gstTotalTax => '税額合計';

  @override
  String get gstTotalItc => '仕入税額控除合計';

  @override
  String get gstExempt => '免税売上';

  @override
  String get gstNetPayable => '納付税額（純額）';

  @override
  String get unknownName => '不明';

  @override
  String get unitPiece => '個';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'メートル';

  @override
  String get unitBox => '箱';

  @override
  String get unitDozen => 'ダース';

  @override
  String get unitLiter => 'リットル';

  @override
  String get unitBag => '袋';

  @override
  String deleteSupplierMessage(String name) {
    return '$nameとそのすべての仕入を削除しますか？この操作は元に戻せません。';
  }
}
