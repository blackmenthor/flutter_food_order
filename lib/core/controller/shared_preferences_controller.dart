import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKeys {
  onBoardingShown,
}

class SharedPreferencesController {

  Future<SharedPreferences> get sharedPrefs =>
    SharedPreferences.getInstance();

  Future<String?> getString(SharedPreferencesKeys key) async {
    final instance = await sharedPrefs;
    final val = instance.getString(key.toString());
    return val;
  }

  Future<void> setString(SharedPreferencesKeys key, String value) async {
    final instance = await sharedPrefs;
    instance.setString(key.toString(), value);
    return;
  }

  Future<int?> getInt(SharedPreferencesKeys key) async {
    final instance = await sharedPrefs;
    final val = instance.getInt(key.toString());
    return val;
  }

  Future<void> setInt(SharedPreferencesKeys key, int value) async {
    final instance = await sharedPrefs;
    instance.setInt(key.toString(), value);
    return;
  }

  Future<bool> getBool(SharedPreferencesKeys key) async {
    final instance = await sharedPrefs;
    final val = instance.getBool(key.toString());
    if (val == null) {
      return false;
    }
    return val;
  }

  Future<void> setBool(SharedPreferencesKeys key, bool value) async {
    final instance = await sharedPrefs;
    instance.setBool(key.toString(), value);
    return;
  }

  Future<double?> getDouble(SharedPreferencesKeys key) async {
    final instance = await sharedPrefs;
    final val = instance.getDouble(key.toString());
    return val;
  }

  Future<void> setDouble(SharedPreferencesKeys key, double value) async {
    final instance = await sharedPrefs;
    instance.setDouble(key.toString(), value);
    return;
  }

}