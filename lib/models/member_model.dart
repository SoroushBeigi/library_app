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
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["firstName"] is String) {
      firstName = json["firstName"];
    }
    if(json["lastName"] is String) {
      lastName = json["lastName"];
    }
    if(json["dateJoined"] is String) {
      dateJoined = json["dateJoined"];
    }
    if(json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
  }
}
