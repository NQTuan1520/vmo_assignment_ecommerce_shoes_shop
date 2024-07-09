part of 'shipping_bloc.dart';

class ShippingState extends Equatable {
  final Status status;
  final Status userStatus;
  final String? name;
  final String? street;
  final String? city;
  final String? state;
  final String? zip;
  final String? country;
  final String? phone;
  final String? email;
  final String? errorMessage;

  const ShippingState({
    this.status = Status.initial,
    this.userStatus = Status.initial,
    this.name,
    this.street,
    this.city,
    this.state,
    this.zip,
    this.country,
    this.phone,
    this.email,
    this.errorMessage,
  });

  ShippingState copyWith({
    Status? status,
    Status? userStatus,
    String? name,
    String? street,
    String? city,
    String? state,
    String? zip,
    String? country,
    String? phone,
    String? email,
    String? errorMessage,
  }) {
    return ShippingState(
      status: status ?? this.status,
      userStatus: userStatus ?? this.userStatus,
      name: name ?? this.name,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      zip: zip ?? this.zip,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, userStatus, name, street, city, state, zip, country, phone, email, errorMessage];
}
