import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class DataBaseRepository {
  DataBaseRepository();

  static final DataBaseRepository _repositories = DataBaseRepository();

  static DataBaseRepository get instance => _repositories;

  //[Data Urls]
  static const String factUrl = 'https://catfact.ninja/fact';
  static const String catPhotoUrl = 'https://cataas.com/cat';

  Future<FactModel> getFact() async {
    final response = await http.get(
      Uri.parse(factUrl),
    );
    final responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      return FactModel.fromJson(responseData);
    } else {
      throw Exception('Failed to load fact');
    }
  }
}
