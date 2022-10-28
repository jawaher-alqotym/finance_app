import 'package:flutter/material.dart';
import 'package:finance_app/widgets/add_btn_widget.dart';
import 'package:finance_app/widgets/chart_widget.dart';
import 'package:finance_app/widgets/wmy_bar_widget.dart';
import 'package:finance_app/widgets/half_oval_top_widget.dart';
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
          chartWidget(context),
          Spacer(),
          addBtnWidget(context),
          Spacer(),
        ],
      )),
    );
  }
}
