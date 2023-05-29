

import 'package:empresas/features/auth_tef/0_data/models/account_model.dart';
import 'package:empresas/features/auth_tef/0_data/models/account_state_model.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';

class PhaseOneModel extends PhaseOne {

  const PhaseOneModel({required super.accounts, required super.maxTefAmount, required super.maxTefAmountPerDay, required super.maxTefSelection, required super.accountStates});

  factory PhaseOneModel.fromJson(Map<String, dynamic> json) {
    return PhaseOneModel(
      accountStates: (json['estados'] as List<dynamic>).map((state) => AccountStateModel.fromJson(state).toEntity()).toList(),
      maxTefAmount: json['maximoTransferencia'],
      maxTefAmountPerDay: json['montoMaximoPorDia'],
      maxTefSelection: json['seleccionMaximaTransferencias'],
      accounts: (json['cuentas'] as List<dynamic>).map((account) => AccountModel.fromJson(account).toEntity()).toList()
    );
  }

  PhaseOne toEntity() {
    return PhaseOne(accounts: accounts, maxTefAmount: maxTefAmount, maxTefAmountPerDay: maxTefAmountPerDay, maxTefSelection: maxTefSelection, accountStates: accountStates);
  }
}