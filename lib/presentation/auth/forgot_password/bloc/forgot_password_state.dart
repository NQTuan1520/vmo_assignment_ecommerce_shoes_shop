part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final Status status;
  final String? errorMessage;

  const ForgotPasswordState({
    this.status = Status.initial,
    this.errorMessage,
  });

  ForgotPasswordState copyWith({
    Status? status,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
