import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import "package:finance_app/controllers/userController.dart";
import 'package:get/get.dart';

// The new Monthly Report Chart to include in insight page

Widget monthlyReportWidget(BuildContext context) {
  late List<_ChartData> expence;
  late List<_ChartData> savings;
  late TooltipBehavior _tooltip;

  final userController = Get.find<UserController>();
  List<num> MonthlyExpenses = userController.getMonthlyStat(userController.user.expenseList);
  List<num> MonthlySavings = userController.getMonthlyStat(userController.user.savingList);


  /** one for spending, another for saving **/
  expence = [
    _ChartData('الأسبوع ١', MonthlyExpenses[0].toDouble()),
    _ChartData('الأسبوع ٢', MonthlyExpenses[1].toDouble()),
    _ChartData('الأسبوع ٣', MonthlyExpenses[2].toDouble()),
    _ChartData('الأسبوع ٤', MonthlyExpenses[3].toDouble()),
  ];
  savings = [
    _ChartData('الأسبوع ١', MonthlySavings[0].toDouble()),
    _ChartData('الأسبوع ٢', MonthlySavings[1].toDouble()),
    _ChartData('الأسبوع ٣', MonthlySavings[2].toDouble()),
    _ChartData('الأسبوع ٤', MonthlySavings[3].toDouble()),
  ];
  return Container(
    width: 290,
    height: 220,
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
              dataSource: expence,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Gold',
              color: Color(0xffFD6969))
          ,
          ColumnSeries<_ChartData, String>(
              width:0.5,
              spacing:0.3,
              borderRadius:BorderRadius.only(topRight: Radius.circular(16),topLeft:Radius.circular(16)),
              dataSource: savings,
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
          maximum:  userController.getSavingTotal() > userController.getSpendingTotal() ?
          userController.getSavingTotal().toDouble(): userController.getSpendingTotal().toDouble(),
          minimum: 0,
          interval:userController.getSavingTotal() > userController.getSpendingTotal() ?
          userController.getSavingTotal()/5: userController.getSpendingTotal()/5,
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
