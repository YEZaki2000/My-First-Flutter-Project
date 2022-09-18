import 'dart:async';
import 'package:flutter/material.dart';

// class MySplash extends StatefulWidget {
//   const MySplash({Key? key}) : super(key: key);

//   @override
//   State<MySplash> createState() => _MySplashState();
// }

// class _MySplashState extends State<MySplash> {
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   setState(() {
//   //     Timer(const Duration(seconds: 3), () {});
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return const MySplash();
//   }
// }

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );

  late final AnimationController _otherController = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);

  late final Animation<double> _fadeAnimation = Tween(begin: 1.0, end: 0.0)
      .animate(CurvedAnimation(parent: _otherController, curve: Curves.easeIn));

  void _playAnimation() {
    _otherController.forward();
    _controller.forward().then((value) {
      _goToHomePage();
      // _otherController.forward(from: 0);
      // FadeTransition(
      //   opacity: _fadeAnimation,
      // );
    });
  }

  void _goToHomePage() {
    Navigator.pushReplacementNamed(context, '/Home Page');
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      _playAnimation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        child: Center(
          child: Container(
            width: 1.25,
            height: 1.25,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 231, 246),
                borderRadius: BorderRadius.circular(2)),
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _controller.value * MediaQuery.of(context).size.height,
            child: child,
          );
        });
  }
}
