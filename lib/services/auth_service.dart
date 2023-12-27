import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../config/constants.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class AuthService extends GetxService {
  final user = User().obs;
  late GetStorage _box;
  late UserRepository _usersRepo;

  AuthService() {
    _usersRepo = new UserRepository();
    _box = new GetStorage();
  }

  Future<AuthService> init() async {
    user.listen((User _user) {
      _box.write(Constants.BOX_CURRENT_USER, _user.toJson());
    });
    await getCurrentUser();
    return this;
  }

  Future getCurrentUser() async {
    if (user.value.auth == null && _box.hasData(Constants.BOX_CURRENT_USER)) {
      user.value = User.fromJson(_box.read(Constants.BOX_CURRENT_USER));
      user.value.auth = true;
    } else {
      user.value.auth = false;
    }
  }

  Future removeCurrentUser() async {
    user.value = new User();
    await _usersRepo.signOut();
    await _box.remove(Constants.BOX_CURRENT_USER);
  }

  bool get isAuth => user.value.auth ?? false;

  String get apiToken => user.value.apiToken;
}
