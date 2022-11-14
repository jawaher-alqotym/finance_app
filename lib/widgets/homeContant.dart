/* lib/widgets/floatingButton.dart */

import 'dart:io';

import 'package:finance_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/widgets/navBar.dart';

import 'package:finance_app/widgets/expenseCard.dart';
import 'package:finance_app/widgets/savingCard.dart';
import 'package:get/get.dart';

import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:finance_app/widgets/num_pad.dart';

import "package:finance_app/controllers/userController.dart";
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeContant extends StatefulWidget {
  const HomeContant({super.key});

  @override
  State<HomeContant> createState() => _HomeContantState();
}

class _HomeContantState extends State<HomeContant> {
  // text controller
  final TextEditingController _myController = TextEditingController();
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String welcomeMessage = userController
        .welcomeMsg(); // Good morning or good evening based on getLogin time.

    Widget buildExpencesSheet() {
      return Search();
    }

    Widget buildSheet() {
      return Container(
        height: (MediaQuery.of(context).size.height) - 70,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Your Balance',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(51, 64, 79, 1)),
            ),
            // display the entered numbers
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 70,
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(138, 135, 135, 0.5)),
                      border: InputBorder.none,
                      hintText: '0 SAR/Month'),
                  controller: _myController,
                  textAlign: TextAlign.center,
                  showCursor: false,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                  // Disable the default soft keybaord
                  keyboardType: TextInputType.none,
                )),
              ),
            ),
            // implement the custom NumPad
            NumPad(
              buttonSize: 20,
              buttonColor: Colors.white,
              iconColor: Color.fromRGBO(226, 92, 92, 1),
              controller: _myController,
              delete: () {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              },
              // do something with the input numbers
              onSubmit: () {
                userController.updateIncome(double.parse(_myController.text));
                print(userController.user.oldIncome);
                debugPrint('Your added Balance: ${_myController.text}');
                // showDialog(
                //     context: context,
                //     builder: (_) => AlertDialog(
                //       content: Text(
                //         "Your added balance: \n ${_myController.text}",
                //         style: const TextStyle(fontSize: 20),
                //       ),
                //     ));
              },
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Text(
                      "$welcomeMessage",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child://Obx(()=>
    Text(
                        "${userController.user.name} رصيدك الحالي هنا ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                   //   ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 0.0,
                    ),
                    child: Obx(()=>TextButton(
                      onPressed: () => showBottomSheet(
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => buildSheet()),
                      child: userController.user.income.value >=
                              userController.getSpendingTotal()
                          ? Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "  ${userController.largNumbersformatter(userController.user.income.value.round())} س.ر ",
                                style: TextStyle(
                                  color: userController.user.income.value > 0
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Text(
                              "${userController.largNumbersformatter(userController.user.income.value.round())} س.ر",
                              style: TextStyle(
                                color: userController.user.income.value >= 0
                                    ? Colors.white
                                    : Colors.redAccent,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                    ),
                  ),
                ],
              ),
              height: 180,
              width: screenWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26),
                    topLeft: Radius.circular(26),
                  ),
                ),
                height: 572,
                width: screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width - 109,
                              top: 180,
                            ),
                            child: Text(
                              "الإدخار",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0xFF33404F)),
                            ),
                          ),
                          userController.user.income.value >= 0
                              ? Obx(()=>Container(
                                  height: 90,
                                  margin: EdgeInsets.only(
                                      left: 0.0, top: 19.0, bottom: 25),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        userController.user.savingList.length,
                                    itemBuilder: (context, index) => SavingCard(
                                      id: userController.user.savingList[index].id,
                                      amount: userController.user.savingList[index].amount,
                                      percentage: userController
                                          .user.savingList[index].percentage,
                                      title: userController
                                          .user.savingList[index].title,
                                      user: userController.user,
                                      fromDate: userController
                                          .user.savingList[index].fromDate,
                                      toDate: userController
                                          .user.savingList[index].toDate,
                                    ),
                                  ),
                                ))
                              : Text(""),
                        ],
                      )),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 0, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextButton(
                                    onPressed: () => showBottomSheet(
                                        enableDrag: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(26.0),
                                        ),
                                        backgroundColor: Colors.white,
                                        context: context,
                                        builder: (context) =>
                                            buildExpencesSheet()),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 199.0),
                                      child: Text(
                                        "الكل",
                                        style: TextStyle(
                                          color: Color(0xff33404F),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "المصاريف",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Color(0xFF33404F)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                              Obx(() => userController.user.expenseList.length > 0
                              ? Container(
                                  //height: 190,
                                  child: ExpenseCard(
                                    date:
                                        userController.user.expenseList[userController.user.expenseList.length-1].date,
                                    amount: userController
                                        .user.expenseList[userController.user.expenseList.length-1].amount,
                                    name:
                                        userController.user.expenseList[userController.user.expenseList.length-1].name,
                                    //catgory : userController.user.expenseList[index].catgory,
                                  ),
                                )

                              : Text(""),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 1080 - MediaQuery.of(context).size.height,
          child: Container(
            height: 207,
            width: 271,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  offset: Offset(2, 3),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=>CircularPercentIndicator(
                    animation: true,
                    animationDuration: 2000,
                    radius: 90.0,
                    lineWidth: 7.0,
                    percent: userController.getPieChartData(),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${(userController.getPieChartData() * 100).toStringAsFixed(0)}%"),
                        Text(
                          "نسب الصرف من الرصيد",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    progressColor: getChartColor())
    ),
            ),
          ),
        ),
        navBar(),
      ],
     );
  }
  Color getChartColor(){
    var temp = userController.getPieChartData();
    if(temp >= 0.0 && temp <= 0.4){
      return Color(0xff53D258);
    }else if(temp > 0.45 && temp <= 0.6){
      return Color(0xffFFCB66);
    }else{
      return Color(0xffFD6969);
    }

  }
}
