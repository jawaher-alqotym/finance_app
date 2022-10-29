import 'package:finance_app/screens/NewSavingPage.dart';
import 'package:finance_app/screens/SavingPage.dart';
import 'package:finance_app/widgets/customContainerForExpenesAndSaving.dart';
import 'package:flutter/material.dart';

class ExpensesAndSavingWidget extends StatefulWidget {
  const ExpensesAndSavingWidget({super.key});

  @override
  State<ExpensesAndSavingWidget> createState() =>
      _ExpensesAndSavingWidgetState();
}

class _ExpensesAndSavingWidgetState extends State<ExpensesAndSavingWidget> {
  // declare it here
  @override
  Widget build(BuildContext context) {
    bool isSelected;

    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: CustomContainer(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Color.fromARGB(255, 255, 255, 254),
                            ),
                            Text("Housing",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 254))),
                          ],
                        ),
                      ),
                    )),
                    Container(
                      child: CustomContainer(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              Icon(Icons.local_grocery_store_sharp,
                                  color: Color.fromARGB(255, 255, 255, 254)),
                              Text(
                                "Grocery",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 254)),
                              ),
                            ],
                          ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Row(
                          children: [
                            Icon(Icons.car_rental,
                                color: Color.fromARGB(255, 255, 255, 254)),
                            Text(
                              "Car",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 254)),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Container(
                      child: CustomContainer(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            children: [
                              Icon(Icons.wifi,
                                  color: Color.fromARGB(255, 255, 255, 254)),
                              Text(
                                "Internet ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 254)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13, top: 16),
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
