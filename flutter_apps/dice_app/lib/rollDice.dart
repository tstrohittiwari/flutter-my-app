import 'dart:math';
import 'package:flutter/material.dart';

final randomizer=Random();

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() {
    return _RollDiceState();
  }
}

class _RollDiceState extends State<RollDice> {
  var currentDiceRoll=2;

  void rolldice() {
    setState(() {
      currentDiceRoll=randomizer.nextInt(6)+1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: rolldice,
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                foregroundColor: Colors.indigo,
                textStyle: const TextStyle(fontSize: 28)),
            child: const Text('Roll Dice'))
      ],
    );
  }
}
