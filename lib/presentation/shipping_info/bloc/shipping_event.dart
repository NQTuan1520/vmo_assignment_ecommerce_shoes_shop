part of 'shipping_bloc.dart';

class ShippingEvent extends Equatable {
  const ShippingEvent();

  @override
  List<Object?> get props => [];
}

class FetchShippingInfoEvent extends ShippingEvent {}

class UpdateShippingInfoEvent extends ShippingEvent {
  final String name;
  final String street;
  final String city;
  final String state;
  final String zip;
  final String country;
  final String phone;
  final String email;

  const UpdateShippingInfoEvent({
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.phone,
    required this.email,
  });

  @override
  List<Object?> get props => [name, street, city, state, zip, country, phone, email];
}
