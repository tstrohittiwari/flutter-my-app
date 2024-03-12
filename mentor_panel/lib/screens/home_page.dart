import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_panel/screens/chatScreen/main_chat.dart';
import 'package:mentor_panel/screens/group_chat.dart';
import 'package:mentor_panel/screens/student_details/student_details.dart';
import 'package:mentor_panel/screens/voice_call.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://meet.google.com');

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InfoButtons(
            myIcon: CupertinoIcons.profile_circled,
            label: "Student Details",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetails(),
                ),
              );
            },
          ),
          InfoButtons(
            myIcon: CupertinoIcons.videocam_circle,
            label: "Meetings",
            onTap: () {
              print("Meetings");
              _launchUrl();
            },
          ),
          InfoButtons(
            myIcon: Icons.message_outlined,
            label: "Chat",
            onTap: () {
              print("Chat");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatMainScreen(),
                ),
              );
            },
          ),
          InfoButtons(
            myIcon: Icons.email_outlined,
            label: "Bulk Mail",
            onTap: () {
              print("Bulk Mail");
            },
          ),
          InfoButtons(
            myIcon: Icons.add_ic_call_outlined,
            label: "Voice Call",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VoiceCall(),
                ),
              );
            },
          ),
          InfoButtons(
            myIcon: Icons.video_call_outlined,
            label: "Grounp Chat",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroupChat(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InfoButtons extends StatelessWidget {
  const InfoButtons({
    Key? key,
    required this.myIcon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final IconData myIcon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(myIcon, size: 30),
              const SizedBox(
                width: 20,
              ),
              Text(label, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
