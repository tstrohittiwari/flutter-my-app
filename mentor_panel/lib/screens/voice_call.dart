import 'dart:core';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Student {
  final String name;
  final String rank;
  final String category;
  final String homeState;
  final String gender;
  final String phoneNo;

  Student({
    required this.name,
    required this.rank,
    required this.category,
    required this.homeState,
    required this.gender,
    required this.phoneNo,
  });
}

class VoiceCall extends StatefulWidget {
  const VoiceCall({Key? key}) : super(key: key);

  @override
  State<VoiceCall> createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  final List<Student> students = [
    Student(
      name: 'Rohit',
      rank: '82000',
      category: 'General',
      homeState: 'Telangana',
      gender: 'Male',
      phoneNo: 'tel:+918919595544',
    ),
    Student(
      name: 'Pallab',
      rank: '87654',
      category: 'General',
      homeState: 'Assam',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Nitesh',
      rank: '79500',
      category: 'SC',
      homeState: 'Haryana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Varun',
      rank: '89574',
      category: 'General',
      homeState: 'Haryana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Ankit',
      rank: '65821',
      category: 'OBC',
      homeState: 'Rajasthan',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Rohit',
      rank: '82000',
      category: 'General',
      homeState: 'Telangana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Rohit',
      rank: '82000',
      category: 'General',
      homeState: 'Telangana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Pallab',
      rank: '87654',
      category: 'General',
      homeState: 'Assam',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Nitesh',
      rank: '79500',
      category: 'SC',
      homeState: 'Haryana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Varun',
      rank: '89574',
      category: 'General',
      homeState: 'Haryana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Ankit',
      rank: '65821',
      category: 'OBC',
      homeState: 'Rajasthan',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Rohit',
      rank: '82000',
      category: 'General',
      homeState: 'Telangana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Rohit',
      rank: '82000',
      category: 'General',
      homeState: 'Telangana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Pallab',
      rank: '87654',
      category: 'General',
      homeState: 'Assam',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Nitesh',
      rank: '79500',
      category: 'SC',
      homeState: 'Haryana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Varun',
      rank: '89574',
      category: 'General',
      homeState: 'Haryana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Ankit',
      rank: '65821',
      category: 'OBC',
      homeState: 'Rajasthan',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
    Student(
      name: 'Rohit',
      rank: '82000',
      category: 'General',
      homeState: 'Telangana',
      gender: 'Male',
      phoneNo: 'tel:+919830268966',
    ),
  ];

  // Future<void> _makePhoneCall(String phoneNumber) async {
  //   final launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber ?? '', // Use empty string if phoneNumber is null
  //   );
  //   await launchUrl(launchUri);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          final student = students[index];
          return ListTile(
            trailing: IconButton(
              onPressed: () async {
                final call = Uri.parse(student.phoneNo);
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
            title: Text(student.name),
            subtitle: Text(student.rank),
          );
        },
      ),
    );
  }
}
