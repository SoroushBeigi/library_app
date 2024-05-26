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
  
  int selectedTab=0;

  void onTabChanged(int index){
    isLoading=true;
    notifyListeners();
    switch(index){
      case 0:
      getBooks();
      case 1:
      getMembers();
      case 2:
      getPublishers();
      case 3:
      getEmployees();
    }
  }

  Future<void> getBooks() async {
    books =  await _apiService.getBooks() ?? [];
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMembers() async {
    // List<BookModel>? result = await _apiService.getBooks();
    // books = result ?? [];
     members =  await _apiService.getMembers() ?? [];
    // await Future.delayed(const Duration(seconds: 2)).then(
    //   (value) {
    //      members = [
    //     MemberModel(
    //       id: 1,
    //       firstName: 'Soroush',
    //       lastName: 'Masoum Beigi',
    //       address: 'Address Address  Address Address AddressAddress Address',
    //       dateJoined: '2024-01-01',
    //       email: 'sbeygi712@gmail.com',
    //       phoneNumber: '09101013254'
    //     ),
    //      MemberModel(
    //       id: 2,
    //       firstName: 'Soroush',
    //       lastName: 'Masoum Beigi',
    //       address: 'Address Address Address',
    //       dateJoined: '2024-01-01',
    //       email: 'sbeygi712@gmail.com',
    //       phoneNumber: '09101013254'
    //     ),
    //   ];
    //   },
    // );
   
    isLoading = false;
    notifyListeners();
  }

  Future<void> getPublishers() async {
    // List<BookModel>? result = await _apiService.getBooks();
    // books = result ?? [];
     publishers =  await _apiService.getPublishers() ?? [];
    // await Future.delayed(const Duration(seconds: 2)).then(
    //   (value) {
    //      publishers = [
    //     PublisherModel(
    //       id: 1,
    //       name: 'The publisher name ',
    //      address: 'Address felan felan Address felan felan '
    //     ),
    //      PublisherModel(
    //       id: 2,
    //       name: 'The 2nd publisher with a bit longer name',
    //      address: 'Address felan felan Address felan felan longer address longer address '
    //     ),
    //   ];
    //   },
    // );
   
    isLoading = false;
    notifyListeners();
  }

  Future<void> getEmployees() async {
    // List<BookModel>? result = await _apiService.getBooks();
    // books = result ?? [];
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) {
         employees = [
        EmployeeModel(
          id: 1,
          firstName: 'Soroush',
          lastName: 'Beigi',
          dateJoined: '2024-01-01',
          position: 'Worker',
          salary: 2000.5,
        ),
         EmployeeModel(
          id: 2,
          firstName: 'Ali',
          lastName: 'Jafari',
          dateJoined: '2020-01-01',
          position: 'Worker',
          salary: 3500,
        )
      ];
      },
    );
   
    isLoading = false;
    notifyListeners();
  }
  
 
}
