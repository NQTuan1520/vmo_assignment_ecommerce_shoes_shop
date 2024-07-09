// ignore_for_file: override_on_non_overriding_member

import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_request_entity.dart';

part 'capture_order_request.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CaptureOrderRequest extends CaptureOrderRequestEntity {
  @override
  @JsonKey(name: 'shipping')
  final ShippingRequest? shipping;

  @override
  @JsonKey(name: 'customer')
  final CustomerRequest? customer;

  @override
  @JsonKey(name: 'fulfillment')
  final FulfillmentRequest? fulfillment;

  @override
  @JsonKey(name: 'payment')
  final PaymentRequest? payment;

  @override
  @JsonKey(name: 'line_items')
  final Map<String, LineItemsRequest>? lineItems;

  @override
  @JsonKey(name: 'meta')
  final String? meta;

  const CaptureOrderRequest({
    this.shipping,
    this.customer,
    this.fulfillment,
    this.payment,
    this.lineItems,
    this.meta,
  });

  factory CaptureOrderRequest.fromJson(Map<String, dynamic> json) => _$CaptureOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CaptureOrderRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ShippingRequest extends ShippingEntity {
  @override
  @JsonKey(name: 'name')
  final String? name;

  @override
  @JsonKey(name: 'street')
  final String? street;

  @override
  @JsonKey(name: 'town_city')
  final String? townCity;

  @override
  @JsonKey(name: 'county_state')
  final String? countyState;

  @override
  @JsonKey(name: 'postal_zip_code')
  final String? postalZipCode;

  @override
  @JsonKey(name: 'country')
  final String? country;

  const ShippingRequest({
    this.name,
    this.street,
    this.townCity,
    this.countyState,
    this.postalZipCode,
    this.country,
  });

  factory ShippingRequest.fromJson(Map<String, dynamic> json) => _$ShippingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CustomerRequest extends CustomerEntity {
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  @JsonKey(name: 'firstname')
  final String? firstName;

  @override
  @JsonKey(name: 'lastname')
  final String? lastName;

  @override
  @JsonKey(name: 'phone')
  final String? phone;

  const CustomerRequest({
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory CustomerRequest.fromJson(Map<String, dynamic> json) => _$CustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class FulfillmentRequest extends FulfillmentEntity {
  @override
  @JsonKey(name: 'shipping_method')
  final String? shippingMethod;

  const FulfillmentRequest({
    this.shippingMethod,
  });

  factory FulfillmentRequest.fromJson(Map<String, dynamic> json) => _$FulfillmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FulfillmentRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class PaymentRequest extends PaymentEntity {
  @override
  @JsonKey(name: 'gateway')
  final String? gateway;

  @override
  @JsonKey(name: 'card')
  final CardRequest? card;

  const PaymentRequest({
    this.gateway,
    this.card,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => _$PaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CardRequest extends CardEntity {
  @override
  @JsonKey(name: 'number')
  final String? number;

  @override
  @JsonKey(name: 'expiry_month')
  final String? expiryMonth;

  @override
  @JsonKey(name: 'expiry_year')
  final String? expiryYear;

  @override
  @JsonKey(name: 'cvc')
  final String? cvc;

  @override
  @JsonKey(name: 'postal_zip_code')
  final String? postalZipCode;

  const CardRequest({
    this.number,
    this.expiryMonth,
    this.expiryYear,
    this.cvc,
    this.postalZipCode,
  });

  factory CardRequest.fromJson(Map<String, dynamic> json) => _$CardRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CardRequestToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class LineItemsRequest extends LineItemsEntity {
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;

  @override
  @JsonKey(name: 'variants')
  final Map<String, String>? variants;

  const LineItemsRequest({
    this.quantity,
    this.variants,
  });

  factory LineItemsRequest.fromJson(Map<String, dynamic> json) => _$LineItemsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LineItemsRequestToJson(this);
}
