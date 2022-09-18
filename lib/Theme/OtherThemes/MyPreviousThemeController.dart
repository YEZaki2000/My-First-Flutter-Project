import 'package:flutter/material.dart';

class MyPreviousThemeController with ChangeNotifier {
  late ThemeMode? _themeMode = ThemeMode.light;
  ThemeMode? get themeMode => _themeMode;

  void handleSwitch(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
