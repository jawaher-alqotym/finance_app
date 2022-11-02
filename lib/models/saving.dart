/* lib/models/saving,dart */

import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';


class Saving {
  String fromDate;
  String? toDate;
  double percenst ;
  Catgory? catgory;
  String title ;
  User? user;

  Saving({ required this.percenst,required this.fromDate, this.toDate, required this.title, this.catgory, this.user});


  }
