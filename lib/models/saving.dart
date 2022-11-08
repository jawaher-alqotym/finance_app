/* lib/models/saving,dart */

import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';


class Saving {
  String? id;
  String fromDate;
  String toDate;
  double percentage ;
  Catgory? catgory;
  String title ;
  String? user_name;

  Saving({this.id, required this.percentage,required this.fromDate, required this.toDate, required this.title, this.catgory, this.user_name});


  }
