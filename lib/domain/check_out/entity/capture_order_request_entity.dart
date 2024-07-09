import 'package:equatable/equatable.dart';

class CaptureOrderRequestEntity extends Equatable {
  final ShippingEntity? shipping;
  final CustomerEntity? customer;
  final FulfillmentEntity? fulfillment;
  final PaymentEntity? payment;
  final Map<String, LineItemsEntity>? lineItems;

  const CaptureOrderRequestEntity({
    this.shipping,
    this.customer,
    this.fulfillment,
    this.payment,
    this.lineItems,
  });

  CaptureOrderRequestEntity copyWith({
    ShippingEntity? shipping,
    CustomerEntity? customer,
    FulfillmentEntity? fulfillment,
    PaymentEntity? payment,
    Map<String, LineItemsEntity>? lineItems,
  }) {
    return CaptureOrderRequestEntity(
      shipping: shipping ?? this.shipping,
      customer: customer ?? this.customer,
      fulfillment: fulfillment ?? this.fulfillment,
      payment: payment ?? this.payment,
      lineItems: lineItems ?? this.lineItems,
    );
  }

  @override
  List<Object?> get props => [shipping, customer, fulfillment, payment, lineItems];
}

class ShippingEntity extends Equatable {
  final String? name;
  final String? street;
  final String? townCity;
  final String? countyState;
  final String? postalZipCode;
  final String? country;

  const ShippingEntity({
    this.name,
    this.street,
    this.townCity,
    this.countyState,
    this.postalZipCode,
    this.country,
  });

  ShippingEntity copyWith({
    String? name,
    String? street,
    String? townCity,
    String? countyState,
    String? postalZipCode,
    String? country,
  }) {
    return ShippingEntity(
      name: name ?? this.name,
      street: street ?? this.street,
      townCity: townCity ?? this.townCity,
      countyState: countyState ?? this.countyState,
      postalZipCode: postalZipCode ?? this.postalZipCode,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [name, street, townCity, countyState, postalZipCode, country];
}

class CustomerEntity extends Equatable {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phone;

  const CustomerEntity({
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
  });

  CustomerEntity copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
  }) {
    return CustomerEntity(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [email, firstName, lastName, phone];
}

class FulfillmentEntity extends Equatable {
  final String? shippingMethod;

  const FulfillmentEntity({
    this.shippingMethod,
  });

  FulfillmentEntity copyWith({
    String? shippingMethod,
  }) {
    return FulfillmentEntity(
      shippingMethod: shippingMethod ?? this.shippingMethod,
    );
  }

  @override
  List<Object?> get props => [shippingMethod];
}

class PaymentEntity extends Equatable {
  final String? gateway;
  final CardEntity? card;

  const PaymentEntity({
    this.gateway,
    this.card,
  });

  PaymentEntity copyWith({
    String? gateway,
    CardEntity? card,
  }) {
    return PaymentEntity(
      gateway: gateway ?? this.gateway,
      card: card ?? this.card,
    );
  }

  @override
  List<Object?> get props => [gateway, card];
}

class CardEntity extends Equatable {
  final String? number;
  final String? expiryMonth;
  final String? expiryYear;
  final String? cvc;
  final String? postalZipCode;

  const CardEntity({
    this.number,
    this.expiryMonth,
    this.expiryYear,
    this.cvc,
    this.postalZipCode,
  });

  CardEntity copyWith({
    String? number,
    String? expiryMonth,
    String? expiryYear,
    String? cvc,
    String? postalZipCode,
  }) {
    return CardEntity(
      number: number ?? this.number,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      cvc: cvc ?? this.cvc,
      postalZipCode: postalZipCode ?? this.postalZipCode,
    );
  }

  @override
  List<Object?> get props => [number, expiryMonth, expiryYear, cvc, postalZipCode];
}

class LineItemsEntity extends Equatable {
  final int? quantity;
  final Map<String, String>? variants;

  const LineItemsEntity({
    this.quantity,
    this.variants,
  });

  LineItemsEntity copyWith({
    int? quantity,
    Map<String, String>? variants,
  }) {
    return LineItemsEntity(
      quantity: quantity ?? this.quantity,
      variants: variants ?? this.variants,
    );
  }

  @override
  List<Object?> get props => [quantity, variants];
}
