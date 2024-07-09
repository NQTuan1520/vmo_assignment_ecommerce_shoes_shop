import 'package:equatable/equatable.dart';

class OrderDataEntity extends Equatable {
  final String? version;
  final bool? sandbox;
  final String? id;
  final String? checkoutTokenId;
  final String? cartId;
  final String? customerReference;
  final int? created;
  final String? status;
  final String? statusPayment;
  final String? statusFulfillment;
  final CurrencyEntity? currency;
  final OrderValueEntity? orderValue;
  final ConditionalsEntity? conditionals;
  final CollectedEntity? collected;
  final HasEntity? has;
  final OrderEntity? order;
  final ShippingEntity? shipping;
  final List<TransactionsEntity>? transactions;
  final CustomerEntity? customer;
  final ClientDetailsEntity? clientDetails;

  const OrderDataEntity({
    this.version,
    this.sandbox,
    this.id,
    this.checkoutTokenId,
    this.cartId,
    this.customerReference,
    this.created,
    this.status,
    this.statusPayment,
    this.statusFulfillment,
    this.currency,
    this.orderValue,
    this.conditionals,
    this.collected,
    this.has,
    this.order,
    this.shipping,
    this.transactions,
    this.customer,
    this.clientDetails,
  });

  OrderDataEntity copyWith({
    String? version,
    bool? sandbox,
    String? id,
    String? checkoutTokenId,
    String? cartId,
    String? customerReference,
    int? created,
    String? status,
    String? statusPayment,
    String? statusFulfillment,
    CurrencyEntity? currency,
    OrderValueEntity? orderValue,
    ConditionalsEntity? conditionals,
    CollectedEntity? collected,
    HasEntity? has,
    OrderEntity? order,
    ShippingEntity? shipping,
    List<TransactionsEntity>? transactions,
    CustomerEntity? customer,
    ClientDetailsEntity? clientDetails,
  }) {
    return OrderDataEntity(
      version: version ?? this.version,
      sandbox: sandbox ?? this.sandbox,
      id: id ?? this.id,
      checkoutTokenId: checkoutTokenId ?? this.checkoutTokenId,
      cartId: cartId ?? this.cartId,
      customerReference: customerReference ?? this.customerReference,
      created: created ?? this.created,
      status: status ?? this.status,
      statusPayment: statusPayment ?? this.statusPayment,
      statusFulfillment: statusFulfillment ?? this.statusFulfillment,
      currency: currency ?? this.currency,
      orderValue: orderValue ?? this.orderValue,
      conditionals: conditionals ?? this.conditionals,
      collected: collected ?? this.collected,
      has: has ?? this.has,
      order: order ?? this.order,
      shipping: shipping ?? this.shipping,
      transactions: transactions ?? this.transactions,
      customer: customer ?? this.customer,
      clientDetails: clientDetails ?? this.clientDetails,
    );
  }

  @override
  List<Object?> get props {
    return [
      version,
      sandbox,
      id,
      checkoutTokenId,
      cartId,
      customerReference,
      created,
      status,
      statusPayment,
      statusFulfillment,
      currency,
      orderValue,
      conditionals,
      collected,
      has,
      order,
      shipping,
      transactions,
      customer,
      clientDetails,
    ];
  }
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
  List<Object?> get props {
    return [
      code,
      symbol,
    ];
  }
}

class OrderValueEntity extends Equatable {
  final int? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const OrderValueEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  OrderValueEntity copyWith({
    int? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return OrderValueEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props {
    return [
      raw,
      formatted,
      formattedWithSymbol,
      formattedWithCode,
    ];
  }
}

class ConditionalsEntity extends Equatable {
  final bool? collectsFullName;
  final bool? collectsShippingAddress;
  final bool? hasPhysicalFulfillment;

  const ConditionalsEntity({
    this.collectsFullName,
    this.collectsShippingAddress,
    this.hasPhysicalFulfillment,
  });

  ConditionalsEntity copyWith({
    bool? collectsFullName,
    bool? collectsShippingAddress,
    bool? hasPhysicalFulfillment,
  }) {
    return ConditionalsEntity(
      collectsFullName: collectsFullName ?? this.collectsFullName,
      collectsShippingAddress: collectsShippingAddress ?? this.collectsShippingAddress,
      hasPhysicalFulfillment: hasPhysicalFulfillment ?? this.hasPhysicalFulfillment,
    );
  }

  @override
  List<Object?> get props {
    return [
      collectsFullName,
      collectsShippingAddress,
      hasPhysicalFulfillment,
    ];
  }
}

class CollectedEntity extends Equatable {
  final bool? fullName;
  final bool? shippingAddress;

  const CollectedEntity({
    this.fullName,
    this.shippingAddress,
  });

  CollectedEntity copyWith({
    bool? fullName,
    bool? shippingAddress,
  }) {
    return CollectedEntity(
      fullName: fullName ?? this.fullName,
      shippingAddress: shippingAddress ?? this.shippingAddress,
    );
  }

  @override
  List<Object?> get props {
    return [
      fullName,
      shippingAddress,
    ];
  }
}

class HasEntity extends Equatable {
  final bool? physicalFulfillment;

  const HasEntity({
    this.physicalFulfillment,
  });

  HasEntity copyWith({
    bool? physicalFulfillment,
  }) {
    return HasEntity(
      physicalFulfillment: physicalFulfillment ?? this.physicalFulfillment,
    );
  }

  @override
  List<Object?> get props {
    return [
      physicalFulfillment,
    ];
  }
}

class OrderEntity extends Equatable {
  final SubTotalEntity? subtotal;
  final TotalEntity? total;
  final ShippingOrderEntity? shipping;
  final List<LineItemsEntity>? lineItems;
  final DiscountEntity? discount;

  const OrderEntity({
    this.subtotal,
    this.total,
    this.shipping,
    this.lineItems,
    this.discount,
  });

  OrderEntity copyWith({
    SubTotalEntity? subtotal,
    TotalEntity? total,
    ShippingOrderEntity? shipping,
    List<LineItemsEntity>? lineItems,
    DiscountEntity? discount,
  }) {
    return OrderEntity(
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      shipping: shipping ?? this.shipping,
      lineItems: lineItems ?? this.lineItems,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object?> get props {
    return [
      subtotal,
      total,
      shipping,
      lineItems,
      discount,
    ];
  }
}

class SubTotalEntity extends Equatable {
  final int? raw;
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
    int? raw,
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
  List<Object?> get props {
    return [
      raw,
      formatted,
      formattedWithSymbol,
      formattedWithCode,
    ];
  }
}

class TotalEntity extends Equatable {
  final int? raw;
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
    int? raw,
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
  List<Object?> get props {
    return [
      raw,
      formatted,
      formattedWithSymbol,
      formattedWithCode,
    ];
  }
}

class ShippingOrderEntity extends Equatable {
  final String? id;
  final String? description;
  final String? provider;

  const ShippingOrderEntity({
    this.id,
    this.description,
    this.provider,
  });

  ShippingOrderEntity copyWith({
    String? id,
    String? description,
    String? provider,
  }) {
    return ShippingOrderEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      provider: provider ?? this.provider,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      description,
      provider,
    ];
  }
}

class LineItemsEntity extends Equatable {
  final String? id;
  final String? productId;
  final String? productName;
  final int? quantity;
  final PriceEntity? price;
  final LineTotalEntity? lineTotal;
  final List<SelectedOptionsEntity>? selectedOptions;
  final ImageEntity? image;

  const LineItemsEntity({
    this.id,
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.lineTotal,
    this.selectedOptions,
    this.image,
  });

  LineItemsEntity copyWith({
    String? id,
    String? productId,
    String? productName,
    int? quantity,
    PriceEntity? price,
    final LineTotalEntity? lineTotal,
    ImageEntity? image,
    List<SelectedOptionsEntity>? selectedOptions,
  }) {
    return LineItemsEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      lineTotal: lineTotal ?? this.lineTotal,
      image: image ?? this.image,
      selectedOptions: selectedOptions ?? this.selectedOptions,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      productName,
      quantity,
      price,
      lineTotal,
      image,
      selectedOptions,
    ];
  }
}

class PriceEntity extends Equatable {
  final int? raw;
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
    int? raw,
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
  List<Object?> get props {
    return [
      raw,
      formatted,
      formattedWithSymbol,
      formattedWithCode,
    ];
  }
}

class LineTotalEntity extends Equatable {
  final int? raw;
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
    int? raw,
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
  List<Object?> get props {
    return [
      raw,
      formatted,
      formattedWithSymbol,
      formattedWithCode,
    ];
  }
}

class SelectedOptionsEntity extends Equatable {
  final String? groupId;
  final String? groupName;
  final String? optionId;
  final String? optionName;

  const SelectedOptionsEntity({
    this.groupId,
    this.groupName,
    this.optionId,
    this.optionName,
  });

  SelectedOptionsEntity copyWith({
    String? groupId,
    String? groupName,
    String? optionId,
    String? optionName,
  }) {
    return SelectedOptionsEntity(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      optionId: optionId ?? this.optionId,
      optionName: optionName ?? this.optionName,
    );
  }

  @override
  List<Object?> get props {
    return [
      groupId,
      groupName,
      optionId,
      optionName,
    ];
  }
}

class ImageEntity extends Equatable {
  final String? id;
  final String? url;

  const ImageEntity({
    this.id,
    this.url,
  });

  ImageEntity copyWith({
    String? id,
    String? url,
  }) {
    return ImageEntity(
      id: id ?? this.id,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      url,
    ];
  }
}

class DiscountEntity extends Equatable {
  final String? type;
  final String? code;
  final int? value;
  final AmountSavedEntity? amountSaved;

  const DiscountEntity({
    this.type,
    this.code,
    this.value,
    this.amountSaved,
  });

  DiscountEntity copyWith({
    String? type,
    String? code,
    int? value,
    AmountSavedEntity? amountSaved,
  }) {
    return DiscountEntity(
      type: type ?? this.type,
      code: code ?? this.code,
      value: value ?? this.value,
      amountSaved: amountSaved ?? this.amountSaved,
    );
  }

  @override
  List<Object?> get props {
    return [
      type,
      code,
      value,
      amountSaved,
    ];
  }
}

class AmountSavedEntity extends Equatable {
  final int? raw;
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
    int? raw,
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
  List<Object?> get props {
    return [
      raw,
      formatted,
      formattedWithSymbol,
      formattedWithCode,
    ];
  }
}

class ShippingEntity extends Equatable {
  final String? id;
  final String? name;
  final String? street;
  final String? townCity;
  final String? countyState;
  final String? postalZipCode;
  final String? country;

  const ShippingEntity({
    this.id,
    this.name,
    this.street,
    this.townCity,
    this.countyState,
    this.postalZipCode,
    this.country,
  });

  ShippingEntity copyWith({
    String? id,
    String? name,
    String? street,
    String? townCity,
    String? countyState,
    String? postalZipCode,
    String? country,
  }) {
    return ShippingEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      street: street ?? this.street,
      townCity: townCity ?? this.townCity,
      countyState: countyState ?? this.countyState,
      postalZipCode: postalZipCode ?? this.postalZipCode,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      street,
      townCity,
      countyState,
      postalZipCode,
      country,
    ];
  }
}

class TransactionsEntity extends Equatable {
  final String? id;
  final String? gateway;
  final String? gatewayTransactionId;
  final String? gatewayReference;

  const TransactionsEntity({
    this.id,
    this.gateway,
    this.gatewayTransactionId,
    this.gatewayReference,
  });

  TransactionsEntity copyWith({
    String? id,
    String? gateway,
    String? gatewayTransactionId,
    String? gatewayReference,
  }) {
    return TransactionsEntity(
      id: id ?? this.id,
      gateway: gateway ?? this.gateway,
      gatewayTransactionId: gatewayTransactionId ?? this.gatewayTransactionId,
      gatewayReference: gatewayReference ?? this.gatewayReference,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      gateway,
      gatewayTransactionId,
      gatewayReference,
    ];
  }
}

class CustomerEntity extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  const CustomerEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  CustomerEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return CustomerEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      phone,
    ];
  }
}

class ClientDetailsEntity extends Equatable {
  final String? countryCode;
  final String? countryName;
  final String? regionCode;
  final String? regionName;

  const ClientDetailsEntity({
    this.countryCode,
    this.countryName,
    this.regionCode,
    this.regionName,
  });

  ClientDetailsEntity copyWith({
    String? countryCode,
    String? countryName,
    String? regionCode,
    String? regionName,
  }) {
    return ClientDetailsEntity(
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      regionCode: regionCode ?? this.regionCode,
      regionName: regionName ?? this.regionName,
    );
  }

  @override
  List<Object?> get props {
    return [
      countryCode,
      countryName,
      regionCode,
      regionName,
    ];
  }
}

class OrderMetaEntity extends Equatable {
  final PaginationEntity? pagination;

  const OrderMetaEntity({this.pagination});

  OrderMetaEntity copyWith({
    PaginationEntity? pagination,
  }) {
    return OrderMetaEntity(
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object?> get props => [pagination];
}

class PaginationEntity extends Equatable {
  final int? total;
  final int? count;
  final int? perPage;
  final int? currentPage;
  final int? totalPages;
  final LinksEntity? links;

  const PaginationEntity({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  PaginationEntity copyWith({
    int? total,
    int? count,
    int? perPage,
    int? currentPage,
    int? totalPages,
    LinksEntity? links,
  }) {
    return PaginationEntity(
      total: total ?? this.total,
      count: count ?? this.count,
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      links: links ?? this.links,
    );
  }

  @override
  List<Object?> get props => [total, count, perPage, currentPage, totalPages, links];
}

class LinksEntity extends Equatable {
  const LinksEntity();

  @override
  List<Object?> get props => [];
}
