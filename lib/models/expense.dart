/* lib/models/expense,dart */

import 'package:finance_app/models/category.dart';

class Expense {
  DateTime date;
  num? amount;
  String? name;
  Catgory? catgory;

  Expense({ required this.date, this.amount, this.name, this.catgory});


}