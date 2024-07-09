import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/order/response/order_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

part 'order_api_service.g.dart';

@RestApi()
abstract class OrderApiService {
  factory OrderApiService(Dio dio, {String baseUrl}) = _OrderApiService;

  @GET("/orders")
  Future<BaseResponse<List<OrderDataResponse>, List<OrderMetaResponse>>> getOrder();
}
