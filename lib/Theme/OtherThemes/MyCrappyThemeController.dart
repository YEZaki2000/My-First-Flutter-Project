import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class MyThemeController with ChangeNotifier {
  late ThemeMode? _themeMode;
  ThemeMode? get themeMode => _themeMode;
  final String myFilePath = 'lib/Theme/Theme.json';

  Future readFromJson(String filePath, ThemeMode? mode) async {
    var data = await File(filePath).readAsString();
    var map = jsonDecode(data);
    MyJsonReader mapObject =
        map.map<MyJsonReader>((json) => MyJsonReader.fromJson(json));
    mode = mapObject.myThemeMode;
  }

  Future<void> handleThemeMap(String filePath, bool dark) async {
    var data = await File(filePath).readAsString();
    var map = jsonDecode(data);
    map['themeMode'].cast<ThemeMode>();
    if (dark) {
      map['themeMode'] = ThemeMode.dark;
      _themeMode = ThemeMode.dark;
    } else {
      map['themeMode'] = ThemeMode.light;
      _themeMode = ThemeMode.light;
    }

    var newMap = jsonEncode(map);
    var newData = File(filePath).writeAsStringSync(newMap);
  }

  // Future<void> writeToJson(String filePath, String value) async {
  //   var data = await File(filePath).readAsString();
  //   var map = jsonDecode(data);
  //   map['themeMode'] = value;
  //   var newData = jsonEncode(map);
  //   File(filePath).writeAsStringSync(newData);
  // }

  handleSwitch(bool isDark) async {
    // _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    handleThemeMap('lib/Theme/Theme.json', isDark);

    notifyListeners();
  }
}

class MyJsonReader {
  late ThemeMode myThemeMode;

  MyJsonReader({required this.myThemeMode});

  factory MyJsonReader.fromJson(Map json) {
    return MyJsonReader(myThemeMode: json['themeMode']);
  }
}
