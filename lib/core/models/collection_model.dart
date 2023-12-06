
class CollectionModel {
  int id;
  String title;
  String description;
  int count;
  String imgURL;

  CollectionModel({
    required this.id, required this.title, 
    required this.description, required this.count, 
    required this.imgURL
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      id: int.parse(json["collection_id"].toString()),
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      count: int.parse(json["res_count"].toString()),
      imgURL: json["image_url"] ?? ""
    );
  }
}