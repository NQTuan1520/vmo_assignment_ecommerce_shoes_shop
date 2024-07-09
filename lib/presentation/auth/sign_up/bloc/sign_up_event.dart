part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const SignUpButtonPressed({required this.email, required this.password, required this.name, required this.phone});

  @override
  List<Object?> get props => [email, password, name, phone];
}

class TogglePasswordsVisibility extends SignUpEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
