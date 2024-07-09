part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class ConfirmButtonPressed extends ForgotPasswordEvent {
  final String email;

  const ConfirmButtonPressed({required this.email});
  @override
  List<Object?> get props => [email];
}
