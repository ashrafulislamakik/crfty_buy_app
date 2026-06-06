class Categoriesmodel {
  final String id;
  final String title;
  final String icon;

  Categoriesmodel({
    required this.id,
    required this.title,
    required this.icon});

  factory Categoriesmodel.fromJson(Map<String, dynamic> json) {
    return Categoriesmodel(
      id: json["_id"],
      title: json["title"],
      icon: json["icon"],
    );
  }
}
