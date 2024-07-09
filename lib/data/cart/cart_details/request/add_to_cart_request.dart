import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request.g.dart';

@JsonSerializable()
class AddToCartRequest {
  final String id;
  final int quantity;
  final Map<String, String>? options;

  const AddToCartRequest({
    required this.id,
    required this.quantity,
    required this.options,
  });

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) => _$AddToCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartRequestToJson(this);
}
