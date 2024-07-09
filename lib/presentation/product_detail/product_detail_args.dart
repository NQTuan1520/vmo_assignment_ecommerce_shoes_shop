import '../../domain/home/products/products_detail/entity/product_data_entity.dart';

class ProductDetailArgs {
  final ProductDataEntity product;
  final bool showBottomSheet;

  ProductDetailArgs({required this.product, this.showBottomSheet = false});
}
