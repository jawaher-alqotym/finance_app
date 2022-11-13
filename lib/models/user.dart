/* lib/model/user.dart */


import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';

class User {
  String? id;
  DateTime? login;
  var name;
  var oldIncome;
  var income;
  List<Saving> savingList = <Saving>[];
  List<Expense> expenseList = <Expense>[];

  User({required this.oldIncome, this.name, this.login, required this.income, required this.savingList, required this.expenseList});


}