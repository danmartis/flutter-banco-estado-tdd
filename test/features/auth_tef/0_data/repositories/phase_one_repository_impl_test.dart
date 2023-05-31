
import 'package:empresas/core/error/exceptions.dart';
import 'package:empresas/core/error/failure.dart';
import 'package:empresas/features/auth_tef/0_data/datasources/http_datasource.dart';
import 'package:empresas/features/auth_tef/0_data/repositories/phase_one_repository_impl.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpDatasourceImpl extends Mock
                             implements HttpDatasource {}

void main() {
  late MockHttpDatasourceImpl httpDatasource;
  late PhaseOneRepositoryImpl phaseOneRepositoryImpl;

  setUp(() {
    httpDatasource = MockHttpDatasourceImpl();
    phaseOneRepositoryImpl = PhaseOneRepositoryImpl(
      httpDatasource: httpDatasource,
      url: 'http://test.com/phase1'
    );
  });

  const tPhaseOneModel = PhaseOne(
    accountStates: [
      AccountState(
        description: "Sin Autorización", 
        id: "1eraFirma"
      )
    ],
    accounts: [
      Account(
        accountNumber: "00001028821",
        accountType: "CCT",
        alias: "Alias cuenta",
        description: "Cuenta Corriente",
        stateId: "1eraFirma"
      )
    ],
    maxTefAmount: 5000000,
    maxTefAmountPerDay: 5000000,
    maxTefSelection: 15
  );

  const httpResponseJson = {
    "codigo": 200,
    "mensaje": "Success",
    "resultado": "E",
    "payload": {
        "cuentas": [
            {
                "numeroCuenta": "00001028821",
                "alias": "Alias cuenta",
                "tipoCuenta": "CCT",
                "desc": "Cuenta Corriente",
                "estado": "1eraFirma"
            }
        ],
        "maximoTransferencia": 5000000,
        "montoMaximoPorDia": 5000000,
        "seleccionMaximaTransferencias": 15,
        "estados": [
            {
                "descripcion": "Sin Autorización",
                "id": "1eraFirma"
            }
        ]
    }
  };

  test(
    'should return phase one when the call to httpDatasource is successful', 
      () async {
      // arrage
      when(() => httpDatasource.get(any())).thenAnswer((_) async => httpResponseJson);

      // act
      Either<Failure, PhaseOne> result = await phaseOneRepositoryImpl.getPhaseOne();

      // assert
      expect(result, const Right(tPhaseOneModel));
      verify(() => httpDatasource.get(any()));
      verifyNoMoreInteractions(httpDatasource);
    }
  );

  test(
    'should return server failure when the call to httpDatasource is unsuccessful',
    () async {
      when(() => httpDatasource.get(any())).thenThrow(ServerException());

      final result = await phaseOneRepositoryImpl.getPhaseOne();

      expect(result, equals(Left(ServerFailure())));
      verify(() => httpDatasource.get(any()));
      verifyNoMoreInteractions(httpDatasource);
    }
  );

}