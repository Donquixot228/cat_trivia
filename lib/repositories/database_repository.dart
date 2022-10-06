import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataBaseRepository {
  DataBaseRepository();

  static final DataBaseRepository _repositories = DataBaseRepository();

  static DataBaseRepository get instance => _repositories;

  //[Data Urls]

  Future<FactModel> getFact() async {
    final response = await http.get(
      Uri.parse(Constants.factUrl),
    );
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return FactModel.fromJson(responseData);
    } else {
      throw Exception('Failed to load fact');
    }
  }
}
