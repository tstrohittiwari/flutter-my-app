import 'package:flutter/material.dart';

class MentorSection extends StatelessWidget {
  const MentorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        height: 100,
        child: Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          color: const Color.fromARGB(255, 255, 229, 107),
          elevation: 5,
          shadowColor: const Color.fromARGB(124, 199, 197, 132),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Mentor",
                    style:
                    TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  Text(
                    "Gautam Kumar",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5,),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_ic_call_sharp),
                iconSize: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
