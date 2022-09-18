import 'package:flutter/material.dart';

import 'Pages/Pages.dart';
import 'PageTransitions/PageTransitions.dart';

import 'Theme/MyThemeController.dart';
import 'Theme/MyThemeConstants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 100));

  final MyThemeController _themeController = MyThemeController();
  late int _themeindex = lightMode;

  Future<void> _getTheme() async {
    final int newIndex = await _themeController.loadTheme();
    setState(() {
      _themeindex = newIndex;
    });
  }

  @override
  void initState() {
    _getTheme();
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.values[_themeindex],
        title: 'Dream Note',
        theme:
            ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Ubuntu'),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            fontFamily: 'Ubuntu'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const MySplash(),
          '/Settings': (context) => const Settings(),
          '/WriteNotesPage': (context) => const WriteNotesPage(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/DarkThemeTogglePage':
              return MySlideTransition(
                      page: DarkThemeTogglePage(refresh: _getTheme))
                  .buildTransition();

            case '/Home Page':
              return MyFadeTransition(page: const MyHomePage())
                  .buildTransition();
          }
        });
  }
}
