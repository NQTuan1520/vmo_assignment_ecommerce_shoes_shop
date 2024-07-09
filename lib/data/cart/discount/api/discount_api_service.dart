import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../managers/base_response/base_response.dart';
import '../response/discount_response.dart';

part 'discount_api_service.g.dart';

@RestApi()
abstract class DiscountApiService {
  factory DiscountApiService(Dio dio, {String baseUrl}) = _DiscountApiService;

  @GET("/discounts")
  Future<BaseResponse<List<DiscountDataResponse>, List<DiscountMetaResponse>>> fetchDiscounts();
}
