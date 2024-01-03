import 'package:flutter/material.dart';
import 'package:premium_page/KeyDates/key_dates_page.dart';
import 'package:premium_page/MoreInfo/extra_services.dart';

class KeyDates extends StatelessWidget {
  const KeyDates({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtraServices(
      serviceName: "Key Dates",
      serviceIcon: Icons.calendar_month,
      onTapHandler: CustomTapHandler(
            (BuildContext context) async {
          // Handle onTap logic here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KeyNewsPages()),
              );
        },
      ),
    );
  }
}
