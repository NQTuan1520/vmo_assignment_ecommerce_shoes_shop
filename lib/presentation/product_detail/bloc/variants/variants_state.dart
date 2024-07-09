part of 'variants_bloc.dart';

class VariantsState extends Equatable {
  final Status status;
  final Status categoriesStatus;
  final List<VariantGroupsEntity>? variants;
  final List<AssetsProductEntity>? assets;
  final String? selectedImageUrl;
  final String? selectedColor;
  final Map<String, String> selectedOptions;
  final bool isAssetLoading;
  final List<CategoryDataEntity>? categories;
  final String? errorMessage;
  final String cartId;
  final CartEntity? cart;
  final int quantity;
  final bool isCartLoading;
  final bool isAddingToCart;

  const VariantsState({
    this.status = Status.initial,
    this.categoriesStatus = Status.initial,
    this.variants = const [],
    this.assets,
    this.selectedImageUrl,
    this.selectedColor,
    this.selectedOptions = const {},
    this.isAssetLoading = false,
    this.categories = const [],
    this.errorMessage,
    this.cartId = '',
    this.cart,
    this.quantity = 1,
    this.isCartLoading = false,
    this.isAddingToCart = false,
  });

  VariantsState copyWith({
    Status? status,
    Status? categoriesStatus,
    List<VariantGroupsEntity>? variants,
    List<AssetsProductEntity>? assets,
    String? selectedImageUrl,
    String? selectedColor,
    Map<String, String>? selectedOptions,
    bool? isAssetLoading,
    List<CategoryDataEntity>? categories,
    String? errorMessage,
    String? cartId,
    CartEntity? cart,
    int? quantity,
    bool? isCartLoading,
    bool? isAddingToCart,
  }) {
    return VariantsState(
      status: status ?? this.status,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      variants: variants ?? this.variants,
      assets: assets ?? this.assets,
      selectedImageUrl: selectedImageUrl ?? this.selectedImageUrl,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      isAssetLoading: isAssetLoading ?? this.isAssetLoading,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
      cartId: cartId ?? this.cartId,
      cart: cart ?? this.cart,
      quantity: quantity ?? this.quantity,
      isCartLoading: isCartLoading ?? this.isCartLoading,
      isAddingToCart: isAddingToCart ?? this.isAddingToCart,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categoriesStatus,
        variants,
        assets,
        selectedImageUrl,
        selectedColor,
        selectedOptions,
        isAssetLoading,
        categories,
        errorMessage,
        cartId,
        cart,
        quantity,
        isCartLoading,
        isAddingToCart,
      ];
}
