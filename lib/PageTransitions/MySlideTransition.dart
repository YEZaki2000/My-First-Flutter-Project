import 'package:flutter/material.dart';

class MySlideTransition extends Route<dynamic> {
  MySlideTransition({required this.page});

  Widget page;

  PageRouteBuilder<dynamic> buildTransition() {
    return PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        settings: settings,
        pageBuilder: ((context, animation, secondaryAnimation) => page));
  }

  // PageRouteBuilder<dynamic> get buildTransition => _buildTransition(page);
}
