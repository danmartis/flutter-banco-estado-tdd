import 'package:empresas/features/auth_tef/1_domain/entities/account.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/account_state.dart';
import 'package:equatable/equatable.dart';

class PhaseOne extends Equatable{
  final List<Account> accounts;
  final int maxTefAmount;
  final int maxTefAmountPerDay;
  final int maxTefSelection;
  final List<AccountState> accountStates;

  const PhaseOne({
    required this.accounts,
    required this.maxTefAmount,
    required this.maxTefAmountPerDay,
    required this.maxTefSelection,
    required this.accountStates,
  });
  
  @override
  List<Object?> get props => [
    accounts,
    maxTefAmount,
    maxTefAmountPerDay,
    maxTefSelection,
    accountStates,
  ];
}