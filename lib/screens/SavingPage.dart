import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/widgets/expensesandsaving.dart';
import 'package:finance_app/widgets/savingWidget.dart';
import 'package:flutter/material.dart';

class SavingPage extends StatelessWidget {
  const SavingPage({super.key});

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
              borderRadius: BorderRadius.all(Radius.circular(26)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 350.0, bottom: 15),
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () => {Navigator.pop(context)},
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromRGBO(83, 210, 88, 1),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 22.0, right: 210.0),
                    child: Text(
                      "New Saving",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 28.0, right: 65.0),
                    child: Text(
                      "Select categories you want to Savings",
                      style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(83, 210, 88, 1)),
                    )),
                Container(child: SavingWidget()),
                Container(
                    //  alignment: Alignment.center,
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
                          onPressed: () {},
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
