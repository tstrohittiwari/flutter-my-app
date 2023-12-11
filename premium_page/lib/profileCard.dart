import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          color: Color.fromARGB(255, 255, 229, 107),
          elevation: 5,
          shadowColor: Color.fromARGB(124, 199, 197, 132),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  Text(
                    "Rohit Tiwari",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Glad to see you again",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Image(
                image: AssetImage("assets/1.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
