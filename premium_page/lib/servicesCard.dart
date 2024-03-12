import 'package:flutter/material.dart';
import 'package:premium_page/News/news_home.dart';
import 'package:premium_page/chat/chat_home.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color.fromARGB(255, 255, 229, 107),
        elevation: 5,
        shadowColor: Color.fromARGB(124, 199, 197, 132),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Card(
                    color: Color.fromARGB(255, 52, 23, 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatHome()),
                        );
                      },
                      icon: Icon(
                        Icons.messenger,
                        color: Colors.white,
                      ),
                      iconSize: 50,
                    ),
                  ),
                  Text("Chat")
                ],
              ),
              Column(
                children: [
                  Card(
                    color: Color.fromARGB(255, 52, 23, 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewsHome()),
                        );
                      },
                      icon: Icon(
                        Icons.newspaper_rounded,
                        color: Colors.white,
                      ),
                      iconSize: 50,
                    ),
                  ),
                  Text("News"),
                ],
              ),
              Column(
                children: [
                  Card(
                    color: Color.fromARGB(255, 52, 23, 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.video_call_rounded,
                        color: Colors.white,
                      ),
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
