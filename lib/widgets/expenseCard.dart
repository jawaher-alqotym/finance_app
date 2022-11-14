/* lib/widgets/expenseCard.dart */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatefulWidget {
  DateTime date;
  num? amount;
  String? name;
  String? icon;

  ExpenseCard({super.key, required this.date, this.amount, this.name, this.icon});

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         now.year == widget.date.year && now.month == widget.date.month && now.day == widget.date.day ?
     Padding(
    padding: const EdgeInsets.only(top: 10.0, left: 355.0, bottom: 8),
    child: Text("اليوم", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'HacenDigital'),),
    ):
          Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 45.0, bottom: 8),
                child: Text("${DateFormat.yMMMMd().format(widget.date)}", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'HacenDigital'),),
              ),
        Container(
          height: 70,
          margin: EdgeInsets.only(left: 37.0, right: 37.0, bottom: 0),
             decoration: BoxDecoration(
              color: const Color(0xFF33404F),
              borderRadius: BorderRadius.all(Radius.circular(8)),
             ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                        Expanded(
                            flex:3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("-${widget.amount}", style: TextStyle(color: Color(0xffE25C5C), fontSize: 16, fontWeight: FontWeight.w600,)),
                            )),
                        Expanded(
                            flex: 0,
                            child: Text("${widget.name}", style: TextStyle(fontFamily: 'HacenDigital', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600,),)),
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xff385650),
                            child: ImageIcon(
                              AssetImage(
                                  "${widget.icon}"
                              ),
                              color: Color(0xff53D258),
                            ),
                            ),
                        ),
                 ],
                      ),
                    ),
                ],
    );

  }
}
