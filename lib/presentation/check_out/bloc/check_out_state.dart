part of 'check_out_bloc.dart';

class CheckOutState extends Equatable {
  final Status status;
  final String? errorMessage;
  final GetTokenCheckOutEntity? tokenCheckOut;
  final bool showSuccessDialog;

  const CheckOutState({
    this.status = Status.initial,
    this.errorMessage,
    this.tokenCheckOut,
    this.showSuccessDialog = false,
  });

  CheckOutState copyWith({
    Status? status,
    String? errorMessage,
    GetTokenCheckOutEntity? tokenCheckOut,
    bool? showSuccessDialog,
  }) {
    return CheckOutState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      tokenCheckOut: tokenCheckOut ?? this.tokenCheckOut,
      showSuccessDialog: showSuccessDialog ?? this.showSuccessDialog,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, tokenCheckOut, showSuccessDialog];
}
