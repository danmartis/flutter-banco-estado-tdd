import 'package:dartz/dartz.dart';

import '../entities/beneficiary_entity.dart';
import '../failures/failures.dart';
import '../repositories/beneficiaries_repo.dart';

class BeneficiariesUseCases {
  final BeneficiariesRepo beneficiariesRepo;

  BeneficiariesUseCases({
    required this.beneficiariesRepo,
  });

  Future<Either<DioFailure, List<BeneficiaryEntity>>> getBeneficiaries() async {
    return await beneficiariesRepo.getBeneficiaries();
  }
}
