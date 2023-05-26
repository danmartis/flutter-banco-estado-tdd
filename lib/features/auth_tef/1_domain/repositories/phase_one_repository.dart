
import 'package:empresas/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/entities.dart';

abstract class PhaseOneRepository {
  Future<Either<Failure, PhaseOne>> getPhaseOne();
}