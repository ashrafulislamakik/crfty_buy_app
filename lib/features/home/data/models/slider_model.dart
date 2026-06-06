class SliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String brand;
  final String category;

  SliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.brand,
    required this.category,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json["_id"]?.toString() ?? "",
      photoUrl: json["photo_url"]?.toString() ?? "",
      description: json["description"]?.toString() ?? "",
      brand: json["brand"]?.toString() ?? "",
      category: json["category"]?.toString() ?? "",
    );
  }
}