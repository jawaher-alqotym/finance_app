/* lib/widgets/navbar.dart */
import 'package:flutter/material.dart';
import 'package:finance_app/screens/insight_page.dart';
import 'package:get/get.dart';
import 'package:finance_app/screens/Home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:finance_app/widgets/floatingButtonChildren.dart';
import 'package:finance_app/widgets/floatingButton.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SvgPicture.asset(
          'assets/images/Base.svg',
          width: MediaQuery.of(context).size.width,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                iconSize: 46.0,
                padding: EdgeInsets.only(left: 32.0, bottom: 27),
                onPressed: () => {_onHomeButtonPressed()},
                icon: Image.asset('assets/images/homeIcon.png')),
            // FlowMenu(),
            IconButton(
                iconSize: 46.0,
                padding: EdgeInsets.only(right: 22.0, bottom: 27),
                onPressed: () {
                  _onSearchButtonPressed();
                },
                icon: Image.asset('assets/images/insights.png')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: FloatingButton(),
        )

      ],
    );
  }

  void _onSearchButtonPressed() {
    //Get.to(InsightPage());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InsightPage()),
    );
  }

  void _onHomeButtonPressed() {
    Get.to(Home());
  }
}
