part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final bool rememberMe;

  const LoginButtonPressed({required this.email, required this.password, required this.rememberMe});

  @override
  List<Object?> get props => [email, password];
}

class TogglePasswordVisibility extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginWithGoogle extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class GuestLogin extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoadSavedCredentials extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class ToggleRememberMe extends LoginEvent {
  @override
  List<Object?> get props => [];
}
