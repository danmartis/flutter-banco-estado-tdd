import 'dart:convert';

import '../../1_domain/entities/bank_account_entitie.dart';
import 'account_model.dart';

//TODO: modelos temporales, a la espera de los modelos finales

class BankAccountModel extends BankAccount {
  const BankAccountModel({
    required List<AccountModel> accounts,
    required int consolidatedBalances,
    required int availableBalance,
    required int creditLine,
    required String name,
  }) : super(
          accounts: accounts,
          consolidatedBalances: consolidatedBalances,
          availableBalance: availableBalance,
          creditLine: creditLine,
          name: name,
        );

  factory BankAccountModel.empty() => const BankAccountModel(
        accounts: [],
        consolidatedBalances: 0,
        availableBalance: 0,
        creditLine: 0,
        name: '',
      );

  factory BankAccountModel.fromMap(Map<String, dynamic> json) =>
      BankAccountModel(
        accounts: List<AccountModel>.from(
            json['accounts'].map((x) => AccountModel.fromJson(x))),
        consolidatedBalances: json['consolidatedBalances'],
        availableBalance: json['availableBalance'],
        creditLine: json['creditLine'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'accounts': List<dynamic>.from(accounts.map((x) => x.toJson())),
        'consolidatedBalances': consolidatedBalances,
        'availableBalance': availableBalance,
        'creditLine': creditLine,
        'name': name,
      };
}

BankAccountModel bankAccountFromJson(String str) =>
    BankAccountModel.fromMap(json.decode(str));




//json

// {
//     "accounts": [
//         {
//             "id": "876628221232",
//             "consolidatedBalances": 605234789,
//             "creditLine": 100000000
//         },
//       {
//             "id": "976628221232",
//             "consolidatedBalances": 605234789,
//             "creditLine": 100000000
//         },
//       {
//             "id": "176628221232",
//             "consolidatedBalances": 605234789,
//             "creditLine": 100000000
//         }
//     ],
//     "consolidatedBalances": 605234789,
//     "availableBalance": 100000000,
//     "creditLine": 23456789,
// "name": "Chequeras Electrónicas"
// }
