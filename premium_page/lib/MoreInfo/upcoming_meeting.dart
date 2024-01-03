import 'package:flutter/material.dart';
import 'package:premium_page/MoreInfo/extra_services.dart';
import 'package:premium_page/Upcoming_Meeting/meeting.dart';

class UpcomingMeeting extends StatelessWidget {
  const UpcomingMeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtraServices(
      serviceIcon: Icons.groups,
      serviceName: "Upcoming Meetings",
      onTapHandler: CustomTapHandler((BuildContext context) async {
        // Handle onTap logic here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Meetings()),
        );
      }),
    );
  }
}
