// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class ProfileCard extends StatelessWidget {
//   const ProfileCard({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
//       child: SizedBox(
//         height: 150,
//         child: Card(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(25))),
//           color: Color.fromARGB(255, 255, 229, 107),
//           elevation: 5,
//           shadowColor: Color.fromARGB(124, 199, 197, 132),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Welcome Back",
//                     style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
//                   ),
//                   Text(
//                     "Rohit Tiwari",
//                     style: GoogleFonts.nunito(
//                       textStyle: TextStyle(
//                         fontStyle: FontStyle.italic,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     "Glad to see you again",
//                     style: TextStyle(
//                       fontSize: 14,
//                     ),
//                   )
//                 ],
//               ),
//               Image(
//                 image: AssetImage("assets/1.png"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileCard extends StatelessWidget {
  // const ProfileCard({super.key});

  final String studentID = '8c07109a-7db0-4d33-8734-09bf698684f5'; //AUTH
  // Future<List<Map<String, dynamic>>>? studentInfo;

  Future<List<Map<String, dynamic>>> getStudentInfo(studentID) async {
    // final response = await Supabase.instance.client.from('messages').select('content');
    final response = await Supabase.instance.client
        .from('studentdata')
        .select()
        .eq('id', studentID);
    // .eq('user_from', mentorId);  IMPORTANT  MENTORID FORM AUTH

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getStudentInfo(studentID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final studentInfo = snapshot.data!;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: SizedBox(
              height: 150,
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
                          "Welcome Back",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 16),
                        ),
                        Text(
                          studentInfo[0]['name'],
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Glad to see you again",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Image(
                      image: AssetImage("assets/1.png"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
