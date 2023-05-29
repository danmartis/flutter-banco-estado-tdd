part of 'auth_tef_cubit.dart';

class AuthTefState extends Equatable {

  final PhaseOne phaseOne;
  final bool isLoading;

  const AuthTefState({
    required this.phaseOne,
    required this.isLoading
  });

  AuthTefState copyWith({
    PhaseOne? phaseOne,
    bool? isLoading
  }) {
    return AuthTefState(
      phaseOne: phaseOne ?? this.phaseOne,
      isLoading: isLoading ?? this.isLoading
    );
  }

  @override
  List<Object?> get props => [phaseOne, isLoading];
}
