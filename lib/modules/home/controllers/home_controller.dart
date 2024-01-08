import 'package:demo/config/routes.dart';
import 'package:demo/modules/root/controllers/root_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  HomeController() {
    // constructor
  }

  void goToProfile() {
    Get.find<RootController>().changePageByName(Routes.PROFILE);
  }

  void goToSetting() {
    Get.find<RootController>().changePageByName(Routes.SETTING);
  }
}
