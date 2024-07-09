import '../../../managers/base_response/base_response.dart';
import '../entity/order_entity.dart';
import '../repository/order_repository.dart';

class OrderUseCase {
  final OrderRepository _orderRepository;

  OrderUseCase(this._orderRepository);

  Future<BaseResponse<List<OrderDataEntity>, List<OrderMetaEntity>>> getOrder() {
    return _orderRepository.getOrder();
  }
}
