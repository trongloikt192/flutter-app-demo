import 'dart:math';

import 'package:demo/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/routes.dart';
import '../../../services/translate_service.dart';
import '../../root/controllers/root_controller.dart';

class SettingController extends GetxController {
  RxString name = "".obs;
  late GetStorage _box;

  SettingController() {
    // constructor
    _box = new GetStorage();
  }

  @override
  void onInit() {
    super.onInit();
    this.name.value = _box.read(Constants.BOX_SETTING_NAME) ?? "";
  }

  void backToHome() {
    Get.find<RootController>().changePageByName(Routes.HOME);
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

  void onSaveToStorage() {
    this._box.write(Constants.BOX_SETTING_NAME, this.name.value);
  }

  void onLoadFromStorage() {
    this.name.value = _box.read(Constants.BOX_SETTING_NAME) ?? "";
  }

  onChangeLanguage(String value) async {
    await Get.find<TranslationService>().loadTranslation(locale: value);
    Get.updateLocale(Locale(value));
    await _box.write(Constants.BOX_SETTING_LANGUAGE, value);
  }

  onChangeThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
      );
    }
    _box.write(Constants.BOX_SETTING_THEME_MODE, themeMode.toString());
    Get.rootController.refresh();
  }
}