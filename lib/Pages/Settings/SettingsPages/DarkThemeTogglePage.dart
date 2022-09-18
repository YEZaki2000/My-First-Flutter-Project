import 'package:flutter/material.dart';

import 'package:flutter_application_1/Theme/MyThemeController.dart';
import 'package:flutter_application_1/Theme/MyThemeConstants.dart';

class DarkThemeTogglePage extends StatefulWidget {
  const DarkThemeTogglePage({Key? key, required this.refresh})
      : super(key: key);
  final VoidCallback refresh;

  @override
  State<DarkThemeTogglePage> createState() => _DarkThemeTogglePageState();
}

class _DarkThemeTogglePageState extends State<DarkThemeTogglePage> {
  final MyThemeController _themeController = MyThemeController();
  late int _themeindex = lightMode;

  Future<void> _changeTheme(bool aValue) async {
    final int newIndex = await _themeController.saveTheme(aValue);
    setState(() {
      _themeindex = newIndex;
    });
    widget.refresh();
  }

  Future<void> _getTheme() async {
    final int newIndex = await _themeController.loadTheme();
    setState(() {
      _themeindex = newIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Theme")),
      body: Center(
        child: Switch(
          value: ThemeMode.values[_themeindex] == ThemeMode.dark,
          onChanged: (newValue) {
            _changeTheme(newValue);
          },
        ),
      ),
    );
  }
}

//////////////
///old code THAT WORKS for theme controller
///  // Future<void> _loadTheme() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _themeindex = prefs.getInt('mytheme') ?? 1;
  //   });
  // }

  // Future<void> _saveTheme(bool isDark) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (isDark) {
  //     prefs.setInt('mytheme', 2);
  //   } else {
  //     prefs.setInt('mytheme', 1);
  //   }
  //   _loadTheme();
  //   widget.refresh();
  // }
