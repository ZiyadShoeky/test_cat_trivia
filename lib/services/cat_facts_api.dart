import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/cat_fact.dart';

part 'cat_facts_api.g.dart';

@RestApi()
abstract class CatFactsApi {
  factory CatFactsApi(Dio dio, {String baseUrl}) = _CatFactsApi;

  @GET('/facts/random')
  Future<CatFact> getRandomFact();
}