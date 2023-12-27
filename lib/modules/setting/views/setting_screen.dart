import 'package:demo/modules/setting/controllers/setting_controller.dart';
import 'package:demo/services/translate_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Setting Screen".tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFFFB700),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${"Language".tr}: ${Get.find<TranslationService>().getLocale().toString().tr}",
                style: Theme.of(context).textTheme.titleMedium
            ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: MaterialButton(
                  onPressed: () => {
                    controller.onChangeLanguage('en'),
                  },
                  color: const Color(0xFFFFB700),
                  child: Text('English'.tr),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: MaterialButton(
                  onPressed: () => {
                    controller.onChangeLanguage('vi'),
                  },
                  color: const Color(0xFFFFB700),
                  child: Text('Vietnamese'.tr),
                ))
              ]
            ).paddingOnly(left: 50, right: 50),
            MaterialButton(
              onPressed: () => {
                Get.back(),
              },
              color: const Color(0xFFFFB700),
              child: Text('Back to home screen'.tr),
            ).paddingOnly(left: 50, right: 50)
          ],
        ));
  }
}
