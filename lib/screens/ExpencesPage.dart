import 'package:finance_app/screens/Home.dart';
import 'package:finance_app/screens/add_new_expense_page.dart';
import 'package:finance_app/widgets/customContainerForExpenes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});
  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: (AssetImage("assets/images/Ellipse 249.png")),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.only(top: 160),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(26)),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Container(
                          height: 30,
                          width: 30,

                          //   alignment: AlignmentDirectional.topEnd,
                          margin: const EdgeInsets.only(bottom: 15, right: 400),
                          child: IconButton(
                            iconSize: 35,
                            onPressed: () {
                              Navigator.of(context)
                                  .push(_createRouteHomePage());
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Color.fromRGBO(83, 210, 88, 1),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 38),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              child: Text("مصاريف جديدة",
                                  style: TextStyle(
                                    fontFamily: 'HacenDigital',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                "حدد الفئة التي تريد  تتبع ميزانيتها",
                                style: TextStyle(
                                    fontFamily: 'HacenDigital',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color.fromRGBO(83, 210, 88, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(26.0),
                                  child: Container(
                                      height: 500,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                textDirection:
                                                    TextDirection.rtl,
                                                children: [
                                                  CustomContainer(
                                                    text: Text("بيت",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    254))),
                                                    icon: ImageIcon(
                                                      AssetImage(
                                                          "assets/icons/HomeIcon.png"),
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 254),
                                                    ),
                                                  ),
                                                  CustomContainer(
                                                    text: Text(
                                                      "مقاضي",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              254)),
                                                    ),
                                                    icon: ImageIcon(
                                                      AssetImage(
                                                          "assets/icons/GreceryIcon.png"),
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 254),
                                                    ),
                                                  )
                                                ]),
                                            SizedBox(height: 15),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CustomContainer(
                                                    text: Text(
                                                      "السيارة",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              254)),
                                                    ),
                                                    icon: ImageIcon(
                                                      AssetImage(
                                                          "assets/icons/CarIcon.png"),
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 254),
                                                    ),
                                                  ),
                                                  CustomContainer(
                                                    text: Text(
                                                      "الجوال & الانترنت",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            254,
                                                          )),
                                                    ),
                                                    icon: ImageIcon(
                                                      AssetImage(
                                                          "assets/icons/WifiIcon.png"),
                                                      color: Color.fromARGB(
                                                          255, 255, 255, 254),
                                                    ),
                                                  )
                                                ]),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomContainer(
                                                  text: Text(
                                                    "التعليم",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            254)),
                                                  ),
                                                  icon: ImageIcon(
                                                    AssetImage(
                                                        "assets/images/icons-student.png"),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 254),
                                                  ),
                                                ),
                                                CustomContainer(
                                                  text: Text(
                                                    " الصحة",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                          255,
                                                          255,
                                                          255,
                                                          254,
                                                        )),
                                                  ),
                                                  icon: ImageIcon(
                                                    AssetImage(
                                                        "assets/images/icons-clinic.png"),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 254),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 15),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomContainer(
                                                  text: Text(
                                                    "المأكولات &المشروبات",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color.fromARGB(
                                                            255,
                                                            255,
                                                            255,
                                                            254)),
                                                  ),
                                                  icon: ImageIcon(
                                                    AssetImage(
                                                        "assets/images/icons-cutlery.png"),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 254),
                                                  ),
                                                ),
                                                CustomContainer(
                                                  text: Text(
                                                    " العائلة",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color.fromARGB(
                                                        255,
                                                        255,
                                                        255,
                                                        254,
                                                      ),
                                                    ),
                                                  ),
                                                  icon: ImageIcon(
                                                    AssetImage(
                                                        "assets/images/icons-family.png"),
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 254),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 40),
                                            Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: SizedBox(
                                                    width: 316,
                                                    height: 45.28,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Color.fromRGBO(
                                                            83,
                                                            210,
                                                            88,
                                                            1), // background
                                                        onPrimary:
                                                            Color.fromRGBO(
                                                                51, 64, 79, 1),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      7.88),
                                                        ),
                                                        // foreground
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context).push(
                                                            _createRouteaddExpensesPage());
                                                      },
                                                      child: Text("التالي"),
                                                    )))
                                          ])))))
                    ])))));
  }
}

Route _createRouteaddExpensesPage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => addExpensesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

Route _createRouteHomePage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
