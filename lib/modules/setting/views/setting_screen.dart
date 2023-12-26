import 'package:demo/modules/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Setting Screen",
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
            TextField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              onChanged: (String? value) {
                controller.onNameChanged(value);
              },
            ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
          ],
        )
    );
  }
}