import 'package:equatable/equatable.dart';

class Account extends Equatable{
  final String accountNumber;
  final String alias;
  final String accountType;

  const Account({
      required this.accountNumber,
      required this.alias,
      required this.accountType,
  });
  
  @override
  List<Object?> get props => [accountNumber, alias, accountType];
}