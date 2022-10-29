import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

// My goals widget that contain a progress bar showing the percentage of reaching the goal.
Widget goalsWidget(BuildContext context) {
  return Container(
    height: 64,
    width: 317,
    decoration: BoxDecoration(
        color: Color.fromRGBO(51, 64, 79, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 48,
              width: 48,
              child:  Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/monitor.svg'),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)))
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('New iMac'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35.5),
                    child: Text(
                      '50%',
                      style: TextStyle(color: Color.fromRGBO(83, 210, 88, 1)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 5, right: 16),
                child: new LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1200,
                  barRadius: const Radius.circular(8),
                  width: 220.0,
                  lineHeight: 8.0,
                  percent: 0.5,
                  progressColor: Color.fromRGBO(83, 210, 88, 1),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
