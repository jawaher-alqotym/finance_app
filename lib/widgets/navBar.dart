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
                padding: EdgeInsets.only(left: 25.0, bottom: 27),
                onPressed: () {
                  //  _onSearchButtonPressed();
                  Navigator.of(context).push(_createRouteInsightPage());
                },
                icon: SvgPicture.asset('assets/icons/insightsIcon.svg')),
            ButtonBar(),
            IconButton(
                iconSize: 46.0,
                padding: EdgeInsets.only(right: 35.0, bottom: 27),
                onPressed: () => {
                      //  _onHomeButtonPressed()
                      Navigator.of(context).push(_createRoute())
                    },
                icon: SvgPicture.asset('assets/icons/homeIcon.svg',),),
            // FlowMenu(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: FloatingButton(),
        )
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Home(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  Route _createRouteInsightPage() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => InsightPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
