import "package:finance_app/controllers/userController.dart";
import "package:finance_app/controllers/userController.dart";
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/saving.dart';


class SavingsController extends GetxController {
  Saving savings = new Saving(0.0);

  updateSaving(newIncom){
    this.savings.userIncoum = newIncom;
  }
}