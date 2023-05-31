import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'toggle_balances_state.dart';

class ToggleBalancesCubit extends Cubit<ToggleBalancesState> {
  ToggleBalancesCubit() : super(const ToggleBalancesState(showBalances: true));

  Future<void> toggle() async {
    emit(state.copyWith(showBalances: !state.showBalances));
  }
}
