import 'package:dio/dio.dart';

import '../../../../domain/cart/discount/repository/discount_repository.dart';
import '../../../../managers/base_response/base_response.dart';
import '../../../../managers/dio/dio_exception.dart';
import '../api/discount_api_service.dart';
import '../response/discount_response.dart';

class DiscountRepositoryImpl implements DiscountRepository {
  final DiscountApiService apiService;

  DiscountRepositoryImpl(this.apiService);

  @override
  Future<BaseResponse<List<DiscountDataResponse>, List<DiscountMetaResponse>>> fetchDiscounts() async {
    try {
      final response = await apiService.fetchDiscounts();
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }
}
