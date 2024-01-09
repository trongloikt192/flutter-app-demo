import 'package:demo/modules/profile/controllers/profile_controller.dart';
import 'package:demo/modules/root/views/root_screen.dart';
import 'package:demo/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootScreen(
        showDrawer: true,
        title: "Profile Screen",
        container: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hi, ${Get.find<AuthService>().user.value.name}",
                    style: context.theme.textTheme.titleMedium
                ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
                MaterialButton(
                  onPressed: () => {
                    /// Go back to previous screen
                    controller.backToHome()
                  },
                  color: context.theme.colorScheme.primary,
                  child: Text('Back to home screen'.tr),
                ).paddingOnly(left: 50, right: 50),
              ],
            )
        )
    );
  }
}
