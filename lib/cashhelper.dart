import 'package:shared_preferences/shared_preferences.dart';

class CasHelper {
  static SharedPreferences? sharedPreferences;

  static inital() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putSharedpreferance(
      {required key, required bool value}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getsharedpref(String key) {
    return sharedPreferences!.getBool(key);
  }
}
