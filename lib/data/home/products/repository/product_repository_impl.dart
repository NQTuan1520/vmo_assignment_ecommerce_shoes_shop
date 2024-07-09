import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/products/api/products_api_service.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/products/response/get_products_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_exception.dart';

import '../../../../domain/home/products/products_detail/repository/product_repository.dart';
import '../response/get_product_details_response.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsApiService apiService;

  final FirebaseFirestore firestore;

  ProductRepositoryImpl(this.apiService, this.firestore);

  @override
  Future<BaseResponse<List<GetProductsDataResponse>, List<GetProductsMetaResponse>>> getProducts() async {
    try {
      final response = await apiService.getProducts();
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<GetProductDetailsResponse> getProductDetails(String productId) async {
    try {
      final response = await apiService.getProductDetails(productId);
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<ProductDataEntity> addFavouriteProduct(String uid, ProductDataEntity product) async {
    try {
      final productModel = GetProductsDataResponse.fromEntity(product);
      await firestore.collection('buyers').doc(uid).collection('favorites').doc(product.id).set(productModel.toJson());
      return product;
    } catch (e) {
      throw Exception("Failed to add favorite: ${e.toString()}");
    }
  }

  @override
  Future<ProductDataEntity> removeFavouriteProduct(String uid, String productId) async {
    try {
      await firestore.collection('buyers').doc(uid).collection('favorites').doc(productId).delete();
      return ProductDataEntity(id: productId);
    } catch (e) {
      throw Exception("Failed to remove favorite: ${e.toString()}");
    }
  }

  @override
  Future<List<ProductDataEntity>> getFavouriteProducts(String uid) async {
    try {
      final querySnapshot = await firestore.collection('buyers').doc(uid).collection('favorites').get();
      return querySnapshot.docs.map((doc) => GetProductsDataResponse.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception("Failed to get favorites: ${e.toString()}");
    }
  }

  @override
  Future<BaseResponse<List<GetProductsDataResponse>, List<GetProductsMetaResponse>>> searchProducts(
      String query) async {
    try {
      final response = await apiService.searchProducts(query);
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }
}
