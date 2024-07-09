import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../../domain/home/products/products_detail/entity/product_meta_entity.dart';

part 'get_products_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class GetProductsDataResponse extends ProductDataEntity {
  @override
  @JsonKey(name: 'checkout_url')
  final CheckoutUrl? checkoutUrl;

  @override
  @JsonKey(name: 'thank_you_url')
  final String? thankYouUrl;

  @override
  @JsonKey(name: 'price')
  final Price? price;

  @override
  @JsonKey(name: 'inventory')
  final Inventory? inventory;

  @override
  @JsonKey(name: 'seo')
  final Seo? seo;

  @override
  @JsonKey(name: 'meta')
  final Meta? meta;

  @override
  @JsonKey(name: 'conditionals')
  final Conditionals? conditionals;

  @override
  @JsonKey(name: 'is')
  final Is? isType;

  @override
  @JsonKey(name: 'has')
  final Has? hasType;

  @override
  @JsonKey(name: 'collects')
  final Collects? collects;

  @override
  @JsonKey(name: 'categories')
  final List<Category>? categories;

  @override
  @JsonKey(name: 'image')
  final Image? image;

  @override
  @JsonKey(name: 'statistics')
  final Statistics? statistics;

  const GetProductsDataResponse({
    super.id,
    super.created,
    super.updated,
    super.active,
    super.permalink,
    super.name,
    super.description,
    this.price,
    this.inventory,
    super.sku,
    super.sortOrder,
    this.seo,
    this.thankYouUrl,
    this.meta,
    this.conditionals,
    this.isType,
    this.hasType,
    this.collects,
    this.checkoutUrl,
    this.categories,
    this.image,
    this.statistics,
  });

  factory GetProductsDataResponse.fromJson(Map<String, dynamic> json) => _$GetProductsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsDataResponseToJson(this);

  factory GetProductsDataResponse.fromEntity(ProductDataEntity entity) {
    return GetProductsDataResponse(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: Price(formatted: entity.price?.formatted),
      image: Image(url: entity.image?.url),
    );
  }
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Price extends PriceEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const Price({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Inventory extends InventoryEntity {
  const Inventory({
    super.managed,
    super.available,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) => _$InventoryFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Seo extends SeoEntity {
  const Seo({
    super.title,
    super.description,
  });

  factory Seo.fromJson(Map<String, dynamic> json) => _$SeoFromJson(json);

  Map<String, dynamic> toJson() => _$SeoToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Meta extends MetaEntity {
  const Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Conditionals extends ConditionalsEntity {
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;

  @override
  @JsonKey(name: 'is_tax_exempt')
  final bool? isTaxExempt;

  @override
  @JsonKey(name: 'is_pay_what_you_want')
  final bool? isPayWhatYouWant;

  @override
  @JsonKey(name: 'is_inventory_managed')
  final bool? isInventoryManaged;

  @override
  @JsonKey(name: 'is_sold_out')
  final bool? isSoldOut;

  @override
  @JsonKey(name: 'has_digital_delivery')
  final bool? hasDigitalDelivery;

  @override
  @JsonKey(name: 'has_physical_delivery')
  final bool? hasPhysicalDelivery;

  @override
  @JsonKey(name: 'has_images')
  final bool? hasImages;

  @override
  @JsonKey(name: 'collects_fullname')
  final bool? collectsFullname;

  @override
  @JsonKey(name: 'collects_shipping_address')
  final bool? collectsShippingAddress;

  @override
  @JsonKey(name: 'collects_billing_address')
  final bool? collectsBillingAddress;

  @override
  @JsonKey(name: 'collects_extra_fields')
  final bool? collectsExtraFields;

  const Conditionals({
    this.isActive,
    this.isTaxExempt,
    this.isPayWhatYouWant,
    this.isInventoryManaged,
    this.isSoldOut,
    this.hasDigitalDelivery,
    this.hasPhysicalDelivery,
    this.hasImages,
    this.collectsFullname,
    this.collectsShippingAddress,
    this.collectsBillingAddress,
    this.collectsExtraFields,
  });

  factory Conditionals.fromJson(Map<String, dynamic> json) => _$ConditionalsFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionalsToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Is extends IsEntity {
  @override
  @JsonKey(name: 'tax_exempt')
  final bool? taxExempt;

  @override
  @JsonKey(name: 'pay_what_you_want')
  final bool? payWhatYouWant;

  @override
  @JsonKey(name: 'inventory_managed')
  final bool? inventoryManaged;

  @override
  @JsonKey(name: 'sold_out')
  final bool? soldOut;

  const Is({
    super.active,
    this.taxExempt,
    this.payWhatYouWant,
    this.inventoryManaged,
    this.soldOut,
  });

  factory Is.fromJson(Map<String, dynamic> json) => _$IsFromJson(json);

  Map<String, dynamic> toJson() => _$IsToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Has extends HasEntity {
  @override
  @JsonKey(name: 'digital_delivery')
  final bool? digitalDelivery;

  @override
  @JsonKey(name: 'physical_delivery')
  final bool? physicalDelivery;

  const Has({
    this.digitalDelivery,
    this.physicalDelivery,
    super.images,
  });

  factory Has.fromJson(Map<String, dynamic> json) => _$HasFromJson(json);

  Map<String, dynamic> toJson() => _$HasToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Collects extends CollectsEntity {
  @override
  @JsonKey(name: 'shipping_address')
  final bool? shippingAddress;

  @override
  @JsonKey(name: 'billing_address')
  final bool? billingAddress;

  @override
  @JsonKey(name: 'extra_fields')
  final bool? extraFields;

  const Collects({
    super.fullname,
    this.shippingAddress,
    this.billingAddress,
    this.extraFields,
  });

  factory Collects.fromJson(Map<String, dynamic> json) => _$CollectsFromJson(json);

  Map<String, dynamic> toJson() => _$CollectsToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class CheckoutUrl extends CheckoutUrlEntity {
  const CheckoutUrl({
    super.checkout,
    super.display,
  });

  factory CheckoutUrl.fromJson(Map<String, dynamic> json) => _$CheckoutUrlFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutUrlToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Category extends CategoryEntity {
  const Category({
    super.id,
    super.slug,
    super.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Sales extends SalesEntity {
  @override
  @JsonKey(name: 'formatted_with_symbol')
  final String? formattedWithSymbol;

  @override
  @JsonKey(name: 'formatted_with_code')
  final String? formattedWithCode;

  const Sales({
    super.raw,
    super.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  factory Sales.fromJson(Map<String, dynamic> json) => _$SalesFromJson(json);

  Map<String, dynamic> toJson() => _$SalesToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class ImageDimensions extends ImageDimensionsEntity {
  const ImageDimensions({
    super.width,
    super.height,
  });

  factory ImageDimensions.fromJson(Map<String, dynamic> json) => _$ImageDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDimensionsToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Image extends ImageEntity {
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
  final ImageDimensions? imageDimensions;

  @override
  @JsonKey(name: 'created_at')
  final int? createdAt;

  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  const Image({
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

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Statistics extends StatisticsEntity {
  @override
  @JsonKey(name: 'sales')
  final Sales? sales;

  const Statistics({
    super.orders,
    this.sales,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class GetProductsMetaResponse extends ProductMetaEntity {
  @override
  @JsonKey(name: 'pagination')
  final Pagination? pagination;

  const GetProductsMetaResponse({
    this.pagination,
  });

  factory GetProductsMetaResponse.fromJson(Map<String, dynamic> json) => _$GetProductsMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductsMetaResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Pagination extends PaginationEntity {
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;

  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;

  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @override
  @JsonKey(name: 'links')
  final Links? links;

  const Pagination({
    super.total,
    super.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Links extends LinksEntity {
  const Links();

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
