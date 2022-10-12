import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/models/fact_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'datebase_repository.g.dart';

@RestApi(
  baseUrl: Constants.factUrl,
)
abstract class DataBaseRepository {
  factory DataBaseRepository(Dio dio, {String baseUrl}) = _DataBaseRepository;

  @GET('/fact')
  Future<FactModel> getFact();
}
