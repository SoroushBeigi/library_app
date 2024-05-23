class BookModel {
  int? id;
  double? price;
  String? name;
  String? genre;
  String? takenBy;

  BookModel({
    this.id,
    this.price,
    this.name,
    this.genre,
    this.takenBy,
  });

    BookModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["price"] is double) {
      price = json["price"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["genre"] is String) {
      genre = json["genre"];
    }
    if(json["takenBy"] is String) {
      takenBy = json["takenBy"];
    }
  }
}
