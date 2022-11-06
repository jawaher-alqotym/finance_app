
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SavingCardDetails extends StatelessWidget {
  double percenst;
  String title;
  String fromDate ;
  String toDate;

  SavingCardDetails({required this.percenst, required this.title, required this.fromDate, required this.toDate});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHight = MediaQuery
        .of(context)
        .size
        .height;

    return Container(
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(26.0),
        color: Colors.redAccent
      ),
        height: screenHight-490,
        width: screenWidth,
        child: Text("data"));
  }


}
