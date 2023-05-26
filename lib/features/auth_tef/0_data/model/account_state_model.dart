
import 'package:empresas/features/auth_tef/1_domain/entities/entities.dart';

class AccountStateModel extends AccountState {

  const AccountStateModel({
    required super.description, 
    required super.id
  });

  factory AccountStateModel.fromJson(Map<String, dynamic> json) {
    return AccountStateModel(
      description: json["descripcion"],
      id: json["id"]
    );
  }

  AccountState toEntity() {
    return AccountState(description: description, id: id);
  }
}