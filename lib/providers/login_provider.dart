import 'package:flutter/material.dart';
import 'package:library_app/services/prefs.dart';

class LoginProvider extends ChangeNotifier {
  final _storageService = StorageService();

  Future<String?> login(String userName, String password) => _storageService.login(userName, password);

  Future<String?> register(String userName, String password) => _storageService.register(userName, password);
}
