import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/response/get_categories_data_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/response/get_categories_meta_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

part 'categories_api_service.g.dart';

@RestApi()
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio, {String baseUrl}) = _CategoriesApiService;

  @GET("/categories")
  Future<BaseResponse<List<GetCategoriesDataResponse>, List<GetCategoriesMetaResponse>>> getCategories();
}