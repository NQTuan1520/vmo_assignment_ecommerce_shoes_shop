import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/cart/cart_details/entity/cart_entity.dart';

part 'update_cart_item_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class UpdateCartItemResponse extends UpdateCartItemRequestEntity {
  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  @override
  @JsonKey(name: 'subtotal')
  final SubtotalResponse? subtotal;

  const UpdateCartItemResponse({
    super.id,
    super.quantity,
    this.price,
    this.subtotal,
  });

  factory UpdateCartItemResponse.fromJson(Map<String, dynamic> json) => _$UpdateCartItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateCartItemResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class SubtotalResponse extends SubTotalEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const SubtotalResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory SubtotalResponse.fromJson(Map<String, dynamic> json) => _$SubtotalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubtotalResponseToJson(this);
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
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory PriceResponse.fromJson(Map<String, dynamic> json) => _$PriceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PriceResponseToJson(this);
}
