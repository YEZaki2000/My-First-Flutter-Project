import 'package:flutter/material.dart';

class MyFadeTransition extends Route<dynamic> {
  MyFadeTransition({required this.page});

  Widget page;

  PageRouteBuilder<dynamic> buildTransition() {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 800),
    );
  }

  // PageRouteBuilder<dynamic> get buildTransition => _buildTransition(page);
}
