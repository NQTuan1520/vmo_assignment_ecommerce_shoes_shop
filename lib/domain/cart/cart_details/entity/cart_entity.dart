import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String? id;
  final int? totalItems;
  final int? totalUniqueItems;
  final SubTotalEntity? subtotal;
  final CurrencyEntity? currency;
  final List<CartItemEntity>? items;

  const CartEntity({
    this.id,
    this.totalItems,
    this.totalUniqueItems,
    this.subtotal,
    this.currency,
    this.items,
  });

  CartEntity copyWith({
    String? id,
    int? totalItems,
    int? totalUniqueItems,
    SubTotalEntity? subtotal,
    CurrencyEntity? currency,
    List<CartItemEntity>? items,
  }) {
    return CartEntity(
      id: id ?? this.id,
      totalItems: totalItems ?? this.totalItems,
      totalUniqueItems: totalUniqueItems ?? this.totalUniqueItems,
      subtotal: subtotal ?? this.subtotal,
      currency: currency ?? this.currency,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [id, totalItems, totalUniqueItems, subtotal, currency, items];
}

class SubTotalEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const SubTotalEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  SubTotalEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return SubTotalEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
}

class CurrencyEntity extends Equatable {
  final String? code;
  final String? symbol;

  const CurrencyEntity({
    this.code,
    this.symbol,
  });

  CurrencyEntity copyWith({
    String? code,
    String? symbol,
  }) {
    return CurrencyEntity(
      code: code ?? this.code,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  List<Object?> get props => [code, symbol];
}

class CartItemEntity extends Equatable {
  final String? id;
  final String? productId;
  final String? name;
  final int? quantity;
  final PriceEntity? price;
  final LineTotalEntity? lineTotal;
  final ImageEntity? image;
  final List<SelectedOptionsEntity>? selectedOptions;

  const CartItemEntity({
    this.id,
    this.productId,
    this.name,
    this.quantity,
    this.price,
    this.lineTotal,
    this.image,
    this.selectedOptions,
  });

  Map<String, String>? get optionsMap {
    if (selectedOptions == null) return null;
    final map = <String, String>{};
    for (var option in selectedOptions!) {
      if (option.groupId != null && option.optionId != null) {
        map[option.groupId!] = option.optionId!;
      }
    }
    return map;
  }

  CartItemEntity copyWith({
    String? id,
    String? productId,
    String? name,
    int? quantity,
    PriceEntity? price,
    LineTotalEntity? lineTotal,
    ImageEntity? image,
    List<SelectedOptionsEntity>? selectedOptions,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      lineTotal: lineTotal ?? this.lineTotal,
      image: image ?? this.image,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }

  @override
  List<Object?> get props => [id, productId, name, quantity, price, lineTotal, image, selectedOptions];
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

class LineTotalEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const LineTotalEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  LineTotalEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return LineTotalEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
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

class SelectedOptionsEntity extends Equatable {
  final String? groupId;

  final String? groupName;

  final String? optionId;

  final String? optionName;

  final PriceEntity? price;

  const SelectedOptionsEntity({
    this.groupId,
    this.groupName,
    this.optionId,
    this.optionName,
    this.price,
  });

  SelectedOptionsEntity copyWith({
    String? groupId,
    String? groupName,
    String? optionId,
    String? optionName,
    PriceEntity? price,
  }) {
    return SelectedOptionsEntity(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      optionId: optionId ?? this.optionId,
      optionName: optionName ?? this.optionName,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [groupId, groupName, optionId, optionName, price];
}

class UpdateCartItemRequestEntity extends Equatable {
  final String? id;
  final int? quantity;
  final PriceEntity? price;
  final SubTotalEntity? subtotal;

  const UpdateCartItemRequestEntity({
    this.id,
    this.quantity,
    this.price,
    this.subtotal,
  });

  UpdateCartItemRequestEntity copyWith({
    String? id,
    int? quantity,
    PriceEntity? price,
    SubTotalEntity? subtotal,
  }) {
    return UpdateCartItemRequestEntity(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  List<Object?> get props => [id, quantity, price, subtotal];
}

class RemoveCartItemEntity extends Equatable {
  final String? id;
  final int? quantity;
  final PriceEntity? price;
  final SubTotalEntity? subtotal;

  const RemoveCartItemEntity({
    this.id,
    this.quantity,
    this.price,
    this.subtotal,
  });

  RemoveCartItemEntity copyWith({
    String? id,
    int? quantity,
    PriceEntity? price,
    SubTotalEntity? subtotal,
  }) {
    return RemoveCartItemEntity(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  List<Object?> get props => [id, quantity, price, subtotal];
}

class UpdateCartDiscountEntity extends Equatable {
  final String? id;
  final int? totalItems;
  final int? totalUniqueItems;
  final SubTotalEntity? subtotal;
  final CurrencyEntity? currency;
  final List<CartItemEntity>? items;
  final DiscountEntity? discount;

  const UpdateCartDiscountEntity({
    this.id,
    this.totalItems,
    this.totalUniqueItems,
    this.subtotal,
    this.currency,
    this.items,
    this.discount,
  });

  UpdateCartDiscountEntity copyWith({
    String? id,
    int? totalItems,
    int? totalUniqueItems,
    SubTotalEntity? subtotal,
    CurrencyEntity? currency,
    List<CartItemEntity>? items,
    DiscountEntity? discount,
  }) {
    return UpdateCartDiscountEntity(
      id: id ?? this.id,
      totalItems: totalItems ?? this.totalItems,
      totalUniqueItems: totalUniqueItems ?? this.totalUniqueItems,
      subtotal: subtotal ?? this.subtotal,
      currency: currency ?? this.currency,
      items: items ?? this.items,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object?> get props => [id, totalItems, totalUniqueItems, subtotal, currency, items, discount];
}

class DiscountEntity extends Equatable {
  final String? type;
  final String? code;
  final String? value;
  final AmountSavedEntity? amountSaved;
  final List<String>? productId;

  const DiscountEntity({
    this.type,
    this.code,
    this.value,
    this.amountSaved,
    this.productId,
  });

  DiscountEntity copyWith({
    String? code,
    String? type,
    String? value,
    AmountSavedEntity? amountSaved,
    List<String>? productId,
  }) {
    return DiscountEntity(
      code: code ?? this.code,
      type: type ?? this.type,
      value: value ?? this.value,
      amountSaved: amountSaved ?? this.amountSaved,
      productId: productId ?? this.productId,
    );
  }

  @override
  List<Object?> get props => [code, type, value, amountSaved, productId];
}

class AmountSavedEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const AmountSavedEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  AmountSavedEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return AmountSavedEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
}
