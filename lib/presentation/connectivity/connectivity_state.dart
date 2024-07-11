part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  final Status status;
  final String errorMessage;

  const ConnectivityState({this.status = Status.initial, this.errorMessage = ''});

  ConnectivityState copyWith({
    Status? status,
    String? errorMessage,
  }) {
    return ConnectivityState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage];
}
