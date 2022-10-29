import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter_svg/flutter_svg.dart';

// A year Chart to include in insight page

Widget year_chartWidget(BuildContext context) {

  return Container(
      width: 327,
      height: 220,
      child: SfCartesianChart(
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          series: <LineSeries<SpendingData, String>>[
            LineSeries<SpendingData, String>(
              animationDuration: 2200,
              // Bind data source
              dataSource: <SpendingData>[
                SpendingData('Jan', 135000),
                SpendingData('Feb', 328000),
                SpendingData('Mar', 234000),
                SpendingData('Apr', 532000),
                SpendingData('May', 640000),
                SpendingData('Jun', 440000),
                SpendingData('Jul', 240000),
                SpendingData('Aug', 150000),
                SpendingData('Sep', 460000),
                SpendingData('Oct', 570000),
                SpendingData('Nov', 740000),
                SpendingData('Dec', 940000),
              ],
              xValueMapper: (SpendingData spendings, _) => spendings.year,
              yValueMapper: (SpendingData spendings, _) => spendings.spendings,
              color: Color.fromRGBO(51, 64, 79, 1),
            )
          ]));
}
class SpendingData {
  SpendingData(this.year, this.spendings);
  final String year;
  final double spendings;
}
