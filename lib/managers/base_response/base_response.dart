import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T, M>{
  final T? data;
  final M? meta;

  BaseResponse({this.data, this.meta});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      M Function(Object? json) fromJsonM,
      ) =>
      _$BaseResponseFromJson(json, fromJsonT, fromJsonM);

  Map<String, dynamic> toJson(
      Object Function(T value) toJsonT,
      Object Function(M value) toJsonM,
      ) =>
      _$BaseResponseToJson(this, toJsonT, toJsonM);
}