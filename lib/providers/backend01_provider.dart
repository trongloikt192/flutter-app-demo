import 'dart:convert';

import 'package:demo/models/user_model.dart';
import 'package:demo/services/auth_service.dart';
import 'package:get/get.dart';

import 'api_provider.dart';

class Backend01Provider extends GetxService with ApiClient {
  Backend01Provider() {
    this.baseUrl = this.globalService.baseUrl ?? '';
    this.accessToken = Get.find<AuthService>().accessToken;
  }

  Future<Backend01Provider> init() async {
    super.init();
    return this;
  }

  Future<User> getUser(User user) async {
    if (!authService.isAuth) {
      throw new Exception("You don't have the permission to access to this area!".tr + "[ getUser() ]");
    }
    Uri _uri = getApiBaseUri("auth/me");
    Get.log(_uri.toString());
    var response = await httpClient.getUri(
      _uri,
      options: optionsNetwork,
    );
    if (response.data['success'] == true) {
      return User.fromJson(response.data['data']);
    } else {
      throw new Exception(response.data['message']);
    }
  }

  Future<User> login(User user) async {
    Uri _uri = getApiBaseUri("auth/login");
    Get.log(_uri.toString());
    var response = await httpClient.postUri(
      _uri,
      data: json.encode(user.toJson()),
      options: optionsNetwork,
    );
    if (response.data['success'] == true) {
      response.data['data']['auth'] = true;
      return User.fromJson(response.data['data']);
    } else {
      throw new Exception(response.data['message']);
    }
  }

  Future<User> register(User user) async {
    Uri _uri = getApiBaseUri("auth/register");
    Get.log(_uri.toString());
    var response = await httpClient.postUri(
      _uri,
      data: json.encode(user.toJson()),
      options: optionsNetwork,
    );
    if (response.data['success'] == true) {
      response.data['data']['auth'] = true;
      return User.fromJson(response.data['data']);
    } else {
      throw new Exception(response.data['message']);
    }
  }

  Future<bool> logout() async {
    Uri _uri = getApiBaseUri("auth/logout");
    Get.log(_uri.toString());
    var response = await httpClient.postUri(
      _uri,
      options: optionsNetwork,
    );
    if (response.data['success'] == true) {
      return true;
    } else {
      throw new Exception(response.data['message']);
    }
  }
}
