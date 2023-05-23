import 'package:equatable/equatable.dart';

import '../../1_domain/entities/public_key_entity.dart';

class PublicKEyModel extends PublicKeyEntity with EquatableMixin {
  const PublicKEyModel({
    required String publicKey,
  }) : super(
          publicKey: publicKey,
        );

  factory PublicKEyModel.fromJson(Map<String, dynamic> json) {
    return PublicKEyModel(publicKey: json['publicKey']);
  }
}
