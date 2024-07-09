import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/cart_details/entity/cart_entity.dart';

part 'update_cart_discount_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class UpdateCartDiscountResponse extends UpdateCartDiscountEntity {
  @override
  @JsonKey(name: 'total_items')
  final int? totalItems;

  @override
  @JsonKey(name: 'total_unique_items')
  final int? totalUniqueItems;

  @override
  @JsonKey(name: 'line_items')
  final List<CartItemResponse>? items;

  @override
  @JsonKey(name: 'currency')
  final CurrencyResponse? currency;

  @override
  @JsonKey(name: 'subtotal')
  final SubTotalResponse? subtotal;

  @override
  @JsonKey(name: 'discount')
  final DiscountResponse? discount;

  const UpdateCartDiscountResponse({
    super.id,
    this.currency,
    this.totalItems,
    this.totalUniqueItems,
    this.items,
    this.subtotal,
    this.discount,
  });

  factory UpdateCartDiscountResponse.fromJson(Map<String, dynamic> json) => _$UpdateCartDiscountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartDiscountResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CartItemResponse extends CartItemEntity {
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
  @JsonKey(name: 'image')
  final ImageResponse? image;

  @override
  @JsonKey(name: 'selected_options')
  final List<SelectedOptionsResponse>? selectedOptions;

  const CartItemResponse({
    super.id,
    this.productId,
    super.name,
    super.quantity,
    this.price,
    this.lineTotal,
    this.image,
    this.selectedOptions,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) => _$CartItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemResponseToJson(this);
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
class CurrencyResponse extends CurrencyEntity {
  const CurrencyResponse({
    super.code,
    super.symbol,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
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
class ImageResponse extends ImageEntity {
  @override
  @JsonKey(name: 'is_image')
  final bool? isImage;

  @override
  @JsonKey(name: 'file_size')
  final int? fileSize;

  @override
  @JsonKey(name: 'file_extension')
  final String? fileExtension;

  @override
  @JsonKey(name: 'image_dimensions')
  final ImageDimensionsResponse? imageDimensions;

  @override
  @JsonKey(name: 'created_at')
  final int? createdAt;

  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  const ImageResponse({
    super.id,
    super.url,
    super.description,
    this.isImage,
    super.filename,
    this.fileSize,
    this.fileExtension,
    this.imageDimensions,
    super.meta,
    this.createdAt,
    this.updatedAt,
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
