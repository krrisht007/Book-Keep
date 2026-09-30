import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart' as http;
import 'config.dart';

Future<String?> getOrCreateWalkInCustomer() async {
  const walkInName = 'Walk-in Customer';
  final prefs = await SharedPreferences.getInstance();
  final cached = prefs.getString('walk_in_customer_id');
  if (cached != null) return cached;
  try {
    final response = await http.get(
      Uri.parse('${AppConfig.baseUrl}/customers'),
    );
    if (response.statusCode == 200) {
      final customers = jsonDecode(response.body) as List;
      for (final c in customers) {
        if ((c['name'] as String?)?.toLowerCase() == walkInName.toLowerCase()) {
          final id = c['id'] as String;
          await prefs.setString('walk_in_customer_id', id);
          return id;
        }
      }
    }
    final created = await http.post(
      Uri.parse('${AppConfig.baseUrl}/customers'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': walkInName}),
    );
    if (created.statusCode == 200) {
      final id = (jsonDecode(created.body) as Map)['id'] as String;
      await prefs.setString('walk_in_customer_id', id);
      return id;
    }
  } catch (_) {}
  return null;
}
