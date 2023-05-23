import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../1_domain/entities/beneficiary_entity.dart';
import '../../../../1_domain/usecases/beneficiaries_usecases.dart';

part 'beneficiaries_event.dart';
part 'beneficiaries_state.dart';

class BeneficiariesBloc extends Bloc<BeneficiariesEvent, BeneficiariesState> {
  final BeneficiariesUseCases beneficiariesUseCases;

  BeneficiariesBloc({
    required this.beneficiariesUseCases,
  }) : super(BeneficiariesState.initial()) {
    on<GetBeneficiariesEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final failureOrResult = await beneficiariesUseCases.getBeneficiaries();

      failureOrResult.fold(
        (failure) => emit(state.copyWith(
          items: [],
          isLoading: false,
          error: failure.message,
        )),
        (result) => emit(state.copyWith(
          items: result,
          isLoading: false,
          error: '',
        )),
      );
    });
  }
}
