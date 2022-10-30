/* lib/controller/userController */

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/user.dart';

import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';

class UserController extends GetxController {
  User user = new User(income: 0, savingList: <Saving>[], expenseList: <Expense>[]);


  updateIncome(newIncome){
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
