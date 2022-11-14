import 'package:finance_app/screens/ExpencesPage.dart';
import 'package:finance_app/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/widgets/num_pad2.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:get/get.dart';
import 'package:finance_app/controllers/userController.dart';
import 'package:finance_app/models/expense.dart';

class addExpensesPage extends StatefulWidget {
  const addExpensesPage({super.key});
  @override
  State<addExpensesPage> createState() => _addExpensesPageState();
}

class _addExpensesPageState extends State<addExpensesPage> {
  final userController = Get.find<UserController>();
  bool isSelected = false;
  // text controller
  final TextEditingController _myController2 = TextEditingController();
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
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(right: 400.0, bottom: 30),
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () {
                        Navigator.of(context).push(_createRouteHomePage());
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromRGBO(83, 210, 88, 1),
                      ),
                    )),

                //num pad
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 51),
                      child: Container(
                        child: Text(
                          'خطة جديدة',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color.fromRGBO(51, 64, 79, 1)),
                        ),
                      ),
                    ),

                    // display the entered numbers
                    Padding(
                      padding: const EdgeInsets.all(60),
                      child: SizedBox(
                        height: 70,
                        child: Center(
                            child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(138, 135, 135, 0.5)),
                              border: InputBorder.none,
                              hintText: 'س.ر/شهريا'),
                          controller: _myController2,
                          textAlign: TextAlign.center,
                          showCursor: false,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                          // Disable the default soft keybaord
                          keyboardType: TextInputType.none,
                        )),
                      ),
                    ),
                    // implement the custom NumPad
                    NumPad(
                      buttonSize: 20,
                      buttonColor: Colors.white,
                      iconColor: Color.fromRGBO(226, 92, 92, 1),
                      controller: _myController2,
                      delete: () {
                        _myController2.text = _myController2.text
                            .substring(0, _myController2.text.length - 1);
                      },
                      // do something with the input numbers
                      onSubmit: () {
                        debugPrint(
                            'Your added Balance: ${_myController2.text}');
                        userController.addExpense(
                            new Expense(
                                date: new DateTime.now(),
                                amount: num.parse(_myController2.text),
                                name: userController.selectedText,
                                icon: userController.selectedIcon,
                                ) );

                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                content: Text(
                                  "تم الاضافة بنجاح :${_myController2.text} ر.س",
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.end,
                                ),
                                // icon: Icon(
                                //   Icons.check,
                                //   color: Colors.green,
                                //   size: 150,
                                // ),

                                icon: Icon(Icons.check_circle_rounded,
                                    size: 150,
                                    color: Color.fromRGBO(83, 210, 88, 1))

                                // ImageIcon(
                                //   AssetImage(
                                //       "assets/images/icons8-ok-512 1.pn "),
                                //   color: Color.fromRGBO(83, 210, 88, 1),
                                //   size: 150,
                                // ),

                                ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRouteHomePage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
