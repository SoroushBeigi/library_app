import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _sharedPrefs;

  factory StorageService() => StorageService._internal();

  StorageService._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get loggedIn => _sharedPrefs!.getBool('loggedIn') ?? false;

  setLoggedIn() {
    _sharedPrefs!.setBool('loggedIn', true);
  }

  Future<String?> register(String userName, String password) async {
     final foundPassword = _sharedPrefs!.getString(userName);
     if(foundPassword!=null){
      return 'Username already exists! try logging in.';
     }else{
      _sharedPrefs!.setString(userName, password);
      return '';
     }
  }
  
  Future<String?> login(String userName, String password) async {
    final foundPassword = _sharedPrefs!.getString(userName);
    if (foundPassword == null) {
      return 'Username not found!';
    } else if (foundPassword == password) {
      setLoggedIn();
      return null;
    } else {
      return 'Wrong password!';
    }
  }
}

final storage = StorageService();
