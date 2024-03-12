// import 'package:flutter/material.dart';
// import 'package:premium_page/mentorCard.dart';
// import 'package:premium_page/MoreInfo/more_info.dart';
// import 'package:premium_page/profileCard.dart';
// import 'package:premium_page/servicesCard.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
//
// void main() {
//   runApp(const PremiumPage());
// }
//
//
// class PremiumPage extends StatelessWidget {
//   const PremiumPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromARGB(255, 80, 64, 47),
//               Color.fromARGB(255, 48, 39, 38),
//               Color.fromARGB(255, 28, 22, 25),
//               Color.fromARGB(255, 48, 39, 38),
//             ],
//           ),
//         ),
//         child: Scaffold(
//             backgroundColor: Colors.transparent.withOpacity(0),
//             appBar: AppBar(
//               backgroundColor: Colors.transparent.withOpacity(0),
//               title: Text(
//                 "Edge",
//                 style: TextStyle(color: Colors.white),
//               ),
//               centerTitle: true,
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ProfileCard(),
//                   ServicesCard(),
//                   MentorSection(),
//                   MoreInfo(),
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:premium_page/mentorCard.dart';
import 'package:premium_page/MoreInfo/more_info.dart';
import 'package:premium_page/profileCard.dart';
import 'package:premium_page/servicesCard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  await Supabase.initialize(url: 'https://nmxyabbbmxivnmhnrcvb.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5teHlhYmJibXhpdm5taG5yY3ZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5MTY3NjEsImV4cCI6MjAyMzQ5Mjc2MX0.P6jNcpKKFWl-BOG2TlvfdIa2g48kO_WO7eAMNc404zA');
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
