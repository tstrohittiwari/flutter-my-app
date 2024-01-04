// import 'package:flutter/material.dart';
//
// class DetailedNews extends StatelessWidget {
//   const DetailedNews({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.transparent.withOpacity(0),
//         title: Text(
//           "All News",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.deepOrange,width: 3)),
//               margin: EdgeInsets.all(10),
//               clipBehavior: Clip.antiAliasWithSaveLayer,
//               elevation: 5,
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     child: Image.asset(
//                       "assets/news2.jpg",
//                       height: 200,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 2, left: 12, right: 12, top: 12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "JoSSA dates for round 2 Announced",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         Text(
//                           "1st January 2024",
//                           style: TextStyle(fontSize: 12),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
//                     child: Divider(
//                       color: Colors.deepOrange,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         bottom: 15, left: 12, right: 12, top: 2),
//                     child: Column(
//                       children: [
//                         Text(
//                           "1. In 2024, 17,340 candidates secured seats in the 23 Indian Institute of Technology (IITs) through the Joint Seat Allocation Authority (JoSAA) counselling process.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "2. The allotment includes 3,422 female candidates, highlighting a growing representation of women in IIT admissions.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "3. Despite 17,385 total available seats in IITs, 45 seats remained vacant, marking the first instance of vacancies in the past five years.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "4. Over the last five years, the number of allotted seats at the end of JoSAA has consistently exceeded the initially available seats, with last year having 16,598 available seats and 16,635 seats allotted",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "5. Prof Bishnupada Mandal, organizing chairperson of JEE Advanced 2023, explained that the creation of supernumerary seats in cases of ties contributes to the seemingly higher number of allotted seats.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "6. Supernumerary seats are generated when there is a tie for admission in popular IIT branches with a high number of applicants.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "7.Certain IITs may exhibit a higher number of allotted seats than originally available, while others may have specific vacancies in particular branches.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "8. The explicit difference between available and allotted seats in 2024 raises questions about students potentially finding non-IIT options more attractive post-pandemic, according to an anonymous IIT Delhi professor.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "9. Some students may choose to opt out of JoSAA if they anticipate not securing admission to their desired course or IIT, opting instead for non-IIT institutes.",
//                           textAlign: TextAlign.justify,
//                         ),
//                         Text(
//                           "10. IIT Bombay remains the most preferred IIT for toppers in 2023, attracting 245 of the top 1000 rankers in JEE Advanced, followed by IIT Delhi with 208 candidates. New generation IITs, including IIT Hyderabad, IIT BHU, and IIT Indore, are also gaining traction among top 1000 rankers.",
//                           textAlign: TextAlign.justify,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DetailedNews extends StatelessWidget {
  const DetailedNews({Key? key});

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent.withOpacity(0),
      title: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Text(
          "All News",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildNewsCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.deepOrange, width: 3),
      ),
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/news2.jpg",
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 2, left: 12, right: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "JoSSA dates for round 2 Announced",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "1st January 2024",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            child: Divider(
              color: Colors.deepOrange,
              thickness: 3,
            ),
          ),
          buildNewsPoints(),
        ],
      ),
    );
  }

  Widget buildNewsPoints() {
    List<String> newsPoints = [
      "In 2024, 17,340 candidates secured seats in the 23 Indian Institute of Technology (IITs) through the Joint Seat Allocation Authority (JoSAA) counselling process.",
      "The allotment includes 3,422 female candidates, highlighting a growing representation of women in IIT admissions.",
      "Despite 17,385 total available seats in IITs, 45 seats remained vacant, marking the first instance of vacancies in the past five years.",
      "Over the last five years, the number of allotted seats at the end of JoSAA has consistently exceeded the initially available seats, with last year having 16,598 available seats and 16,635 seats allotted",
      "Prof Bishnupada Mandal, organizing chairperson of JEE Advanced 2023, explained that the creation of supernumerary seats in cases of ties contributes to the seemingly higher number of allotted seats.",
      "Supernumerary seats are generated when there is a tie for admission in popular IIT branches with a high number of applicants.",
      "Certain IITs may exhibit a higher number of allotted seats than originally available, while others may have specific vacancies in particular branches.",
      "The explicit difference between available and allotted seats in 2024 raises questions about students potentially finding non-IIT options more attractive post-pandemic, according to an anonymous IIT Delhi professor.",
      "Some students may choose to opt out of JoSAA if they anticipate not securing admission to their desired course or IIT, opting instead for non-IIT institutes.",
      "IIT Bombay remains the most preferred IIT for toppers in 2023, attracting 245 of the top 1000 rankers in JEE Advanced, followed by IIT Delhi with 208 candidates. New generation IITs, including IIT Hyderabad, IIT BHU, and IIT Indore, are also gaining traction among top 1000 rankers.",
    ];
    List<Widget> newsWidgets = [];

    for (int index = 0; index < newsPoints.length; index++) {
      newsWidgets.add(
        Column(
          children: [
            Text(
              "${index + 1}. ${newsPoints[index]}",
              textAlign: TextAlign.justify,
            ),
            Divider(
              color: Colors.deepOrange,
            ),
          ],
        ),
      );
    }

    // Remove the last divider to avoid unnecessary spacing
    if (newsWidgets.isNotEmpty) {
      newsWidgets.removeLast();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 12, right: 12, top: 2),
      child: Column(
        children: newsWidgets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildNewsCard(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
