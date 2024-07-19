import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/get_token_check_out_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/const/const.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_exception.dart';

import '../../../domain/cart/cart_details/entity/cart_entity.dart';
import '../../../domain/cart/cart_details/usecase/cart_usecase.dart';
import '../../../domain/cart/discount/entity/discount_entity.dart';
import '../../../domain/cart/discount/usecase/discount_usecase.dart';
import '../../../domain/check_out/usecase/check_out_usecase.dart';
import '../../../managers/enum/enum.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUseCase cartUseCase;
  final DiscountUseCase discountUseCase;
  final CheckOutUseCase checkOutUseCase;
  final SharedPreferences prefs;

  CartBloc({
    required this.cartUseCase,
    required this.discountUseCase,
    required this.checkOutUseCase,
    required this.prefs,
  }) : super(const CartState()) {
    on<FetchCartDetails>(_onFetchCartDetails);
    on<RemoveCartItems>(_onRemoveCartItems);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity, transformer: debounceTransformer());
    on<FetchDiscounts>(_onFetchDiscounts);
    on<ApplyVoucher>(_onApplyVoucher);
    on<GetCheckOutToken>(_onGetCheckOutToken);
    on<ResetCart>(_onResetCart);
    on<ResetVoucher>(_onResetVoucher);
  }

  EventTransformer<T> debounceTransformer<T>() {
    return (events, mapper) => events.debounce(AppConstants.updateQuantityDebounceDuration).switchMap(mapper);
  }

  Future<void> _onFetchCartDetails(FetchCartDetails event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      String? cartId = prefs.getString('cart_id');
      if (cartId != null && cartId.isNotEmpty) {
        final cart = await cartUseCase.fetchCartDetails(cartId);
        emit(state.copyWith(
          status: Status.success,
          cart: cart,
          cartItems: cart.items,
        ));
      } else {
        emit(state.copyWith(
          status: Status.failure,
          errorMessage: 'Cart ID not found.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: Status.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRemoveCartItems(RemoveCartItems event, Emitter emit) async {
    emit(state.copyWith(updateStatus: Status.loading));
    try {
      String? cartId = prefs.getString('cart_id');
      if (cartId != null && cartId.isNotEmpty) {
        final response = await cartUseCase.removeCartItem(cartId, event.cartItem.id ?? '');
        final updatedCartItems = state.cartItems.where((item) => item.id != event.cartItem.id).toList();

        final updatedCart = state.cart?.copyWith(
          subtotal: response.subtotal,
        );
        emit(state.copyWith(
          cart: updatedCart,
          cartItems: updatedCartItems,
          updateStatus: Status.success,
          voucher: null,
        ));
      }
    } on MyDioException catch (e) {
      emit(state.copyWith(
        errorMessage: e.errorMessage,
        updateStatus: Status.failure,
      ));
    }
  }

  Future<void> _onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) async {
    final updatedQuantity = List<CartItemEntity>.from(state.cartItems);
    final index = updatedQuantity.indexWhere((item) => item.id == event.cartItem.id);

    if (index != -1) {
      updatedQuantity[index] = updatedQuantity[index].copyWith(
        quantity: updatedQuantity[index].quantity! + 1,
      );
      emit(state.copyWith(cartItems: updatedQuantity));
      add(UpdateCartItemQuantity(updatedQuantity[index], updatedQuantity[index].quantity!));
    }
  }

  Future<void> _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) async {
    final updatedQuantity = List<CartItemEntity>.from(state.cartItems);
    final index = updatedQuantity.indexWhere((item) => item.id == event.cartItem.id);

    if (index != -1 && updatedQuantity[index].quantity! > 1) {
      updatedQuantity[index] = updatedQuantity[index].copyWith(
        quantity: updatedQuantity[index].quantity! - 1,
      );
      emit(state.copyWith(cartItems: updatedQuantity));
      add(UpdateCartItemQuantity(updatedQuantity[index], updatedQuantity[index].quantity!));
    }
  }

  Future<void> _onUpdateCartItemQuantity(UpdateCartItemQuantity event, Emitter<CartState> emit) async {
    emit(state.copyWith(checkDiscount: true));
    try {
      String? cartId = prefs.getString('cart_id');

      if (cartId != null && cartId.isNotEmpty) {
        final response = await cartUseCase.updateCartItem(cartId, event.cartItem.id ?? '', event.quantity);
        final updatedCartItems = List<CartItemEntity>.from(state.cartItems);
        final index = updatedCartItems.indexWhere((item) => item.id == event.cartItem.id);

        if (index != -1) {
          updatedCartItems[index] = updatedCartItems[index].copyWith(
            quantity: response.quantity,
            price: response.price,
          );
        }

        final updatedCart = state.cart!.copyWith(
          subtotal: response.subtotal,
        );

        emit(state.copyWith(
          cartItems: updatedCartItems,
          cart: updatedCart,
          updateStatus: Status.success,
          checkDiscount: false,
        ));
      }
    } on MyDioException catch (e) {
      emit(state.copyWith(
        errorMessage: e.errorMessage,
        updateStatus: Status.failure,
        checkDiscount: false,
      ));
    }
  }

  Future<void> _onFetchDiscounts(FetchDiscounts event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final discounts = await discountUseCase.fetchDiscounts();
      emit(state.copyWith(
        discounts: discounts.data,
        status: Status.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        status: Status.failure,
      ));
    }
  }

  Future<void> _onApplyVoucher(ApplyVoucher event, Emitter emit) async {
    emit(state.copyWith(updateStatus: Status.loading));
    try {
      String? cartId = prefs.getString('cart_id');
      if (cartId != null && cartId.isNotEmpty) {
        final response = await cartUseCase.applyVoucher(cartId, event.voucherCode);
        emit(state.copyWith(
          voucher: response,
          updateStatus: Status.success,
        ));
      }
    } on MyDioException catch (e) {
      emit(state.copyWith(
        errorMessage: e.errorMessage,
        updateStatus: Status.failure,
      ));
    }
  }

  Future<void> _onGetCheckOutToken(GetCheckOutToken event, Emitter emit) async {
    emit(state.copyWith(checkoutTokenStatus: Status.loading));
    try {
      String? cartId = prefs.getString('cart_id');
      if (cartId != null && cartId.isNotEmpty) {
        final response = await checkOutUseCase.getCheckOutTokenId(cartId);
        prefs.setString('checkout_token', response.id ?? '');
        emit(state.copyWith(
          tokenCheckOut: response,
          checkoutTokenStatus: Status.success,
        ));
      }
    } on MyDioException catch (e) {
      emit(state.copyWith(
        errorMessage: e.errorMessage,
        checkoutTokenStatus: Status.failure,
      ));
    }
  }

  void _onResetCart(ResetCart event, Emitter emit) async {
    emit(const CartState(
      status: Status.initial,
      updateStatus: Status.initial,
      voucherStatus: Status.initial,
      checkoutTokenStatus: Status.initial,
      cart: null,
      cartItems: [],
      discounts: [],
      errorMessage: null,
      checkDiscount: false,
      voucher: null,
      tokenCheckOut: null,
    ));
  }

  void _onResetVoucher(ResetVoucher event, Emitter emit) async {
    emit(state.copyWith(voucher: null));
  }
}
