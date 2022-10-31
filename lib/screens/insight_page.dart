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

class InsightPage extends StatefulWidget {
  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  // Variable declaration or functions
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Column(
        children: [
          halfOvalWidget(context),
          Spacer(),
          wmyBarWidget(context),
          Spacer(),
          /** Needs to toggle between week and month chart **/
          chartWidget(context),
          // month_chartWidget(context),
          // year_chartWidget(context),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Text('Spending Categories', style: TextStyle(color: Color.fromRGBO(51, 64, 79, 1), fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 61.0),
                child: spendingWidget(context),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, bottom: 30),
                    child: Text('My Goals', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromRGBO(51, 64, 79, 1),),
                  ),),
                  Padding(padding:
                  const EdgeInsets.only(right: 37.0, bottom: 24),
                    child:addBtnWidget(context),
                  ),
                ],
              ),
              goalsWidget(context),

            ],
          ),

          Spacer(),
          Spacer(),

        ],
      )),
    );
  }
}
