import 'package:demo/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class HomeScreen extends GetView<HomeController> {
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
                controller.goToProfile()
              },
              color: const Color(0xFFFFB700),
              child: const Text('Profile screen'),
            ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
            MaterialButton(
              onPressed: () => {
                /// Go to next screen
                controller.goToSetting()
              },
              color: const Color(0xFFFFB700),
              child: const Text('Setting screen'),
            ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
            MaterialButton(
              onPressed: () => {
                controller.onLogout()
              },
              color: const Color(0xFFFFB700),
              child: const Text('Logout'),
            ).paddingOnly(left: 50, right: 50)
          ],
        ));
  }
}
