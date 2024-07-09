part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final Status status;
  final List<ProductDataEntity> productsData;
  final List<ProductMetaEntity> productsMeta;
  final String? errorMessage;
  final String? selectedCategory;
  final int currentPage;
  final bool hasReachedMax;
  final int itemsPerPage;
  final List<ProductDataEntity> allProducts;

  const ProductsState({
    this.status = Status.initial,
    this.productsData = const [],
    this.productsMeta = const [],
    this.errorMessage,
    this.selectedCategory,
    this.currentPage = 0,
    this.hasReachedMax = false,
    this.itemsPerPage = 10,
    this.allProducts = const [],
  });

  ProductsState copyWith({
    Status? status,
    List<ProductDataEntity>? productsData,
    List<ProductMetaEntity>? productsMeta,
    String? errorMessage,
    String? selectedCategory,
    int? currentPage,
    bool? hasReachedMax,
    int? itemsPerPage,
    List<ProductDataEntity>? allProducts,
  }) {
    return ProductsState(
      status: status ?? this.status,
      productsData: productsData ?? this.productsData,
      productsMeta: productsMeta ?? this.productsMeta,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      allProducts: allProducts ?? this.allProducts,
    );
  }

  List<ProductDataEntity> get selectedProduct {
    if (selectedCategory == null) {
      return productsData;
    } else {
      return productsData.where((product) {
        return product.categories?.any((cat) => cat.id == selectedCategory) ?? false;
      }).toList();
    }
  }

  @override
  List<Object?> get props => [
        status,
        productsData,
        productsMeta,
        errorMessage,
        selectedCategory,
        currentPage,
        hasReachedMax,
        itemsPerPage,
        allProducts,
      ];
}
