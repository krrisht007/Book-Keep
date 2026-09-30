
import 'package:flutter_test/flutter_test.dart';
import 'package:bookkeeper_app/config.dart';

void main() {
  final saved = AppConfig.baseUrl;
  tearDown(() => AppConfig.baseUrl = saved);

  test('relative path gets the base URL', () {
    AppConfig.baseUrl = 'https://api.example.com';
    expect(
      AppConfig.mediaUrl('/uploads/items/a.jpg'),
      'https://api.example.com/uploads/items/a.jpg',
    );
  });

  test('absolute URL is returned unchanged', () {
    AppConfig.baseUrl = 'https://api.example.com';
    const blob = 'https://abc.public.blob.vercel-storage.com/items/a-xyz.jpg';
    expect(AppConfig.mediaUrl(blob), blob);
    expect(AppConfig.mediaUrl('http://192.168.1.5/x.jpg'), 'http://192.168.1.5/x.jpg');
  });
}
