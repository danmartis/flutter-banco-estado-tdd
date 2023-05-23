import 'package:dartz/dartz.dart';

import '../entities/beneficiary_entity.dart';
import '../failures/failures.dart';

abstract class BeneficiariesRepo {
  Future<Either<DioFailure, List<BeneficiaryEntity>>> getBeneficiaries();
}
