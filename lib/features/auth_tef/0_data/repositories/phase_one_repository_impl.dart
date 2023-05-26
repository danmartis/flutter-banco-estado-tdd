

import 'package:empresas/core/error/exceptions.dart';
import 'package:empresas/features/auth_tef/0_data/datasources/http_datasource.dart';
import 'package:empresas/features/auth_tef/0_data/models/phase_one_model.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/phase_one.dart';
import 'package:empresas/core/error/failure.dart';
import 'package:empresas/features/auth_tef/1_domain/repositories/phase_one_repository.dart';
import 'package:dartz/dartz.dart';

class PhaseOneRepositoryImpl implements PhaseOneRepository {

  final HttpDatasource httpDatasource;
  final String url;

  PhaseOneRepositoryImpl({
    required this.httpDatasource,
    required this.url
  });

  @override
  Future<Either<Failure, PhaseOne>> getPhaseOne() async {
    try {
      final result = await httpDatasource.get(url);
      final PhaseOne phaseOneResult = PhaseOneModel.fromJson(result["payload"]).toEntity();

      return Right(phaseOneResult);    
    } on ServerException {
      return Left(ServerFailure());
    }
    
  }
}