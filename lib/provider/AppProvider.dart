import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage="en";
  ThemeMode appTheme = ThemeMode.dark;

  AppProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('language')!;
    String? theme = prefs.getString('theme');
    if (theme != null) {
      appTheme = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', newLanguage);
      appLanguage = newLanguage;
      notifyListeners();
    } catch (e) {
      // Handle errors here if needed
      print('Failed to change language: $e');
    }
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', newTheme == ThemeMode.dark ? 'dark' : 'light');
      appTheme = newTheme;
      notifyListeners();
    } catch (e) {
      // Handle errors here if needed
      print('Failed to change theme: $e');
    }
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
