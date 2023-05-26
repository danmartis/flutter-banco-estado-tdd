
import 'package:empresas/core/error/exceptions.dart';
import 'package:dio/dio.dart';

abstract class HttpDatasource {
  Future<Map<String, dynamic>> get(String url, { Options? options });
}

class HttpDatasourceImpl implements HttpDatasource {

  final Dio httpClient;

  HttpDatasourceImpl({required this.httpClient});

  @override
  Future<Map<String, dynamic>> get(String url, {Options? options}) async {
    final response = await httpClient.get(url, options: options);

    if(response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException();
    }
  }

}