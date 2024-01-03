import 'package:flutter/material.dart';
import 'package:premium_page/MoreInfo/account_info.dart';
import 'package:premium_page/MoreInfo/choice_filling.dart';
import 'package:premium_page/MoreInfo/form_filling.dart';
import 'package:premium_page/MoreInfo/key_dates.dart';
import 'package:premium_page/MoreInfo/upcoming_meeting.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        width: 700,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          color: Color.fromARGB(255, 255, 229, 107),
          elevation: 5,
          shadowColor: Color.fromARGB(124, 199, 197, 132),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                FormFilling(),
                ChoiceFilling(),
                UpcomingMeeting(),
                KeyDates(),
                AccountInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
