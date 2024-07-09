import 'package:equatable/equatable.dart';
import 'package:html/parser.dart';

class ProductDataEntity extends Equatable {
  final String? id;
  final int? created;
  final int? updated;
  final bool? active;
  final String? permalink;
  final String? name;
  final String? description;
  final PriceEntity? price;
  final InventoryEntity? inventory;
  final String? sku;
  final int? sortOrder;
  final SeoEntity? seo;
  final String? thankYouUrl;
  final MetaEntity? meta;
  final ConditionalsEntity? conditionals;
  final IsEntity? isType;
  final HasEntity? hasType;
  final CollectsEntity? collects;
  final CheckoutUrlEntity? checkoutUrl;
  final List<CategoryEntity>? categories;
  final ImageEntity? image;
  final StatisticsEntity? statistics;

  const ProductDataEntity({
    this.id,
    this.created,
    this.updated,
    this.active,
    this.permalink,
    this.name,
    this.description,
    this.price,
    this.inventory,
    this.sku,
    this.sortOrder,
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

  ProductDataEntity copyWith({
    String? id,
    int? created,
    int? updated,
    bool? active,
    String? permalink,
    String? name,
    String? description,
    PriceEntity? price,
    InventoryEntity? inventory,
    String? sku,
    int? sortOrder,
    SeoEntity? seo,
    String? thankYouUrl,
    MetaEntity? meta,
    ConditionalsEntity? conditionals,
    IsEntity? isType,
    HasEntity? hasType,
    CollectsEntity? collects,
    CheckoutUrlEntity? checkoutUrl,
    List<CategoryEntity>? categories,
    ImageEntity? image,
    StatisticsEntity? statistics,
  }) {
    return ProductDataEntity(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      active: active ?? this.active,
      permalink: permalink ?? this.permalink,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      inventory: inventory ?? this.inventory,
      sku: sku ?? this.sku,
      sortOrder: sortOrder ?? this.sortOrder,
      seo: seo ?? this.seo,
      thankYouUrl: thankYouUrl ?? this.thankYouUrl,
      meta: meta ?? this.meta,
      conditionals: conditionals ?? this.conditionals,
      isType: isType ?? this.isType,
      hasType: hasType ?? this.hasType,
      collects: collects ?? this.collects,
      checkoutUrl: checkoutUrl ?? this.checkoutUrl,
      categories: categories ?? this.categories,
      image: image ?? this.image,
      statistics: statistics ?? this.statistics,
    );
  }

  String get cleanDescription {
    final document = parse(description);
    return parse(document.body?.text).documentElement?.text ?? '';
  }

  @override
  List<Object?> get props => [
        id,
        created,
        updated,
        active,
        permalink,
        name,
        description,
        price,
        inventory,
        sku,
        sortOrder,
        seo,
        thankYouUrl,
        meta,
        conditionals,
        isType,
        hasType,
        collects,
        checkoutUrl,
        categories,
        image,
        statistics,
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

class SeoEntity extends Equatable {
  final String? title;
  final String? description;

  const SeoEntity({
    this.title,
    this.description,
  });

  SeoEntity copyWith({
    String? title,
    String? description,
  }) {
    return SeoEntity(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [title, description];
}

class MetaEntity extends Equatable {
  const MetaEntity();

  MetaEntity copyWith() {
    return const MetaEntity();
  }

  @override
  List<Object?> get props => [];
}

class ConditionalsEntity extends Equatable {
  final bool? isActive;
  final bool? isTaxExempt;
  final bool? isPayWhatYouWant;
  final bool? isInventoryManaged;
  final bool? isSoldOut;
  final bool? hasDigitalDelivery;
  final bool? hasPhysicalDelivery;
  final bool? hasImages;
  final bool? collectsFullname;
  final bool? collectsShippingAddress;
  final bool? collectsBillingAddress;
  final bool? collectsExtraFields;

  const ConditionalsEntity({
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

  ConditionalsEntity copyWith({
    bool? isActive,
    bool? isTaxExempt,
    bool? isPayWhatYouWant,
    bool? isInventoryManaged,
    bool? isSoldOut,
    bool? hasDigitalDelivery,
    bool? hasPhysicalDelivery,
    bool? hasImages,
    bool? collectsFullname,
    bool? collectsShippingAddress,
    bool? collectsBillingAddress,
    bool? collectsExtraFields,
  }) {
    return ConditionalsEntity(
      isActive: isActive ?? this.isActive,
      isTaxExempt: isTaxExempt ?? this.isTaxExempt,
      isPayWhatYouWant: isPayWhatYouWant ?? this.isPayWhatYouWant,
      isInventoryManaged: isInventoryManaged ?? this.isInventoryManaged,
      isSoldOut: isSoldOut ?? this.isSoldOut,
      hasDigitalDelivery: hasDigitalDelivery ?? this.hasDigitalDelivery,
      hasPhysicalDelivery: hasPhysicalDelivery ?? this.hasPhysicalDelivery,
      hasImages: hasImages ?? this.hasImages,
      collectsFullname: collectsFullname ?? this.collectsFullname,
      collectsShippingAddress: collectsShippingAddress ?? this.collectsShippingAddress,
      collectsBillingAddress: collectsBillingAddress ?? this.collectsBillingAddress,
      collectsExtraFields: collectsExtraFields ?? this.collectsExtraFields,
    );
  }

  @override
  List<Object?> get props => [
        isActive,
        isTaxExempt,
        isPayWhatYouWant,
        isInventoryManaged,
        isSoldOut,
        hasDigitalDelivery,
        hasPhysicalDelivery,
        hasImages,
        collectsFullname,
        collectsShippingAddress,
        collectsBillingAddress,
        collectsExtraFields,
      ];
}

class IsEntity extends Equatable {
  final bool? active;
  final bool? taxExempt;
  final bool? payWhatYouWant;
  final bool? inventoryManaged;
  final bool? soldOut;

  const IsEntity({
    this.active,
    this.taxExempt,
    this.payWhatYouWant,
    this.inventoryManaged,
    this.soldOut,
  });

  IsEntity copyWith({
    bool? active,
    bool? taxExempt,
    bool? payWhatYouWant,
    bool? inventoryManaged,
    bool? soldOut,
  }) {
    return IsEntity(
      active: active ?? this.active,
      taxExempt: taxExempt ?? this.taxExempt,
      payWhatYouWant: payWhatYouWant ?? this.payWhatYouWant,
      inventoryManaged: inventoryManaged ?? this.inventoryManaged,
      soldOut: soldOut ?? this.soldOut,
    );
  }

  @override
  List<Object?> get props => [active, taxExempt, payWhatYouWant, inventoryManaged, soldOut];
}

class HasEntity extends Equatable {
  final bool? digitalDelivery;
  final bool? physicalDelivery;
  final bool? images;

  const HasEntity({
    this.digitalDelivery,
    this.physicalDelivery,
    this.images,
  });

  HasEntity copyWith({
    bool? digitalDelivery,
    bool? physicalDelivery,
    bool? images,
  }) {
    return HasEntity(
      digitalDelivery: digitalDelivery ?? this.digitalDelivery,
      physicalDelivery: physicalDelivery ?? this.physicalDelivery,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [digitalDelivery, physicalDelivery, images];
}

class CollectsEntity extends Equatable {
  final bool? fullname;
  final bool? shippingAddress;
  final bool? billingAddress;
  final bool? extraFields;

  const CollectsEntity({
    this.fullname,
    this.shippingAddress,
    this.billingAddress,
    this.extraFields,
  });

  CollectsEntity copyWith({
    bool? fullname,
    bool? shippingAddress,
    bool? billingAddress,
    bool? extraFields,
  }) {
    return CollectsEntity(
      fullname: fullname ?? this.fullname,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      billingAddress: billingAddress ?? this.billingAddress,
      extraFields: extraFields ?? this.extraFields,
    );
  }

  @override
  List<Object?> get props => [fullname, shippingAddress, billingAddress, extraFields];
}

class CheckoutUrlEntity extends Equatable {
  final String? checkout;
  final String? display;

  const CheckoutUrlEntity({
    this.checkout,
    this.display,
  });

  CheckoutUrlEntity copyWith({
    String? checkout,
    String? display,
  }) {
    return CheckoutUrlEntity(
      checkout: checkout ?? this.checkout,
      display: display ?? this.display,
    );
  }

  @override
  List<Object?> get props => [checkout, display];
}

class CategoryEntity extends Equatable {
  final String? id;
  final String? slug;
  final String? name;

  const CategoryEntity({
    this.id,
    this.slug,
    this.name,
  });

  CategoryEntity copyWith({
    String? id,
    String? slug,
    String? name,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, slug, name];
}

class ImageEntity extends Equatable {
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

  const ImageEntity({
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

  ImageEntity copyWith({
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
    return ImageEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      description: description ?? this.description,
      isImage: isImage ?? this.isImage,
      filename: filename ?? this.filename,
      fileSize: fileSize ?? this.fileSize,
      fileExtension: fileExtension ?? this.fileExtension,
      imageDimensions: imageDimensions ?? this.imageDimensions,
      meta: meta ?? this.meta,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props =>
      [id, url, description, isImage, filename, fileSize, fileExtension, imageDimensions, meta, createdAt, updatedAt];
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

class SalesEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const SalesEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  SalesEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return SalesEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
}

class StatisticsEntity extends Equatable {
  final int? orders;
  final SalesEntity? sales;

  const StatisticsEntity({
    this.orders,
    this.sales,
  });

  StatisticsEntity copyWith({
    int? orders,
    SalesEntity? sales,
  }) {
    return StatisticsEntity(
      orders: orders ?? this.orders,
      sales: sales ?? this.sales,
    );
  }

  @override
  List<Object?> get props => [orders, sales];
}
