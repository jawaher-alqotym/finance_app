/* lib/models/saving,dart */

import 'package:finance_app/models/category.dart';
import 'package:flutter/material.dart';

class Saving {
  double percenst =0.0;
  double? amount_of_saving;
  Catgory? catgory;
  // double? userIncoum;

  Saving(double percent){
         this.percenst = percent;
         this.amount_of_saving =( 8000 * percent);
         this.catgory = null;
  }



  }
