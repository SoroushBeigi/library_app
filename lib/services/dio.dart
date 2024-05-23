import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 20)));
  Future<String?> login(String userName, String password) async {

  }
  Future<String?> register(String userName, String password) async {}
}
