import 'package:dio/dio.dart';
import 'package:library_app/core/constants.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/employee_model.dart';
import 'package:library_app/models/member_model.dart';
import 'package:library_app/models/publisher_model.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<List<BookModel>?> getBooks() async {
    try {
      final response = await _dio.get(
        AppConstants.mainUrl + AppConstants.booksEndpoint,
      );
      final List<BookModel> books =
          (response.data as List).map((e) => BookModel.fromJson(e)).toList();
      return books;
    } catch (e) {
      return null;
    }
  }

  Future<List<MemberModel>?> getMembers() async {
    try {
      final response = await _dio.get(
        AppConstants.mainUrl + AppConstants.membersEndpoint,
      );
      final List<MemberModel> members =
          (response.data as List).map((e) => MemberModel.fromJson(e)).toList();
      return members;
    } catch (e) {
      return null;
    }
  }

  Future<List<EmployeeModel>?> getEmployees() async {
    try {
      final response = await _dio.get(
        AppConstants.mainUrl + AppConstants.employeesEndpoint,
      );
      final List<EmployeeModel> employees = (response.data as List)
          .map((e) => EmployeeModel.fromJson(e))
          .toList();
      return employees;
    } catch (e) {
      return null;
    }
  }

  Future<List<PublisherModel>?> getPublishers() async {
    try {
      final response = await _dio.get(
        AppConstants.mainUrl + AppConstants.publishersEndpoint,
      );
      final List<PublisherModel> publishers = (response.data as List)
          .map((e) => PublisherModel.fromJson(e))
          .toList();
      return publishers;
    } catch (e) {
      return null;
    }
  }

  Future<void> addBook(BookModel model) async {
    final response = await _dio
        .post(AppConstants.mainUrl + AppConstants.booksEndpoint, data: {
      'Name': model.name,
      'Genre': model.genre,
      'Price': model.price,
    });
  }
    Future<void> editBook(BookModel model) async {
    final response = await _dio
        .post(AppConstants.mainUrl + AppConstants.booksEndpoint, data: {
      'Name': model.name,
      'Genre': model.genre,
      'Price': model.price,
    });
  }

  Future<String?> register(String userName, String password) async {}
  Future<String?> login(String userName, String password) async {}
}
