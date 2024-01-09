import 'package:demo/modules/root/views/root_screen.dart';
import 'package:demo/modules/setting/controllers/setting_controller.dart';
import 'package:demo/services/setting_service.dart';
import 'package:demo/services/translate_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RootScreen(
        title: "Setting Screen",
        showDrawer: true,
        container: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${"Language".tr}: ${Get
                    .find<TranslationService>()
                    .getLocale()
                    .toString()
                    .tr}",
                    style: context.theme.textTheme.titleLarge
                ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: MaterialButton(
                            onPressed: () => {
                              controller.onChangeLanguage('en'),
                            },
                            color: context.theme.colorScheme.primary,
                            child: Text('English'.tr),
                          )
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: MaterialButton(
                            onPressed: () => {
                              controller.onChangeLanguage('vi'),
                            },
                            color: context.theme.colorScheme.primary,
                            child: Text('Vietnamese'.tr),
                          )
                      )
                    ]
                ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 20),

                Text("${"Theme".tr}: ${Get
                    .find<SettingsService>()
                    .getThemeMode()
                    .toString()
                    .tr}",
                    style: context.theme.textTheme.titleLarge
                ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: MaterialButton(
                            onPressed: () => {
                              controller.onChangeThemeMode(ThemeMode.light),
                            },
                            color: context.theme.colorScheme.primary,
                            child: Text('Light'.tr),
                          )
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: MaterialButton(
                            onPressed: () => {
                              controller.onChangeThemeMode(ThemeMode.dark),
                            },
                            color: context.theme.colorScheme.primary,
                            child: Text('Dark'.tr),
                          )
                      )
                    ]
                ).paddingOnly(left: 50, right: 50).marginOnly(bottom: 50),
                MaterialButton(
                  onPressed: () => {
                    controller.backToHome(),
                  },
                  color: context.theme.colorScheme.primary,
                  child: Text('Back to home screen'.tr),
                ).paddingOnly(left: 50, right: 50)
              ],
            )
        )
    );
  }
}
