import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastMeetingCard extends StatelessWidget {
  const PastMeetingCard({super.key, required this.meetingDate});

  final String meetingDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        height: 80,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
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
                    "Meeting of",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  Text(
                    meetingDate,
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  side: MaterialStatePropertyAll(
                      BorderSide(color: Colors.white, width: 2)),
                  elevation: MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 80, 64, 47),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: Text(
                    "Play Now",
                    style: TextStyle(color: Color.fromARGB(255, 255, 229, 107)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
