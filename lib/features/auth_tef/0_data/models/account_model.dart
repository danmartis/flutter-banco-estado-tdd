import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';

class AccountModel extends Account {
  const AccountModel({required super.accountNumber,
    required super.alias,
    required super.accountType,
    required super.description,
    required super.stateId
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      accountNumber: json['numeroCuenta'],
      accountType: json['tipoCuenta'],
      alias: json['alias'],
      description: json['desc'],
      stateId: json['estado']
    );
  }

  Account toEntity() {
    return Account(
      accountNumber: accountNumber, 
      alias: alias, 
      accountType: accountType,
      description: description,
      stateId: stateId
    );
  }
}
