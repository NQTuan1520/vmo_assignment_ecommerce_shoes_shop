part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class FetchCartDetails extends CartEvent {}

class RemoveCartItems extends CartEvent {
  final CartItemEntity cartItem;

  const RemoveCartItems(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class IncreaseQuantity extends CartEvent {
  final CartItemEntity cartItem;

  const IncreaseQuantity(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class DecreaseQuantity extends CartEvent {
  final CartItemEntity cartItem;

  const DecreaseQuantity(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class UpdateCartItemQuantity extends CartEvent {
  final CartItemEntity cartItem;
  final int quantity;

  const UpdateCartItemQuantity(this.cartItem, this.quantity);

  @override
  List<Object?> get props => [cartItem, quantity];
}

class FetchDiscounts extends CartEvent {}

class ApplyVoucher extends CartEvent {
  final String voucherCode;

  const ApplyVoucher(this.voucherCode);

  @override
  List<Object?> get props => [voucherCode];
}

class GetCheckOutToken extends CartEvent {}

class ResetCart extends CartEvent {}

class ResetVoucher extends CartEvent {}
