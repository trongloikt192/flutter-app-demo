import 'package:demo/models/model.dart';

class User extends Model {
  String? _name;
  String? _email;
  String? _password;
  String? _apiToken;
  String? _accessToken;
  String? _deviceToken;
  bool? _auth;

  User(
      {String? id,
      String? name,
      String? email,
      String? password,
      String? apiToken,
      String? accessToken,
      String? deviceToken,
      bool? auth}) {
    this.id = id;
    _auth = auth;
    _deviceToken = deviceToken;
    _apiToken = apiToken;
    _accessToken = accessToken;
    _password = password;
    _email = email;
    _name = name;
  }

  User.fromJson(Map<String, dynamic>? json) {
    _name = stringFromJson(json, 'name');
    _email = stringFromJson(json, 'email');
    _apiToken = stringFromJson(json, 'api_token');
    _accessToken = stringFromJson(json, 'access_token');
    _deviceToken = stringFromJson(json, 'device_token');
    _auth = boolFromJson(json, 'auth');
    super.fromJson(json);
  }

  String get apiToken {
    if ((_auth ?? false)) {
      return _apiToken ?? '';
    } else {
      return '';
    }
  }

  set apiToken(String? value) {
    _apiToken = value;
  }

  String get accessToken {
    if ((_auth ?? false)) {
      return _accessToken ?? '';
    } else {
      return '';
    }
  }

  set accessToken(String? value) {
    _accessToken = value;
  }

  bool? get auth => _auth;

  set auth(bool? value) {
    _auth = value;
  }

  String get deviceToken => _deviceToken ?? '';

  set deviceToken(String? value) {
    _deviceToken = value;
  }

  String get email => _email ?? '';

  set email(String? value) {
    _email = value;
  }

  @override
  int get hashCode =>
      super.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      apiToken.hashCode ^
      accessToken.hashCode ^
      deviceToken.hashCode ^
      auth.hashCode;

  String get name => _name ?? '';

  set name(String? value) {
    _name = value;
  }

  String get password => _password ?? '';

  set password(String? value) {
    _password = value;
  }

  @override
  bool operator ==(dynamic other) =>
      super == other &&
      other is User &&
      runtimeType == other.runtimeType &&
      name == other.name &&
      email == other.email &&
      password == other.password &&
      apiToken == other.apiToken &&
      accessToken == other.accessToken &&
      deviceToken == other.deviceToken &&
      auth == other.auth;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (_password != null && _password != '') {
      data['password'] = this.password;
    }
    data['api_token'] = this._apiToken;
    data['access_token'] = this._accessToken;
    if (_deviceToken != null) {
      data["device_token"] = deviceToken;
    }
    data['auth'] = this.auth;
    return data;
  }

  Map toRestrictMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["name"] = name;
    map["device_token"] = deviceToken;
    return map;
  }
}
