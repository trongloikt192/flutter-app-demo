import 'package:get/get.dart';

import '../models/user_model.dart';
import '../providers/backend01_provider.dart';

class UserRepository {
  late Backend01Provider _backend01Provider;

  Future<User> login(User user) {
    _backend01Provider = Get.find<Backend01Provider>();
    return _backend01Provider.login(user);
  }

  Future<User> register(User user) {
    _backend01Provider = Get.find<Backend01Provider>();
    return _backend01Provider.register(user);
  }

  Future signOut() async {}
}
