import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static String KEY_REGISTER_TOKEN = "KEY_REGISTER_TOKEN";
  static String KEY_USER_EMAIL = "KEY_USER_EMAIL";
  static String KEY_USER_NAME = "KEY_USER_NAME";


  Future<String> get(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? value = prefs.getString(key);
    return value ?? "";
  }

  Future set(String value, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
    return true;
  }

  Future<void> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(KEY_REGISTER_TOKEN);
    prefs.remove(KEY_USER_EMAIL);
    prefs.remove(KEY_USER_NAME);
  }


}
