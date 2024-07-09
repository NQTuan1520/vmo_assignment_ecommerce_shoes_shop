import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_response_entity.dart';

part 'capture_order_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CaptureOrderResponse extends CaptureOrderResponseEntity {
  @override
  @JsonKey(name: 'checkout_token_id')
  final String? checkoutTokenId;

  @override
  @JsonKey(name: 'cart_id')
  final String? cartId;

  @override
  @JsonKey(name: 'customer_reference')
  final String? customerReference;

  @override
  @JsonKey(name: 'status_payment')
  final String? statusPayment;

  @override
  @JsonKey(name: 'status_fulfillment')
  final String? statusFulfillment;

  @override
  @JsonKey(name: 'currency')
  final CurrencyResponse? currency;

  @override
  @JsonKey(name: 'order_value')
  final OrderValueResponse? orderValue;

  @override
  @JsonKey(name: 'conditionals')
  final ConditionalsResponse? conditionals;

  @override
  @JsonKey(name: 'collected')
  final CollectedResponse? collected;

  @override
  @JsonKey(name: 'has')
  final HasResponse? has;

  @override
  @JsonKey(name: 'order')
  final OrderResponse? order;

  @override
  @JsonKey(name: 'shipping')
  final ShippingResponse? shipping;

  @override
  @JsonKey(name: 'transactions')
  final List<TransactionsResponse>? transactions;

  @override
  @JsonKey(name: 'customer')
  final CustomerResponse? customer;

  @override
  @JsonKey(name: 'client_details')
  final ClientDetailsResponse? clientDetails;

  const CaptureOrderResponse({
    super.version,
    super.sandbox,
    super.id,
    this.checkoutTokenId,
    this.cartId,
    this.customerReference,
    super.created,
    super.status,
    this.statusPayment,
    this.statusFulfillment,
    this.currency,
    this.orderValue,
    this.conditionals,
    this.collected,
    this.has,
    this.order,
    this.shipping,
    this.transactions,
    this.customer,
    this.clientDetails,
  });

  factory CaptureOrderResponse.fromJson(Map<String, dynamic> json) => _$CaptureOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CaptureOrderResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CurrencyResponse extends CurrencyEntity {
  const CurrencyResponse({
    super.code,
    super.symbol,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class OrderValueResponse extends OrderValueEntity {
  const OrderValueResponse({
    super.raw,
    super.formatted,
    super.formattedWithCode,
    super.formattedWithSymbol,
  });

  factory OrderValueResponse.fromJson(Map<String, dynamic> json) => _$OrderValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderValueResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ConditionalsResponse extends ConditionalsEntity {
  const ConditionalsResponse({
    super.collectsFullName,
    super.collectsShippingAddress,
    super.hasPhysicalFulfillment,
  });

  factory ConditionalsResponse.fromJson(Map<String, dynamic> json) => _$ConditionalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionalsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CollectedResponse extends CollectedEntity {
  const CollectedResponse({
    super.fullName,
    super.shippingAddress,
  });

  factory CollectedResponse.fromJson(Map<String, dynamic> json) => _$CollectedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectedResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class HasResponse extends HasEntity {
  const HasResponse({
    super.physicalFulfillment,
  });

  factory HasResponse.fromJson(Map<String, dynamic> json) => _$HasResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HasResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class OrderResponse extends OrderEntity {
  @override
  @JsonKey(name: 'subtotal')
  final SubTotalResponse? subtotal;

  @override
  @JsonKey(name: 'total')
  final TotalResponse? total;

  @override
  @JsonKey(name: 'shipping')
  final ShippingOrderResponse? shipping;

  @override
  @JsonKey(name: 'line_items')
  final List<LineItemsResponse>? lineItems;

  @override
  @JsonKey(name: 'discount')
  final DiscountResponse? discount;

  const OrderResponse({
    this.subtotal,
    this.total,
    this.shipping,
    this.lineItems,
    this.discount,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class SubTotalResponse extends SubTotalEntity {
  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  const SubTotalResponse({
    super.raw,
    super.formatted,
    this.formattedWithCode,
    this.formattedWithSymbol,
  });

  factory SubTotalResponse.fromJson(Map<String, dynamic> json) => _$SubTotalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubTotalResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class TotalResponse extends TotalEntity {
  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  const TotalResponse({
    this.formattedWithCode,
    this.formattedWithSymbol,
  });

  factory TotalResponse.fromJson(Map<String, dynamic> json) => _$TotalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ShippingOrderResponse extends ShippingOrderEntity {
  const ShippingOrderResponse({
    super.id,
    super.description,
    super.provider,
  });

  factory ShippingOrderResponse.fromJson(Map<String, dynamic> json) => _$ShippingOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingOrderResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class LineItemsResponse extends LineItemsEntity {
  @override
  @JsonKey(name: 'product_id')
  final String? productId;

  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  @override
  @JsonKey(name: 'line_total')
  final LineTotalResponse? lineTotal;

  @override
  @JsonKey(name: 'selected_options')
  final List<SelectedOptionsResponse>? selectedOptions;

  @override
  @JsonKey(name: 'image')
  final ImageResponse? image;

  const LineItemsResponse({
    super.id,
    this.productId,
    super.name,
    super.quantity,
    this.price,
    this.lineTotal,
    this.selectedOptions,
    this.image,
  });

  factory LineItemsResponse.fromJson(Map<String, dynamic> json) => _$LineItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LineItemsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class PriceResponse extends PriceEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const PriceResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory PriceResponse.fromJson(Map<String, dynamic> json) => _$PriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PriceResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class LineTotalResponse extends LineTotalEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const LineTotalResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory LineTotalResponse.fromJson(Map<String, dynamic> json) => _$LineTotalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LineTotalResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class SelectedOptionsResponse extends SelectedOptionsEntity {
  @override
  @JsonKey(name: 'group_id')
  final String? groupId;

  @override
  @JsonKey(name: 'group_name')
  final String? groupName;

  @override
  @JsonKey(name: 'option_id')
  final String? optionId;

  @override
  @JsonKey(name: 'option_name')
  final String? optionName;

  const SelectedOptionsResponse({
    this.groupId,
    this.groupName,
    this.optionId,
    this.optionName,
  });

  factory SelectedOptionsResponse.fromJson(Map<String, dynamic> json) => _$SelectedOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedOptionsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ImageResponse extends ImageEntity {
  const ImageResponse({
    super.id,
    super.url,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class DiscountResponse extends DiscountEntity {
  @override
  @JsonKey(name: 'discount')
  final AmountSavedResponse? amountSaved;

  const DiscountResponse({
    super.type,
    super.code,
    super.value,
    this.amountSaved,
  });

  factory DiscountResponse.fromJson(Map<String, dynamic> json) => _$DiscountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class AmountSavedResponse extends AmountSavedEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const AmountSavedResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory AmountSavedResponse.fromJson(Map<String, dynamic> json) => _$AmountSavedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AmountSavedResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ShippingResponse extends ShippingEntity {
  @override
  @JsonKey(name: 'town_city')
  final String? townCity;

  @override
  @JsonKey(name: 'county_state')
  final String? countyState;

  @override
  @JsonKey(name: 'postal_zip_code')
  final String? postalZipCode;

  const ShippingResponse({
    super.id,
    super.name,
    super.street,
    this.townCity,
    this.countyState,
    this.postalZipCode,
    super.country,
  });

  factory ShippingResponse.fromJson(Map<String, dynamic> json) => _$ShippingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class TransactionsResponse extends TransactionsEntity {
  @override
  @JsonKey(name: 'gateway_transaction_id')
  final String? gatewayTransactionId;

  @override
  @JsonKey(name: 'gateway_reference')
  final String? gatewayReference;

  const TransactionsResponse({
    super.id,
    super.gateway,
    this.gatewayTransactionId,
    this.gatewayReference,
  });

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) => _$TransactionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CustomerResponse extends CustomerEntity {
  const CustomerResponse({
    super.id,
    super.email,
    super.firstName,
    super.lastName,
    super.phone,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ClientDetailsResponse extends ClientDetailsEntity {
  @override
  @JsonKey(name: 'country_code')
  final String? countryCode;

  @override
  @JsonKey(name: 'country_name')
  final String? countryName;

  @override
  @JsonKey(name: 'region_code')
  final String? regionCode;

  @override
  @JsonKey(name: 'region_name')
  final String? regionName;

  const ClientDetailsResponse({
    this.countryCode,
    this.countryName,
    this.regionCode,
    this.regionName,
  });

  factory ClientDetailsResponse.fromJson(Map<String, dynamic> json) => _$ClientDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientDetailsResponseToJson(this);
}
