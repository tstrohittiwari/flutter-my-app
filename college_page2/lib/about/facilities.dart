import 'package:flutter/material.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key});

  Widget createFacilityWidget(String imagePath, String label) {
    return Container(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 50),
          Text(label),
        ],
      ),
    );
  }

  Widget createFacilityRow(List<Map<String, String>> facilities) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: facilities.map((facility) {
          return createFacilityWidget(facility['imagePath']!, facility['label']!);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          style: BorderStyle.solid,
          width: 3,
          color: Colors.deepOrange,
        ),
      ),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Facilities',
              style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            Divider(color: Colors.deepOrange,),

            createFacilityRow([
              {"imagePath": "assets/facilities/classroom.png", "label": "Classroom"},
              {"imagePath": "assets/facilities/bank.png", "label": "Bank"},
              {"imagePath": "assets/facilities/auditorium.png", "label": "Auditorium"},
              {"imagePath": "assets/facilities/bunk-bed.png", "label": "Hostel"},
            ]),

            createFacilityRow([
              {"imagePath": "assets/facilities/coffee.png", "label": "Cafeteria"},
              {"imagePath": "assets/facilities/computer-science.png", "label": "Comp. Lab"},
              {"imagePath": "assets/facilities/dumbbells.png", "label": "Gym"},
              {"imagePath": "assets/facilities/first-aid-kit.png", "label": "Medical"},
            ]),

            createFacilityRow([
              {"imagePath": "assets/facilities/library.png", "label": "Library"},
              {"imagePath": "assets/facilities/wireless-router.png", "label": "Wi-Fi"},
              {"imagePath": "assets/facilities/security.png", "label": "Security"},
              {"imagePath": "assets/facilities/sports.png", "label": "Sports"},
            ]),
          ],
        ),
      ),
    );
  }
}
