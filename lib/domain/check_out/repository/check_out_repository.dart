import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_request_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_response_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/get_token_check_out_entity.dart';

abstract class CheckOutRepository {
  Future<GetTokenCheckOutEntity> getCheckOutTokenId(String cartId);
  Future<CaptureOrderResponseEntity> captureOrder(String tokenId, CaptureOrderRequestEntity orderRequest);
}
