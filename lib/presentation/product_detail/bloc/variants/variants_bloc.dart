import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_detail_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/usecase/products_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_exception.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../../../../domain/cart/cart_details/entity/cart_entity.dart';
import '../../../../domain/cart/cart_details/usecase/cart_usecase.dart';
import '../../../../domain/home/categories/entity/category_data_entity.dart';
import '../../../../domain/home/categories/usecase/categories_usecase.dart';
import '../../../../domain/home/products/products_detail/entity/product_data_entity.dart';

part 'variants_event.dart';

part 'variants_state.dart';

class VariantsBloc extends Bloc<VariantsEvent, VariantsState> {
  final ProductsUseCase variantUseCase;
  final CategoriesUseCase categoriesUseCase;
  final CartUseCase cartUseCase;
  final SharedPreferences prefs;

  VariantsBloc({
    required this.variantUseCase,
    required this.categoriesUseCase,
    required this.cartUseCase,
    required this.prefs,
  }) : super(const VariantsState()) {
    on<FetchVariants>(_onFetchVariants);
    on<SelectColor>(_onSelectColor);
    on<SelectOption>(_onSelectOption);
    on<FetchCategories>(_onFetchCategories);
    on<ResetProductState>(_onResetProductState);
    on<AddToCart>(_onAddToCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  Future<void> _onFetchVariants(FetchVariants event, Emitter emit) async {
    emit(state.copyWith(categoriesStatus: Status.loading));
    try {
      final response = await variantUseCase.getProductDetails(event.productId);
      emit(state.copyWith(
        categoriesStatus: Status.success,
        variants: response.variantGroups,
      ));
    } catch (e) {
      emit(state.copyWith(
        categoriesStatus: Status.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onSelectColor(SelectColor event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading, isAssetLoading: true));
    try {
      final response = await variantUseCase.getProductDetails(event.productId);

      // Find the URL for the selected asset ID
      String? selectedImageUrl;
      for (var asset in response.assets ?? []) {
        if (asset.id == event.assetId) {
          selectedImageUrl = asset.url;
          break;
        }
      }

      // Update the state with the selected image URL
      emit(state.copyWith(
        selectedColor: event.optionId,
        selectedImageUrl: selectedImageUrl,
        status: Status.success,
        isAssetLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.failure,
        errorMessage: e.toString(),
        isAssetLoading: false,
      ));
    }
  }

  void _onSelectOption(SelectOption event, Emitter emit) {
    final updatedOptions = Map<String, String>.from(state.selectedOptions);
    updatedOptions[event.variantGroupId] = event.optionId;

    emit(state.copyWith(
      selectedOptions: updatedOptions,
    ));
  }

  Future<void> _onFetchCategories(FetchCategories event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await categoriesUseCase.getCategories();
      final productCategoryIds = event.product.categories?.map((c) => c.id).toList() ?? [];
      final productCategories = response.data?.where((category) => productCategoryIds.contains(category.id)).toList();

      emit(state.copyWith(
        status: Status.success,
        categories: productCategories,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<VariantsState> emit) async {
    emit(state.copyWith(status: Status.loading, isCartLoading: true, isAddingToCart: true));
    try {
      String? cartId = prefs.getString('cart_id');

      if (cartId == null || cartId.isEmpty) {
        final cart = await cartUseCase.createCart();
        cartId = cart.id ?? '';
        prefs.setString('cart_id', cartId);
      }

      final cartItem = CartItemEntity(
        productId: event.productId,
        quantity: event.quantity,
        selectedOptions: state.selectedOptions.entries
            .map((entry) => SelectedOptionsEntity(groupId: entry.key, optionId: entry.value))
            .toList(),
      );

      await cartUseCase.addToCart(cartId, cartItem);
      emit(state.copyWith(status: Status.success, isCartLoading: false, isAddingToCart: false));
    } on MyDioException catch (e) {
      emit(state.copyWith(
          status: Status.failure, isCartLoading: false, isAddingToCart: false, errorMessage: e.toString()));
    }
  }

  void _onIncreaseQuantity(IncreaseQuantity event, Emitter emit) {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter emit) {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void _onResetProductState(ResetProductState event, Emitter<VariantsState> emit) {
    emit(const VariantsState(
      status: Status.initial,
      variants: null,
      selectedOptions: {},
      selectedColor: null,
      selectedImageUrl: null,
      categories: null,
      quantity: 1,
    ));
  }
}
