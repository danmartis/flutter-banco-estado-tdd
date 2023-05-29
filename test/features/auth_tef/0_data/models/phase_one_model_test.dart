

import 'package:empresas/features/auth_tef/0_data/models/phase_one_model.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  const tPhaseOneModel = PhaseOneModel(
    accountStates: [
      AccountState(
        description: "Sin Autorización", 
        id: "1eraFirma"
      ),
      AccountState(
        description: "Pendiente Otra Autorización", 
        id: "2daFirma"
      ),
    ],
    accounts: [
      Account(
        accountNumber: "00001028821",
        accountType: "CCT",
        alias: "Alias cuenta"
      )
    ],
    maxTefAmount: 5000000,
    maxTefAmountPerDay: 5000000,
    maxTefSelection: 15
  );

  const Map<String, dynamic> tPhaseOneJsonMap =  {
      "cuentas": [
          {
              "numeroCuenta": "00001028821",
              "alias": "Alias cuenta",
              "tipoCuenta": "CCT"
          }
      ],
      "maximoTransferencia": 5000000,
      "montoMaximoPorDia": 5000000,
      "seleccionMaximaTransferencias": 15,
      "estados": [
          {
              "descripcion": "Sin Autorización",
              "id": "1eraFirma"
          },
          {
              "descripcion": "Pendiente Otra Autorización",
              "id": "2daFirma"
          }
      ]
  };

  test(
    'should be a subclass of PhaseOne entity',
    () async {
      expect(tPhaseOneModel, isA<PhaseOne>());
    }
  );

  test(
    'should return a model PhaseOneModel when call .fromJson',
    () async {
      // act
      final result = PhaseOneModel.fromJson(tPhaseOneJsonMap);
      // assert
      expect(result, tPhaseOneModel);
    }
  );
}