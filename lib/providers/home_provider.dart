import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/employee_model.dart';
import 'package:library_app/models/member_model.dart';
import 'package:library_app/models/publisher_model.dart';
import 'package:library_app/pages/home_page/widgets/dialogs/book_dialog.dart';
import 'package:library_app/pages/home_page/widgets/dialogs/publisher_dialog.dart';
import 'package:library_app/services/dio.dart';

class HomeProvider extends ChangeNotifier {
  final _apiService = ApiService();

  bool isLoading = true;
  List<BookModel> books = [];
  List<MemberModel> members = [];
  List<PublisherModel> publishers = [];
  List<EmployeeModel> employees = [];

  int selectedTab = 0;

  void onTabChanged(int index) {
    isLoading = true;
    notifyListeners();
    switch (index) {
      case 0:
        selectedTab = 0;
        getBooks();
      case 1:
        getMembers();
        selectedTab = 1;
      case 2:
        getPublishers();
        selectedTab = 2;
      case 3:
        getEmployees();
        selectedTab = 3;
    }
  }

  Future<void> getBooks() async {
    books = await _apiService.getBooks() ?? [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMembers() async {
    members = await _apiService.getMembers() ?? [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> getPublishers() async {
    publishers = await _apiService.getPublishers() ?? [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> getEmployees() async {
    employees = await _apiService.getEmployees() ?? [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> addItem(BuildContext context) async {
    switch (selectedTab) {
      case 0:
        showDialog(
          context: context,
          builder: (context) => BookDialog(
            onPressed: addBook,
            isEditing: false,
            publishers: publishers,
          ),
        );
      case 1:
     
      case 2:
      showDialog(
          context: context,
          builder: (context) => PublisherDialog(
            onPressed: addPublisher,
            isEditing: false,
          ),
        );
      case 3:
    }
  }

  Future<void> editItem(BuildContext context, BookModel model) async {
    switch (selectedTab) {
      case 0:
        showDialog(
          context: context,
          builder: (context) => BookDialog(
            onPressed: editBook,
            isEditing: true,
            bookModel: model,
            publishers: publishers,
          ),
        );
      case 1:
      case 2:
      showDialog(
          context: context,
          builder: (context) => PublisherDialog(
            onPressed: editPublisher,
            isEditing: true,
          ),
        );
      case 3:
    }
  }


  addBook(BookModel? model) {
    if(model!=null){
      _apiService.addBook(model);
    }
  }

  editBook(BookModel? model) {
    if(model!=null){
      _apiService.editBook(model);
    }
  }

  addPublisher(PublisherModel? model) {
    if(model!=null){
      _apiService.addPublisher(model);
    }
  }

  editPublisher(PublisherModel? model) {
    if(model!=null){
      _apiService.editPublisher(model);
    }
  }
}
