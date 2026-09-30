// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navHome => 'Inicio';

  @override
  String get navCustomers => 'Clientes';

  @override
  String get navItems => 'Artículos';

  @override
  String get navSuppliers => 'Proveedores';

  @override
  String get navReports => 'Informes';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get settingsShopDetailsTitle => 'Datos de la Tienda';

  @override
  String get settingsShopDetailsSubtitle => 'Se muestra en tus facturas.';

  @override
  String get settingsShopNameLabel => 'Nombre de la Tienda';

  @override
  String get settingsShopAddressLabel => 'Dirección de la Tienda';

  @override
  String get settingsPhoneLabel => 'Teléfono';

  @override
  String get settingsSaveShopDetails => 'Guardar Datos de la Tienda';

  @override
  String get settingsAppearanceTitle => 'Apariencia';

  @override
  String get settingsAppearanceSubtitle => 'Elige un tema para toda la aplicación.';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get settingsLanguageTitle => 'Idioma';

  @override
  String get settingsLanguageSubtitle => 'Elige el idioma de la aplicación.';

  @override
  String get sortNameNewest => 'Ordenar: Nombre / Más reciente';

  @override
  String get addCustomer => 'Añadir cliente';

  @override
  String get importCsv => 'Importar CSV';

  @override
  String get searchShop => 'Buscar en la tienda';

  @override
  String get scanToFindItem => 'Escanear para buscar artículo';

  @override
  String get bulkAdd => 'Añadir en lote';

  @override
  String get updateStock => 'Actualizar stock';

  @override
  String get printLabels => 'Imprimir etiquetas';

  @override
  String get mergeDuplicates => 'Combinar duplicados';

  @override
  String get addSupplier => 'Añadir proveedor';

  @override
  String get scanPurchaseInvoice => 'Escanear factura de compra';

  @override
  String askNoAnswer(String reason) {
    return 'No se pudo obtener respuesta: $reason';
  }

  @override
  String couldNotConnect(String error) {
    return 'No se pudo conectar: $error';
  }

  @override
  String get micPermissionNeeded => 'Se necesita permiso del micrófono para la entrada de voz.';

  @override
  String get speechUnavailable => 'El reconocimiento de voz no está disponible en este dispositivo.';

  @override
  String get askYourShop => 'Pregunta a tu tienda';

  @override
  String get close => 'Cerrar';

  @override
  String get askIntro => '¿Quiere saber cómo va la tienda? Pregúnteme y le respondo con lo que hay en sus libros.';

  @override
  String get askListening => 'Escuchando…';

  @override
  String get askThinkingWords => 'Pensando…|Trabajando en ello…|Calculando…|Revisando tus libros…|Sumando…|Analizando las cifras…';

  @override
  String get askSayQuestion => 'Di tu pregunta — toca el orbe para cancelar';

  @override
  String briefingRefreshFailed(int code) {
    return 'No se pudo actualizar el resumen ($code).';
  }

  @override
  String get refreshFailedOffline => 'No se pudo actualizar — revisa tu conexión.';

  @override
  String get newBillFailed => 'No se pudo iniciar una nueva factura — revisa tu conexión e inténtalo de nuevo.';

  @override
  String setPreferredSupplierFirst(String name) {
    return 'Primero asigna un proveedor preferido a $name (toca para editar).';
  }

  @override
  String get reorderBySupplier => 'Repedir por proveedor';

  @override
  String get supplier => 'Proveedor';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artículos',
      one: '1 artículo',
    );
    return '$_temp0';
  }

  @override
  String get noLowStockWithSupplier => 'Ningún artículo con poco stock tiene proveedor preferido todavía.';

  @override
  String get thisSupplier => 'Este proveedor';

  @override
  String supplierNoPhone(String name) {
    return '$name no tiene número de teléfono.';
  }

  @override
  String get tabOverview => 'Resumen';

  @override
  String get tabStock => 'Stock';

  @override
  String get tabMoney => 'Dinero';

  @override
  String get taglineOverview => 'Deudas, stock y efectivo de hoy de un vistazo.';

  @override
  String get taglineStock => 'Qué se vende y qué se agota.';

  @override
  String get taglineMoney => 'Gastos, conciliación y cobros.';

  @override
  String loadingDashboard(int done, int total) {
    return 'Cargando panel… $done de $total';
  }

  @override
  String get dashboardLoadFailed => 'No se pudo cargar el panel';

  @override
  String get checkConnectionRetry => 'Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get retry => 'Reintentar';

  @override
  String get aiBriefing => 'Resumen con IA';

  @override
  String get briefingPrompt => 'Ve el negocio de ayer resumido en pocas frases.';

  @override
  String get getBriefing => 'Obtener resumen';

  @override
  String get refreshBriefing => 'Actualizar resumen';

  @override
  String updatedAt(String time) {
    return 'Actualizado $time';
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
  String get previousMonth => 'Mes anterior';

  @override
  String get nextMonth => 'Mes siguiente';

  @override
  String get salesMonth => 'Ventas (mes)';

  @override
  String get outstanding => 'Pendiente';

  @override
  String get profitMonth => 'Ganancia (mes)';

  @override
  String get cashToday => 'Efectivo hoy';

  @override
  String get newBill => 'Nueva factura';

  @override
  String get scanHandwrittenBill => 'Escanear factura manuscrita';

  @override
  String get topOutstanding => 'Mayores saldos pendientes';

  @override
  String viewAllInDues(int count) {
    return 'Ver los $count en el Centro de deudas';
  }

  @override
  String get lowStockAlerts => 'Alertas de poco stock';

  @override
  String get noLowStock => 'Ningún artículo con poco stock — todo bien.';

  @override
  String get whatsappAll => 'WhatsApp a todos';

  @override
  String get reorderAll => 'Repedir todo';

  @override
  String suggestReorder(String qty, String unit) {
    return 'Se sugiere repedir $qty $unit';
  }

  @override
  String stockLeft(String qty, String unit) {
    return 'Quedan $qty $unit';
  }

  @override
  String get reorder => 'Repedir';

  @override
  String get whatsappSupplier => 'WhatsApp al proveedor';

  @override
  String get topItemsByRevenue => 'Artículos con más ingresos';

  @override
  String get noSalesYet => 'Aún no hay ventas registradas.';

  @override
  String qtyLabel(String qty) {
    return 'Cant.: $qty';
  }

  @override
  String get monthExpenses => 'Gastos de este mes';

  @override
  String get noExpensesMonth => 'No hay gastos registrados este mes.';

  @override
  String get quickActions => 'Acciones rápidas';

  @override
  String get dailyCashReconciliation => 'Conciliación diaria de caja';

  @override
  String get collectMoney => 'Cobrar dinero';

  @override
  String changesSavedOffline(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cambios guardados sin conexión',
      one: '1 cambio guardado sin conexión',
    );
    return '$_temp0';
  }

  @override
  String get willSyncOnline => 'Se sincronizará automáticamente al volver la conexión';

  @override
  String get syncing => 'Sincronizando';

  @override
  String get sync => 'Sincronizar';

  @override
  String get shopProfile => 'Perfil de la tienda';

  @override
  String get insights => 'Información';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get backupExport => 'Copia de seguridad y exportación';

  @override
  String get adminPanel => 'Panel de administración';

  @override
  String get toolsSync => 'Herramientas y sincronización';

  @override
  String get account => 'Cuenta';

  @override
  String get shopDetailsSaved => 'Datos de la tienda guardados.';

  @override
  String saveFailed(int code) {
    return 'Error al guardar ($code)';
  }

  @override
  String couldNotSave(String error) {
    return 'No se pudo guardar: $error';
  }

  @override
  String get logoUpdated => 'Logo actualizado.';

  @override
  String logoUploadFailed(int code) {
    return 'Error al subir el logo ($code)';
  }

  @override
  String couldNotUploadLogo(String error) {
    return 'No se pudo subir el logo: $error';
  }

  @override
  String get healthGood => 'Todo se ve bien en general.';

  @override
  String get healthSome => 'Algunas cosas necesitan atención.';

  @override
  String get healthMany => 'Varias cosas necesitan atención.';

  @override
  String get shopHealth => 'Salud de la tienda';

  @override
  String get healthIntro => 'Un recordatorio rápido, no otro informe.';

  @override
  String get couldNotLoadCheckConnection => 'No se pudo cargar — revisa tu conexión.';

  @override
  String get itemPhotos => 'Fotos de artículos';

  @override
  String get barcodes => 'Códigos de barras';

  @override
  String get lowStockItems => 'Artículos con poco stock';

  @override
  String get lastBackup => 'Última copia';

  @override
  String get today => 'hoy';

  @override
  String get yesterday => 'ayer';

  @override
  String daysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'hace $days días',
      one: 'hace 1 día',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Estado sin conexión';

  @override
  String get online => 'En línea';

  @override
  String get offline => 'Sin conexión';

  @override
  String get waitingToSync => 'Pendiente de sincronizar';

  @override
  String get syncNow => 'Sincronizar ahora';

  @override
  String get searchSettings => 'Buscar ajustes';

  @override
  String noSettingsMatch(String query) {
    return 'Ningún ajuste coincide con \"$query\"';
  }

  @override
  String get businessInfo => 'DATOS DEL NEGOCIO';

  @override
  String get payment => 'PAGO';

  @override
  String get shopNameRequired => 'El nombre de la tienda es obligatorio';

  @override
  String phoneIncomplete(int digits) {
    return 'Introduce un número de teléfono completo de $digits dígitos';
  }

  @override
  String get jazzcashOptional => 'Número de JazzCash (opcional)';

  @override
  String get saved => '¡Guardado!';

  @override
  String get languageSubtitle => 'Cambia el idioma de la aplicación';

  @override
  String get notificationsSubtitle => 'Poco stock, pagos vencidos y resumen diario';

  @override
  String get backupSubtitle => 'Descarga, restaura y exporta los datos de la tienda';

  @override
  String get appUpdate => 'Actualización de la app';

  @override
  String get appUpdateSubtitle => 'Buscar una versión más reciente';

  @override
  String get adminSubtitle => 'Gestiona cuentas y datos de la tienda';

  @override
  String get accountSubtitle => 'Inicio de sesión, contraseña y usuario';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get privacySubtitle => 'Qué datos recopilamos y por qué';

  @override
  String get yourShop => 'Tu tienda';

  @override
  String get uploadingLogo => 'Subiendo el logo de la tienda';

  @override
  String get logoTapToChange => 'Logo de la tienda, toca para cambiar';

  @override
  String get brandTagline => 'Tienda a tope, cuentas tranquilas.';

  @override
  String serverError(int code) {
    return 'Error del servidor: $code';
  }

  @override
  String get deleteCustomer => 'Eliminar cliente';

  @override
  String deleteCustomerMessage(String name) {
    return '¿Eliminar a $name y todas sus facturas? No se puede deshacer.';
  }

  @override
  String couldNotDeleteDetail(String detail) {
    return 'No se pudo eliminar: $detail';
  }

  @override
  String get couldNotDeleteOffline => 'No se pudo eliminar — revisa tu conexión e inténtalo de nuevo.';

  @override
  String get actions => 'Acciones';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Eliminar';

  @override
  String deleteCustomersTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar $count clientes',
      one: 'Eliminar 1 cliente',
    );
    return '$_temp0';
  }

  @override
  String deleteCustomersMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count clientes y todas sus facturas? No se puede deshacer.',
      one: '¿Eliminar 1 cliente y todas sus facturas? No se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String get deselectAll => 'Deseleccionar todo';

  @override
  String get selectAll => 'Seleccionar todo';

  @override
  String selectedCount(int count) {
    return '$count seleccionados';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get newTag => 'NUEVO';

  @override
  String get csvNeedsRows => 'El CSV necesita una fila de encabezado y al menos un cliente.';

  @override
  String get csvNeedsName => 'El encabezado del CSV debe incluir una columna \"name\".';

  @override
  String csvLineMissingName(int line) {
    return 'Línea $line: falta el nombre — corrige el archivo y vuelve a intentarlo.';
  }

  @override
  String csvLineBadCredit(int line, String value) {
    return 'Línea $line: credit_limit no válido \"$value\" — corrige el archivo y vuelve a intentarlo.';
  }

  @override
  String get importCustomers => 'Importar clientes';

  @override
  String importCustomersConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se encontraron $count clientes en \"$file\". ¿Importarlos todos?',
      one: 'Se encontró 1 cliente en \"$file\". ¿Importarlo?',
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
    return 'Error al importar: $detail';
  }

  @override
  String importFailedOffline(String error) {
    return 'Error al importar — no se pudo conectar: $error';
  }

  @override
  String get noPhone => 'Sin teléfono';

  @override
  String get offlineShowingSaved => 'Sin conexión — mostrando copia guardada';

  @override
  String get searchCustomersHint => 'Buscar clientes o teléfono...';

  @override
  String get noCustomersYet => 'Aún no hay clientes. Toca + para añadir uno.';

  @override
  String get noCustomersMatch => 'Ningún cliente coincide con tu búsqueda.';

  @override
  String get owesMoney => 'Debe dinero';

  @override
  String get settledUp => 'Al día';

  @override
  String couldNotLoadLabel(String error, String what) {
    return 'No se pudo cargar $what: $error';
  }

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

  @override
  String get back => 'Atrás';

  @override
  String callPhone(String phone) {
    return 'Llamar a $phone';
  }

  @override
  String whatsappPhone(String phone) {
    return 'WhatsApp a $phone';
  }

  @override
  String get clearSearch => 'Borrar búsqueda';

  @override
  String get askHint => 'p. ej. ¿Cuánto gané este mes?';

  @override
  String get acctTurnOffLockTitle => '¿Desactivar el bloqueo de la app?';

  @override
  String get acctTurnOffLockBody => 'Cualquiera que tenga este teléfono podrá abrir la app sin PIN.';

  @override
  String get acctTurnOff => 'Desactivar';

  @override
  String get acctSetPinTitle => 'Crear un PIN';

  @override
  String get acctPinLabel => 'PIN de 4 a 6 dígitos';

  @override
  String get acctPinMin => 'Al menos 4 dígitos';

  @override
  String get acctConfirmPin => 'Confirmar PIN';

  @override
  String get acctPinMismatch => 'Los PIN no coinciden';

  @override
  String get acctSetPin => 'Crear PIN';

  @override
  String get acctBiometricTitle => '¿Usar también huella/rostro?';

  @override
  String get acctBiometricBody => 'Podrás seguir usando el PIN si la biometría falla.';

  @override
  String get acctNoThanks => 'No, gracias';

  @override
  String get acctEnable => 'Activar';

  @override
  String get acctSetPasswordTitle => 'Crear una contraseña';

  @override
  String get acctSetPasswordIntro => 'Elige una contraseña para poder iniciar sesión también con correo + contraseña la próxima vez, en lugar de solo con Google.';

  @override
  String get acctPassword => 'Contraseña';

  @override
  String get acctPasswordMin => 'Debe tener al menos 6 caracteres';

  @override
  String get acctConfirmPassword => 'Confirmar contraseña';

  @override
  String get acctPasswordsMismatch => 'Las contraseñas no coinciden';

  @override
  String get acctSetPasswordButton => 'Crear contraseña';

  @override
  String get acctPasswordSet => 'Contraseña creada — ahora también puedes iniciar sesión con ella.';

  @override
  String acctCouldNotSetPassword(String error) {
    return 'No se pudo crear la contraseña: $error';
  }

  @override
  String get acctChangePasswordTitle => 'Cambiar contraseña';

  @override
  String get acctCurrentPassword => 'Contraseña actual';

  @override
  String get acctRequired => 'Obligatorio';

  @override
  String get acctNewPassword => 'Nueva contraseña';

  @override
  String get acctConfirmNewPassword => 'Confirmar nueva contraseña';

  @override
  String get acctChange => 'Cambiar';

  @override
  String get acctPasswordChanged => 'Contraseña cambiada.';

  @override
  String get acctWrongPassword => 'La contraseña actual es incorrecta.';

  @override
  String acctCouldNotChangePassword(String error) {
    return 'No se pudo cambiar la contraseña: $error';
  }

  @override
  String get acctChangeUsernameTitle => 'Cambiar nombre de usuario';

  @override
  String get acctUsername => 'Nombre de usuario';

  @override
  String get acctUsernameEmpty => 'El nombre de usuario no puede estar vacío';

  @override
  String get acctUsernameChanged => 'Nombre de usuario cambiado.';

  @override
  String get acctChangeEmailTitle => 'Cambiar correo electrónico';

  @override
  String get acctNewEmail => 'Nuevo correo electrónico';

  @override
  String get acctValidEmail => 'Introduce un correo electrónico válido';

  @override
  String get acctRequiredConfirm => 'Necesario para confirmar que eres tú';

  @override
  String get acctGoogleConfirmFirst => 'Primero se te pedirá confirmar con Google.';

  @override
  String acctCheckEmail(String email) {
    return 'Revisa $email para encontrar el enlace que confirma el cambio.';
  }

  @override
  String get acctProviderGoogle => 'Google';

  @override
  String get acctProviderPassword => 'el inicio de sesión con contraseña';

  @override
  String acctRemoveTitle(String provider) {
    return '¿Quitar $provider?';
  }

  @override
  String acctRemoveBody(String provider) {
    return 'Ya no podrás iniciar sesión en esta cuenta con $provider.';
  }

  @override
  String get acctRemove => 'Quitar';

  @override
  String acctRemoved(String provider) {
    return '$provider quitado.';
  }

  @override
  String get acctSignedIn => 'Sesión iniciada';

  @override
  String get acctEmailNotVerified => 'Correo aún no verificado.';

  @override
  String get acctVerificationSent => 'Correo de verificación enviado.';

  @override
  String get acctResend => 'Reenviar';

  @override
  String get acctSectionSignIn => 'INICIO DE SESIÓN Y SEGURIDAD';

  @override
  String get acctRowChangeUsername => 'Cambiar nombre de usuario';

  @override
  String get acctRowChangeEmail => 'Cambiar correo';

  @override
  String get acctRowSetPassword => 'Crear una contraseña';

  @override
  String get acctRowChangePassword => 'Cambiar contraseña';

  @override
  String get acctRowUnlinkGoogle => 'Desvincular Google';

  @override
  String get acctRowRemovePassword => 'Quitar contraseña';

  @override
  String get acctRowAppLock => 'Bloqueo de la app (PIN)';

  @override
  String get acctRowBiometric => 'Usar huella/rostro';

  @override
  String get acctSignOutTitle => '¿Cerrar sesión?';

  @override
  String get acctSignOutBody => 'Tendrás que iniciar sesión de nuevo para usar la app.';

  @override
  String get acctSignOut => 'Cerrar sesión';

  @override
  String get acctDeleteAccount => 'Eliminar cuenta';

  @override
  String get acctDeleting => 'Eliminando...';

  @override
  String get acctDeleteTitle => '¿Eliminar la cuenta?';

  @override
  String get acctDeleteBody => 'Esto elimina de forma permanente tus credenciales de acceso. Tendrás que registrarte de nuevo para usar la app. No se puede deshacer.';

  @override
  String acctCouldNotDelete(String error) {
    return 'No se pudo eliminar la cuenta: $error';
  }

  @override
  String get itmNotFoundTitle => 'Artículo no encontrado';

  @override
  String itmNotFoundBody(String barcode) {
    return 'Ningún artículo tiene el código de barras $barcode. ¿Añadirlo ahora como artículo nuevo?';
  }

  @override
  String get itmAddItem => 'Añadir artículo';

  @override
  String get itmEditItem => 'Editar artículo';

  @override
  String get itmMergeTitle => 'Combinar artículos duplicados';

  @override
  String get itmMergeBody => 'Los artículos con el mismo nombre se combinarán en la entrada más antigua y se sumarán sus existencias. No se puede deshacer.';

  @override
  String get itmMerge => 'Combinar';

  @override
  String get itmNoDuplicates => 'No se encontraron artículos duplicados.';

  @override
  String itmMerged(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se combinaron $count artículos duplicados.',
      one: 'Se combinó 1 artículo duplicado.',
    );
    return '$_temp0';
  }

  @override
  String get itmDeleteTitle => 'Eliminar artículo';

  @override
  String get itmCannotUndo => 'No se puede deshacer.';

  @override
  String get itmDeleteOffline => 'No se pudo eliminar — revisa tu conexión e inténtalo de nuevo.';

  @override
  String itmDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar $count artículos',
      one: 'Eliminar 1 artículo',
    );
    return '$_temp0';
  }

  @override
  String itmDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count artículos? No se puede deshacer.',
      one: '¿Eliminar 1 artículo? No se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String itmPhotoUploadFailedCode(int code) {
    return 'No se pudo subir la foto ($code)';
  }

  @override
  String itmPhotoUploadFailed(String error) {
    return 'No se pudo subir la foto: $error';
  }

  @override
  String get itmNoBarcodes => 'Ningún artículo tiene código de barras todavía.';

  @override
  String itmPrintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imprimir $count etiquetas',
      one: 'Imprimir 1 etiqueta',
    );
    return '$_temp0';
  }

  @override
  String get itmSearchHint => 'Buscar artículo o categoría...';

  @override
  String get itmStopListening => 'Dejar de escuchar';

  @override
  String get itmVoiceSearch => 'Búsqueda por voz';

  @override
  String get itmSort => 'Ordenar';

  @override
  String get itmSortName => 'Nombre (A-Z)';

  @override
  String get itmSortStockLow => 'Existencias: de menos a más';

  @override
  String get itmSortRecent => 'Añadidos recientemente';

  @override
  String get itmFilterAll => 'Todos';

  @override
  String get itmFilterLowStock => 'Stock bajo';

  @override
  String get itmNoItemsYet => 'Aún no hay artículos. Toca + para añadir uno.';

  @override
  String get itmNoItemsMatch => 'Ningún artículo coincide con tu búsqueda.';

  @override
  String get itmNoPriceChanges => 'Aún no hay cambios de precio registrados.';

  @override
  String get itmNoStockCorrections => 'Aún no hay correcciones de existencias registradas.';

  @override
  String get itmResetHistory => 'Restablecer historial';

  @override
  String get itmResetHistoryMsg => '¿Restablecer el historial de este artículo? Esta acción no se puede deshacer.';

  @override
  String get itmSendPdf => 'Enviar como PDF';

  @override
  String get itmNoteOptional => 'Nota (opcional)';

  @override
  String get itmNoteHint => 'Añade una nota para este cambio';

  @override
  String get itmRemoveEntry => 'Quitar entrada';

  @override
  String get itmRemoveEntryMsg => '¿Quitar esta entrada del historial? Esta acción no se puede deshacer.';

  @override
  String get itmEditEntry => 'Editar entrada';

  @override
  String get itmPrevQty => 'Anterior';

  @override
  String get itmNewQty => 'Nuevo';

  @override
  String itmCost(String amount) {
    return 'Costo: $amount';
  }

  @override
  String get itmMore => 'Más';

  @override
  String get itmMenuPrintLabel => 'Imprimir etiqueta';

  @override
  String get itmMenuDuplicate => 'Duplicar';

  @override
  String get itmMenuPriceHistory => 'Historial de precios';

  @override
  String get itmMenuStockHistory => 'Historial de ajustes de existencias';

  @override
  String itmLowStockBadge(int count) {
    return '$count con stock bajo';
  }

  @override
  String itmStockLine(String qty) {
    return 'Existencias: $qty';
  }

  @override
  String get itmOfflineSaved => 'Sin conexión — artículo guardado en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get itmItemName => 'Nombre del artículo';

  @override
  String get itmNameRequired => 'El nombre es obligatorio';

  @override
  String get itmPricePkr => 'Precio (PKR)';

  @override
  String get itmPriceRequired => 'El precio es obligatorio';

  @override
  String get itmValidNumber => 'Introduce un número válido';

  @override
  String get itmUnit => 'Unidad';

  @override
  String get itmCategoryHint => 'Categoría (opcional, p. ej. Plomería)';

  @override
  String get itmPreferredSupplier => 'Proveedor preferido (opcional)';

  @override
  String get itmPreferredSupplierHelper => 'Se usa en la acción de reordenar con un toque';

  @override
  String get itmClear => 'Borrar';

  @override
  String get itmHsn => 'Código HSN (opcional)';

  @override
  String get itmGstRate => 'Tasa de GST % (opcional)';

  @override
  String get itmBarcodeOptional => 'Código de barras (opcional)';

  @override
  String get itmScanOrType => 'Escanear o escribir';

  @override
  String get itmScanBarcode => 'Escanear código de barras';

  @override
  String get itmPurchaseCost => 'Costo de compra (por unidad)';

  @override
  String get itmPurchaseCostHint => 'Lo que pagas al comprar existencias';

  @override
  String get itmWholesale => 'Precio mayorista (opcional)';

  @override
  String get itmContractor => 'Precio para contratistas (opcional)';

  @override
  String get itmFallsBack => 'Si no se indica, se usa el precio normal';

  @override
  String get itmStockQty => 'Cantidad en existencia';

  @override
  String get itmLowStockAlert => 'Alerta de stock bajo por debajo de';

  @override
  String get itmFrequently => 'Se compra a menudo con';

  @override
  String get itmSaveChanges => 'Guardar cambios';

  @override
  String get itmSaveItem => 'Guardar artículo';

  @override
  String get itmPhotoSemantics => 'Foto del artículo, toca para cambiarla';

  @override
  String get cdUpdateStatusTitle => 'Actualizar estado de pago';

  @override
  String get cdMarkPaidQ => '¿Marcar esta factura como pagada?';

  @override
  String get cdMarkUnpaidQ => '¿Marcar esta factura como no pagada?';

  @override
  String get cdConfirm => 'Confirmar';

  @override
  String cdCouldNotUpdate(String detail) {
    return 'No se pudo actualizar: $detail';
  }

  @override
  String get cdOfflineChangeSaved => 'Sin conexión — cambio guardado en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get cdConvertTitle => 'Convertir en factura';

  @override
  String get cdConvertBody => 'Esto descontará las existencias de estos artículos y convertirá la cotización en una factura real. ¿Continuar?';

  @override
  String get cdConvert => 'Convertir';

  @override
  String cdCouldNotConvert(String detail) {
    return 'No se pudo convertir: $detail';
  }

  @override
  String get cdReturnItems => 'Devolver artículos';

  @override
  String get cdReturnHint => 'Indica cuánto devolver de cada artículo. Déjalo en 0 para mantenerlo vendido.';

  @override
  String get cdDecreaseQty => 'Disminuir cantidad';

  @override
  String get cdIncreaseQty => 'Aumentar cantidad';

  @override
  String get cdCreditTotal => 'Total a favor';

  @override
  String get cdReturnSelected => 'Devolver seleccionados';

  @override
  String cdCouldNotReturn(String detail) {
    return 'No se pudo devolver: $detail';
  }

  @override
  String cdCouldNotVoid(String detail) {
    return 'No se pudo anular: $detail';
  }

  @override
  String get cdNoPreviousBill => 'No hay una factura anterior para repetir';

  @override
  String cdCouldNotLoadLast(String detail) {
    return 'No se pudo cargar la última factura: $detail';
  }

  @override
  String get cdInvoiceEmailed => 'Factura enviada por correo al cliente.';

  @override
  String cdCouldNotEmailInvoice(String detail) {
    return 'No se pudo enviar la factura por correo: $detail';
  }

  @override
  String get cdStatementEmailed => 'Estado de cuenta enviado por correo al cliente.';

  @override
  String cdCouldNotEmailStatement(String detail) {
    return 'No se pudo enviar el estado de cuenta por correo: $detail';
  }

  @override
  String get cdDeleteBillTitle => 'Eliminar factura';

  @override
  String get cdBillVoided => 'ANULADA';

  @override
  String get cdBillReturn => 'DEVOLUCIÓN';

  @override
  String get cdBillQuote => 'COTIZACIÓN';

  @override
  String get cdBillPaid => 'PAGADA';

  @override
  String get cdBillPartial => 'PARCIAL';

  @override
  String get cdBillUnpaid => 'PENDIENTE';

  @override
  String get cdBill => 'Factura';

  @override
  String cdVoidedReason(String reason) {
    return 'Anulada: $reason';
  }

  @override
  String get cdViewInvoice => 'Ver factura';

  @override
  String get cdEmailInvoice => 'Enviar factura por correo';

  @override
  String get cdEditBill => 'Editar factura';

  @override
  String get cdReturnBill => 'Devolver factura';

  @override
  String get cdVoidBill => 'Anular factura';

  @override
  String get cdNoItems => 'Sin artículos';

  @override
  String get cdRepeatLast => 'Repetir última factura';

  @override
  String get cdLedgerPdf => 'PDF del libro de cuentas';

  @override
  String get cdEmailStatement => 'Enviar estado de cuenta por correo';

  @override
  String get cdCollectPayment => 'Cobrar pago';

  @override
  String get cdSendReminder => 'Enviar recordatorio por WhatsApp';

  @override
  String get cdTotalBilled => 'Total facturado';

  @override
  String get cdPaid => 'Pagado';

  @override
  String get cdNoBills => 'Aún no hay facturas';

  @override
  String get cdBillActions => 'Acciones de la factura';

  @override
  String cdCreditUsed(String limit, String outstanding) {
    return '$outstanding de $limit del límite de crédito usado';
  }

  @override
  String get cdVoidBody => 'Se quita de los saldos y reportes, pero se conserva en el historial. Se restaurarán las existencias. No se puede deshacer.';

  @override
  String get cdReason => 'Motivo (opcional)';

  @override
  String get frmOfflineCustomer => 'Sin conexión — cliente guardado en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get frmOfflineSupplier => 'Sin conexión — proveedor guardado en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get frmEditCustomer => 'Editar cliente';

  @override
  String get frmCustomerName => 'Nombre del cliente';

  @override
  String get frmPhoneOptional => 'Teléfono (opcional)';

  @override
  String get frmCreditLimit => 'Límite de crédito (PKR, opcional)';

  @override
  String get frmCreditHelper => 'Avisar cuando el saldo de este cliente supere este valor';

  @override
  String get frmPriceTier => 'Nivel de precio';

  @override
  String get frmRetail => 'Minorista';

  @override
  String get frmWholesale => 'Mayorista';

  @override
  String get frmContractor => 'Contratista';

  @override
  String get frmPriceTierHelper => 'Qué precio de artículo rellena la factura para este cliente';

  @override
  String get frmStrn => 'STRN (opcional)';

  @override
  String get frmStrnCustomer => 'Número de registro de impuesto a las ventas de 13 dígitos para las facturas';

  @override
  String get frmStrnSupplier => 'Número de registro de impuesto a las ventas de 13 dígitos para las facturas de compra';

  @override
  String get frmAddress => 'Dirección (opcional)';

  @override
  String get frmEmail => 'Correo electrónico (opcional)';

  @override
  String get frmEmailHelper => 'Te permite enviar una factura o estado de cuenta por correo a este cliente';

  @override
  String get frmSaveCustomer => 'Guardar cliente';

  @override
  String get frmEditSupplier => 'Editar proveedor';

  @override
  String get frmSupplierName => 'Nombre del proveedor';

  @override
  String get frmSaveSupplier => 'Guardar proveedor';

  @override
  String get sdDeletePurchaseTitle => 'Eliminar compra';

  @override
  String get sdDeletePurchaseBody => 'Se restaurarán las existencias de esta compra. No se puede deshacer.';

  @override
  String get sdReturnToSupplier => 'Devolver al proveedor';

  @override
  String get sdReturnHint => 'Indica cuánto devolver de cada artículo. Déjalo en 0 para conservarlo.';

  @override
  String sdCouldNotMarkReceived(String detail) {
    return 'No se pudo marcar como recibida: $detail';
  }

  @override
  String get sdMarkPaidQ => '¿Marcar esta compra como pagada?';

  @override
  String get sdMarkUnpaidQ => '¿Marcar esta compra como no pagada?';

  @override
  String get sdTotalPurchased => 'Total comprado';

  @override
  String get sdPayable => 'Por pagar';

  @override
  String sdPayableAmount(String amount) {
    return '$amount por pagar';
  }

  @override
  String get sdNoPurchases => 'Aún no hay compras';

  @override
  String get sdPo => 'OC';

  @override
  String get sdDraftPo => 'OC BORRADOR';

  @override
  String get sdPurchase => 'Compra';

  @override
  String get sdDraftNote => 'Orden de compra en borrador — aún no recibida, sin cambios de existencias ni costos todavía.';

  @override
  String get sdReturnNote => 'Devolución / nota de crédito al proveedor.';

  @override
  String get sdMarkReceived => 'Marcar como recibida';

  @override
  String get sdEditPurchase => 'Editar compra';

  @override
  String get sdPurchaseActions => 'Acciones de la compra';

  @override
  String get slDeleteSupplier => 'Eliminar proveedor';

  @override
  String slDeleteManyTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Eliminar $count proveedores',
      one: 'Eliminar 1 proveedor',
    );
    return '$_temp0';
  }

  @override
  String slDeleteManyBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '¿Eliminar $count proveedores y todas sus compras? No se puede deshacer.',
      one: '¿Eliminar 1 proveedor y todas sus compras? No se puede deshacer.',
    );
    return '$_temp0';
  }

  @override
  String get slCsvNeedsRows => 'El CSV necesita una fila de encabezado y al menos un proveedor.';

  @override
  String get slImportTitle => 'Importar proveedores';

  @override
  String slImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se encontraron $count proveedores en \"$file\". ¿Importarlos todos?',
      one: 'Se encontró 1 proveedor en \"$file\". ¿Importarlos todos?',
    );
    return '$_temp0';
  }

  @override
  String slImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se importaron $count proveedores.',
      one: 'Se importó 1 proveedor.',
    );
    return '$_temp0';
  }

  @override
  String get slNoSuppliers => 'Aún no hay proveedores. Toca + para añadir uno.';

  @override
  String get slSearchHint => 'Buscar proveedores o teléfono...';

  @override
  String get slNoMatch => 'Ningún proveedor coincide con tu búsqueda.';

  @override
  String slCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count proveedores',
      one: '1 proveedor',
    );
    return '$_temp0';
  }

  @override
  String get sduTitle => 'Deudas con proveedores';

  @override
  String get sduNothingOwed => 'No se debe nada a los proveedores 🎉';

  @override
  String sduOwedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count proveedores por pagar',
      one: '1 proveedor por pagar',
    );
    return '$_temp0';
  }

  @override
  String sduDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días desde la compra impaga más antigua',
      one: '1 día desde la compra impaga más antigua',
    );
    return '$_temp0';
  }

  @override
  String get duBucket0 => '0–30 días';

  @override
  String get duBucket1 => '30–60 días';

  @override
  String get duBucket2 => '60+ días';

  @override
  String get duTitle => 'Centro de deudas';

  @override
  String get duNoDues => 'Sin deudas pendientes 🎉';

  @override
  String duOwingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count clientes con deudas',
      one: '1 cliente con deudas',
    );
    return '$_temp0';
  }

  @override
  String duDaysSince(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días desde la factura impaga más antigua',
      one: '1 día desde la factura impaga más antigua',
    );
    return '$_temp0';
  }

  @override
  String duAmountOutstanding(String amount) {
    return '$amount pendiente';
  }

  @override
  String get cpNoOutstanding => 'Este cliente no tiene saldo pendiente';

  @override
  String get cpValidAmount => 'Introduce un importe válido';

  @override
  String cpExceeds(String amount) {
    return 'El importe supera el saldo pendiente de $amount';
  }

  @override
  String cpCollected(String amount, String name) {
    return 'Se cobraron $amount a $name';
  }

  @override
  String get cpOfflineSaved => 'Sin conexión — pago guardado en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String cpOwes(String amount, String name) {
    return '$name debe $amount. Se aplica primero a su(s) factura(s) impaga(s) más antigua(s).';
  }

  @override
  String get cpAmountLabel => 'Importe cobrado (PKR)';

  @override
  String get cpCollect => 'Cobrar';

  @override
  String get usNoItems => 'No hay artículos que actualizar.';

  @override
  String get usHelp => 'Define las nuevas existencias de cada artículo y luego toca Guardar todo.';

  @override
  String usCurrent(String qty, String unit) {
    return '$unit  •  actual: $qty';
  }

  @override
  String usNew(String qty) {
    return 'nuevo: $qty';
  }

  @override
  String get usSubtract => 'Restar 1';

  @override
  String get usAdd => 'Sumar 1';

  @override
  String get usNoChanges => 'Sin cambios';

  @override
  String usSaveAll(int count) {
    return 'Guardar todo ($count cambiados)';
  }

  @override
  String get srHint => 'Busca clientes, artículos, importes...';

  @override
  String get srFailed => 'La búsqueda falló — revisa tu conexión.';

  @override
  String get srTitle => 'Busca en tu tienda';

  @override
  String get srSubtitle => 'Encuentra clientes por nombre o teléfono y facturas por importe.';

  @override
  String srNoMatches(String query) {
    return 'Sin resultados para \"$query\"';
  }

  @override
  String get srTryDifferent => 'Prueba con otro nombre, teléfono o importe.';

  @override
  String get srBills => 'Facturas';

  @override
  String get srNoItemList => 'Sin lista de artículos';

  @override
  String get abAddAtLeastOne => 'Añade al menos un artículo';

  @override
  String get abQuotationUpdated => '¡Cotización actualizada!';

  @override
  String get abBillUpdated => '¡Factura actualizada!';

  @override
  String get abQuotationSaved => '¡Cotización guardada!';

  @override
  String get abBillCreated => '¡Factura creada con éxito!';

  @override
  String abTotalAmount(String amount) {
    return 'Total: $amount';
  }

  @override
  String get abShare => 'Compartir';

  @override
  String get abDoneReturn => 'Listo y volver';

  @override
  String get abOverLimitBody => 'Esto haría que el cliente supere su límite de crédito.';

  @override
  String get abOverLimitTitle => 'Límite de crédito excedido';

  @override
  String get abBillAnyway => 'Facturar de todos modos';

  @override
  String get abOfflineBill => 'Sin conexión — factura guardada en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get abEditQuotation => 'Editar cotización';

  @override
  String get abEditBill => 'Editar factura';

  @override
  String get abNewQuotation => 'Nueva cotización';

  @override
  String get abAddBill => 'Añadir factura';

  @override
  String get abCouldNotLoadItems => 'No se pudieron cargar los artículos.';

  @override
  String abOverLimitWarn(String limit, String total) {
    return 'Esta factura dejaría al cliente en $total, por encima de su límite de crédito de $limit.';
  }

  @override
  String get abTapAddItemBill => 'Toca \"Añadir artículo\" abajo para empezar una factura';

  @override
  String get abNoCatalog => 'Aún no hay artículos en el catálogo';

  @override
  String get abScan => 'Escanear';

  @override
  String get abDiscountRs => 'Descuento (Rs)';

  @override
  String get abSubtotal => 'Subtotal';

  @override
  String get abTotal => 'Total';

  @override
  String get abSaveAsQuotation => 'Guardar como cotización';

  @override
  String get abQuotationLocked => 'Una factura existente no se puede convertir de nuevo en cotización';

  @override
  String get abQuotationNote => 'No se descuentan existencias hasta convertirla en factura';

  @override
  String get abPaymentStatus => 'Estado de pago';

  @override
  String get abUnpaid => 'Pendiente';

  @override
  String get abPaymentMethod => 'Método de pago';

  @override
  String get abCash => 'Efectivo';

  @override
  String get abBankTransfer => 'Transferencia bancaria';

  @override
  String get abCheque => 'Cheque';

  @override
  String get abSaveQuotation => 'Guardar cotización';

  @override
  String get abSaveBill => 'Guardar factura';

  @override
  String abAdded(String name) {
    return 'Añadido $name';
  }

  @override
  String get apNewItem => 'Artículo nuevo…';

  @override
  String get apNewItemHint => 'Primero añade un artículo nuevo al catálogo';

  @override
  String get apOfflinePurchase => 'Sin conexión — compra guardada en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get apEditPo => 'Editar orden de compra';

  @override
  String get apNewPo => 'Nueva orden de compra';

  @override
  String get apAddPurchase => 'Añadir compra';

  @override
  String get apTapAddItem => 'Toca \"Añadir artículo\" abajo para empezar una compra';

  @override
  String get apSaveAsPo => 'Guardar como orden de compra';

  @override
  String get apPoLocked => 'Una compra ya recibida no se puede convertir de nuevo en borrador';

  @override
  String get apPoNote => 'Sin cambios de existencias ni costos hasta marcar la mercancía como recibida';

  @override
  String get apUnpaidCredit => 'Pendiente (crédito)';

  @override
  String get apSavePo => 'Guardar orden de compra';

  @override
  String get apSavePurchase => 'Guardar compra';

  @override
  String apCurrentCost(String amount, String unit) {
    return 'Costo actual: $amount / $unit';
  }

  @override
  String apNoCost(String unit) {
    return 'Sin costo definido  •  $unit';
  }

  @override
  String scServerFail(int code) {
    return 'Falló el escaneo: error del servidor $code';
  }

  @override
  String get scOfflineSaved => 'Sin conexión — foto guardada; se leerá automáticamente al volver a estar en línea';

  @override
  String get scStillOffline => 'Sigue sin conexión';

  @override
  String get scCouldNotCreateCustomer => 'No se pudo crear el cliente — inténtalo de nuevo.';

  @override
  String get scCouldNotCreateSupplier => 'No se pudo crear el proveedor — inténtalo de nuevo.';

  @override
  String scBillSavedFor(String name) {
    return 'Factura guardada para $name';
  }

  @override
  String scPurchaseSavedFrom(String name) {
    return 'Compra guardada de $name';
  }

  @override
  String get scWhichCustomer => '¿Qué cliente es?';

  @override
  String get scWhichSupplier => '¿Qué proveedor es?';

  @override
  String scClosestMatch(String name, int score) {
    return 'Coincidencia más cercana: $name ($score% similar)';
  }

  @override
  String scYesThisIs(String name) {
    return 'Sí, es $name';
  }

  @override
  String get scOtherwiseCustomer => 'Si no, crea un cliente nuevo:';

  @override
  String get scOtherwiseSupplier => 'Si no, crea un proveedor nuevo:';

  @override
  String get scNoMatchCustomer => 'No se encontró ningún cliente coincidente. Crea uno nuevo:';

  @override
  String get scNoMatchSupplier => 'No se encontró ningún proveedor coincidente. Crea uno nuevo:';

  @override
  String get scCustomerName => 'Nombre del cliente';

  @override
  String get scSupplierName => 'Nombre del proveedor';

  @override
  String get scCreateNew => 'Crear nuevo';

  @override
  String get scTitleBill => 'Escanear factura';

  @override
  String get scIntroBill => 'Haz una foto de la factura. Si está escrita a mano no pasa nada, y vale en sindhi, urdu o inglés. Podrás revisarla antes de guardarla.';

  @override
  String get scIntroPurchase => 'Haz una foto de la factura del proveedor. Vale en sindhi, urdu o inglés. Podrás revisarla antes de guardarla.';

  @override
  String get scReadingBill => 'Leyendo factura…';

  @override
  String get scScanBill => 'Escanear una factura';

  @override
  String get scReadingInvoice => 'Leyendo factura…';

  @override
  String get scScanInvoice => 'Escanear una factura';

  @override
  String get scQueued => 'Escaneos en cola';

  @override
  String get scReady => 'Listo para revisar';

  @override
  String get scFailed => 'Falló';

  @override
  String get scWaiting => 'Esperando conexión';

  @override
  String get scRetry => 'Reintentar';

  @override
  String rpCouldNotLoad(String error) {
    return 'No se pudieron cargar los reportes: $error';
  }

  @override
  String get rpHeadline => 'Las cifras clave de este mes';

  @override
  String get rpProfitThisMonth => 'Ganancia de este mes';

  @override
  String get rpNoData => 'Aún no hay datos';

  @override
  String get rpSalesTax => 'Impuesto a las ventas';

  @override
  String rpSalesTaxFor(String month) {
    return 'Reporte de impuesto a las ventas de $month';
  }

  @override
  String get rpViewSalesTax => 'Ver reporte de impuesto a las ventas';

  @override
  String get rpQuickReports => 'Reportes rápidos';

  @override
  String get rpQuickSub => 'Ve directo a un reporte específico';

  @override
  String get expensesTitle => 'Gastos';

  @override
  String get rpRateCard => 'Lista de precios';

  @override
  String get rpDetails => 'Detalles';

  @override
  String get rpDetailsSub => 'Desgloses completos y clasificaciones';

  @override
  String get rpOutstandingByCustomer => 'Saldos pendientes por cliente';

  @override
  String get rpNoOutstanding => 'Sin saldos pendientes';

  @override
  String get rpMonthlyTotals => 'Totales mensuales';

  @override
  String get rpMostSold => 'Artículos más vendidos';

  @override
  String get rpNoItemsRecorded => 'Aún no hay artículos registrados';

  @override
  String get rpTopCustomers => 'Mejores clientes por ingresos';

  @override
  String get rpNoSalesRecorded => 'Aún no hay ventas registradas';

  @override
  String get rpTotalOutstanding => 'Total pendiente';

  @override
  String get rpViewCustomers => 'Ver clientes';

  @override
  String get lblInvoice => 'factura';

  @override
  String get lblLedger => 'libro de cuentas';

  @override
  String get lblRateCard => 'lista de precios';

  @override
  String get exCsvNeedsRows => 'El CSV necesita una fila de encabezado y al menos un gasto.';

  @override
  String get exCsvHeader => 'El encabezado del CSV debe incluir las columnas \"description\" y \"amount\".';

  @override
  String exLineBadAmount(int line) {
    return 'Línea $line: falta la descripción o el importe no es válido — corrige el archivo y reintenta.';
  }

  @override
  String exLineBadDate(String date, int line) {
    return 'Línea $line: fecha no válida \"$date\" — usa AAAA-MM-DD.';
  }

  @override
  String get exImportTitle => 'Importar gastos';

  @override
  String exImportConfirm(int count, String file) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se encontraron $count gastos en \"$file\". ¿Importarlos todos?',
      one: 'Se encontró 1 gasto en \"$file\". ¿Importarlos todos?',
    );
    return '$_temp0';
  }

  @override
  String exImported(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se importaron $count gastos.',
      one: 'Se importó 1 gasto.',
    );
    return '$_temp0';
  }

  @override
  String exImportFailedServer(int code) {
    return 'Falló la importación: error del servidor $code';
  }

  @override
  String get exDeleteTitle => 'Eliminar gasto';

  @override
  String get exAdd => 'Añadir gasto';

  @override
  String get exEdit => 'Editar gasto';

  @override
  String get exDescription => 'Descripción';

  @override
  String get exAmountRs => 'Importe (Rs)';

  @override
  String get exCategory => 'Categoría';

  @override
  String exDate(String date) {
    return 'Fecha: $date';
  }

  @override
  String get exRepeats => 'Se repite cada mes';

  @override
  String get exRepeatsHint => 'Alquiler, electricidad, salarios, etc.';

  @override
  String get exReceiptTap => 'Foto del recibo, toca para cambiarla';

  @override
  String get exReceiptOptional => 'Foto del recibo (opcional)';

  @override
  String get exEnterValid => 'Introduce una descripción y un importe válido.';

  @override
  String get exOffline => 'Sin conexión — gasto guardado en este dispositivo; se sincronizará automáticamente al volver a estar en línea';

  @override
  String get exSave => 'Guardar gasto';

  @override
  String exRecurringDue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gastos recurrentes vencen este mes',
      one: '1 gasto recurrente vence este mes',
    );
    return '$_temp0';
  }

  @override
  String get exAddShort => 'Añadir';

  @override
  String get exTotal => 'Total de gastos';

  @override
  String exCategoryChip(String name) {
    return 'Categoría: $name';
  }

  @override
  String get exNoneLogged => 'Aún no hay gastos registrados';

  @override
  String exNoneInCategory(String name) {
    return 'Aún no hay gastos de $name';
  }

  @override
  String get exViewReceipt => 'Ver recibo';

  @override
  String get exEditRow => 'Editar gasto';

  @override
  String get exDeleteRow => 'Eliminar gasto';

  @override
  String gstServerReturned(String first, String second) {
    return 'El servidor devolvió $first/$second';
  }

  @override
  String gstCouldNotLoad(String error) {
    return 'No se pudieron cargar los datos de GST: $error';
  }

  @override
  String gstFailedDownload(int code) {
    return 'Falló la descarga ($code)';
  }

  @override
  String gstSaved(String filename) {
    return '$filename guardado';
  }

  @override
  String gstSavedDownloads(String filename) {
    return 'Guardado en Descargas/$filename';
  }

  @override
  String gstCouldNotDownload(String error) {
    return 'No se pudo descargar: $error';
  }

  @override
  String get gstTitle => 'Reporte de impuesto a las ventas';

  @override
  String get gstOutwardDetail => 'Ventas emitidas — detalle de facturas';

  @override
  String get gstNoBills => 'No hay facturas este mes.';

  @override
  String get gstHsn => 'Resumen HSN';

  @override
  String get gstInvoiceWise => 'Detalle por factura';

  @override
  String get gstMonthly => 'Resumen mensual';

  @override
  String get gstOutwardTaxable => 'Suministros emitidos sujetos a impuesto';

  @override
  String get gstItc => 'Crédito de impuesto soportado (de compras)';

  @override
  String get gstSave => 'Guardar';

  @override
  String get rcValidAmount => 'Introduce un importe válido.';

  @override
  String get rcExpected => 'Efectivo esperado (ventas en efectivo de hoy)';

  @override
  String get rcAlsoCollected => 'También cobrado hoy (no contado en la caja)';

  @override
  String get rcCounted => 'Efectivo contado en la caja (Rs)';

  @override
  String get rcCompare => 'Comparar';

  @override
  String get rcMatches => '¡Coincide exactamente!';

  @override
  String rcExtra(String amount) {
    return '$amount de más en la caja';
  }

  @override
  String rcMissing(String amount) {
    return '$amount de menos en la caja';
  }

  @override
  String get pbiTitle => 'Ganancia por artículo';

  @override
  String get pbiNoSales => 'Aún no hay ventas';

  @override
  String get pbiByCategory => 'Por categoría';

  @override
  String get pbiItemsByProfit => 'Artículos por ganancia';

  @override
  String get svTitle => 'Valor del inventario';

  @override
  String get svNone => 'No hay existencias';

  @override
  String get svItemsByValue => 'Artículos por valor';

  @override
  String svSummary(String items, String units) {
    return '$items artículos · $units unidades en el estante';
  }

  @override
  String svTied(String amount) {
    return '$amount inmovilizados en inventario';
  }

  @override
  String get svEstimated => 'estimado según precio de venta';

  @override
  String get bkRestoreTitle => '¿Restaurar copia de seguridad?';

  @override
  String bkRestoreBody(String filename) {
    return 'Esto reemplazará TODOS los datos actuales con el archivo de copia \"$filename\". ¿Continuar?';
  }

  @override
  String get bkRestore => 'Restaurar';

  @override
  String get bkRestoreDoneTitle => 'Restauración completa';

  @override
  String get bkRestoreDoneBody => 'Tus datos han sido restaurados.';

  @override
  String get bkOk => 'Aceptar';

  @override
  String bkRestoreFailed(String detail) {
    return 'Falló la restauración: $detail';
  }

  @override
  String bkCouldNotRestore(String error) {
    return 'No se pudo restaurar: $error';
  }

  @override
  String get bkSaveToDownloads => 'Guardar en Descargas';

  @override
  String get bkIntroAdmin => 'Todos tus datos están en un solo archivo de base de datos. Descarga una copia con regularidad y restáurala si algo sale mal.';

  @override
  String get bkIntroStaff => 'La copia de seguridad completa y su restauración son solo para administradores. Pídeselo a un administrador o exporta abajo lo que necesites en CSV.';

  @override
  String get bkBackupDb => 'Copia de la base de datos';

  @override
  String get bkBackupDbSub => 'Descarga toda la base de datos en un archivo y compártelo (WhatsApp, Drive, correo).';

  @override
  String get bkDownloadPhone => 'Descargar copia al teléfono';

  @override
  String get bkShareBackup => 'Compartir copia';

  @override
  String get bkAutoTitle => 'Copias automáticas';

  @override
  String bkAutoBody(int count, String time) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count copias diarias guardadas en el servidor, la más reciente de $time. Se ejecutan solas — no hay nada que hacer aquí.',
      one: '1 copia diaria guardada en el servidor, la más reciente de $time. Se ejecuta sola — no hay nada que hacer aquí.',
    );
    return '$_temp0';
  }

  @override
  String get bkRestoreSub => 'Elige un archivo de copia guardado para reemplazar los datos actuales.';

  @override
  String get bkRestoreFromFile => 'Restaurar desde archivo de copia';

  @override
  String get bkExportCsv => 'Exportar a CSV';

  @override
  String get bkExportSub => 'Ábrelos en Excel o compártelos.';

  @override
  String get bkRangeAll => 'Facturas/Gastos: todo el tiempo';

  @override
  String bkRangeSome(String end, String start) {
    return 'Facturas/Gastos: del $start al $end';
  }

  @override
  String get bkSetRange => 'Definir rango';

  @override
  String get bkClearRange => 'Borrar rango';

  @override
  String get ntNever => 'Nunca activado';

  @override
  String get ntJustNow => 'Justo ahora';

  @override
  String ntMinutesAgo(int count) {
    return 'hace $count min';
  }

  @override
  String ntHoursAgo(int count) {
    return 'hace $count h';
  }

  @override
  String ntDaysAgo(int count) {
    return 'hace $count d';
  }

  @override
  String get ntTitle => 'Notificaciones inteligentes';

  @override
  String get ntTapHint => 'Toca \"Comprobar ahora\" para activar una notificación y ver resultados en vivo.';

  @override
  String get ntLowStockSub => 'Avisar cuando los artículos bajen de su nivel de reposición.';

  @override
  String get ntCheckNow => 'Comprobar ahora';

  @override
  String get ntOverdue => 'Recordatorios de pagos vencidos';

  @override
  String get ntOverdueSub => 'Avisar sobre facturas impagas de días anteriores.';

  @override
  String get ntDaily => 'Resumen diario del negocio';

  @override
  String get ntDailySub => 'Ventas, cobros y ganancias de ayer de un vistazo.';

  @override
  String get ntSendSummary => 'Enviar resumen';

  @override
  String get ntRunning => 'En ejecución…';

  @override
  String get ntLowStockItems => 'Artículos con stock bajo';

  @override
  String get ntSales => 'Ventas';

  @override
  String get ntCollected => 'Cobrado';

  @override
  String get ntProfit => 'Ganancia';

  @override
  String get auChecking => 'Buscando actualizaciones…';

  @override
  String get auLatest => 'Tienes la versión más reciente.';

  @override
  String get auAvailable => 'Actualización disponible';

  @override
  String auNewer(int code) {
    return 'Hay una versión más nueva de Book-Keep (compilación $code) lista.';
  }

  @override
  String get auLater => 'Más tarde';

  @override
  String get auUpdate => 'Actualizar';

  @override
  String get auDownloading => 'Descargando actualización';

  @override
  String auSaved(String name) {
    return '$name guardado en tu carpeta de Descargas.';
  }

  @override
  String get auAllowInstall => 'Permite que Book-Keep instale apps y luego toca Actualizar de nuevo.';

  @override
  String get auFailed => 'No se pudo actualizar — revisa tu conexión e inténtalo de nuevo.';

  @override
  String get lgSearch => 'Buscar idiomas';

  @override
  String lgNoMatch(String query) {
    return 'Ningún idioma coincide con \"$query\"';
  }

  @override
  String get alVoided => 'Anuló una factura';

  @override
  String get alDeletedBill => 'Eliminó una factura';

  @override
  String get alReturned => 'Devolvió una factura';

  @override
  String get alDeletedCustomer => 'Eliminó un cliente';

  @override
  String get alDeletedSupplier => 'Eliminó un proveedor';

  @override
  String get alCreatedAccount => 'Creó una cuenta';

  @override
  String get alUpdatedAccount => 'Actualizó una cuenta';

  @override
  String get alDeletedAccount => 'Eliminó una cuenta';

  @override
  String get alTitle => 'Registro de actividad';

  @override
  String get alNone => 'Aún no hay actividad registrada';

  @override
  String get blkEnterOne => 'Introduce al menos un artículo';

  @override
  String blkAdded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artículos añadidos correctamente',
      one: '1 artículo añadido correctamente',
    );
    return '$_temp0';
  }

  @override
  String get blkTitle => 'Añadir artículos en lote';

  @override
  String get blkFormat => 'Un artículo por línea, formato: Nombre, Precio, Unidad, Categoría';

  @override
  String get blkOptional => 'La unidad y la categoría son opcionales (por defecto: piece, ninguna)';

  @override
  String get blkAddAll => 'Añadir todos los artículos';

  @override
  String get prSend => 'Enviar recordatorio de pago';

  @override
  String get prTone => 'Elige el tono:';

  @override
  String get prPolite => 'Cortés';

  @override
  String get prStandard => 'Estándar';

  @override
  String get prUrgent => 'Urgente';

  @override
  String get prPreviewQr => 'Vista previa del QR de pago JazzCash';

  @override
  String get prShareText => 'Compartir texto';

  @override
  String get dsRemaining => 'Pendiente';

  @override
  String dsIncludesDiscount(String amount) {
    return 'incluye $amount de descuento';
  }

  @override
  String get dsItems => 'Artículos';

  @override
  String get dsDiscount => 'Descuento';

  @override
  String get lkWrongPin => 'PIN incorrecto';

  @override
  String get lkEnterPin => 'Introduce el PIN';

  @override
  String get lkChecking => 'Comprobando huella...';

  @override
  String get bcTitle => 'Escanear código de barras';

  @override
  String get bcTorchNa => 'La linterna no está disponible en este dispositivo';

  @override
  String get bcTorch => 'Linterna';

  @override
  String get bcPoint => 'Apunta la cámara a un código de barras';

  @override
  String get qrNoNumber => 'No hay número de JazzCash configurado. Defínelo en Ajustes para mostrar un código QR de pago.';

  @override
  String get qrPay => 'Pagar con JazzCash';

  @override
  String get qrInvalid => 'Datos QR no válidos';

  @override
  String qrAmount(String amount) {
    return 'Importe: $amount';
  }

  @override
  String qrNumber(String number) {
    return 'JazzCash: $number';
  }

  @override
  String get qrCopy => 'Copiar número de JazzCash';

  @override
  String get qrCopied => 'Número de JazzCash copiado al portapapeles';

  @override
  String get qrHint => 'Escanea o copia este número en tu app JazzCash para pagar.';

  @override
  String clOwed(String amount) {
    return '$amount pendiente';
  }

  @override
  String get lnEnterEmailFirst => 'Primero introduce arriba un correo electrónico válido.';

  @override
  String get lnResetSent => 'Correo de restablecimiento enviado — revisa tu bandeja de entrada.';

  @override
  String get lnNoAccount => 'No se encontró ninguna cuenta para ese correo.';

  @override
  String get lnWrongPassword => 'Contraseña incorrecta.';

  @override
  String get lnInvalidEmail => 'Eso no parece un correo electrónico válido.';

  @override
  String get lnDisabled => 'Esta cuenta ha sido desactivada.';

  @override
  String get lnTooMany => 'Demasiados intentos — vuelve a intentarlo en un minuto.';

  @override
  String get lnNoInternet => 'Sin conexión a internet.';

  @override
  String get lnWeakPassword => 'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get lnCouldNotSignIn => 'No se pudo iniciar sesión. Inténtalo de nuevo.';

  @override
  String get lnWrongPasswordHint => 'Contraseña incorrecta. Inténtalo de nuevo o toca \"¿Olvidaste tu contraseña?\".';

  @override
  String get lnWrongEmail => 'Correo incorrecto — ninguna cuenta usa esa dirección.';

  @override
  String get lnWrongEmailOrPassword => 'Correo o contraseña incorrectos.';

  @override
  String get lnWrongUsername => 'Nombre de usuario incorrecto — ninguna cuenta usa ese nombre.';

  @override
  String get lnWelcome => 'Bienvenido de nuevo';

  @override
  String lnSignInTo(String app) {
    return 'Inicia sesión en $app';
  }

  @override
  String get lnEmailOrUsername => 'Correo o nombre de usuario';

  @override
  String get lnRemember => 'Recordarme';

  @override
  String get lnForgot => '¿Olvidaste tu contraseña?';

  @override
  String get lnSignIn => 'Iniciar sesión';

  @override
  String get lnGoogle => 'Continuar con Google';

  @override
  String get lnNew => '¿Eres nuevo?';

  @override
  String get lnCreate => 'Crear cuenta';

  @override
  String suCreated(String email) {
    return 'Cuenta creada para $email. Se envió un correo de verificación (opcional).';
  }

  @override
  String suSetup(String app) {
    return 'Configura $app';
  }

  @override
  String get suName => 'Nombre';

  @override
  String get suEmail => 'Correo electrónico';

  @override
  String suPhoneDigits(int digits) {
    return 'Introduce un número válido de $digits dígitos';
  }

  @override
  String get suCreateBtn => 'Crear cuenta';

  @override
  String get suHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get suAlreadyExists => 'Ya existe una cuenta con ese correo.';

  @override
  String get suInvalidEmail => 'Correo electrónico no válido.';

  @override
  String get agShow => 'Mostrar contraseña';

  @override
  String get agHide => 'Ocultar contraseña';

  @override
  String get adAccounts => 'Cuentas';

  @override
  String adAccountsSub(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cuentas registradas',
      one: '1 cuenta registrada',
    );
    return '$_temp0';
  }

  @override
  String get adAdd => 'Añadir';

  @override
  String get adNoAccounts => 'No se encontraron cuentas.';

  @override
  String get adAccountability => 'Responsabilidad';

  @override
  String get adAccountabilitySub => 'Quién anuló, eliminó o devolvió algo, y cambios en cuentas.';

  @override
  String get adActivitySub => 'Facturas anuladas, eliminaciones, cambios en cuentas';

  @override
  String get adServer => 'Servidor';

  @override
  String get adServerSub => 'Con quién se comunica esta app. Rara vez hay que cambiarlo tras la configuración.';

  @override
  String get adServerHint => 'El emulador usa 10.0.2.2; un teléfono real necesita la IP del portátil en la misma red Wi-Fi. Cambiarlo afecta a todas las cuentas.';

  @override
  String get adApiBase => 'URL base de la API';

  @override
  String get adSaveServer => 'Guardar dirección del servidor';

  @override
  String get adEmailSetSub => 'Configurado — el personal puede enviar facturas/estados de cuenta por correo a los clientes.';

  @override
  String get adNotSetUp => 'Aún no configurado.';

  @override
  String get adEmailSetBody => 'El correo está configurado. Permite al personal enviar una factura o estado de cuenta directamente a un cliente.';

  @override
  String get adEmailHelp => 'Una dirección de Gmail funciona con una contraseña de aplicación (smtp.gmail.com, puerto 587), o usa los datos SMTP de tu proveedor de correo.';

  @override
  String get adSmtpHost => 'Host SMTP';

  @override
  String get adSmtpPort => 'Puerto SMTP';

  @override
  String get adEmailAddress => 'Dirección de correo';

  @override
  String get adPwKeep => 'Contraseña (déjala en blanco para mantener la actual)';

  @override
  String get adPwApp => 'Contraseña (contraseña de aplicación, no tu contraseña de acceso)';

  @override
  String get adFromName => 'Nombre del remitente (opcional)';

  @override
  String get adFromHint => 'Mi ferretería';

  @override
  String get adSaving => 'Guardando...';

  @override
  String get adSaveEmail => 'Guardar ajustes de correo';

  @override
  String get adAddAccount => 'Añadir cuenta';

  @override
  String get adNameOpt => 'Nombre (opcional)';

  @override
  String get adAtLeast6 => 'Al menos 6 caracteres';

  @override
  String get adGrantAdmin => 'Conceder administrador';

  @override
  String get adCanManage => 'Puede anular/eliminar/devolver';

  @override
  String get adCanManageHint => 'Anular o eliminar una factura, devolver una factura o eliminar un cliente/proveedor. Un administrador siempre lo tiene.';

  @override
  String get adCreate => 'Crear';

  @override
  String get adAccountCreated => 'Cuenta creada.';

  @override
  String adCreateFailed(String error) {
    return 'Falló la creación: $error';
  }

  @override
  String get adEditAccount => 'Editar cuenta';

  @override
  String get adAdminSwitch => 'Administrador';

  @override
  String get adAdminHint => 'Puede abrir el panel de administración';

  @override
  String get adDisabled => 'Desactivada';

  @override
  String get adDisabledHint => 'Bloqueada para iniciar sesión';

  @override
  String get adAccountUpdated => 'Cuenta actualizada.';

  @override
  String adUpdateFailed(String error) {
    return 'Falló la actualización: $error';
  }

  @override
  String adDeleteBody(String label) {
    return '$label se eliminará de forma permanente y ya no podrá iniciar sesión.';
  }

  @override
  String get adAccountDeleted => 'Cuenta eliminada.';

  @override
  String adDeleteFailed(String error) {
    return 'Falló la eliminación: $error';
  }

  @override
  String get adBadgeAdmin => 'ADMIN';

  @override
  String get adBadgeDisabled => 'DESACTIVADA';

  @override
  String get adOff => 'El panel de administración está desactivado';

  @override
  String get adCheckAgain => 'Comprobar de nuevo';

  @override
  String get adAccessRequired => 'Se requiere acceso de administrador';

  @override
  String get adAccessBody => 'Solo los administradores de la tienda pueden gestionar cuentas. Pide al dueño de la tienda que te dé acceso de administrador.';

  @override
  String get adCouldNotLoad => 'No se pudo cargar el panel de administración.';

  @override
  String get adBadPort => 'Introduce un número de puerto SMTP válido.';

  @override
  String get adEmailSaved => 'Ajustes de correo guardados.';

  @override
  String adEmailSaveFailed(String error) {
    return 'No se pudieron guardar los ajustes de correo: $error';
  }

  @override
  String get adServerEmpty => 'La dirección del servidor no puede estar vacía.';

  @override
  String get adServerSaved => 'Dirección del servidor guardada. Las pantallas la usarán en la próxima carga.';

  @override
  String get lnOr => 'o';

  @override
  String get scNotABill => 'Eso no parece una factura. Inténtalo de nuevo con una foto nítida de la factura.';

  @override
  String get scNotAnInvoice => 'Eso no parece una factura. Inténtalo de nuevo con una foto nítida de la factura del proveedor.';

  @override
  String get jqOpenFull => 'Tamaño completo';

  @override
  String get jqCopy => 'Copiar número';

  @override
  String get jqSheetTitle => 'QR de JazzCash';

  @override
  String get jqSheetHint => 'Los clientes lo escanean en su app de JazzCash para pagarte.';

  @override
  String get jqCheck => 'Revisa el número';

  @override
  String get askVoice => 'Voz';

  @override
  String get askVoiceFallbackNote => 'Leyendo esto con la voz de tu teléfono.';

  @override
  String get askPace => 'Ritmo';

  @override
  String get askTone => 'Tono';

  @override
  String get askPaceSlower => 'Más lento';

  @override
  String get askPaceNormal => 'Normal';

  @override
  String get askPaceFaster => 'Más rápido';

  @override
  String get askToneCalm => 'Tranquilo';

  @override
  String get askToneWarm => 'Cálido';

  @override
  String get askToneCheerful => 'Alegre';

  @override
  String qPaymentUpdate(String amount) {
    return 'Actualización de pago: $amount';
  }

  @override
  String qCustomer(String name) {
    return 'Cliente: $name';
  }

  @override
  String qSupplier(String name) {
    return 'Proveedor: $name';
  }

  @override
  String qItem(String name) {
    return 'Artículo: $name';
  }

  @override
  String qExpense(String name) {
    return 'Gasto: $name';
  }

  @override
  String qPurchase(String amount) {
    return 'Compra: $amount';
  }

  @override
  String qPaymentCollected(String amount, String name) {
    return 'Pago cobrado: $amount de $name';
  }

  @override
  String gstAmount(String amount) {
    return 'IVA $amount';
  }

  @override
  String gstItemLine(String tax, String taxable, String total) {
    return 'Base imponible $taxable  ·  IVA $tax  ·  Total $total';
  }

  @override
  String rpBreakdown(String cogs, String expenses, String revenue) {
    return 'Ingresos: $revenue  •  Costo de ventas: $cogs  •  Gastos: $expenses';
  }

  @override
  String msgReminderGentle(String amount, String customer, String shop) {
    return 'Hola $customer, un cordial saludo de $shop. Su saldo total pendiente es $amount. ¡Gracias!';
  }

  @override
  String msgReminderStandard(String amount, String customer, String shop) {
    return 'Hola $customer, recordatorio de pago de $shop por el saldo pendiente de $amount. Le agradecemos pagar lo antes posible.';
  }

  @override
  String msgReminderUrgent(String amount, String customer, String shop) {
    return 'AVISO URGENTE: Estimado/a $customer, su pago pendiente de $amount en $shop sigue sin saldarse. Por favor, pague de inmediato.';
  }

  @override
  String msgPayViaJazzCash(String number) {
    return 'Pague con JazzCash: $number';
  }

  @override
  String msgInvoiceShare(String items, String shop, String status, String total) {
    return 'Factura de $shop\nTotal: $total\nArtículos: $items\nEstado: $status';
  }

  @override
  String msgReorder(String lines, String shop, String supplier) {
    return 'Hola $supplier, le escribe $shop. Quisiéramos hacer un pedido de:\n$lines\n\nPor favor confirme disponibilidad y precio. Gracias.';
  }

  @override
  String ppUpdated(String date) {
    return 'Última actualización: $date';
  }

  @override
  String get ppWhoH => 'Quiénes somos';

  @override
  String ppWho(String owner, String email) {
    return '$owner, responsable de Book-keep.\nContacto: $email';
  }

  @override
  String get ppCollectH => 'Qué datos recopilamos';

  @override
  String get ppCollectAccount => 'Cuenta: correo electrónico, número de teléfono y nombre de usuario, mediante Firebase Authentication.';

  @override
  String get ppCollectShop => 'Perfil de la tienda: nombre, dirección, número de teléfono, número de JazzCash y logotipo de la tienda, introducidos por el dueño en Ajustes.';

  @override
  String get ppCollectRecords => 'Registros del negocio que usted crea: nombres y teléfonos de clientes y proveedores, facturas, compras, catálogo de artículos (incluidas fotos y códigos de barras) y gastos (incluidas fotos de recibos). Son los datos centrales de la app: así funciona la contabilidad.';

  @override
  String get ppCollectDevice => 'Datos del dispositivo y de diagnóstico: un token de notificaciones push (para alertas de poco stock, pagos vencidos y resumen diario) e informes de fallos (información del dispositivo y trazas de error) mediante Firebase Crashlytics, enviados automáticamente cuando la app falla.';

  @override
  String ppCollectAi(String askShop) {
    return 'Funciones de IA: $askShop, el resumen matutino con IA y el escáner de facturas/compras con IA envían una instantánea de los datos del negocio pertinentes (cifras de informes o una foto de una factura) a la API Gemini de Google para generar una respuesta, un resumen o las líneas extraídas. Google procesa estos datos para generar la respuesta; ni nosotros ni Google los usamos para entrenar modelos fuera de las condiciones estándar de la API de Google.';
  }

  @override
  String get ppDontH => 'Lo que no hacemos';

  @override
  String get ppDontLocation => 'No rastreamos su ubicación.';

  @override
  String get ppDontAds => 'No usamos redes publicitarias ni herramientas de analítica de comportamiento o repetición de sesiones.';

  @override
  String get ppDontSell => 'No vendemos sus datos ni los de sus clientes a nadie.';

  @override
  String get ppWhereH => 'Dónde se guardan los datos';

  @override
  String get ppWhereDb => 'Base de datos: Neon (Postgres), un proveedor externo de bases de datos en la nube.';

  @override
  String get ppWhereFirebase => 'Autenticación, notificaciones push, informes de fallos y almacenamiento de fotos: Firebase (Google).';

  @override
  String get ppWhereAi => 'Procesamiento de IA: API Gemini de Google.';

  @override
  String ppWhereEmail(String adminPanel) {
    return 'Correos de facturas: se envían mediante la cuenta SMTP que el administrador de su tienda configura en $adminPanel. No tenemos listas de correo; son facturas o estados de cuenta individuales para sus propios clientes, no publicidad masiva.';
  }

  @override
  String get ppYoursH => 'Sus datos, los datos de sus clientes';

  @override
  String get ppYours => 'Todo lo que introduce (clientes, proveedores, facturas, artículos) pertenece a su tienda. Otras tiendas que usan Book-keep no pueden verlo. Las cuentas de personal que cree para su tienda solo ven aquello a lo que usted les dé acceso.';

  @override
  String get ppControlsH => 'Sus controles';

  @override
  String ppControlExport(String path) {
    return 'Exportar o respaldar sus datos: $path';
  }

  @override
  String ppControlDelete(String path) {
    return 'Eliminar su cuenta: $path. Esto solo elimina su credencial de acceso; no borra los registros del negocio de su tienda (facturas, clientes, artículos, etc.), igual que quitar a un empleado no borra los registros que creó.';
  }

  @override
  String ppControlNotif(String path) {
    return 'Notificaciones: se pueden desactivar por tipo en $path.';
  }

  @override
  String get ppChildrenH => 'Menores';

  @override
  String get ppChildren => 'Book-keep es una herramienta de trabajo para dueños y personal de tiendas. No está dirigida a menores ni es usada a sabiendas por ellos.';

  @override
  String get ppChangesH => 'Cambios en esta política';

  @override
  String get ppChanges => 'Si cambia lo que recopilamos o adónde va, actualizaremos esta página y cambiaremos la fecha de arriba.';

  @override
  String get ppContactH => 'Contacto';

  @override
  String ppContact(String email) {
    return 'Preguntas sobre esta política o sus datos: $email';
  }

  @override
  String get waHello => '¡Hola!';

  @override
  String waHelloNamed(String name) {
    return 'Hola $name,';
  }

  @override
  String get gstTaxable => 'Gravable';

  @override
  String get gstTax => 'Impuesto';

  @override
  String get gstTaxableValue => 'Valor gravable';

  @override
  String get gstTotalTax => 'Impuesto total';

  @override
  String get gstTotalItc => 'Total crédito fiscal (ITC)';

  @override
  String get gstExempt => 'Ventas exentas';

  @override
  String get gstNetPayable => 'Impuesto neto a pagar';

  @override
  String get unknownName => 'Desconocido';

  @override
  String get unitPiece => 'pieza';

  @override
  String get unitKg => 'kg';

  @override
  String get unitMeter => 'metro';

  @override
  String get unitBox => 'caja';

  @override
  String get unitDozen => 'docena';

  @override
  String get unitLiter => 'litro';

  @override
  String get unitBag => 'bolsa';

  @override
  String deleteSupplierMessage(String name) {
    return '¿Eliminar a $name y todas sus compras? Esta acción no se puede deshacer.';
  }
}
