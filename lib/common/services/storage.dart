import 'package:learner/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;

  StorageService._(this._pref);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService._(prefs);
  }

  //for welcome route
  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(Appconstants.STORAGE_DEVICE_OPEN_FIRST_KEY) ?? false;
  }

  //for sign in route
  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool isLoggedIn() {
    return _pref.getString(Appconstants.STORAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }
}
