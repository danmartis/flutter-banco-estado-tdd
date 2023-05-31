import 'package:equatable/equatable.dart';

import '../../0_data/models/account_model.dart';

//TODO: Entidades temporales, a la espera de la estructura final

class BankAccount extends Equatable {
  final List<AccountModel> accounts;
  final int consolidatedBalances;
  final int availableBalance;
  final int creditLine;
  final String name;

  const BankAccount({
    required this.accounts,
    required this.consolidatedBalances,
    required this.availableBalance,
    required this.creditLine,
    required this.name,
  });

  @override
  List<Object> get props => [
        accounts,
        consolidatedBalances,
        availableBalance,
        creditLine,
        name,
      ];
}
