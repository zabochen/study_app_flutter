import 'package:shared_preferences/shared_preferences.dart';

const KEY_COUNT = "key_count";

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();

  PreferencesService._internal();

  factory PreferencesService() => _instance;

  Future<int> getCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(KEY_COUNT);
  }

  void setCount(int count) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setInt(KEY_COUNT, count);
  }
}
