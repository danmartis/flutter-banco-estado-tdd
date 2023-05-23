part of 'beneficiaries_bloc.dart';

class BeneficiariesState extends Equatable {
  final List<BeneficiaryEntity> items;
  final bool isLoading;
  final String error;

  const BeneficiariesState({
    required this.items,
    required this.isLoading,
    required this.error,
  });

  factory BeneficiariesState.initial() {
    return const BeneficiariesState(
      items: [],
      isLoading: false,
      error: '',
    );
  }

  @override
  List<dynamic> get props => [
        items,
        isLoading,
        error,
      ];

  @override
  String toString() => 'BeneficiariesState('
      'items: $items, '
      'isLoading: $isLoading, '
      'error: $error)';

  BeneficiariesState copyWith({
    List<BeneficiaryEntity>? items,
    bool? isLoading,
    String? error,
  }) {
    return BeneficiariesState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
