/* lib/models/saving,dart */

import 'package:finance_app/models/category.dart';
import 'package:flutter/material.dart';


class Saving {
  double percenst =0.0;
  num? amount_of_saving;
  Catgory? catgory;
  num userIncoum = 9000;

  Saving(double percent){
         this.percenst = percent;
         this.amount_of_saving =( userIncoum * percent).round();
         this.catgory = null;
  }



  }
