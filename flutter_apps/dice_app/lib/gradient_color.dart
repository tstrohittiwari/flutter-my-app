import 'package:flutter/material.dart';
import 'package:dice_app/rollDice.dart';

const startAlignment = Alignment.centerLeft;
const endAlignment = Alignment.centerRight;

class GradientColor extends StatelessWidget {
  const GradientColor(this.mycolor1, this.mycolor2, this.mycolor3, {super.key});

  final mycolor1;
  final mycolor2;
  final mycolor3;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          // Colors.lightBlueAccent,
          // Colors.blue,
          // Colors.blueAccent,
          // Colors.indigo
          mycolor1,
          mycolor2,
          mycolor3
        ], begin: startAlignment, end: endAlignment),
      ),
      child: const Center(
          child: RollDice(),
      ),
    );
  }
}
