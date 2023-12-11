import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color.fromARGB(255, 255, 229, 107),
        elevation: 5,
        shadowColor: Color.fromARGB(124, 199, 197, 132),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.messenger),
                      iconSize: 50,
                    ),
                  ),
                  Text("Chat")
                ],
              ),
              Column(
                children: [
                  Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.newspaper_rounded),
                      iconSize: 50,
                    ),
                  ),
                  Text("News"),
                ],
              ),
              Column(
                children: [
                  Card(
                    color: Color.fromARGB(128, 255, 255, 229),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.video_call_rounded),
                      iconSize: 50,
                    ),
                  ),
                  Text("Video Chat")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
