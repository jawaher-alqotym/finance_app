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
                  padding: EdgeInsets.only(top: 40),
                  child: Text("${title}")),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
                  child: Text("${(percentage*100).round()}%")),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
                  child: Text("${amount.round()}")),
              Container(
                padding: EdgeInsets.only(right: 50, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${fromDate}"),
                    SizedBox(
                      width: 15,
                    ),
                    ImageIcon(
                      AssetImage("assets/images/Frame 8753.png"),
                      color: Color.fromRGBO(83, 210, 88, 1),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text("${toDate}"),
                    SizedBox(
                      width: 15,
                    ),
                    ImageIcon(
                      AssetImage("assets/images/Frame 8753.png"),
                      color: Color.fromRGBO(83, 210, 88, 1),
                    ),

                    //  OutlinedButton
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
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
                        child: Text("حذف", style: TextStyle(color: Colors.red),),
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
