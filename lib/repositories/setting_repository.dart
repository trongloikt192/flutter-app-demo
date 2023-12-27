import 'package:demo/providers/backend01_provider.dart';
import 'package:get/get.dart';

import '../models/setting_model.dart';

class SettingRepository {
  late Backend01Provider _backend01Provider;

  SettingRepository() {
    this._backend01Provider = Get.find<Backend01Provider>();
  }

  Future<Setting> get() {
    return _backend01Provider.getSettings();
  }

  Future<Map<String, String>> getTranslations(String locale) {
    return _backend01Provider.getTranslations(locale);
  }

  Future<List<String>> getSupportedLocales() {
    return _backend01Provider.getSupportedLocales();
  }
}
