class MemberModel {
  int? id;
  String? firstName;
  String? lastName;
  String? address;
  String? dateJoined;
  String? phoneNumber;
  String? email;

  MemberModel({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.dateJoined,
    this.phoneNumber,
    this.email,
  });

    MemberModel.fromJson(Map<String, dynamic> json) {
    if(json["Id"] is int) {
      id = json["Id"];
    }
    if(json["Address"] is String) {
      address = json["Address"];
    }
    if(json["FirstName"] is String) {
      firstName = json["FirstName"];
    }
    if(json["LastName"] is String) {
      lastName = json["LastName"];
    }
    if(json["DateJoined"] is String) {
      dateJoined = json["DateJoined"];
    }
    if(json["Phone"] is String) {
      phoneNumber = json["Phone"];
    }
    if(json["Email"] is String) {
      email = json["Email"];
    }
  }
}
