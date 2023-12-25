import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_screen.dart';
import 'routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Screen",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFB700),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () => {
                /// Go to next screen
                Get.to(const ProfileScreen()),

                /// Go to next screen, and remove the previous page
                // Get.off(const ProfileScreen()),

                /// by name
                // Get.toNamed(Routes.PROFILE),
              },
              color: const Color(0xFFFFB700),
              child: const Text('Profile screen'),
            ).paddingAll(50)
          ],
        ));
  }
}
