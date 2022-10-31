/* lib/controller/userController */

import 'package:finance_app/models/category.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/user.dart';

import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';

import 'package:finance_app/controllers/savingController.dart';


import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

DateTime now = new DateTime.now();
DateTime today = new DateTime(now.year, now.month, now.day);

class UserController extends GetxController {
  User user = new User(income: 0, savingList:
  <Saving>[
               new Saving(0.30),
               new Saving(0.50),
  ],
      expenseList: <Expense>[
        new Expense(date: today , amount: 1000, name: 'rent', catgory: new Catgory(title: "Housing", icon: Icon(Icons.home))),
        new Expense(date: today , amount: 3500, name: 'subscription', catgory: new Catgory(title: "Wifi", icon: Icon(Icons.wifi))),

      ]);


  updateIncome(newIncome){
    print("in updateIncome $newIncome");
    this.user.income = newIncome;

  }

  addSavings(Saving saving){
    this.user.savingList.add(saving);
    subtractFromIncome(saving.amount_of_saving);
  }

  addExpense(Expense expense){
    this.user.expenseList.add(expense);
    subtractFromIncome(expense.amount);

  }

  bool subtractFromIncome(amount){
    this.user.income = this.user.income - amount;
    return true;
  }

  DateTime getLoginDate(){
    DateTime now = new DateTime.now();
    return new DateTime( now.hour, now.minute);
  }
}
