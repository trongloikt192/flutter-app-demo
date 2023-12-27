import 'model.dart';

class Setting extends Model {
  String? language;

  Setting({
    this.language
  });

  Setting.fromJson(Map<String, dynamic>? json) {
    language = json?['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['language'] = this.language;
    return data;
  }
}
