part of 'toggle_balances_cubit.dart';

class ToggleBalancesState extends Equatable {
  const ToggleBalancesState({required this.showBalances});

  final bool showBalances;

  ToggleBalancesState copyWith({required bool showBalances}) {
    return ToggleBalancesState(showBalances: showBalances);
  }

  @override
  List<Object?> get props => [showBalances];
}
