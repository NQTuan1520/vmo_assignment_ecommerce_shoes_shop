part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Status status;
  final String? errorMessage;
  final bool showPassword;
  final bool isGuest;
  final String? email;
  final String? password;
  final bool isRememberMe;

  const LoginState({
    this.status = Status.initial,
    this.errorMessage,
    this.showPassword = false,
    this.isGuest = false,
    this.email,
    this.password,
    this.isRememberMe = false,
  });

  LoginState copyWith({
    Status? status,
    String? errorMessage,
    bool? showPassword,
    bool? isGuest,
    String? email,
    String? password,
    bool? isRememberMe,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      showPassword: showPassword ?? this.showPassword,
      isGuest: isGuest ?? this.isGuest,
      email: email ?? this.email,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, showPassword, isGuest, email, password, isRememberMe];
}
