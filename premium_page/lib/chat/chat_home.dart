import 'package:flutter/material.dart';

import 'groupCard.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 80, 64, 47),
              Color.fromARGB(255, 48, 39, 38),
              Color.fromARGB(255, 28, 22, 25),
              Color.fromARGB(255, 48, 39, 38),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent.withOpacity(0),
            title: Text(
              "Groups",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                GroupCard(
                  bgImage: "assets/4.png",
                  counsellingName: "Jossa",
                  studentImage: "assets/1.png",
                  studentMessage: "Jossa ki dates kya hai",
                  studentName: "Newton",
                ),
                GroupCard(
                  bgImage: "assets/5.png",
                  counsellingName: "HSTES",
                  studentImage: "assets/1.png",
                  studentMessage: "Jossa ki dates kya hai",
                  studentName: "Newton",
                ),
                GroupCard(
                  bgImage: "assets/6.png",
                  counsellingName: "UPTAC",
                  studentImage: "assets/1.png",
                  studentMessage: "Jossa ki dates kya hai",
                  studentName: "Newton",
                ),
                GroupCard(
                  bgImage: "assets/4.png",
                  counsellingName: "MPDTE",
                  studentImage: "assets/1.png",
                  studentMessage: "Jossa ki dates kya hai",
                  studentName: "Newton",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
