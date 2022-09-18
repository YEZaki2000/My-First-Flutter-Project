import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'SettingsPages/SettingsPages.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _goToDarkThemeTogglePage() {
    Navigator.pushNamed(context, '/DarkThemeTogglePage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: ListView(
          children: [
            ListTile(
              title: const Text("Theme"),
              onTap: _goToDarkThemeTogglePage,
            )
          ],
        ));
  }
}
