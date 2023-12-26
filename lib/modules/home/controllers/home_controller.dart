import 'package:demo/config/routes.dart';
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

}