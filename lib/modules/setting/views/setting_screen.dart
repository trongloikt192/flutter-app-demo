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
            Obx(() {
              return TextFormField(
                controller: TextEditingController()..text = controller.name.value,
                onFieldSubmitted: (String? value) {
                  controller.onFieldSubmitted(value);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
              ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20);
            }),
            MaterialButton(
              onPressed: () => {
                controller.onGenerateRandom(),
              },
              color: const Color(0xFFFFB700),
              child: const Text('Generate random'),
            ).paddingOnly(left: 50, right: 50),
            MaterialButton(
              onPressed: () => {
                controller.onSaveToStorage(),
              },
              color: const Color(0xFFFFB700),
              child: const Text('Save to storage'),
            ).paddingOnly(left: 50, right: 50),
            MaterialButton(
              onPressed: () => {
                controller.onLoadFromStorage(),
              },
              color: const Color(0xFFFFB700),
              child: const Text('Load data from storage'),
            ).paddingOnly(left: 50, right: 50)
          ],
        )
    );
  }
}