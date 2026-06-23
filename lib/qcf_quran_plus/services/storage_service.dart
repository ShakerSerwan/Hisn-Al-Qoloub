import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> savePage(int page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_page', page);
  }

  static Future<int> getPage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('last_page') ?? 1;
  }
}