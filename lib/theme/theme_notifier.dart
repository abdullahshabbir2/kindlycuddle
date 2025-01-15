import 'package:cuddle_care/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeMode _themeMode = ThemeMode.light;
  bool _isDarkMode = false;
  final String _key = 'themeMode';
  final String _darkmode = 'darkmode';
  final String _themeDataText = 'themeData';

  ThemeNotifier() {
    _loadThemeFromPrefs();
  }

  ThemeData get themeData => _themeData;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;

  Future<void> toggleTheme() async {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    _isDarkMode = !_isDarkMode;
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_key, _themeMode == ThemeMode.dark);
    prefs.setBool(_darkmode, _isDarkMode);
    prefs.setBool(_themeDataText, _themeData == darkMode);
    notifyListeners();
  }

  Future<void> _loadThemeFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode =
        prefs.getBool(_darkmode) ?? false; // Default to false (light mode)
    _themeData = _isDarkMode ? darkMode : lightMode; // Default to light mode
    _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
