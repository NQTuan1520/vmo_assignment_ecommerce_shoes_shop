import 'package:equatable/equatable.dart';

class DiscountDataEntity extends Equatable {
  final String? id;
  final int? created;
  final String? code;
  final String? type;
  final int? value;
  final int? expiresOn;
  final int? startsOn;
  final bool? isExpired;
  final bool? limitQuantity;
  final int? quantity;
  final String? description;
  final List<String>? meta;
  final List<String>? productIds;

  const DiscountDataEntity({
    this.id,
    this.created,
    this.code,
    this.type,
    this.value,
    this.expiresOn,
    this.startsOn,
    this.isExpired,
    this.limitQuantity,
    this.quantity,
    this.description,
    this.meta,
    this.productIds,
  });

  DiscountDataEntity copyWith({
    String? id,
    int? created,
    String? code,
    String? type,
    int? value,
    int? expiresOn,
    int? startsOn,
    bool? isExpired,
    bool? limitQuantity,
    int? quantity,
    String? description,
    List<String>? meta,
    List<String>? productIds,
  }) {
    return DiscountDataEntity(
      id: id ?? this.id,
      created: created ?? this.created,
      code: code ?? this.code,
      type: type ?? this.type,
      value: value ?? this.value,
      expiresOn: expiresOn ?? this.expiresOn,
      startsOn: startsOn ?? this.startsOn,
      isExpired: isExpired ?? this.isExpired,
      limitQuantity: limitQuantity ?? this.limitQuantity,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      meta: meta ?? this.meta,
      productIds: productIds ?? this.productIds,
    );
  }

  @override
  List<Object?> get props => [
        id,
        created,
        code,
        type,
        value,
        expiresOn,
        startsOn,
        isExpired,
        limitQuantity,
        quantity,
        description,
        meta,
        productIds,
      ];
}

class DiscountMetaEntity extends Equatable {
  final PaginationEntity? pagination;

  const DiscountMetaEntity({
    this.pagination,
  });

  @override
  List<Object?> get props => [pagination];

  DiscountMetaEntity copyWith({
    PaginationEntity? pagination,
  }) {
    return DiscountMetaEntity(
      pagination: pagination ?? this.pagination,
    );
  }
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
