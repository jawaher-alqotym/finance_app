import 'dart:ui';

import 'package:finance_app/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/userController.dart';

class SavingCardDetails extends StatelessWidget {
  String? id;
  num amount;
  double percentage;
  String title;
  String fromDate;
  String toDate;

  SavingCardDetails({
      required this.id,
      required this.amount,
      required this.percentage,
      required this.title,
      required this.fromDate,
      required this.toDate});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    final userController = Get.find<UserController>();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
      child: Container(
          decoration: BoxDecoration(
            boxShadow:[ BoxShadow(color: Color.fromRGBO(0,0,0,0.3), offset: Offset(0, 0) ,spreadRadius: 100, blurStyle: BlurStyle.normal, blurRadius: 100)],
              borderRadius: BorderRadius.circular(26.0), color: Colors.white),
          height: screenHight - 490,
          width: screenWidth,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).push(_createRouteHomePage());
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Color.fromRGBO(83, 210, 88, 1),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Text("${title}", style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  ),)),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("من الدخل"),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("${(percentage*100).round()}%",
                          style: TextStyle(color: Color(0xffF5EC00),
                              fontSize: 20,
                          fontWeight: FontWeight.w600),),
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(right: 0, top: 75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("من"),
                            ),
                            ImageIcon(
                              AssetImage("assets/images/Frame 8753.png"),
                              color: Color.fromRGBO(83, 210, 88, 1),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 20.0),
                          child: Text("${fromDate}",
                            style: TextStyle(fontSize: 13, color: Colors.grey),),
                        ),
                      ],
                    ),


                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("إلى"),
                            ),
                            ImageIcon(
                              AssetImage("assets/images/downArrow.png"),
                              color: Color.fromRGBO(83, 210, 88, 1),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 20.0),
                          child: Text("${toDate}",
                            style: TextStyle(fontSize: 13, color: Colors.grey),),
                        ),
                      ],
                    ),


                    //  OutlinedButton
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("س.ر",
                          style: TextStyle(fontSize: 20),),
                      ),
                      Text("${userController.largNumbersformatter(amount.toString())}",
                        style: TextStyle(fontSize: 24),),
                    ],
                  )),
              Container(
                  child: TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "تنبيه",
                          middleText: "سوف يتم حذف هذا العنصر",
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("لا"),
                            ),
                            TextButton(
                              onPressed: () {
                                // userController.user.savingList.removeAt
                              },
                              child: Text("نعم"),
                            ),
                          ],
                        );
                      },
                      child: TextButton(
                        child: Text("حذف",
                          style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w600),),
                        onPressed: () =>{
                            userController.deleteSavings(id)
                            },
                      )
                  )
              )
            ],
          )),
    );
  }
}

Route _createRouteHomePage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
