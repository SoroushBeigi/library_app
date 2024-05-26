class PublisherModel {
  int? id;
  String? address;
  String? name;

  PublisherModel({
    this.id,
    this.address,
    this.name,
  });

  PublisherModel.fromJson(Map<String, dynamic> json) {
    if (json["Id"] is int) {
      id = json["Id"];
    }
    if (json["Address"] is String) {
      address = json["Address"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
  }
}
