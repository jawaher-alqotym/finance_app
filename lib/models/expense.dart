/* lib/models/expense,dart */

import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';

class Expense {
  String? id;
  DateTime date;
  num amount;
  String name;
  Catgory? catgory;
  String? user_name;

  Expense({ this.id, required this.date, required this.amount, required this.name, this.catgory, this.user_name});


}