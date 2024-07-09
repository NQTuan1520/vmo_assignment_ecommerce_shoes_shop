import 'package:dio/dio.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/order/api/order_api_service.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/order/response/order_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_exception.dart';

import '../../../domain/order/repository/order_repository.dart';
import '../../../managers/base_response/base_response.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApiService orderApiService;

  OrderRepositoryImpl(this.orderApiService);

  @override
  Future<BaseResponse<List<OrderDataResponse>, List<OrderMetaResponse>>> getOrder() {
    try {
      final response = orderApiService.getOrder();
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }
}
