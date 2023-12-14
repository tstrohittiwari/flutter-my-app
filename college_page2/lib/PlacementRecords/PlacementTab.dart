import 'package:college_page2/PlacementRecords/recruiters.dart';
import 'package:college_page2/about/placement.dart';
import 'package:flutter/material.dart';

class PlacementsTab extends StatelessWidget {
  const PlacementsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Placements(),
          Recruiters(),
        ],
      ),
    );
  }
}
