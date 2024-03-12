import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorSection extends StatelessWidget {
  const MentorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SizedBox(
        height: 100,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          color: const Color.fromARGB(255, 255, 229, 107),
          elevation: 5,
          shadowColor: const Color.fromARGB(124, 199, 197, 132),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Mentor",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                  Text("Gautam Kumar",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_ic_call_sharp),
                iconSize: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class MentorSection extends StatefulWidget {
//   const MentorSection({super.key, required this.studentID});
//
//   final String studentID;
//
//   @override
//   State<MentorSection> createState() => _MentorSectionState();
// }
//
// class _MentorSectionState extends State<MentorSection> {
//   // Future<List<Map<String, dynamic>>>? studentInfo;
//   Future<List<Map<String, dynamic>>>? mentorInfo;
//
//   Future<List<Map<String, dynamic>>> getStudentInfo(String studentID) async {
//     final response = await Supabase.instance.client
//         .from('studentdata')
//         .select()
//         .eq('id', studentID);
//     return response;
//   }
//
//   List<Map<String, dynamic>>? studentInfo;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   final String mentorCoun = "";
//
//   Future<void> _fetchData() async {
//     try {
//       studentInfo = await getStudentInfo(widget.studentID);
//       final mentorCoun = studentInfo![0]['councelling'];
//     } catch (error) {}
//   }
//
//   Future<List<Map<String, dynamic>>> getMentorInfo(mentorCoun) async {
//     final response = await Supabase.instance.client
//         .from('mentor')
//         .select()
//         .eq('coun', mentorCoun);
//     return response;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: getMentorInfo(mentorCoun),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final mentorInfo = snapshot.data!;
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//             child: SizedBox(
//               height: 100,
//               child: Card(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(25))),
//                 color: const Color.fromARGB(255, 255, 229, 107),
//                 elevation: 5,
//                 shadowColor: const Color.fromARGB(124, 199, 197, 132),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           mentorInfo[0]['name'],
//                           style: TextStyle(
//                               fontStyle: FontStyle.italic, fontSize: 16),
//                         ),
//                         FutureBuilder<List<Map<String, dynamic>>>(
//                           future: getMentorInfo(mentorCoun),
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               final mentorData = snapshot.data!.first;
//                               return Text(
//                                 mentorData['name'],
//                                 // Replace with actual name field
//                                 style: GoogleFonts.nunito(
//                                   textStyle: TextStyle(
//                                     fontStyle: FontStyle.italic,
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               );
//                             } else if (snapshot.hasError) {
//                               return Text(
//                                 'Error: ${snapshot.error}',
//                                 style: const TextStyle(color: Colors.red),
//                               );
//                             }
//                             return const CircularProgressIndicator();
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.add_ic_call_sharp),
//                       iconSize: 50,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
