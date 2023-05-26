import 'package:equatable/equatable.dart';

class AccountState extends Equatable {
  final String description;
  final String id;

  const AccountState({
    required this.description,
    required this.id,
  });
  
  @override
  List<Object?> get props => [description, id];
}