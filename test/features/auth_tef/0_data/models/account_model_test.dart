


import 'package:empresas/features/auth_tef/0_data/models/account_model.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  const tAccountModel = AccountModel(
    accountNumber:  "00001028821",
    accountType: "CCT",
    alias: "Alias cuenta",
  );

  const Map<String, dynamic> tAccountJsonMap =  {
      "numeroCuenta": "00001028821",
      "alias": "Alias cuenta",
      "tipoCuenta": "CCT"
  };

  test(
    'should be a subclass of Account entity',
    () async {
      expect(tAccountModel, isA<Account>());
    }
  );

  test(
    'should return a model AccountModel when call .fromJson',
    () async {
      // act
      final result = AccountModel.fromJson(tAccountJsonMap);
      // assert
      expect(result, tAccountModel);
    }
  );
}