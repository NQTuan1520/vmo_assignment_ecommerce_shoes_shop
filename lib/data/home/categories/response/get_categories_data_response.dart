import 'package:json_annotation/json_annotation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_data_entity.dart';

part 'get_categories_data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class GetCategoriesDataResponse extends CategoryDataEntity {
  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;

  @override
  @JsonKey(name: 'assets')
  final List<Assets>? assets;

  @override
  @JsonKey(name: 'children')
  final List<dynamic>? children;

  const GetCategoriesDataResponse({
    super.id,
    super.slug,
    super.name,
    this.parentId,
    super.description,
    super.products,
    super.created,
    super.updated,
    this.assets,
    this.children,
  });

  factory GetCategoriesDataResponse.fromJson(Map<String, dynamic> json) => _$GetCategoriesDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesDataResponseToJson(this);
}

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class Assets extends AssetsEntity {
  @override
  @JsonKey(name: 'image_dimensions')
  final ImageDimensions? imageDimensions;

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
  @JsonKey(name: 'created_at')
  final int? createdAt;

  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  const Assets({
    super.id,
    super.url,
    super.description,
    this.isImage,
    super.filename,
    this.fileSize,
    this.fileExtension,
    this.imageDimensions,
    this.createdAt,
    this.updatedAt,
    super.meta,
  });

  factory Assets.fromJson(Map<String, dynamic> json) => _$AssetsFromJson(json);

  Map<String, dynamic> toJson() => _$AssetsToJson(this);
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
