// import 'dart:core';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
//
// class Student {
//   final String name;
//   final String rank;
//   final String category;
//   final String homeState;
//   final String gender;
//   final String phoneNo;
//
//   Student({
//     required this.name,
//     required this.rank,
//     required this.category,
//     required this.homeState,
//     required this.gender,
//     required this.phoneNo,
//   });
// }
//
// class VoiceCall extends StatefulWidget {
//   const VoiceCall({Key? key}) : super(key: key);
//
//   @override
//   State<VoiceCall> createState() => _VoiceCallState();
// }
//
// class _VoiceCallState extends State<VoiceCall> {
//   final List<Student> students = [
//     Student(
//       name: 'Rohit',
//       rank: '82000',
//       category: 'General',
//       homeState: 'Telangana',
//       gender: 'Male',
//       phoneNo: 'tel:+918919595544',
//     ),
//     Student(
//       name: 'Pallab',
//       rank: '87654',
//       category: 'General',
//       homeState: 'Assam',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Nitesh',
//       rank: '79500',
//       category: 'SC',
//       homeState: 'Haryana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Varun',
//       rank: '89574',
//       category: 'General',
//       homeState: 'Haryana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Ankit',
//       rank: '65821',
//       category: 'OBC',
//       homeState: 'Rajasthan',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Rohit',
//       rank: '82000',
//       category: 'General',
//       homeState: 'Telangana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Rohit',
//       rank: '82000',
//       category: 'General',
//       homeState: 'Telangana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Pallab',
//       rank: '87654',
//       category: 'General',
//       homeState: 'Assam',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Nitesh',
//       rank: '79500',
//       category: 'SC',
//       homeState: 'Haryana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Varun',
//       rank: '89574',
//       category: 'General',
//       homeState: 'Haryana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Ankit',
//       rank: '65821',
//       category: 'OBC',
//       homeState: 'Rajasthan',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Rohit',
//       rank: '82000',
//       category: 'General',
//       homeState: 'Telangana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Rohit',
//       rank: '82000',
//       category: 'General',
//       homeState: 'Telangana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Pallab',
//       rank: '87654',
//       category: 'General',
//       homeState: 'Assam',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Nitesh',
//       rank: '79500',
//       category: 'SC',
//       homeState: 'Haryana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Varun',
//       rank: '89574',
//       category: 'General',
//       homeState: 'Haryana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Ankit',
//       rank: '65821',
//       category: 'OBC',
//       homeState: 'Rajasthan',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//     Student(
//       name: 'Rohit',
//       rank: '82000',
//       category: 'General',
//       homeState: 'Telangana',
//       gender: 'Male',
//       phoneNo: 'tel:+919830268966',
//     ),
//   ];
//
//   //AUTH mentorInfo = //
//   // fetch mentor's councelling
//   final mentorCoun = "jossa";
//
//   Future<List<Map<String, dynamic>>> fetchdata(mentorCoun) async {
//     final response =
//     await Supabase.instance.client.from('studentdata').select().eq('councelling' , mentorCoun);
//     return response;
//   }
//
//
//   // Future<void> _makePhoneCall(String phoneNumber) async {
//   //   final launchUri = Uri(
//   //     scheme: 'tel',
//   //     path: phoneNumber ?? '', // Use empty string if phoneNumber is null
//   //   );
//   //   await launchUrl(launchUri);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Students"),
//       ),
//       body: ListView.builder(
//         itemCount: students.length,
//         itemBuilder: (BuildContext context, int index) {
//           final student = students[index];
//           return ListTile(
//             trailing: IconButton(
//               onPressed: () async {
//                 final call = Uri.parse(student.phoneNo);
//                 print("mycall");
//                 if (await canLaunchUrl(call)) {
//                   launchUrl(call);
//                 } else {
//                   throw 'Could not launch $call';
//                 }
//               },
//               icon: Icon(Icons.call),
//             ),
//             leading: const Text(
//               "GFG",
//               style: TextStyle(color: Colors.green, fontSize: 15),
//             ),
//             title: Text(student.name),
//             subtitle: Text(student.rank),
//           );
//         },
//       ),
//     );
//   }
// }


import 'dart:core';
import 'package:flutter/material.dart';

// import 'package:mentor_panel/screens/student_details/pop_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Student {
  final String name;
  final String rank;
  final String category;
  final String homeState;
  final String gender;

  Student({
    required this.name,
    required this.rank,
    required this.category,
    required this.homeState,
    required this.gender,
  });
}

class VoiceCall extends StatefulWidget {
  //AUTH
  // final councelling;
  // const VoiceCall({Key? key,required this.councelling}) : super(key: key);

  final councelling = 'jossa';
  const VoiceCall({Key? key}) : super(key: key);


  @override
  State<VoiceCall> createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  TextEditingController studentName = TextEditingController();
  TextEditingController studentCategory = TextEditingController();
  TextEditingController studentDomicile = TextEditingController();



//FETCHING DATA FROM SUPABASE(JO ROHIT KO NHI AATA)
  Future<List<Map<String, dynamic>>> fetchdata() async {
    final response =
    await Supabase.instance.client.from('studentdata').select().eq(
        'councelling', widget.councelling);
    return response;
  }

  List<Map<String, dynamic>>? fetchedData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      fetchedData = await fetchdata();
    } catch (error) {}
  }

  @override
  void dispose() {
    studentName.dispose();
    studentCategory.dispose();
    studentDomicile.dispose();
    super.dispose();
  }

  //SUTEDNT DETAILS
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber ?? '', // Use empty string if phoneNumber is null
    );
    await launchUrl(launchUri);
  }

  //STUDENT LIST
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body:
      FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchdata(),
        // Assuming fetchData() returns a Future<List<Map<String, dynamic>>>
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data =
            snapshot.data!; // Safe access to data after checking hasData
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final student = data[index];
                final phoneNo = data[index]['phNo'];
                // final jsonString = jsonEncode(student);
                return ListTile(

                  trailing: IconButton(
                    onPressed: () async {
                      final call = Uri.parse("tel:$phoneNo");
                      print("mycall");
                      if (await canLaunchUrl(call)) {
                        launchUrl(call);
                      } else {
                        throw 'Could not launch $call';
                      }
                    },
                    icon: Icon(Icons.call),
                  ),
                  leading: const Text(
                    "GFG",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text(student['name']),
                  subtitle: Text(student['rank']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
                child:
                Text('Error: ${snapshot.error}')); // Display error message
          }

          // Show a loading indicator while fetching data
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

