import 'package:finance_app/screens/SavingPage.dart';
import 'package:finance_app/widgets/SavingPercent.dart';
import 'package:flutter/material.dart';

class NewSaving extends StatefulWidget {
  const NewSaving({super.key});

  @override
  State<NewSaving> createState() => _nextRouteState();
}

class _nextRouteState extends State<NewSaving> {
  @override
  Widget build(BuildContext context) {
    var _color = Color.fromRGBO(51, 64, 79, 0.5);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (AssetImage("assets/images/background.png")),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                    //   alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(
                        left: 22.0, right: 180.0, top: 30),
                    child: Text(
                      "New Savings Plan",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 28.0, right: 115.0),
                    child: Text(
                      "Enter the parameters of the month :",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (Container(
                            child: SavingWidget(
                                child: Text(
                          "5%",
                          style: TextStyle(color: Colors.white),
                        )))),
                        Container(
                            child: SavingWidget(
                                child: Text("10%",
                                    style: TextStyle(color: Colors.white)))),
                        Container(
                            child: SavingWidget(
                                child: Text(
                          "15%",
                          style: TextStyle(color: Colors.white),
                        ))),
                        Container(
                            child: SavingWidget(
                                child: Text("20%",
                                    style: TextStyle(color: Colors.white)))),
                        Container(
                            child: SavingWidget(
                                child: Text(
                          "25%",
                          style: TextStyle(color: Colors.white),
                        ))),
                        Container(
                            child: SavingWidget(
                          child: Text(
                            "30%",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 300,
                ),
                Container(
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
                          child: Text("save"),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
