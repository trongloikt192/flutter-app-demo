import 'package:demo/modules/home/bindings/home_binding.dart';
import 'package:demo/modules/profile/bindings/profile_binding.dart';
import 'package:demo/modules/profile/views/profile_screen.dart';
import 'package:demo/config/routes.dart';
import 'package:demo/modules/setting/bindings/setting_binding.dart';
import 'package:demo/modules/setting/views/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/home/views/home_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: [
        GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(name: Routes.PROFILE, page: () => ProfileScreen(), binding: ProfileBinding(), transition: Transition.downToUp),
        GetPage(name: Routes.SETTING, page: () => SettingScreen(), binding: SettingBinding()),
      ],
    );
  }
}
