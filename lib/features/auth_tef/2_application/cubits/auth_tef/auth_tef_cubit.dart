import 'package:empresas/features/auth_tef/1_domain/usecases/get_phase_one.dart';
import 'package:empresas/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

part 'auth_tef_state.dart';

class AuthTefCubit extends Cubit<AuthTefState> {
  AuthTefCubit() : super(const AuthTefState(
    phaseOne: PhaseOne(
      accountStates: [],
      accounts: [],
      maxTefAmount: 0,
      maxTefAmountPerDay: 0,
      maxTefSelection: 0
    ),
    isLoading: true,
    hasPhaseOneError: false
  ));

  final GetPhaseOne _getPhaseOne = sl<GetPhaseOne>();

  Future<void> getPhaseOneData() async {
    emit(state.copyWith(
      isLoading: true,
      hasPhaseOneError: false
    ));
    
    _getPhaseOne().then((phaseOneResult) {
      phaseOneResult.fold(
        (failure) {
          emit(state.copyWith(
            isLoading: false,
            hasPhaseOneError: true
          ));
          return;
        }, 
        (PhaseOne phaseOne) {
          emit(state.copyWith(
            isLoading: false,
            phaseOne: phaseOne
          ));
          return;
        }
      );
    });
  }
}
