class AppConfig {
  static const String defaultBaseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  static String baseUrl = defaultBaseUrl;

  static String mediaUrl(String pathOrUrl) =>
      pathOrUrl.startsWith('http') ? pathOrUrl : '$baseUrl$pathOrUrl';

  static bool firebaseReady = false;

  static const String googleWebClientId =
      '1035883965889-8b11fhbs089dj23tekkddhdrliirbirv.apps.googleusercontent.com';

  static String jazzcashNumber = '';

  static String shopName = 'Hardware Store';
}
