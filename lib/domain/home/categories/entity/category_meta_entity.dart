import 'package:equatable/equatable.dart';

class CategoryMetaEntity extends Equatable {
  final PaginationEntity? pagination;

  const CategoryMetaEntity({
    this.pagination,
  });

  @override
  List<Object?> get props => [pagination];

  CategoryMetaEntity copyWith({
    PaginationEntity? pagination,
  }) {
    return CategoryMetaEntity(
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
