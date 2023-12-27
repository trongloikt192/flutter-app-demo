import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/setting_model.dart';
import '../repositories/setting_repository.dart';

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
    String _locale = _box.read<String>('language') ?? '';
    if (_locale.isEmpty) {
      _locale = setting.value.language ?? 'en';
    }
    return _locale;
  }

}
