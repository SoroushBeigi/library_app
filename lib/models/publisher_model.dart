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
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
  }
}
