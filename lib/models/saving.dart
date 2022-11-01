/* lib/models/saving,dart */

import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';


class Saving {
  DateTime? fromDate;
  DateTime? toDate;
  double percenst ;
  Catgory? catgory;
  String title ;
  User? user;

  Saving({ required this.percenst, this.fromDate, this.toDate, required this.title, this.catgory, this.user});


  }
