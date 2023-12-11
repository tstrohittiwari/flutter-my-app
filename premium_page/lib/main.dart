import 'package:flutter/material.dart';
import 'package:premium_page/mentorCard.dart';
import 'package:premium_page/moreInfo.dart';
import 'package:premium_page/profileCard.dart';
import 'package:premium_page/servicesCard.dart';

void main() {
  runApp(const PremiumPage());
}

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

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
              backgroundColor: Colors.transparent.withOpacity(0),
              title: Text(
                "Edge",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCard(),
                  ServicesCard(),
                  MentorSection(),
                  MoreInfo(),
                ],
              ),
            )),
      ),
    );
  }
}
