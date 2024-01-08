import 'package:demo/modules/home/controllers/home_controller.dart';
import 'package:demo/modules/root/controllers/root_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController(), permanent: true);
    Get.put(HomeController());
  }
}
