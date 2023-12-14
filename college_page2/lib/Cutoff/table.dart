import 'package:flutter/material.dart';

class CutoffTable extends StatelessWidget {
  const CutoffTable({super.key});

  TableRow buildTableRow(String branch, String cutoff) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              branch,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              cutoff,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(186, 255, 182, 115),
      ),
      padding: EdgeInsets.all(7),
      child: Table(
        border: TableBorder.all(
          color: Colors.white,
          width: 2,
          borderRadius: BorderRadius.circular(10),
        ),
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Branches',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepPurple),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Cutoff',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple, fontSize: 16),
                ),
              ),
            ),
          ]),
          buildTableRow('Computer Science Engineering', '1534'),
          buildTableRow('Bio-Technology', '29829'),
          buildTableRow('Chemical Engineering', '20029'),
          buildTableRow('Civil Engineering', '25762'),
          buildTableRow('Electrical and Electronics Engineering', '9370'),
          buildTableRow('Electronics and Communication Engineering', '6119'),
          buildTableRow('Metallurgical and Material Engineering', '26725'),
          buildTableRow(
              'Physics (5 Years, Integrated Master of Science)', '26534'),
          buildTableRow(
              'Mathematics (5 years, Integrated Master of Science)', '25256'),
          buildTableRow(
              "Chemistry (5 Years, Integrated Master of Science)", "36579"),
        ],
      ),
    );
  }
}
