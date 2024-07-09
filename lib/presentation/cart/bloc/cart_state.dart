part of 'cart_bloc.dart';

class CartState extends Equatable {
  final Status status;
  final Status updateStatus;
  final Status voucherStatus;
  final Status checkoutTokenStatus;
  final CartEntity? cart;
  final List<CartItemEntity> cartItems;
  final List<DiscountDataEntity> discounts;
  final String? errorMessage;
  final bool checkDiscount;
  final UpdateCartDiscountEntity? voucher;
  final GetTokenCheckOutEntity? tokenCheckOut;
  final int discount;

  const CartState({
    this.status = Status.initial,
    this.updateStatus = Status.initial,
    this.voucherStatus = Status.initial,
    this.checkoutTokenStatus = Status.initial,
    this.cart,
    this.cartItems = const [],
    this.discounts = const [],
    this.errorMessage,
    this.checkDiscount = false,
    this.voucher,
    this.tokenCheckOut,
    this.discount = 0,
  });

  CartState copyWith({
    Status? status,
    Status? updateStatus,
    Status? voucherStatus,
    Status? checkoutTokenStatus,
    CartEntity? cart,
    List<CartItemEntity>? cartItems,
    List<DiscountDataEntity>? discounts,
    String? errorMessage,
    bool? checkDiscount,
    UpdateCartDiscountEntity? voucher,
    GetTokenCheckOutEntity? tokenCheckOut,
    int? discount,
  }) {
    return CartState(
      status: status ?? this.status,
      updateStatus: updateStatus ?? this.updateStatus,
      voucherStatus: voucherStatus ?? this.voucherStatus,
      checkoutTokenStatus: checkoutTokenStatus ?? this.checkoutTokenStatus,
      cart: cart ?? this.cart,
      cartItems: cartItems ?? this.cartItems,
      discounts: discounts ?? this.discounts,
      errorMessage: errorMessage ?? this.errorMessage,
      checkDiscount: checkDiscount ?? this.checkDiscount,
      voucher: voucher ?? this.voucher,
      tokenCheckOut: tokenCheckOut ?? this.tokenCheckOut,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object?> get props => [
        status,
        updateStatus,
        voucherStatus,
        checkoutTokenStatus,
        cart,
        cartItems,
        discounts,
        errorMessage,
        checkDiscount,
        voucher,
        tokenCheckOut,
        discount,
      ];
}
