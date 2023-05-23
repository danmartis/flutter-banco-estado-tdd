import 'package:equatable/equatable.dart';

class BeneficiaryEntity extends Equatable {
  final String name;
  final int rut;
  final String dv;
  final String account;
  final String accountNumber;
  final String accountDescription;
  final String email;

  const BeneficiaryEntity({
    required this.name,
    required this.rut,
    required this.dv,
    required this.account,
    required this.accountNumber,
    required this.accountDescription,
    required this.email,
  });

  @override
  List<Object?> get props => [
        name,
        rut,
        dv,
        account,
        accountNumber,
        accountDescription,
        email,
      ];
}
