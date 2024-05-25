import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/services/dio.dart';

class HomeProvider extends ChangeNotifier {
  final _apiService = ApiService();

  bool isLoading = true;
  List<BookModel> books = [];

  Future<void> getBooks() async {
    // List<BookModel>? result = await _apiService.getBooks();
    // books = result ?? [];
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) {
         books = [
        BookModel(
          id: 1,
          name: 'The books name is felan',
          genre: 'science finction',
          price: 20000,
          takenBy: 'Soroush Beigi',
        ),
        BookModel(
          id: 2,
          name: 'The second books name is felan',
          genre: 'science bla bla',
          price: 150000,
          takenBy: 'Mohammad Beigi',
        ),
      ];
      },
    );
   
    isLoading = false;
    notifyListeners();
  }
}
