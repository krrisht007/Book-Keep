// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get navHome => '홈';

  @override
  String get navCustomers => '고객';

  @override
  String get navItems => '상품';

  @override
  String get navSuppliers => '공급업체';

  @override
  String get navReports => '보고서';

  @override
  String get navSettings => '설정';

  @override
  String get settingsShopDetailsTitle => '매장 정보';

  @override
  String get settingsShopDetailsSubtitle => '청구서에 표시됩니다.';

  @override
  String get settingsShopNameLabel => '매장 이름';

  @override
  String get settingsShopAddressLabel => '매장 주소';

  @override
  String get settingsPhoneLabel => '전화번호';

  @override
  String get settingsSaveShopDetails => '매장 정보 저장';

  @override
  String get settingsAppearanceTitle => '화면 모드';

  @override
  String get settingsAppearanceSubtitle => '앱 전체에 적용할 테마를 선택하세요.';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get themeSystem => '시스템';

  @override
  String get settingsLanguageTitle => '언어';

  @override
  String get settingsLanguageSubtitle => '앱의 표시 언어를 선택하세요.';

  @override
  String get sortNameNewest => '정렬: 이름 / 최신순';

  @override
  String get addCustomer => '고객 추가';

  @override
  String get importCsv => 'CSV 가져오기';

  @override
  String get searchShop => '가게 검색';

  @override
  String get scanToFindItem => '스캔해서 상품 찾기';

  @override
  String get bulkAdd => '일괄 추가';

  @override
  String get updateStock => '재고 업데이트';

  @override
  String get printLabels => '라벨 인쇄';

  @override
  String get mergeDuplicates => '중복 병합';

  @override
  String get addSupplier => '공급업체 추가';

  @override
  String get scanPurchaseInvoice => '매입 송장 스캔';

  @override
  String askNoAnswer(String reason) {
    return '답변을 받지 못했습니다: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return '연결할 수 없습니다: $error';
  }

  @override
  String get micPermissionNeeded => '음성 입력을 하려면 마이크 권한이 필요합니다.';

  @override
  String get speechUnavailable => '이 기기에서는 음성 인식을 사용할 수 없습니다.';

  @override
  String get askYourShop => '가게에 물어보기';

  @override
  String get close => '닫기';

  @override
  String get askIntro => '가게가 어떻게 돌아가는지 궁금하세요? 물어보세요. 장부에 있는 내용으로 답해 드릴게요.';

  @override
  String get askListening => '듣는 중…';

  @override
  String get askThinkingWords => '생각 중…|작업 중…|계산 중…|장부 확인 중…|합산 중…|수치 분석 중…';

  @override
  String get askSayQuestion => '질문을 말하세요 — 취소하려면 구를 탭하세요';

  @override
  String briefingRefreshFailed(int code) {
    return '요약을 새로 고칠 수 없습니다 ($code).';
  }

  @override
  String get refreshFailedOffline => '새로 고칠 수 없습니다 — 연결을 확인하세요.';

  @override
  String get newBillFailed => '새 영수증을 시작할 수 없습니다 — 연결을 확인하고 다시 시도하세요.';

  @override
  String setPreferredSupplierFirst(String name) {
    return '먼저 $name의 기본 공급업체를 지정하세요 (탭하여 편집).';
  }

  @override
  String get reorderBySupplier => '공급업체별 재주문';

  @override
  String get supplier => '공급업체';

  @override
  String itemCount(int count) {
    return '상품 $count개';
  }

  @override
  String get noLowStockWithSupplier => '재고가 부족한 상품 중 기본 공급업체가 지정된 상품이 아직 없습니다.';

  @override
  String get thisSupplier => '이 공급업체';

  @override
  String supplierNoPhone(String name) {
    return '$name의 전화번호가 없습니다.';
  }

  @override
  String get tabOverview => '개요';

  @override
  String get tabStock => '재고';

  @override
  String get tabMoney => '돈';

  @override
  String get taglineOverview => '오늘의 미수금, 재고, 현금을 한눈에.';

  @override
  String get taglineStock => '잘 팔리는 것, 떨어져 가는 것.';

  @override
  String get taglineMoney => '지출, 정산, 수금.';

  @override
  String loadingDashboard(int done, int total) {
    return '대시보드 로드 중… $total개 중 $done개';
  }

  @override
  String get dashboardLoadFailed => '대시보드를 불러올 수 없습니다';

  @override
  String get checkConnectionRetry => '연결을 확인하고 다시 시도하세요.';

  @override
  String get retry => '다시 시도';

  @override
  String get aiBriefing => 'AI 요약';

  @override
  String get briefingPrompt => '어제의 장사를 몇 문장으로 확인하세요.';

  @override
  String get getBriefing => '요약 받기';

  @override
  String get refreshBriefing => '요약 새로 고침';

  @override
  String updatedAt(String time) {
    return '$time 업데이트';
  }

  @override
  String get customersUnknown => '— 고객';

  @override
  String customerCount(int count) {
    return '고객 $count명';
  }

  @override
  String get previousMonth => '이전 달';

  @override
  String get nextMonth => '다음 달';

  @override
  String get salesMonth => '매출 (월)';

  @override
  String get outstanding => '미수금';

  @override
  String get profitMonth => '이익 (월)';

  @override
  String get cashToday => '오늘 현금';

  @override
  String get newBill => '새 영수증';

  @override
  String get scanHandwrittenBill => '손글씨 영수증 스캔';

  @override
  String get topOutstanding => '미수금 상위';

  @override
  String viewAllInDues(int count) {
    return '미수금 센터에서 $count건 모두 보기';
  }

  @override
  String get lowStockAlerts => '재고 부족 알림';

  @override
  String get noLowStock => '재고가 부족한 상품이 없습니다 — 양호합니다.';

  @override
  String get whatsappAll => '모두에게 WhatsApp';

  @override
  String get reorderAll => '모두 재주문';

  @override
  String suggestReorder(String qty, String unit) {
    return '$qty $unit 재주문 권장';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '$qty $unit 남음';
  }

  @override
  String get reorder => '재주문';

  @override
  String get whatsappSupplier => '공급업체에 WhatsApp';

  @override
  String get topItemsByRevenue => '매출 상위 상품';

  @override
  String get noSalesYet => '아직 판매 기록이 없습니다.';

  @override
  String qtyLabel(String qty) {
    return '수량: $qty';
  }

  @override
  String get monthExpenses => '이번 달 지출';

  @override
  String get noExpensesMonth => '이번 달 지출 기록이 없습니다.';

  @override
  String get quickActions => '빠른 작업';

  @override
  String get dailyCashReconciliation => '일일 현금 정산';

  @override
  String get collectMoney => '수금하기';

  @override
  String changesSavedOffline(int count) {
    return '변경 사항 $count건이 오프라인으로 저장됨';
  }

  @override
  String get willSyncOnline => '온라인이 되면 자동으로 동기화됩니다';

  @override
  String get syncing => '동기화 중';

  @override
  String get sync => '동기화';

  @override
  String get shopProfile => '가게 프로필';

  @override
  String get insights => '인사이트';

  @override
  String get notifications => '알림';

  @override
  String get backupExport => '백업 및 내보내기';

  @override
  String get adminPanel => '관리자 패널';

  @override
  String get toolsSync => '도구 및 동기화';

  @override
  String get account => '계정';

  @override
  String get shopDetailsSaved => '가게 정보가 저장되었습니다.';

  @override
  String saveFailed(int code) {
    return '저장 실패 ($code)';
  }

  @override
  String couldNotSave(String error) {
    return '저장할 수 없습니다: $error';
  }

  @override
  String get logoUpdated => '로고가 업데이트되었습니다.';

  @override
  String logoUploadFailed(int code) {
    return '로고 업로드 실패 ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return '로고를 업로드할 수 없습니다: $error';
  }

  @override
  String get healthGood => '전반적으로 양호합니다.';

  @override
  String get healthSome => '몇 가지 확인이 필요합니다.';

  @override
  String get healthMany => '여러 가지 확인이 필요합니다.';

  @override
  String get shopHealth => '가게 상태';

  @override
  String get healthIntro => '가벼운 알림일 뿐, 또 다른 보고서가 아닙니다.';

  @override
  String get couldNotLoadCheckConnection => '불러올 수 없습니다 — 연결을 확인하세요.';

  @override
  String get itemPhotos => '상품 사진';

  @override
  String get barcodes => '바코드';

  @override
  String get lowStockItems => '재고 부족 상품';

  @override
  String get lastBackup => '마지막 백업';

  @override
  String get today => '오늘';

  @override
  String get yesterday => '어제';

  @override
  String daysAgo(int days) {
    return '$days일 전';
  }

  @override
  String get offlineStatus => '오프라인 상태';

  @override
  String get online => '온라인';

  @override
  String get offline => '오프라인';

  @override
  String get waitingToSync => '동기화 대기 중';

  @override
  String get syncNow => '지금 동기화';

  @override
  String get searchSettings => '설정 검색';

  @override
  String noSettingsMatch(String query) {
    return '\"$query\"와 일치하는 설정이 없습니다';
  }

  @override
  String get businessInfo => '사업 정보';

  @override
  String get payment => '결제';

  @override
  String get shopNameRequired => '가게 이름은 필수입니다';

  @override
  String phoneIncomplete(int digits) {
    return '$digits자리 전화번호를 모두 입력하세요';
  }

  @override
  String get jazzcashOptional => 'JazzCash 번호 (선택)';

  @override
  String get saved => '저장됨!';

  @override
  String get languageSubtitle => '앱 표시 언어 변경';

  @override
  String get notificationsSubtitle => '재고 부족, 연체 결제 및 일일 요약';

  @override
  String get backupSubtitle => '가게 데이터 다운로드, 복원 및 내보내기';

  @override
  String get appUpdate => '앱 업데이트';

  @override
  String get appUpdateSubtitle => '새 버전 확인';

  @override
  String get adminSubtitle => '계정 및 가게 데이터 관리';

  @override
  String get accountSubtitle => '로그인, 비밀번호 및 사용자 이름';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get privacySubtitle => '수집하는 데이터와 그 이유';

  @override
  String get yourShop => '내 가게';

  @override
  String get uploadingLogo => '가게 로고 업로드 중';

  @override
  String get logoTapToChange => '가게 로고, 탭하여 변경';

  @override
  String get brandTagline => '가게는 바빠도 장부는 차분하게.';

  @override
  String serverError(int code) {
    return '서버 오류: $code';
  }

  @override
  String get deleteCustomer => '고객 삭제';

  @override
  String deleteCustomerMessage(String name) {
    return '$name 님과 모든 영수증을 삭제할까요? 되돌릴 수 없습니다.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return '삭제할 수 없습니다: $detail';
  }

  @override
  String get couldNotDeleteOffline => '삭제할 수 없습니다 — 연결을 확인하고 다시 시도하세요.';

  @override
  String get actions => '작업';

  @override
  String get edit => '편집';

  @override
  String get delete => '삭제';

  @override
  String deleteCustomersTitle(int count) {
    return '고객 $count명 삭제';
  }

  @override
  String deleteCustomersMessage(int count) {
    return '고객 $count명과 모든 영수증을 삭제할까요? 되돌릴 수 없습니다.';
  }

  @override
  String get deselectAll => '모두 선택 해제';

  @override
  String get selectAll => '모두 선택';

  @override
  String selectedCount(int count) {
    return '$count개 선택됨';
  }

  @override
  String get cancel => '취소';

  @override
  String get newTag => '신규';

  @override
  String get csvNeedsRows => 'CSV에는 머리글 행과 최소 한 명의 고객이 필요합니다.';

  @override
  String get csvNeedsName => 'CSV 머리글에 \"name\" 열이 있어야 합니다.';

  @override
  String csvLineMissingName(int line) {
    return '$line행: 이름이 없습니다 — 파일을 수정하고 다시 시도하세요.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return '$line행: 잘못된 credit_limit \"$value\" — 파일을 수정하고 다시 시도하세요.';
  }

  @override
  String get importCustomers => '고객 가져오기';

  @override
  String importCustomersConfirm(int count, String file) {
    return '\"$file\"에서 고객 $count명을 찾았습니다. 모두 가져올까요?';
  }

  @override
  String get importAction => '가져오기';

  @override
  String importedCustomers(int count) {
    return '고객 $count명을 가져왔습니다.';
  }

  @override
  String importFailed(String detail) {
    return '가져오기 실패: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return '가져오기 실패 — 연결할 수 없습니다: $error';
  }

  @override
  String get noPhone => '전화 없음';

  @override
  String get offlineShowingSaved => '오프라인 — 저장된 사본 표시 중';

  @override
  String get searchCustomersHint => '고객 또는 전화번호 검색...';

  @override
  String get noCustomersYet => '아직 고객이 없습니다. +를 탭하여 추가하세요.';

  @override
  String get noCustomersMatch => '검색과 일치하는 고객이 없습니다.';

  @override
  String get owesMoney => '미수금 있음';

  @override
  String get settledUp => '정산 완료';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '$what을(를) 불러올 수 없습니다: $error';
  }

  @override
  String get takePhoto => '사진 찍기';

  @override
  String get chooseFromGallery => '갤러리에서 선택';

  @override
  String get back => '뒤로';

  @override
  String callPhone(String phone) {
    return '$phone에 전화';
  }

  @override
  String whatsappPhone(String phone) {
    return '$phone에 WhatsApp';
  }

  @override
  String get clearSearch => '검색 지우기';

  @override
  String get askHint => '예: 이번 달 이익은 얼마인가요?';

  @override
  String get acctTurnOffLockTitle => '앱 잠금을 끌까요?';

  @override
  String get acctTurnOffLockBody => '이 휴대폰을 가진 사람은 누구나 PIN 없이 앱을 열 수 있게 됩니다.';

  @override
  String get acctTurnOff => '끄기';

  @override
  String get acctSetPinTitle => 'PIN 설정';

  @override
  String get acctPinLabel => '4~6자리 PIN';

  @override
  String get acctPinMin => '4자리 이상이어야 합니다';

  @override
  String get acctConfirmPin => 'PIN 확인';

  @override
  String get acctPinMismatch => 'PIN이 일치하지 않습니다';

  @override
  String get acctSetPin => 'PIN 설정';

  @override
  String get acctBiometricTitle => '지문/얼굴 인식도 사용할까요?';

  @override
  String get acctBiometricBody => '생체 인식이 안 될 때는 PIN을 사용할 수 있습니다.';

  @override
  String get acctNoThanks => '아니요';

  @override
  String get acctEnable => '사용';

  @override
  String get acctSetPasswordTitle => '비밀번호 설정';

  @override
  String get acctSetPasswordIntro => '비밀번호를 설정하면 다음부터 Google뿐 아니라 이메일 + 비밀번호로도 로그인할 수 있습니다.';

  @override
  String get acctPassword => '비밀번호';

  @override
  String get acctPasswordMin => '6자 이상이어야 합니다';

  @override
  String get acctConfirmPassword => '비밀번호 확인';

  @override
  String get acctPasswordsMismatch => '비밀번호가 일치하지 않습니다';

  @override
  String get acctSetPasswordButton => '비밀번호 설정';

  @override
  String get acctPasswordSet => '비밀번호가 설정되었습니다. 이제 비밀번호로도 로그인할 수 있습니다.';

  @override
  String acctCouldNotSetPassword(String error) {
    return '비밀번호를 설정하지 못했습니다: $error';
  }

  @override
  String get acctChangePasswordTitle => '비밀번호 변경';

  @override
  String get acctCurrentPassword => '현재 비밀번호';

  @override
  String get acctRequired => '필수 항목입니다';

  @override
  String get acctNewPassword => '새 비밀번호';

  @override
  String get acctConfirmNewPassword => '새 비밀번호 확인';

  @override
  String get acctChange => '변경';

  @override
  String get acctPasswordChanged => '비밀번호가 변경되었습니다.';

  @override
  String get acctWrongPassword => '현재 비밀번호가 올바르지 않습니다.';

  @override
  String acctCouldNotChangePassword(String error) {
    return '비밀번호를 변경하지 못했습니다: $error';
  }

  @override
  String get acctChangeUsernameTitle => '사용자 이름 변경';

  @override
  String get acctUsername => '사용자 이름';

  @override
  String get acctUsernameEmpty => '사용자 이름을 입력해 주세요';

  @override
  String get acctUsernameChanged => '사용자 이름이 변경되었습니다.';

  @override
  String get acctChangeEmailTitle => '이메일 변경';

  @override
  String get acctNewEmail => '새 이메일';

  @override
  String get acctValidEmail => '올바른 이메일을 입력해 주세요';

  @override
  String get acctRequiredConfirm => '본인 확인을 위해 필요합니다';

  @override
  String get acctGoogleConfirmFirst => '먼저 Google로 확인하라는 안내가 표시됩니다.';

  @override
  String acctCheckEmail(String email) {
    return '변경 확인 링크가 $email(으)로 전송되었습니다. 확인해 주세요.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => '비밀번호 로그인';

  @override
  String acctRemoveTitle(String provider) {
    return '$provider을(를) 해제할까요?';
  }

  @override
  String acctRemoveBody(String provider) {
    return '이 계정에서 더 이상 $provider(으)로 로그인할 수 없게 됩니다.';
  }

  @override
  String get acctRemove => '해제';

  @override
  String acctRemoved(String provider) {
    return '$provider이(가) 해제되었습니다.';
  }

  @override
  String get acctSignedIn => '로그인됨';

  @override
  String get acctEmailNotVerified => '이메일이 아직 인증되지 않았습니다.';

  @override
  String get acctVerificationSent => '인증 이메일을 보냈습니다.';

  @override
  String get acctResend => '다시 보내기';

  @override
  String get acctSectionSignIn => '로그인 및 보안';

  @override
  String get acctRowChangeUsername => '사용자 이름 변경';

  @override
  String get acctRowChangeEmail => '이메일 변경';

  @override
  String get acctRowSetPassword => '비밀번호 설정';

  @override
  String get acctRowChangePassword => '비밀번호 변경';

  @override
  String get acctRowUnlinkGoogle => 'Google 연결 해제';

  @override
  String get acctRowRemovePassword => '비밀번호 삭제';

  @override
  String get acctRowAppLock => '앱 잠금 (PIN)';

  @override
  String get acctRowBiometric => '지문/얼굴 인식 사용';

  @override
  String get acctSignOutTitle => '로그아웃할까요?';

  @override
  String get acctSignOutBody => '앱을 사용하려면 다시 로그인해야 합니다.';

  @override
  String get acctSignOut => '로그아웃';

  @override
  String get acctDeleteAccount => '계정 삭제';

  @override
  String get acctDeleting => '삭제 중...';

  @override
  String get acctDeleteTitle => '계정을 삭제할까요?';

  @override
  String get acctDeleteBody => '로그인 정보가 영구적으로 삭제됩니다. 앱을 사용하려면 다시 가입해야 합니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String acctCouldNotDelete(String error) {
    return '계정을 삭제하지 못했습니다: $error';
  }

  @override
  String get itmNotFoundTitle => '상품을 찾을 수 없습니다';

  @override
  String itmNotFoundBody(String barcode) {
    return '바코드 $barcode에 해당하는 상품이 없습니다. 지금 새 상품으로 추가할까요?';
  }

  @override
  String get itmAddItem => '상품 추가';

  @override
  String get itmEditItem => '상품 수정';

  @override
  String get itmMergeTitle => '중복 상품 병합';

  @override
  String get itmMergeBody => '이름이 같은 상품은 가장 오래된 항목으로 병합되고 재고 수량이 합산됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get itmMerge => '병합';

  @override
  String get itmNoDuplicates => '중복된 상품이 없습니다.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '중복 상품 $count개를 병합했습니다.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => '상품 삭제';

  @override
  String get itmCannotUndo => '이 작업은 되돌릴 수 없습니다.';

  @override
  String get itmDeleteOffline => '삭제하지 못했습니다. 연결을 확인하고 다시 시도해 주세요.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '상품 $count개 삭제',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '상품 $count개를 삭제할까요? 이 작업은 되돌릴 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return '사진을 업로드하지 못했습니다 ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return '사진을 업로드하지 못했습니다: $error';
  }

  @override
  String get itmNoBarcodes => '바코드가 있는 상품이 아직 없습니다.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '라벨 $count개 인쇄',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => '상품 또는 카테고리 검색...';

  @override
  String get itmStopListening => '듣기 중지';

  @override
  String get itmVoiceSearch => '음성 검색';

  @override
  String get itmSort => '정렬';

  @override
  String get itmSortName => '이름 (가나다순)';

  @override
  String get itmSortStockLow => '재고: 적은 순';

  @override
  String get itmSortRecent => '최근 추가순';

  @override
  String get itmFilterAll => '전체';

  @override
  String get itmFilterLowStock => '재고 부족';

  @override
  String get itmNoItemsYet => '아직 상품이 없습니다. +를 눌러 추가하세요.';

  @override
  String get itmNoItemsMatch => '검색과 일치하는 상품이 없습니다.';

  @override
  String get itmNoPriceChanges => '기록된 가격 변경이 아직 없습니다.';

  @override
  String get itmNoStockCorrections => '기록된 재고 수정이 아직 없습니다.';

  @override
  String get itmResetHistory => '기록 초기화';

  @override
  String get itmResetHistoryMsg => '이 품목의 기록을 초기화할까요? 되돌릴 수 없습니다.';

  @override
  String get itmSendPdf => 'PDF로 보내기';

  @override
  String get itmNoteOptional => '메모 (선택)';

  @override
  String get itmNoteHint => '이 변경에 대한 메모를 추가하세요';

  @override
  String get itmRemoveEntry => '항목 삭제';

  @override
  String get itmRemoveEntryMsg => '이 항목을 기록에서 삭제할까요? 되돌릴 수 없습니다.';

  @override
  String get itmEditEntry => '항목 수정';

  @override
  String get itmPrevQty => '이전';

  @override
  String get itmNewQty => '이후';

  @override
  String itmCost(String amount) {
    return '원가: $amount';
  }

  @override
  String get itmMore => '더보기';

  @override
  String get itmMenuPrintLabel => '라벨 인쇄';

  @override
  String get itmMenuDuplicate => '복제';

  @override
  String get itmMenuPriceHistory => '가격 이력';

  @override
  String get itmMenuStockHistory => '재고 조정 이력';

  @override
  String itmLowStockBadge(int count) {
    return '재고 부족 $count개';
  }

  @override
  String itmStockLine(String qty) {
    return '재고: $qty';
  }

  @override
  String get itmOfflineSaved => '오프라인 — 상품이 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get itmItemName => '상품명';

  @override
  String get itmNameRequired => '이름은 필수입니다';

  @override
  String get itmPricePkr => '가격 (PKR)';

  @override
  String get itmPriceRequired => '가격은 필수입니다';

  @override
  String get itmValidNumber => '올바른 숫자를 입력해 주세요';

  @override
  String get itmUnit => '단위';

  @override
  String get itmCategoryHint => '카테고리 (선택, 예: 배관)';

  @override
  String get itmPreferredSupplier => '선호 공급업체 (선택)';

  @override
  String get itmPreferredSupplierHelper => '원탭 재주문에 사용됩니다';

  @override
  String get itmClear => '지우기';

  @override
  String get itmHsn => 'HSN 코드 (선택)';

  @override
  String get itmGstRate => 'GST 세율 % (선택)';

  @override
  String get itmBarcodeOptional => '바코드 (선택)';

  @override
  String get itmScanOrType => '스캔 또는 입력';

  @override
  String get itmScanBarcode => '바코드 스캔';

  @override
  String get itmPurchaseCost => '매입 원가 (단위당)';

  @override
  String get itmPurchaseCostHint => '재고를 매입할 때 지불하는 금액';

  @override
  String get itmWholesale => '도매 가격 (선택)';

  @override
  String get itmContractor => '업자 가격 (선택)';

  @override
  String get itmFallsBack => '없으면 일반 가격이 적용됩니다';

  @override
  String get itmStockQty => '재고 수량';

  @override
  String get itmLowStockAlert => '재고 부족 알림 기준';

  @override
  String get itmFrequently => '함께 자주 구매한 상품';

  @override
  String get itmSaveChanges => '변경사항 저장';

  @override
  String get itmSaveItem => '상품 저장';

  @override
  String get itmPhotoSemantics => '상품 사진, 눌러서 변경';

  @override
  String get cdUpdateStatusTitle => '결제 상태 업데이트';

  @override
  String get cdMarkPaidQ => '이 청구서를 결제 완료로 표시할까요?';

  @override
  String get cdMarkUnpaidQ => '이 청구서를 미결제로 표시할까요?';

  @override
  String get cdConfirm => '확인';

  @override
  String cdCouldNotUpdate(String detail) {
    return '업데이트하지 못했습니다: $detail';
  }

  @override
  String get cdOfflineChangeSaved => '오프라인 — 변경 사항이 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get cdConvertTitle => '청구서로 변환';

  @override
  String get cdConvertBody => '이 상품들의 재고가 차감되고 견적서가 실제 청구서로 바뀝니다. 계속할까요?';

  @override
  String get cdConvert => '변환';

  @override
  String cdCouldNotConvert(String detail) {
    return '변환하지 못했습니다: $detail';
  }

  @override
  String get cdReturnItems => '상품 반품';

  @override
  String get cdReturnHint => '상품별 반품 수량을 설정하세요. 0으로 두면 판매 상태가 유지됩니다.';

  @override
  String get cdDecreaseQty => '수량 줄이기';

  @override
  String get cdIncreaseQty => '수량 늘리기';

  @override
  String get cdCreditTotal => '크레딧 합계';

  @override
  String get cdReturnSelected => '선택 항목 반품';

  @override
  String cdCouldNotReturn(String detail) {
    return '반품하지 못했습니다: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return '무효 처리하지 못했습니다: $detail';
  }

  @override
  String get cdNoPreviousBill => '반복할 이전 청구서가 없습니다';

  @override
  String cdCouldNotLoadLast(String detail) {
    return '마지막 청구서를 불러오지 못했습니다: $detail';
  }

  @override
  String get cdInvoiceEmailed => '청구서를 고객에게 이메일로 보냈습니다.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return '청구서를 이메일로 보내지 못했습니다: $detail';
  }

  @override
  String get cdStatementEmailed => '거래 내역서를 고객에게 이메일로 보냈습니다.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return '거래 내역서를 이메일로 보내지 못했습니다: $detail';
  }

  @override
  String get cdDeleteBillTitle => '청구서 삭제';

  @override
  String get cdBillVoided => '무효';

  @override
  String get cdBillReturn => '반품';

  @override
  String get cdBillQuote => '견적';

  @override
  String get cdBillPaid => '결제 완료';

  @override
  String get cdBillPartial => '부분 결제';

  @override
  String get cdBillUnpaid => '미결제';

  @override
  String get cdBill => '청구서';

  @override
  String cdVoidedReason(String reason) {
    return '무효: $reason';
  }

  @override
  String get cdViewInvoice => '청구서 보기';

  @override
  String get cdEmailInvoice => '청구서 이메일 전송';

  @override
  String get cdEditBill => '청구서 수정';

  @override
  String get cdReturnBill => '청구서 반품';

  @override
  String get cdVoidBill => '청구서 무효 처리';

  @override
  String get cdNoItems => '상품 없음';

  @override
  String get cdRepeatLast => '마지막 청구서 반복';

  @override
  String get cdLedgerPdf => '원장 PDF';

  @override
  String get cdEmailStatement => '거래 내역서 이메일 전송';

  @override
  String get cdCollectPayment => '수금하기';

  @override
  String get cdSendReminder => 'WhatsApp 알림 보내기';

  @override
  String get cdTotalBilled => '총 청구액';

  @override
  String get cdPaid => '결제됨';

  @override
  String get cdNoBills => '아직 청구서가 없습니다';

  @override
  String get cdBillActions => '청구서 작업';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '외상 한도 $limit 중 $outstanding 사용';
  }

  @override
  String get cdVoidBody => '잔액과 보고서에서 제외되지만 기록에는 남습니다. 재고는 복원됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get cdReason => '사유 (선택)';

  @override
  String get frmOfflineCustomer => '오프라인 — 고객이 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get frmOfflineSupplier => '오프라인 — 공급업체가 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get frmEditCustomer => '고객 수정';

  @override
  String get frmCustomerName => '고객 이름';

  @override
  String get frmPhoneOptional => '전화번호 (선택)';

  @override
  String get frmCreditLimit => '외상 한도 (PKR, 선택)';

  @override
  String get frmCreditHelper => '이 고객의 잔액이 이 금액을 넘으면 경고합니다';

  @override
  String get frmPriceTier => '가격 등급';

  @override
  String get frmRetail => '소매';

  @override
  String get frmWholesale => '도매';

  @override
  String get frmContractor => '업자';

  @override
  String get frmPriceTierHelper => '이 고객의 청구서 작성 시 자동으로 채워지는 상품 가격';

  @override
  String get frmStrn => 'STRN (선택)';

  @override
  String get frmStrnCustomer => '청구서용 13자리 판매세 등록 번호';

  @override
  String get frmStrnSupplier => '매입 청구서용 13자리 판매세 등록 번호';

  @override
  String get frmAddress => '주소 (선택)';

  @override
  String get frmEmail => '이메일 (선택)';

  @override
  String get frmEmailHelper => '이 고객에게 청구서나 거래 내역서를 이메일로 보낼 수 있습니다';

  @override
  String get frmSaveCustomer => '고객 저장';

  @override
  String get frmEditSupplier => '공급업체 수정';

  @override
  String get frmSupplierName => '공급업체 이름';

  @override
  String get frmSaveSupplier => '공급업체 저장';

  @override
  String get sdDeletePurchaseTitle => '매입 삭제';

  @override
  String get sdDeletePurchaseBody => '이 매입의 재고가 복원됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get sdReturnToSupplier => '공급업체에 반품';

  @override
  String get sdReturnHint => '상품별로 돌려보낼 수량을 설정하세요. 0으로 두면 그대로 보관합니다.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return '입고 처리하지 못했습니다: $detail';
  }

  @override
  String get sdMarkPaidQ => '이 매입을 결제 완료로 표시할까요?';

  @override
  String get sdMarkUnpaidQ => '이 매입을 미결제로 표시할까요?';

  @override
  String get sdTotalPurchased => '총 매입';

  @override
  String get sdPayable => '지급 예정';

  @override
  String sdPayableAmount(String amount) {
    return '지급 예정 $amount';
  }

  @override
  String get sdNoPurchases => '아직 매입이 없습니다';

  @override
  String get sdPo => '발주';

  @override
  String get sdDraftPo => '발주서 초안';

  @override
  String get sdPurchase => '매입';

  @override
  String get sdDraftNote => '발주서 초안 — 아직 입고되지 않았으며 재고와 원가는 아직 갱신되지 않습니다.';

  @override
  String get sdReturnNote => '공급업체로의 반품 / 대변 전표.';

  @override
  String get sdMarkReceived => '입고 처리';

  @override
  String get sdEditPurchase => '매입 수정';

  @override
  String get sdPurchaseActions => '매입 작업';

  @override
  String get slDeleteSupplier => '공급업체 삭제';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '공급업체 $count곳 삭제',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '공급업체 $count곳과 모든 매입을 삭제할까요? 이 작업은 되돌릴 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV에는 헤더 행과 최소 한 곳의 공급업체가 필요합니다.';

  @override
  String get slImportTitle => '공급업체 가져오기';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\"에서 공급업체 $count곳을 찾았습니다. 모두 가져올까요?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '공급업체 $count곳을 가져왔습니다.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => '아직 공급업체가 없습니다. +를 눌러 추가하세요.';

  @override
  String get slSearchHint => '공급업체 또는 전화번호 검색...';

  @override
  String get slNoMatch => '검색과 일치하는 공급업체가 없습니다.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '공급업체 $count곳',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => '공급업체 미지급금';

  @override
  String get sduNothingOwed => '공급업체에 줄 돈이 없습니다 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '지급할 공급업체 $count곳',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '가장 오래된 미결제 매입 후 $days일 경과',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30일';

  @override
  String get duBucket1 => '30–60일';

  @override
  String get duBucket2 => '60일 이상';

  @override
  String get duTitle => '미수금 센터';

  @override
  String get duNoDues => '미수금이 없습니다 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '미수금이 있는 고객 $count명',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '가장 오래된 미결제 청구서 후 $days일 경과',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '미수 $amount';
  }

  @override
  String get cpNoOutstanding => '이 고객의 미수 잔액이 없습니다';

  @override
  String get cpValidAmount => '올바른 금액을 입력해 주세요';

  @override
  String cpExceeds(String amount) {
    return '금액이 미수 잔액 $amount을(를) 초과합니다';
  }

  @override
  String cpCollected(String amount, String name) {
    return '$name에게서 $amount을(를) 수금했습니다';
  }

  @override
  String get cpOfflineSaved => '오프라인 — 결제가 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String cpOwes(String amount, String name) {
    return '$name의 미수금은 $amount입니다. 가장 오래된 미결제 청구서부터 차례로 적용됩니다.';
  }

  @override
  String get cpAmountLabel => '수금액 (PKR)';

  @override
  String get cpCollect => '수금';

  @override
  String get usNoItems => '업데이트할 상품이 없습니다.';

  @override
  String get usHelp => '각 상품의 새 재고를 설정한 다음 모두 저장을 누르세요.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  현재: $qty';
  }

  @override
  String usNew(String qty) {
    return '변경: $qty';
  }

  @override
  String get usSubtract => '1 빼기';

  @override
  String get usAdd => '1 더하기';

  @override
  String get usNoChanges => '변경 사항 없음';

  @override
  String usSaveAll(int count) {
    return '모두 저장 ($count개 변경)';
  }

  @override
  String get srHint => '고객, 상품, 금액 검색...';

  @override
  String get srFailed => '검색에 실패했습니다. 연결을 확인해 주세요.';

  @override
  String get srTitle => '내 가게 검색';

  @override
  String get srSubtitle => '이름이나 전화번호로 고객을, 금액으로 청구서를 찾으세요.';

  @override
  String srNoMatches(String query) {
    return '\"$query\"에 대한 결과가 없습니다';
  }

  @override
  String get srTryDifferent => '다른 이름, 전화번호 또는 금액으로 시도해 보세요.';

  @override
  String get srBills => '청구서';

  @override
  String get srNoItemList => '상품 목록 없음';

  @override
  String get abAddAtLeastOne => '상품을 하나 이상 추가하세요';

  @override
  String get abQuotationUpdated => '견적서가 업데이트되었습니다!';

  @override
  String get abBillUpdated => '청구서가 업데이트되었습니다!';

  @override
  String get abQuotationSaved => '견적서가 저장되었습니다!';

  @override
  String get abBillCreated => '청구서가 생성되었습니다!';

  @override
  String abTotalAmount(String amount) {
    return '합계: $amount';
  }

  @override
  String get abShare => '공유';

  @override
  String get abDoneReturn => '완료 후 돌아가기';

  @override
  String get abOverLimitBody => '이렇게 하면 고객이 외상 한도를 초과하게 됩니다.';

  @override
  String get abOverLimitTitle => '외상 한도 초과';

  @override
  String get abBillAnyway => '그래도 청구';

  @override
  String get abOfflineBill => '오프라인 — 청구서가 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get abEditQuotation => '견적서 수정';

  @override
  String get abEditBill => '청구서 수정';

  @override
  String get abNewQuotation => '새 견적서';

  @override
  String get abAddBill => '청구서 추가';

  @override
  String get abCouldNotLoadItems => '상품을 불러오지 못했습니다.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return '이 청구서로 고객 잔액이 $total이(가) 되어 외상 한도 $limit을(를) 초과합니다.';
  }

  @override
  String get abTapAddItemBill => '아래 \"상품 추가\"를 눌러 청구서를 시작하세요';

  @override
  String get abNoCatalog => '카탈로그에 아직 상품이 없습니다';

  @override
  String get abScan => '스캔';

  @override
  String get abDiscountRs => '할인 (루피)';

  @override
  String get abSubtotal => '소계';

  @override
  String get abTotal => '합계';

  @override
  String get abSaveAsQuotation => '견적서로 저장';

  @override
  String get abQuotationLocked => '기존 청구서는 견적서로 되돌릴 수 없습니다';

  @override
  String get abQuotationNote => '청구서로 변환하기 전에는 재고가 차감되지 않습니다';

  @override
  String get abPaymentStatus => '결제 상태';

  @override
  String get abUnpaid => '미결제';

  @override
  String get abPaymentMethod => '결제 방법';

  @override
  String get abCash => '현금';

  @override
  String get abBankTransfer => '계좌 이체';

  @override
  String get abCheque => '수표';

  @override
  String get abSaveQuotation => '견적서 저장';

  @override
  String get abSaveBill => '청구서 저장';

  @override
  String abAdded(String name) {
    return '$name을(를) 추가했습니다';
  }

  @override
  String get apNewItem => '새 상품…';

  @override
  String get apNewItemHint => '먼저 카탈로그에 새 상품을 추가하세요';

  @override
  String get apOfflinePurchase => '오프라인 — 매입이 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get apEditPo => '발주서 수정';

  @override
  String get apNewPo => '새 발주서';

  @override
  String get apAddPurchase => '매입 추가';

  @override
  String get apTapAddItem => '아래 \"상품 추가\"를 눌러 매입을 시작하세요';

  @override
  String get apSaveAsPo => '발주서로 저장';

  @override
  String get apPoLocked => '이미 입고된 매입은 초안 발주서로 되돌릴 수 없습니다';

  @override
  String get apPoNote => '상품을 입고 처리하기 전에는 재고나 원가가 갱신되지 않습니다';

  @override
  String get apUnpaidCredit => '미결제 (외상)';

  @override
  String get apSavePo => '발주서 저장';

  @override
  String get apSavePurchase => '매입 저장';

  @override
  String apCurrentCost(String amount, String unit) {
    return '현재 원가: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return '원가 미설정  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return '스캔 실패: 서버 오류 $code';
  }

  @override
  String get scOfflineSaved => '오프라인 — 사진이 저장되었으며, 온라인으로 돌아오면 자동으로 읽습니다';

  @override
  String get scStillOffline => '여전히 오프라인입니다';

  @override
  String get scCouldNotCreateCustomer => '고객을 만들지 못했습니다 — 다시 시도해 주세요.';

  @override
  String get scCouldNotCreateSupplier => '공급업체를 만들지 못했습니다 — 다시 시도해 주세요.';

  @override
  String scBillSavedFor(String name) {
    return '$name의 청구서를 저장했습니다';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '$name에서의 매입을 저장했습니다';
  }

  @override
  String get scWhichCustomer => '어느 고객인가요?';

  @override
  String get scWhichSupplier => '어느 공급업체인가요?';

  @override
  String scClosestMatch(String name, int score) {
    return '등록된 가장 비슷한 항목: $name (유사도 $score%)';
  }

  @override
  String scYesThisIs(String name) {
    return '네, $name입니다';
  }

  @override
  String get scOtherwiseCustomer => '아니면 새 고객을 만드세요:';

  @override
  String get scOtherwiseSupplier => '아니면 새 공급업체를 만드세요:';

  @override
  String get scNoMatchCustomer => '일치하는 고객이 없습니다. 새로 만드세요:';

  @override
  String get scNoMatchSupplier => '일치하는 공급업체가 없습니다. 새로 만드세요:';

  @override
  String get scCustomerName => '고객 이름';

  @override
  String get scSupplierName => '공급업체 이름';

  @override
  String get scCreateNew => '새로 만들기';

  @override
  String get scTitleBill => '청구서 스캔';

  @override
  String get scIntroBill => '청구서를 사진으로 찍어 주세요. 손글씨여도 괜찮고, 신드어·우르두어·영어 모두 됩니다. 저장하기 전에 내용을 확인할 수 있어요.';

  @override
  String get scIntroPurchase => '공급업체 청구서를 사진으로 찍어 주세요. 신드어·우르두어·영어 모두 됩니다. 저장하기 전에 내용을 확인할 수 있어요.';

  @override
  String get scReadingBill => '청구서 읽는 중…';

  @override
  String get scScanBill => '청구서 스캔';

  @override
  String get scReadingInvoice => '청구서 읽는 중…';

  @override
  String get scScanInvoice => '청구서 스캔';

  @override
  String get scQueued => '대기 중인 스캔';

  @override
  String get scReady => '검토 준비됨';

  @override
  String get scFailed => '실패';

  @override
  String get scWaiting => '연결 대기 중';

  @override
  String get scRetry => '다시 시도';

  @override
  String rpCouldNotLoad(String error) {
    return '보고서를 불러오지 못했습니다: $error';
  }

  @override
  String get rpHeadline => '이번 달 핵심 수치';

  @override
  String get rpProfitThisMonth => '이번 달 이익';

  @override
  String get rpNoData => '아직 데이터가 없습니다';

  @override
  String get rpSalesTax => '판매세';

  @override
  String rpSalesTaxFor(String month) {
    return '$month 판매세 보고서';
  }

  @override
  String get rpViewSalesTax => '판매세 보고서 보기';

  @override
  String get rpQuickReports => '빠른 보고서';

  @override
  String get rpQuickSub => '특정 보고서로 바로 이동';

  @override
  String get expensesTitle => '지출';

  @override
  String get rpRateCard => '요금표';

  @override
  String get rpDetails => '상세';

  @override
  String get rpDetailsSub => '전체 세부 내역과 순위';

  @override
  String get rpOutstandingByCustomer => '고객별 미수금';

  @override
  String get rpNoOutstanding => '미수 잔액이 없습니다';

  @override
  String get rpMonthlyTotals => '월별 합계';

  @override
  String get rpMostSold => '가장 많이 팔린 상품';

  @override
  String get rpNoItemsRecorded => '기록된 상품이 아직 없습니다';

  @override
  String get rpTopCustomers => '매출 상위 고객';

  @override
  String get rpNoSalesRecorded => '기록된 판매가 아직 없습니다';

  @override
  String get rpTotalOutstanding => '미수금 합계';

  @override
  String get rpViewCustomers => '고객 보기';

  @override
  String get lblInvoice => '청구서';

  @override
  String get lblLedger => '원장';

  @override
  String get lblRateCard => '요금표';

  @override
  String get exCsvNeedsRows => 'CSV에는 헤더 행과 최소 한 건의 지출이 필요합니다.';

  @override
  String get exCsvHeader => 'CSV 헤더에 \"description\"과 \"amount\" 열이 있어야 합니다.';

  @override
  String exLineBadAmount(int line) {
    return '$line행: 설명이 없거나 금액이 올바르지 않습니다. 파일을 고친 뒤 다시 시도하세요.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return '$line행: 날짜 \"$date\"이(가) 올바르지 않습니다. YYYY-MM-DD 형식을 사용하세요.';
  }

  @override
  String get exImportTitle => '지출 가져오기';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '\"$file\"에서 지출 $count건을 찾았습니다. 모두 가져올까요?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '지출 $count건을 가져왔습니다.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return '가져오기 실패: 서버 오류 $code';
  }

  @override
  String get exDeleteTitle => '지출 삭제';

  @override
  String get exAdd => '지출 추가';

  @override
  String get exEdit => '지출 수정';

  @override
  String get exDescription => '설명';

  @override
  String get exAmountRs => '금액 (루피)';

  @override
  String get exCategory => '카테고리';

  @override
  String exDate(String date) {
    return '날짜: $date';
  }

  @override
  String get exRepeats => '매월 반복';

  @override
  String get exRepeatsHint => '임대료, 전기료, 인건비 등';

  @override
  String get exReceiptTap => '영수증 사진, 눌러서 변경';

  @override
  String get exReceiptOptional => '영수증 사진 (선택)';

  @override
  String get exEnterValid => '설명과 올바른 금액을 입력해 주세요.';

  @override
  String get exOffline => '오프라인 — 지출이 이 기기에 저장되었으며, 온라인으로 돌아오면 자동으로 동기화됩니다';

  @override
  String get exSave => '지출 저장';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이번 달 납부할 반복 지출이 $count건 있습니다',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => '추가';

  @override
  String get exTotal => '총 지출';

  @override
  String exCategoryChip(String name) {
    return '카테고리: $name';
  }

  @override
  String get exNoneLogged => '기록된 지출이 아직 없습니다';

  @override
  String exNoneInCategory(String name) {
    return '$name 지출이 아직 없습니다';
  }

  @override
  String get exViewReceipt => '영수증 보기';

  @override
  String get exEditRow => '지출 수정';

  @override
  String get exDeleteRow => '지출 삭제';

  @override
  String gstServerReturned(String first, String second) {
    return '서버 응답: $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'GST 데이터를 불러오지 못했습니다: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return '다운로드 실패 ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename 저장됨';
  }

  @override
  String gstSavedDownloads(String filename) {
    return '다운로드/$filename에 저장됨';
  }

  @override
  String gstCouldNotDownload(String error) {
    return '다운로드하지 못했습니다: $error';
  }

  @override
  String get gstTitle => '판매세 보고서';

  @override
  String get gstOutwardDetail => '매출 — 청구서 상세';

  @override
  String get gstNoBills => '이번 달 청구서가 없습니다.';

  @override
  String get gstHsn => 'HSN 요약';

  @override
  String get gstInvoiceWise => '청구서별 상세';

  @override
  String get gstMonthly => '월별 요약';

  @override
  String get gstOutwardTaxable => '과세 매출 공급';

  @override
  String get gstItc => '매입세액 공제 (매입 기준)';

  @override
  String get gstSave => '저장';

  @override
  String get rcValidAmount => '올바른 금액을 입력해 주세요.';

  @override
  String get rcExpected => '예상 현금 (오늘 현금 매출)';

  @override
  String get rcAlsoCollected => '오늘 추가 수금 (금고에는 미포함)';

  @override
  String get rcCounted => '금고에서 센 현금 (루피)';

  @override
  String get rcCompare => '비교';

  @override
  String get rcMatches => '정확히 일치합니다!';

  @override
  String rcExtra(String amount) {
    return '금고에 $amount 초과';
  }

  @override
  String rcMissing(String amount) {
    return '금고에서 $amount 부족';
  }

  @override
  String get pbiTitle => '상품별 이익';

  @override
  String get pbiNoSales => '아직 판매가 없습니다';

  @override
  String get pbiByCategory => '카테고리별';

  @override
  String get pbiItemsByProfit => '이익순 상품';

  @override
  String get svTitle => '재고 평가액';

  @override
  String get svNone => '보유 재고가 없습니다';

  @override
  String get svItemsByValue => '금액순 상품';

  @override
  String svSummary(String items, String units) {
    return '상품 $items개 · 진열대 $units개';
  }

  @override
  String svTied(String amount) {
    return '재고에 $amount 묶여 있음';
  }

  @override
  String get svEstimated => '판매가 기준 추정';

  @override
  String get bkRestoreTitle => '백업을 복원할까요?';

  @override
  String bkRestoreBody(String filename) {
    return '현재의 모든 데이터가 백업 파일 \"$filename\"(으)로 교체됩니다. 계속할까요?';
  }

  @override
  String get bkRestore => '복원';

  @override
  String get bkRestoreDoneTitle => '복원 완료';

  @override
  String get bkRestoreDoneBody => '데이터가 복원되었습니다.';

  @override
  String get bkOk => '확인';

  @override
  String bkRestoreFailed(String detail) {
    return '복원 실패: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return '복원하지 못했습니다: $error';
  }

  @override
  String get bkSaveToDownloads => '다운로드에 저장';

  @override
  String get bkIntroAdmin => '모든 데이터는 하나의 데이터베이스 파일에 있습니다. 정기적으로 사본을 내려받고, 문제가 생기면 복원하세요.';

  @override
  String get bkIntroStaff => '전체 데이터베이스 백업과 복원은 관리자 전용입니다. 관리자에게 요청하거나, 필요한 것을 아래에서 CSV로 내보내세요.';

  @override
  String get bkBackupDb => '데이터베이스 백업';

  @override
  String get bkBackupDbSub => '전체 데이터베이스를 하나의 파일로 내려받아 공유하세요 (WhatsApp, 드라이브, 이메일).';

  @override
  String get bkDownloadPhone => '백업을 휴대폰에 다운로드';

  @override
  String get bkShareBackup => '백업 공유';

  @override
  String get bkAutoTitle => '자동 백업';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '서버에 일일 백업 $count개가 저장되어 있으며, 가장 최근 것은 $time입니다. 자동으로 실행되므로 여기서 할 일은 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => '현재 데이터를 교체할 저장된 백업 파일을 선택하세요.';

  @override
  String get bkRestoreFromFile => '백업 파일에서 복원';

  @override
  String get bkExportCsv => 'CSV로 내보내기';

  @override
  String get bkExportSub => 'Excel에서 열거나 공유하세요.';

  @override
  String get bkRangeAll => '청구서/지출: 전체 기간';

  @override
  String bkRangeSome(String end, String start) {
    return '청구서/지출: $start부터 $end까지';
  }

  @override
  String get bkSetRange => '기간 설정';

  @override
  String get bkClearRange => '기간 지우기';

  @override
  String get ntNever => '한 번도 실행되지 않음';

  @override
  String get ntJustNow => '방금';

  @override
  String ntMinutesAgo(int count) {
    return '$count분 전';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count시간 전';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count일 전';
  }

  @override
  String get ntTitle => '스마트 알림';

  @override
  String get ntTapHint => '\"지금 확인\"을 눌러 알림을 실행하고 실시간 결과를 확인하세요.';

  @override
  String get ntLowStockSub => '상품이 재주문 기준 아래로 떨어지면 알립니다.';

  @override
  String get ntCheckNow => '지금 확인';

  @override
  String get ntOverdue => '연체 결제 알림';

  @override
  String get ntOverdueSub => '이전 날짜의 미결제 청구서를 알립니다.';

  @override
  String get ntDaily => '일일 비즈니스 요약';

  @override
  String get ntDailySub => '어제의 매출, 수금, 이익을 한눈에 확인합니다.';

  @override
  String get ntSendSummary => '요약 보내기';

  @override
  String get ntRunning => '실행 중…';

  @override
  String get ntLowStockItems => '재고 부족 상품';

  @override
  String get ntSales => '매출';

  @override
  String get ntCollected => '수금';

  @override
  String get ntProfit => '이익';

  @override
  String get auChecking => '업데이트 확인 중…';

  @override
  String get auLatest => '최신 버전을 사용 중입니다.';

  @override
  String get auAvailable => '업데이트 가능';

  @override
  String auNewer(int code) {
    return 'Book-Keep의 새 버전(빌드 $code)이 준비되었습니다.';
  }

  @override
  String get auLater => '나중에';

  @override
  String get auUpdate => '업데이트';

  @override
  String get auDownloading => '업데이트 다운로드 중';

  @override
  String auSaved(String name) {
    return '$name을(를) 다운로드 폴더에 저장했습니다.';
  }

  @override
  String get auAllowInstall => 'Book-Keep이 앱을 설치하도록 허용한 뒤 업데이트를 다시 누르세요.';

  @override
  String get auFailed => '업데이트하지 못했습니다. 연결을 확인하고 다시 시도해 주세요.';

  @override
  String get lgSearch => '언어 검색';

  @override
  String lgNoMatch(String query) {
    return '\"$query\"와(과) 일치하는 언어가 없습니다';
  }

  @override
  String get alVoided => '청구서를 무효 처리했습니다';

  @override
  String get alDeletedBill => '청구서를 삭제했습니다';

  @override
  String get alReturned => '청구서를 반품했습니다';

  @override
  String get alDeletedCustomer => '고객을 삭제했습니다';

  @override
  String get alDeletedSupplier => '공급업체를 삭제했습니다';

  @override
  String get alCreatedAccount => '계정을 만들었습니다';

  @override
  String get alUpdatedAccount => '계정을 수정했습니다';

  @override
  String get alDeletedAccount => '계정을 삭제했습니다';

  @override
  String get alTitle => '활동 기록';

  @override
  String get alNone => '기록된 활동이 아직 없습니다';

  @override
  String get blkEnterOne => '상품을 하나 이상 입력해 주세요';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '상품 $count개를 추가했습니다',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => '상품 일괄 추가';

  @override
  String get blkFormat => '한 줄에 상품 하나, 형식: 이름, 가격, 단위, 카테고리';

  @override
  String get blkOptional => '단위와 카테고리는 선택 사항입니다 (기본값: piece, 없음)';

  @override
  String get blkAddAll => '모든 상품 추가';

  @override
  String get prSend => '결제 알림 보내기';

  @override
  String get prTone => '어조 선택:';

  @override
  String get prPolite => '정중하게';

  @override
  String get prStandard => '표준';

  @override
  String get prUrgent => '긴급';

  @override
  String get prPreviewQr => 'JazzCash 결제 QR 미리보기';

  @override
  String get prShareText => '텍스트 공유';

  @override
  String get dsRemaining => '잔액';

  @override
  String dsIncludesDiscount(String amount) {
    return '$amount 할인 포함';
  }

  @override
  String get dsItems => '상품';

  @override
  String get dsDiscount => '할인';

  @override
  String get lkWrongPin => 'PIN이 올바르지 않습니다';

  @override
  String get lkEnterPin => 'PIN 입력';

  @override
  String get lkChecking => '지문 확인 중...';

  @override
  String get bcTitle => '바코드 스캔';

  @override
  String get bcTorchNa => '이 기기에서는 손전등을 사용할 수 없습니다';

  @override
  String get bcTorch => '손전등';

  @override
  String get bcPoint => '카메라를 바코드에 향하세요';

  @override
  String get qrNoNumber => '설정된 JazzCash 번호가 없습니다. 결제 QR 코드를 표시하려면 설정에서 등록하세요.';

  @override
  String get qrPay => 'JazzCash로 결제';

  @override
  String get qrInvalid => '잘못된 QR 데이터';

  @override
  String qrAmount(String amount) {
    return '금액: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'JazzCash 번호 복사';

  @override
  String get qrCopied => 'JazzCash 번호를 클립보드에 복사했습니다';

  @override
  String get qrHint => '결제하려면 이 번호를 JazzCash 앱에서 스캔하거나 복사하세요.';

  @override
  String clOwed(String amount) {
    return '미수 $amount';
  }

  @override
  String get lnEnterEmailFirst => '먼저 위에 올바른 이메일을 입력해 주세요.';

  @override
  String get lnResetSent => '비밀번호 재설정 이메일을 보냈습니다. 받은편지함을 확인하세요.';

  @override
  String get lnNoAccount => '해당 이메일의 계정을 찾을 수 없습니다.';

  @override
  String get lnWrongPassword => '비밀번호가 올바르지 않습니다.';

  @override
  String get lnInvalidEmail => '올바른 이메일 주소가 아닌 것 같습니다.';

  @override
  String get lnDisabled => '이 계정은 비활성화되었습니다.';

  @override
  String get lnTooMany => '시도 횟수가 너무 많습니다. 1분 후에 다시 시도해 주세요.';

  @override
  String get lnNoInternet => '인터넷에 연결되어 있지 않습니다.';

  @override
  String get lnWeakPassword => '비밀번호는 6자 이상이어야 합니다.';

  @override
  String get lnCouldNotSignIn => '로그인하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get lnWrongPasswordHint => '비밀번호가 올바르지 않습니다. 다시 시도하거나 \"비밀번호를 잊으셨나요?\"를 누르세요.';

  @override
  String get lnWrongEmail => '이메일이 올바르지 않습니다. 해당 주소를 사용하는 계정이 없습니다.';

  @override
  String get lnWrongEmailOrPassword => '이메일 또는 비밀번호가 올바르지 않습니다.';

  @override
  String get lnWrongUsername => '사용자 이름이 올바르지 않습니다. 해당 이름을 사용하는 계정이 없습니다.';

  @override
  String get lnWelcome => '다시 오신 것을 환영합니다';

  @override
  String lnSignInTo(String app) {
    return '$app에 로그인';
  }

  @override
  String get lnEmailOrUsername => '이메일 또는 사용자 이름';

  @override
  String get lnRemember => '로그인 상태 유지';

  @override
  String get lnForgot => '비밀번호를 잊으셨나요?';

  @override
  String get lnSignIn => '로그인';

  @override
  String get lnGoogle => 'Google로 계속';

  @override
  String get lnNew => '처음이신가요?';

  @override
  String get lnCreate => '계정 만들기';

  @override
  String suCreated(String email) {
    return '$email의 계정이 만들어졌습니다. 인증 이메일을 보냈습니다 (선택).';
  }

  @override
  String suSetup(String app) {
    return '$app 설정';
  }

  @override
  String get suName => '이름';

  @override
  String get suEmail => '이메일';

  @override
  String suPhoneDigits(int digits) {
    return '올바른 $digits자리 번호를 입력해 주세요';
  }

  @override
  String get suCreateBtn => '계정 만들기';

  @override
  String get suHaveAccount => '이미 계정이 있나요?';

  @override
  String get suAlreadyExists => '해당 이메일로 만든 계정이 이미 있습니다.';

  @override
  String get suInvalidEmail => '올바르지 않은 이메일 주소입니다.';

  @override
  String get agShow => '비밀번호 표시';

  @override
  String get agHide => '비밀번호 숨기기';

  @override
  String get adAccounts => '계정';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '등록된 계정 $count개',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => '추가';

  @override
  String get adNoAccounts => '계정을 찾을 수 없습니다.';

  @override
  String get adAccountability => '활동 책임 기록';

  @override
  String get adAccountabilitySub => '누가 무엇을 무효 처리, 삭제, 반품했는지와 계정 변경 내역.';

  @override
  String get adActivitySub => '무효 처리한 청구서, 삭제, 계정 변경';

  @override
  String get adServer => '서버';

  @override
  String get adServerSub => '이 앱이 연결하는 곳입니다. 설정 후에는 거의 바꿀 일이 없습니다.';

  @override
  String get adServerHint => '에뮬레이터는 10.0.2.2를 사용하고, 실제 휴대폰은 같은 Wi-Fi의 노트북 IP가 필요합니다. 변경하면 모든 계정에 영향을 줍니다.';

  @override
  String get adApiBase => 'API 기본 URL';

  @override
  String get adSaveServer => '서버 주소 저장';

  @override
  String get adEmailSetSub => '설정됨 — 직원이 고객에게 청구서/거래 내역서를 이메일로 보낼 수 있습니다.';

  @override
  String get adNotSetUp => '아직 설정되지 않았습니다.';

  @override
  String get adEmailSetBody => '이메일이 설정되었습니다. 직원이 청구서나 거래 내역서를 고객에게 바로 이메일로 보낼 수 있습니다.';

  @override
  String get adEmailHelp => 'Gmail 주소는 앱 비밀번호로 사용할 수 있습니다 (smtp.gmail.com, 포트 587). 또는 이메일 제공업체의 SMTP 정보를 사용하세요.';

  @override
  String get adSmtpHost => 'SMTP 호스트';

  @override
  String get adSmtpPort => 'SMTP 포트';

  @override
  String get adEmailAddress => '이메일 주소';

  @override
  String get adPwKeep => '비밀번호 (현재 값을 유지하려면 비워 두세요)';

  @override
  String get adPwApp => '비밀번호 (앱 비밀번호, 로그인 비밀번호 아님)';

  @override
  String get adFromName => '보내는 사람 이름 (선택)';

  @override
  String get adFromHint => '우리 철물점';

  @override
  String get adSaving => '저장 중...';

  @override
  String get adSaveEmail => '이메일 설정 저장';

  @override
  String get adAddAccount => '계정 추가';

  @override
  String get adNameOpt => '이름 (선택)';

  @override
  String get adAtLeast6 => '6자 이상';

  @override
  String get adGrantAdmin => '관리자 권한 부여';

  @override
  String get adCanManage => '무효/삭제/반품 가능';

  @override
  String get adCanManageHint => '청구서 무효 처리 또는 삭제, 청구서 반품, 고객/공급업체 삭제. 관리자는 항상 이 권한이 있습니다.';

  @override
  String get adCreate => '만들기';

  @override
  String get adAccountCreated => '계정이 만들어졌습니다.';

  @override
  String adCreateFailed(String error) {
    return '만들기 실패: $error';
  }

  @override
  String get adEditAccount => '계정 수정';

  @override
  String get adAdminSwitch => '관리자';

  @override
  String get adAdminHint => '관리자 패널을 열 수 있음';

  @override
  String get adDisabled => '비활성화';

  @override
  String get adDisabledHint => '로그인 차단됨';

  @override
  String get adAccountUpdated => '계정이 수정되었습니다.';

  @override
  String adUpdateFailed(String error) {
    return '수정 실패: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label이(가) 영구적으로 삭제되며 더 이상 로그인할 수 없습니다.';
  }

  @override
  String get adAccountDeleted => '계정이 삭제되었습니다.';

  @override
  String adDeleteFailed(String error) {
    return '삭제 실패: $error';
  }

  @override
  String get adBadgeAdmin => '관리자';

  @override
  String get adBadgeDisabled => '비활성화';

  @override
  String get adOff => '관리자 패널이 꺼져 있습니다';

  @override
  String get adCheckAgain => '다시 확인';

  @override
  String get adAccessRequired => '관리자 권한이 필요합니다';

  @override
  String get adAccessBody => '가게 관리자만 계정을 관리할 수 있습니다. 가게 주인에게 관리자 권한을 요청하세요.';

  @override
  String get adCouldNotLoad => '관리자 패널을 불러오지 못했습니다.';

  @override
  String get adBadPort => '올바른 SMTP 포트 번호를 입력해 주세요.';

  @override
  String get adEmailSaved => '이메일 설정이 저장되었습니다.';

  @override
  String adEmailSaveFailed(String error) {
    return '이메일 설정을 저장하지 못했습니다: $error';
  }

  @override
  String get adServerEmpty => '서버 주소는 비워 둘 수 없습니다.';

  @override
  String get adServerSaved => '서버 주소가 저장되었습니다. 다음 로드부터 화면에서 사용합니다.';

  @override
  String get lnOr => '또는';

  @override
  String get scNotABill => '청구서로 보이지 않습니다. 청구서가 선명하게 나온 사진으로 다시 시도해 주세요.';

  @override
  String get scNotAnInvoice => '청구서로 보이지 않습니다. 공급업체 청구서가 선명하게 나온 사진으로 다시 시도해 주세요.';

  @override
  String get jqOpenFull => '크게 보기';

  @override
  String get jqCopy => '번호 복사';

  @override
  String get jqSheetTitle => 'JazzCash QR';

  @override
  String get jqSheetHint => '고객이 JazzCash 앱에서 이 코드를 스캔해 결제합니다.';

  @override
  String get jqCheck => '번호를 확인해 주세요';

  @override
  String get askVoice => '음성';

  @override
  String get askVoiceFallbackNote => '휴대폰 음성으로 읽고 있습니다.';

  @override
  String get askPace => '속도';

  @override
  String get askTone => '톤';

  @override
  String get askPaceSlower => '느리게';

  @override
  String get askPaceNormal => '보통';

  @override
  String get askPaceFaster => '빠르게';

  @override
  String get askToneCalm => '차분하게';

  @override
  String get askToneWarm => '따뜻하게';

  @override
  String get askToneCheerful => '밝게';

  @override
  String qPaymentUpdate(String amount) {
    return '결제 업데이트: $amount';
  }

  @override
  String qCustomer(String name) {
    return '고객: $name';
  }

  @override
  String qSupplier(String name) {
    return '공급업체: $name';
  }

  @override
  String qItem(String name) {
    return '품목: $name';
  }

  @override
  String qExpense(String name) {
    return '지출: $name';
  }

  @override
  String qPurchase(String amount) {
    return '구매: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '$name에게서 수금: $amount';
  }

  @override
  String gstAmount(String amount) {
    return '세금 $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return '과세액 $taxable  ·  세금 $tax  ·  합계 $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return '매출: $revenue  •  매출원가: $cogs  •  지출: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return '$customer님, $shop에서 인사드립니다! 총 미납 잔액은 $amount입니다. 감사합니다!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return '$customer님, $shop의 결제 안내입니다. 미납 잔액 $amount를 가능한 한 빨리 결제해 주세요.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return '긴급 안내: $customer님, $shop의 미납금 $amount이(가) 남아 있습니다. 즉시 결제해 주세요.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'JazzCash로 결제: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '$shop 청구서\n합계: $total\n품목: $items\n상태: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return '$supplier님, $shop입니다. 다음 품목을 주문하고 싶습니다:\n$lines\n\n재고와 가격을 확인해 주세요. 감사합니다.';
  }

  @override
  String ppUpdated(String date) {
    return '최종 업데이트: $date';
  }

  @override
  String get ppWhoH => '운영자 정보';

  @override
  String ppWho(String owner, String email) {
    return '$owner, Book-keep 운영자.\n문의: $email';
  }

  @override
  String get ppCollectH => '수집하는 정보';

  @override
  String get ppCollectAccount => '계정: 이메일, 전화번호, 사용자 이름 (Firebase Authentication 사용).';

  @override
  String get ppCollectShop => '매장 프로필: 매장 이름, 주소, 전화번호, JazzCash 번호, 매장 로고 이미지 — 매장 주인이 설정에서 입력합니다.';

  @override
  String get ppCollectRecords => '사용자가 만드는 업무 기록: 고객 및 공급업체의 이름과 전화번호, 청구서, 매입, 상품 목록(상품 사진과 바코드 포함), 지출(영수증 사진 포함). 이는 앱의 핵심 데이터이며, 장부 관리가 작동하는 방식입니다.';

  @override
  String get ppCollectDevice => '기기 및 진단 데이터: 푸시 알림 토큰(재고 부족, 연체 결제, 일일 요약 알림용)과 Firebase Crashlytics를 통한 충돌 보고서(기기 정보 및 스택 트레이스). 앱이 충돌하면 자동으로 전송됩니다.';

  @override
  String ppCollectAi(String askShop) {
    return 'AI 기능: $askShop, AI 아침 브리핑, AI 청구서/매입 스캐너는 답변, 요약 또는 추출된 항목을 생성하기 위해 관련 업무 데이터의 스냅샷(보고서 수치 또는 청구서 사진)을 Google의 Gemini API로 보냅니다. 이 데이터는 응답을 생성하기 위해 Google이 처리하며, 당사와 Google 모두 Google의 표준 API 약관 범위를 벗어나 모델 학습에 사용하지 않습니다.';
  }

  @override
  String get ppDontH => '하지 않는 일';

  @override
  String get ppDontLocation => '위치를 추적하지 않습니다.';

  @override
  String get ppDontAds => '광고 네트워크나 행동 분석/세션 녹화 도구를 사용하지 않습니다.';

  @override
  String get ppDontSell => '사용자의 데이터나 고객의 데이터를 누구에게도 판매하지 않습니다.';

  @override
  String get ppWhereH => '데이터 저장 위치';

  @override
  String get ppWhereDb => '데이터베이스: Neon(Postgres), 제3자 클라우드 데이터베이스 제공업체.';

  @override
  String get ppWhereFirebase => '인증, 푸시 알림, 충돌 보고서, 사진 저장: Firebase(Google).';

  @override
  String get ppWhereAi => 'AI 처리: Google Gemini API.';

  @override
  String ppWhereEmail(String adminPanel) {
    return '청구서 이메일: 매장 관리자가 $adminPanel에서 설정한 SMTP 계정을 통해 발송됩니다. 메일링 리스트는 운영하지 않으며, 이 이메일은 대량 마케팅이 아니라 기존 고객에게 보내는 개별 청구서/명세서입니다.';
  }

  @override
  String get ppYoursH => '사용자의 데이터, 고객의 데이터';

  @override
  String get ppYours => '입력하는 모든 정보(고객, 공급업체, 청구서, 상품)는 매장의 소유입니다. Book-keep을 쓰는 다른 매장은 볼 수 없습니다. 만든 직원 계정은 허용한 범위만 볼 수 있습니다.';

  @override
  String get ppControlsH => '사용자 제어';

  @override
  String ppControlExport(String path) {
    return '데이터 내보내기 또는 백업: $path';
  }

  @override
  String ppControlDelete(String path) {
    return '계정 삭제: $path. 이는 로그인 정보만 삭제하며, 매장의 업무 기록(청구서, 고객, 상품 등)은 삭제되지 않습니다. 직원을 삭제해도 그 직원이 만든 기록이 삭제되지 않는 것과 같습니다.';
  }

  @override
  String ppControlNotif(String path) {
    return '알림: 유형별로 $path에서 끌 수 있습니다.';
  }

  @override
  String get ppChildrenH => '아동';

  @override
  String get ppChildren => 'Book-keep은 매장 주인과 직원을 위한 업무 도구입니다. 아동을 대상으로 하지 않으며, 아동이 의도적으로 사용하지 않습니다.';

  @override
  String get ppChangesH => '정책 변경';

  @override
  String get ppChanges => '수집하는 정보나 전송 대상이 바뀌면 이 페이지를 업데이트하고 상단의 날짜를 변경합니다.';

  @override
  String get ppContactH => '문의';

  @override
  String ppContact(String email) {
    return '이 정책 또는 데이터에 관한 질문: $email';
  }

  @override
  String get waHello => '안녕하세요!';

  @override
  String waHelloNamed(String name) {
    return '$name님, 안녕하세요.';
  }

  @override
  String get gstTaxable => '과세 대상';

  @override
  String get gstTax => '세금';

  @override
  String get gstTaxableValue => '과세 금액';

  @override
  String get gstTotalTax => '총 세금';

  @override
  String get gstTotalItc => '총 매입세액 공제';

  @override
  String get gstExempt => '면세 매출';

  @override
  String get gstNetPayable => '납부할 순세액';

  @override
  String get unknownName => '알 수 없음';

  @override
  String get unitPiece => '개';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => '미터';

  @override
  String get unitBox => '상자';

  @override
  String get unitDozen => '다스';

  @override
  String get unitLiter => '리터';

  @override
  String get unitBag => '포대';

  @override
  String deleteSupplierMessage(String name) {
    return '$name와(과) 모든 구매 기록을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';
  }
}
