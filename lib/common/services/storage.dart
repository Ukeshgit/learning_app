import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
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