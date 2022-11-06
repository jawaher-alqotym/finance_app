import 'package:flutter/material.dart';
import 'package:finance_app/widgets/add_btn_widget.dart';
import 'package:finance_app/widgets/chart_widget.dart';
import 'package:finance_app/widgets/month_chart_widget.dart';
import 'package:finance_app/widgets/year_chart_widget.dart';
import 'package:finance_app/widgets/wmy_bar_widget.dart';
import 'package:finance_app/widgets/half_oval_top_widget.dart';
import 'package:finance_app/widgets/goals_widget.dart';
import 'package:finance_app/widgets/spending_cati_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finance_app/widgets/navBar.dart';
import 'package:finance_app/widgets/floatingButton.dart';
import 'package:finance_app/widgets/monthly_report_widget.dart';
import 'package:finance_app/widgets/expense_vs_savings_widget.dart';
class InsightPage extends StatefulWidget {
  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  // Variable declaration or functions
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [ Column(
          children: [
        halfOvalWidget(context),
        Spacer(),
        wmyBarWidget(context),
        Spacer(),
        /** Needs to toggle between week and month chart (cancelled idea) **/
        // chartWidget(context),
        // month_chartWidget(context),
        // year_chartWidget(context),

            /** monthly report **/
            monthlyReportWidget(context),

        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 61.0),
              child: ExpenseVsSavingCard(),
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 190,bottom: 30),
              child: Text('مجموع العمليات', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromRGBO(51, 64, 79, 1),),
            ),),
            goalsWidget(context),
          ],

        ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/6,
            )
          ],
        ),
          Container(
              height: MediaQuery.of(context).size.height,
              child: navBar()),
      ]
    ),
    );
  }
}
