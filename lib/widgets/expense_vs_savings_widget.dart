import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpenseVsSavingCard extends StatefulWidget {
  @override
  State<ExpenseVsSavingCard> createState() => _ExpenseVsSavingCardState();
}

class _ExpenseVsSavingCardState extends State<ExpenseVsSavingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 66,
        width: 327,
        margin: EdgeInsets.only(left: 37.0, right: 37.0, bottom: 0),
        decoration: BoxDecoration(
          color: const Color(0xFF33404F),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/downGreenArrow.svg'),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 16, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مجموع الدخل', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),),
              Text('٠ س.ر', style: TextStyle(color: Colors.white, fontSize: 18,  fontWeight: FontWeight.w600),),
            ],
          ),
        ),
        Container(
          height: 42,
          child: VerticalDivider(
            color: Color.fromRGBO(207, 207, 207, 1),
            thickness: 1,
            width: 32,
          ),
        ),
        SvgPicture.asset('assets/upArrow.svg'),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مجموع الإلتزامات', style: TextStyle(color: Colors.white),),
              Text('٠ س.ر', style: TextStyle(color: Colors.white, fontSize: 18,  fontWeight: FontWeight.w600),),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
