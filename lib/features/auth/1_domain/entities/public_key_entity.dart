import 'package:equatable/equatable.dart';

class PublicKeyEntity extends Equatable {
  final String publicKey;

  const PublicKeyEntity({
    required this.publicKey,
  });

  @override
  List<Object?> get props => [
        publicKey,
      ];
}
