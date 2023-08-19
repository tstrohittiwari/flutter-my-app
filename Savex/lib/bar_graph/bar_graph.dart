import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:savex/bar_graph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thusAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thusAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    //initialize bar data
    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thusAmount: thusAmount,
      friAmount: friAmount,
      satAmount: satAmount,
    );
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      titlesData: const FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
          ),
        ),
      ),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: myBarData.barData
          .map(
            (data) =>
            BarChartGroupData(x: data.x, barRods: [
              BarChartRodData(
                toY: data.y,
                color: const Color.fromARGB(255, 54, 69, 79),
                width: 25,
                borderRadius: BorderRadius.circular(5),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  color: const Color.fromARGB(255, 178, 190, 181),
                  toY: maxY,
                ),
              ),
            ]),
      )
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(color: Color.fromARGB(255, 178, 190, 181),
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()){
    case 0:
      text = const Text('S',style: style);
    case 1:
      text = const Text('M',style: style);
    case 2:
      text = const Text('T',style: style);
    case 3:
      text = const Text('W',style: style);
    case 4:
      text = const Text('T',style: style);
    case 5:
      text = const Text('F',style: style);
    case 6:
      text = const Text('S',style: style);
    default:
      text = const Text(' ',style: style);
      break;

  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
