/* lib/models/saving,dart */

import 'package:finance_app/models/category.dart';
import 'package:finance_app/models/user.dart';


class Saving {
  DateTime? fromDate;
  DateTime? toDate;
  double percenst =0.0;
  Catgory? catgory;
  String title = "";
  User? user;

  Saving(double percent,  DateTime toDate, DateTime fromDate, String title){
         this.percenst = percent;
         //this.amount_of_saving =( userIncoum * percent).round();
         this.catgory = null;
         this.title = "null";
         this.title = title;

  }



  }
