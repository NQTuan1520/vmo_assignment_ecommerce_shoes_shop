import '../entity/cart_entity.dart';
import '../repository/cart_repository.dart';

class CartUseCase {
  final CartRepository repository;

  CartUseCase(this.repository);

  Future<CartEntity> createCart() async {
    return await repository.createCart();
  }

  Future<CartEntity> addToCart(String cartId, CartItemEntity cartItem) async {
    return await repository.addToCart(cartId, cartItem);
  }

  Future<CartEntity> fetchCartDetails(String cartId) async {
    return await repository.fetchCartDetails(cartId);
  }

  Future<UpdateCartItemRequestEntity> updateCartItem(String cartId, String itemId, int quantity) async {
    return await repository.updateCartItem(cartId, itemId, quantity);
  }

  Future<RemoveCartItemEntity> removeCartItem(String cartId, String itemId) async {
    return await repository.removeCartItem(cartId, itemId);
  }

  Future<UpdateCartDiscountEntity> applyVoucher(String cartId, String voucherCode) async {
    return await repository.applyVoucher(cartId, voucherCode);
  }
}
