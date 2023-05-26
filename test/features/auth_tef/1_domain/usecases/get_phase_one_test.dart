

import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:empresas/features/auth_tef/1_domain/repositories/phase_one_repository.dart';
import 'package:empresas/features/auth_tef/1_domain/usecases/get_acount_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPhaseOneRepositoryImpl extends Mock 
                                 implements PhaseOneRepository {}

void main() {
  late MockPhaseOneRepositoryImpl mockPhaseOneRepositoryImpl;
  late GetPhaseOne usecase;

  setUp(() {
    mockPhaseOneRepositoryImpl = MockPhaseOneRepositoryImpl();
    usecase = GetPhaseOne(mockPhaseOneRepositoryImpl);
  });

  const tPhaseOne = PhaseOne(
    accounts: [
      Account(
        accountNumber: "00001028821", 
        alias: "Alias cuenta", 
        accountType: "CCT"
      )
    ], 
    maxTefAmount: 5000000, 
    maxTefAmountPerDay: 5000000, 
    maxTefSelection: 15, 
    accountStates: [
      AccountState(
        description: "Sin Autorización", 
        id: "1raFirma"
      ),
      AccountState(
        description: "Sin Autorización", 
        id: "1raFirma"
      ),
    ]
  );

  test(
    'should get phase 1 data from repository',
    () async {
      // arrange
      when(() => mockPhaseOneRepositoryImpl.getPhaseOne())
        .thenAnswer((_) async => const Right(tPhaseOne));
      // act
      final result = await usecase();
      // assert
      expect(result, const Right(tPhaseOne));
      verify(() => mockPhaseOneRepositoryImpl.getPhaseOne());
      verifyNoMoreInteractions(mockPhaseOneRepositoryImpl);
    }
  );
}