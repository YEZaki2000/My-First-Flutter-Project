import 'package:shared_preferences/shared_preferences.dart';

import 'MyThemeConstants.dart';

class MyThemeController {
  Future<int> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('mynewtheme') ?? lightMode;
  }

  Future<int> saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isDark) {
      prefs.setInt('mynewtheme', darkMode);
    } else {
      prefs.setInt('mynewtheme', lightMode);
    }
    return await loadTheme();
  }
}
