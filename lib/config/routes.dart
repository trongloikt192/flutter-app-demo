import 'package:get/get.dart' show GetPage, Transition;

import '../middlewares/auth_middleware.dart';
import '../middlewares/guest_middleware.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_screen.dart';
import '../modules/auth/views/register_screen.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_screen.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_screen.dart';

class Routes {
  static const LOGIN = '/login';
  static const REGISTER = '/register';



  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const SETTING = '/setting';


  static final config = [
    GetPage(name: LOGIN, page: () => LoginScreen(), binding: AuthBinding(), middlewares: [GuestMiddleware()]),
    GetPage(name: REGISTER, page: () => RegisterScreen(), binding: AuthBinding(), middlewares: [GuestMiddleware()]),

    GetPage(name: HOME, page: () => HomeScreen(), binding: HomeBinding(), middlewares: [AuthMiddleware()]),
    GetPage(name: PROFILE, page: () => ProfileScreen(), binding: ProfileBinding(), transition: Transition.downToUp),
    GetPage(name: SETTING, page: () => SettingScreen(), binding: SettingBinding()),
  ];
}