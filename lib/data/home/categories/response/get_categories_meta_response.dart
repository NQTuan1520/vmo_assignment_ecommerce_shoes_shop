import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_meta_entity.dart';

part 'get_categories_meta_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class GetCategoriesMetaResponse extends CategoryMetaEntity {
  @override
  @JsonKey(name: 'pagination')
  final Pagination? pagination;

  const GetCategoriesMetaResponse({
    this.pagination,
  });

  factory GetCategoriesMetaResponse.fromJson(Map<String, dynamic> json) => _$GetCategoriesMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesMetaResponseToJson(this);
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
