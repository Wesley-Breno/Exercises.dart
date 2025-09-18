import 'package:flutter/material.dart';
import 'package:testzone/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          color1: Colors.deepPurple,
          color2: Colors.purple,
        ),
      ),
    ),
  );
}
