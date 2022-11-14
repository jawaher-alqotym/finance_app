import 'package:flutter/material.dart';
import 'package:finance_app/widgets/wmy_bar_widget.dart';
import 'package:finance_app/widgets/half_oval_top_widget.dart';
import 'package:finance_app/widgets/goals_widget.dart';
import 'package:finance_app/widgets/navBar.dart';
import 'package:finance_app/widgets/monthly_report_widget.dart';
import 'package:finance_app/widgets/expense_vs_savings_widget.dart';
import "package:finance_app/controllers/userController.dart";
import 'package:get/get.dart';
import 'package:finance_app/widgets/expenseCard.dart';
import 'package:finance_app/models/expense.dart';

class InsightPage extends StatefulWidget {
  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  // Variable declaration or functions
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    Expense? expense = userController.getHighestExpensesCategory();

    return Scaffold(
      body: Stack(
        children: [ Column(
          children: [
        halfOvalWidget(context),
        Spacer(),
        wmyBarWidget(context),
        Spacer(),
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
        Column(
          children: [
            expense != null ? Padding(
              padding: const EdgeInsets.only(left: 240,bottom: 10),
              child: Text('الأعلى صرفا', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color.fromRGBO(51, 64, 79, 1),),
            ),
            ):
            Text(""),
            expense != null ?
            ExpenseCard(date: expense.date, name: expense.name, amount: expense.amount,icon: expense.icon,): Text(""),
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
