import 'package:finance_app/screens/NewSavingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customContainerForExpenesAndSaving.dart';

class SavingWidget extends StatefulWidget {
  const SavingWidget({super.key});

  @override
  State<SavingWidget> createState() => _SavingWidgetState();
}

class _SavingWidgetState extends State<SavingWidget> {
  // declare it here
  @override
  Widget build(BuildContext context) {
    bool isSelected;

    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Container(
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: CustomContainer(
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageIcon(
                            AssetImage("assets/icons/HomeIcon.png"),
                            color: Color.fromARGB(255, 255, 255, 254),
                          ),
                          SizedBox(width: 10),
                          Text("Housing",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 255, 255, 254))),
                        ],
                      ),
                    )),
                    Container(
                      child: CustomContainer(
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/GreceryIcon.png"),
                              color: Color.fromARGB(255, 255, 255, 254),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Grocery",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 255, 255, 254)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: CustomContainer(
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/icons/CarIcon.png"),
                            color: Color.fromARGB(255, 255, 255, 254),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Car",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 255, 255, 254)),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      child: CustomContainer(
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/WifiIcon.png"),
                              color: Color.fromARGB(255, 255, 255, 254),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Phone&Internet",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    254,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: CustomContainer(
                            child: TextButton.icon(
                                onPressed: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                icon: Icon(Icons.add,
                                    color: Color.fromARGB(255, 255, 255, 254)),
                                label: Text(""))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const NewSaving(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
