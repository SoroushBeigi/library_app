import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _sharedPrefs;

  factory StorageService() => StorageService._internal();

  StorageService._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String? get token => _sharedPrefs!.getString('token') ?? '';
  String get userName => _sharedPrefs!.getString('user') ?? '';
  bool get loggedIn => _sharedPrefs!.getBool('loggedIn') ?? false;

  setToken(String value) {
    _sharedPrefs!.setString('token', value);
  }

  setLoggedIn(){
    _sharedPrefs!.setBool('loggedIn', true);
  }

}

final storage = StorageService();