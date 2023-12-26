import 'dart:math';

import 'package:get/get.dart';

class SettingController extends GetxController {
  final RxString name = "".obs;

  SettingController() {
    // constructor
  }

  void backToHome() {
    Get.back();
  }

  void onFieldSubmitted(value) {
    this.name.value = value;
  }

  void onGenerateRandom() {
    // Get random in list
    final nameList = [
      "Amirah Odom",
      "Adrian Blackburn",
      "Woody Mcleod",
      "Alia Rose",
      "Cody Connolly",
      "Layla Hancock",
      "Aimee Conway",
      "Aditya Hampton",
      "Shirley Potter",
      "Sidney Weeks"
    ];
    final _random = new Random();
    final randomIdx = _random.nextInt(nameList.length);

    // Set value to name
    this.name.value = nameList[randomIdx];
  }
}