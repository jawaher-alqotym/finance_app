/* lib/model/user.dart */


import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';

class User {
  DateTime? login;
  double income;
  List<Saving> savingList = <Saving>[];
  List<Expense> expenseList = <Expense>[];

  User({this.login, required this.income, required this.savingList, required this.expenseList});


}