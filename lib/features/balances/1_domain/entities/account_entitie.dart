import 'package:equatable/equatable.dart';

//TODO: Entidades temporales, a la espera de la estructura final

class Account extends Equatable {
  final String id;
  final int consolidatedBalances;
  final int creditLine;

  const Account({
    required this.id,
    required this.consolidatedBalances,
    required this.creditLine,
  });

  @override
  List<Object> get props => [
        id,
        consolidatedBalances,
        creditLine,
      ];
}
