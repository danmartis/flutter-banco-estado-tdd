import 'package:dio/dio.dart';

String getErrorMessage(DioError err) {
  final message = err.response != null
      ? err.message.toString()
      : err.response!.data['message'];

  return message;
}
