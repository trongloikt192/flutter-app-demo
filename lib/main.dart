import 'package:demo/middlewares/auth_middleware.dart';
import 'package:demo/middlewares/guest_middleware.dart';
import 'package:demo/modules/auth/bindings/auth_binding.dart';
import 'package:demo/modules/auth/views/login_screen.dart';
import 'package:demo/modules/auth/views/register_screen.dart';
import 'package:demo/modules/home/bindings/home_binding.dart';
import 'package:demo/modules/profile/bindings/profile_binding.dart';
import 'package:demo/modules/profile/views/profile_screen.dart';
import 'package:demo/config/routes.dart';
import 'package:demo/modules/setting/bindings/setting_binding.dart';
import 'package:demo/modules/setting/views/setting_screen.dart';
import 'package:demo/providers/backend01_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/home/views/home_screen.dart';
import 'services/auth_service.dart';
import 'services/global_service.dart';

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
      getPages: [
        GetPage(name: Routes.LOGIN, page: () => LoginScreen(), binding: AuthBinding(), middlewares: [GuestMiddleware()]),
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen(), binding: AuthBinding(), middlewares: [GuestMiddleware()]),

        GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding(), middlewares: [AuthMiddleware()]),
        GetPage(name: Routes.PROFILE, page: () => ProfileScreen(), binding: ProfileBinding(), transition: Transition.downToUp),
        GetPage(name: Routes.SETTING, page: () => SettingScreen(), binding: SettingBinding()),
      ],
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
  // await Get.putAsync(() => TranslationService().init());
  Get.log('All services started...');
}
