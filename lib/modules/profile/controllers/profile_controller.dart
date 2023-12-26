import 'package:demo/config/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final RxString name = "".obs;
  late GetStorage _box;

  ProfileController() {
    // constructor
    _box = new GetStorage();
  }

  void backToHome() {
    Get.back();
  }

  onGetNameFromStorage() {
    this.name.value = _box.read<String>(Constants.BOX_SETTING_NAME) ?? "";
  }

}