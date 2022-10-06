class CatModel {
  final String name;
  final String description;
  final String imageUrl;

  CatModel({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
