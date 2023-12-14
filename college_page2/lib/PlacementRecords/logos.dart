import 'package:flutter/material.dart';

class Logos extends StatelessWidget {
  const Logos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logos/1.png",height: 40),
                Image.asset("assets/logos/2.png",height: 40),
                Image.asset("assets/logos/3.png",height: 40),
                Image.asset("assets/logos/5.png",height: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logos/4.png",height: 40),
                Image.asset("assets/logos/6.png",height: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logos/7.png",height: 40),
                Image.asset("assets/logos/9.png",height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
