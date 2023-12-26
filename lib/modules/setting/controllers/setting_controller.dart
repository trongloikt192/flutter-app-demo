import 'package:get/get.dart';

class SettingController extends GetxController {
  final RxString name = "".obs;

  SettingController() {
    // constructor
  }

  void backToHome() {
    Get.back();
  }

  void onNameChanged(value) {
    this.name.value = value;
  }

  void onSave() {

  }
}