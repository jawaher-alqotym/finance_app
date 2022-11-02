/* lib/controller/userController */

import 'package:finance_app/models/category.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/user.dart';

import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';


import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'dart:math';

DateTime now = new DateTime.now();
DateTime today = new DateTime(now.year, now.month, now.day);

class UserController extends GetxController {
  User user = new User(income: 0,oldIncome: 0, savingList:
  <Saving>[
               new Saving(percenst: 0.30, fromDate: now, toDate: now , title: "البيت"),
               new Saving(percenst: 0.30, fromDate: now, toDate: now , title: "السيارة"),

  ],
      expenseList: <Expense>[
         // new Expense(date: today , amount: 100, name: 'الايجار', catgory: new Catgory(title: "المنزل", icon: Icon(Icons.home))),
        // new Expense(date: today , amount: 3500, name: 'البيت', catgory: new Catgory(title: "انترنت", icon: Icon(Icons.wifi))),

      ], name: "احمد");

  List<Expense> searchResuilt = <Expense>[];

  var selectedText = "";

  @override
  void onInit() {
    super.onInit();
    searchResuilt = user.expenseList;
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
  updateIncome(newIncome){
    print("in updateIncome $newIncome");
    this.user.oldIncome += this.user.income;
    this.user.income += newIncome.round();
    update();

  }

  addSavings(Saving saving){
    this.user.savingList.add(saving);
    subtractSavingFromIncome(saving.percenst);
    update();

  }

  addExpense(Expense expense){
    this.user.expenseList.add(expense);
    subtractExpenseFromIncome(expense.amount);
    update();


  }

  bool subtractSavingFromIncome(percenst){
    this.user.income = this.user.income - (this.user.income*percenst);
    update();
    return true;


  }

  bool subtractExpenseFromIncome(amount){
    this.user.income = this.user.income - amount;
    update();
    return true;


  }

  num getSpendingTotal(){
    num total = user.expenseList.fold(0, (sum, item) => sum + num.parse(item.amount.toString()));
    total > 0 ? total: total = 0;
    update();
    return total;


  }

  num getSavingTotal(){
    var income = user.income != null ? user.income : 10000;
    final num total = user.savingList.fold(0, (sum, item) => sum + num.parse((income * item.percenst).toString()));
    update();
    return total;

  }

  getPieChartData(){
    /*% of spending compear to incum */
    var income = user.income != null ? user.income : 10000;

    var percent = double.parse((double.parse(getSpendingTotal().toString()) / income).toStringAsFixed(2));
    print(getSpendingTotal());
    print(income);
    print(percent.toString());


    if(percent.isFinite && getSpendingTotal()>0.0){
      if(percent > 0.0 && percent <1.0){
        return  percent;
      }else{
        percent = income / double.parse((double.parse(getSpendingTotal().toString())).toStringAsFixed(2))*-1;
        print(percent);
        return percent;
      }
    }else{
      return 0.0;
    }


  }

  DateTime getLoginDate(){
    DateTime now = new DateTime.now();
    return new DateTime( now.hour, now.minute);
  }
}
