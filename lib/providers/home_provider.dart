import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/employee_model.dart';
import 'package:library_app/models/member_model.dart';
import 'package:library_app/models/publisher_model.dart';
import 'package:library_app/pages/home_page/widgets/dialogs/book_dialog.dart';
import 'package:library_app/pages/home_page/widgets/dialogs/employee_dialog.dart';
import 'package:library_app/pages/home_page/widgets/dialogs/member_dialog.dart';
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

  void reload() {
    print('Reloaded');
    onTabChanged(selectedTab);
  }

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
        final bool isDone = await showDialog(
          context: context,
          builder: (context) => BookDialog(
            onPressed: addBook,
            isEditing: false,
            publishers: publishers,
          ),
        );
        if (isDone) reload();
      case 1:
         final bool isDone = await showDialog(
          context: context,
          builder: (context) => MemberDialog(
            onPressed: addMember,
            isEditing: false,
          ),
        );
        if (isDone) reload();
      case 2:
        final bool isDone = await showDialog(
          context: context,
          builder: (context) => PublisherDialog(
            onPressed: addPublisher,
            isEditing: false,
          ),
        );
        if (isDone) reload();
      case 3:
        final bool isDone = await showDialog(
          context: context,
          builder: (context) => EmployeeDialog(
            onPressed: addEmployee,
            isEditing: false,
          ),
        );
        if (isDone) reload();
    }
  }

  Future<void> editItem(BuildContext context, dynamic model) async {
    switch (selectedTab) {
      case 0:
        final bool isDone = await showDialog(
          context: context,
          builder: (context) => BookDialog(
            onPressed: editBook,
            isEditing: true,
            bookModel: model,
            publishers: publishers,
          ),
        );
        if (isDone) reload();
      case 1:
      final bool isDone = await showDialog(
          context: context,
          builder: (context) => MemberDialog(
            onPressed: editMember,
            memberModel: model,
            isEditing: true,
          ),
        );
        if (isDone) reload();
      case 2:
        final bool isDone = await showDialog(
          context: context,
          builder: (context) => PublisherDialog(
            onPressed: editPublisher,
            publisherModel: model,
            isEditing: true,
          ),
        );
        if (isDone) reload();
      case 3:
        final bool isDone = await showDialog(
          context: context,
          builder: (context) => EmployeeDialog(
            onPressed: editEmployee,
            employeeModel: model,
            isEditing: true,
          ),
        );
        if (isDone) reload();
    }
  }

  Future<void> deleteItem(BuildContext context, dynamic model) async {
    switch (selectedTab) {
      case 0:
        final bool isDone = await _apiService.deleteBook(model);
        if (isDone) reload();
      case 1:
      case 2:
        final bool isDone = await _apiService.deletePublisher(model);
        if (isDone) reload();
      case 3:
        final bool isDone = await _apiService.deleteEmployee(model);
        if (isDone) reload();
    }
  }

  addBook(BookModel? model) {
    if (model != null) {
      _apiService.addBook(model);
    }
  }

  editBook(BookModel? model) {
    if (model != null) {
      _apiService.editBook(model);
    }
  }

  addMember(MemberModel? model) {
    if (model != null) {
      _apiService.addMember(model);
    }
  }

  editMember(MemberModel? model) {
    if (model != null) {
      _apiService.editModel(model);
    }
  }

  addPublisher(PublisherModel? model) {
    if (model != null) {
      _apiService.addPublisher(model);
    }
  }

  editPublisher(PublisherModel? model) {
    if (model != null) {
      _apiService.editPublisher(model);
    }
  }

  addEmployee(EmployeeModel? model) {
    if (model != null) {
      _apiService.addEmployee(model);
    }
  }

  editEmployee(EmployeeModel? model) {
    if (model != null) {
      _apiService.editEmployee(model);
    }
  }
}
