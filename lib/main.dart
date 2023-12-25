import 'package:demo/profile_screen.dart';
import 'package:demo/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

void main() {
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
      home: const HomeScreen(),
      getPages: [
        GetPage(name: Routes.HOME, page: () => const HomeScreen()),
        GetPage(name: Routes.PROFILE, page: () => const ProfileScreen(), transition: Transition.downToUp),
      ],
    );
  }
}
