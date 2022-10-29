import 'package:finance_app/widgets/expensesandsaving.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});
  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final activeColor = Colors.white30;
  final inactiveColor = Colors.white12;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (AssetImage("assets/images/background.png")),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                    height: 20,
                    margin: const EdgeInsets.only(
                        left: 350.0, right: 20.0, bottom: 15),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromRGBO(83, 210, 88, 1),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 22.0, right: 210.0),
                    child: Text(
                      "New Expenses",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 28.0, right: 30.0),
                    child: Text(
                      "Select categories you want to budget and track",
                      style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(83, 210, 88, 1)),
                    )),
                Container(child: ExpensesAndSavingWidget()),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: 316,
                        height: 45.28,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:
                                Color.fromRGBO(83, 210, 88, 1), // background
                            onPrimary: Color.fromRGBO(51, 64, 79, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.88),
                            ),
                            // foreground
                          ),
                          onPressed: () {
                            print("oooooo");
                          },
                          child: Text("Next"),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
