part of 'beneficiaries_bloc.dart';

abstract class BeneficiariesEvent extends Equatable {
  const BeneficiariesEvent();

  @override
  List<Object> get props => [];
}

class GetBeneficiariesEvent extends BeneficiariesEvent {}
