import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/discount/entity/discount_entity.dart';

part 'discount_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class DiscountDataResponse extends DiscountDataEntity {
  @override
  @JsonKey(name: 'expires_on')
  final int? expiresOn;

  @override
  @JsonKey(name: 'starts_on')
  final int? startsOn;

  @override
  @JsonKey(name: 'is_expired')
  final bool? isExpired;

  @override
  @JsonKey(name: 'limit_quantity')
  final bool? limitQuantity;

  @override
  @JsonKey(name: 'meta')
  final List<String>? meta;

  @override
  @JsonKey(name: 'product_ids')
  final List<String>? productIds;

  const DiscountDataResponse({
    super.id,
    super.created,
    super.code,
    super.type,
    super.value,
    this.expiresOn,
    this.startsOn,
    this.isExpired,
    this.limitQuantity,
    super.quantity,
    super.description,
    this.meta,
    this.productIds,
  });

  factory DiscountDataResponse.fromJson(Map<String, dynamic> json) => _$DiscountDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountDataResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class DiscountMetaResponse extends DiscountMetaEntity {
  @override
  @JsonKey(name: 'pagination')
  final PaginationResponse? pagination;

  const DiscountMetaResponse({
    this.pagination,
  });

  factory DiscountMetaResponse.fromJson(Map<String, dynamic> json) => _$DiscountMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountMetaResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class PaginationResponse extends PaginationEntity {
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
  final LinksResponse? links;

  const PaginationResponse({
    super.total,
    super.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) => _$PaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class LinksResponse extends LinksEntity {
  const LinksResponse();

  factory LinksResponse.fromJson(Map<String, dynamic> json) => _$LinksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LinksResponseToJson(this);
}
