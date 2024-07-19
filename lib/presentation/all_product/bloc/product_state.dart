part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<ProductDataEntity> productsData;
  final List<ProductDataEntity> allProducts;
  final Status status;
  final String? errorMessage;
  final int totalLoaded;

  const ProductState({
    this.productsData = const [],
    this.allProducts = const [],
    this.status = Status.initial,
    this.errorMessage,
    this.totalLoaded = 0,
  });

  ProductState copyWith({
    List<ProductDataEntity>? productsData,
    List<ProductDataEntity>? allProducts,
    Status? status,
    String? errorMessage,
    int? totalLoaded,
  }) {
    return ProductState(
      productsData: productsData ?? this.productsData,
      allProducts: allProducts ?? this.allProducts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      totalLoaded: totalLoaded ?? this.totalLoaded,
    );
  }

  @override
  List<Object?> get props => [productsData, allProducts, status, errorMessage, totalLoaded];
}
