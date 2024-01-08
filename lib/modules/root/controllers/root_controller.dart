import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../services/auth_service.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;
  final notificationsCount = 0.obs;

  RootController() {
    //
  }

  List<String> pages = [
    Routes.HOME,
    Routes.QR_SCAN,
    Routes.PROFILE,
    Routes.SETTING,
  ];

  Future<void> changePageByIndex(int index) async {
    if (!Get.find<AuthService>().isAuth && index > 0) {
      await Get.toNamed(Routes.LOGIN);
    } else {
      currentIndex.value = index;
      await Get.toNamed(pages[index]);
    }
  }

  Future<void> changePageByName(String routeName) async {
    int index = pages.indexWhere((element) => element == routeName);
    changePageByIndex(index);
  }
}
