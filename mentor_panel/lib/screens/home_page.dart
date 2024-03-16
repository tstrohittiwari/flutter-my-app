import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_panel/screens/chatScreen/main_chat.dart';
import 'package:mentor_panel/screens/group_chat.dart';
import 'package:mentor_panel/screens/student_details/student_details.dart';
import 'package:mentor_panel/screens/voice_call.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://meet.google.com');

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  //AUTHH
  final String mentorID = '20993e27-880e-4a3c-8de0-40f5284a9c98';

  String? mentorCouncelling;

//FETCHING DATA FROM SUPABASE
  Future<String> fetchdata(mentorID) async {
    final response =
    await Supabase.instance.client.from('mentor').select()
        .eq('mentor_id' , mentorID);
    return response[0]['councelling'];
  }

  // List<Map<String, dynamic>>? fetchedData;
  //
  @override
  void initState() {
    super.initState();
    _fetchData(mentorID);
  }

  Future<void> _fetchData(mentorID) async {
    try {
      mentorCouncelling = await fetchdata(mentorID);
      print(mentorCouncelling);
    } catch (error) {}
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Column(
        children: [
          InfoButtons(
            myIcon: CupertinoIcons.profile_circled,
            label: "Student Details",
            onTap: () {
              // print(coun);
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => StudentDetails(councelling: mentorCouncelling), AUTH
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

              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => ChatMainScreen(councelling: mentorCouncelling), AUTH
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
                  // builder: (context) => VoiceCall(councelling: mentorCouncelling), AUTH
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
                  // builder: (context) => GroupChat(groupID: mentorCouncelling), AUTH
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
