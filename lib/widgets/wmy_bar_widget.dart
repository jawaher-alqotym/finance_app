import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:finance_app/widgets/chart_widget.dart';
import 'package:finance_app/widgets/month_chart_widget.dart';
import 'package:finance_app/widgets/year_chart_widget.dart';

// Week Month Year insight toggle switch bar
Widget wmyBarWidget(BuildContext context) {

  return Column(
    children: [
      ToggleSwitch(
        minWidth: 350.0,
        minHeight: 44,
        cornerRadius: 15.0,
        fontSize: 15,
        radiusStyle: true,
        dividerColor: Colors.transparent,
        // activeBorders: [
        //   Border.all(
        //     color: Color.fromRGBO(255, 255, 255, 0.6),
        //     width: 1.0,
        //   ),
        //   Border.all(
        //     color: Color.fromRGBO(255, 255, 255, 0.6),
        //     width: 1.0,
        //   ),
        //   Border.all(
        //     color:  Color.fromRGBO(255, 255, 255, 0.6),
        //     width: 1.0,
        //   ),
        // ],
        activeBgColors: [[Color.fromRGBO(51, 64, 79, 1)], [Color.fromRGBO(51, 64, 79, 1)], [Color.fromRGBO(51, 64, 79, 1)]],
        activeFgColor: Colors.white,
        inactiveBgColor: Color.fromRGBO(51, 64, 79, 1),
        inactiveFgColor: Colors.white,
        initialLabelIndex: 1,
        doubleTapDisable: false, // re-tap active widget to de-activate
        totalSwitches: 1,
        labels: [ 'التقرير الشهري'],
        onToggle: (index) {
          // chartWidget(context);
        },
        changeOnTap: true,
      ),
      ],
  );
}
