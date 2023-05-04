// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_facts_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CatFactsApi implements CatFactsApi {
  _CatFactsApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://cat-fact.herokuapp.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CatFact> getRandomFact() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<CatFact>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: extra)
            .compose(_dio.options, '/facts/random', queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CatFact.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    requestOptions.responseType = ResponseType.json;
    return requestOptions;
  }
}