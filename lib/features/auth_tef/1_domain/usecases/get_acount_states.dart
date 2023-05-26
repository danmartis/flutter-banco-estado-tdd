

import 'package:empresas/core/error/failure.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:empresas/features/auth_tef/1_domain/repositories/phase_one_repository.dart';
import 'package:dartz/dartz.dart';

class GetPhaseOne {

  final PhaseOneRepository repository;

  GetPhaseOne(this.repository);

  Future<Either<Failure, PhaseOne>> call() async {
    return repository.getPhaseOne();
  }
}