class CatModel {
  final String id;
  final String url;
  final int width;
  final int height;

  CatModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }

  factory CatModel.mocked() => CatModel(
        id: 'Mocked id',
        url: '',
        width: 0,
        height: 0,
      );
}
