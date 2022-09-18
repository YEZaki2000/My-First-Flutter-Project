import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefsThemeController with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _themeValueIndex;

  get myprefs => _prefs;
  get mythemeValueIndex => _themeValueIndex;
}
