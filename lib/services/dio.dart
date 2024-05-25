import 'package:dio/dio.dart';
import 'package:library_app/core/constants.dart';
import 'package:library_app/models/book_model.dart';

class ApiService {
  Dio _dio = Dio();
  Future<List<BookModel>?> getBooks() async {
// print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    try {
    final response = await _dio.get(
    AppConstants.mainUrl + AppConstants.getBooksEndpoint,
    );
    final List<BookModel> books = (response.data as List).map((e) => BookModel.fromJson(e)).toList();
    print(books[0].name);
    return books;
    } catch (e) {
      return null;
    }
  }

  Future<String?> register(String userName, String password) async {}
  Future<String?> login(String userName, String password) async {}
}
