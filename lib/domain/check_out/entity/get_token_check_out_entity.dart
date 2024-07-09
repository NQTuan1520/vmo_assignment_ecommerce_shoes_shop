import 'package:equatable/equatable.dart';

class GetTokenCheckOutEntity extends Equatable {
  final String? id;
  final String? cartId;
  final CurrencyEntity? currency;
  final SubTotalEntity? subTotal;
  final TotalEntity? total;
  final ConditionalsEntity? conditionals;
  final CollectsEntity? collects;
  final HasEntity? has;
  final List<LineItemEntity>? lineItems;
  final List<ShippingMethodsEntity>? shippingMethods;
  final DiscountEntity? discount;
  final List<GateWaysEntity>? gateways;

  const GetTokenCheckOutEntity({
    this.id,
    this.cartId,
    this.currency,
    this.subTotal,
    this.total,
    this.conditionals,
    this.collects,
    this.has,
    this.lineItems,
    this.shippingMethods,
    this.discount,
    this.gateways,
  });

  GetTokenCheckOutEntity copyWith({
    String? id,
    String? cartId,
    CurrencyEntity? currency,
    SubTotalEntity? subTotal,
    TotalEntity? total,
    ConditionalsEntity? conditionals,
    CollectsEntity? collects,
    HasEntity? has,
    List<LineItemEntity>? lineItems,
    List<ShippingMethodsEntity>? shippingMethods,
    DiscountEntity? discount,
    List<GateWaysEntity>? gateways,
  }) {
    return GetTokenCheckOutEntity(
      id: id ?? this.id,
      cartId: cartId ?? this.cartId,
      currency: currency ?? this.currency,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      conditionals: conditionals ?? this.conditionals,
      collects: collects ?? this.collects,
      has: has ?? this.has,
      lineItems: lineItems ?? this.lineItems,
      shippingMethods: shippingMethods ?? this.shippingMethods,
      discount: discount ?? this.discount,
      gateways: gateways ?? this.gateways,
    );
  }

  @override
  List<Object?> get props => [
        id,
        cartId,
        currency,
        subTotal,
        total,
        conditionals,
        collects,
        has,
        lineItems,
        shippingMethods,
        discount,
        gateways,
      ];
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
  List<Object?> get props => [
        code,
        symbol,
      ];
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

class TotalEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const TotalEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  TotalEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return TotalEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
}

class ConditionalsEntity extends Equatable {
  final bool? collectsFullName;
  final bool? collectsShippingAddress;
  final bool? collectsBillingAddress;
  final bool? hasPhysicalDelivery;
  final bool? hasDigitalDelivery;
  final bool? hasPayWhatYouWant;
  final bool? hasAvailableDiscounts;
  final bool? collectsExtraFields;
  final bool? isCartFree;

  const ConditionalsEntity({
    this.collectsFullName,
    this.collectsShippingAddress,
    this.collectsBillingAddress,
    this.hasPhysicalDelivery,
    this.hasDigitalDelivery,
    this.hasPayWhatYouWant,
    this.hasAvailableDiscounts,
    this.collectsExtraFields,
    this.isCartFree,
  });

  ConditionalsEntity copyWith({
    bool? collectsFullName,
    bool? collectsShippingAddress,
    bool? collectsBillingAddress,
    bool? hasPhysicalDelivery,
    bool? hasDigitalDelivery,
    bool? hasPayWhatYouWant,
    bool? hasAvailableDiscounts,
    bool? collectsExtraFields,
    bool? isCartFree,
  }) {
    return ConditionalsEntity(
      collectsFullName: collectsFullName ?? this.collectsFullName,
      collectsShippingAddress: collectsShippingAddress ?? this.collectsShippingAddress,
      collectsBillingAddress: collectsBillingAddress ?? this.collectsBillingAddress,
      hasPhysicalDelivery: hasPhysicalDelivery ?? this.hasPhysicalDelivery,
      hasDigitalDelivery: hasDigitalDelivery ?? this.hasDigitalDelivery,
      hasPayWhatYouWant: hasPayWhatYouWant ?? this.hasPayWhatYouWant,
      hasAvailableDiscounts: hasAvailableDiscounts ?? this.hasAvailableDiscounts,
      collectsExtraFields: collectsExtraFields ?? this.collectsExtraFields,
      isCartFree: isCartFree ?? this.isCartFree,
    );
  }

  @override
  List<Object?> get props => [
        collectsFullName,
        collectsShippingAddress,
        collectsBillingAddress,
        hasPhysicalDelivery,
        hasDigitalDelivery,
        hasPayWhatYouWant,
        hasAvailableDiscounts,
        collectsExtraFields,
        isCartFree,
      ];
}

class CollectsEntity extends Equatable {
  final bool? fullName;
  final bool? shippingAddress;
  final bool? billingAddress;
  final bool? extraFields;

  const CollectsEntity({
    this.fullName,
    this.shippingAddress,
    this.billingAddress,
    this.extraFields,
  });

  CollectsEntity copyWith({
    bool? fullName,
    bool? shippingAddress,
    bool? billingAddress,
    bool? extraFields,
  }) {
    return CollectsEntity(
      fullName: fullName ?? this.fullName,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      billingAddress: billingAddress ?? this.billingAddress,
      extraFields: extraFields ?? this.extraFields,
    );
  }

  @override
  List<Object?> get props => [
        fullName,
        shippingAddress,
        billingAddress,
        extraFields,
      ];
}

class HasEntity extends Equatable {
  final bool? physicalDelivery;
  final bool? digitalDelivery;
  final bool? payWhatYouWant;
  final bool? availableDiscounts;

  const HasEntity({
    this.physicalDelivery,
    this.digitalDelivery,
    this.payWhatYouWant,
    this.availableDiscounts,
  });

  HasEntity copyWith({
    bool? physicalDelivery,
    bool? digitalDelivery,
    bool? payWhatYouWant,
    bool? availableDiscounts,
  }) {
    return HasEntity(
      physicalDelivery: physicalDelivery ?? this.physicalDelivery,
      digitalDelivery: digitalDelivery ?? this.digitalDelivery,
      payWhatYouWant: payWhatYouWant ?? this.payWhatYouWant,
      availableDiscounts: availableDiscounts ?? this.availableDiscounts,
    );
  }

  @override
  List<Object?> get props => [
        physicalDelivery,
        digitalDelivery,
        payWhatYouWant,
        availableDiscounts,
      ];
}

class LineItemEntity extends Equatable {
  final String? id;
  final String? productId;
  final String? name;
  final String? productName;
  final int? quantity;
  final PriceEntity? price;
  final LineTotalEntity? lineTotal;
  final bool? isValid;
  final List<SelectedOptionsEntity>? selectedOptions;
  final ImageEntity? image;

  const LineItemEntity({
    this.id,
    this.productId,
    this.name,
    this.productName,
    this.quantity,
    this.price,
    this.lineTotal,
    this.isValid,
    this.selectedOptions,
    this.image,
  });

  LineItemEntity copyWith({
    String? id,
    String? productId,
    String? name,
    String? productName,
    int? quantity,
    PriceEntity? price,
    LineTotalEntity? lineTotal,
    bool? isValid,
    List<SelectedOptionsEntity>? selectedOptions,
    ImageEntity? image,
  }) {
    return LineItemEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      lineTotal: lineTotal ?? this.lineTotal,
      isValid: isValid ?? this.isValid,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        id,
        productId,
        name,
        productName,
        quantity,
        price,
        lineTotal,
        isValid,
        selectedOptions,
        image,
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
  List<Object?> get props => [
        groupId,
        groupName,
        optionId,
        optionName,
        price,
      ];
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

class ShippingMethodsEntity extends Equatable {
  final String? id;
  final String? description;
  final String? provider;
  final PriceEntity? price;

  const ShippingMethodsEntity({
    this.id,
    this.description,
    this.provider,
    this.price,
  });

  ShippingMethodsEntity copyWith({
    String? id,
    String? description,
    String? provider,
    PriceEntity? price,
  }) {
    return ShippingMethodsEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      provider: provider ?? this.provider,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [
        id,
        description,
        provider,
        price,
      ];
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
    String? type,
    String? code,
    String? value,
    AmountSavedEntity? amountSaved,
    List<String>? productId,
  }) {
    return DiscountEntity(
      type: type ?? this.type,
      code: code ?? this.code,
      value: value ?? this.value,
      amountSaved: amountSaved ?? this.amountSaved,
      productId: productId ?? this.productId,
    );
  }

  @override
  List<Object?> get props => [
        type,
        code,
        value,
        amountSaved,
        productId,
      ];
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

class GateWaysEntity extends Equatable {
  final String? id;
  final String? code;
  final bool? sandbox;
  final List<dynamic>? config;

  const GateWaysEntity({
    this.id,
    this.code,
    this.sandbox,
    this.config,
  });

  GateWaysEntity copyWith({
    String? id,
    String? code,
    bool? sandbox,
    List<dynamic>? config,
  }) {
    return GateWaysEntity(
      id: id ?? this.id,
      code: code ?? this.code,
      sandbox: sandbox ?? this.sandbox,
      config: config ?? this.config,
    );
  }

  @override
  List<Object?> get props => [
        id,
        code,
        sandbox,
        config,
      ];
}
