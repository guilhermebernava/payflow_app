import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/textStyles.dart';
import '../../shared/widgets/boletoList/boletoListController.dart';

// ignore: must_be_immutable
class ResumePage extends StatefulWidget {
  ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final controller = BoletoListController();

  final List<FlSpot> dummyData1 = List.generate(2, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(5, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          "Boletos",
          textAlign: TextAlign.center,
          style: TextStyles.titleHome,
        ),
        SafeArea(
          child: Center(
            child: Container(
              width: 330,
              height: 330,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  gridData: FlGridData(
                    show: false, // to remove grids
                    horizontalInterval: 1.6,
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(drawBehindEverything: false),
                    topTitles: AxisTitles(drawBehindEverything: false),
                  ),
                  lineBarsData: [
                    // The red line
                    LineChartBarData(
                      spots: dummyData1,
                      isCurved: true,
                      barWidth: 1,
                      color: Colors.red,
                    ),
                    // The orange line
                    LineChartBarData(
                      spots: dummyData2,
                      isCurved: true,
                      barWidth: 1,
                      color: Colors.orange,
                    ),
                  ],
                ),
                swapAnimationCurve: Curves.decelerate,
                swapAnimationDuration: Duration(seconds: 10),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
