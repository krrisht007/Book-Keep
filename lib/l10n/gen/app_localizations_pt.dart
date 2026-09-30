// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get navHome => 'Início';

  @override
  String get navCustomers => 'Clientes';

  @override
  String get navItems => 'Itens';

  @override
  String get navSuppliers => 'Fornecedores';

  @override
  String get navReports => 'Relatórios';

  @override
  String get navSettings => 'Configurações';

  @override
  String get settingsShopDetailsTitle => 'Dados da Loja';

  @override
  String get settingsShopDetailsSubtitle => 'Exibido em suas faturas.';

  @override
  String get settingsShopNameLabel => 'Nome da Loja';

  @override
  String get settingsShopAddressLabel => 'Endereço da Loja';

  @override
  String get settingsPhoneLabel => 'Telefone';

  @override
  String get settingsSaveShopDetails => 'Salvar Dados da Loja';

  @override
  String get settingsAppearanceTitle => 'Aparência';

  @override
  String get settingsAppearanceSubtitle => 'Escolha um tema para todo o aplicativo.';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get settingsLanguageTitle => 'Idioma';

  @override
  String get settingsLanguageSubtitle => 'Escolha o idioma de exibição do aplicativo.';

  @override
  String get sortNameNewest => 'Ordenar: Nome / Mais recente';

  @override
  String get addCustomer => 'Adicionar cliente';

  @override
  String get importCsv => 'Importar CSV';

  @override
  String get searchShop => 'Pesquisar na loja';

  @override
  String get scanToFindItem => 'Escanear para encontrar item';

  @override
  String get bulkAdd => 'Adicionar em lote';

  @override
  String get updateStock => 'Atualizar estoque';

  @override
  String get printLabels => 'Imprimir etiquetas';

  @override
  String get mergeDuplicates => 'Mesclar duplicados';

  @override
  String get addSupplier => 'Adicionar fornecedor';

  @override
  String get scanPurchaseInvoice => 'Escanear nota de compra';

  @override
  String askNoAnswer(String reason) {
    return 'Não foi possível obter uma resposta: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'Não foi possível conectar: $error';
  }

  @override
  String get micPermissionNeeded => 'É preciso permissão do microfone para entrada por voz.';

  @override
  String get speechUnavailable => 'O reconhecimento de voz não está disponível neste aparelho.';

  @override
  String get askYourShop => 'Pergunte à sua loja';

  @override
  String get close => 'Fechar';

  @override
  String get askIntro => 'Quer saber como vai a loja? Pergunte-me e eu respondo com o que está nos seus livros.';

  @override
  String get askListening => 'Ouvindo…';

  @override
  String get askThinkingWords => 'Pensando…|Trabalhando nisso…|Calculando…|Conferindo seus livros…|Somando…|Analisando os números…';

  @override
  String get askSayQuestion => 'Diga sua pergunta — toque no orbe para cancelar';

  @override
  String briefingRefreshFailed(int code) {
    return 'Não foi possível atualizar o resumo ($code).';
  }

  @override
  String get refreshFailedOffline => 'Não foi possível atualizar — verifique sua conexão.';

  @override
  String get newBillFailed => 'Não foi possível iniciar uma nova nota — verifique a conexão e tente de novo.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Defina primeiro um fornecedor preferido para $name (toque para editar).';
  }

  @override
  String get reorderBySupplier => 'Repor por fornecedor';

  @override
  String get supplier => 'Fornecedor';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Nenhum item com estoque baixo tem fornecedor preferido ainda.';

  @override
  String get thisSupplier => 'Este fornecedor';

  @override
  String supplierNoPhone(String name) {
    return '$name não tem número de telefone.';
  }

  @override
  String get tabOverview => 'Visão geral';

  @override
  String get tabStock => 'Estoque';

  @override
  String get tabMoney => 'Dinheiro';

  @override
  String get taglineOverview => 'Dívidas, estoque e caixa de hoje num relance.';

  @override
  String get taglineStock => 'O que está vendendo e o que está acabando.';

  @override
  String get taglineMoney => 'Despesas, conciliação e cobranças.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Carregando painel… $done de $total';
  }

  @override
  String get dashboardLoadFailed => 'Não foi possível carregar o painel';

  @override
  String get checkConnectionRetry => 'Verifique sua conexão e tente de novo.';

  @override
  String get retry => 'Tentar de novo';

  @override
  String get aiBriefing => 'Resumo com IA';

  @override
  String get briefingPrompt => 'Veja o negócio de ontem resumido em poucas frases.';

  @override
  String get getBriefing => 'Obter resumo';

  @override
  String get refreshBriefing => 'Atualizar resumo';

  @override
  String updatedAt(String time) {
    return 'Atualizado $time';
  }

  @override
  String get customersUnknown => '— clientes';

  @override
  String customerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clientes',
      one: '1 cliente',
    );
    return '$_temp0';
  }

  @override
  String get previousMonth => 'Mês anterior';

  @override
  String get nextMonth => 'Próximo mês';

  @override
  String get salesMonth => 'Vendas (mês)';

  @override
  String get outstanding => 'Em aberto';

  @override
  String get profitMonth => 'Lucro (mês)';

  @override
  String get cashToday => 'Caixa hoje';

  @override
  String get newBill => 'Nova nota';

  @override
  String get scanHandwrittenBill => 'Escanear nota manuscrita';

  @override
  String get topOutstanding => 'Maiores saldos em aberto';

  @override
  String viewAllInDues(int count) {
    return 'Ver todos os $count na Central de dívidas';
  }

  @override
  String get lowStockAlerts => 'Alertas de estoque baixo';

  @override
  String get noLowStock => 'Nenhum item com estoque baixo — tudo certo.';

  @override
  String get whatsappAll => 'WhatsApp para todos';

  @override
  String get reorderAll => 'Repor tudo';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Sugestão: repor $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Restam $qty $unit';
  }

  @override
  String get reorder => 'Repor';

  @override
  String get whatsappSupplier => 'WhatsApp ao fornecedor';

  @override
  String get topItemsByRevenue => 'Itens com maior receita';

  @override
  String get noSalesYet => 'Nenhuma venda registrada ainda.';

  @override
  String qtyLabel(String qty) {
    return 'Qtd: $qty';
  }

  @override
  String get monthExpenses => 'Despesas deste mês';

  @override
  String get noExpensesMonth => 'Nenhuma despesa registrada este mês.';

  @override
  String get quickActions => 'Ações rápidas';

  @override
  String get dailyCashReconciliation => 'Conciliação diária do caixa';

  @override
  String get collectMoney => 'Receber dinheiro';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alterações salvas offline',
      one: '1 alteração salva offline',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Sincroniza automaticamente quando voltar a ficar online';

  @override
  String get syncing => 'Sincronizando';

  @override
  String get sync => 'Sincronizar';

  @override
  String get shopProfile => 'Perfil da loja';

  @override
  String get insights => 'Insights';

  @override
  String get notifications => 'Notificações';

  @override
  String get backupExport => 'Backup e exportação';

  @override
  String get adminPanel => 'Painel de administração';

  @override
  String get toolsSync => 'Ferramentas e sincronização';

  @override
  String get account => 'Conta';

  @override
  String get shopDetailsSaved => 'Dados da loja salvos.';

  @override
  String saveFailed(int code) {
    return 'Falha ao salvar ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'Não foi possível salvar: $error';
  }

  @override
  String get logoUpdated => 'Logo atualizado.';

  @override
  String logoUploadFailed(int code) {
    return 'Falha ao enviar o logo ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'Não foi possível enviar o logo: $error';
  }

  @override
  String get healthGood => 'Tudo bem no geral.';

  @override
  String get healthSome => 'Algumas coisas merecem atenção.';

  @override
  String get healthMany => 'Várias coisas precisam de atenção.';

  @override
  String get shopHealth => 'Saúde da loja';

  @override
  String get healthIntro => 'Um lembrete rápido, não mais um relatório.';

  @override
  String get couldNotLoadCheckConnection => 'Não foi possível carregar — verifique sua conexão.';

  @override
  String get itemPhotos => 'Fotos dos itens';

  @override
  String get barcodes => 'Códigos de barras';

  @override
  String get lowStockItems => 'Itens com estoque baixo';

  @override
  String get lastBackup => 'Último backup';

  @override
  String get today => 'hoje';

  @override
  String get yesterday => 'ontem';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'há $days dias',
      one: 'há 1 dia',
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
  String get waitingToSync => 'Aguardando sincronização';

  @override
  String get syncNow => 'Sincronizar agora';

  @override
  String get searchSettings => 'Pesquisar configurações';

  @override
  String noSettingsMatch(String query) {
    return 'Nenhuma configuração corresponde a \"$query\"';
  }

  @override
  String get businessInfo => 'DADOS DO NEGÓCIO';

  @override
  String get payment => 'PAGAMENTO';

  @override
  String get shopNameRequired => 'O nome da loja é obrigatório';

  @override
  String phoneIncomplete(int digits) {
    return 'Informe um telefone completo com $digits dígitos';
  }

  @override
  String get jazzcashOptional => 'Número JazzCash (opcional)';

  @override
  String get saved => 'Salvo!';

  @override
  String get languageSubtitle => 'Mudar o idioma do app';

  @override
  String get notificationsSubtitle => 'Estoque baixo, pagamentos atrasados e resumo diário';

  @override
  String get backupSubtitle => 'Baixar, restaurar e exportar os dados da loja';

  @override
  String get appUpdate => 'Atualização do app';

  @override
  String get appUpdateSubtitle => 'Verificar versão mais nova';

  @override
  String get adminSubtitle => 'Gerenciar contas e dados da loja';

  @override
  String get accountSubtitle => 'Login, senha e nome de usuário';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get privacySubtitle => 'Quais dados coletamos e por quê';

  @override
  String get yourShop => 'Sua loja';

  @override
  String get uploadingLogo => 'Enviando o logo da loja';

  @override
  String get logoTapToChange => 'Logo da loja, toque para trocar';

  @override
  String get brandTagline => 'Loja cheia, contas tranquilas.';

  @override
  String serverError(int code) {
    return 'Erro do servidor: $code';
  }

  @override
  String get deleteCustomer => 'Excluir cliente';

  @override
  String deleteCustomerMessage(String name) {
    return 'Excluir $name e todas as notas? Isso não pode ser desfeito.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'Não foi possível excluir: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'Não foi possível excluir — verifique a conexão e tente de novo.';

  @override
  String get actions => 'Ações';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Excluir';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count clientes',
      one: 'Excluir 1 cliente',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count clientes e todas as notas? Isso não pode ser desfeito.',
      one: 'Excluir 1 cliente e todas as notas? Isso não pode ser desfeito.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Desmarcar tudo';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String selectedCount(int count) {
    return '$count selecionados';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get newTag => 'NOVO';

  @override
  String get csvNeedsRows => 'O CSV precisa de uma linha de cabeçalho e pelo menos um cliente.';

  @override
  String get csvNeedsName => 'O cabeçalho do CSV precisa ter uma coluna \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'Linha $line: nome ausente — corrija o arquivo e tente de novo.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Linha $line: credit_limit inválido \"$value\" — corrija o arquivo e tente de novo.';
  }

  @override
  String get importCustomers => 'Importar clientes';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clientes encontrados em \"$file\". Importar todos?',
      one: '1 cliente encontrado em \"$file\". Importar?',
    );
    return '$_temp0';
  }

  @override
  String get importAction => 'Importar';

  @override
  String importedCustomers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clientes importados.',
      one: '1 cliente importado.',
    );
    return '$_temp0';
  }

  @override
  String importFailed(String detail) {
    return 'Falha na importação: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Falha na importação — sem conexão: $error';
  }

  @override
  String get noPhone => 'Sem telefone';

  @override
  String get offlineShowingSaved => 'Offline — mostrando cópia salva';

  @override
  String get searchCustomersHint => 'Pesquisar clientes ou telefone...';

  @override
  String get noCustomersYet => 'Nenhum cliente ainda. Toque em + para adicionar.';

  @override
  String get noCustomersMatch => 'Nenhum cliente corresponde à sua pesquisa.';

  @override
  String get owesMoney => 'Deve dinheiro';

  @override
  String get settledUp => 'Em dia';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'Não foi possível carregar $what: $error';
  }

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get back => 'Voltar';

  @override
  String callPhone(String phone) {
    return 'Ligar para $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp para $phone';
  }

  @override
  String get clearSearch => 'Limpar pesquisa';

  @override
  String get askHint => 'ex.: Quanto lucrei este mês?';

  @override
  String get acctTurnOffLockTitle => 'Desativar o bloqueio do app?';

  @override
  String get acctTurnOffLockBody => 'Qualquer pessoa com este telefone poderá abrir o app sem PIN.';

  @override
  String get acctTurnOff => 'Desativar';

  @override
  String get acctSetPinTitle => 'Definir um PIN';

  @override
  String get acctPinLabel => 'PIN de 4 a 6 dígitos';

  @override
  String get acctPinMin => 'Pelo menos 4 dígitos';

  @override
  String get acctConfirmPin => 'Confirmar PIN';

  @override
  String get acctPinMismatch => 'Os PINs não coincidem';

  @override
  String get acctSetPin => 'Definir PIN';

  @override
  String get acctBiometricTitle => 'Usar também impressão digital/rosto?';

  @override
  String get acctBiometricBody => 'Você ainda poderá usar o PIN se a biometria falhar.';

  @override
  String get acctNoThanks => 'Não, obrigado';

  @override
  String get acctEnable => 'Ativar';

  @override
  String get acctSetPasswordTitle => 'Definir uma senha';

  @override
  String get acctSetPasswordIntro => 'Escolha uma senha para também poder entrar com e-mail + senha da próxima vez, e não apenas com o Google.';

  @override
  String get acctPassword => 'Senha';

  @override
  String get acctPasswordMin => 'Deve ter pelo menos 6 caracteres';

  @override
  String get acctConfirmPassword => 'Confirmar senha';

  @override
  String get acctPasswordsMismatch => 'As senhas não coincidem';

  @override
  String get acctSetPasswordButton => 'Definir Senha';

  @override
  String get acctPasswordSet => 'Senha definida — agora você também pode entrar com ela.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'Não foi possível definir a senha: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Alterar senha';

  @override
  String get acctCurrentPassword => 'Senha atual';

  @override
  String get acctRequired => 'Obrigatório';

  @override
  String get acctNewPassword => 'Nova senha';

  @override
  String get acctConfirmNewPassword => 'Confirmar nova senha';

  @override
  String get acctChange => 'Alterar';

  @override
  String get acctPasswordChanged => 'Senha alterada.';

  @override
  String get acctWrongPassword => 'A senha atual está incorreta.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'Não foi possível alterar a senha: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Alterar nome de usuário';

  @override
  String get acctUsername => 'Nome de usuário';

  @override
  String get acctUsernameEmpty => 'O nome de usuário não pode ficar vazio';

  @override
  String get acctUsernameChanged => 'Nome de usuário alterado.';

  @override
  String get acctChangeEmailTitle => 'Alterar e-mail';

  @override
  String get acctNewEmail => 'Novo e-mail';

  @override
  String get acctValidEmail => 'Digite um e-mail válido';

  @override
  String get acctRequiredConfirm => 'Necessário para confirmar que é você';

  @override
  String get acctGoogleConfirmFirst => 'Primeiro você será solicitado a confirmar com o Google.';

  @override
  String acctCheckEmail(String email) {
    return 'Verifique $email para ver o link de confirmação da alteração.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'o login com senha';

  @override
  String acctRemoveTitle(String provider) {
    return 'Remover $provider?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Você não poderá mais entrar nesta conta com $provider.';
  }

  @override
  String get acctRemove => 'Remover';

  @override
  String acctRemoved(String provider) {
    return '$provider removido.';
  }

  @override
  String get acctSignedIn => 'Conectado';

  @override
  String get acctEmailNotVerified => 'E-mail ainda não verificado.';

  @override
  String get acctVerificationSent => 'E-mail de verificação enviado.';

  @override
  String get acctResend => 'Reenviar';

  @override
  String get acctSectionSignIn => 'LOGIN E SEGURANÇA';

  @override
  String get acctRowChangeUsername => 'Alterar Nome de Usuário';

  @override
  String get acctRowChangeEmail => 'Alterar E-mail';

  @override
  String get acctRowSetPassword => 'Definir uma Senha';

  @override
  String get acctRowChangePassword => 'Alterar Senha';

  @override
  String get acctRowUnlinkGoogle => 'Desvincular Google';

  @override
  String get acctRowRemovePassword => 'Remover Senha';

  @override
  String get acctRowAppLock => 'Bloqueio do App (PIN)';

  @override
  String get acctRowBiometric => 'Usar impressão digital/rosto';

  @override
  String get acctSignOutTitle => 'Sair?';

  @override
  String get acctSignOutBody => 'Você precisará entrar novamente para usar o app.';

  @override
  String get acctSignOut => 'Sair';

  @override
  String get acctDeleteAccount => 'Excluir Conta';

  @override
  String get acctDeleting => 'Excluindo...';

  @override
  String get acctDeleteTitle => 'Excluir conta?';

  @override
  String get acctDeleteBody => 'Isso exclui permanentemente suas credenciais de login. Você precisará se cadastrar novamente para usar o app. Não é possível desfazer.';

  @override
  String acctCouldNotDelete(String error) {
    return 'Não foi possível excluir a conta: $error';
  }

  @override
  String get itmNotFoundTitle => 'Item não encontrado';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Nenhum item tem o código de barras $barcode. Adicioná-lo agora como novo item?';
  }

  @override
  String get itmAddItem => 'Adicionar Item';

  @override
  String get itmEditItem => 'Editar Item';

  @override
  String get itmMergeTitle => 'Mesclar Itens Duplicados';

  @override
  String get itmMergeBody => 'Itens com o mesmo nome serão mesclados na entrada mais antiga, somando seus estoques. Não é possível desfazer.';

  @override
  String get itmMerge => 'Mesclar';

  @override
  String get itmNoDuplicates => 'Nenhum item duplicado encontrado.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens duplicados mesclados.',
      one: '1 item duplicado mesclado.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Excluir Item';

  @override
  String get itmCannotUndo => 'Não é possível desfazer.';

  @override
  String get itmDeleteOffline => 'Não foi possível excluir — verifique sua conexão e tente novamente.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count Itens',
      one: 'Excluir 1 Item',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count itens? Não é possível desfazer.',
      one: 'Excluir 1 item? Não é possível desfazer.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'Não foi possível enviar a foto ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'Não foi possível enviar a foto: $error';
  }

  @override
  String get itmNoBarcodes => 'Nenhum item tem código de barras ainda.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imprimir $count Etiquetas',
      one: 'Imprimir 1 Etiqueta',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Buscar item ou categoria...';

  @override
  String get itmStopListening => 'Parar de ouvir';

  @override
  String get itmVoiceSearch => 'Busca por voz';

  @override
  String get itmSort => 'Ordenar';

  @override
  String get itmSortName => 'Nome (A-Z)';

  @override
  String get itmSortStockLow => 'Estoque: do menor ao maior';

  @override
  String get itmSortRecent => 'Adicionados recentemente';

  @override
  String get itmFilterAll => 'Todos';

  @override
  String get itmFilterLowStock => 'Estoque Baixo';

  @override
  String get itmNoItemsYet => 'Ainda não há itens. Toque em + para adicionar.';

  @override
  String get itmNoItemsMatch => 'Nenhum item corresponde à sua busca.';

  @override
  String get itmNoPriceChanges => 'Nenhuma alteração de preço registrada ainda.';

  @override
  String get itmNoStockCorrections => 'Nenhuma correção de estoque registrada ainda.';

  @override
  String get itmResetHistory => 'Redefinir histórico';

  @override
  String get itmResetHistoryMsg => 'Redefinir o histórico deste item? Isso não pode ser desfeito.';

  @override
  String get itmSendPdf => 'Enviar como PDF';

  @override
  String get itmNoteOptional => 'Nota (opcional)';

  @override
  String get itmNoteHint => 'Adicione uma nota para esta alteração';

  @override
  String get itmRemoveEntry => 'Remover registro';

  @override
  String get itmRemoveEntryMsg => 'Remover este registro do histórico? Isso não pode ser desfeito.';

  @override
  String get itmEditEntry => 'Editar registro';

  @override
  String get itmPrevQty => 'Anterior';

  @override
  String get itmNewQty => 'Novo';

  @override
  String itmCost(String amount) {
    return 'Custo: $amount';
  }

  @override
  String get itmMore => 'Mais';

  @override
  String get itmMenuPrintLabel => 'Imprimir etiqueta';

  @override
  String get itmMenuDuplicate => 'Duplicar';

  @override
  String get itmMenuPriceHistory => 'Histórico de preços';

  @override
  String get itmMenuStockHistory => 'Histórico de ajustes de estoque';

  @override
  String itmLowStockBadge(int count) {
    return '$count com estoque baixo';
  }

  @override
  String itmStockLine(String qty) {
    return 'Estoque: $qty';
  }

  @override
  String get itmOfflineSaved => 'Offline — item salvo neste dispositivo, será sincronizado automaticamente quando voltar a ficar online';

  @override
  String get itmItemName => 'Nome do Item';

  @override
  String get itmNameRequired => 'O nome é obrigatório';

  @override
  String get itmPricePkr => 'Preço (PKR)';

  @override
  String get itmPriceRequired => 'O preço é obrigatório';

  @override
  String get itmValidNumber => 'Digite um número válido';

  @override
  String get itmUnit => 'Unidade';

  @override
  String get itmCategoryHint => 'Categoria (opcional, ex.: Hidráulica)';

  @override
  String get itmPreferredSupplier => 'Fornecedor Preferido (opcional)';

  @override
  String get itmPreferredSupplierHelper => 'Usado pela ação de reabastecer com um toque';

  @override
  String get itmClear => 'Limpar';

  @override
  String get itmHsn => 'Código HSN (opcional)';

  @override
  String get itmGstRate => 'Alíquota GST % (opcional)';

  @override
  String get itmBarcodeOptional => 'Código de Barras (opcional)';

  @override
  String get itmScanOrType => 'Escaneie ou digite';

  @override
  String get itmScanBarcode => 'Escanear código de barras';

  @override
  String get itmPurchaseCost => 'Custo de Compra (por unidade)';

  @override
  String get itmPurchaseCostHint => 'O que você paga ao comprar estoque';

  @override
  String get itmWholesale => 'Preço de Atacado (opcional)';

  @override
  String get itmContractor => 'Preço para Empreiteiros (opcional)';

  @override
  String get itmFallsBack => 'Se vazio, usa o preço normal';

  @override
  String get itmStockQty => 'Quantidade em Estoque';

  @override
  String get itmLowStockAlert => 'Alerta de Estoque Baixo Abaixo de';

  @override
  String get itmFrequently => 'Frequentemente comprado com';

  @override
  String get itmSaveChanges => 'Salvar Alterações';

  @override
  String get itmSaveItem => 'Salvar Item';

  @override
  String get itmPhotoSemantics => 'Foto do item, toque para alterar';

  @override
  String get cdUpdateStatusTitle => 'Atualizar Status de Pagamento';

  @override
  String get cdMarkPaidQ => 'Marcar esta fatura como paga?';

  @override
  String get cdMarkUnpaidQ => 'Marcar esta fatura como não paga?';

  @override
  String get cdConfirm => 'Confirmar';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'Não foi possível atualizar: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Offline — alteração salva neste dispositivo, será sincronizada automaticamente quando voltar a ficar online';

  @override
  String get cdConvertTitle => 'Converter em Fatura';

  @override
  String get cdConvertBody => 'Isso vai descontar o estoque destes itens e transformar o orçamento em uma fatura real. Continuar?';

  @override
  String get cdConvert => 'Converter';

  @override
  String cdCouldNotConvert(String detail) {
    return 'Não foi possível converter: $detail';
  }

  @override
  String get cdReturnItems => 'Devolver Itens';

  @override
  String get cdReturnHint => 'Defina quanto devolver de cada item. Deixe em 0 para manter como vendido.';

  @override
  String get cdDecreaseQty => 'Diminuir quantidade';

  @override
  String get cdIncreaseQty => 'Aumentar quantidade';

  @override
  String get cdCreditTotal => 'Total do crédito';

  @override
  String get cdReturnSelected => 'Devolver Selecionados';

  @override
  String cdCouldNotReturn(String detail) {
    return 'Não foi possível devolver: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'Não foi possível anular: $detail';
  }

  @override
  String get cdNoPreviousBill => 'Nenhuma fatura anterior para repetir';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'Não foi possível carregar a última fatura: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Fatura enviada por e-mail ao cliente.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'Não foi possível enviar a fatura por e-mail: $detail';
  }

  @override
  String get cdStatementEmailed => 'Extrato enviado por e-mail ao cliente.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'Não foi possível enviar o extrato por e-mail: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Excluir Fatura';

  @override
  String get cdBillVoided => 'ANULADA';

  @override
  String get cdBillReturn => 'DEVOLUÇÃO';

  @override
  String get cdBillQuote => 'ORÇAMENTO';

  @override
  String get cdBillPaid => 'PAGA';

  @override
  String get cdBillPartial => 'PARCIAL';

  @override
  String get cdBillUnpaid => 'NÃO PAGA';

  @override
  String get cdBill => 'Fatura';

  @override
  String cdVoidedReason(String reason) {
    return 'Anulada: $reason';
  }

  @override
  String get cdViewInvoice => 'Ver Fatura';

  @override
  String get cdEmailInvoice => 'Enviar Fatura por E-mail';

  @override
  String get cdEditBill => 'Editar Fatura';

  @override
  String get cdReturnBill => 'Devolver Fatura';

  @override
  String get cdVoidBill => 'Anular Fatura';

  @override
  String get cdNoItems => 'Sem itens';

  @override
  String get cdRepeatLast => 'Repetir Última Fatura';

  @override
  String get cdLedgerPdf => 'PDF do Razão';

  @override
  String get cdEmailStatement => 'Enviar Extrato por E-mail';

  @override
  String get cdCollectPayment => 'Receber Pagamento';

  @override
  String get cdSendReminder => 'Enviar Lembrete pelo WhatsApp';

  @override
  String get cdTotalBilled => 'Total Faturado';

  @override
  String get cdPaid => 'Pago';

  @override
  String get cdNoBills => 'Nenhuma fatura ainda';

  @override
  String get cdBillActions => 'Ações da fatura';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding de $limit do limite de crédito usado';
  }

  @override
  String get cdVoidBody => 'Ela será removida dos saldos e relatórios, mas mantida no histórico. O estoque será restaurado. Não é possível desfazer.';

  @override
  String get cdReason => 'Motivo (opcional)';

  @override
  String get frmOfflineCustomer => 'Offline — cliente salvo neste dispositivo, será sincronizado automaticamente quando voltar a ficar online';

  @override
  String get frmOfflineSupplier => 'Offline — fornecedor salvo neste dispositivo, será sincronizado automaticamente quando voltar a ficar online';

  @override
  String get frmEditCustomer => 'Editar Cliente';

  @override
  String get frmCustomerName => 'Nome do Cliente';

  @override
  String get frmPhoneOptional => 'Telefone (opcional)';

  @override
  String get frmCreditLimit => 'Limite de Crédito (PKR, opcional)';

  @override
  String get frmCreditHelper => 'Avisar quando o saldo deste cliente ultrapassar este valor';

  @override
  String get frmPriceTier => 'Nível de Preço';

  @override
  String get frmRetail => 'Varejo';

  @override
  String get frmWholesale => 'Atacado';

  @override
  String get frmContractor => 'Empreiteiro';

  @override
  String get frmPriceTierHelper => 'Qual preço de item a fatura preenche para este cliente';

  @override
  String get frmStrn => 'STRN (opcional)';

  @override
  String get frmStrnCustomer => 'Número de registro de imposto sobre vendas de 13 dígitos para faturas';

  @override
  String get frmStrnSupplier => 'Número de registro de imposto sobre vendas de 13 dígitos para faturas de compra';

  @override
  String get frmAddress => 'Endereço (opcional)';

  @override
  String get frmEmail => 'E-mail (opcional)';

  @override
  String get frmEmailHelper => 'Permite enviar uma fatura ou extrato por e-mail a este cliente';

  @override
  String get frmSaveCustomer => 'Salvar Cliente';

  @override
  String get frmEditSupplier => 'Editar Fornecedor';

  @override
  String get frmSupplierName => 'Nome do Fornecedor';

  @override
  String get frmSaveSupplier => 'Salvar Fornecedor';

  @override
  String get sdDeletePurchaseTitle => 'Excluir Compra';

  @override
  String get sdDeletePurchaseBody => 'O estoque desta compra será restaurado. Não é possível desfazer.';

  @override
  String get sdReturnToSupplier => 'Devolver ao Fornecedor';

  @override
  String get sdReturnHint => 'Defina quanto devolver de cada item. Deixe em 0 para manter.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'Não foi possível marcar como recebida: $detail';
  }

  @override
  String get sdMarkPaidQ => 'Marcar esta compra como paga?';

  @override
  String get sdMarkUnpaidQ => 'Marcar esta compra como não paga?';

  @override
  String get sdTotalPurchased => 'Total Comprado';

  @override
  String get sdPayable => 'A Pagar';

  @override
  String sdPayableAmount(String amount) {
    return '$amount a pagar';
  }

  @override
  String get sdNoPurchases => 'Nenhuma compra ainda';

  @override
  String get sdPo => 'PC';

  @override
  String get sdDraftPo => 'PC RASCUNHO';

  @override
  String get sdPurchase => 'Compra';

  @override
  String get sdDraftNote => 'Pedido de compra em rascunho — ainda não recebido, sem atualização de estoque ou custo por enquanto.';

  @override
  String get sdReturnNote => 'Devolução / nota de crédito ao fornecedor.';

  @override
  String get sdMarkReceived => 'Marcar como Recebida';

  @override
  String get sdEditPurchase => 'Editar Compra';

  @override
  String get sdPurchaseActions => 'Ações da compra';

  @override
  String get slDeleteSupplier => 'Excluir Fornecedor';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count Fornecedores',
      one: 'Excluir 1 Fornecedor',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Excluir $count fornecedores e todas as suas compras? Não é possível desfazer.',
      one: 'Excluir 1 fornecedor e todas as suas compras? Não é possível desfazer.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'O CSV precisa de uma linha de cabeçalho e pelo menos um fornecedor.';

  @override
  String get slImportTitle => 'Importar Fornecedores';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Encontrados $count fornecedores em \"$file\". Importar todos?',
      one: 'Encontrado 1 fornecedor em \"$file\". Importar todos?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fornecedores importados.',
      one: '1 fornecedor importado.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Nenhum fornecedor ainda. Toque em + para adicionar.';

  @override
  String get slSearchHint => 'Buscar fornecedores ou telefone...';

  @override
  String get slNoMatch => 'Nenhum fornecedor corresponde à sua busca.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fornecedores',
      one: '1 fornecedor',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Dívidas com Fornecedores';

  @override
  String get sduNothingOwed => 'Nada a pagar aos fornecedores 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fornecedores a pagar',
      one: '1 fornecedor a pagar',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias desde a compra em aberto mais antiga',
      one: '1 dia desde a compra em aberto mais antiga',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 dias';

  @override
  String get duBucket1 => '30–60 dias';

  @override
  String get duBucket2 => '60+ dias';

  @override
  String get duTitle => 'Central de Recebíveis';

  @override
  String get duNoDues => 'Nenhum valor em aberto 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clientes com valores em aberto',
      one: '1 cliente com valores em aberto',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias desde a fatura em aberto mais antiga',
      one: '1 dia desde a fatura em aberto mais antiga',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount em aberto';
  }

  @override
  String get cpNoOutstanding => 'Este cliente não tem saldo em aberto';

  @override
  String get cpValidAmount => 'Digite um valor válido';

  @override
  String cpExceeds(String amount) {
    return 'O valor excede o saldo em aberto de $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'Recebido $amount de $name';
  }

  @override
  String get cpOfflineSaved => 'Offline — pagamento salvo neste dispositivo, será sincronizado automaticamente quando voltar a ficar online';

  @override
  String cpOwes(String amount, String name) {
    return '$name deve $amount. Aplicado primeiro à(s) fatura(s) em aberto mais antiga(s).';
  }

  @override
  String get cpAmountLabel => 'Valor Recebido (PKR)';

  @override
  String get cpCollect => 'Receber';

  @override
  String get usNoItems => 'Nenhum item para atualizar.';

  @override
  String get usHelp => 'Defina o novo estoque de cada item e toque em Salvar Tudo.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  atual: $qty';
  }

  @override
  String usNew(String qty) {
    return 'novo: $qty';
  }

  @override
  String get usSubtract => 'Subtrair 1';

  @override
  String get usAdd => 'Somar 1';

  @override
  String get usNoChanges => 'Sem alterações';

  @override
  String usSaveAll(int count) {
    return 'Salvar Tudo ($count alterados)';
  }

  @override
  String get srHint => 'Buscar clientes, itens, valores...';

  @override
  String get srFailed => 'A busca falhou — verifique sua conexão.';

  @override
  String get srTitle => 'Pesquise na sua loja';

  @override
  String get srSubtitle => 'Encontre clientes por nome ou telefone e faturas por valor.';

  @override
  String srNoMatches(String query) {
    return 'Nenhum resultado para \"$query\"';
  }

  @override
  String get srTryDifferent => 'Tente outro nome, telefone ou valor.';

  @override
  String get srBills => 'Faturas';

  @override
  String get srNoItemList => 'Sem lista de itens';

  @override
  String get abAddAtLeastOne => 'Adicione pelo menos um item';

  @override
  String get abQuotationUpdated => 'Orçamento atualizado!';

  @override
  String get abBillUpdated => 'Fatura atualizada!';

  @override
  String get abQuotationSaved => 'Orçamento salvo!';

  @override
  String get abBillCreated => 'Fatura criada com sucesso!';

  @override
  String abTotalAmount(String amount) {
    return 'Total: $amount';
  }

  @override
  String get abShare => 'Compartilhar';

  @override
  String get abDoneReturn => 'Concluir e Voltar';

  @override
  String get abOverLimitBody => 'Isso faria o cliente ultrapassar o limite de crédito.';

  @override
  String get abOverLimitTitle => 'Limite de crédito excedido';

  @override
  String get abBillAnyway => 'Faturar mesmo assim';

  @override
  String get abOfflineBill => 'Offline — fatura salva neste dispositivo, será sincronizada automaticamente quando voltar a ficar online';

  @override
  String get abEditQuotation => 'Editar Orçamento';

  @override
  String get abEditBill => 'Editar Fatura';

  @override
  String get abNewQuotation => 'Novo Orçamento';

  @override
  String get abAddBill => 'Adicionar Fatura';

  @override
  String get abCouldNotLoadItems => 'Não foi possível carregar os itens.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Esta fatura deixaria o cliente em $total, acima do limite de crédito de $limit.';
  }

  @override
  String get abTapAddItemBill => 'Toque em \"Adicionar Item\" abaixo para iniciar uma fatura';

  @override
  String get abNoCatalog => 'Ainda não há itens no catálogo';

  @override
  String get abScan => 'Escanear';

  @override
  String get abDiscountRs => 'Desconto (Rs)';

  @override
  String get abSubtotal => 'Subtotal';

  @override
  String get abTotal => 'Total';

  @override
  String get abSaveAsQuotation => 'Salvar como Orçamento';

  @override
  String get abQuotationLocked => 'Uma fatura existente não pode voltar a ser orçamento';

  @override
  String get abQuotationNote => 'Nenhum estoque é descontado até virar fatura';

  @override
  String get abPaymentStatus => 'Status de Pagamento';

  @override
  String get abUnpaid => 'Não Paga';

  @override
  String get abPaymentMethod => 'Forma de Pagamento';

  @override
  String get abCash => 'Dinheiro';

  @override
  String get abBankTransfer => 'Transferência Bancária';

  @override
  String get abCheque => 'Cheque';

  @override
  String get abSaveQuotation => 'Salvar Orçamento';

  @override
  String get abSaveBill => 'Salvar Fatura';

  @override
  String abAdded(String name) {
    return '$name adicionado';
  }

  @override
  String get apNewItem => 'Novo Item…';

  @override
  String get apNewItemHint => 'Adicione primeiro um novo item ao catálogo';

  @override
  String get apOfflinePurchase => 'Offline — compra salva neste dispositivo, será sincronizada automaticamente quando voltar a ficar online';

  @override
  String get apEditPo => 'Editar Pedido de Compra';

  @override
  String get apNewPo => 'Novo Pedido de Compra';

  @override
  String get apAddPurchase => 'Adicionar Compra';

  @override
  String get apTapAddItem => 'Toque em \"Adicionar Item\" abaixo para iniciar uma compra';

  @override
  String get apSaveAsPo => 'Salvar como Pedido de Compra';

  @override
  String get apPoLocked => 'Uma compra já recebida não pode voltar a ser pedido em rascunho';

  @override
  String get apPoNote => 'Sem atualização de estoque ou custo até a mercadoria ser marcada como recebida';

  @override
  String get apUnpaidCredit => 'Não Paga (Crédito)';

  @override
  String get apSavePo => 'Salvar Pedido de Compra';

  @override
  String get apSavePurchase => 'Salvar Compra';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Custo atual: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Sem custo definido  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Falha na leitura: erro do servidor $code';
  }

  @override
  String get scOfflineSaved => 'Offline — foto salva, será lida automaticamente quando voltar a ficar online';

  @override
  String get scStillOffline => 'Ainda offline';

  @override
  String get scCouldNotCreateCustomer => 'Não foi possível criar o cliente — tente novamente.';

  @override
  String get scCouldNotCreateSupplier => 'Não foi possível criar o fornecedor — tente novamente.';

  @override
  String scBillSavedFor(String name) {
    return 'Fatura salva para $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Compra de $name salva';
  }

  @override
  String get scWhichCustomer => 'Qual cliente é este?';

  @override
  String get scWhichSupplier => 'Qual fornecedor é este?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Correspondência mais próxima: $name ($score% semelhante)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Sim, é $name';
  }

  @override
  String get scOtherwiseCustomer => 'Caso contrário, crie um novo cliente:';

  @override
  String get scOtherwiseSupplier => 'Caso contrário, crie um novo fornecedor:';

  @override
  String get scNoMatchCustomer => 'Nenhum cliente correspondente encontrado. Crie um novo:';

  @override
  String get scNoMatchSupplier => 'Nenhum fornecedor correspondente encontrado. Crie um novo:';

  @override
  String get scCustomerName => 'Nome do cliente';

  @override
  String get scSupplierName => 'Nome do fornecedor';

  @override
  String get scCreateNew => 'Criar Novo';

  @override
  String get scTitleBill => 'Escanear Fatura';

  @override
  String get scIntroBill => 'Tire uma foto da fatura. Se for escrita à mão, tudo bem, e funciona em sindi, urdu ou inglês. Você poderá conferir tudo antes de salvar.';

  @override
  String get scIntroPurchase => 'Tire uma foto da fatura do fornecedor. Funciona em sindi, urdu ou inglês. Você poderá conferir tudo antes de salvar.';

  @override
  String get scReadingBill => 'Lendo fatura…';

  @override
  String get scScanBill => 'Escanear uma Fatura';

  @override
  String get scReadingInvoice => 'Lendo fatura…';

  @override
  String get scScanInvoice => 'Escanear uma Fatura';

  @override
  String get scQueued => 'Leituras na Fila';

  @override
  String get scReady => 'Pronto para revisar';

  @override
  String get scFailed => 'Falhou';

  @override
  String get scWaiting => 'Aguardando conexão';

  @override
  String get scRetry => 'Tentar novamente';

  @override
  String rpCouldNotLoad(String error) {
    return 'Não foi possível carregar os relatórios: $error';
  }

  @override
  String get rpHeadline => 'Os principais números deste mês';

  @override
  String get rpProfitThisMonth => 'Lucro Deste Mês';

  @override
  String get rpNoData => 'Ainda sem dados';

  @override
  String get rpSalesTax => 'Imposto sobre Vendas';

  @override
  String rpSalesTaxFor(String month) {
    return 'Relatório de imposto sobre vendas de $month';
  }

  @override
  String get rpViewSalesTax => 'Ver Relatório de Imposto sobre Vendas';

  @override
  String get rpQuickReports => 'Relatórios Rápidos';

  @override
  String get rpQuickSub => 'Vá direto a um relatório específico';

  @override
  String get expensesTitle => 'Despesas';

  @override
  String get rpRateCard => 'Tabela de Preços';

  @override
  String get rpDetails => 'Detalhes';

  @override
  String get rpDetailsSub => 'Detalhamentos completos e rankings';

  @override
  String get rpOutstandingByCustomer => 'Saldos em Aberto por Cliente';

  @override
  String get rpNoOutstanding => 'Nenhum saldo em aberto';

  @override
  String get rpMonthlyTotals => 'Totais Mensais';

  @override
  String get rpMostSold => 'Itens Mais Vendidos';

  @override
  String get rpNoItemsRecorded => 'Nenhum item registrado ainda';

  @override
  String get rpTopCustomers => 'Principais Clientes por Receita';

  @override
  String get rpNoSalesRecorded => 'Nenhuma venda registrada ainda';

  @override
  String get rpTotalOutstanding => 'Total em Aberto';

  @override
  String get rpViewCustomers => 'Ver clientes';

  @override
  String get lblInvoice => 'fatura';

  @override
  String get lblLedger => 'razão';

  @override
  String get lblRateCard => 'tabela de preços';

  @override
  String get exCsvNeedsRows => 'O CSV precisa de uma linha de cabeçalho e pelo menos uma despesa.';

  @override
  String get exCsvHeader => 'O cabeçalho do CSV deve incluir as colunas \"description\" e \"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'Linha $line: descrição ausente ou valor inválido — corrija o arquivo e tente novamente.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Linha $line: data inválida \"$date\" — use AAAA-MM-DD.';
  }

  @override
  String get exImportTitle => 'Importar Despesas';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Encontradas $count despesas em \"$file\". Importar todas?',
      one: 'Encontrada 1 despesa em \"$file\". Importar todas?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count despesas importadas.',
      one: '1 despesa importada.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Falha na importação: erro do servidor $code';
  }

  @override
  String get exDeleteTitle => 'Excluir Despesa';

  @override
  String get exAdd => 'Adicionar Despesa';

  @override
  String get exEdit => 'Editar Despesa';

  @override
  String get exDescription => 'Descrição';

  @override
  String get exAmountRs => 'Valor (Rs)';

  @override
  String get exCategory => 'Categoria';

  @override
  String exDate(String date) {
    return 'Data: $date';
  }

  @override
  String get exRepeats => 'Repete todo mês';

  @override
  String get exRepeatsHint => 'Aluguel, energia, salários, etc.';

  @override
  String get exReceiptTap => 'Foto do recibo, toque para alterar';

  @override
  String get exReceiptOptional => 'Foto do recibo (opcional)';

  @override
  String get exEnterValid => 'Informe uma descrição e um valor válido.';

  @override
  String get exOffline => 'Offline — despesa salva neste dispositivo, será sincronizada automaticamente quando voltar a ficar online';

  @override
  String get exSave => 'Salvar Despesa';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count despesas recorrentes vencem este mês',
      one: '1 despesa recorrente vence este mês',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Adicionar';

  @override
  String get exTotal => 'Total de Despesas';

  @override
  String exCategoryChip(String name) {
    return 'Categoria: $name';
  }

  @override
  String get exNoneLogged => 'Nenhuma despesa registrada ainda';

  @override
  String exNoneInCategory(String name) {
    return 'Nenhuma despesa de $name ainda';
  }

  @override
  String get exViewReceipt => 'Ver recibo';

  @override
  String get exEditRow => 'Editar despesa';

  @override
  String get exDeleteRow => 'Excluir despesa';

  @override
  String gstServerReturned(String first, String second) {
    return 'O servidor retornou $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'Não foi possível carregar os dados de GST: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Falha no download ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename salvo';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Salvo em Downloads/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'Não foi possível baixar: $error';
  }

  @override
  String get gstTitle => 'Relatório de Imposto sobre Vendas';

  @override
  String get gstOutwardDetail => 'Vendas de Saída — Detalhe das Faturas';

  @override
  String get gstNoBills => 'Nenhuma fatura neste mês.';

  @override
  String get gstHsn => 'Resumo HSN';

  @override
  String get gstInvoiceWise => 'Detalhes por fatura';

  @override
  String get gstMonthly => 'Resumo Mensal';

  @override
  String get gstOutwardTaxable => 'Fornecimentos de saída tributáveis';

  @override
  String get gstItc => 'Crédito de Imposto de Entrada (das compras)';

  @override
  String get gstSave => 'Salvar';

  @override
  String get rcValidAmount => 'Informe um valor válido.';

  @override
  String get rcExpected => 'Dinheiro Esperado (vendas em dinheiro de hoje)';

  @override
  String get rcAlsoCollected => 'Também recebido hoje (não contado na gaveta)';

  @override
  String get rcCounted => 'Dinheiro Contado na Gaveta (Rs)';

  @override
  String get rcCompare => 'Comparar';

  @override
  String get rcMatches => 'Confere exatamente!';

  @override
  String rcExtra(String amount) {
    return '$amount a mais na gaveta';
  }

  @override
  String rcMissing(String amount) {
    return '$amount a menos na gaveta';
  }

  @override
  String get pbiTitle => 'Lucro por Item';

  @override
  String get pbiNoSales => 'Ainda sem vendas';

  @override
  String get pbiByCategory => 'Por Categoria';

  @override
  String get pbiItemsByProfit => 'Itens por Lucro';

  @override
  String get svTitle => 'Valor do Estoque';

  @override
  String get svNone => 'Sem estoque disponível';

  @override
  String get svItemsByValue => 'Itens por Valor';

  @override
  String svSummary(String items, String units) {
    return '$items itens · $units unidades na prateleira';
  }

  @override
  String svTied(String amount) {
    return '$amount parados em estoque';
  }

  @override
  String get svEstimated => 'estimado pelo preço de venda';

  @override
  String get bkRestoreTitle => 'Restaurar Backup?';

  @override
  String bkRestoreBody(String filename) {
    return 'Isso substituirá TODOS os dados atuais pelo arquivo de backup \"$filename\". Continuar?';
  }

  @override
  String get bkRestore => 'Restaurar';

  @override
  String get bkRestoreDoneTitle => 'Restauração Concluída';

  @override
  String get bkRestoreDoneBody => 'Seus dados foram restaurados.';

  @override
  String get bkOk => 'OK';

  @override
  String bkRestoreFailed(String detail) {
    return 'Falha na restauração: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'Não foi possível restaurar: $error';
  }

  @override
  String get bkSaveToDownloads => 'Salvar em Downloads';

  @override
  String get bkIntroAdmin => 'Todos os seus dados ficam em um único arquivo de banco de dados. Baixe uma cópia regularmente e restaure-a se algo der errado.';

  @override
  String get bkIntroStaff => 'O backup e a restauração completos do banco de dados são apenas para administradores. Peça a um administrador ou exporte o que precisar em CSV abaixo.';

  @override
  String get bkBackupDb => 'Fazer Backup do Banco de Dados';

  @override
  String get bkBackupDbSub => 'Baixe todo o banco de dados em um arquivo e compartilhe (WhatsApp, Drive, e-mail).';

  @override
  String get bkDownloadPhone => 'Baixar Backup para o Telefone';

  @override
  String get bkShareBackup => 'Compartilhar Backup';

  @override
  String get bkAutoTitle => 'Backups Automáticos';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count backups diários armazenados no servidor, o mais recente de $time. Rodam sozinhos — nada a fazer aqui.',
      one: '1 backup diário armazenado no servidor, o mais recente de $time. Roda sozinho — nada a fazer aqui.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Escolha um arquivo de backup salvo para substituir os dados atuais.';

  @override
  String get bkRestoreFromFile => 'Restaurar de Arquivo de Backup';

  @override
  String get bkExportCsv => 'Exportar para CSV';

  @override
  String get bkExportSub => 'Abra no Excel ou compartilhe.';

  @override
  String get bkRangeAll => 'Faturas/Despesas: todo o período';

  @override
  String bkRangeSome(String end, String start) {
    return 'Faturas/Despesas: de $start a $end';
  }

  @override
  String get bkSetRange => 'Definir Período';

  @override
  String get bkClearRange => 'Limpar período';

  @override
  String get ntNever => 'Nunca disparado';

  @override
  String get ntJustNow => 'Agora mesmo';

  @override
  String ntMinutesAgo(int count) {
    return 'há $count min';
  }

  @override
  String ntHoursAgo(int count) {
    return 'há $count h';
  }

  @override
  String ntDaysAgo(int count) {
    return 'há $count d';
  }

  @override
  String get ntTitle => 'Notificações Inteligentes';

  @override
  String get ntTapHint => 'Toque em \"Verificar Agora\" para disparar uma notificação e ver os resultados ao vivo.';

  @override
  String get ntLowStockSub => 'Avisar quando os itens ficarem abaixo do nível de reposição.';

  @override
  String get ntCheckNow => 'Verificar Agora';

  @override
  String get ntOverdue => 'Lembretes de Pagamentos em Atraso';

  @override
  String get ntOverdueSub => 'Avisar sobre faturas não pagas de dias anteriores.';

  @override
  String get ntDaily => 'Resumo Diário do Negócio';

  @override
  String get ntDailySub => 'Vendas, recebimentos e lucro de ontem em um relance.';

  @override
  String get ntSendSummary => 'Enviar Resumo';

  @override
  String get ntRunning => 'Executando…';

  @override
  String get ntLowStockItems => 'Itens com Estoque Baixo';

  @override
  String get ntSales => 'Vendas';

  @override
  String get ntCollected => 'Recebido';

  @override
  String get ntProfit => 'Lucro';

  @override
  String get auChecking => 'Procurando atualizações…';

  @override
  String get auLatest => 'Você tem a versão mais recente.';

  @override
  String get auAvailable => 'Atualização disponível';

  @override
  String auNewer(int code) {
    return 'Uma versão mais nova do Book-Keep (build $code) está pronta.';
  }

  @override
  String get auLater => 'Depois';

  @override
  String get auUpdate => 'Atualizar';

  @override
  String get auDownloading => 'Baixando atualização';

  @override
  String auSaved(String name) {
    return '$name salvo na sua pasta Downloads.';
  }

  @override
  String get auAllowInstall => 'Permita que o Book-Keep instale apps e toque em Atualizar novamente.';

  @override
  String get auFailed => 'Não foi possível atualizar — verifique sua conexão e tente novamente.';

  @override
  String get lgSearch => 'Buscar idiomas';

  @override
  String lgNoMatch(String query) {
    return 'Nenhum idioma corresponde a \"$query\"';
  }

  @override
  String get alVoided => 'Anulou uma fatura';

  @override
  String get alDeletedBill => 'Excluiu uma fatura';

  @override
  String get alReturned => 'Devolveu uma fatura';

  @override
  String get alDeletedCustomer => 'Excluiu um cliente';

  @override
  String get alDeletedSupplier => 'Excluiu um fornecedor';

  @override
  String get alCreatedAccount => 'Criou uma conta';

  @override
  String get alUpdatedAccount => 'Atualizou uma conta';

  @override
  String get alDeletedAccount => 'Excluiu uma conta';

  @override
  String get alTitle => 'Registro de Atividades';

  @override
  String get alNone => 'Nenhuma atividade registrada ainda';

  @override
  String get blkEnterOne => 'Informe pelo menos um item';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens adicionados com sucesso',
      one: '1 item adicionado com sucesso',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Adicionar Itens em Lote';

  @override
  String get blkFormat => 'Um item por linha, formato: Nome, Preço, Unidade, Categoria';

  @override
  String get blkOptional => 'Unidade e categoria são opcionais (padrão: piece, nenhuma)';

  @override
  String get blkAddAll => 'Adicionar Todos os Itens';

  @override
  String get prSend => 'Enviar Lembrete de Pagamento';

  @override
  String get prTone => 'Escolha o Tom:';

  @override
  String get prPolite => 'Educado';

  @override
  String get prStandard => 'Padrão';

  @override
  String get prUrgent => 'Urgente';

  @override
  String get prPreviewQr => 'Pré-visualizar QR de Pagamento JazzCash';

  @override
  String get prShareText => 'Compartilhar Texto';

  @override
  String get dsRemaining => 'Restante';

  @override
  String dsIncludesDiscount(String amount) {
    return 'inclui $amount de desconto';
  }

  @override
  String get dsItems => 'Itens';

  @override
  String get dsDiscount => 'Desconto';

  @override
  String get lkWrongPin => 'PIN incorreto';

  @override
  String get lkEnterPin => 'Digite o PIN';

  @override
  String get lkChecking => 'Verificando impressão digital...';

  @override
  String get bcTitle => 'Escanear Código de Barras';

  @override
  String get bcTorchNa => 'A lanterna não está disponível neste dispositivo';

  @override
  String get bcTorch => 'Lanterna';

  @override
  String get bcPoint => 'Aponte a câmera para um código de barras';

  @override
  String get qrNoNumber => 'Nenhum número JazzCash configurado. Defina nas Configurações para exibir um QR code de pagamento.';

  @override
  String get qrPay => 'Pagar com JazzCash';

  @override
  String get qrInvalid => 'Dados do QR inválidos';

  @override
  String qrAmount(String amount) {
    return 'Valor: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'Copiar número JazzCash';

  @override
  String get qrCopied => 'Número JazzCash copiado para a área de transferência';

  @override
  String get qrHint => 'Escaneie ou copie este número no seu app JazzCash para pagar.';

  @override
  String clOwed(String amount) {
    return '$amount em aberto';
  }

  @override
  String get lnEnterEmailFirst => 'Informe primeiro um e-mail válido acima.';

  @override
  String get lnResetSent => 'E-mail de redefinição enviado — verifique sua caixa de entrada.';

  @override
  String get lnNoAccount => 'Nenhuma conta encontrada para esse e-mail.';

  @override
  String get lnWrongPassword => 'Senha incorreta.';

  @override
  String get lnInvalidEmail => 'Isso não parece um endereço de e-mail válido.';

  @override
  String get lnDisabled => 'Esta conta foi desativada.';

  @override
  String get lnTooMany => 'Muitas tentativas — tente novamente em um minuto.';

  @override
  String get lnNoInternet => 'Sem conexão com a internet.';

  @override
  String get lnWeakPassword => 'A senha deve ter pelo menos 6 caracteres.';

  @override
  String get lnCouldNotSignIn => 'Não foi possível entrar. Tente novamente.';

  @override
  String get lnWrongPasswordHint => 'Senha incorreta. Tente novamente ou toque em \"Esqueceu a senha?\".';

  @override
  String get lnWrongEmail => 'E-mail incorreto — nenhuma conta usa esse endereço.';

  @override
  String get lnWrongEmailOrPassword => 'E-mail ou senha incorretos.';

  @override
  String get lnWrongUsername => 'Nome de usuário incorreto — nenhuma conta usa esse nome.';

  @override
  String get lnWelcome => 'Bem-vindo de volta';

  @override
  String lnSignInTo(String app) {
    return 'Entre no $app';
  }

  @override
  String get lnEmailOrUsername => 'E-mail ou Nome de usuário';

  @override
  String get lnRemember => 'Lembrar de mim';

  @override
  String get lnForgot => 'Esqueceu a senha?';

  @override
  String get lnSignIn => 'Entrar';

  @override
  String get lnGoogle => 'Continuar com o Google';

  @override
  String get lnNew => 'Novo por aqui?';

  @override
  String get lnCreate => 'Criar conta';

  @override
  String suCreated(String email) {
    return 'Conta criada para $email. Um e-mail de verificação foi enviado (opcional).';
  }

  @override
  String suSetup(String app) {
    return 'Configurar o $app';
  }

  @override
  String get suName => 'Nome';

  @override
  String get suEmail => 'E-mail';

  @override
  String suPhoneDigits(int digits) {
    return 'Digite um número válido de $digits dígitos';
  }

  @override
  String get suCreateBtn => 'Criar Conta';

  @override
  String get suHaveAccount => 'Já tem uma conta?';

  @override
  String get suAlreadyExists => 'Já existe uma conta com esse e-mail.';

  @override
  String get suInvalidEmail => 'Endereço de e-mail inválido.';

  @override
  String get agShow => 'Mostrar senha';

  @override
  String get agHide => 'Ocultar senha';

  @override
  String get adAccounts => 'Contas';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count contas registradas',
      one: '1 conta registrada',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Adicionar';

  @override
  String get adNoAccounts => 'Nenhuma conta encontrada.';

  @override
  String get adAccountability => 'Responsabilização';

  @override
  String get adAccountabilitySub => 'Quem anulou, excluiu ou devolveu algo, e alterações de contas.';

  @override
  String get adActivitySub => 'Faturas anuladas, exclusões, alterações de contas';

  @override
  String get adServer => 'Servidor';

  @override
  String get adServerSub => 'Com quem este app se comunica. Raramente precisa mudar após a configuração.';

  @override
  String get adServerHint => 'O emulador usa 10.0.2.2; um telefone real precisa do IP do notebook na mesma rede Wi-Fi. Alterar isso afeta todas as contas.';

  @override
  String get adApiBase => 'URL Base da API';

  @override
  String get adSaveServer => 'Salvar Endereço do Servidor';

  @override
  String get adEmailSetSub => 'Configurado — a equipe pode enviar faturas/extratos por e-mail aos clientes.';

  @override
  String get adNotSetUp => 'Ainda não configurado.';

  @override
  String get adEmailSetBody => 'O e-mail está configurado. Permite que a equipe envie uma fatura ou extrato direto ao cliente.';

  @override
  String get adEmailHelp => 'Um endereço Gmail funciona com uma senha de app (smtp.gmail.com, porta 587), ou use os dados SMTP do seu provedor de e-mail.';

  @override
  String get adSmtpHost => 'Host SMTP';

  @override
  String get adSmtpPort => 'Porta SMTP';

  @override
  String get adEmailAddress => 'Endereço de E-mail';

  @override
  String get adPwKeep => 'Senha (deixe em branco para manter a atual)';

  @override
  String get adPwApp => 'Senha (senha de app, não sua senha de login)';

  @override
  String get adFromName => 'Nome do Remetente (opcional)';

  @override
  String get adFromHint => 'Minha Loja de Ferragens';

  @override
  String get adSaving => 'Salvando...';

  @override
  String get adSaveEmail => 'Salvar Configurações de E-mail';

  @override
  String get adAddAccount => 'Adicionar conta';

  @override
  String get adNameOpt => 'Nome (opcional)';

  @override
  String get adAtLeast6 => 'Pelo menos 6 caracteres';

  @override
  String get adGrantAdmin => 'Conceder admin';

  @override
  String get adCanManage => 'Pode anular/excluir/devolver';

  @override
  String get adCanManageHint => 'Anular ou excluir uma fatura, devolver uma fatura ou excluir um cliente/fornecedor. Um admin sempre tem isso.';

  @override
  String get adCreate => 'Criar';

  @override
  String get adAccountCreated => 'Conta criada.';

  @override
  String adCreateFailed(String error) {
    return 'Falha ao criar: $error';
  }

  @override
  String get adEditAccount => 'Editar conta';

  @override
  String get adAdminSwitch => 'Admin';

  @override
  String get adAdminHint => 'Pode abrir o painel de administração';

  @override
  String get adDisabled => 'Desativada';

  @override
  String get adDisabledHint => 'Impedida de entrar';

  @override
  String get adAccountUpdated => 'Conta atualizada.';

  @override
  String adUpdateFailed(String error) {
    return 'Falha ao atualizar: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label será removido permanentemente e não poderá mais entrar.';
  }

  @override
  String get adAccountDeleted => 'Conta excluída.';

  @override
  String adDeleteFailed(String error) {
    return 'Falha ao excluir: $error';
  }

  @override
  String get adBadgeAdmin => 'ADMIN';

  @override
  String get adBadgeDisabled => 'DESATIVADA';

  @override
  String get adOff => 'O painel de administração está desativado';

  @override
  String get adCheckAgain => 'Verificar novamente';

  @override
  String get adAccessRequired => 'Acesso de administrador necessário';

  @override
  String get adAccessBody => 'Apenas administradores da loja podem gerenciar contas. Peça ao dono da loja para conceder acesso de administrador.';

  @override
  String get adCouldNotLoad => 'Não foi possível carregar o painel de administração.';

  @override
  String get adBadPort => 'Informe um número de porta SMTP válido.';

  @override
  String get adEmailSaved => 'Configurações de e-mail salvas.';

  @override
  String adEmailSaveFailed(String error) {
    return 'Não foi possível salvar as configurações de e-mail: $error';
  }

  @override
  String get adServerEmpty => 'O endereço do servidor não pode ficar vazio.';

  @override
  String get adServerSaved => 'Endereço do servidor salvo. As telas o usarão no próximo carregamento.';

  @override
  String get lnOr => 'ou';

  @override
  String get scNotABill => 'Isso não parece uma fatura. Tente de novo com uma foto nítida da fatura.';

  @override
  String get scNotAnInvoice => 'Isso não parece uma fatura. Tente de novo com uma foto nítida da fatura do fornecedor.';

  @override
  String get jqOpenFull => 'Tela cheia';

  @override
  String get jqCopy => 'Copiar número';

  @override
  String get jqSheetTitle => 'QR do JazzCash';

  @override
  String get jqSheetHint => 'Os clientes escaneiam isto no app JazzCash para pagar você.';

  @override
  String get jqCheck => 'Confira o número';

  @override
  String get askVoice => 'Voz';

  @override
  String get askVoiceFallbackNote => 'Lendo isto com a voz do seu celular.';

  @override
  String get askPace => 'Ritmo';

  @override
  String get askTone => 'Tom';

  @override
  String get askPaceSlower => 'Mais lento';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Mais rápido';

  @override
  String get askToneCalm => 'Calmo';

  @override
  String get askToneWarm => 'Caloroso';

  @override
  String get askToneCheerful => 'Alegre';

  @override
  String qPaymentUpdate(String amount) {
    return 'Atualização de pagamento: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Cliente: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Fornecedor: $name';
  }

  @override
  String qItem(String name) {
    return 'Item: $name';
  }

  @override
  String qExpense(String name) {
    return 'Despesa: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Compra: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Pagamento recebido: $amount de $name';
  }

  @override
  String gstAmount(String amount) {
    return 'Imposto $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Base tributável $taxable  ·  Imposto $tax  ·  Total $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Receita: $revenue  •  Custo das mercadorias: $cogs  •  Despesas: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Olá $customer, saudações da $shop! Seu saldo total em aberto é $amount. Obrigado!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Olá $customer, lembrete de pagamento da $shop referente ao saldo pendente de $amount. Por favor, pague assim que possível.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'AVISO URGENTE: Prezado(a) $customer, seu pagamento pendente de $amount na $shop está em aberto. Por favor, quite imediatamente.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Pague via JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Fatura de $shop\nTotal: $total\nItens: $items\nStatus: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Olá $supplier, aqui é a $shop. Gostaríamos de fazer um pedido de:\n$lines\n\nPor favor, confirme disponibilidade e preço. Obrigado.';
  }

  @override
  String ppUpdated(String date) {
    return 'Última atualização: $date';
  }

  @override
  String get ppWhoH => 'Quem somos';

  @override
  String ppWho(String owner, String email) {
    return '$owner, responsável pelo Book-keep.\nContacto: $email';
  }

  @override
  String get ppCollectH => 'O que recolhemos';

  @override
  String get ppCollectAccount => 'Conta: e-mail, número de telefone e nome de utilizador, através do Firebase Authentication.';

  @override
  String get ppCollectShop => 'Perfil da loja: nome, endereço, número de telefone, número JazzCash e logótipo da loja, introduzidos pelo dono nas Definições.';

  @override
  String get ppCollectRecords => 'Registos do negócio que você cria: nomes e telefones de clientes e fornecedores, faturas, compras, catálogo de artigos (incluindo fotos e códigos de barras) e despesas (incluindo fotos de recibos). Estes são os dados centrais da app: é assim que funciona a contabilidade.';

  @override
  String get ppCollectDevice => 'Dados do dispositivo e de diagnóstico: um token de notificações push (para alertas de stock baixo, pagamentos em atraso e resumo diário) e relatórios de falhas (informações do dispositivo e registos de erro) através do Firebase Crashlytics, enviados automaticamente quando a app falha.';

  @override
  String ppCollectAi(String askShop) {
    return 'Funcionalidades de IA: $askShop, o resumo matinal com IA e o scanner de faturas/compras com IA enviam um retrato dos dados do negócio relevantes (valores de relatórios ou uma foto de uma fatura) para a API Gemini da Google para gerar uma resposta, um resumo ou as linhas extraídas. A Google processa estes dados para gerar a resposta; nem nós nem a Google os usamos para treinar modelos fora dos termos padrão da API da Google.';
  }

  @override
  String get ppDontH => 'O que não fazemos';

  @override
  String get ppDontLocation => 'Não rastreamos a sua localização.';

  @override
  String get ppDontAds => 'Não usamos redes de publicidade nem ferramentas de análise comportamental ou de repetição de sessões.';

  @override
  String get ppDontSell => 'Não vendemos os seus dados nem os dos seus clientes a ninguém.';

  @override
  String get ppWhereH => 'Onde os dados ficam';

  @override
  String get ppWhereDb => 'Base de dados: Neon (Postgres), um fornecedor externo de bases de dados na nuvem.';

  @override
  String get ppWhereFirebase => 'Autenticação, notificações push, relatórios de falhas e armazenamento de fotos: Firebase (Google).';

  @override
  String get ppWhereAi => 'Processamento de IA: API Gemini da Google.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'E-mails de faturas: enviados através da conta SMTP que o administrador da sua loja configura em $adminPanel. Não temos lista de correio; são faturas ou extratos individuais para os seus próprios clientes, não marketing em massa.';
  }

  @override
  String get ppYoursH => 'Os seus dados, os dados dos seus clientes';

  @override
  String get ppYours => 'Tudo o que introduz (clientes, fornecedores, faturas, artigos) pertence à sua loja. Outras lojas que usam o Book-keep não o conseguem ver. As contas de funcionários que criar só veem aquilo a que lhes der acesso.';

  @override
  String get ppControlsH => 'Os seus controlos';

  @override
  String ppControlExport(String path) {
    return 'Exportar ou fazer cópia de segurança dos seus dados: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Eliminar a sua conta: $path. Isto remove apenas a sua credencial de início de sessão; não apaga os registos do negócio da sua loja (faturas, clientes, artigos, etc.), tal como remover um funcionário não apaga os registos que criou.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Notificações: podem ser desativadas por tipo em $path.';
  }

  @override
  String get ppChildrenH => 'Crianças';

  @override
  String get ppChildren => 'O Book-keep é uma ferramenta de trabalho para donos de lojas e funcionários. Não se destina a crianças nem é usado intencionalmente por elas.';

  @override
  String get ppChangesH => 'Alterações a esta política';

  @override
  String get ppChanges => 'Se o que recolhemos ou o destino dos dados mudar, atualizaremos esta página e a data no topo.';

  @override
  String get ppContactH => 'Contacto';

  @override
  String ppContact(String email) {
    return 'Dúvidas sobre esta política ou os seus dados: $email';
  }

  @override
  String get waHello => 'Olá!';

  @override
  String waHelloNamed(String name) {
    return 'Olá $name,';
  }

  @override
  String get gstTaxable => 'Tributável';

  @override
  String get gstTax => 'Imposto';

  @override
  String get gstTaxableValue => 'Valor tributável';

  @override
  String get gstTotalTax => 'Imposto total';

  @override
  String get gstTotalItc => 'Total do crédito de imposto (ITC)';

  @override
  String get gstExempt => 'Vendas isentas';

  @override
  String get gstNetPayable => 'Imposto líquido a pagar';

  @override
  String get unknownName => 'Desconhecido';

  @override
  String get unitPiece => 'peça';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'metro';

  @override
  String get unitBox => 'caixa';

  @override
  String get unitDozen => 'dúzia';

  @override
  String get unitLiter => 'litro';

  @override
  String get unitBag => 'saco';

  @override
  String deleteSupplierMessage(String name) {
    return 'Eliminar $name e todas as suas compras? Esta ação não pode ser desfeita.';
  }
}
