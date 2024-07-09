import 'package:dio/dio.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/api/categories_api_service.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/response/get_categories_data_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/response/get_categories_meta_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/repository/category_repository.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_exception.dart';

class CategoriesRepositoryImpl implements CategoryRepository {
  final CategoriesApiService _categoriesApiService;

  CategoriesRepositoryImpl(this._categoriesApiService);

  @override
  Future<BaseResponse<List<GetCategoriesDataResponse>, List<GetCategoriesMetaResponse>>> getCategories() async {
    try {
      final response = await _categoriesApiService.getCategories();
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }
}
