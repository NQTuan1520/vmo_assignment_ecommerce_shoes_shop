import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/products/response/get_products_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

import '../response/get_product_details_response.dart';

part 'products_api_service.g.dart';

@RestApi()
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String baseUrl}) = _ProductsApiService;

  @GET("/products")
  Future<BaseResponse<List<GetProductsDataResponse>, List<GetProductsMetaResponse>>> getProducts();

  @GET("/products/{id}")
  Future<GetProductDetailsResponse> getProductDetails(@Path("id") String id);

  @GET("/products")
  Future<BaseResponse<List<GetProductsDataResponse>, List<GetProductsMetaResponse>>> searchProducts(
      @Query("query") String query);
}
