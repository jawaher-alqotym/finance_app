/* lib/widgets/expenseCard.dart */

import 'package:flutter/material.dart';
import 'package:finance_app/models/category.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class ExpenseCard extends StatefulWidget {
  DateTime date;
  num? amount;
  String? name;
  Catgory? catgory;

  ExpenseCard({super.key, required this.date, this.amount, this.name, this.catgory});

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime today = new DateTime(now.year, now.month, now.day);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 38.0, top: 0, bottom: 12),
          child: widget.date == today ?
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text("اليوم", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'HacenDigital')),
          )
              :Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Text("${DateFormat.yMMMMd().format(now)}", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'HacenDigital'),),
              ),
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
                            child:  Icon( Icons.cabin, color: Color(0xff53D258),size: 20,),),
                        ),
                 ],
                      ),
                    ),
                ],
    );

  }
}
