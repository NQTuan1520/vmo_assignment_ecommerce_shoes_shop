import '../entity/cart_entity.dart';

abstract class CartRepository {
  Future<CartEntity> createCart();
  Future<CartEntity> addToCart(String cartId, CartItemEntity cartItem);
  Future<CartEntity> fetchCartDetails(String cartId);
  Future<UpdateCartItemRequestEntity> updateCartItem(String cartId, String itemId, int quantity);
  Future<RemoveCartItemEntity> removeCartItem(String cartId, String itemId);
  Future<UpdateCartDiscountEntity> applyVoucher(String cartId, String voucherCode);
}
