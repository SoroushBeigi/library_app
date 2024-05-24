import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/services/dio.dart';

class HomeProvider extends ChangeNotifier {
  final _apiService = ApiService();

  bool isLoaing=true;
  List<BookModel> books=[];

  Future<void> getBooks() async {
    List<BookModel>? result = await _apiService.getBooks();
    books = result ?? [];
    isLoaing=false;
  }
}
