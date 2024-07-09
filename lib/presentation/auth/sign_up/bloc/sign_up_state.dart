part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final Status status;
  final String? errorMessage;
  final bool showPassword;

  const SignUpState({
    this.status = Status.initial,
    this.errorMessage,
    this.showPassword = false,
  });

  SignUpState copyWith({
    Status? status,
    String? errorMessage,
    bool? showPassword,
  }) {
    return SignUpState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, showPassword];
}
