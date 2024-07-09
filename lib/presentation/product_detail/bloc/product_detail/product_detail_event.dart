part of 'product_detail_bloc.dart';

class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object?> get props => [];
}

class ToggleDescriptionExpanded extends ProductDetailEvent {}
