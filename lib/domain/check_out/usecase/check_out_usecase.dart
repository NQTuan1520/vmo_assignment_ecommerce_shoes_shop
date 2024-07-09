import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_request_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_response_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/get_token_check_out_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/repository/check_out_repository.dart';

class CheckOutUseCase {
  final CheckOutRepository repository;

  CheckOutUseCase(this.repository);

  Future<GetTokenCheckOutEntity> getCheckOutTokenId(String cartId) async {
    return repository.getCheckOutTokenId(cartId);
  }

  Future<CaptureOrderResponseEntity> captureOrder(String tokenId, CaptureOrderRequestEntity orderRequest) async {
    return repository.captureOrder(tokenId, orderRequest);
  }
}
