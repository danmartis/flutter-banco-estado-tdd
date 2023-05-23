import 'package:equatable/equatable.dart';

import '../../1_domain/entities/beneficiary_entity.dart';

class BeneficiaryModel extends BeneficiaryEntity with EquatableMixin {
  const BeneficiaryModel({
    required String name,
    required int rut,
    required String dv,
    required String account,
    required String accountNumber,
    required String accountDescription,
    required String email,
  }) : super(
          name: name,
          rut: rut,
          dv: dv,
          account: account,
          accountNumber: accountNumber,
          accountDescription: accountDescription,
          email: email,
        );

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      name: json['nombre'] as String,
      rut: json['rut'] as int,
      dv: json['dv'] as String,
      account: json['cuenta'] as String,
      accountNumber: json['numeroCuenta'] as String,
      accountDescription: json['descripcionCuenta'] as String,
      email: json['correo'] as String,
    );
  }
}
