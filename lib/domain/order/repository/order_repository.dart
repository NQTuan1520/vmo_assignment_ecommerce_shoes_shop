import 'package:vmo_assignment_ecommerce_shoes_shop/domain/order/entity/order_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

abstract class OrderRepository {
  Future<BaseResponse<List<OrderDataEntity>, List<OrderMetaEntity>>> getOrder();
}
