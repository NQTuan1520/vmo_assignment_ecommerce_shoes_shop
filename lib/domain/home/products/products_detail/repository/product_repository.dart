import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_detail_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

import '../entity/product_data_entity.dart';
import '../entity/product_meta_entity.dart';

abstract class ProductRepository {
  Future<BaseResponse<List<ProductDataEntity>, List<ProductMetaEntity>>> getProducts();

  Future<ProductDetailEntity> getProductDetails(String productId);

  Future<ProductDataEntity> addFavouriteProduct(String uid, ProductDataEntity productId);

  Future<ProductDataEntity> removeFavouriteProduct(String uid, String productId);

  Future<List<ProductDataEntity>> getFavouriteProducts(String uid);

  Future<BaseResponse<List<ProductDataEntity>, List<ProductMetaEntity>>> searchProducts(String query);
}
