import 'package:flutter/material.dart';
import 'package:library_app/services/dio.dart';
import 'package:library_app/services/prefs.dart';

class LoginProvider extends ChangeNotifier {
  final _apiService = ApiService();
  final _storageService = StorageService();
  Future<String?> login(String userName, String password)async {
    String? result = await _apiService.login(userName, password);
    _storageService.setLoggedIn();
    return result;
  }

  Future<String?> register(String userName, String password) => _apiService.register(userName, password);
}
