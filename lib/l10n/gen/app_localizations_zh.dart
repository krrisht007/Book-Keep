// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get navHome => '首页';

  @override
  String get navCustomers => '客户';

  @override
  String get navItems => '商品';

  @override
  String get navSuppliers => '供应商';

  @override
  String get navReports => '报表';

  @override
  String get navSettings => '设置';

  @override
  String get settingsShopDetailsTitle => '店铺详情';

  @override
  String get settingsShopDetailsSubtitle => '显示在您的发票上。';

  @override
  String get settingsShopNameLabel => '店铺名称';

  @override
  String get settingsShopAddressLabel => '店铺地址';

  @override
  String get settingsPhoneLabel => '电话';

  @override
  String get settingsSaveShopDetails => '保存店铺详情';

  @override
  String get settingsAppearanceTitle => '外观';

  @override
  String get settingsAppearanceSubtitle => '为整个应用选择主题。';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '系统';

  @override
  String get settingsLanguageTitle => '语言';

  @override
  String get settingsLanguageSubtitle => '选择应用的显示语言。';

  @override
  String get sortNameNewest => '排序：名称 / 最新';

  @override
  String get addCustomer => '添加客户';

  @override
  String get importCsv => '导入 CSV';

  @override
  String get searchShop => '搜索店铺';

  @override
  String get scanToFindItem => '扫码查找商品';

  @override
  String get bulkAdd => '批量添加';

  @override
  String get updateStock => '更新库存';

  @override
  String get printLabels => '打印标签';

  @override
  String get mergeDuplicates => '合并重复项';

  @override
  String get addSupplier => '添加供应商';

  @override
  String get scanPurchaseInvoice => '扫描采购发票';

  @override
  String askNoAnswer(String reason) {
    return '无法获得回答：$reason';
  }

  @override
  String couldNotConnect(String error) {
    return '无法连接：$error';
  }

  @override
  String get micPermissionNeeded => '语音输入需要麦克风权限。';

  @override
  String get speechUnavailable => '此设备不支持语音识别。';

  @override
  String get askYourShop => '问问你的店';

  @override
  String get close => '关闭';

  @override
  String get askIntro => '想知道店里生意怎么样？问我吧，我会根据您账本里的记录回答。';

  @override
  String get askListening => '正在听…';

  @override
  String get askThinkingWords => '思考中…|处理中…|计算中…|查看账本…|汇总中…|分析数据…';

  @override
  String get askSayQuestion => '说出你的问题 — 点击圆球取消';

  @override
  String briefingRefreshFailed(int code) {
    return '无法刷新简报（$code）。';
  }

  @override
  String get refreshFailedOffline => '无法刷新 — 请检查网络连接。';

  @override
  String get newBillFailed => '无法开始新账单 — 请检查网络后重试。';

  @override
  String setPreferredSupplierFirst(String name) {
    return '请先为 $name 设置首选供应商（点击编辑）。';
  }

  @override
  String get reorderBySupplier => '按供应商补货';

  @override
  String get supplier => '供应商';

  @override
  String itemCount(int count) {
    return '$count 件商品';
  }

  @override
  String get noLowStockWithSupplier => '低库存商品尚未设置首选供应商。';

  @override
  String get thisSupplier => '该供应商';

  @override
  String supplierNoPhone(String name) {
    return '$name 没有电话号码。';
  }

  @override
  String get tabOverview => '概览';

  @override
  String get tabStock => '库存';

  @override
  String get tabMoney => '资金';

  @override
  String get taglineOverview => '今日欠款、库存和现金一目了然。';

  @override
  String get taglineStock => '什么在畅销，什么快卖完。';

  @override
  String get taglineMoney => '支出、对账和收款。';

  @override
  String loadingDashboard(int done, int total) {
    return '正在加载仪表板… $done/$total';
  }

  @override
  String get dashboardLoadFailed => '无法加载仪表板';

  @override
  String get checkConnectionRetry => '请检查网络连接后重试。';

  @override
  String get retry => '重试';

  @override
  String get aiBriefing => 'AI 简报';

  @override
  String get briefingPrompt => '用几句话看看昨天的生意。';

  @override
  String get getBriefing => '获取简报';

  @override
  String get refreshBriefing => '刷新简报';

  @override
  String updatedAt(String time) {
    return '更新于 $time';
  }

  @override
  String get customersUnknown => '— 位客户';

  @override
  String customerCount(int count) {
    return '$count 位客户';
  }

  @override
  String get previousMonth => '上个月';

  @override
  String get nextMonth => '下个月';

  @override
  String get salesMonth => '销售额（本月）';

  @override
  String get outstanding => '欠款';

  @override
  String get profitMonth => '利润（本月）';

  @override
  String get cashToday => '今日现金';

  @override
  String get newBill => '新账单';

  @override
  String get scanHandwrittenBill => '扫描手写账单';

  @override
  String get topOutstanding => '欠款最多';

  @override
  String viewAllInDues(int count) {
    return '在欠款中心查看全部 $count 项';
  }

  @override
  String get lowStockAlerts => '低库存提醒';

  @override
  String get noLowStock => '没有低库存商品 — 库存充足。';

  @override
  String get whatsappAll => '全部发 WhatsApp';

  @override
  String get reorderAll => '全部补货';

  @override
  String suggestReorder(String qty, String unit) {
    return '建议补货 $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return '剩余 $qty $unit';
  }

  @override
  String get reorder => '补货';

  @override
  String get whatsappSupplier => '给供应商发 WhatsApp';

  @override
  String get topItemsByRevenue => '收入最高的商品';

  @override
  String get noSalesYet => '暂无销售记录。';

  @override
  String qtyLabel(String qty) {
    return '数量：$qty';
  }

  @override
  String get monthExpenses => '本月支出';

  @override
  String get noExpensesMonth => '本月暂无支出记录。';

  @override
  String get quickActions => '快捷操作';

  @override
  String get dailyCashReconciliation => '每日现金对账';

  @override
  String get collectMoney => '收款';

  @override
  String changesSavedOffline(int count) {
    return '$count 项更改已离线保存';
  }

  @override
  String get willSyncOnline => '恢复联网后将自动同步';

  @override
  String get syncing => '同步中';

  @override
  String get sync => '同步';

  @override
  String get shopProfile => '店铺资料';

  @override
  String get insights => '洞察';

  @override
  String get notifications => '通知';

  @override
  String get backupExport => '备份与导出';

  @override
  String get adminPanel => '管理面板';

  @override
  String get toolsSync => '工具与同步';

  @override
  String get account => '账户';

  @override
  String get shopDetailsSaved => '店铺信息已保存。';

  @override
  String saveFailed(int code) {
    return '保存失败（$code）';
  }

  @override
  String couldNotSave(String error) {
    return '无法保存：$error';
  }

  @override
  String get logoUpdated => '标志已更新。';

  @override
  String logoUploadFailed(int code) {
    return '标志上传失败（$code）';
  }

  @override
  String couldNotUploadLogo(String error) {
    return '无法上传标志：$error';
  }

  @override
  String get healthGood => '总体状况良好。';

  @override
  String get healthSome => '有几项需要注意。';

  @override
  String get healthMany => '有多项需要注意。';

  @override
  String get shopHealth => '店铺健康度';

  @override
  String get healthIntro => '一个小提醒，而不是又一份报表。';

  @override
  String get couldNotLoadCheckConnection => '无法加载 — 请检查网络连接。';

  @override
  String get itemPhotos => '商品照片';

  @override
  String get barcodes => '条形码';

  @override
  String get lowStockItems => '低库存商品';

  @override
  String get lastBackup => '上次备份';

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String daysAgo(int days) {
    return '$days 天前';
  }

  @override
  String get offlineStatus => '离线状态';

  @override
  String get online => '在线';

  @override
  String get offline => '离线';

  @override
  String get waitingToSync => '等待同步';

  @override
  String get syncNow => '立即同步';

  @override
  String get searchSettings => '搜索设置';

  @override
  String noSettingsMatch(String query) {
    return '没有与“$query”匹配的设置';
  }

  @override
  String get businessInfo => '商户信息';

  @override
  String get payment => '付款';

  @override
  String get shopNameRequired => '店铺名称为必填项';

  @override
  String phoneIncomplete(int digits) {
    return '请输入完整的 $digits 位电话号码';
  }

  @override
  String get jazzcashOptional => 'JazzCash 号码（可选）';

  @override
  String get saved => '已保存！';

  @override
  String get languageSubtitle => '更改应用显示语言';

  @override
  String get notificationsSubtitle => '低库存、逾期付款和每日摘要';

  @override
  String get backupSubtitle => '下载、恢复和导出店铺数据';

  @override
  String get appUpdate => '应用更新';

  @override
  String get appUpdateSubtitle => '检查新版本';

  @override
  String get adminSubtitle => '管理账户和店铺数据';

  @override
  String get accountSubtitle => '登录、密码和用户名';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacySubtitle => '我们收集哪些数据及原因';

  @override
  String get yourShop => '你的店铺';

  @override
  String get uploadingLogo => '正在上传店铺标志';

  @override
  String get logoTapToChange => '店铺标志，点击更换';

  @override
  String get brandTagline => '店里再忙，账也清清楚楚。';

  @override
  String serverError(int code) {
    return '服务器错误：$code';
  }

  @override
  String get deleteCustomer => '删除客户';

  @override
  String deleteCustomerMessage(String name) {
    return '删除 $name 及其所有账单？此操作无法撤销。';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return '无法删除：$detail';
  }

  @override
  String get couldNotDeleteOffline => '无法删除 — 请检查网络后重试。';

  @override
  String get actions => '操作';

  @override
  String get edit => '编辑';

  @override
  String get delete => '删除';

  @override
  String deleteCustomersTitle(int count) {
    return '删除 $count 位客户';
  }

  @override
  String deleteCustomersMessage(int count) {
    return '删除 $count 位客户及其所有账单？此操作无法撤销。';
  }

  @override
  String get deselectAll => '取消全选';

  @override
  String get selectAll => '全选';

  @override
  String selectedCount(int count) {
    return '已选 $count 项';
  }

  @override
  String get cancel => '取消';

  @override
  String get newTag => '新';

  @override
  String get csvNeedsRows => 'CSV 需要一行表头和至少一位客户。';

  @override
  String get csvNeedsName => 'CSV 表头必须包含 \"name\" 列。';

  @override
  String csvLineMissingName(int line) {
    return '第 $line 行：缺少名称 — 请修正文件后重试。';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return '第 $line 行：credit_limit 无效 \"$value\" — 请修正文件后重试。';
  }

  @override
  String get importCustomers => '导入客户';

  @override
  String importCustomersConfirm(int count, String file) {
    return '在 \"$file\" 中找到 $count 位客户。全部导入？';
  }

  @override
  String get importAction => '导入';

  @override
  String importedCustomers(int count) {
    return '已导入 $count 位客户。';
  }

  @override
  String importFailed(String detail) {
    return '导入失败：$detail';
  }

  @override
  String importFailedOffline(String error) {
    return '导入失败 — 无法连接：$error';
  }

  @override
  String get noPhone => '无电话';

  @override
  String get offlineShowingSaved => '离线 — 显示已保存的副本';

  @override
  String get searchCustomersHint => '搜索客户或电话...';

  @override
  String get noCustomersYet => '还没有客户。点击 + 添加。';

  @override
  String get noCustomersMatch => '没有与搜索匹配的客户。';

  @override
  String get owesMoney => '有欠款';

  @override
  String get settledUp => '已结清';

  @override
  String couldNotLoadLabel(String error, String what) {
    return '无法加载$what：$error';
  }

  @override
  String get takePhoto => '拍照';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get back => '返回';

  @override
  String callPhone(String phone) {
    return '致电 $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp $phone';
  }

  @override
  String get clearSearch => '清除搜索';

  @override
  String get askHint => '例如：我这个月赚了多少？';

  @override
  String get acctTurnOffLockTitle => '关闭应用锁？';

  @override
  String get acctTurnOffLockBody => '任何拿到这部手机的人都可以不输入 PIN 直接打开应用。';

  @override
  String get acctTurnOff => '关闭';

  @override
  String get acctSetPinTitle => '设置 PIN';

  @override
  String get acctPinLabel => '4-6 位 PIN';

  @override
  String get acctPinMin => '至少 4 位数字';

  @override
  String get acctConfirmPin => '确认 PIN';

  @override
  String get acctPinMismatch => '两次输入的 PIN 不一致';

  @override
  String get acctSetPin => '设置 PIN';

  @override
  String get acctBiometricTitle => '同时使用指纹/面部识别？';

  @override
  String get acctBiometricBody => '生物识别失败时，您仍可使用 PIN。';

  @override
  String get acctNoThanks => '不用了';

  @override
  String get acctEnable => '启用';

  @override
  String get acctSetPasswordTitle => '设置密码';

  @override
  String get acctSetPasswordIntro => '设置密码后，下次除了 Google，您也可以用邮箱 + 密码登录。';

  @override
  String get acctPassword => '密码';

  @override
  String get acctPasswordMin => '至少需要 6 个字符';

  @override
  String get acctConfirmPassword => '确认密码';

  @override
  String get acctPasswordsMismatch => '两次输入的密码不一致';

  @override
  String get acctSetPasswordButton => '设置密码';

  @override
  String get acctPasswordSet => '密码已设置——现在您也可以用它登录。';

  @override
  String acctCouldNotSetPassword(String error) {
    return '无法设置密码：$error';
  }

  @override
  String get acctChangePasswordTitle => '修改密码';

  @override
  String get acctCurrentPassword => '当前密码';

  @override
  String get acctRequired => '必填';

  @override
  String get acctNewPassword => '新密码';

  @override
  String get acctConfirmNewPassword => '确认新密码';

  @override
  String get acctChange => '修改';

  @override
  String get acctPasswordChanged => '密码已修改。';

  @override
  String get acctWrongPassword => '当前密码不正确。';

  @override
  String acctCouldNotChangePassword(String error) {
    return '无法修改密码：$error';
  }

  @override
  String get acctChangeUsernameTitle => '修改用户名';

  @override
  String get acctUsername => '用户名';

  @override
  String get acctUsernameEmpty => '用户名不能为空';

  @override
  String get acctUsernameChanged => '用户名已修改。';

  @override
  String get acctChangeEmailTitle => '修改邮箱';

  @override
  String get acctNewEmail => '新邮箱';

  @override
  String get acctValidEmail => '请输入有效的邮箱';

  @override
  String get acctRequiredConfirm => '需要验证是您本人';

  @override
  String get acctGoogleConfirmFirst => '系统会先要求您通过 Google 验证。';

  @override
  String acctCheckEmail(String email) {
    return '请查看 $email，其中有确认更改的链接。';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => '密码登录';

  @override
  String acctRemoveTitle(String provider) {
    return '移除$provider？';
  }

  @override
  String acctRemoveBody(String provider) {
    return '您将无法再使用$provider登录此账号。';
  }

  @override
  String get acctRemove => '移除';

  @override
  String acctRemoved(String provider) {
    return '已移除$provider。';
  }

  @override
  String get acctSignedIn => '已登录';

  @override
  String get acctEmailNotVerified => '邮箱尚未验证。';

  @override
  String get acctVerificationSent => '验证邮件已发送。';

  @override
  String get acctResend => '重新发送';

  @override
  String get acctSectionSignIn => '登录与安全';

  @override
  String get acctRowChangeUsername => '修改用户名';

  @override
  String get acctRowChangeEmail => '修改邮箱';

  @override
  String get acctRowSetPassword => '设置密码';

  @override
  String get acctRowChangePassword => '修改密码';

  @override
  String get acctRowUnlinkGoogle => '解除 Google 关联';

  @override
  String get acctRowRemovePassword => '移除密码';

  @override
  String get acctRowAppLock => '应用锁（PIN）';

  @override
  String get acctRowBiometric => '使用指纹/面部识别';

  @override
  String get acctSignOutTitle => '退出登录？';

  @override
  String get acctSignOutBody => '退出后需要重新登录才能使用应用。';

  @override
  String get acctSignOut => '退出登录';

  @override
  String get acctDeleteAccount => '删除账号';

  @override
  String get acctDeleting => '正在删除...';

  @override
  String get acctDeleteTitle => '删除账号？';

  @override
  String get acctDeleteBody => '这将永久删除您的登录凭据。您需要重新注册才能使用应用。此操作无法撤销。';

  @override
  String acctCouldNotDelete(String error) {
    return '无法删除账号：$error';
  }

  @override
  String get itmNotFoundTitle => '未找到商品';

  @override
  String itmNotFoundBody(String barcode) {
    return '没有条码为 $barcode 的商品。现在将其添加为新商品吗？';
  }

  @override
  String get itmAddItem => '添加商品';

  @override
  String get itmEditItem => '编辑商品';

  @override
  String get itmMergeTitle => '合并重复商品';

  @override
  String get itmMergeBody => '同名商品将合并到最早的条目中，库存数量会相加。此操作无法撤销。';

  @override
  String get itmMerge => '合并';

  @override
  String get itmNoDuplicates => '没有发现重复商品。';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已合并 $count 个重复商品。',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => '删除商品';

  @override
  String get itmCannotUndo => '此操作无法撤销。';

  @override
  String get itmDeleteOffline => '无法删除——请检查网络连接后重试。';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 个商品',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 个商品？此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return '无法上传照片（$code）';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return '无法上传照片：$error';
  }

  @override
  String get itmNoBarcodes => '还没有商品设置条码。';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '打印 $count 个标签',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => '搜索商品或分类...';

  @override
  String get itmStopListening => '停止聆听';

  @override
  String get itmVoiceSearch => '语音搜索';

  @override
  String get itmSort => '排序';

  @override
  String get itmSortName => '名称（A-Z）';

  @override
  String get itmSortStockLow => '库存：从低到高';

  @override
  String get itmSortRecent => '最近添加';

  @override
  String get itmFilterAll => '全部';

  @override
  String get itmFilterLowStock => '库存不足';

  @override
  String get itmNoItemsYet => '还没有商品。点按 + 添加。';

  @override
  String get itmNoItemsMatch => '没有与搜索匹配的商品。';

  @override
  String get itmNoPriceChanges => '尚无价格变动记录。';

  @override
  String get itmNoStockCorrections => '尚无库存修正记录。';

  @override
  String get itmResetHistory => '重置记录';

  @override
  String get itmResetHistoryMsg => '要重置此商品的记录吗？此操作无法撤销。';

  @override
  String get itmSendPdf => '以 PDF 发送';

  @override
  String get itmNoteOptional => '备注（可选）';

  @override
  String get itmNoteHint => '为此次更改添加备注';

  @override
  String get itmRemoveEntry => '移除记录';

  @override
  String get itmRemoveEntryMsg => '要从记录中移除此条吗？此操作无法撤销。';

  @override
  String get itmEditEntry => '编辑记录';

  @override
  String get itmPrevQty => '调整前';

  @override
  String get itmNewQty => '调整后';

  @override
  String itmCost(String amount) {
    return '成本：$amount';
  }

  @override
  String get itmMore => '更多';

  @override
  String get itmMenuPrintLabel => '打印标签';

  @override
  String get itmMenuDuplicate => '复制';

  @override
  String get itmMenuPriceHistory => '价格记录';

  @override
  String get itmMenuStockHistory => '库存调整记录';

  @override
  String itmLowStockBadge(int count) {
    return '库存不足 $count 个';
  }

  @override
  String itmStockLine(String qty) {
    return '库存：$qty';
  }

  @override
  String get itmOfflineSaved => '离线——商品已保存在此设备上，恢复联网后将自动同步';

  @override
  String get itmItemName => '商品名称';

  @override
  String get itmNameRequired => '名称为必填项';

  @override
  String get itmPricePkr => '价格 (PKR)';

  @override
  String get itmPriceRequired => '价格为必填项';

  @override
  String get itmValidNumber => '请输入有效数字';

  @override
  String get itmUnit => '单位';

  @override
  String get itmCategoryHint => '分类（选填，例如 水管）';

  @override
  String get itmPreferredSupplier => '首选供应商（选填）';

  @override
  String get itmPreferredSupplierHelper => '用于一键补货';

  @override
  String get itmClear => '清除';

  @override
  String get itmHsn => 'HSN 编码（选填）';

  @override
  String get itmGstRate => 'GST 税率 %（选填）';

  @override
  String get itmBarcodeOptional => '条码（选填）';

  @override
  String get itmScanOrType => '扫描或输入';

  @override
  String get itmScanBarcode => '扫描条码';

  @override
  String get itmPurchaseCost => '进货成本（每单位）';

  @override
  String get itmPurchaseCostHint => '购进库存时您支付的金额';

  @override
  String get itmWholesale => '批发价（选填）';

  @override
  String get itmContractor => '承包商价（选填）';

  @override
  String get itmFallsBack => '未填写时使用普通价格';

  @override
  String get itmStockQty => '库存数量';

  @override
  String get itmLowStockAlert => '库存不足提醒低于';

  @override
  String get itmFrequently => '经常一起购买';

  @override
  String get itmSaveChanges => '保存更改';

  @override
  String get itmSaveItem => '保存商品';

  @override
  String get itmPhotoSemantics => '商品照片，点按更换';

  @override
  String get cdUpdateStatusTitle => '更新付款状态';

  @override
  String get cdMarkPaidQ => '将此账单标记为已付款？';

  @override
  String get cdMarkUnpaidQ => '将此账单标记为未付款？';

  @override
  String get cdConfirm => '确认';

  @override
  String cdCouldNotUpdate(String detail) {
    return '无法更新：$detail';
  }

  @override
  String get cdOfflineChangeSaved => '离线——更改已保存在此设备上，恢复联网后将自动同步';

  @override
  String get cdConvertTitle => '转为账单';

  @override
  String get cdConvertBody => '这会扣减这些商品的库存，并把报价单变成正式账单。继续吗？';

  @override
  String get cdConvert => '转换';

  @override
  String cdCouldNotConvert(String detail) {
    return '无法转换：$detail';
  }

  @override
  String get cdReturnItems => '退货';

  @override
  String get cdReturnHint => '设置每件商品的退货数量。保持为 0 则仍算已售出。';

  @override
  String get cdDecreaseQty => '减少数量';

  @override
  String get cdIncreaseQty => '增加数量';

  @override
  String get cdCreditTotal => '贷项合计';

  @override
  String get cdReturnSelected => '退回所选';

  @override
  String cdCouldNotReturn(String detail) {
    return '无法退货：$detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return '无法作废：$detail';
  }

  @override
  String get cdNoPreviousBill => '没有可重复的上一张账单';

  @override
  String cdCouldNotLoadLast(String detail) {
    return '无法加载上一张账单：$detail';
  }

  @override
  String get cdInvoiceEmailed => '发票已通过邮件发送给客户。';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return '无法通过邮件发送发票：$detail';
  }

  @override
  String get cdStatementEmailed => '对账单已通过邮件发送给客户。';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return '无法通过邮件发送对账单：$detail';
  }

  @override
  String get cdDeleteBillTitle => '删除账单';

  @override
  String get cdBillVoided => '已作废';

  @override
  String get cdBillReturn => '退货';

  @override
  String get cdBillQuote => '报价';

  @override
  String get cdBillPaid => '已付款';

  @override
  String get cdBillPartial => '部分付款';

  @override
  String get cdBillUnpaid => '未付款';

  @override
  String get cdBill => '账单';

  @override
  String cdVoidedReason(String reason) {
    return '已作废：$reason';
  }

  @override
  String get cdViewInvoice => '查看发票';

  @override
  String get cdEmailInvoice => '邮件发送发票';

  @override
  String get cdEditBill => '编辑账单';

  @override
  String get cdReturnBill => '退回账单';

  @override
  String get cdVoidBill => '作废账单';

  @override
  String get cdNoItems => '没有商品';

  @override
  String get cdRepeatLast => '重复上一张账单';

  @override
  String get cdLedgerPdf => '账本 PDF';

  @override
  String get cdEmailStatement => '邮件发送对账单';

  @override
  String get cdCollectPayment => '收款';

  @override
  String get cdSendReminder => '发送 WhatsApp 提醒';

  @override
  String get cdTotalBilled => '开单合计';

  @override
  String get cdPaid => '已付';

  @override
  String get cdNoBills => '暂无账单';

  @override
  String get cdBillActions => '账单操作';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '已使用信用额度 $limit 中的 $outstanding';
  }

  @override
  String get cdVoidBody => '账单将从余额和报表中移除，但保留在历史记录中。库存将恢复。此操作无法撤销。';

  @override
  String get cdReason => '原因（选填）';

  @override
  String get frmOfflineCustomer => '离线——客户已保存在此设备上，恢复联网后将自动同步';

  @override
  String get frmOfflineSupplier => '离线——供应商已保存在此设备上，恢复联网后将自动同步';

  @override
  String get frmEditCustomer => '编辑客户';

  @override
  String get frmCustomerName => '客户名称';

  @override
  String get frmPhoneOptional => '电话（选填）';

  @override
  String get frmCreditLimit => '信用额度 (PKR，选填)';

  @override
  String get frmCreditHelper => '该客户余额超过此值时提醒';

  @override
  String get frmPriceTier => '价格等级';

  @override
  String get frmRetail => '零售';

  @override
  String get frmWholesale => '批发';

  @override
  String get frmContractor => '承包商';

  @override
  String get frmPriceTierHelper => '为该客户开单时自动填入哪种商品价格';

  @override
  String get frmStrn => 'STRN（选填）';

  @override
  String get frmStrnCustomer => '用于发票的 13 位销售税注册号';

  @override
  String get frmStrnSupplier => '用于采购账单的 13 位销售税注册号';

  @override
  String get frmAddress => '地址（选填）';

  @override
  String get frmEmail => '邮箱（选填）';

  @override
  String get frmEmailHelper => '可向该客户邮件发送发票或对账单';

  @override
  String get frmSaveCustomer => '保存客户';

  @override
  String get frmEditSupplier => '编辑供应商';

  @override
  String get frmSupplierName => '供应商名称';

  @override
  String get frmSaveSupplier => '保存供应商';

  @override
  String get sdDeletePurchaseTitle => '删除采购单';

  @override
  String get sdDeletePurchaseBody => '此采购单的库存将恢复。此操作无法撤销。';

  @override
  String get sdReturnToSupplier => '退货给供应商';

  @override
  String get sdReturnHint => '设置每件商品要退回的数量。保持为 0 则留下。';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return '无法标记为已收货：$detail';
  }

  @override
  String get sdMarkPaidQ => '将此采购单标记为已付款？';

  @override
  String get sdMarkUnpaidQ => '将此采购单标记为未付款？';

  @override
  String get sdTotalPurchased => '采购合计';

  @override
  String get sdPayable => '应付';

  @override
  String sdPayableAmount(String amount) {
    return '应付 $amount';
  }

  @override
  String get sdNoPurchases => '暂无采购单';

  @override
  String get sdPo => '采购单';

  @override
  String get sdDraftPo => '采购单草稿';

  @override
  String get sdPurchase => '采购';

  @override
  String get sdDraftNote => '采购单草稿——尚未收货，库存和成本暂未更新。';

  @override
  String get sdReturnNote => '向供应商退货 / 贷项通知单。';

  @override
  String get sdMarkReceived => '标记为已收货';

  @override
  String get sdEditPurchase => '编辑采购单';

  @override
  String get sdPurchaseActions => '采购单操作';

  @override
  String get slDeleteSupplier => '删除供应商';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 个供应商',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 个供应商及其所有采购单？此操作无法撤销。',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'CSV 需要一行表头，外加至少一个供应商。';

  @override
  String get slImportTitle => '导入供应商';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '在“$file”中找到 $count 个供应商。全部导入吗？',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已导入 $count 个供应商。',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => '还没有供应商。点按 + 添加。';

  @override
  String get slSearchHint => '搜索供应商或电话...';

  @override
  String get slNoMatch => '没有与搜索匹配的供应商。';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个供应商',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => '供应商欠款';

  @override
  String get sduNothingOwed => '没有欠供应商的款项 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '欠 $count 个供应商',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '距最早的未付采购单 $days 天',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 天';

  @override
  String get duBucket1 => '30–60 天';

  @override
  String get duBucket2 => '60 天以上';

  @override
  String get duTitle => '欠款中心';

  @override
  String get duNoDues => '没有未结欠款 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位客户有欠款',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '距最早的未付账单 $days 天',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '未结 $amount';
  }

  @override
  String get cpNoOutstanding => '该客户没有未结余额';

  @override
  String get cpValidAmount => '请输入有效金额';

  @override
  String cpExceeds(String amount) {
    return '金额超过未结余额 $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return '已向 $name 收款 $amount';
  }

  @override
  String get cpOfflineSaved => '离线——付款已保存在此设备上，恢复联网后将自动同步';

  @override
  String cpOwes(String amount, String name) {
    return '$name 欠款 $amount。将优先抵扣最早的未付账单。';
  }

  @override
  String get cpAmountLabel => '收款金额 (PKR)';

  @override
  String get cpCollect => '收款';

  @override
  String get usNoItems => '没有需要更新的商品。';

  @override
  String get usHelp => '为每件商品设置新库存，然后点按“全部保存”。';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  当前：$qty';
  }

  @override
  String usNew(String qty) {
    return '新：$qty';
  }

  @override
  String get usSubtract => '减 1';

  @override
  String get usAdd => '加 1';

  @override
  String get usNoChanges => '没有更改';

  @override
  String usSaveAll(int count) {
    return '全部保存（已更改 $count 项）';
  }

  @override
  String get srHint => '搜索客户、商品、金额...';

  @override
  String get srFailed => '搜索失败——请检查网络连接。';

  @override
  String get srTitle => '搜索您的店铺';

  @override
  String get srSubtitle => '按姓名或电话查找客户，按金额查找账单。';

  @override
  String srNoMatches(String query) {
    return '未找到“$query”的结果';
  }

  @override
  String get srTryDifferent => '请尝试其他姓名、电话号码或金额。';

  @override
  String get srBills => '账单';

  @override
  String get srNoItemList => '没有商品列表';

  @override
  String get abAddAtLeastOne => '请至少添加一件商品';

  @override
  String get abQuotationUpdated => '报价单已更新！';

  @override
  String get abBillUpdated => '账单已更新！';

  @override
  String get abQuotationSaved => '报价单已保存！';

  @override
  String get abBillCreated => '账单创建成功！';

  @override
  String abTotalAmount(String amount) {
    return '合计：$amount';
  }

  @override
  String get abShare => '分享';

  @override
  String get abDoneReturn => '完成并返回';

  @override
  String get abOverLimitBody => '这会让客户超出其信用额度。';

  @override
  String get abOverLimitTitle => '超出信用额度';

  @override
  String get abBillAnyway => '仍然开单';

  @override
  String get abOfflineBill => '离线——账单已保存在此设备上，恢复联网后将自动同步';

  @override
  String get abEditQuotation => '编辑报价单';

  @override
  String get abEditBill => '编辑账单';

  @override
  String get abNewQuotation => '新建报价单';

  @override
  String get abAddBill => '添加账单';

  @override
  String get abCouldNotLoadItems => '无法加载商品。';

  @override
  String abOverLimitWarn(String limit, String total) {
    return '这张账单会使客户欠款达到 $total，超出其信用额度 $limit。';
  }

  @override
  String get abTapAddItemBill => '点按下方“添加商品”开始开单';

  @override
  String get abNoCatalog => '目录中还没有商品';

  @override
  String get abScan => '扫描';

  @override
  String get abDiscountRs => '折扣 (卢比)';

  @override
  String get abSubtotal => '小计';

  @override
  String get abTotal => '合计';

  @override
  String get abSaveAsQuotation => '保存为报价单';

  @override
  String get abQuotationLocked => '已有的账单无法改回报价单';

  @override
  String get abQuotationNote => '转为账单之前不会扣减库存';

  @override
  String get abPaymentStatus => '付款状态';

  @override
  String get abUnpaid => '未付款';

  @override
  String get abPaymentMethod => '付款方式';

  @override
  String get abCash => '现金';

  @override
  String get abBankTransfer => '银行转账';

  @override
  String get abCheque => '支票';

  @override
  String get abSaveQuotation => '保存报价单';

  @override
  String get abSaveBill => '保存账单';

  @override
  String abAdded(String name) {
    return '已添加 $name';
  }

  @override
  String get apNewItem => '新商品…';

  @override
  String get apNewItemHint => '请先向目录添加新商品';

  @override
  String get apOfflinePurchase => '离线——采购单已保存在此设备上，恢复联网后将自动同步';

  @override
  String get apEditPo => '编辑采购订单';

  @override
  String get apNewPo => '新建采购订单';

  @override
  String get apAddPurchase => '添加采购单';

  @override
  String get apTapAddItem => '点按下方“添加商品”开始采购';

  @override
  String get apSaveAsPo => '保存为采购订单';

  @override
  String get apPoLocked => '已收货的采购单无法改回草稿订单';

  @override
  String get apPoNote => '在货物标记为已收货之前，不会更新库存或成本';

  @override
  String get apUnpaidCredit => '未付款（赊账）';

  @override
  String get apSavePo => '保存采购订单';

  @override
  String get apSavePurchase => '保存采购单';

  @override
  String apCurrentCost(String amount, String unit) {
    return '当前成本：$amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return '未设置成本  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return '扫描失败：服务器错误 $code';
  }

  @override
  String get scOfflineSaved => '离线——照片已保存，恢复联网后将自动识别';

  @override
  String get scStillOffline => '仍处于离线状态';

  @override
  String get scCouldNotCreateCustomer => '无法创建客户——请重试。';

  @override
  String get scCouldNotCreateSupplier => '无法创建供应商——请重试。';

  @override
  String scBillSavedFor(String name) {
    return '已为 $name 保存账单';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return '已保存来自 $name 的采购单';
  }

  @override
  String get scWhichCustomer => '这是哪位客户？';

  @override
  String get scWhichSupplier => '这是哪家供应商？';

  @override
  String scClosestMatch(String name, int score) {
    return '记录中最接近的匹配：$name（相似度 $score%）';
  }

  @override
  String scYesThisIs(String name) {
    return '是的，这是 $name';
  }

  @override
  String get scOtherwiseCustomer => '否则，请新建客户：';

  @override
  String get scOtherwiseSupplier => '否则，请新建供应商：';

  @override
  String get scNoMatchCustomer => '未找到匹配的客户。请新建一个：';

  @override
  String get scNoMatchSupplier => '未找到匹配的供应商。请新建一个：';

  @override
  String get scCustomerName => '客户名称';

  @override
  String get scSupplierName => '供应商名称';

  @override
  String get scCreateNew => '新建';

  @override
  String get scTitleBill => '扫描账单';

  @override
  String get scIntroBill => '拍一张账单的照片就行。手写的也没问题，信德语、乌尔都语、英语都能识别。保存之前你可以先检查一遍。';

  @override
  String get scIntroPurchase => '拍一张供应商发票的照片就行。信德语、乌尔都语、英语都能识别。保存之前你可以先检查一遍。';

  @override
  String get scReadingBill => '正在识别账单…';

  @override
  String get scScanBill => '扫描账单';

  @override
  String get scReadingInvoice => '正在识别发票…';

  @override
  String get scScanInvoice => '扫描发票';

  @override
  String get scQueued => '排队中的扫描';

  @override
  String get scReady => '可供检查';

  @override
  String get scFailed => '失败';

  @override
  String get scWaiting => '等待连接';

  @override
  String get scRetry => '重试';

  @override
  String rpCouldNotLoad(String error) {
    return '无法加载报表：$error';
  }

  @override
  String get rpHeadline => '本月核心数据';

  @override
  String get rpProfitThisMonth => '本月利润';

  @override
  String get rpNoData => '暂无数据';

  @override
  String get rpSalesTax => '销售税';

  @override
  String rpSalesTaxFor(String month) {
    return '$month销售税报表';
  }

  @override
  String get rpViewSalesTax => '查看销售税报表';

  @override
  String get rpQuickReports => '快捷报表';

  @override
  String get rpQuickSub => '直接跳转到指定报表';

  @override
  String get expensesTitle => '支出';

  @override
  String get rpRateCard => '价目表';

  @override
  String get rpDetails => '详情';

  @override
  String get rpDetailsSub => '完整明细与排名';

  @override
  String get rpOutstandingByCustomer => '按客户统计的未结款项';

  @override
  String get rpNoOutstanding => '没有未结余额';

  @override
  String get rpMonthlyTotals => '月度合计';

  @override
  String get rpMostSold => '热销商品';

  @override
  String get rpNoItemsRecorded => '暂无商品记录';

  @override
  String get rpTopCustomers => '按营收排名的客户';

  @override
  String get rpNoSalesRecorded => '暂无销售记录';

  @override
  String get rpTotalOutstanding => '未结合计';

  @override
  String get rpViewCustomers => '查看客户';

  @override
  String get lblInvoice => '发票';

  @override
  String get lblLedger => '账本';

  @override
  String get lblRateCard => '价目表';

  @override
  String get exCsvNeedsRows => 'CSV 需要一行表头，外加至少一条支出。';

  @override
  String get exCsvHeader => 'CSV 表头必须包含 \"description\" 和 \"amount\" 两列。';

  @override
  String exLineBadAmount(int line) {
    return '第 $line 行：缺少描述或金额无效——请修正文件后重试。';
  }

  @override
  String exLineBadDate(String date, int line) {
    return '第 $line 行：日期 \"$date\" 无效——请使用 YYYY-MM-DD。';
  }

  @override
  String get exImportTitle => '导入支出';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '在“$file”中找到 $count 条支出。全部导入吗？',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已导入 $count 条支出。',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return '导入失败：服务器错误 $code';
  }

  @override
  String get exDeleteTitle => '删除支出';

  @override
  String get exAdd => '添加支出';

  @override
  String get exEdit => '编辑支出';

  @override
  String get exDescription => '描述';

  @override
  String get exAmountRs => '金额 (卢比)';

  @override
  String get exCategory => '分类';

  @override
  String exDate(String date) {
    return '日期：$date';
  }

  @override
  String get exRepeats => '每月重复';

  @override
  String get exRepeatsHint => '房租、电费、工资等';

  @override
  String get exReceiptTap => '收据照片，点按更换';

  @override
  String get exReceiptOptional => '收据照片（选填）';

  @override
  String get exEnterValid => '请输入描述和有效金额。';

  @override
  String get exOffline => '离线——支出已保存在此设备上，恢复联网后将自动同步';

  @override
  String get exSave => '保存支出';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '本月有 $count 条定期支出到期',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => '添加';

  @override
  String get exTotal => '支出合计';

  @override
  String exCategoryChip(String name) {
    return '分类：$name';
  }

  @override
  String get exNoneLogged => '暂无支出记录';

  @override
  String exNoneInCategory(String name) {
    return '暂无$name支出';
  }

  @override
  String get exViewReceipt => '查看收据';

  @override
  String get exEditRow => '编辑支出';

  @override
  String get exDeleteRow => '删除支出';

  @override
  String gstServerReturned(String first, String second) {
    return '服务器返回 $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return '无法加载 GST 数据：$error';
  }

  @override
  String gstFailedDownload(int code) {
    return '下载失败 ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '已保存 $filename';
  }

  @override
  String gstSavedDownloads(String filename) {
    return '已保存到 下载/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return '无法下载：$error';
  }

  @override
  String get gstTitle => '销售税报表';

  @override
  String get gstOutwardDetail => '销项销售 — 发票明细';

  @override
  String get gstNoBills => '本月没有账单。';

  @override
  String get gstHsn => 'HSN 汇总';

  @override
  String get gstInvoiceWise => '按发票明细';

  @override
  String get gstMonthly => '月度汇总';

  @override
  String get gstOutwardTaxable => '应税销项供应';

  @override
  String get gstItc => '进项税额抵扣（来自采购）';

  @override
  String get gstSave => '保存';

  @override
  String get rcValidAmount => '请输入有效金额。';

  @override
  String get rcExpected => '预期现金（今日现金销售）';

  @override
  String get rcAlsoCollected => '今日另外收款（未计入钱箱）';

  @override
  String get rcCounted => '钱箱中清点的现金 (卢比)';

  @override
  String get rcCompare => '对比';

  @override
  String get rcMatches => '完全吻合！';

  @override
  String rcExtra(String amount) {
    return '钱箱多出 $amount';
  }

  @override
  String rcMissing(String amount) {
    return '钱箱短缺 $amount';
  }

  @override
  String get pbiTitle => '按商品统计利润';

  @override
  String get pbiNoSales => '暂无销售';

  @override
  String get pbiByCategory => '按分类';

  @override
  String get pbiItemsByProfit => '按利润排序的商品';

  @override
  String get svTitle => '库存估值';

  @override
  String get svNone => '没有库存';

  @override
  String get svItemsByValue => '按价值排序的商品';

  @override
  String svSummary(String items, String units) {
    return '$items 种商品 · 货架上 $units 件';
  }

  @override
  String svTied(String amount) {
    return '库存占用 $amount';
  }

  @override
  String get svEstimated => '按售价估算';

  @override
  String get bkRestoreTitle => '恢复备份？';

  @override
  String bkRestoreBody(String filename) {
    return '这将用备份文件“$filename”替换所有当前数据。继续吗？';
  }

  @override
  String get bkRestore => '恢复';

  @override
  String get bkRestoreDoneTitle => '恢复完成';

  @override
  String get bkRestoreDoneBody => '您的数据已恢复。';

  @override
  String get bkOk => '确定';

  @override
  String bkRestoreFailed(String detail) {
    return '恢复失败：$detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return '无法恢复：$error';
  }

  @override
  String get bkSaveToDownloads => '保存到下载';

  @override
  String get bkIntroAdmin => '您的所有数据都在一个数据库文件中。请定期下载副本，出现问题时可以恢复。';

  @override
  String get bkIntroStaff => '完整的数据库备份与恢复仅限管理员。请联系管理员，或在下方按需导出为 CSV。';

  @override
  String get bkBackupDb => '备份数据库';

  @override
  String get bkBackupDbSub => '将整个数据库下载为一个文件并分享（WhatsApp、云盘、邮件）。';

  @override
  String get bkDownloadPhone => '将备份下载到手机';

  @override
  String get bkShareBackup => '分享备份';

  @override
  String get bkAutoTitle => '自动备份';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '服务器上保存了 $count 份每日备份，最近一份来自 $time。它会自动运行——此处无需操作。',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => '选择已保存的备份文件来替换当前数据。';

  @override
  String get bkRestoreFromFile => '从备份文件恢复';

  @override
  String get bkExportCsv => '导出为 CSV';

  @override
  String get bkExportSub => '在 Excel 中打开或分享。';

  @override
  String get bkRangeAll => '账单/支出：全部时间';

  @override
  String bkRangeSome(String end, String start) {
    return '账单/支出：$start 至 $end';
  }

  @override
  String get bkSetRange => '设置范围';

  @override
  String get bkClearRange => '清除范围';

  @override
  String get ntNever => '从未触发';

  @override
  String get ntJustNow => '刚刚';

  @override
  String ntMinutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String ntHoursAgo(int count) {
    return '$count 小时前';
  }

  @override
  String ntDaysAgo(int count) {
    return '$count 天前';
  }

  @override
  String get ntTitle => '智能通知';

  @override
  String get ntTapHint => '点按“立即检查”可触发通知并查看实时结果。';

  @override
  String get ntLowStockSub => '商品低于补货水平时通知。';

  @override
  String get ntCheckNow => '立即检查';

  @override
  String get ntOverdue => '逾期付款提醒';

  @override
  String get ntOverdueSub => '通知前几天的未付账单。';

  @override
  String get ntDaily => '每日经营摘要';

  @override
  String get ntDailySub => '一眼看清昨天的销售、收款和利润。';

  @override
  String get ntSendSummary => '发送摘要';

  @override
  String get ntRunning => '运行中…';

  @override
  String get ntLowStockItems => '库存不足商品';

  @override
  String get ntSales => '销售额';

  @override
  String get ntCollected => '已收款';

  @override
  String get ntProfit => '利润';

  @override
  String get auChecking => '正在检查更新…';

  @override
  String get auLatest => '您使用的已是最新版本。';

  @override
  String get auAvailable => '有可用更新';

  @override
  String auNewer(int code) {
    return 'Book-Keep 的新版本（构建 $code）已就绪。';
  }

  @override
  String get auLater => '稍后';

  @override
  String get auUpdate => '更新';

  @override
  String get auDownloading => '正在下载更新';

  @override
  String auSaved(String name) {
    return '已将 $name 保存到您的下载文件夹。';
  }

  @override
  String get auAllowInstall => '请允许 Book-Keep 安装应用，然后再次点按“更新”。';

  @override
  String get auFailed => '无法更新——请检查网络连接后重试。';

  @override
  String get lgSearch => '搜索语言';

  @override
  String lgNoMatch(String query) {
    return '没有与“$query”匹配的语言';
  }

  @override
  String get alVoided => '作废了一张账单';

  @override
  String get alDeletedBill => '删除了一张账单';

  @override
  String get alReturned => '退回了一张账单';

  @override
  String get alDeletedCustomer => '删除了一位客户';

  @override
  String get alDeletedSupplier => '删除了一家供应商';

  @override
  String get alCreatedAccount => '创建了一个账号';

  @override
  String get alUpdatedAccount => '更新了一个账号';

  @override
  String get alDeletedAccount => '删除了一个账号';

  @override
  String get alTitle => '活动日志';

  @override
  String get alNone => '暂无活动记录';

  @override
  String get blkEnterOne => '请至少输入一件商品';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已成功添加 $count 件商品',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => '批量添加商品';

  @override
  String get blkFormat => '每行一件商品，格式：名称, 价格, 单位, 分类';

  @override
  String get blkOptional => '单位和分类为选填（默认：piece、无）';

  @override
  String get blkAddAll => '添加全部商品';

  @override
  String get prSend => '发送付款提醒';

  @override
  String get prTone => '选择语气：';

  @override
  String get prPolite => '礼貌';

  @override
  String get prStandard => '标准';

  @override
  String get prUrgent => '紧急';

  @override
  String get prPreviewQr => '预览 JazzCash 付款二维码';

  @override
  String get prShareText => '分享文本';

  @override
  String get dsRemaining => '待付';

  @override
  String dsIncludesDiscount(String amount) {
    return '含折扣 $amount';
  }

  @override
  String get dsItems => '商品';

  @override
  String get dsDiscount => '折扣';

  @override
  String get lkWrongPin => 'PIN 错误';

  @override
  String get lkEnterPin => '输入 PIN';

  @override
  String get lkChecking => '正在验证指纹...';

  @override
  String get bcTitle => '扫描条码';

  @override
  String get bcTorchNa => '此设备不支持手电筒';

  @override
  String get bcTorch => '手电筒';

  @override
  String get bcPoint => '请将相机对准条码';

  @override
  String get qrNoNumber => '尚未设置 JazzCash 号码。请在设置中设置，以显示付款二维码。';

  @override
  String get qrPay => '通过 JazzCash 付款';

  @override
  String get qrInvalid => '二维码数据无效';

  @override
  String qrAmount(String amount) {
    return '金额：$amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash：$number';
  }

  @override
  String get qrCopy => '复制 JazzCash 号码';

  @override
  String get qrCopied => 'JazzCash 号码已复制到剪贴板';

  @override
  String get qrHint => '请在您的 JazzCash 应用中扫描或复制此号码进行付款。';

  @override
  String clOwed(String amount) {
    return '未结 $amount';
  }

  @override
  String get lnEnterEmailFirst => '请先在上方输入有效的邮箱。';

  @override
  String get lnResetSent => '密码重置邮件已发送——请查看收件箱。';

  @override
  String get lnNoAccount => '未找到该邮箱对应的账号。';

  @override
  String get lnWrongPassword => '密码不正确。';

  @override
  String get lnInvalidEmail => '这看起来不是有效的邮箱地址。';

  @override
  String get lnDisabled => '此账号已被停用。';

  @override
  String get lnTooMany => '尝试次数过多——请一分钟后再试。';

  @override
  String get lnNoInternet => '没有网络连接。';

  @override
  String get lnWeakPassword => '密码至少需要 6 个字符。';

  @override
  String get lnCouldNotSignIn => '无法登录，请重试。';

  @override
  String get lnWrongPasswordHint => '密码不正确。请重试，或点按“忘记密码？”。';

  @override
  String get lnWrongEmail => '邮箱不正确——没有使用该地址的账号。';

  @override
  String get lnWrongEmailOrPassword => '邮箱或密码不正确。';

  @override
  String get lnWrongUsername => '用户名不正确——没有使用该名称的账号。';

  @override
  String get lnWelcome => '欢迎回来';

  @override
  String lnSignInTo(String app) {
    return '登录 $app';
  }

  @override
  String get lnEmailOrUsername => '邮箱或用户名';

  @override
  String get lnRemember => '记住我';

  @override
  String get lnForgot => '忘记密码？';

  @override
  String get lnSignIn => '登录';

  @override
  String get lnGoogle => '使用 Google 继续';

  @override
  String get lnNew => '新用户？';

  @override
  String get lnCreate => '创建账号';

  @override
  String suCreated(String email) {
    return '已为 $email 创建账号。已发送验证邮件（可选）。';
  }

  @override
  String suSetup(String app) {
    return '设置 $app';
  }

  @override
  String get suName => '姓名';

  @override
  String get suEmail => '邮箱';

  @override
  String suPhoneDigits(int digits) {
    return '请输入有效的 $digits 位号码';
  }

  @override
  String get suCreateBtn => '创建账号';

  @override
  String get suHaveAccount => '已有账号？';

  @override
  String get suAlreadyExists => '该邮箱已存在账号。';

  @override
  String get suInvalidEmail => '邮箱地址无效。';

  @override
  String get agShow => '显示密码';

  @override
  String get agHide => '隐藏密码';

  @override
  String get adAccounts => '账号';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已注册 $count 个账号',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => '添加';

  @override
  String get adNoAccounts => '未找到账号。';

  @override
  String get adAccountability => '操作追溯';

  @override
  String get adAccountabilitySub => '谁作废、删除或退回了什么，以及账号变更。';

  @override
  String get adActivitySub => '已作废账单、删除、账号变更';

  @override
  String get adServer => '服务器';

  @override
  String get adServerSub => '此应用连接的地址。设置完成后很少需要更改。';

  @override
  String get adServerHint => '模拟器使用 10.0.2.2；真机需要同一 Wi-Fi 下的电脑 IP。更改会影响所有账号。';

  @override
  String get adApiBase => 'API 基础 URL';

  @override
  String get adSaveServer => '保存服务器地址';

  @override
  String get adEmailSetSub => '已设置——员工可以向客户邮件发送发票/对账单。';

  @override
  String get adNotSetUp => '尚未设置。';

  @override
  String get adEmailSetBody => '邮件已设置。员工可以直接向客户邮件发送发票或对账单。';

  @override
  String get adEmailHelp => 'Gmail 地址可配合应用专用密码使用（smtp.gmail.com，端口 587），或使用您邮箱服务商的 SMTP 信息。';

  @override
  String get adSmtpHost => 'SMTP 主机';

  @override
  String get adSmtpPort => 'SMTP 端口';

  @override
  String get adEmailAddress => '邮箱地址';

  @override
  String get adPwKeep => '密码（留空则保持当前密码）';

  @override
  String get adPwApp => '密码（应用专用密码，不是登录密码）';

  @override
  String get adFromName => '发件人名称（选填）';

  @override
  String get adFromHint => '我的五金店';

  @override
  String get adSaving => '正在保存...';

  @override
  String get adSaveEmail => '保存邮件设置';

  @override
  String get adAddAccount => '添加账号';

  @override
  String get adNameOpt => '姓名（选填）';

  @override
  String get adAtLeast6 => '至少 6 个字符';

  @override
  String get adGrantAdmin => '授予管理员权限';

  @override
  String get adCanManage => '可以作废/删除/退货';

  @override
  String get adCanManageHint => '作废或删除账单、退回账单，或删除客户/供应商。管理员始终拥有此权限。';

  @override
  String get adCreate => '创建';

  @override
  String get adAccountCreated => '账号已创建。';

  @override
  String adCreateFailed(String error) {
    return '创建失败：$error';
  }

  @override
  String get adEditAccount => '编辑账号';

  @override
  String get adAdminSwitch => '管理员';

  @override
  String get adAdminHint => '可以打开管理面板';

  @override
  String get adDisabled => '已停用';

  @override
  String get adDisabledHint => '禁止登录';

  @override
  String get adAccountUpdated => '账号已更新。';

  @override
  String adUpdateFailed(String error) {
    return '更新失败：$error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label 将被永久移除，且无法再登录。';
  }

  @override
  String get adAccountDeleted => '账号已删除。';

  @override
  String adDeleteFailed(String error) {
    return '删除失败：$error';
  }

  @override
  String get adBadgeAdmin => '管理员';

  @override
  String get adBadgeDisabled => '已停用';

  @override
  String get adOff => '管理面板已关闭';

  @override
  String get adCheckAgain => '重新检查';

  @override
  String get adAccessRequired => '需要管理员权限';

  @override
  String get adAccessBody => '只有店铺管理员可以管理账号。请向店主申请管理员权限。';

  @override
  String get adCouldNotLoad => '无法加载管理面板。';

  @override
  String get adBadPort => '请输入有效的 SMTP 端口号。';

  @override
  String get adEmailSaved => '邮件设置已保存。';

  @override
  String adEmailSaveFailed(String error) {
    return '无法保存邮件设置：$error';
  }

  @override
  String get adServerEmpty => '服务器地址不能为空。';

  @override
  String get adServerSaved => '服务器地址已保存。各屏幕将在下次加载时使用。';

  @override
  String get lnOr => '或';

  @override
  String get scNotABill => '这看起来不像账单。请用清晰的账单照片再试一次。';

  @override
  String get scNotAnInvoice => '这看起来不像发票。请用清晰的供应商发票照片再试一次。';

  @override
  String get jqOpenFull => '全屏查看';

  @override
  String get jqCopy => '复制号码';

  @override
  String get jqSheetTitle => 'JazzCash 二维码';

  @override
  String get jqSheetHint => '顾客在 JazzCash 应用中扫描此码即可向您付款。';

  @override
  String get jqCheck => '请检查号码';

  @override
  String get askVoice => '语音';

  @override
  String get askVoiceFallbackNote => '正在用手机自带的声音朗读。';

  @override
  String get askPace => '语速';

  @override
  String get askTone => '语气';

  @override
  String get askPaceSlower => '慢一点';

  @override
  String get askPaceNormal => '正常';

  @override
  String get askPaceFaster => '快一点';

  @override
  String get askToneCalm => '平静';

  @override
  String get askToneWarm => '温暖';

  @override
  String get askToneCheerful => '欢快';

  @override
  String qPaymentUpdate(String amount) {
    return '付款更新：$amount';
  }

  @override
  String qCustomer(String name) {
    return '客户：$name';
  }

  @override
  String qSupplier(String name) {
    return '供应商：$name';
  }

  @override
  String qItem(String name) {
    return '商品：$name';
  }

  @override
  String qExpense(String name) {
    return '费用：$name';
  }

  @override
  String qPurchase(String amount) {
    return '采购：$amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return '已收到$name的付款：$amount';
  }

  @override
  String gstAmount(String amount) {
    return '税额 $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return '应税 $taxable  ·  税额 $tax  ·  合计 $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return '收入：$revenue  •  销售成本：$cogs  •  费用：$expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return '您好，$customer，$shop向您问好！您的欠款总额为$amount。谢谢！';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return '您好，$customer，$shop提醒您支付未结余额$amount。请尽快付款。';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return '紧急通知：尊敬的$customer，您在$shop的欠款$amount尚未结清。请立即付款。';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return '通过JazzCash付款：$number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return '来自$shop的发票\n合计：$total\n商品：$items\n状态：$status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return '您好，$supplier，这里是$shop。我们想订购：\n$lines\n\n请确认库存和价格。谢谢。';
  }

  @override
  String ppUpdated(String date) {
    return '最后更新：$date';
  }

  @override
  String get ppWhoH => '我们是谁';

  @override
  String ppWho(String owner, String email) {
    return '$owner，Book-keep 的运营方。\n联系方式：$email';
  }

  @override
  String get ppCollectH => '我们收集什么';

  @override
  String get ppCollectAccount => '账户：电子邮箱、手机号码和用户名，通过 Firebase Authentication 处理。';

  @override
  String get ppCollectShop => '店铺资料：店铺名称、地址、电话号码、JazzCash 号码和店铺标志图片，由店主在设置中填写。';

  @override
  String get ppCollectRecords => '您创建的业务记录：客户和供应商的姓名与电话、账单、进货、商品目录（包括商品照片和条形码）以及支出（包括收据照片）。这是应用的核心数据，记账就是这样运作的。';

  @override
  String get ppCollectDevice => '设备与诊断数据：推送通知令牌（用于库存不足、逾期付款和每日摘要提醒），以及通过 Firebase Crashlytics 收集的崩溃报告（设备信息和堆栈跟踪），在应用崩溃时自动发送。';

  @override
  String ppCollectAi(String askShop) {
    return 'AI 功能：$askShop、AI 晨报以及 AI 账单/进货扫描器会将相关业务数据的快照（报表数字或账单照片）发送到 Google 的 Gemini API，以生成答案、摘要或提取的明细行。这些数据由 Google 处理以生成响应；除 Google 标准 API 条款之外，我们和 Google 均不会将其用于训练模型。';
  }

  @override
  String get ppDontH => '我们不做的事';

  @override
  String get ppDontLocation => '我们不会追踪您的位置。';

  @override
  String get ppDontAds => '我们不使用广告网络，也不使用行为分析或会话回放工具。';

  @override
  String get ppDontSell => '我们不会向任何人出售您的数据或您客户的数据。';

  @override
  String get ppWhereH => '数据存放在哪里';

  @override
  String get ppWhereDb => '数据库：Neon（Postgres），第三方云数据库服务商。';

  @override
  String get ppWhereFirebase => '身份验证、推送通知、崩溃报告、照片存储：Firebase（Google）。';

  @override
  String get ppWhereAi => 'AI 处理：Google Gemini API。';

  @override
  String ppWhereEmail(String adminPanel) {
    return '发票邮件：通过店铺管理员在$adminPanel中配置的 SMTP 账户发送。我们不运营邮件列表，这些邮件是发给您现有客户的一对一发票/对账单，而非群发营销。';
  }

  @override
  String get ppYoursH => '您的数据，您客户的数据';

  @override
  String get ppYours => '您录入的一切（客户、供应商、账单、商品）都属于您的店铺。其他使用 Book-keep 的店铺看不到这些内容。您创建的员工账户只能看到您授权的内容。';

  @override
  String get ppControlsH => '您的控制权';

  @override
  String ppControlExport(String path) {
    return '导出或备份您的数据：$path';
  }

  @override
  String ppControlDelete(String path) {
    return '删除账户：$path。这只会移除您的登录凭据，不会删除店铺的业务记录（账单、客户、商品等），就像移除员工不会删除其创建的记录一样。';
  }

  @override
  String ppControlNotif(String path) {
    return '通知：可在$path中按类型关闭。';
  }

  @override
  String get ppChildrenH => '儿童';

  @override
  String get ppChildren => 'Book-keep 是面向店主和员工的业务工具，并非面向儿童，也不会被儿童有意使用。';

  @override
  String get ppChangesH => '本政策的变更';

  @override
  String get ppChanges => '如果我们收集的内容或数据去向发生变化，我们会更新本页面并修改顶部的日期。';

  @override
  String get ppContactH => '联系我们';

  @override
  String ppContact(String email) {
    return '关于本政策或您的数据的问题：$email';
  }

  @override
  String get waHello => '你好！';

  @override
  String waHelloNamed(String name) {
    return '$name，你好，';
  }

  @override
  String get gstTaxable => '应税额';

  @override
  String get gstTax => '税额';

  @override
  String get gstTaxableValue => '应税价值';

  @override
  String get gstTotalTax => '税额合计';

  @override
  String get gstTotalItc => '进项税额合计';

  @override
  String get gstExempt => '免税销售';

  @override
  String get gstNetPayable => '应缴税额净额';

  @override
  String get unknownName => '未知';

  @override
  String get unitPiece => '件';

  @override
  String get unitKg => '千克';

  @override
  String get unitMeter => '米';

  @override
  String get unitBox => '盒';

  @override
  String get unitDozen => '打';

  @override
  String get unitLiter => '升';

  @override
  String get unitBag => '袋';

  @override
  String deleteSupplierMessage(String name) {
    return '删除$name及其所有采购记录？此操作无法撤销。';
  }
}
