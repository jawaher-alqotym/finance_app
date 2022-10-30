import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Spending Category widget.

Widget spendingWidget(BuildContext context) {

  return Container(
    height: 70,
    width: 327,
    decoration: BoxDecoration(color: Color.fromRGBO(51, 64, 79, 1), borderRadius: BorderRadius.all(
        Radius.circular(16))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    height: 46,
                    width: 46,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/home_icon.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(83, 210, 88, 0.15),
                        borderRadius: BorderRadius.all(Radius.circular(20)))
                ),
              ),
              Text('buy online', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1) ,fontSize: 16, fontWeight: FontWeight.w600),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text('-30.00 SR',  style: TextStyle(color: Color.fromRGBO(226,92,92, 1) ,fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ],
    ),
  );
}