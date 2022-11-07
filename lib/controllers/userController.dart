/* lib/controller/userController */

import 'package:finance_app/models/category.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/user.dart';

import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';


import 'package:cloud_firestore/cloud_firestore.dart';



import 'dart:math';

DateTime now = new DateTime.now();
DateTime today = new DateTime(now.year, now.month, now.day);

class UserController extends GetxController {
  User user = new User(income: 0,oldIncome: 0, savingList:
  <Saving>[
               // new Saving(percenst: 0.30, fromDate: now, toDate: now , title: "البيت"),
               // new Saving(percenst: 0.30, fromDate: now, toDate: now , title: "السيارة"),

  ].obs,

      expenseList: <Expense>[
        // new Expense(date: today , amount: 100, name: 'الايجار', catgory: new Catgory(title: "المنزل", icon: Icon(Icons.home))),
        // new Expense(date: today , amount: 3500, name: 'البيت', catgory: new Catgory(title: "انترنت", icon: Icon(Icons.wifi))),

      ].obs, name: "jhone");

  List<Expense> searchResuilt = <Expense>[];

  var selectedText;
  var selectedPercent;
  var selectedFromDate;
  var selectedToDate;  // this must be moved to savings controller


  @override
  void onInit() {
    super.onInit();
    searchResuilt = user.expenseList;
  }

  Future<void> getUserData(String user_name) async {
    try {
      QuerySnapshot _snapSavings = await FirebaseFirestore.instance
          .collection('Savings')
          .where("user_name", isEqualTo: user_name)
          .get();

      QuerySnapshot _snapExpences = await FirebaseFirestore.instance
          .collection('Expenses')
          .where("user_name", isEqualTo: user_name)
          .get();

      user.savingList.clear();
      user.expenseList.clear();


      for (var item in _snapSavings.docs) {
        user.savingList.add(
          new Saving(percenst: double.parse(item["percenst"]), fromDate: item["fromDate"], toDate: item["toDate"], title: item["title"])
        );
      }
      for (var item in _snapExpences.docs) {
        user.expenseList.add(
          new Expense(date: (item["date"]).toDate(), amount: item["amount"], name: item["name"]));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onClose() {}
  void filterExpences(String name) {
    print(name);
    List<Expense> results = [];
    if (name.isEmpty) {
      results = user.expenseList;
    } else {
      results = user.expenseList
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
    }
    searchResuilt = results;
    update();
  }

  updateIncome(newIncome) {
    this.user.oldIncome += this.user.income;
    this.user.income += newIncome.round();
    update();
  }

  addSavings(Saving saving) {
    this.user.savingList.add(saving);
    subtractSavingFromIncome(saving.percenst);
    print(user.savingList[0].title);
    update();
  }

  addExpense(Expense expense) {
    this.user.expenseList.add(expense);
    subtractExpenseFromIncome(expense.amount);
    update();
  }

  bool subtractSavingFromIncome(percenst) {
    this.user.income = this.user.income - (this.user.income * percenst);
    update();
    return true;
  }

  bool subtractExpenseFromIncome(amount) {
    this.user.income = this.user.income - amount;
    update();
    return true;
  }

  num getSpendingTotal() {
    num total = user.expenseList
        .fold(0, (sum, item) => sum + num.parse(item.amount.toString()));
    update();
    return total;
  }

  num getSavingTotal() {
    var income = user.income != null ? user.income : 10000;
    final num total = user.savingList.fold(
        0, (sum, item) => sum + num.parse((income * item.percenst).toString()));
    update();
    return total;
  }

  getPieChartData() {
    var income = user.oldIncome != null ? user.oldIncome : 10000;

    if (income <= getSpendingTotal()) {
      return 1.0;
    }
    var percent = double.parse(
        (double.parse(getSpendingTotal().toString()) / income)
            .toStringAsFixed(2));

    print(getSpendingTotal());
    print(income);
    print(percent.toString());

    if (income.isFinite && getSpendingTotal() >= 0.0) {
      return percent;
    } else {
      return 0.0;
    }
  }

  DateTime getLoginDate() {
    DateTime now = new DateTime.now();
    return new DateTime(now.hour, now.minute);
  }
  String welcomeMsg(){
    var currentHour= DateTime.now().hour;
    if(currentHour<12){
      return'صباح الخير';
    }
    else{
      return'مساء الخير';
    }
  }
}
