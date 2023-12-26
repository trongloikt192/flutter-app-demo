import 'package:demo/utils/helper.dart';
import 'package:get/get.dart';

import '../models/global_model.dart';

class GlobalService extends GetxService {
  final global = Global().obs;

  Future<GlobalService> init() async {
    return this;
  }

  String get baseUrl => Helper.env('BACKEND01_API_ENDPOINT');
}
