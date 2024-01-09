import 'model.dart';

class Setting extends Model {
  String? language;

  // Theme
  String? defaultTheme;
  String? mainColor;
  String? mainDarkColor;
  String? secondColor;
  String? secondDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldDarkColor;
  String? scaffoldColor;

  Setting({
    this.language,

    this.mainColor,
    this.mainDarkColor,
    this.secondColor,
    this.secondDarkColor,
    this.accentColor,
    this.accentDarkColor,
    this.scaffoldDarkColor,
    this.scaffoldColor,
  });

  Setting.fromJson(Map<String, dynamic>? json) {
    language = json?['language'];

    defaultTheme = json?['default_theme'];
    mainColor = json?['main_color'] ;
    mainDarkColor = json?['main_dark_color'];
    secondColor = json?['second_color'];
    secondDarkColor = json?['second_dark_color'];
    accentColor = json?['accent_color'];
    accentDarkColor = json?['accent_dark_color'];
    scaffoldDarkColor = json?['scaffold_dark_color'];
    scaffoldColor = json?['scaffold_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['language'] = this.language;

    data['main_color'] = this.mainColor;
    data['default_theme'] = this.defaultTheme;
    data['main_dark_color'] = this.mainDarkColor;
    data['second_color'] = this.secondColor;
    data['second_dark_color'] = this.secondDarkColor;
    data['accent_color'] = this.accentColor;
    data['accent_dark_color'] = this.accentDarkColor;
    data['scaffold_dark_color'] = this.scaffoldDarkColor;
    data['scaffold_color'] = this.scaffoldColor;
    return data;
  }
}
