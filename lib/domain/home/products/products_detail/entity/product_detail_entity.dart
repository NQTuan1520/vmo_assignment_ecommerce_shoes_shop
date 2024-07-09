import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final PriceEntity? price;
  final InventoryEntity? inventory;
  final ImageEntity? image;
  final List<CategoriesEntity>? categories;
  final List<VariantGroupsEntity>? variantGroups;
  final List<AssetsProductEntity>? assets;
  final List<RelatedProductsEntity>? relatedProducts;
  final FulfillmentEntity? fulfillment;

  const ProductDetailEntity({
    this.id,
    this.name,
    this.description,
    this.price,
    this.inventory,
    this.image,
    this.categories,
    this.variantGroups,
    this.assets,
    this.relatedProducts,
    this.fulfillment,
  });

  ProductDetailEntity copyWith({
    String? id,
    String? name,
    String? description,
    PriceEntity? price,
    InventoryEntity? inventory,
    ImageEntity? image,
    List<CategoriesEntity>? categories,
    List<VariantGroupsEntity>? variantGroups,
    List<AssetsProductEntity>? assets,
    List<RelatedProductsEntity>? relatedProducts,
    FulfillmentEntity? fulfillment,
  }) {
    return ProductDetailEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      inventory: inventory ?? this.inventory,
      image: image ?? this.image,
      categories: categories ?? this.categories,
      variantGroups: variantGroups ?? this.variantGroups,
      assets: assets ?? this.assets,
      relatedProducts: relatedProducts ?? this.relatedProducts,
      fulfillment: fulfillment ?? this.fulfillment,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        inventory,
        image,
        categories,
        variantGroups,
        assets,
        relatedProducts,
        fulfillment,
      ];
}

class PriceEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const PriceEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  PriceEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return PriceEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
}

class InventoryEntity extends Equatable {
  final bool? managed;
  final int? available;

  const InventoryEntity({
    this.managed,
    this.available,
  });

  InventoryEntity copyWith({
    bool? managed,
    int? available,
  }) {
    return InventoryEntity(
      managed: managed ?? this.managed,
      available: available ?? this.available,
    );
  }

  @override
  List<Object?> get props => [managed, available];
}

class ImageEntity extends Equatable {
  final String? id;
  final String? url;
  final String? filename;
  final int? fileSize;
  final String? fileExtension;
  final ImageDimensionsEntity? imageDimensions;

  const ImageEntity({
    this.id,
    this.url,
    this.filename,
    this.fileSize,
    this.fileExtension,
    this.imageDimensions,
  });

  ImageEntity copyWith({
    String? id,
    String? url,
    String? filename,
    int? fileSize,
    String? fileExtension,
    ImageDimensionsEntity? imageDimensions,
  }) {
    return ImageEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      filename: filename ?? this.filename,
      fileSize: fileSize ?? this.fileSize,
      fileExtension: fileExtension ?? this.fileExtension,
      imageDimensions: imageDimensions ?? this.imageDimensions,
    );
  }

  @override
  List<Object?> get props => [id, url, filename, fileSize, fileExtension, imageDimensions];
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

class CategoriesEntity extends Equatable {
  final String? id;
  final String? slug;
  final String? name;

  const CategoriesEntity({
    this.id,
    this.slug,
    this.name,
  });

  CategoriesEntity copyWith({
    String? id,
    String? slug,
    String? name,
  }) {
    return CategoriesEntity(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, slug, name];
}

class VariantGroupsEntity extends Equatable {
  final String? id;
  final String? name;
  final List<VariantOptionEntity>? options;

  const VariantGroupsEntity({
    this.id,
    this.name,
    this.options,
  });

  VariantGroupsEntity copyWith({
    String? id,
    String? name,
    List<VariantOptionEntity>? options,
  }) {
    return VariantGroupsEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }

  @override
  List<Object?> get props => [id, name, options];
}

class VariantOptionEntity extends Equatable {
  final String? id;
  final String? name;
  final PriceEntity? price;
  final List<String>? assets;

  const VariantOptionEntity({
    this.id,
    this.name,
    this.price,
    this.assets,
  });

  VariantOptionEntity copyWith({
    String? id,
    String? name,
    PriceEntity? price,
    List<String>? assets,
  }) {
    return VariantOptionEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      assets: assets ?? this.assets,
    );
  }

  @override
  List<Object?> get props => [id, name, price, assets];
}

class AssetsProductEntity extends Equatable {
  final String? id;
  final String? url;
  final ImageDimensionsEntity? imageDimensions;

  const AssetsProductEntity({
    this.id,
    this.url,
    this.imageDimensions,
  });

  AssetsProductEntity copyWith({
    String? id,
    String? url,
    ImageDimensionsEntity? imageDimensions,
  }) {
    return AssetsProductEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      imageDimensions: imageDimensions ?? this.imageDimensions,
    );
  }

  @override
  List<Object?> get props => [id, url, imageDimensions];
}

class RelatedProductsEntity extends Equatable {
  final String? id;
  final String? name;
  final int? quantity;
  final PriceEntity? price;
  final ImageEntity? image;

  const RelatedProductsEntity({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.image,
  });

  RelatedProductsEntity copyWith({
    String? id,
    String? name,
    int? quantity,
    PriceEntity? price,
    ImageEntity? image,
  }) {
    return RelatedProductsEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [id, name, quantity, price, image];
}

class FulfillmentEntity extends Equatable {
  final List<PhysicalEntity>? physical;

  const FulfillmentEntity({
    this.physical,
  });

  FulfillmentEntity copyWith({
    List<PhysicalEntity>? physical,
  }) {
    return FulfillmentEntity(
      physical: physical ?? this.physical,
    );
  }

  @override
  List<Object?> get props => [physical];
}

class PhysicalEntity extends Equatable {
  final String? zoneId;
  final OnOwnEntity? onOwn;

  const PhysicalEntity({
    this.zoneId,
    this.onOwn,
  });

  PhysicalEntity copyWith({
    String? zoneId,
    OnOwnEntity? onOwn,
  }) {
    return PhysicalEntity(
      zoneId: zoneId ?? this.zoneId,
      onOwn: onOwn ?? this.onOwn,
    );
  }

  @override
  List<Object?> get props => [zoneId, onOwn];
}

class OnOwnEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const OnOwnEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  OnOwnEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return OnOwnEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [
        raw,
        formatted,
        formattedWithSymbol,
        formattedWithCode,
      ];
}
