import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connectivity extends StatelessWidget {
  const Connectivity({super.key});

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
              'Connectivity',
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
            Divider(
              color: Colors.deepOrange,
            ),
            SizedBox(width: 5),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      FontAwesomeIcons.plane,
                      color: Colors.deepPurple,
                      size: 15,
                    ),
                  ),
                  TextSpan(
                    text: "  Nearby Airport: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text:
                    "Rajiv Gandhi International Airport, Hyderabad. The airport is approximately 150 km away from the college.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      FontAwesomeIcons.train,
                      color: Colors.deepPurple,
                      size: 15,
                    ),
                  ),
                  TextSpan(
                    text: " Nearby Railway Station: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text:
                    "Kazipet Junction. The railway station is approximately 15 km away from the college.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
