import 'package:flutter/material.dart';

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({required this.text, required this.fontSize, super.key});

  final String text;
  final double fontSize;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
    );
  }
}
