import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../helpers/get_error_message.dart';
import '../../1_domain/failures/failures.dart';
import '../../1_domain/repositories/beneficiaries_repo.dart';
import '../datasource/beneficiaries_remote_datasource.dart';
import '../models/beneficiary_model.dart';

class BeneficiariesRepoImpl implements BeneficiariesRepo {
  final BeneficiariesRemoteDataSource beneficiariesRemoteDatasource;

  BeneficiariesRepoImpl({
    required this.beneficiariesRemoteDatasource,
  });

  @override
  Future<Either<DioFailure, List<BeneficiaryModel>>> getBeneficiaries() async {
    try {
      final result = await beneficiariesRemoteDatasource.getBeneficiaries();

      final items = (result.data!['result'] as List<dynamic>)
          .map((e) => BeneficiaryModel.fromJson(e))
          .toList();

      return right(items);
    } on DioError catch (err) {
      return left(DioFailure(message: getErrorMessage(err)));
    }
  }
}
