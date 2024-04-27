import 'package:bmi_calculator/inputScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(100, 5, 16, 58),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 231, 0, 0),
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.yellowAccent,
          background: Color.fromARGB(255, 122, 118, 253),
          onBackground: Colors.white,
          surface: Color.fromARGB(255, 103, 255, 255),
          onSurface: Colors.white,
        ),
           scaffoldBackgroundColor: Colors.black54,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        )
      ),
      home: InputPage(),
    );
  }
}