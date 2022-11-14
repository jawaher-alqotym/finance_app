/* lib/controller_binding */

import 'package:get/instance_manager.dart';
import 'package:finance_app/controllers/userController.dart';
import 'package:finance_app/controllers/savingController.dart';



class ControllerBindings extends Bindings {

  @override
  void dependencies() {
    Get.put<UserController>(UserController());
    Get.put<SavingsController>(SavingsController());


  }
}