import 'package:dio/dio.dart';

import '../models/public_key_model.dart';

abstract class RemoteBffDatasource {}

class RemoteBffDatasourceImpl implements RemoteBffDatasource {
  final Dio dio;

  RemoteBffDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List<PublicKEyModel>> validateRutAndGetPublicKey(
    String businessRut,
    String businessDv,
  ) async {
    final Response<Map<String, dynamic>> result = await dio
        .post('/bff/v1/login-enrollment-pj-app-bff/seguridades', data: {
      'rutEmpresa': businessRut,
      'dvEmpresa': businessDv,
    });

    return (result.data! as List<dynamic>)
        .map((e) => PublicKEyModel.fromJson(e))
        .toList();
  }
}
