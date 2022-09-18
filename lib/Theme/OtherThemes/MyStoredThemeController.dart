import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MyFirstStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final firstFile = File('$path/Theme.txt');
    return firstFile.writeAsString('light');
  }

  Future<File> writeValue(bool value) async {
    final file = await _localFile;

    if (value) {
      return file.writeAsString('dark');
    } else {
      return file.writeAsString('light');
    }
  }

  Future<String> readValue() async {
    final file = await _localFile;

    // Read the file
    final contents = file.readAsString();

    return 'ThemeMode.$contents';
  }
}
