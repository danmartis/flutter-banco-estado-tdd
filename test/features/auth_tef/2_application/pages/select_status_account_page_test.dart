import 'package:dartz/dartz.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:empresas/features/auth_tef/1_domain/usecases/get_phase_one.dart';
import 'package:empresas/features/auth_tef/2_application/cubits/auth_tef/auth_tef_cubit.dart';
import 'package:empresas/features/auth_tef/2_application/pages/select_status_account_page.dart';
import 'package:empresas/features/auth_tef/2_application/pages/shared/error_page.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/skeletons/account_states_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockGetPhaseOne extends Mock implements GetPhaseOne {}


void main() {
  group('SelectStatusAccounyPage', () {
    late AuthTefCubit authTefCubit;
    late MockGetPhaseOne mockGetPhaseOne;

    setUp(() async {
      mockGetPhaseOne = MockGetPhaseOne();
      await GetIt.instance.reset();
      GetIt.instance.registerSingleton<GetPhaseOne>(mockGetPhaseOne);
      authTefCubit = AuthTefCubit();
    });

    const tPhaseOne = PhaseOne(
      accountStates: [
        AccountState(id: '1eraFirma', description: 'Sin Autorización'),
        AccountState(id: '2daFirma', description: 'Pendiente Otra Autorización'),
      ],
      accounts: [
        Account(
          accountNumber: "00001028821", 
          alias: "alias cuenta", 
          accountType: "CCT",
          description: "Cuenta Corriente",
          stateId: "1eraFirma"
        )
      ],
      maxTefAmount: 1000,
      maxTefAmountPerDay: 500,
      maxTefSelection: 2,
    );

    testWidgets('renders correct widgets when loading is true', (WidgetTester tester) async {
      
      when(() => mockGetPhaseOne()).thenAnswer((_) async {
        return const Right(tPhaseOne);
      });

      const isLoading = true;

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthTefCubit>.value(
            value: authTefCubit,
            child: const SelectStatusAccountPage(),
          ),
        ),
      );

      authTefCubit.emit(
        AuthTefState(
          isLoading: isLoading,
          hasPhaseOneError: false,
          phaseOne: PhaseOne(
            accountStates: tPhaseOne.accountStates,
            accounts: const [],
            maxTefAmount: 0,
            maxTefAmountPerDay: 0,
            maxTefSelection: 0
          ),
        ),
      );

      expect(find.text('Autorizar transferencias'), findsOneWidget);
      expect(find.text('¿Qué transferencias autorizará?'), findsOneWidget);
      expect(
        find.text(
            'Seleccione una opción para filtrar las transferencias pendientes de autorización'),
        findsOneWidget,
      );
      expect(find.byType(AccountStatesSkeleton), findsOneWidget);
      expect(find.byType(AccountStateButtons), findsNothing);
    });

    testWidgets('renders correct widgets when loading is false', (WidgetTester tester) async {
      
      when(() => mockGetPhaseOne()).thenAnswer((_) async => const Right(tPhaseOne));

      const isLoading = false;

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthTefCubit>.value(
            value: authTefCubit,
            child: const SelectStatusAccountPage(),
          ),
        ),
      );

      authTefCubit.emit(
        const AuthTefState(
          isLoading: isLoading,
          phaseOne: tPhaseOne,
          hasPhaseOneError: false
        )
      );
      await tester.pump();

      expect(find.text('Autorizar transferencias'), findsOneWidget);
      expect(find.text('¿Qué transferencias autorizará?'), findsOneWidget);
      expect(
        find.text(
            'Seleccione una opción para filtrar las transferencias pendientes de autorización'),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      expect(find.byType(AccountStatesSkeleton), findsNothing);
      expect(find.byType(AccountStateButtons), findsOneWidget);
    });

    testWidgets('renders correct widgets when accountStates array is empty', (WidgetTester tester) async {
      
      const tPhaseOneWithoutAccountStates = PhaseOne(accounts: [], maxTefAmount: 0, maxTefAmountPerDay: 0, maxTefSelection: 0, accountStates: []);

      when(() => mockGetPhaseOne()).thenAnswer((_) async => const Right(tPhaseOneWithoutAccountStates));

      const isLoading = false;

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<AuthTefCubit>.value(
            value: authTefCubit,
            child: const SelectStatusAccountPage(),
          ),
        ),
      );

      authTefCubit.emit(
        const AuthTefState(
          isLoading: isLoading,
          phaseOne: tPhaseOneWithoutAccountStates,
          hasPhaseOneError: false
        )
      );
      await tester.pump();

      expect(find.byType(ErrorPageContent), findsOneWidget);
      expect(find.text('Autorizar transferencias'), findsOneWidget);
      expect(find.text('¿Qué transferencias autorizará?'), findsNothing);
      expect(
        find.text(
            'Seleccione una opción para filtrar las transferencias pendientes de autorización'),
        findsNothing,
      );
      await tester.pumpAndSettle();
      expect(find.byType(AccountStatesSkeleton), findsNothing);
      expect(find.byType(AccountStateButtons), findsNothing);
    });
  });
}