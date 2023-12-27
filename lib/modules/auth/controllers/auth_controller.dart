import 'package:demo/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../../services/auth_service.dart';
import '../../../utils/ui.dart';

class AuthController extends GetxController {
  final Rx<User> currentUser = Get.find<AuthService>().user;
  late GlobalKey<FormState> loginFormKey;
  late GlobalKey<FormState> registerFormKey;
  final loading = false.obs;
  late UserRepository _userRepository;

  var username = "";
  var password = "";
  var fullName = "";

  AuthController() {
    // constructor
    loginFormKey = new GlobalKey<FormState>();
    registerFormKey = new GlobalKey<FormState>();
    _userRepository = UserRepository();
  }

  void login() async {
    Get.focusScope?.unfocus();
    if (loginFormKey.currentState?.validate() == false) {
      return;
    }

    loginFormKey.currentState?.save();
    loading.value = true;

    try {
      currentUser.value = await _userRepository.login(currentUser.value);
      await Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      loading.value = false;
    }
  }

  void register() async {
    Get.focusScope?.unfocus();
    if (registerFormKey.currentState?.validate() == false) {
      return;
    }

    registerFormKey.currentState?.save();
    loading.value = true;

    try {
      currentUser.value = await _userRepository.register(currentUser.value);
      await Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      loading.value = false;
    }
  }

  void logout() async {
    await Get.find<AuthService>().removeCurrentUser();
    return Get.offAllNamed(Routes.LOGIN);
  }
}
