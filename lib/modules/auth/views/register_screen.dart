import 'package:demo/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Register Screen".tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFB700),
        ),
        body: Form(
          key: controller.registerFormKey,
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
                validator: (input) => input!.length < 6
                    ? "Should be more than 6 characters".tr
                    : null,
                decoration: InputDecoration(
                  icon: const Icon(Icons.key),
                  labelText: 'Password'.tr,
                ),
              ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
              TextFormField(
                validator: (input) => input != controller.currentUser.value.password
                    ? "Password confirmation must same".tr
                    : null,
                decoration: InputDecoration(
                  icon: const Icon(Icons.key),
                  labelText: 'Password Confirmation'.tr,
                ),
              ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
              MaterialButton(
                onPressed: () => {controller.register()},
                color: const Color(0xFFFFB700),
                child: Text('Register'.tr),
              ).paddingOnly(left: 50, right: 50),
            ],
          ),
        ));
  }
}
