import 'package:demo/config/routes.dart';
import 'package:demo/modules/auth/controllers/auth_controller.dart';
import 'package:demo/services/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {


  HomeController() {
    // constructor
  }

  void goToProfile() {
    Get.toNamed(Routes.PROFILE);
  }

  void goToSetting() {
    Get.toNamed(Routes.SETTING);
  }

  Future<void> onLogout() async {
    return Get.find<AuthController>().logout();
  }

}