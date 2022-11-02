/* lib/models/expense,dart */

import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';

class Expense {
  DateTime date;
  num amount;
  String name;
  Catgory? catgory;
  User? user;

  Expense({ required this.date, required this.amount, required this.name, this.catgory});


}