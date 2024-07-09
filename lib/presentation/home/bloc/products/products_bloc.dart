import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../../domain/home/products/products_detail/entity/product_meta_entity.dart';
import '../../../../domain/home/products/products_detail/usecase/products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsUseCase productsUseCase;

  ProductsBloc({required this.productsUseCase}) : super(const ProductsState()) {
    on<GetProducts>(_onGetProducts);
    on<FilterProductsByCategory>(_onFilterProductsByCategory);
    on<LoadMoreProducts>(_onLoadMoreProducts);
  }

  Future<void> _onGetProducts(GetProducts event, Emitter<ProductsState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final products = await productsUseCase.getProducts();
      emit(state.copyWith(status: Status.success, productsData: products.data, productsMeta: products.meta));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }

  void _onFilterProductsByCategory(FilterProductsByCategory event, Emitter<ProductsState> emit) {
    try {
      emit(state.copyWith(status: Status.loading));
      emit(state.copyWith(status: Status.success, selectedCategory: event.category.id));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onLoadMoreProducts(LoadMoreProducts event, Emitter<ProductsState> emit) async {
    if (state.hasReachedMax) return;

    try {
      final startIndex = state.currentPage * state.itemsPerPage;
      final endIndex = startIndex + state.itemsPerPage;

      if (startIndex < state.allProducts.length) {
        final moreProducts = state.allProducts.sublist(
          startIndex,
          endIndex > state.allProducts.length ? state.allProducts.length : endIndex,
        );

        emit(state.copyWith(
          productsData: List.of(state.productsData)..addAll(moreProducts),
          currentPage: state.currentPage + 1,
          hasReachedMax: moreProducts.length < state.itemsPerPage,
        ));
      } else {
        emit(state.copyWith(hasReachedMax: true));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
