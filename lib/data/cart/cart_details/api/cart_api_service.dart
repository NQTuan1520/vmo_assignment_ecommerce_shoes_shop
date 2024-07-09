import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/cart/cart_details/response/update_cart_discount_response.dart';

import '../request/add_to_cart_request.dart';
import '../response/cart_response.dart';
import '../response/remove_cart_item_response.dart';
import '../response/update_cart_item_response.dart';

part 'cart_api_service.g.dart';

@RestApi()
abstract class CartApiService {
  factory CartApiService(Dio dio, {String baseUrl}) = _CartApiService;

  @GET("/carts")
  Future<CartResponse> createCart();

  @POST("/carts/{cartId}")
  Future<CartResponse> addToCart(
    @Path("cartId") String cartId,
    @Body() AddToCartRequest request,
  );

  @GET("/carts/{cartId}")
  Future<CartResponse> fetchCartDetails(@Path("cartId") String cartId);

  @PUT("/carts/{cartId}/items/{itemId}")
  Future<UpdateCartItemResponse> updateCartItem(
    @Path("cartId") String cartId,
    @Path("itemId") String itemId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE("/carts/{cartId}/items/{itemId}")
  Future<RemoveCartItemResponse> removeCartItem(
    @Path("cartId") String cartId,
    @Path("itemId") String itemId,
  );

  @PUT("/carts/{cartId}")
  Future<UpdateCartDiscountResponse> applyVoucher(
    @Path("cartId") String cartId,
    @Body() Map<String, dynamic> body,
  );
}
