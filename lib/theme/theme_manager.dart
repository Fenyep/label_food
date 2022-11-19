import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  static ThemeManager? _themeManagerInstance;

  toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static getInstance() {
    if (_themeManagerInstance == null) {
      _themeManagerInstance = ThemeManager();
      return _themeManagerInstance;
    }
    return _themeManagerInstance;
  }
}
