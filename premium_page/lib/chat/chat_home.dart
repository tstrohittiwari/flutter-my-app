// import 'package:flutter/material.dart';
//
// import 'groupCard.dart';
//
// class ChatHome extends StatelessWidget {
//   const ChatHome({super.key});
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
//           backgroundColor: Colors.transparent.withOpacity(0),
//           appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             backgroundColor: Colors.transparent.withOpacity(0),
//             title: Text(
//               "Groups",
//               style: TextStyle(color: Colors.white),
//             ),
//             centerTitle: true,
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 GroupCard(
//                   bgImage: "assets/4.png",
//                   counsellingName: "Jossa",
//                   studentImage: "assets/1.png",
//                   studentMessage: "Jossa ki dates kya hai",
//                   studentName: "Newton",
//                 ),
//                 GroupCard(
//                   bgImage: "assets/5.png",
//                   counsellingName: "HSTES",
//                   studentImage: "assets/1.png",
//                   studentMessage: "Jossa ki dates kya hai",
//                   studentName: "Newton",
//                 ),
//                 GroupCard(
//                   bgImage: "assets/6.png",
//                   counsellingName: "UPTAC",
//                   studentImage: "assets/1.png",
//                   studentMessage: "Jossa ki dates kya hai",
//                   studentName: "Newton",
//                 ),
//                 GroupCard(
//                   bgImage: "assets/4.png",
//                   counsellingName: "MPDTE",
//                   studentImage: "assets/1.png",
//                   studentMessage: "Jossa ki dates kya hai",
//                   studentName: "Newton",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'groupCard.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {

  //AUTH
  final studentEmail = "4be86abd-b268-48ee-b59b-02f8bbd92ee9";
  List<Map<String, dynamic>>? councellingData;

  Future<List<Map<String, dynamic>>> studentCoun(studentEmail) async {
    final response =
        await Supabase.instance.client.from('studentdata').select().eq('id', studentEmail);
    // .eq('id', studentEmail);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.transparent.withOpacity(0),
            title: Text(
              "Groups",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: FutureBuilder<List<Map<String, dynamic>>>(
            future: studentCoun(studentEmail),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                councellingData = snapshot.data!;


               return ListView.builder(
                  itemCount: councellingData!.length,
                  itemBuilder: (context, index) {
                    final coun = councellingData![index]['councelling'];
                    final name = councellingData![index]['name'];
                    // final gender = councellingData![index]['gender'];
                    return ListTile(
                      title: Column(
                        // Use Column as the title
                        children: [
                          GroupCard(
                            bgImage: "assets/4.png",
                            counsellingName: coun,
                            studentImage: "assets/1.png",
                            studentMessage: "Jossa ki dates kya hai",
                            studentName: name,
                          ),
                        ],
                      ),
                    );

                    // return SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    //       GroupCard(
                    //         bgImage: "assets/4.png",
                    //         counsellingName: coun,
                    //         studentImage: "assets/1.png",
                    //         studentMessage: "Jossa ki dates kya hai",
                    //         studentName: name,
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
