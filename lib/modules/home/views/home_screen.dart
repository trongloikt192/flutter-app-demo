import 'package:demo/modules/home/controllers/home_controller.dart';
import 'package:demo/modules/root/views/root_screen.dart';
import 'package:demo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootScreen(
        title: "Home Screen",
        showDrawer: true,
        container: Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Obx(() {
                return Text("${"Hi".tr}, ${Get.find<AuthService>().name}",
                        style: context.theme.textTheme.titleLarge)
                    .paddingOnly(left: 50, right: 50)
                    .marginOnly(bottom: 20);
              }),
              MaterialButton(
                onPressed: () => {
                  /// Go to next screen
                  controller.goToProfile()
                },
                color: context.theme.colorScheme.primary,
                child: Text('Profile screen'.tr),
              ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
              MaterialButton(
                onPressed: () => {
                  /// Go to next screen
                  controller.goToSetting()
                },
                color: context.theme.colorScheme.primary,
                child: Text('Setting screen'.tr),
              ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
            ])
        )
    );
  }
}
