import 'package:college_page2/about/Hostel.dart';
import 'package:college_page2/about/connectivity.dart';
import 'package:college_page2/about/facilities.dart';
import 'package:college_page2/about/image.dart';
import 'package:college_page2/about/introduction.dart';
import 'package:college_page2/about/placement.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSection(),
          _buildCollegeInformation(),
        ],
      ),
    );
  }

  Widget _buildCollegeInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Introduction(),
          Connectivity(),
         Placements(),
          Hostel(),
          Facilities(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
