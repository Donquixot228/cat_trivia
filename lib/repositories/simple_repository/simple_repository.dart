import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/models/cat_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SimpleRepository {
  Future<CatModel> getCat() async {
    Uri url = Uri.parse(Constants.catPhotoUrl);
    final response = await http.get(url);
    final jsonresponse = json.decode(response.body);
    return CatModel.fromJson(jsonresponse[0]);
  }
}
