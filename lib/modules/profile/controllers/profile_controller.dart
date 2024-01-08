import 'package:demo/config/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/routes.dart';
import '../../root/controllers/root_controller.dart';

class ProfileController extends GetxController {
  final RxString name = "".obs;
  late GetStorage _box;

  ProfileController() {
    // constructor
    _box = new GetStorage();
  }

  void backToHome() {
    Get.find<RootController>().changePageByName(Routes.HOME);
  }

  onGetNameFromStorage() {
    this.name.value = _box.read<String>(Constants.BOX_SETTING_NAME) ?? "";
  }
}
