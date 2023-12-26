import 'package:demo/modules/profile/controllers/profile_controller.dart';
import 'package:demo/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  // final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Screen",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFB700),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                "Hi, ${controller.name.value}",
                style: Theme.of(context).textTheme.titleMedium
              ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20);
            }),
            MaterialButton(
              onPressed: () => {
                controller.onGetNameFromStorage(),
              },
              color: const Color(0xFFFFB700),
              child: const Text('Get name from storage'),
            ).paddingOnly(left: 50, right: 50),
            MaterialButton(
              onPressed: () => {
                /// Go back to previous screen
                controller.backToHome()
              },
              color: const Color(0xFFFFB700),
              child: const Text('Back to home screen'),
            ).paddingOnly(left: 50, right: 50),
          ],
        )
    );
  }
}