part of 'categories_bloc.dart';

class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class GetCategories extends CategoriesEvent {}

class SelectCategory extends CategoriesEvent {
  final CategoryDataEntity category;

  const SelectCategory(this.category);

  @override
  List<Object?> get props => [category];
}
