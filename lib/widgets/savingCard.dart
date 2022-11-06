/* lib/widgets/savingCard.dart */

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';
import 'package:finance_app/widgets/savingCardDetails.dart';



class SavingCard extends StatefulWidget {
  double percenst;
  Catgory? catgory;
  String title;
  User user;
  String fromDate = new DateTime.now().toString();
  String toDate;



  SavingCard({super.key,
    required this.percenst,
    this.catgory,
    required this.title,
    required this.user,
    required this.toDate,
    required this.fromDate});


  @override
  State<SavingCard> createState() => _SavingCardState();
}


class _SavingCardState extends State<SavingCard> {

  Widget buildSheet() {
    return   SavingCardDetails(fromDate: widget.fromDate,toDate:  widget.toDate,title: widget.title,percenst: widget.percenst);
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () =>
          showBottomSheet(
              enableDrag: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius
                    .circular(26.0),
              ),
              context: context,
              builder: (context) =>
                  buildSheet()),
      child: Container(
          margin: EdgeInsets.only(left: 40),
          decoration: BoxDecoration(
            color: const Color(0xFF33404F),
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

          child: Column(
            children: [
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 10.0, top: 10.0),
                    child: Text("${(widget.percenst*100).round()}%", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 0.0, top: 10.0),
                    child: Text("${(widget.title)}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 85.0),
                    //       child: widget.user.income != 0 ?
                    //           Text("${widget.user.oldIncome}", style: TextStyle(color: Color(0xff80808080), )):Text("")
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 8.0),
                    //       child: Text("${(widget.user.oldIncome)*widget.percenst}", style: TextStyle(color: Color(0xff80808080), )),
                    //     ),
                    //
                    //   ],
                    // ),
                    LinearPercentIndicator(
                      animation: true,
                      animationDuration: 2000,
                      barRadius: const Radius.circular(16),
                      width: 135.0,
                      lineHeight: 6.0,
                      percent: widget.percenst,
                      progressColor: Color(0xff53D258),
                      backgroundColor: Color(0xff364f50),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
