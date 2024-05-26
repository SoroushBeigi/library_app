class EmployeeModel {
  int? id;
  String? dateJoined;
  String? firstName;
  String? lastName;
  String? position;
  double? salary;

  EmployeeModel({
    this.id,
    this.dateJoined,
    this.firstName,
    this.lastName,
    this.position,
    this.salary,
  });

    EmployeeModel.fromJson(Map<String, dynamic> json) {
    if(json["Id"] is int) {
      id = json["Id"];
    }
    if(json["DateJoined"] is String) {
      dateJoined = json["DateJoined"];
    }
    if(json["FirstName"] is String) {
      firstName = json["FirstName"];
    }
    if(json["LastName"] is String) {
      lastName = json["LastName"];
    }
    if(json["Position"] is String) {
      position = json["Position"];
    }
    if(json["Salary"] is double) {
      salary = json["Salary"];
    }
  }
}
