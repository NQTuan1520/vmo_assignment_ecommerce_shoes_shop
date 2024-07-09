import 'package:dio/dio.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_request_entity.dart';

import '../../../domain/check_out/repository/check_out_repository.dart';
import '../../../managers/dio/dio_exception.dart';
import '../api/check_out_api_service.dart';
import '../request/capture_order_request.dart';
import '../response/capture_order_response.dart';
import '../response/get_token_id_check_out_response.dart';

class CheckOutRepositoryImpl implements CheckOutRepository {
  final CheckOutApiService _checkOutApiService;

  CheckOutRepositoryImpl(this._checkOutApiService);

  @override
  Future<GetTokenIdCheckOutResponse> getCheckOutTokenId(String cartId) async {
    try {
      return _checkOutApiService.getCheckOutTokenId(cartId);
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<CaptureOrderResponse> captureOrder(String tokenId, CaptureOrderRequestEntity orderRequest) async {
    try {
      final request = CaptureOrderRequest(
        shipping: ShippingRequest(
          name: orderRequest.shipping?.name,
          street: orderRequest.shipping?.street,
          townCity: orderRequest.shipping?.townCity,
          countyState: orderRequest.shipping?.countyState,
          postalZipCode: orderRequest.shipping?.postalZipCode,
          country: orderRequest.shipping?.country,
        ),
        customer: CustomerRequest(
          email: orderRequest.customer?.email,
          firstName: orderRequest.customer?.firstName,
          lastName: orderRequest.customer?.lastName,
          phone: orderRequest.customer?.phone,
        ),
        fulfillment: FulfillmentRequest(
          shippingMethod: orderRequest.fulfillment?.shippingMethod,
        ),
        payment: PaymentRequest(
          gateway: orderRequest.payment?.gateway,
          card: CardRequest(
            number: orderRequest.payment?.card?.number,
            expiryMonth: orderRequest.payment?.card?.expiryMonth,
            expiryYear: orderRequest.payment?.card?.expiryYear,
            cvc: orderRequest.payment?.card?.cvc,
            postalZipCode: orderRequest.payment?.card?.postalZipCode,
          ),
        ),
        lineItems: {
          for (var item in orderRequest.lineItems?.entries ?? <MapEntry<String, LineItemsEntity>>[])
            item.key: LineItemsRequest(
              quantity: item.value.quantity,
              variants: {
                for (var option in item.value.variants!.entries) option.key: option.value,
              },
            ),
        },
      );

      final response = await _checkOutApiService.captureOrder(tokenId, request);
      return response;
    } on DioException catch (dioError) {
      throw MyDioException.fromDioError(dioError);
    } catch (e) {
      throw MyDioException("An unexpected error occurred. Please try again later.");
    }
  }
}
