import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('vi');

  Locale get locale => _locale;

  LocaleProvider() {
    _loadSavedLocale();
  }

  // Tải ngôn ngữ đã lưu từ SharedPreferences
  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('locale') ?? 'vi';
    _locale = Locale(savedLocale);
    notifyListeners();
  }

  // Thay đổi ngôn ngữ
  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }
}