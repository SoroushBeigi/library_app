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
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["dateJoined"] is String) {
      dateJoined = json["dateJoined"];
    }
    if(json["firstName"] is String) {
      firstName = json["firstName"];
    }
    if(json["lastName"] is String) {
      lastName = json["lastName"];
    }
    if(json["position"] is String) {
      position = json["position"];
    }
    if(json["salary"] is double) {
      salary = json["salary"];
    }
  }
}
