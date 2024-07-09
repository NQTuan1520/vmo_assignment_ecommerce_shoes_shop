import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String fullName;
  final String telephone;
  final String email;
  final String password;

  const AuthEntity({
    required this.fullName,
    required this.telephone,
    required this.email,
    required this.password,
  });

  AuthEntity copyWith({
    String? fullName,
    String? telephone,
    String? email,
    String? password,
  }) {
    return AuthEntity(
      fullName: fullName ?? this.fullName,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [fullName, telephone, email, password];
}
