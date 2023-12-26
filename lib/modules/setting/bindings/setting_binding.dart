import 'package:demo/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingController()/*, permanent: true*/);
  }
}