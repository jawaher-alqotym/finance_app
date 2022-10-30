/* lib/models/expense,dart */

import 'package:finance_app/models/category.dart';

class Expense {
  DateTime? date;
  double? amount;
  String? name;
  Catgory? catgory;

  Expense({this.date, this.amount, this.name, this.catgory});


}