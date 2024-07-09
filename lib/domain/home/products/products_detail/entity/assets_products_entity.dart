import 'package:equatable/equatable.dart';

class AssetsProductsEntity extends Equatable {
  final String? id;
  final String? url;
  final String? fileName;

  const AssetsProductsEntity({
    this.id,
    this.url,
    this.fileName,
  });

  AssetsProductsEntity copyWith({
    String? id,
    String? url,
    String? fileName,
  }) {
    return AssetsProductsEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      fileName: fileName ?? this.fileName,
    );
  }

  @override
  List<Object?> get props => [id, url, fileName];
}
