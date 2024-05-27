import 'package:dio/dio.dart';
import 'package:library_app/core/constants.dart';
import 'package:library_app/models/book_model.dart';
import 'package:library_app/models/employee_model.dart';
import 'package:library_app/models/member_model.dart';
import 'package:library_app/models/publisher_model.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<List<BookModel>?> getBooks() async {
    //'https://cors-anywhere.herokuapp.com/'
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

  Future<void> addBook(BookModel model) async {
    final response =
        await _dio.post(AppConstants.mainUrl + AppConstants.booksEndpoint + '/',
            data: {
              'Name': model.name,
              'Genre': model.genre,
              'Price': model.price,
              'PublisherId': model.publisherId,
            },
            options: Options(headers: {'Content-Type': 'application/json'}));
  }

  Future<void> editBook(BookModel model) async {
    final response = await _dio
        .put(AppConstants.mainUrl + AppConstants.booksEndpoint, data: {
      'Name': model.name,
      'Genre': model.genre,
      'Price': model.price,
    });
  }

  Future<bool> deleteBook(BookModel model) async {
    final response = await _dio.delete(
        AppConstants.mainUrl + AppConstants.booksEndpoint + '/${model.id}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
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

  Future<void> addPublisher(PublisherModel model) async {
    final response = await _dio.post(
        AppConstants.mainUrl + AppConstants.publishersEndpoint + '/',
        data: {
          'Name': model.name,
          'Address': model.address,
        },
        options: Options(headers: {"Content-Type": "application/json"}));
    print(response.data);
  }

  Future<void> editPublisher(PublisherModel model) async {
    final response = await _dio.put(
        '${AppConstants.mainUrl}${AppConstants.publishersEndpoint}/${model.id}',
        data: {
          'Name': model.name,
          'Address': model.address,
        });
  }

   Future<bool> deletePublisher(PublisherModel model) async {
    final response = await _dio.delete(
        AppConstants.mainUrl + AppConstants.publishersEndpoint + '/${model.id}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
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

  Future<void> addEmployee(EmployeeModel model) async {
    final response =
        await _dio.post(AppConstants.mainUrl + AppConstants.employeesEndpoint + '/',
            data: {
              'FirstName': model.firstName,
              'LastName': model.lastName,
              'DateJoined': model.dateJoined,
              'Salary': model.salary,
              'Position':model.position,
            },
            options: Options(headers: {'Content-Type': 'application/json'}));
  }

    Future<void> editEmpoyee(EmployeeModel model) async {
    final response = await _dio.put(
        '${AppConstants.mainUrl}${AppConstants.employeesEndpoint}/${model.id}',
        data: {
              'FirstName': model.firstName,
              'LastName': model.lastName,
              'DateJoined': model.dateJoined,
              'Salary': model.salary,
              'Position':model.position,
        });
  }

  Future<bool> deleteEmployee(EmployeeModel model) async {
    final response = await _dio.delete(
        AppConstants.mainUrl + AppConstants.employeesEndpoint + '/${model.id}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> register(String userName, String password) async {}
  Future<String?> login(String userName, String password) async {}
}
