import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/get_token_check_out_entity.dart';

part 'get_token_id_check_out_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class GetTokenIdCheckOutResponse extends GetTokenCheckOutEntity {
  @override
  @JsonKey(name: 'cart_id')
  final String? cartId;

  @override
  @JsonKey(name: 'currency')
  final CurrencyResponse? currency;

  @override
  @JsonKey(name: 'subtotal')
  final SubTotalResponse? subTotal;

  @override
  @JsonKey(name: 'total')
  final TotalResponse? total;

  @override
  @JsonKey(name: 'conditionals')
  final ConditionalsResponse? conditionals;

  @override
  @JsonKey(name: 'collects')
  final CollectsResponse? collects;

  @override
  @JsonKey(name: 'has')
  final HasResponse? has;

  @override
  @JsonKey(name: 'line_items')
  final List<LineItemsResponse>? lineItems;

  @override
  @JsonKey(name: 'shipping_methods')
  final List<ShippingMethodsResponse>? shippingMethods;

  @override
  @JsonKey(name: 'discount')
  final DiscountResponse? discount;

  @override
  @JsonKey(name: 'gateways')
  final List<GateWaysResponse>? gateways;

  const GetTokenIdCheckOutResponse({
    super.id,
    this.cartId,
    this.currency,
    this.subTotal,
    this.total,
    this.conditionals,
    this.collects,
    this.has,
    this.lineItems,
    this.shippingMethods,
    this.discount,
    this.gateways,
  });

  factory GetTokenIdCheckOutResponse.fromJson(Map<String, dynamic> json) => _$GetTokenIdCheckOutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenIdCheckOutResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CurrencyResponse extends CurrencyEntity {
  @override
  @JsonKey(name: 'code')
  final String? code;

  @override
  @JsonKey(name: 'symbol')
  final String? symbol;

  const CurrencyResponse({
    this.code,
    this.symbol,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class SubTotalResponse extends SubTotalEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const SubTotalResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory SubTotalResponse.fromJson(Map<String, dynamic> json) => _$SubTotalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubTotalResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class TotalResponse extends TotalEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const TotalResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory TotalResponse.fromJson(Map<String, dynamic> json) => _$TotalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TotalResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ConditionalsResponse extends ConditionalsEntity {
  @override
  @JsonKey(name: 'collects_fullname')
  final bool? collectsFullName;

  @override
  @JsonKey(name: 'collects_shipping_address')
  final bool? collectsShippingAddress;

  @override
  @JsonKey(name: 'collects_billing_address')
  final bool? collectsBillingAddress;

  @override
  @JsonKey(name: 'has_physical_delivery')
  final bool? hasPhysicalDelivery;

  @override
  @JsonKey(name: 'has_digital_delivery')
  final bool? hasDigitalDelivery;

  @override
  @JsonKey(name: 'has_pay_what_you_want')
  final bool? hasPayWhatYouWant;

  @override
  @JsonKey(name: 'has_available_discounts')
  final bool? hasAvailableDiscounts;

  @override
  @JsonKey(name: 'collects_extra_fields')
  final bool? collectsExtraFields;

  @override
  @JsonKey(name: 'is_cart_free')
  final bool? isCartFree;

  const ConditionalsResponse({
    this.collectsFullName,
    this.collectsShippingAddress,
    this.collectsBillingAddress,
    this.hasPhysicalDelivery,
    this.hasDigitalDelivery,
    this.hasPayWhatYouWant,
    this.hasAvailableDiscounts,
    this.collectsExtraFields,
    this.isCartFree,
  });

  factory ConditionalsResponse.fromJson(Map<String, dynamic> json) => _$ConditionalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionalsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CollectsResponse extends CollectsEntity {
  @override
  @JsonKey(name: 'shipping_address')
  final bool? shippingAddress;

  @override
  @JsonKey(name: 'billing_address')
  final bool? billingAddress;

  @override
  @JsonKey(name: 'extra_fields')
  final bool? extraFields;

  const CollectsResponse({
    super.fullName,
    this.shippingAddress,
    this.billingAddress,
    this.extraFields,
  });

  factory CollectsResponse.fromJson(Map<String, dynamic> json) => _$CollectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class HasResponse extends HasEntity {
  @override
  @JsonKey(name: 'physical_delivery')
  final bool? physicalDelivery;

  @override
  @JsonKey(name: 'digital_delivery')
  final bool? digitalDelivery;

  @override
  @JsonKey(name: 'pay_what_you_want')
  final bool? payWhatYouWant;

  @override
  @JsonKey(name: 'available_discounts')
  final bool? availableDiscounts;

  const HasResponse({
    this.physicalDelivery,
    this.digitalDelivery,
    this.payWhatYouWant,
    this.availableDiscounts,
  });

  factory HasResponse.fromJson(Map<String, dynamic> json) => _$HasResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HasResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class LineItemsResponse extends LineItemEntity {
  @override
  @JsonKey(name: 'product_id')
  final String? productId;

  @override
  @JsonKey(name: 'product_name')
  final String? productName;

  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  @override
  @JsonKey(name: 'line_total')
  final LineTotalResponse? lineTotal;

  @override
  @JsonKey(name: 'is_valid')
  final bool? isValid;

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
    this.productName,
    super.quantity,
    this.price,
    this.lineTotal,
    this.isValid,
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

  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  const SelectedOptionsResponse({
    this.groupId,
    this.groupName,
    this.optionId,
    this.optionName,
    this.price,
  });

  factory SelectedOptionsResponse.fromJson(Map<String, dynamic> json) => _$SelectedOptionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedOptionsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ImageResponse extends ImageEntity {
  @override
  @JsonKey(name: 'file_size')
  final int? fileSize;

  @override
  @JsonKey(name: 'file_extension')
  final String? fileExtension;

  @override
  @JsonKey(name: 'image_dimensions')
  final ImageDimensionsResponse? imageDimensions;

  const ImageResponse({
    super.id,
    super.url,
    super.filename,
    this.fileSize,
    this.fileExtension,
    this.imageDimensions,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ImageDimensionsResponse extends ImageDimensionsEntity {
  const ImageDimensionsResponse({
    super.width,
    super.height,
  });

  factory ImageDimensionsResponse.fromJson(Map<String, dynamic> json) => _$ImageDimensionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDimensionsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ShippingMethodsResponse extends ShippingMethodsEntity {
  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  const ShippingMethodsResponse({
    super.id,
    super.description,
    super.provider,
    this.price,
  });

  factory ShippingMethodsResponse.fromJson(Map<String, dynamic> json) => _$ShippingMethodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingMethodsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class DiscountResponse extends DiscountEntity {
  @override
  @JsonKey(name: 'amount_saved')
  final AmountSavedResponse? amountSaved;

  @override
  @JsonKey(name: 'product_ids')
  final List<String>? productId;

  const DiscountResponse({
    super.type,
    super.code,
    super.value,
    this.amountSaved,
    this.productId,
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
class GateWaysResponse extends GateWaysEntity {
  @override
  @JsonKey(name: 'config')
  final List<dynamic>? config;

  const GateWaysResponse({
    super.id,
    super.code,
    super.sandbox,
    this.config,
  });

  factory GateWaysResponse.fromJson(Map<String, dynamic> json) => _$GateWaysResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GateWaysResponseToJson(this);
}
