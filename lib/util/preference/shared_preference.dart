import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _keyLocale = "locale";

  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async {
    _instance = await SharedPreferences.getInstance();

    return _instance;
  }

  static Future<bool> setKeyString(String key, String value) async =>
      _instance.setString(key, value);
  static String getKeyString(String key, {String defaultValue = ""}) =>
      _instance.getString(key) ?? defaultValue;

  static Future<bool> setLocale(String locale) async =>
      SharedPref.setKeyString(_keyLocale, locale);
  static String? getLocale() =>
      SharedPref.getKeyString(_keyLocale, defaultValue: "en");
}
