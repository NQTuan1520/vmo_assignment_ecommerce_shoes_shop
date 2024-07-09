part of 'check_out_bloc.dart';

class CheckOutEvent extends Equatable {
  const CheckOutEvent();

  @override
  List<Object?> get props => [];
}

class CaptureOrder extends CheckOutEvent {
  final CaptureOrderRequestEntity orderRequest;

  const CaptureOrder(this.orderRequest);

  @override
  List<Object> get props => [orderRequest];
}

class ResetCheckOut extends CheckOutEvent {}
