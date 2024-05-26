import 'package:flutter/material.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/employee_model.dart';
import 'package:library_app/models/member_model.dart';
import 'package:library_app/models/publisher_model.dart';
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

  Future<void> addItem() async {
    switch (selectedTab) {
      case 0:
       
      case 1:
       
      case 2:
       
      case 3:
       
    }
  }
}
