part of 'products_bloc.dart';

class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class GetProducts extends ProductsEvent {}

class FilterProductsByCategory extends ProductsEvent {
  final CategoryDataEntity category;

  const FilterProductsByCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class LoadMoreProducts extends ProductsEvent {}
