import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

abstract class BeneficiariesRemoteDataSource {
  Future<Response<dynamic>> getBeneficiaries();
}

class BeneficiariesRemoteDataSourceImpl
    implements BeneficiariesRemoteDataSource {
  final Dio dio;
  final FirebasePerformance performance;

  BeneficiariesRemoteDataSourceImpl(
      {required this.dio, required this.performance});

  @override
  Future<Response<dynamic>> getBeneficiaries() async {
    performance.newTrace('${dio.options.baseUrl}/healthcheck').start();
    final response = await dio.get('/healthcheck');
    performance.newTrace('${dio.options.baseUrl}/healthcheck').stop();

    return response;
  }
}
