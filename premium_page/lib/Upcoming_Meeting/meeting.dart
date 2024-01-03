import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:premium_page/Upcoming_Meeting/upcoming_meetings_card.dart';

import 'PastMeetings.dart';

class Meetings extends StatelessWidget {
  const Meetings({super.key});

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
              "College Mitra",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Upcoming Meeting",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                UpcomingMeetingCard(),

                SizedBox(
                  height: 20,
                ),
                Text(
                  "Past Meetings",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                PastMeetingCard(meetingDate: "19 January 2024"),
                PastMeetingCard(meetingDate: "15 January 2024"),
                PastMeetingCard(meetingDate: "12 January 2024"),
                PastMeetingCard(meetingDate: "9 January 2024"),
                PastMeetingCard(meetingDate: "6 January 2024"),
                PastMeetingCard(meetingDate: "3 January 2024"),
                PastMeetingCard(meetingDate: "1 January 2024"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
