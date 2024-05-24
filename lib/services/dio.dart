import 'package:http/http.dart' as http;
import 'package:library_app/core/constants.dart';
import 'package:library_app/models/book_model.dart';

class ApiService {
  Future<List<BookModel>?> getBooks() async {
    print('reached');
    var response = await http.get(
        Uri.parse(
          'https://library-backend.darkube.app/books',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': AppConstants.domain,
          'Access-Control-Allow-Methods': 'GET,POST,PUT,DELETE,OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        });
// print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    // try {
    // final response = await _dio.get(
    // 'https://library-backend.darkube.app/books'
    // // AppConstants.mainUrl + AppConstants.getBooksEndpoint,
    // );
    // final List<BookModel> books = (response.data as List).map((e) => BookModel.fromJson(e)).toList();
    print('books[0].name');
    // print(books[0].name);
    // return books;
    // } catch (e) {
    //   return null;
    // }
  }

  Future<String?> register(String userName, String password) async {}
  Future<String?> login(String userName, String password) async {}
}
