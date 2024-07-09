import 'package:equatable/equatable.dart';

class CategoryDataEntity extends Equatable {
  final String? id;
  final String? parentId;
  final String? slug;
  final String? name;
  final String? description;
  final int? products;
  final int? created;
  final int? updated;
  final List<AssetsEntity>? assets;
  final List<dynamic>? children;

  const CategoryDataEntity({
    this.id,
    this.parentId,
    this.slug,
    this.name,
    this.description,
    this.products,
    this.created,
    this.updated,
    this.assets,
    this.children,
  });

  @override
  List<Object?> get props => [id, parentId, slug, name, description, products, created, updated, assets, children];

  CategoryDataEntity copyWith({
    String? id,
    String? parentId,
    String? slug,
    String? name,
    String? description,
    int? products,
    int? created,
    int? updated,
    List<AssetsEntity>? assets,
    List<dynamic>? children,
  }) {
    return CategoryDataEntity(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      description: description ?? this.description,
      products: products ?? this.products,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      assets: assets ?? this.assets,
      children: children ?? this.children,
    );
  }
}

class AssetsEntity extends Equatable {
  final String? id;
  final String? url;
  final String? description;
  final bool? isImage;
  final String? filename;
  final int? fileSize;
  final String? fileExtension;
  final ImageDimensionsEntity? imageDimensions;
  final List<dynamic>? meta;
  final int? createdAt;
  final int? updatedAt;

  const AssetsEntity({
    this.id,
    this.url,
    this.description,
    this.isImage,
    this.filename,
    this.fileSize,
    this.fileExtension,
    this.imageDimensions,
    this.meta,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, url, description, isImage, filename, fileSize, fileExtension, imageDimensions, meta, createdAt, updatedAt];

  AssetsEntity copyWith({
    String? id,
    String? url,
    String? description,
    bool? isImage,
    String? filename,
    int? fileSize,
    String? fileExtension,
    ImageDimensionsEntity? imageDimensions,
    List<dynamic>? meta,
    int? createdAt,
    int? updatedAt,
  }) {
    return AssetsEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      description: description ?? this.description,
      isImage: isImage ?? this.isImage,
      filename: filename ?? this.filename,
      fileSize: fileSize ?? this.fileSize,
      fileExtension: fileExtension ?? this.fileExtension,
      imageDimensions: imageDimensions ?? this.imageDimensions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      meta: meta ?? this.meta,
    );
  }
}

class ImageDimensionsEntity extends Equatable {
  final int? width;
  final int? height;

  const ImageDimensionsEntity({
    this.width,
    this.height,
  });

  ImageDimensionsEntity copyWith({
    int? width,
    int? height,
  }) {
    return ImageDimensionsEntity(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  List<Object?> get props => [width, height];
}
