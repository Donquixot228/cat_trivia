class FactModel {
  final String text;

  FactModel({
    required this.text,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) {
    return FactModel(
      text: json['text'],
    );
  }
}
