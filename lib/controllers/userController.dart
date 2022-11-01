/* lib/controller/userController */

import 'package:finance_app/models/category.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/user.dart';

import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';


import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

DateTime now = new DateTime.now();
DateTime today = new DateTime(now.year, now.month, now.day);

class UserController extends GetxController {
  User user = new User(income: 0,oldIncome: 0, savingList:
  <Saving>[
               new Saving(percenst: 0.30, fromDate: now, toDate: now , title: "البيت"),
               new Saving(percenst: 0.30, fromDate: now, toDate: now , title: "السيارة"),

  ],
      expenseList: <Expense>[
        new Expense(date: today , amount: 100, name: 'الايجار', catgory: new Catgory(title: "المنزل", icon: Icon(Icons.home))),
        new Expense(date: today , amount: 3500, name: 'إشتراك', catgory: new Catgory(title: "انترنت", icon: Icon(Icons.wifi))),

      ], name: "احمد");


  updateIncome(newIncome){
    print("in updateIncome $newIncome");
    this.user.oldIncome = this.user.income;
    this.user.income = newIncome.round();

  }

  addSavings(Saving saving){
    this.user.savingList.add(saving);
    subtractSavingFromIncome(saving.percenst);
  }

  addExpense(Expense expense){
    this.user.expenseList.add(expense);
    subtractExpenseFromIncome(expense.amount);

  }

  bool subtractSavingFromIncome(percenst){
    this.user.income = this.user.income - (this.user.income*percenst);
    return true;
  }

  bool subtractExpenseFromIncome(amount){
    this.user.income = this.user.income - amount;
    return true;
  }

  num getSpendingTotal(){
    final num total = user.expenseList.fold(0, (sum, item) => sum + num.parse(item.amount.toString()));
    return total;
  }

  num getSavingTotal(){
    var income = user.income != null ? user.income : 10000;
    final num total = user.savingList.fold(0, (sum, item) => sum + num.parse((income * item.percenst).toString()));
    return total;

  }

  getPieChartData(){

  }

  DateTime getLoginDate(){
    DateTime now = new DateTime.now();
    return new DateTime( now.hour, now.minute);
  }
}
