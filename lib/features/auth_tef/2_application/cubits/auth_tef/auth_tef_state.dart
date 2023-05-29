part of 'auth_tef_cubit.dart';

class AuthTefState extends Equatable {

  final PhaseOne phaseOne;
  final bool isLoading;
  final bool hasPhaseOneError;

  const AuthTefState({
    required this.phaseOne,
    required this.isLoading,
    required this.hasPhaseOneError
  });

  AuthTefState copyWith({
    PhaseOne? phaseOne,
    bool? isLoading,
    bool? hasPhaseOneError
  }) {
    return AuthTefState(
      phaseOne: phaseOne ?? this.phaseOne,
      isLoading: isLoading ?? this.isLoading,
      hasPhaseOneError: hasPhaseOneError ?? this.hasPhaseOneError
    );
  }

  @override
  List<Object?> get props => [phaseOne, isLoading, hasPhaseOneError];
}
