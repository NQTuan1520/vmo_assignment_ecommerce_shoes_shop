import 'package:dio/dio.dart';

import '../../../../domain/cart/cart_details/entity/cart_entity.dart';
import '../../../../domain/cart/cart_details/repository/cart_repository.dart';
import '../../../../managers/dio/dio_exception.dart';
import '../api/cart_api_service.dart';
import '../request/add_to_cart_request.dart';
import '../response/cart_response.dart';
import '../response/update_cart_item_response.dart';

class CartRepositoryImpl implements CartRepository {
  final CartApiService apiService;

  CartRepositoryImpl(this.apiService);

  @override
  Future<CartResponse> createCart() async {
    try {
      final response = await apiService.createCart();
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<CartResponse> addToCart(String cartId, CartItemEntity cartItem) async {
    try {
      final request = AddToCartRequest(
        id: cartItem.productId ?? '',
        quantity: cartItem.quantity ?? 1,
        options: cartItem.optionsMap,
      );
      final response = await apiService.addToCart(cartId, request);
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<CartResponse> fetchCartDetails(String cartId) async {
    try {
      final response = await apiService.fetchCartDetails(cartId);
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<UpdateCartItemResponse> updateCartItem(String cartId, String itemId, int quantity) async {
    try {
      final response = await apiService.updateCartItem(cartId, itemId, {'quantity': quantity});
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<RemoveCartItemEntity> removeCartItem(String cartId, String itemId) async {
    try {
      final response = await apiService.removeCartItem(cartId, itemId);
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<UpdateCartDiscountEntity> applyVoucher(String cartId, String voucherCode) async {
    try {
      final response = await apiService.applyVoucher(cartId, {"discount_code": voucherCode});
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }
}
