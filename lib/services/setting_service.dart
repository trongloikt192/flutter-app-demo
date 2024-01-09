import 'package:demo/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/setting_model.dart';
import '../repositories/setting_repository.dart';
import '../utils/ui.dart';

class SettingsService extends GetxService {
  final setting = Setting().obs;
  late GetStorage _box;

  late SettingRepository _settingsRepo;

  SettingsService() {
    _settingsRepo = new SettingRepository();
    _box = new GetStorage();
  }

  Future<SettingsService> init() async {
    setting.value = await _settingsRepo.get();
    return this;
  }

  String _getLocale() {
    String locale = _box.read<String>('language') ?? '';
    if (locale.isEmpty) {
      locale = setting.value.language ?? 'en';
    }
    return locale;
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        dividerColor: Ui.parseColor(setting.value.accentColor, opacity: 0.1),
        focusColor: Ui.parseColor(setting.value.accentColor),
        hintColor: Ui.parseColor(setting.value.secondColor),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Ui.parseColor(setting.value.mainColor)),
        ),
        colorScheme: ColorScheme.light(
          primary: Ui.parseColor(setting.value.mainColor),
          secondary: Ui.parseColor(setting.value.mainColor),
        ),
        textTheme: GoogleFonts.getTextTheme(
          _getLocale().startsWith('ar') ? 'Cairo' : 'Poppins',
          TextTheme(
            titleLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainColor), height: 1.3),
            headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondColor), height: 1.3),
            headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondColor), height: 1.3),
            displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondColor), height: 1.3),
            displayMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainColor), height: 1.4),
            displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.secondColor), height: 1.4),
            titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondColor), height: 1.2),
            titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.mainColor), height: 1.2),
            bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondColor), height: 1.2),
            bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondColor), height: 1.2),
            bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.accentColor), height: 1.2),
          ),
        )
    );
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: const Color(0xFF252525),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: const Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        dividerColor: Ui.parseColor(setting.value.accentDarkColor, opacity: 0.1),
        focusColor: Ui.parseColor(setting.value.accentDarkColor),
        hintColor: Ui.parseColor(setting.value.secondDarkColor),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Ui.parseColor(setting.value.mainColor)),
        ),
        colorScheme: ColorScheme.dark(
          primary: Ui.parseColor(setting.value.mainDarkColor),
          secondary: Ui.parseColor(setting.value.mainDarkColor),
        ),
        textTheme: GoogleFonts.getTextTheme(
            _getLocale().startsWith('ar') ? 'Cairo' : 'Poppins',
            TextTheme(
              titleLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainDarkColor), height: 1.3),
              headlineSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.3),
              headlineMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.3),
              displaySmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.3),
              displayMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainDarkColor), height: 1.4),
              displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.4),
              titleSmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.2),
              titleMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.mainDarkColor), height: 1.2),
              bodyMedium: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.2),
              bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.2),
              bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.accentDarkColor), height: 1.2),
            )
        )
    );
  }

  ThemeMode getThemeMode() {
    String? themeMode = GetStorage().read<String>(Constants.BOX_SETTING_THEME_MODE);
    switch (themeMode) {
      case Constants.THEME_MODE_LIGHT:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case Constants.THEME_MODE_DARK:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case Constants.THEME_MODE_SYSTEM:
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == "dark") {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }

}
