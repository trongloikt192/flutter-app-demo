import 'package:demo/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/routes.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFB700),
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onSaved: (input) => controller.currentUser.value.email = input,
              validator: (input) => input!.length < 3
                  ? "Should be more than 3 characters".tr
                  : null,
              decoration: InputDecoration(
                icon: const Icon(Icons.person),
                labelText: 'Username'.tr,
              ),
            ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
            TextFormField(
              onSaved: (input) => controller.currentUser.value.password = input,
              validator: (input) => input!.isEmpty
                  ? "Required".tr
                  : null,
              decoration: InputDecoration(
                icon: const Icon(Icons.key),
                labelText: 'Password'.tr,
              ),
            ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
            MaterialButton(
              onPressed: () => controller.login(),
              color: const Color(0xFFFFB700),
              child: Text('Login'.tr),
            ).paddingOnly(left: 50, right: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text("You don't have an account?".tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
