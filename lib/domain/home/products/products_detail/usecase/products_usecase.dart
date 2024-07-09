import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

import '../entity/product_data_entity.dart';
import '../entity/product_detail_entity.dart';
import '../entity/product_meta_entity.dart';
import '../repository/product_repository.dart';

class ProductsUseCase {
  final ProductRepository repository;

  ProductsUseCase(this.repository);

  Future<BaseResponse<List<ProductDataEntity>, List<ProductMetaEntity>>> getProducts() async {
    return await repository.getProducts();
  }

  Future<ProductDetailEntity> getProductDetails(String productId) async {
    return await repository.getProductDetails(productId);
  }

  Future<ProductDataEntity> addFavouriteProduct(String uid, ProductDataEntity productId) async {
    return await repository.addFavouriteProduct(uid, productId);
  }

  Future<ProductDataEntity> removeFavouriteProduct(String uid, String productId) async {
    return await repository.removeFavouriteProduct(uid, productId);
  }

  Future<List<ProductDataEntity>> getFavouriteProducts(String uid) async {
    return await repository.getFavouriteProducts(uid);
  }

  Future<BaseResponse<List<ProductDataEntity>, List<ProductMetaEntity>>> searchProducts(String query) async {
    return await repository.searchProducts(query);
  }
}
