/* lib/controller_binding */

import 'package:get/instance_manager.dart';
import 'package:finance_app/controllers/userController.dart';
import 'package:finance_app/controllers/categoryController.dart';


class ControllerBindings extends Bindings {

  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
    Get.put<UserController>(UserController());

  }
}