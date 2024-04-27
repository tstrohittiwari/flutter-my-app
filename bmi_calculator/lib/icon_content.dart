import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';


class IconContentWidget extends StatelessWidget {
  const IconContentWidget(
      {super.key, required this.myIcon, required this.gender});

  final IconData myIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          myIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style:kLabelTextStyle,
        ),
      ],
    );
  }
}
