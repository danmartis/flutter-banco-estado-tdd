import 'package:equatable/equatable.dart';

class Account extends Equatable{
  final String accountNumber;
  final String alias;
  final String accountType;
  final String description;
  final String stateId;

  const Account({
    required this.accountNumber,
    required this.alias,
    required this.accountType,
    required this.description,
    required this.stateId
  });
  
  @override
  List<Object?> get props => [accountNumber, alias, accountType, description, stateId];
}