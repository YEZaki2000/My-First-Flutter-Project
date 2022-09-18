import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemeMode {
  late ThemeMode myThemeMode;

  MyThemeMode({required this.myThemeMode});

  factory MyThemeMode.fromJson(Map<String, dynamic> json) {
    return MyThemeMode(myThemeMode: json['myThemeMode']);
  }
}



// var myJsonVar = readJson();
