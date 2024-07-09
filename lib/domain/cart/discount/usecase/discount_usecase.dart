import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/discount/entity/discount_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/discount/repository/discount_repository.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

class DiscountUseCase {
  final DiscountRepository repository;

  DiscountUseCase(this.repository);

  Future<BaseResponse<List<DiscountDataEntity>, List<DiscountMetaEntity>>> fetchDiscounts() async {
    return await repository.fetchDiscounts();
  }
}
