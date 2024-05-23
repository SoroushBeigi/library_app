import 'package:flutter/material.dart';
import 'package:library_app/services/dio.dart';

class LoginProvider extends ChangeNotifier {
  final _apiProvider = ApiProvider();
  Future<String?> login(String userName, String password) =>
      _apiProvider.login(userName, password);
  Future<String?> register(String userName, String password) =>
      _apiProvider.register(userName, password);
  
}