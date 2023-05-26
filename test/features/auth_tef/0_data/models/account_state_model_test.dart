

import 'package:empresas/features/auth_tef/0_data/model/account_state_model.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  const tAccountStateModel = AccountStateModel(
    description: "Sin Autorización", 
    id: "1raFirma"
  );

  const Map<String, dynamic> tAccountStateJsonMap =  {
    "descripcion": "Sin Autorización",
    "id": "1raFirma"
  };

  test(
    'should be a subclass of AccountState entity',
    () async {
      expect(tAccountStateModel, isA<AccountState>());
    }
  );

  test(
    'should return a model AccountStateModel when call .fromJson',
    () async {
      // act
      final result = AccountStateModel.fromJson(tAccountStateJsonMap);
      // assert
      expect(result, tAccountStateModel);
    }
  );
}