import 'package:equatable/equatable.dart';

class VariantDataEntity extends Equatable {
  final String? id;
  final String? name;
  final List<VariantOptionEntity>? options;

  const VariantDataEntity({
    this.id,
    this.name,
    this.options,
  });

  VariantDataEntity copyWith({
    String? id,
    String? name,
    List<VariantOptionEntity>? options,
  }) {
    return VariantDataEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      options: options ?? this.options,
    );
  }

  @override
  List<Object?> get props => [id, name, options];
}

class VariantOptionEntity extends Equatable {
  final String? id;
  final String? name;
  final VariantPriceEntity? price;
  final List<String>? assets;

  const VariantOptionEntity({
    this.id,
    this.name,
    this.price,
    this.assets,
  });

  VariantOptionEntity copyWith({
    String? id,
    String? name,
    VariantPriceEntity? price,
    List<String>? assets,
  }) {
    return VariantOptionEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      assets: assets ?? this.assets,
    );
  }

  @override
  List<Object?> get props => [id, name, price, assets];
}

class VariantPriceEntity extends Equatable {
  final double? raw;
  final String? formatted;
  final String? formattedWithSymbol;
  final String? formattedWithCode;

  const VariantPriceEntity({
    this.raw,
    this.formatted,
    this.formattedWithSymbol,
    this.formattedWithCode,
  });

  VariantPriceEntity copyWith({
    double? raw,
    String? formatted,
    String? formattedWithSymbol,
    String? formattedWithCode,
  }) {
    return VariantPriceEntity(
      raw: raw ?? this.raw,
      formatted: formatted ?? this.formatted,
      formattedWithSymbol: formattedWithSymbol ?? this.formattedWithSymbol,
      formattedWithCode: formattedWithCode ?? this.formattedWithCode,
    );
  }

  @override
  List<Object?> get props => [raw, formatted, formattedWithSymbol, formattedWithCode];
}
