import 'package:flutter/material.dart';
import 'package:dice_app/gradient_color.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
          body: GradientColor(Colors.amber[200],Colors.amber[300],Colors.amber[400]),
      ),
    ),
  );
}