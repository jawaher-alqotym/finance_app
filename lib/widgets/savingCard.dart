/* lib/widgets/savingCard.dart */

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:finance_app/models/category.dart';


class SavingCard extends StatefulWidget {
  double percenst;
  num? amount_of_saving;
  Catgory? catgory;

  SavingCard({super.key, required this.percenst, this.amount_of_saving, this.catgory});


  @override
  State<SavingCard> createState() => _SavingCardState();
}

class _SavingCardState extends State<SavingCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(  left: 40),
        decoration: BoxDecoration(
          color: const Color(0xFF33404F),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 65.0, top: 20.0),
              child: Text("${widget.amount_of_saving}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 2000,
                barRadius: const Radius.circular(16),
                width: 135.0,
                lineHeight: 6.0,
                percent: widget.percenst,
                progressColor: Color(0xff53D258),
                backgroundColor: Color(0xff364f50),
              ),
            ),
          ],
        ),
    );
  }
}
