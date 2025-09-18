import 'dart:math';

import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer({
    required this.color1,
    required this.color2,
    super.key,
  });

  final Color color1;
  final Color color2;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  final images = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png',
  ];

  int imageChoiced = 0;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.color1, widget.color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              int newChoice;
              do {
                newChoice = Random().nextInt(images.length);
              } while (newChoice == imageChoiced && images.length > 1);
              imageChoiced = newChoice;
            });
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Image.asset(
              images[imageChoiced],
              key: ValueKey<int>(imageChoiced),
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
