import 'package:demo/config/routes.dart';
import 'package:demo/providers/backend01_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'services/auth_service.dart';
import 'services/global_service.dart';
import 'services/setting_service.dart';
import 'services/translate_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
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
      getPages: Routes.config,
      locale: Get.find<TranslationService>().getLocale(),
    );
  }
}

Future<void> initServices() async {
  Get.log('starting services ...');
  await dotenv.load(fileName: "lib/.env");
  await GetStorage.init();
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => Backend01Provider().init());
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => TranslationService().init());
  Get.log('All services started...');
}
