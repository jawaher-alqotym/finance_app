import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// The new Monthly Report Chart to include in insight page

Widget monthlyReportWidget(BuildContext context) {
  late List<_ChartData> data;
  late List<_ChartData> data2;
  late TooltipBehavior _tooltip;
  /** one for spending, another for saving **/
  data = [
    _ChartData('الأسبوع ١', 4600),
    _ChartData('الأسبوع ٢', 3500),
    _ChartData('الأسبوع ٣', 4500),
    _ChartData('الأسبوع ٤', 3700),
  ];
  data2 = [
    _ChartData('الأسبوع ١', 4000),
    _ChartData('الأسبوع ٢', 3000),
    _ChartData('الأسبوع ٣', 2200),
    _ChartData('الأسبوع ٤', 2500),
  ];
  return Container(
    width: 271,
    height: 207,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16)),
    child: SfCartesianChart(
      plotAreaBorderWidth: 0,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              width:0.5,
              spacing:0.3,
              borderRadius:BorderRadius.only(topRight: Radius.circular(16),topLeft:Radius.circular(16)),
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Gold',
              color: Color.fromRGBO(51, 64, 79, 1))
          ,
          ColumnSeries<_ChartData, String>(
              width:0.5,
              spacing:0.3,
              borderRadius:BorderRadius.only(topRight: Radius.circular(16),topLeft:Radius.circular(16)),
              dataSource: data2,
              xValueMapper: (_ChartData data2, _) => data2.x,
              yValueMapper: (_ChartData data2, _) => data2.y,
              name: 'Gold',
              color: Color.fromRGBO(83, 210, 88, 1))
        ],
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(fontFamily: 'HacenDigital'),
        isInversed:true,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          opposedPosition: true,
          maximum: 5000,
          minimum: 0,
          interval: 1000,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      //series: _getDefaultColumn(),
      //tooltipBehavior: _tooltipBehavior,
    ),
  );
}
class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
