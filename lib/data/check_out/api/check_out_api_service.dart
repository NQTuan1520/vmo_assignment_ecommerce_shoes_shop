import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/check_out/request/capture_order_request.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/check_out/response/capture_order_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/check_out/response/get_token_id_check_out_response.dart';

part 'check_out_api_service.g.dart';

@RestApi()
abstract class CheckOutApiService {
  factory CheckOutApiService(Dio dio, {String baseUrl}) = _CheckOutApiService;

  @GET("/checkouts/{cartId}?type=cart")
  Future<GetTokenIdCheckOutResponse> getCheckOutTokenId(
    @Path("cartId") String cartId,
  );

  @POST("/checkouts/{checkoutTokenId}")
  Future<CaptureOrderResponse> captureOrder(
    @Path("checkoutTokenId") String checkoutTokenId,
    @Body() CaptureOrderRequest orderRequest,
  );
}
