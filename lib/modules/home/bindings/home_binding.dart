import 'package:demo/modules/auth/controllers/auth_controller.dart';
import 'package:demo/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(AuthController());
  }
}