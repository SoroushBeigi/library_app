class BookModel {
  int? id;
  int? publisherId;
  double? price;
  String? name;
  String? genre;
  String? takenBy;

  BookModel({
    this.id,
    this.publisherId,
    this.price,
    this.name,
    this.genre,
    this.takenBy,
  });

    BookModel.fromJson(Map<String, dynamic> json) {
    if(json["Id"] is int) {
      id = json["Id"];
    }
    if(json["Price"] is double) {
      price = json["Price"];
    }
    if(json["Name"] is String) {
      name = json["Name"];
    }
    if(json["Genre"] is String) {
      genre = json["Genre"];
    }
    if(json["takenBy"] is String) {
      takenBy = json["takenBy"];
    }
    if(json["PublisherId"] is int) {
      publisherId = json["PublisherId"];
    }
  }
}
