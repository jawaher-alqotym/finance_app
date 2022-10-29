/* lib/widgets/floatingButton.dart */

import 'package:flutter/material.dart';
import 'package:finance_app/widgets/navBar.dart';
import 'package:finance_app/widgets/floatingButton.dart';
import 'package:finance_app/widgets/addBalance.dart';

class HomeContant extends StatefulWidget {
  const HomeContant({super.key});

  @override
  State<HomeContant> createState() => _HomeContantState();
}

class _HomeContantState extends State<HomeContant> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String welcomeMessage = "Good afternoon";
    double balance = 0.0;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 162.0),
                    child: Text(
                      "$welcomeMessage",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 200),
                    child: Text(
                      "Here's Your Balance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 220.0,
                    ),
                    child: TextButton(
                      onPressed: () => showBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => buildSheet()),
                      child: Text(
                        "$balance SR +",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height: 130,
              width: screenWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26),
                    topLeft: Radius.circular(26),
                  ),
                ),
                height: 572,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30.0, top: 60.0),
                      child: Text(
                        "Savings",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF33404F)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30.0, top: 100.0),
                      child: Text(
                        "Expences",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF33404F)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        navBar(),
        FloatingButton(),
      ],
    );
  }

  Widget buildSheet() => Container();
}
