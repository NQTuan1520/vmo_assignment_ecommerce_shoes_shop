import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_detail_entity.dart';

part 'get_product_details_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class GetProductDetailsResponse extends ProductDetailEntity {
  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  @override
  @JsonKey(name: 'inventory')
  final InventoryResponse? inventory;

  @override
  @JsonKey(name: 'image')
  final ImageResponse? image;

  @override
  @JsonKey(name: 'categories')
  final List<CategoriesResponse>? categories;

  @override
  @JsonKey(name: 'variant_groups')
  final List<VariantGroupsResponse>? variantGroups;

  @override
  @JsonKey(name: 'assets')
  final List<AssetsResponse>? assets;

  @override
  @JsonKey(name: 'related_products')
  final List<RelatedProductsResponse>? relatedProducts;

  @override
  @JsonKey(name: 'fulfillment')
  final FulfillmentResponse? fulfillment;

  const GetProductDetailsResponse({
    super.id,
    this.price,
    this.inventory,
    this.image,
    this.categories,
    this.variantGroups,
    this.assets,
    this.relatedProducts,
    this.fulfillment,
  });

  factory GetProductDetailsResponse.fromJson(Map<String, dynamic> json) => _$GetProductDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductDetailsResponseToJson(this);
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
class InventoryResponse extends InventoryEntity {
  const InventoryResponse({
    super.managed,
    super.available,
  });

  factory InventoryResponse.fromJson(Map<String, dynamic> json) => _$InventoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryResponseToJson(this);
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
class CategoriesResponse extends CategoriesEntity {
  const CategoriesResponse({
    super.id,
    super.slug,
    super.name,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class VariantGroupsResponse extends VariantGroupsEntity {
  @override
  @JsonKey(name: 'options')
  final List<VariantOptionResponse>? options;

  const VariantGroupsResponse({
    super.id,
    super.name,
    this.options,
  });

  factory VariantGroupsResponse.fromJson(Map<String, dynamic> json) => _$VariantGroupsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VariantGroupsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class VariantOptionResponse extends VariantOptionEntity {
  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  @override
  @JsonKey(name: 'assets')
  final List<String>? assets;

  const VariantOptionResponse({
    super.id,
    super.name,
    this.price,
    this.assets,
  });

  factory VariantOptionResponse.fromJson(Map<String, dynamic> json) => _$VariantOptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VariantOptionResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class AssetsResponse extends AssetsProductEntity {
  @override
  @JsonKey(name: 'image_dimensions')
  final ImageDimensionsResponse? imageDimensions;

  const AssetsResponse({
    super.id,
    super.url,
    this.imageDimensions,
  });

  factory AssetsResponse.fromJson(Map<String, dynamic> json) => _$AssetsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class RelatedProductsResponse extends RelatedProductsEntity {
  @override
  @JsonKey(name: 'price')
  final PriceResponse? price;

  @override
  @JsonKey(name: 'image')
  final ImageResponse? image;

  const RelatedProductsResponse({
    super.id,
    super.name,
    this.price,
    this.image,
  });

  factory RelatedProductsResponse.fromJson(Map<String, dynamic> json) => _$RelatedProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedProductsResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class FulfillmentResponse extends FulfillmentEntity {
  @override
  @JsonKey(name: 'physical')
  final List<PhysicalResponse>? physical;

  const FulfillmentResponse({
    this.physical,
  });

  factory FulfillmentResponse.fromJson(Map<String, dynamic> json) => _$FulfillmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FulfillmentResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class PhysicalResponse extends PhysicalEntity {
  @override
  @JsonKey(name: 'zone_id')
  final String? zoneId;

  @override
  @JsonKey(name: 'on_own')
  final OnOwnResponse? onOwn;

  const PhysicalResponse({
    this.zoneId,
    this.onOwn,
  });

  factory PhysicalResponse.fromJson(Map<String, dynamic> json) => _$PhysicalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhysicalResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class OnOwnResponse extends OnOwnEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const OnOwnResponse({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory OnOwnResponse.fromJson(Map<String, dynamic> json) => _$OnOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OnOwnResponseToJson(this);
}
