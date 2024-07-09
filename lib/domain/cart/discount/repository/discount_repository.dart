import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/discount/entity/discount_entity.dart';

import '../../../../managers/base_response/base_response.dart';

abstract class DiscountRepository {
  Future<BaseResponse<List<DiscountDataEntity>, List<DiscountMetaEntity>>> fetchDiscounts();
}
