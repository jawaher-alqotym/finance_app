import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Ring Chart to include in insight page

Widget chartWidget(BuildContext context) {
  return CircularPercentIndicator(
    radius: 100.0,
    lineWidth: 10.0,
    percent: .40,
    backgroundColor: Color.fromRGBO(255, 203, 102, 0.5),
    progressColor: Color.fromRGBO(255, 203, 102, 1),
    animation: true,
    animationDuration: 1200,
    circularStrokeCap: CircularStrokeCap.round,
    center: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "470 SAR",
            style: TextStyle(
                color: Color.fromRGBO(255, 203, 102, 1), fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3),
              child: SvgPicture.asset('assets/down_arrow.svg'),
            ),
            new Text(
              "20% from last week",
              style: TextStyle(
                  color: Color.fromRGBO(255, 203, 102, 1), fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}
