/* lib/models/expense,dart */

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Expense {
  String? id;
  DateTime date;
  num amount;
  String name;
  ImageIcon?   icon;
  String? user_name;

  Expense({ this.id, required this.date, required this.amount, required this.name, this.icon, this.user_name});


}