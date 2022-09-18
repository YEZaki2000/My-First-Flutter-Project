import 'package:flutter/material.dart';
import 'dart:async';

class BouncingBallDemo extends StatefulWidget {
  @override
  _BouncingBallDemoState createState() => _BouncingBallDemoState();
}

class _BouncingBallDemoState extends State<BouncingBallDemo> {
  late double marginTop;
  late bool reversed;
  // late double marginBottom = marginTop + 60;

  void changePosition(Timer t) async {
    if (!mounted) return;
    setState(() {
      if (!reversed) {
        marginTop += 1;
        // print(marginTop);
        // print(reversed);
        if (marginTop == 60) {
          reversed = true;
        }
      } else {
        marginTop -= 1;
        if (marginTop == 0) {
          reversed = false;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    marginTop = 0;
    reversed = false;
    Timer.periodic(const Duration(milliseconds: 16), changePosition);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: marginTop,
      ),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}
