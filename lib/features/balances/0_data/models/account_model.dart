import '../../1_domain/entities/account_entitie.dart';

//TODO: modelos temporales, a la espera de los modelos finales

class AccountModel extends Account {
  const AccountModel({
    required String id,
    required int consolidatedBalances,
    required int creditLine,
  }) : super(
            id: id,
            consolidatedBalances: consolidatedBalances,
            creditLine: creditLine);

  factory AccountModel.empty() => const AccountModel(
        id: '',
        consolidatedBalances: 0,
        creditLine: 0,
      );

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json['id'],
        consolidatedBalances: json['consolidatedBalances'],
        creditLine: json['creditLine'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'consolidatedBalances': consolidatedBalances,
        'creditLine': creditLine,
      };
}
