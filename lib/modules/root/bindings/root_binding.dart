import 'package:demo/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController(),);
    Get.put(AuthController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
