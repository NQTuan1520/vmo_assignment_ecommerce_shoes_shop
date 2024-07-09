part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final Status status;
  final List<CategoryDataEntity> categoriesData;
  final List<CategoryMetaEntity> categoriesMeta;
  final CategoryDataEntity? selectedCategory;
  final String? errorMessage;

  const CategoriesState(
      {this.status = Status.initial,
      this.categoriesData = const [],
      this.categoriesMeta = const [],
      this.selectedCategory,
      this.errorMessage});


  CategoriesState copyWith({
    Status? status,
    List<CategoryDataEntity>? categoriesData,
    List<CategoryMetaEntity>? categoriesMeta,
    CategoryDataEntity? selectedCategory,
    String? errorMessage,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      categoriesData: categoriesData ?? this.categoriesData,
      categoriesMeta: categoriesMeta ?? this.categoriesMeta,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    categoriesData,
    categoriesMeta,
    selectedCategory,
    errorMessage,
  ];
}

