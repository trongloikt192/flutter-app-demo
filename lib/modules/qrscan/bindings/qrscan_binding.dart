import 'package:demo/modules/qrscan/controllers/qrscan_controller.dart';
import 'package:get/get.dart';

class QRScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QRScanController());
  }
}
