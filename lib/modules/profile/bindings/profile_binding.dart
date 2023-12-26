import 'package:demo/modules/profile/controllers/profile_controller.dart';
import 'package:demo/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    // Get.lazyPut(() => SettingController());
  }
}