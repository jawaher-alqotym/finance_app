/* lib/widgets/expenseCard.dart */

import 'package:flutter/material.dart';
import 'package:finance_app/models/category.dart';


class ExpenseCard extends StatefulWidget {
  DateTime date;
  double? amount;
  String? name;
  Catgory? catgory;

  ExpenseCard({super.key, required this.date, this.amount, this.name, this.catgory});

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45.0, top: 15, bottom: 2),
          child: Text("${widget.date.year} - ${widget.date.month} - ${widget.date.day}", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: "Inter"),),
        ),
        Container(
          height: 70,
          margin: EdgeInsets.only(left: 45.0,),
             decoration: BoxDecoration(
              color: const Color(0xFF33404F),
              borderRadius: BorderRadius.all(Radius.circular(8)),
             ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 32.0,top: 5, bottom: 5),
                    child: Row(
                      children: [
                        CircleAvatar(
                         radius: 22,
                         backgroundColor: Color(0xff385650),
                           child:  Icon( Icons.cabin, color: Color(0xff53D258),size: 20,),),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.5, left: 12.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.name}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600,),),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text("${widget.name}", style: TextStyle(color: Colors.grey, fontSize: 14,)),
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(right: 12.0, left: 55),
                     child: Text("${widget.amount}", style: TextStyle(color: Color(0xffE25C5C), fontSize: 16, fontWeight: FontWeight.w600,)),
                   ),
                 ],
               ),


        ),
      ],
    );
  }
}
