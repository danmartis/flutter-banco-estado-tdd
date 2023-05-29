import 'package:dartz/dartz.dart';
import 'package:empresas/core/error/failure.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:empresas/features/auth_tef/1_domain/usecases/get_phase_one.dart';
import 'package:empresas/features/auth_tef/2_application/cubits/auth_tef/auth_tef_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPhaseOne extends Mock implements GetPhaseOne {}

void main() {
  group('AuthTefCubit', () {
    late AuthTefCubit authTefCubit;
    late MockGetPhaseOne mockGetPhaseOne;

    setUp(() {
      mockGetPhaseOne = MockGetPhaseOne();
      GetIt.instance.reset();
      GetIt.instance.registerSingleton<GetPhaseOne>(mockGetPhaseOne);
      authTefCubit = AuthTefCubit();
    });

     test('initial state is correct', () {
      expect(
        authTefCubit.state,
        const AuthTefState(
          phaseOne: PhaseOne(
            accountStates: [],
            accounts: [],
            maxTefAmount: 0,
            maxTefAmountPerDay: 0,
            maxTefSelection: 0,
          ),
          isLoading: true,
          hasPhaseOneError: false
        ),
      );
    });

    test('emits correct states when init is calld successfully', () async {
      const phaseOne = PhaseOne(
        accountStates: [
          AccountState(id: '1eraFirma', description: 'Sin Autorización'),
          AccountState(id: '2daFirma', description: 'Pendiente Otra Autorización'),
        ],
        accounts: [
          Account(accountNumber: "00001028821", alias: "alias cuenta", accountType: "CCT")
        ],
        maxTefAmount: 1000,
        maxTefAmountPerDay: 500,
        maxTefSelection: 2,
      );

      when(() => mockGetPhaseOne()).thenAnswer((_) async => const Right(phaseOne));

      const expectedState = AuthTefState(
          phaseOne: phaseOne,
          isLoading: false,
          hasPhaseOneError: false
        );

      await authTefCubit.getPhaseOneData();
      expect(authTefCubit.state.phaseOne, expectedState.phaseOne);
      expect(authTefCubit.state.isLoading, expectedState.isLoading);

      verify(() => mockGetPhaseOne()).called(1);
    });

    test('emit correct state when init fails', () async {
      final failure = ServerFailure();

      when(() => mockGetPhaseOne()).thenAnswer((_) async => Left(failure));

      const expectedState = AuthTefState(
        phaseOne: PhaseOne(
          accountStates: [],
          accounts: [],
          maxTefAmount: 0,
          maxTefAmountPerDay: 0,
          maxTefSelection: 0,
        ),
        isLoading: false,
        hasPhaseOneError: false
      );

      await authTefCubit.getPhaseOneData();

      expect(authTefCubit.state, expectedState);
      verify(() => mockGetPhaseOne()).called(1);
    });

  });
}