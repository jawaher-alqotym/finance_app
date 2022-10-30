/* lib/widgets/expenseCard.dart */

import 'package:flutter/material.dart';

class ExpenseCard extends StatefulWidget {
  ExpenseCard({super.key});

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
          child: Text("Today", style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: "Inter"),),
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
                    padding: const EdgeInsets.only(left: 12.0, ),
                    child: Row(
                      children: [
                        CircleAvatar(
                         radius: 22,
                         backgroundColor: Color(0xff385650),
                           child:  Icon(Icons.home, color: Color(0xff53D258),size: 20,),),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.5, left: 12.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Housing", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600,),),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text("Subsription fee", style: TextStyle(color: Colors.grey, fontSize: 14,)),
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(right: 12.0, left: 55),
                     child: Text("-30.00 SR", style: TextStyle(color: Color(0xffE25C5C), fontSize: 16, fontWeight: FontWeight.w600,)),
                   ),
                 ],
               ),


        ),
      ],
    );
  }
}
