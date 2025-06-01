import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;

  StorageService._(this._pref);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService._(prefs);
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }
}
/*
with return this
Person()
  .setName('Alice')
  .setAge(30)
  .showInfo();
without return this
  Person person = Person();
person.setName('Alice');
person.setAge(30);
person.showInfo();


*/