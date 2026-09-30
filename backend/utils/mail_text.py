"""Subject and body of the invoice and account-statement emails, in the app's
languages (plain text, so unlike the PDFs this covers Chinese, Japanese and
Korean too). Unknown languages get English."""

_EN = {
    "invoice_subject": "Invoice {no} from {shop}",
    "invoice_body": "Hi {name},\n\nPlease find attached your invoice ({no}) from {shop}.\n\nThank you for your business.",
    "statement_subject": "Account statement from {shop}",
    "statement_body": "Hi {name},\n\nPlease find attached your account statement from {shop}.\n\nThank you for your business.",
}

_T = {
    "ar": {"invoice_subject": "فاتورة {no} من {shop}", "invoice_body": "مرحباً {name}،\n\nتجد مرفقاً فاتورتك ({no}) من {shop}.\n\nشكراً لتعاملك معنا.", "statement_subject": "كشف الحساب من {shop}", "statement_body": "مرحباً {name}،\n\nتجد مرفقاً كشف حسابك من {shop}.\n\nشكراً لتعاملك معنا."},
    "bn": {"invoice_subject": "{shop} থেকে চালান {no}", "invoice_body": "হ্যালো {name},\n\n{shop} থেকে আপনার চালান ({no}) সংযুক্ত করা হয়েছে।\n\nআপনার ব্যবসার জন্য ধন্যবাদ।", "statement_subject": "{shop} থেকে অ্যাকাউন্ট বিবরণী", "statement_body": "হ্যালো {name},\n\n{shop} থেকে আপনার অ্যাকাউন্ট বিবরণী সংযুক্ত করা হয়েছে।\n\nআপনার ব্যবসার জন্য ধন্যবাদ।"},
    "de": {"invoice_subject": "Rechnung {no} von {shop}", "invoice_body": "Hallo {name},\n\nanbei finden Sie Ihre Rechnung ({no}) von {shop}.\n\nVielen Dank für Ihren Einkauf.", "statement_subject": "Kontoauszug von {shop}", "statement_body": "Hallo {name},\n\nanbei finden Sie Ihren Kontoauszug von {shop}.\n\nVielen Dank für Ihren Einkauf."},
    "es": {"invoice_subject": "Factura {no} de {shop}", "invoice_body": "Hola {name},\n\nAdjuntamos su factura ({no}) de {shop}.\n\nGracias por su compra.", "statement_subject": "Estado de cuenta de {shop}", "statement_body": "Hola {name},\n\nAdjuntamos su estado de cuenta de {shop}.\n\nGracias por su compra."},
    "fa": {"invoice_subject": "فاکتور {no} از {shop}", "invoice_body": "سلام {name}،\n\nفاکتور شما ({no}) از {shop} پیوست است.\n\nاز خرید شما سپاسگزاریم.", "statement_subject": "صورت‌حساب از {shop}", "statement_body": "سلام {name}،\n\nصورت‌حساب شما از {shop} پیوست است.\n\nاز خرید شما سپاسگزاریم."},
    "fr": {"invoice_subject": "Facture {no} de {shop}", "invoice_body": "Bonjour {name},\n\nVeuillez trouver ci-joint votre facture ({no}) de {shop}.\n\nMerci pour votre confiance.", "statement_subject": "Relevé de compte de {shop}", "statement_body": "Bonjour {name},\n\nVeuillez trouver ci-joint votre relevé de compte de {shop}.\n\nMerci pour votre confiance."},
    "hi": {"invoice_subject": "{shop} से चालान {no}", "invoice_body": "नमस्ते {name},\n\n{shop} से आपका चालान ({no}) संलग्न है।\n\nआपके व्यापार के लिए धन्यवाद।", "statement_subject": "{shop} से खाता विवरण", "statement_body": "नमस्ते {name},\n\n{shop} से आपका खाता विवरण संलग्न है।\n\nआपके व्यापार के लिए धन्यवाद।"},
    "id": {"invoice_subject": "Faktur {no} dari {shop}", "invoice_body": "Halo {name},\n\nTerlampir faktur Anda ({no}) dari {shop}.\n\nTerima kasih atas kepercayaan Anda.", "statement_subject": "Laporan rekening dari {shop}", "statement_body": "Halo {name},\n\nTerlampir laporan rekening Anda dari {shop}.\n\nTerima kasih atas kepercayaan Anda."},
    "ja": {"invoice_subject": "{shop}からの請求書 {no}", "invoice_body": "{name}様\n\n{shop}からの請求書（{no}）を添付いたします。\n\nご利用ありがとうございます。", "statement_subject": "{shop}からの取引明細", "statement_body": "{name}様\n\n{shop}からの取引明細を添付いたします。\n\nご利用ありがとうございます。"},
    "ko": {"invoice_subject": "{shop}의 청구서 {no}", "invoice_body": "{name}님,\n\n{shop}의 청구서({no})를 첨부합니다.\n\n이용해 주셔서 감사합니다.", "statement_subject": "{shop}의 거래 내역서", "statement_body": "{name}님,\n\n{shop}의 거래 내역서를 첨부합니다.\n\n이용해 주셔서 감사합니다."},
    "pa": {"invoice_subject": "{shop} ਵੱਲੋਂ ਇਨਵੌਇਸ {no}", "invoice_body": "ਸਤ ਸ੍ਰੀ ਅਕਾਲ {name},\n\n{shop} ਵੱਲੋਂ ਤੁਹਾਡਾ ਇਨਵੌਇਸ ({no}) ਨੱਥੀ ਹੈ।\n\nਤੁਹਾਡੇ ਕਾਰੋਬਾਰ ਲਈ ਧੰਨਵਾਦ।", "statement_subject": "{shop} ਵੱਲੋਂ ਖਾਤਾ ਵੇਰਵਾ", "statement_body": "ਸਤ ਸ੍ਰੀ ਅਕਾਲ {name},\n\n{shop} ਵੱਲੋਂ ਤੁਹਾਡਾ ਖਾਤਾ ਵੇਰਵਾ ਨੱਥੀ ਹੈ।\n\nਤੁਹਾਡੇ ਕਾਰੋਬਾਰ ਲਈ ਧੰਨਵਾਦ।"},
    "ps": {"invoice_subject": "د {shop} له خوا بل {no}", "invoice_body": "سلام {name}،\n\nد {shop} له خوا ستاسو بل ({no}) ضمیمه شوی دی.\n\nستاسو د سوداګرۍ مننه.", "statement_subject": "د {shop} له خوا د حساب بیان", "statement_body": "سلام {name}،\n\nد {shop} له خوا ستاسو د حساب بیان ضمیمه شوی دی.\n\nستاسو د سوداګرۍ مننه."},
    "pt": {"invoice_subject": "Fatura {no} de {shop}", "invoice_body": "Olá {name},\n\nSegue em anexo sua fatura ({no}) da {shop}.\n\nObrigado pela preferência.", "statement_subject": "Extrato de conta da {shop}", "statement_body": "Olá {name},\n\nSegue em anexo seu extrato de conta da {shop}.\n\nObrigado pela preferência."},
    "ru": {"invoice_subject": "Счёт {no} от {shop}", "invoice_body": "Здравствуйте, {name}!\n\nВо вложении ваш счёт ({no}) от {shop}.\n\nСпасибо за покупку.", "statement_subject": "Выписка по счёту от {shop}", "statement_body": "Здравствуйте, {name}!\n\nВо вложении ваша выписка по счёту от {shop}.\n\nСпасибо за покупку."},
    "sd": {"invoice_subject": "{shop} طرفان انوائس {no}", "invoice_body": "ڀليڪار {name}،\n\n{shop} طرفان توهان جي انوائس ({no}) ڳنڍيل آهي.\n\nتوهان جي واپار لاءِ مهرباني.", "statement_subject": "{shop} طرفان کاتو بيان", "statement_body": "ڀليڪار {name}،\n\n{shop} طرفان توهان جو کاتو بيان ڳنڍيل آهي.\n\nتوهان جي واپار لاءِ مهرباني."},
    "sw": {"invoice_subject": "Ankara {no} kutoka {shop}", "invoice_body": "Habari {name},\n\nTafadhali pata ankara yako ({no}) kutoka {shop} iliyoambatishwa.\n\nAsante kwa biashara yako.", "statement_subject": "Taarifa ya akaunti kutoka {shop}", "statement_body": "Habari {name},\n\nTafadhali pata taarifa yako ya akaunti kutoka {shop} iliyoambatishwa.\n\nAsante kwa biashara yako."},
    "tr": {"invoice_subject": "{shop} faturası {no}", "invoice_body": "Merhaba {name},\n\n{shop} tarafından düzenlenen faturanız ({no}) ekte yer almaktadır.\n\nİşiniz için teşekkürler.", "statement_subject": "{shop} hesap ekstresi", "statement_body": "Merhaba {name},\n\n{shop} hesap ekstreniz ekte yer almaktadır.\n\nİşiniz için teşekkürler."},
    "ur": {"invoice_subject": "{shop} کی طرف سے انوائس {no}", "invoice_body": "السلام علیکم {name}،\n\n{shop} کی طرف سے آپ کی انوائس ({no}) منسلک ہے۔\n\nآپ کے کاروبار کا شکریہ۔", "statement_subject": "{shop} کی طرف سے کھاتہ اسٹیٹمنٹ", "statement_body": "السلام علیکم {name}،\n\n{shop} کی طرف سے آپ کا کھاتہ اسٹیٹمنٹ منسلک ہے۔\n\nآپ کے کاروبار کا شکریہ۔"},
    "zh": {"invoice_subject": "{shop}的发票 {no}", "invoice_body": "{name}，您好！\n\n随信附上{shop}开具的发票（{no}）。\n\n感谢您的惠顾。", "statement_subject": "{shop}的对账单", "statement_body": "{name}，您好！\n\n随信附上{shop}的对账单。\n\n感谢您的惠顾。"},
}


def _text(lang, key, **values):
    table = _T.get((lang or "en").strip().lower()[:2], _EN)
    return table.get(key, _EN[key]).format(**values)


def invoice_mail(lang, name, invoice_no, shop):
    return (
        _text(lang, "invoice_subject", no=invoice_no, shop=shop),
        _text(lang, "invoice_body", name=name, no=invoice_no, shop=shop),
    )


def statement_mail(lang, name, shop):
    return (
        _text(lang, "statement_subject", shop=shop),
        _text(lang, "statement_body", name=name, shop=shop),
    )
