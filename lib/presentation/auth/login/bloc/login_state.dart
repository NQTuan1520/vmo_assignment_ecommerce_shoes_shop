part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Status status;
  final String? errorMessage;
  final bool showPassword;
  final bool isGuest;

  const LoginState({
    this.status = Status.initial,
    this.errorMessage,
    this.showPassword = false,
    this.isGuest = false,
  });

  LoginState copyWith({
    Status? status,
    String? errorMessage,
    bool? showPassword,
    bool? isGuest,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      showPassword: showPassword ?? this.showPassword,
      isGuest: isGuest ?? this.isGuest,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, showPassword, isGuest];
}
