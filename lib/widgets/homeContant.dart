/* lib/widgets/floatingButton.dart */

import 'package:flutter/material.dart';
import 'package:finance_app/widgets/navBar.dart';
import 'package:finance_app/widgets/floatingButton.dart';

import 'package:finance_app/widgets/expenseCard.dart';
import 'package:finance_app/widgets/savingCard.dart';

import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:finance_app/widgets/addBalance.dart';
import 'package:finance_app/widgets/num_pad.dart';

import "package:finance_app/controllers/userController.dart";
import "package:finance_app/models/user.dart";
import "package:finance_app/models/saving.dart";
import "package:finance_app/models/expense.dart";

class HomeContant extends StatefulWidget {
  const HomeContant({super.key});

  @override
  State<HomeContant> createState() => _HomeContantState();
}

class _HomeContantState extends State<HomeContant> {
  // text controller
  final TextEditingController _myController = TextEditingController();
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String welcomeMessage = "Good afternoon";

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Text(
                      "$welcomeMessage",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 0),
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
                      right: 0.0,
                    ),
                    child: TextButton(
                      onPressed: () => showBottomSheet(
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.0),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => buildSheet()),
                      child: Text(
                        "${userController.user.income} SR +",
                        style: TextStyle(
                          color: userController.user.income > 0
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height: 180,
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 256.0, top: 60.0),
                              child: Text(
                                "Savings",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xFF33404F)),
                              ),
                            ),
                            Container(
                              height: 90,
                              margin: EdgeInsets.only(
                                  left: 0.0, top: 39.0, bottom: 32),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      userController.user.savingList.length,
                                  itemBuilder: (context, index) => SavingCard(
                                        percenst: userController
                                            .user.savingList[index].percenst,
                                        amount_of_saving: userController.user
                                            .savingList[index].amount_of_saving,
                                      )),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 242.0,
                              ),
                              child: Text(
                                "Expences",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xFF33404F)),
                              ),
                            ),
                            Container(
                              height: 190,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      userController.user.expenseList.length,
                                  itemBuilder: (context, index) => ExpenseCard(
                                      date: userController.user.expenseList[index].date,
                                      amount: userController.user.expenseList[index].amount
                                      ,name: userController.user.expenseList[index].name,
                                       //catgory : userController.user.expenseList[index].catgory,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        navBar(),
      ],
    );
  }

  Widget buildSheet() => Container(
        height: (MediaQuery.of(context).size.height) - 70,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Your Balance',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(51, 64, 79, 1)),
            ),
            // display the entered numbers
            Padding(
              padding: const EdgeInsets.all(20),
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
                      hintText: '0 SAR/Month'),
                  controller: _myController,
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
              controller: _myController,
              delete: () {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              },
              // do something with the input numbers
              onSubmit: () {
                userController.updateIncome(double.parse(_myController.text));
                print(userController.user.income);
                debugPrint('Your added Balance: ${_myController.text}');
                // showDialog(
                //     context: context,
                //     builder: (_) => AlertDialog(
                //       content: Text(
                //         "Your added balance: \n ${_myController.text}",
                //         style: const TextStyle(fontSize: 20),
                //       ),
                //     ));
              },
            ),
          ],
        ),
      );
}
