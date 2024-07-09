part of 'order_bloc.dart';

class OrderState extends Equatable {
  final Status status;
  final List<OrderDataEntity> orders;
  final String? errorMessage;

  const OrderState({
    this.status = Status.initial,
    this.orders = const [],
    this.errorMessage,
  });

  OrderState copyWith({
    Status? status,
    List<OrderDataEntity>? orders,
    String? errorMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, orders, errorMessage];
}
